program AllFax;

uses
  Forms,
  AllFaxStatus in '..\AllFaxStatus.pas' {frmAllFaxStatus};

{$R *.RES}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'Worktops Fax Manager';
  Application.MainFormOnTaskBar := True;
  Application.CreateForm(TfrmAllFaxStatus, frmAllFaxStatus);
  Application.Run;
end.
