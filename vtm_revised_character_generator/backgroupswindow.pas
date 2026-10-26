unit BackGroupsWindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Descriptions, CharacterData;

type

  { TVTMBiography }

  TVTMBiography = class(TForm)
    Button1: TButton;
    CheckGroup1: TCheckGroup;
    Label1: TLabel;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure CheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    function Biblio: BackGrAndDisc;
  public
    property PlayerBiblio: BackGrAndDisc read Biblio;
  end;

function GetBiblio(More: boolean = False): BackGrAndDisc;

var
  VTMBiography: TVTMBiography;
  i, power: integer;

implementation

function GetBiblio(More: boolean = False): BackGrAndDisc;
begin
  with TVTMBiography.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    power := 1;
    TreeView1.FullCollapse;
    if More = True then for i := 0 to CheckGroup1.Items.Count - 1 do
        CheckGroup1.Items.Add('');
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := PlayerBiblio
    // возвращаем изменённое значение.
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;
{$R *.lfm}

{ TVTMBiography }

function TVTMBiography.Biblio: BackGrAndDisc;
begin
  with Result do
  begin
    Name := Label1.Caption;
    Rating := power;
  end;
end;

procedure TVTMBiography.CheckGroup1ItemClick(Sender: TObject; Index: integer);
begin
  for i := 0 to (Sender as TCheckGroup).Items.Count - 1 do
    if i > Index then (Sender as TCheckGroup).Checked[i] := False
    else
      (Sender as TCheckGroup).Checked[i] := True;
  power := Index + 1;
end;

procedure TVTMBiography.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node.Parent = nil then
    Label1.Caption := ''
  else
  begin
    Label1.Caption := Node.Text;
  end;
  GetMemoText(Memo1, Label1.Caption);
end;

procedure TVTMBiography.Button1Click(Sender: TObject);
begin
  if Label1.Caption <> '' then ModalResult := mrOk
  else
    ShowMessage('Выберите деталь биографии.');
end;

end.
