program AllFax;

uses
  Forms,
  AllFaxStatus in 'AllFaxStatus.pas' {frmAllFaxStatus};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Worktops Fax Manager';
  Application.CreateForm(TfrmAllFaxStatus, frmAllFaxStatus);
  Application.Run;
end.
