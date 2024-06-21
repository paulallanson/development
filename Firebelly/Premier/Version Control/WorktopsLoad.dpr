program WorktopsLoad;

uses
  Forms,
  WorktopsVers in 'WorktopsVers.pas' {frmWorktopsVers},
  AllCommon in '..\..\AllCommon.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Firebelly Worktop Management System';
  Application.MainFormOnTaskBar := True;
  Application.CreateForm(TfrmWorktopsVers, frmWorktopsVers);
  Application.Run;
end.
