program CSMain;

uses
  Forms,
  CSStdUnits in 'CCSCommon\CSStdUnits.pas' {Form1},
  CSLUCust in 'CCSCommon\CSLUCust.pas' {CSLUCustFrm},
  CSMaintCust in 'CCSCommon\CSMaintCust.pas' {CSMaintCustFrm},
  CSDBMemo in 'CSDBMemo.pas' {CSDBMemoFrm},
  CSNarrativeDM in 'CSNarrativeDM.pas' {dmNarrative: TDataModule},
  CSLUBranch in 'CSLUBranch.pas' {CSLUBranchFrm},
  CSMaintBranch in 'CSMaintBranch.pas' {CSMaintBranchFrm},
  CSImages in 'CSImages.pas' {CSImagesFrm},
  CSDelivNotes in 'CSDelivNotes.pas' {CSDelivNotesFrm},
  CSLUCConta in 'CSLUCConta.pas' {CSLUCContaFrm},
  CSMaintCConta in 'CSMaintCConta.pas' {CSMaintCContaFrm},
  CSMaintGroups in 'CSMaintGroups.pas' {CSMaintGroupsFrm},
  CSMaintGroupsDets in 'CSMaintGroupsDets.pas' {CSMaintGroupsDetsFrm},
  CSGroupsDM in 'CSGroupsDM.pas' {dmGroups: TDataModule},
  CSLUCRep in 'CSLUCRep.pas' {CSLUCRepFrm},
  CSMaintCRep in 'CSMaintCRep.pas' {CSMaintCRepFrm},
  CSLUVATCode in 'CSLUVATCode.pas' {CSLUVATCodeFrm},
  CSLUSupp in 'CSLUSupp.pas' {CSLUSuppFrm},
  CSMaintSupBrch in 'CSMaintSupBrch.pas' {CSMaintSupBrchFrm},
  CSMaintSupCap in 'CSMaintSupCap.pas' {CSMaintSupCapFrm},
  CSCommon in 'CSCommon.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCSImagesFrm, CSImagesFrm);
  Application.Run;
end.
