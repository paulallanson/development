program BrokerLoad05;

uses
  Forms,
  CCSCommon in '..\..\..\CCSCOMMOND7\CCSCommon.pas',
  BrokerVers in 'BrokerVers.pas' {BrokerVersFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
