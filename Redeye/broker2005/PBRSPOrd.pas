(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Print.

VSS Info:
$Header: /PBL D5/PBRSPOrd.pas 34    19/06/:3 11:35 Janiner $
$History: PBRSPOrd.pas $
 * 
 * *****************  Version 34  *****************
 * User: Janiner      Date: 19/06/:3   Time: 11:35
 * Updated in $/PBL D5
 * fix bug, when emailing more than one order/enquiry, was attaching the
 * order number from the first line in the grid to each email, thus the
 * subject was incorrect.
 * 
 * *****************  Version 33  *****************
 * User: Paul         Date: 6/06/:3    Time: 17:05
 * Updated in $/PBL D5
 * Changed to get the Windows temp directory
 * 
 * *****************  Version 32  *****************
 * User: Paul         Date: 22/05/03   Time: 17:13
 * Updated in $/PBL D5
 * Corrected display of Email list, wasn't showing the Contact name
 * 
 * *****************  Version 31  *****************
 * User: Andrewh      Date: 14/01/03   Time: 12:05
 * Updated in $/PBL D5
 * New Fax Drivers - Put in the call to the WaitForFaxFinish procedure in
 * PBSendFaxFrm.
 *
 * *****************  Version 30  *****************
 * User: Paul         Date: 15/11/:1   Time: 13:45
 * Updated in $/PBL D5
 * Changed to position the Purchase Order/Acknowledgement Radio Group when
 * not using Page Designer
 * 
 * *****************  Version 29  *****************
 * User: Janiner      Date: 2/10/:1    Time: 11:03
 * Updated in $/PBL D5
 * Get selection criteria right for my/all purchase orders/Acks.
 * 
 * *****************  Version 28  *****************
 * User: Janiner      Date: 2/10/:1    Time: 9:09
 * Updated in $/PBL D5
 * Iron out Hints and Warnings
 * 
 * *****************  Version 27  *****************
 * User: Janiner      Date: 19/09/:1   Time: 9:39
 * Updated in $/PBL D5
 * Selection routine got slightly carried away for faxing and e-mail !!!!!
 * fixed JR
 * 
 * *****************  Version 26  *****************
 * User: Janiner      Date: 31/07/:1   Time: 16:19
 * Updated in $/PBL D5
 * Ensure delete work file prior to creating new selection criteria.
 * 
 * *****************  Version 25  *****************
 * User: Janiner      Date: 31/07/:1   Time: 15:45
 * Updated in $/PBL D5
 * Limit no of records on look-up to 100, and re-define screens slightly.
 * 
 * *****************  Version 24  *****************
 * User: Janiner      Date: 31/07/:1   Time: 14:02
 * Updated in $/PBL D5
 * Add new routine for multi-select range
 * 
 * *****************  Version 23  *****************
 * User: Janiner      Date: 31/07/:1   Time: 11:03
 * Updated in $/PBL D5
 * Interrim check in for new range selection functionality.
 * 
 * *****************  Version 22  *****************
 * User: Paul         Date: 26/07/:1   Time: 12:02
 * Updated in $/PBL D5
 * 
 * *****************  Version 20  *****************
 * User: Paul         Date: 19/03/:1   Time: 11:10
 * Updated in $/PBL D5
 * Changed to default the Fax Number to the Contact Fax Number, if one
 * doesn't exist then use the company fax number 
 * 
 * *****************  Version 19  *****************
 * User: Paul         Date: 6/02/:1    Time: 14:20
 * Updated in $/PBL D5
 * Modifications made to add facility to Email to multiple recipients.
 * 
 * Also uses the Workstation defaults to determine the Mail Application
 * and the temporary work directory.
 * 
 * *****************  Version 18  *****************
 * User: Paul         Date: 2/02/:1    Time: 16:59
 * Updated in $/PBL D5
 * Added new Email List form and routine
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 1/02/:1    Time: 16:02
 * Updated in $/PBL D5
 * Changed to delete the temporary attachment files if E-mailing
 * 
 * *****************  Version 16  *****************
 * User: Paul         Date: 30/01/:1   Time: 17:18
 * Updated in $/PBL D5
 * Added E-mailing facility
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 25/01/:1   Time: 10:15
 * Updated in $/PBL D5
 * Changed to incorporate the Email option
 *
 * *****************  Version 14  *****************
 * User: Davidn       Date: 6/10/00    Time: 16:27
 * Updated in $/PBL D5
 * Setting form type as dialogue to prevent resizing, and removed the
 * maximise and minimise buttons.
 *
 * *****************  Version 13  *****************
 * User: Roddym       Date: 10/02/:0   Time: 12:00
 * Updated in $/PBL D5
 * Add questions and answers to Purchase Order and Acknowledgement
 * structures and letter layouts.  Add new page layout field PrintDefault
 * similar to FaxDefault.  Add new letter layout field LetterTypeDefault
 * so we can display the user's selected default on print selection forms
 * in Broker.
 *
 * *****************  Version 12  *****************
 * User: Roddym       Date: 25/01/:0   Time: 9:02
 * Updated in $/PBL D5
 * After faxing anything, set the selected printer back to default
 * otherwise anything printed thereafter still goes to fax.
 *
 * *****************  Version 11  *****************
 * User: Roddym       Date: 12/01/:0   Time: 9:13
 * Updated in $/PBL D5
 * Assorted layout fixes in enquiry, quotation, purchase order and
 * acknowledgement letters.  Fixes to faxing code where incorrect layout
 * being used.  Use operator name for contact at start of letter.  Do not
 * print slash if no rep suffix.  Print rep position after signatory.
 *
 * *****************  Version 10  *****************
 * User: Roddym       Date: 7/01/:0    Time: 17:07
 * Updated in $/PBL D5
 * Make report selections act the same when handling "old" databases and
 * internally generating letter layout data.
 *
 * *****************  Version 9  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:42
 * Updated in $/PBL D5
 * Changes for new letter printing mechanism, driven by the
 * tb_LetterLayout and tb_LetterElement tables.  New Letter object, also
 * hard-coded version to make switch transparent to Forms Technology.
 *
 * *****************  Version 8  *****************
 * User: Roddym       Date: 17/12/99   Time: 8:32
 * Updated in $/PBL D5
 * Fix bug surrounding PrintLogo.  Was confusing pagelayout property with
 * form property of same name.  Now use LayoutName instead.
 *
 * *****************  Version 7  *****************
 * User: Roddym       Date: 16/12/99   Time: 17:29
 * Updated in $/PBL D5
 * Remove PrintLogo property from databrokers, use LayoutName instead.
 *
 * *****************  Version 6  *****************
 * User: Roddym       Date: 16/12/99   Time: 16:40
 * Updated in $/PBL D5
 * Make logic to deal with preview/print/fax more consistent (a
 * preponderance of booleans was spoiling the broth).
 *
 * *****************  Version 5  *****************
 * User: Roddym       Date: 16/12/99   Time: 16:17
 * Updated in $/PBL D5
 * Use Printers.Printer.PrinterIndex in new PrinterSettings object rather than hold
 * internal local value which gets out of sync.
 *
 * *****************  Version 4  *****************
 * User: Roddym       Date: 13/12/99   Time: 16:10
 * Updated in $/PBL D5
 * Force print logo if faxing.
 *
 * *****************  Version 3  *****************
 * User: Roddym       Date: 13/12/99   Time: 14:10
 * Updated in $/PBL D5
 * Use new CCSPrinterSetup dialog.
 *
 * *****************  Version 2  *****************
 * User: Roddym       Date: 8/12/99    Time: 16:17
 * Updated in $/PBL D5
 * First conversion of Enquiry and Purchase Order fax/letters.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRSPOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, CCSDataBroker, QrExport,
  OleServer, CCSCommon, CCSPress, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPOrdFrm = class(TForm)
    MyOrAllRadioGroup: TRadioGroup;
    AllOrOneRadioGroup: TRadioGroup;
    GetPOsSQL: TFDQuery;
    GetAcksSQL: TFDQuery;
    gbLayouts: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cmbPageLayout: TComboBox;
    cmbLetterLayout: TComboBox;
    pnlButtons: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FaxBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    cbPrintLogo: TCheckBox;
    SelectionGroup: TGroupBox;
    Label1: TLabel;
    EnqLUSpeedButton: TSpeedButton;
    SelectionMemo: TMemo;
    SelectLst: TListBox;
    GetLastIntSelSQL: TFDQuery;
    DelWorkSQL: TFDQuery;
    AddWorkSQL: TFDQuery;
    AddIntSelQuery: TFDQuery;
    GetPORngSQL: TFDQuery;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure EnqLUSpeedButtonClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure FaxPOReport(Sender: TObject);
    procedure FaxAckReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure EmailPOReport(Sender: TObject);
    procedure EmailAckReport(Sender: TObject);
    procedure BuildPOFaxDetails;
    procedure BuildAckFaxDetails;
    procedure BuildPOEmailDetails;
    procedure BuildAckEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEMailArray(Sender: TObject);
    Procedure ClearEnqNoArray(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SelectionMemoKeyPress(Sender: TObject; var Key: Char);
    procedure TypeRadioGroupClick(Sender: TObject);
    procedure cbPrintLogoClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GetSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Function IncrementNo(StartStr: String): String ;
    procedure BuildSelection;
    Function GetNextIntSelCode(Sender: TObject): Integer;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure FormDeactivate(Sender: TObject);
    procedure SelectionMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPrinted: boolean;
    FActivated : Boolean;
    FFaxing : Boolean;
    FEMail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    FEmailLocation : string;
    LetterType : integer;
    Preview: Boolean;
    DisplayPrintDialog : Boolean;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure LoadCombos;
    procedure GetEmailApp;
    procedure RollThePresses(aBroker : TDataBroker);
    procedure PrintToAttachment(PrintingPress: TfrmPrintingPress);
    procedure GetDefaultPrinter;
    function GetBinSelection: integer;
    procedure SaveDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    iIntselcode: Integer;
    end;

var
  PBRSPOrdFrm: TPBRSPOrdFrm;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;
  EnqNoArray: array[1..100] of real;
  EnqArrayCount: integer;
implementation

uses
  PBSendFax, PBFaxList,
  PBDBPOrdLtr, CCSPrint, LetterDM, PDLetter, Printers,
  PBEmailList, pbMainMenu, pbDatabase, Printer.Tools;

var
  sAttachmentType: string;

{$R *.DFM}

procedure TPBRSPOrdFrm.CanPrint(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((cmbPageLayout.Text <> '') and (cmbLetterLayout.Text <> '')) and
    ((AllOrOneRadioGroup.ItemIndex = 0) or (SelectionMemo.Text <> ''));
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  FaxBitBtn.Enabled := Printable;
  EmailBitBtn.Enabled := Printable and (FEmailApplication <> '');
end;

procedure TPBRSPOrdFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    SelectionMemo.Enabled := False;
    SelectionGroup.font.Color := ClGray;
    EnqLUSpeedButton.Enabled := False;
    SelectionMemo.Text := '';
  end
  else
  begin
    SelectionMemo.Enabled := True;
    SelectionGroup.font.Color := ClBlack;
    EnqLUSpeedButton.Enabled := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSPOrdFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  DisplayPrintDialog := false;
  PrintReport(Self);
end;

procedure TPBRSPOrdFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  DisplayPrintDialog := true;
  PrintReport(Self);
end;

procedure TPBRSPOrdFrm.PrintReport(Sender: TObject);
var
  dbPOrdLtr : TdbPOrdLtr;
begin
  {Setup and print the report}
  DelIntSelCode(iIntSelCode, True);
  getselection;
  dbPOrdLtr := TdbPOrdLtr.Create(Self);
  try
    dbPOrdLtr.Preview := Preview;
    dbPOrdLtr.LayoutName := cmbPageLayout.Text;
    dbPOrdLtr.LetterName := cmbLetterLayout.Text;
    dbPordLtr.GetRngSQL := true;
    if TypeRadioGroup.itemindex = 1 then
      dbPOrdLtr.Acknowledgement := True;

    if AllOrOneRadioGroup.ItemIndex = 0 then
      dbPOrdLtr.PONumber := 0
    else
      dbPOrdLtr.PONumber := 99;
    dbPOrdLtr.OnlyMine := (MyOrAllRadioGroup.ItemIndex = 0);
    dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
    dbPOrdLtr.ByAccount := 'N';
    dbPOrdLtr.ByBranch := 'N';
    dbPordLtr.iintselcode := iintselcode;
    if (dbPOrdLtr.GetDetails = 0) then
       begin
        MessageDlg('There are no purchase orders to print', mtError, [mbAbort], 0);
        DelIntSelCode(iIntselcode, True);
        end
    else
      RollThePresses(dbPOrdLtr);
  finally
    dbPOrdLtr.Free;
  end;
end;

procedure TPBRSPOrdFrm.FaxBitBtnClick(Sender: TObject);
begin
  FFaxing := True;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearFaxArray(Self);
    FaxReport(Self);
  finally
    FFaxing := False;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSPOrdFrm.FaxReport(Sender: TObject);
begin
  DelIntSelCode(iIntSelCode, True);
  getselection;
  if TypeRadioGroup.ItemIndex = 0 then
    FaxPOReport(Self)
  else
    FaxAckReport(Self);
end;

procedure TPBRSPOrdFrm.FaxPOReport(Sender: TObject);
var
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetPOsSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Purchase_Order').asfloat := 0
    else
      ParamByName('Purchase_Order').asfloat := 99 ;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('iintselcode').AsInteger := iintselcode;
      Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no purchase orders to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildPOFaxDetails;
  {For each of the Enquiry/Customer details print a fax}
  PBFaxListFrm := TPBFaxListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      PBFaxListFrm.FaxListGrid.Cells[0, icount] := FaxArray[icount, 1];
      PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
      PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
    end;
    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Purchase Order Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Order No.';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Supplier/Branch';
    PBFaxListFrm.ShowModal;

    {If OK to the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.Acknowledgement := False;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'Y';
        dbPOrdLtr.ByBranch := 'Y';
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToFloatDef(FaxArray[irow, 1], 0, FormatSettings);
          dbPOrdLtr.Account := StrToInt(FaxArray[irow, 2]);
          dbPOrdLtr.Branch := StrToInt(FaxArray[irow, 3]);
          DisplayPrintDialog := false;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'PO: ' + floatToStr(dbPOrdLtr.PONumber) + ' to ' +  FaxArray[irow, 4], '');
          if (not FaxFound) then
            Exit;
          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;
          RollThePresses(dbPOrdLtr);
        end;
      finally
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSPOrdFrm.FaxAckReport(Sender: TObject);
var
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetAcksSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Purchase_Order').asfloat := 0
    else
      ParamByName('Purchase_Order').asfloat := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
    ParamByName('iIntselCode').AsInteger := iIntselcode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no acknowledgements to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildAckFaxDetails;
  {For each of the Enquiry/Customer details print a fax}
  PBFaxListFrm := TPBFaxListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      PBFaxListFrm.FaxListGrid.Cells[0, icount] := FaxArray[icount, 1];
      PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
      PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
    end;
    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Acknowledgement Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Order No.';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer/Branch';
    PBFaxListFrm.ShowModal;

    {If OK to the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.Acknowledgement := True;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'N';
        dbPOrdLtr.ByBranch := 'N';
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToInt(FaxArray[irow, 1]);
//          dbPOrdLtr.Account := StrToInt(FaxArray[irow, 2]);
//          dbPOrdLtr.Branch := StrToInt(FaxArray[irow, 3]);
          DisplayPrintDialog := false;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'Ack: ' + floatToStr(dbPOrdLtr.PONumber) + ' to ' + FaxArray[irow, 4], '');
          if (not FaxFound) then
            Exit;
          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;
          RollThePresses(dbPOrdLtr);
        end;
      finally
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSPOrdFrm.EmailReport(Sender: TObject);
begin
  DelIntSelCode(iIntSelCode, True);
  getselection;
  if TypeRadioGroup.ItemIndex = 0 then
    EmailPOReport(Self)
  else
    EmailAckReport(Self);
end;

procedure TPBRSPOrdFrm.EmailPOReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  {Set up the Query to determine whether there are any Purchase Orders to print}
  with GetPOsSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Purchase_Order').asfloat := 0
    else
      ParamByName('Purchase_Order').asfloat := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
    ParamByName('iIntselcode').AsInteger := iIntselCode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no purchase orders to Email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildPOEmailDetails;

  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 9];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];

      {Set up the Email Array with the Supplier/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 10];

    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Purchase Order Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.CodeType := 'S';
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.Acknowledgement := False;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'Y';
        dbPOrdLtr.ByBranch := 'Y';
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToInt(EMailArray[irow, 1]);
          dbPOrdLtr.Account := StrToInt(EmailArray[irow, 2]);
          dbPOrdLtr.Branch := StrToInt(EmailArray[irow, 3]);
          DisplayPrintDialog := false;
          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;

          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(dbPOrdLtr);

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Purchase Order Number: '+EmailArray[irow,1];
          sSalutation := EmailArray[irow,7];
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

        end;
      finally
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSPOrdFrm.EmailAckReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetAcksSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Purchase_Order').asfloat := 0
    else
      ParamByName('Purchase_Order').asfloat := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
    ParamByName('iIntSelCode').AsInteger := iIntselcode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no acknowledgements to email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildAckEmailDetails;


  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 9];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];

      {Set up the Email Array with the Supplier/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 10];

    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Acknowledgement Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.CodeType := 'C';
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.Acknowledgement := True;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'N';
        dbPOrdLtr.ByBranch := 'N';
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListgrid.Cells[3, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToInt(EmailArray[irow, 1]);
//          dbPOrdLtr.Account := StrToInt(EmailArray[irow, 2]);
//          dbPOrdLtr.Branch := StrToInt(EmailArray[irow, 3]);
          DisplayPrintDialog := false;

          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;

          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(dbPOrdLtr);

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Acknowledgement Number: '+EmailArray[irow,1];
          sSalutation := EmailArray[irow,7];
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);


        end;
      finally
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSPOrdFrm.BuildPOFaxDetails;
var
  irow: Integer;
