program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  MainWindow,
  NatureWindow,
  DisciplinesWindow,
  MeritsWindow,
  BackGroupsWindow,
  PsyhosesWindow,
  Descriptions,
  lazcontrols,
  ExtraAbilityFrame,
  CharacterData, AddDataWindow;

  {$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled:=True;
  {$PUSH}
  {$WARN 5044 OFF}
  Application.MainFormOnTaskbar := True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TVTMNature, VTMNature);
  Application.CreateForm(TVTMDisciplines, VTMDisciplines);
  Application.CreateForm(TVTMDosNed, VTMDosNed);
  Application.CreateForm(TVTMBiography, VTMBiography);
  Application.CreateForm(TPsychoses, Psychoses);
  Application.Run;
end.
