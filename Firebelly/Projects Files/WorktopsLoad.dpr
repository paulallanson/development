program WorktopsLoad;

uses
  Forms,
  WorktopsVers in '..\WorktopsVers.pas' {frmWorktopsVers},
  AllCommon in '..\AllCommon.pas';

{$R *.RES}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TfrmWorktopsVers, frmWorktopsVers);
  Application.Run;
end.