begin
  with GetPOsSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Purchase_Order').asfloat := 0
    else
      ParamByName('Purchase_Order').asfloat := 99 ;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('iintselcode').AsInteger := iintselcode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Purchase_Order').AsString;
      FaxArray[irow, 2] := FieldByName('Supplier').AsString;
      FaxArray[irow, 3] := FieldByName('Branch_no').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Supp_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      if trim(FieldByName('Contact_Fax').AsString) = '' then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Contact_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBRSPOrdFrm.BuildAckFaxDetails;
var
  irow: Integer;
begin
  with GetAcksSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Purchase_Order').AsString;
      FaxArray[irow, 2] := FieldByName('Customer').AsString;
      FaxArray[irow, 3] := FieldByName('Branch_no').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      if trim(FieldByName('Contact_Fax').AsString) = '' then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Contact_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSPOrdFrm.BuildPOEmailDetails;
var
  irow: Integer;
begin
  with GetPOsSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Purchase_Order').asfloat := 0
    else
      ParamByName('Purchase_Order').asfloat := 99 ;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('iintselcode').AsInteger := iintselcode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Purchase_Order').AsString;
      EmailArray[irow, 2] := FieldByName('Supplier').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Supp_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBRSPOrdFrm.BuildAckEmailDetails;
var
  irow: Integer;
