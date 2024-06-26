program RedeyeLoad;

uses
  Forms,
  BrokerVers in 'BrokerVers.pas' {BrokerVersFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  Application.Title := 'Redeye Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
