unit NatureWindow;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls,
  Buttons, StdCtrls, ComCtrls, Descriptions;

type

  { TVTMNature }

  TVTMNature = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);

  private
    function Nature: string;
  public
    property GetNat: string read Nature;
  end;

function Nat: string;

var
  VTMNature: TVTMNature;

implementation

function Nat: string;
begin
  with TVTMNature.Create(Application) do
    // Создание экземпляра формы.
  try    // Установка начального значения.
    TreeView1.FullCollapse;
    ShowModal;
    // Вывод формы на экран в модальном режиме.
    if ModalResult = mrOk then
      // Если форма закрыта нажатием кнопки, подтверждающей изменения,
      Result := GetNat;
    // возвращаем изменённое значение.
  finally
    Free;
    // Уничтожение экземпляра формы и высвобождение ресурсов.
  end;
end;

{$R *.lfm}

{ TVTMNature }

function TVTMNature.Nature: string;
begin
  Result := label1.Caption;
end;

procedure TVTMNature.Button1Click(Sender: TObject);
begin
  if label1.Caption <> '' then ModalResult := mrOk;
end;

procedure TVTMNature.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node.Parent = nil then
    Label1.Caption := ''
  else
  begin
    Label1.Caption := Node.Text;
  end;
  GetMemoText(Memo1, Label1.Caption);
end;

end.