begin
  with GetAcksSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Purchase_Order').AsString;
      EmailArray[irow, 2] := FieldByName('Customer').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSPOrdFrm.EnqLUSpeedButtonClick(Sender: TObject);
var
TempLoop,iloop : integer;
memolines, found: boolean;
begin
(*  ClearEnqNoArray(self);
  Selectionmemo.lines.clear;
  memolines := false;
  PBLUPordFrm := TPBLUPordFrm.Create(Self);
  try
    if selectionMemo.Text <> '' then
      PBLUPordFrm.SelCode := StrToInt(selectionMemo.Text)
    else
      PBLUPordFrm.SelCode := 0;
    if MyOrAllRadioGroup.ItemIndex = 0 then
    begin
      PBLUPordFrm.iOperator := frmPBMainMenu.iOperator;
      PBLUPordFrm.Caption := PBLUPordFrm.Caption + ', Just My Orders/Acks';
    end
    else
    begin
      PBLUPordFrm.iOperator := 0;
      PBLUPordFrm.Caption := PBLUPordFrm.Caption + ', Everyone''s Orders/Acks';
    end;

    PBLUPordFrm.bAllow_Upd := False;
    PBLUPordFrm.bIs_LookUp := True;
    PBLUPordFrm.bMulti_Select := True;
    PBLUPordFrm.ShowModal;
    if not PBLUPordFrm.selected then
      exit;
    If AlloroneRadiogroup.itemindex =0 then
      begin
        PBLUPordFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUPordFrm.DetsDBGrid.SelectedRows[0]));
        selectionmemo.lines.Add(FloattoStr(PBLUPordFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purchase_Order').AsFloat));
        end
      else
      for TempLoop := 0 to (PBLUPordFrm.DetsDBGrid.SelectedRows.count -1) do
      begin
      found := false;
      PBLUPordFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUPordFrm.DetsDBGrid.SelectedRows[TempLoop]));
      for iloop := 1 to Enqarraycount do
            begin
             if PBLUPordFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purchase_Order').AsFloat =
                EnqNoArray[Iloop] then
                begin
                  found := true;
                  break;
                end;
             end;
      if not found then
        begin
            if memolines then
              selectionmemo.text := selectionmemo.text+(', ');
            MemoLines := True;
            selectionmemo.Text:= selectionmemo.text+(FloattoStr(PBLUPordFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purchase_Order').AsFloat));
            EnqArrayCount := EnqArrayCount+1;
            EnqNoArray[EnqArrayCount] :=PBLUPordFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purchase_Order').AsFloat;
        end;
    end;
  finally
    PBLUPordFrm.Free;
  end;
  CanPrint(Self);
*)
end;

procedure TPBRSPOrdFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSPOrdFrm.ClearEMailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EMailArray[icount, icount1] := '';
end;

procedure TPBRSPOrdFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSPOrdFrm.FormActivate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  ClearEnqNoArray(Self);
  if not FActivated then
  begin
    TypeRadioGroup.ItemIndex := 0;
    LetterType := ltPurchaseOrder;
    LoadCombos;
    GetEmailApp;
    DisplayPrintDialog := true;
    CanPrint(Self);
    SelectionMemo.SetFocus;
  { Check to see if we have an old or new database and adjust the
    form accordingly }
    if dmLetter.OldDatabase then
    begin
      gbLayouts.Hide;
      cbPrintLogo.Show;
      cbPrintLogo.Checked := true;
      cbPrintLogo.Checked := false;
//      ClientHeight := ClientHeight - gbLayouts.Height;
    end;
    FActivated := true;
  end;
iIntselcode := GetNextIntSelCode(Self);
end;

procedure TPBRSPOrdFrm.SelectionMemoKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBRSPOrdFrm.SelectionMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSPOrdFrm.RollThePresses(aBroker: TDataBroker);
var
  PrintingPress : TfrmPrintingPress;
  icount: integer;
begin
  PrintingPress := TfrmPrintingPress.Create(Self);
  try
    PrintingPress.DataBroker := aBroker;
    if Preview then
      PrintingPress.QuickR.Preview
    else
    begin
      if DisplayPrintDialog then
        begin
        GetDefaultPrinter;
        {Find the default printer in the list of printers }
        Printers.Printer.PrinterIndex := -1;
        for icount := 0 to pred(Printers.Printer.Printers.count) do
          begin
            if pos(DefaultPrinter,Printers.Printer.Printers[icount]) > 0 then
              Printers.Printer.PrinterIndex := icount;
          end;
        if DefaultPrinter <> '' then
          begin
            SetPrinterBin(DefaultBin);
          end;
        if SetupPrinter(aBroker.PrinterSettings) then
          begin
            PrintingPress.QuickR.Print;
            DefaultPrinter := Printers.Printer.Printers[printers.Printer.printerindex];
            DefaultBin := GetBinSelection;
            SaveDefaultPrinter;
            FPrinted := true;
          end;
        end
      else
        if FEmail then
          begin
            PrintToAttachment(PrintingPress);
          end
        else
          begin
          PrintingPress.QuickR.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
          If FFaxing then
                PBSendFaxFrm.WaitForFaxFinish(Self) ;
          end;
    end;
  finally
    Application.ProcessMessages;
    Printers.Printer.PrinterIndex := -1;
    FPrinted := false;
    PrintingPress.Free;
  end;
end;

procedure TPBRSPOrdFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
var
  fileName: string;
begin
  if TypeRadioGroup.ItemIndex = 0 then
    fileName := 'PO' + floattostr(dbPOrdLtr.PONumber) else
    fileName := 'Ack' + floattostr(dbPOrdLtr.PONumber);
  TPrinterTools.New.PrintToAttachment(PrintingPress.QuickR, FEmailAttachment, fileName, sAttachmentType);
end;

procedure TPBRSPOrdFrm.LoadCombos;
begin
  cmbPageLayout.Items.Clear;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    cmbPageLayout.Items.Add('Blank');
    cmbPageLayout.Items.Add('Preprinted');
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Purchase Order')
    else
      cmbLetterLayout.Items.Add('Acknowledgement');
    if cmbPageLayout.Items.Count > 0 then
      cmbPageLayout.ItemIndex := 0;
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbPageLayout.Items.Assign(dmLetter.GetPageLayoutList);
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
    cmbPageLayout.ItemIndex :=
      cmbPageLayout.Items.IndexOf(dmLetter.PrintDefaultLayout);
    cmbLetterLayout.ItemIndex :=
        cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));
  end;
