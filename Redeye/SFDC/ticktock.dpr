program ticktock;

uses
  Forms,
  FPMainMenu in 'FPMainMenu.pas' {frmFPMainMenu},
  PBImages in '..\Broker2005\PBImages.pas' {PBImagesFrm},
  CCSCommon in '..\CCSCOMMOND7\CCSCommon.pas',
  PBDatabase in '..\Broker2005\pbDatabase.pas' {dmBroker: TDataModule},
  SFMaintJobLog in 'SFMaintJobLog.pas' {SFMaintJobLogFrm},
  SFJobBagLogDM in 'SFJobBagLogDM.pas' {dtmdlJobBagLog: TDataModule},
  SFLUJobLog in 'SFLUJobLog.pas' {SFLUJobLogFrm},
  PBSendtoExcel in '..\Broker2005\PBSendtoExcel.pas' {frmPBSendtoExcel},
  SFLUWCOperator in 'SFLUWCOperator.pas' {SFLUWCOperatorFrm},
  SFLUJobLogSearch in 'SFLUJobLogSearch.pas' {frmSFLUJobLogSearch},
  SFLUCust in 'SFLUCust.pas' {SFLUCustFrm},
  SFMaintSettings in 'SFMaintSettings.pas' {SFMaintSettingsfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Data Capture';
  Application.CreateForm(TfrmFPMainMenu, frmFPMainMenu);
  Application.CreateForm(TPBImagesFrm, PBImagesFrm);
  Application.CreateForm(TdmBroker, dmBroker);
  Application.CreateForm(TdtmdlJobBagLog, dtmdlJobBagLog);
  Application.Run;
end.
