unit PointValue;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type
  TPointValue = class(TCheckGroup)
  private
    PValue: integer;
    function GetValue: integer;
    procedure SetValue(const NewValue: integer);
  public
    property Value: integer read GetValue write SetValue;
    procedure SetIndex(const Index: integer);
    procedure Update;
  end;

procedure Register;

var
  i, j: integer;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TPointValue]);
end;

procedure TPointValue.SetIndex(const Index: integer);
begin
  PValue := 0;
  for i := 0 to (Items.Count) - 1 do
    if Index = -1 then Checked[i] := False
    else
    begin
      if (i < Index) then
        Checked[i] := True;
      if i > Index then Checked[i] := False;
      if Checked[i] = True then PValue := PValue + 1;
    end;
end;

procedure TPointValue.SetValue(const NewValue: integer);
begin
  if PValue <> NewValue then
  begin
    PValue := NewValue;
    for i := 0 to (Items.Count) - 1 do if i < PValue then Checked[i] := True
      else
        Checked[i] := False;
  end;
end;

function TPointValue.GetValue: integer;
begin
  Result := PValue;
end;

procedure TPointValue.Update;
begin
  for i := 0 to (Items.Count) - 1 do
    if (i <= Value - 1) then
      Checked[i] := True
    else
      Checked[i] := False;
  if Value >= Items.Count then Value := Items.Count;
end;

end.