end;

procedure TPBRSPOrdFrm.TypeRadioGroupClick(Sender: TObject);
begin
  if TypeRadioGroup.ItemIndex = 0 then
    LetterType := ltPurchaseOrder
  else
    LetterType := ltAcknowledgement;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Purchase Order')
    else
      cmbLetterLayout.Items.Add('Acknowledgement');
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
    cmbLetterLayout.ItemIndex :=
        cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));
  end;
end;

procedure TPBRSPOrdFrm.cbPrintLogoClick(Sender: TObject);
begin
  if cbPrintLogo.Checked then
    cmbPageLayout.ItemIndex := 0
  else
    cmbPageLayout.ItemIndex := 1;
end;

procedure TPBRSPOrdFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  FEMail := True;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearEMailArray(Self);
    EmailReport(Self);
  finally
    FEMail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;

end;

procedure TPBRSPOrdFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

procedure TPBRSPOrdFrm.BuildRange(sFirst, sLast: string);
begin
 	With GetPORngSQL do
    begin
    Close;
    ParamByName('From_PONum').AsFloat := StrToFloatDef(sFirst, 0, FormatSettings);
    ParamByName('To_PONum').AsFloat := StrToFloatDef(sLast, 0, FormatSettings);
    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
    Open;
    First;
    While Not EOF do
    begin
    SelectLst.Items.Add(FloatToStr(FieldByName('Purchase_Order').AsFloat));
    Next;
