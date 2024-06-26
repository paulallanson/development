program BrokerLoad05;

uses
  Forms,
  BrokerVers in 'BrokerVers.pas' {BrokerVersFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
