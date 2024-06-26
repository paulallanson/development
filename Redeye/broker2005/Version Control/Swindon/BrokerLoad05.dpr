program BrokerLoad05;

uses
  Forms,
  BrokerVers in 'BrokerVers.pas' {BrokerVersFrm},
  PBRPCustState in '..\..\Quick Reports\Avanti\PBRPCustState.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
