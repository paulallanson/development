program BrokerLoad05;

uses
  Forms,
  BrokerVers in 'BrokerVers.pas' {BrokerVersFrm},
  CCSCommon in '..\..\..\CCSCOMMOND7\CCSCommon.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
