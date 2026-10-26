unit PsyhosesWindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Descriptions, CharacterData;

type

  { TPsychoses }

  TPsychoses = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    function Psychos: Merit;
  public
    property PsychosesPlayer: Merit read Psychos;
  end;

function GetPsychoses: Merit;

var
  Psychoses: TPsychoses;

implementation

function GetPsychoses: Merit;
begin
  with TPsychoses.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    TreeView1.FullCollapse;
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := PsychosesPlayer;
    // возвращаем изменённое значение.
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;
{$R *.lfm}

{ TPsychoses }

procedure TPsychoses.Button1Click(Sender: TObject);
begin
  if Label1.Caption <> '' then ModalResult := mrOk
  else
    ShowMessage('Выберите свойство.');
end;

procedure TPsychoses.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node.Parent = nil then
    Label1.Caption := ''
  else
  begin
    Label1.Caption := Node.Text;
  end;
  GetMemoText(Memo1, Label1.Caption);
end;

function TPsychoses.Psychos: Merit;
begin
  with Result do
  begin
    case Label1.Caption of//Модификатор сложности
      'Маниакально-депрессивный психоз',
      'Острое отвращение к крови',
      'Паранойя', 'Дезориентация (Стремительность)':
        Effect.MeritDifficultyEffect := 1;
      'Десенсибилизация', 'Впадение в детство',
      'Берсерк', 'Синестезия': Effect.MeritDifficultyEffect := 2;
      'Истерические расстройства личности',
      'Животная истерия',
      'Эмпатическая слепота (Доминирование)',
      'Бессознательное чтение мыслей (Прорицание)':
        Effect.MeritDifficultyEffect := 3;
      'Недостаточный инстинкт самосохранения (Стойкость)':
        Effect.MeritDifficultyEffect := -2;
      else
        Effect.MeritDifficultyEffect := 0;
    end;
    case Label1.Caption of//Модификатор кубов
      'Мегаломания': Effect.MeritDicepoolEffect := 1;
      'Десенсибилизация': Effect.MeritDicepoolEffect := -1;
      'Шизофрения': Effect.MeritDicepoolEffect := -3
      else
        Effect.MeritDicepoolEffect := 0;
    end;
    Effect.DaredevilRemoveOne := False;
    Effect.ExtraHealth := False;
    Rating := 0;
    MeritType := 'Психоз';
    CanBeActivated := boolean(Effect.MeritDifficultyEffect) or
      boolean(Effect.MeritDicepoolEffect);
    Name := Label1.Caption;
  end;
end;

end.
