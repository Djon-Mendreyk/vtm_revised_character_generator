unit DisciplinesWindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, ExtCtrls, StdCtrls,
  ComCtrls, Descriptions, CharacterData;

type

  { TVTMDisciplines }

  TVTMDisciplines = class(TForm)
    Button1: TButton;
    CheckGroup1: TCheckGroup;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure CheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    function Dist: BackGrAndDisc;
  public
    property PlayerDist: BackGrAndDisc read Dist;
  end;

function GetDist(More: boolean = False): BackGrAndDisc;

var
  VTMDisciplines: TVTMDisciplines;
  i, power: integer;

implementation

function GetDist(More: boolean = False): BackGrAndDisc;
begin
  with TVTMDisciplines.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    power := 1;
    TreeView1.FullCollapse;
    if More = True then for i := 0 to 4 do CheckGroup1.Items.Add('');
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := PlayerDist;
    // возвращаем изменённое значение.
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;
{$R *.lfm}

{ TVTMDisciplines }

function TVTMDisciplines.Dist: BackGrAndDisc;
begin
  with Result do
  begin
    if (TreeView1.Selected.Parent <> nil) and
      ((TreeView1.Selected.Parent.Text = 'Тауматургия') or
      (TreeView1.Selected.Parent.Text = 'Некромантия')) then
      Name := Format('%s (%s)', [TreeView1.Selected.Text, TreeView1.Selected.Parent.Text])
    else
    if (TreeView1.Selected.Parent = nil) then Name := TreeView1.Selected.Text
    else
      Name := TreeView1.Selected.Parent.Text;
    Rating := power;
  end;
end;

procedure TVTMDisciplines.CheckGroup1ItemClick(Sender: TObject; Index: integer);
begin
  for i := 0 to CheckGroup1.Items.Count - 1 do
    if i > Index then (Sender as TCheckGroup).Checked[i] := False
    else
      (Sender as TCheckGroup).Checked[i] := True;
  power := Index + 1;
end;

procedure TVTMDisciplines.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TVTMDisciplines.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  Edit1.Text := Node.Text;
  GetMemoText(Memo1, Edit1.Text);
end;

end.
