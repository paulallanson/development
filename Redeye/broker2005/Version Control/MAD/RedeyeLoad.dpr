program RedeyeLoad;

uses
  Forms,
  CCSCommon in '..\..\..\CCSCOMMOND7\CCSCommon.pas',
  BrokerVers in 'BrokerVers.pas' {BrokerVersFrm},
  Outlook12_TLB in '..\..\..\CCSCommonD7\Outlook12_TLB.pas',
  Office12_TLB in '..\..\..\CCSCommonD7\Office12_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Redeye Loader';
  Application.CreateForm(TBrokerVersFrm, BrokerVersFrm);
  Application.Run;
end.
