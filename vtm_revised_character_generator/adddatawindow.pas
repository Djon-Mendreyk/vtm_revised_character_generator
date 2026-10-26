unit AddDataWindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  ExtCtrls, CharacterData;

type

  { TExtraLine }

  TExtraLine = class(TForm)
    CheckGroup1: TCheckGroup;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private
    function TakeMerit: Merit;
    function TakeBackGrAndDisc: BackGrAndDisc;
  public
    property NewMerit: Merit read TakeMerit;
    property NewBackGrAndDisc: BackGrAndDisc read TakeBackGrAndDisc;
  end;

function GetMerit(Old: Merit): Merit;
function GetBackGrAndDisc(Old: BackGrAndDisc): BackGrAndDisc;

var
  ExtraLine: TExtraLine;

implementation

{$R *.lfm}

{ TExtraLine }

function GetMerit(Old: Merit):Merit;
begin
  with TExtraLine.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    SpinEdit2.Visible:=True;
    SpinEdit3.Visible:=True;
    CheckGroup1.Visible:=True;
    ComboBox1.Visible:=True;
    Label1.Visible:=True;
    Label2.Visible:=True;
    if Old.Name <> '' then
    begin
      Edit1.Text := Old.Name;
      SpinEdit1.Value := Old.Rating;
      Label1.Visible:=True;
      Label2.Visible:=True;
      SpinEdit2.Value:=Old.Effect.MeritDifficultyEffect;
      SpinEdit3.Value:=Old.Effect.MeritDicepoolEffect;
      CheckGroup1.Checked[0]:=Old.Effect.ExtraHealth;
      CheckGroup1.Checked[1]:=Old.Effect.DaredevilRemoveOne;
      ComboBox1.Text:=Old.MeritType;
    end;
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := NewMerit// возвращаем изменённое значение.
    else
      Result.Name := '';
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;

function GetBackGrAndDisc(Old: BackGrAndDisc):BackGrAndDisc;
begin
  with TExtraLine.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    if Old.Name <> '' then
    begin
      Edit1.Text := Old.Name;
      SpinEdit1.Value := Old.Rating;
    end;
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := NewBackGrAndDisc// возвращаем изменённое значение.
    else
      Result.Name := '';
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;

procedure TExtraLine.FormKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) and (Edit1.Text <> '') then ModalResult := mrOk;
end;

function TExtraLine.TakeMerit: Merit;
begin
  with Result do begin
  CanBeActivated:=boolean(SpinEdit2.Value) or boolean(SpinEdit3.Value) or
  CheckGroup1.Checked[1];
  Name:=Edit1.Text;
  Rating:=SpinEdit1.Value;
  MeritType:=ComboBox1.Text;
  with Effect do begin
  DaredevilRemoveOne:=CheckGroup1.Checked[1];
  ExtraHealth:=CheckGroup1.Checked[0];
  MeritDicepoolEffect:=SpinEdit3.Value;
  MeritDifficultyEffect:=SpinEdit2.Value;
  end;
  end;
end;

function TExtraLine.TakeBackGrAndDisc: BackGrAndDisc;
begin
  with Result do begin
  Name:=Edit1.Text;
  Rating:=SpinEdit1.Value;
  end;
end;

end.