end;
end;
end;

procedure TPBRSPOrdFrm.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

	ilength := length(SelectionMemo.text);

 	stext := SelectionMemo.text;
  if copy(stext,ilength,1) <> ',' then
  	stext := stext + ',';

  stext := trim(stext);

  ifinish := 0;
  while pos(',',stext) > 0 do
  	begin
  		istart := ifinish + 1;
  		ifinish := pos(',',stext);
        ilength := ifinish - istart;

        {Chop out the string which is to be evaluated}
        sEvaluate := copy(stext,istart,ilength);
        sEvaluate := trim(sEvaluate);

        {Check to see if the string has a range selection}
        irange := pos('-',sEvaluate);
        inewLength := length(sEvaluate);

        if irange > 0 then
        	begin
           	{Build the list of possible values in between the range}
              sFirst := copy(sEvaluate,1,irange-1);
              sLast := copy(sEvaluate,irange+1,(iNewLength-irange));

              BuildRange(sFirst,sLast);
        		stext[ifinish] := ':';
              continue;
           end;

        {Check that the item does not already exist}
        if SelectLst.Items.IndexOf(sEvaluate) < 0 then
        	SelectLst.Items.Add(sEvaluate);

        stext[ifinish] := ':';
     end;

end;

procedure TPBRSPOrdFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
{Delete ALL entries on the workfile for the int_sel_code} ;
With DelWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
     ExecSQL ;
     end;
{Add the reserving one back in} ;
If not bTempDelCode then
     begin
     With AddWorkSQL do
          begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := '' ;
          ExecSQL ;
          end;
     end;

