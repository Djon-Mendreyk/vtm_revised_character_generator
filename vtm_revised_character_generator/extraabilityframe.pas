unit ExtraAbilityFrame;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, PointValue, ExtCtrls;

type

  { TFrame0 }

  TFrame0 = class(TFrame)
    Button1: TButton;
    CheckGroup1: TPointValue;
    ComboBox1: TComboBox;
  private
    FSkillType: string;
    function GetSkillType: string;
    function GetText: string;
    function GetValue: integer;
    procedure SetSkillType(newSkillType: string);
    procedure SetText(newText: string);
    procedure SetValue(Index: integer);
  public
    property Skillname: string read GetText write SetText;
    property Value: integer read GetValue write SetValue;
    property SkillType: string read GetSkillType write SetSkillType;
    procedure AddHint(newHint: string);
  end;

implementation

{$R *.lfm}

function TFrame0.GetValue: integer;
begin
  Result := CheckGroup1.Value;
end;

function TFrame0.GetText: string;
begin
  Result := ComboBox1.Text;
end;

function TFrame0.GetSkillType: string;
begin
  Result := FSkillType;
end;

procedure TFrame0.SetSkillType(newSkillType: string);
begin
  if FSkillType = newSkillType then Exit;
  FSkillType := newSkillType;
end;

procedure TFrame0.SetText(newText: string);
begin
  if ComboBox1.Text = newText then Exit;
  ComboBox1.Text := newText;
end;

procedure TFrame0.SetValue(Index: integer);
begin
  CheckGroup1.Value := Index;
end;

procedure TFrame0.AddHint(newHint: string);
begin
  ComboBox1.AddItem(newHint, ComboBox1);
end;

end.
