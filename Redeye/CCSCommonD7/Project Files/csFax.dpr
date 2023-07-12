program csFax;

uses
  Forms,
  CSFaxStatus in 'CSFaxStatus.pas' {frmCSFaxStatus};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Centrereed Fax Manager';
  Application.CreateForm(TfrmCSFaxStatus, frmCSFaxStatus);
  Application.Run;
end.