end;

procedure TPBRSPOrdFrm.FormDeactivate(Sender: TObject);
begin
DelIntSelCode(iIntSelCode, True);
end;

function TPBRSPOrdFrm.GetNextIntSelCode(Sender: TObject): Integer;
Var
iIntSelCode: Integer ;
begin
{Get the next int_sel_code to use} ;
With GetLastIntSelSQL do
     begin
     Close ;
     Open ;
     First;
     iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
     end;
{Reserve it on the int_sel file} ;
With AddWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
     ParamByName('Text100').AsString := '' ;
     ExecSQL ;
     end;
Result := iIntSelCode ;

end;

procedure TPBRSPOrdFrm.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	DelIntSelCode(iIntSelCode, True);
  buildselection;
  if SelectLst.Items.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
      SelectionMemo.Clear;
      SelectionMemo.SetFocus;
    end;
   for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant Invoice number}
        if SelectLst.Items[icount] = '' then continue;

       	with AddIntSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := StrToFloatDef(SelectLst.Items[icount], 0, FormatSettings);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

function TPBRSPOrdFrm.IncrementNo(StartStr: String): String;
Var StrLength, Count, Id: Integer ;
    Alphas: String[27] ;
    Numbers: String[11] ;
    CurrChar: String[1] ;
