(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Page and Letter Layout Designer for Broker.

VSS Info:
$Header: /PageDesigner/PageDesigner.dpr 6     30/03/:0 10:34 Roddym $
$History: PageDesigner.dpr $
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:34
 * Updated in $/PageDesigner
 * Changes to the way column widths and indents are handled.  New dialog
 * to confirm column width changes.  Propagate letter font changes to the
 * elements.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:17
 * Updated in $/PageDesigner
 * Remove redundant letter-specific printorder units from project uses
 * clause.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Updated in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:29
 * Updated in $/PageDesigner
 * New letter layout Quotation Summary allows all lines of an enquiry to
 * be printed in one letter.  Database changes.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 10/01/:0   Time: 11:27
 * Updated in $/PageDesigner
 * New feature:  generate SQL statements to create layout and element
 * entries in the database based on the internal hard coded values.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
program PageDesigner;

uses
  Forms,
  PDPageMaint in '..\PDPageMaint.pas' {PDPageMaintFrm},
  PageDM in '..\PageDM.pas' {dmPage: TDataModule},
  PBDatabase in '..\..\Broker2005\PBDatabase.pas' {dmBroker: TDataModule},
  PBLogin in '..\..\Broker2005\PBLogin.pas' {PBLoginFrm},
  PBEnvSel in '..\..\Broker2005\PBEnvSel.pas' {PBEnvSelFrm},
  PDMainMenu in '..\PDMainMenu.pas' {PDMainMenuFrm},
  PDAbout in '..\PDAbout.pas' {PDAboutFrm},
  CCSPrint in '..\..\CCSCommonD7\CCSPrint.pas',
  PDLUPage in '..\PDLUPage.pas' {PDLuPageFrm},
  PDLetterMaint in '..\PDLetterMaint.pas' {PDLetterMaintFrm},
  PDFontFrame in '..\PDFontFrame.pas' {fmFontInfo: TFrame},
  PDLetter in '..\PDLetter.pas',
  LetterDM in '..\LetterDM.pas' {dmLetter: TDataModule},
  CCSDebug in '..\..\CCSCommonD7\CCSDebug.pas',
  PDGenerateDg in '..\PDGenerateDg.pas' {PDGenerateDlg},
  CCSCommon in '..\..\CCSCommonD7\CCSCommon.pas',
  PDDragDrop in '..\PDDragDrop.pas' {frmPreview},
  PDConfirmWidth in '..\PDConfirmWidth.pas' {dlgConfirmWidth},
  PDIndentWidth in '..\PDIndentWidth.pas' {dlgIndentWidth},
  Office12_TLB in '..\..\CCSCommonD7\Office12_TLB.pas',
  Outlook12_TLB in '..\..\CCSCommonD7\Outlook12_TLB.pas',
  PBNarrativeDM in '..\..\broker2005\PBNarrativeDM.pas' {dmNarrative: TDataModule},
  PBImages in '..\..\broker2005\PBImages.pas' {PBImagesFrm};

{$R *.RES}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'Redeye Page/Letter Layout Designer';
  Application.CreateForm(TdmBroker, dmBroker);
  Application.CreateForm(TdmPage, dmPage);
  Application.CreateForm(TdmLetter, dmLetter);
  Application.CreateForm(TPDMainMenuFrm, PDMainMenuFrm);
  Application.Run;
end.
