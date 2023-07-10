program BrokerLoad05;

uses
  Forms,
  BrokerVers in '..\Broadsword\BrokerVers.pas' {BrokerVersFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