begin
Alphas := 'ABCEDFGHIJKLMNOPQRSTUVWXYZA' ;
Numbers := '01234567890' ;
{Increment a string value by 1}
StrLength := Length(StartStr) ;
For Count := StrLength downto 1 do
    begin
    CurrChar := Copy(StartStr,Count,1) ;
    Id := Pos(CurrChar,Numbers) ;
    if Id > 0 then
       begin
       StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
       IncrementNo := StartStr ;
       if Id < 10 then exit ;
       end
    else
        begin
        Id := Pos(CurrChar,Alphas) ;
        if Id > 0 then
               begin
               StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
        IncrementNo := StartStr ;
        if Id < 27 then exit ;
               end ;
        end ;
       end ;
end;

procedure TPBRSPOrdFrm.ClearEnqNoArray(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 1 to 100 do
      EnqNoArray[icount] := 0;
  EnqArrayCount := 0;
end;

procedure TPBRSPOrdFrm.GetDefaultPrinter;
var
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  if TypeRadioGroup.itemindex = 0 then
    begin
      GetPrivateProfileString('Centrereed Broker', 'Purchase Order Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      DefaultPrinter := TempArray;

      GetPrivateProfileString('Centrereed Broker', 'Purchase Order Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      sBin := TempArray;
      try
        DefaultBin := strtoint(sBin);
      except
        DefaultBin := 15;
      end;
    end
  else
    begin
      GetPrivateProfileString('Centrereed Broker', 'Acknowledgement Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      DefaultPrinter := TempArray;

      GetPrivateProfileString('Centrereed Broker', 'Acknowledgement Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      sBin := TempArray;
      try
        DefaultBin := strtoint(sBin);
      except
        DefaultBin := 15;
      end;
    end
end;

procedure TPBRSPOrdFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    if TypeRadioGroup.itemindex = 0 then
    begin
      with IniFile do
        begin
          WriteString('Centrereed Broker', 'Purchase Order Printer',DefaultPrinter);
          WriteString('Centrereed Broker', 'Purchase Order Bin',inttostr(DefaultBin));
        end
    end
    else
    begin
      with IniFile do
        begin
          WriteString('Centrereed Broker', 'Acknowledgement Printer',DefaultPrinter);
          WriteString('Centrereed Broker', 'Acknowledgement Bin',inttostr(DefaultBin));
        end
    end;
  finally
    IniFile.Free;
  end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSPOrdFrm.SetPrinterBin(BinCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printers.Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

function TPBRSPOrdFrm.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printers.Printer.GetPrinter (Device,Driver,Port,hDevMode);
  bin := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        bin := DevMode^.DMDEFAULTSOURCE;
        GlobalUnlock (hDevMode);
  end;
  result := bin;
end;

procedure TPBRSPOrdFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSPOrdFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

end.
