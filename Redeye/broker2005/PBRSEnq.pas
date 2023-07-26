(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Enquiry Print Selection form.

VSS Info:
$Header: /PBL D5/PBRSEnq.pas 26    19/06/:3 11:35 Janiner $
$History: PBRSEnq.pas $
 * 
 * *****************  Version 26  *****************
 * User: Janiner      Date: 19/06/:3   Time: 11:35
 * Updated in $/PBL D5
 * fix bug, when emailing more than one order/enquiry, was attaching the
 * order number from the first line in the grid to each email, thus the
 * subject was incorrect.
 * 
 * *****************  Version 25  *****************
 * User: Paul         Date: 6/06/:3    Time: 17:05
 * Updated in $/PBL D5
 * Changed to get the Windows temp directory
 * 
 * *****************  Version 24  *****************
 * User: Andrewh      Date: 14/01/03   Time: 12:05
 * Updated in $/PBL D5
 * New Fax Drivers - Put in the call to the WaitForFaxFinish procedure in
 * PBSendFaxFrm.
 * 
 * *****************  Version 23  *****************
 * User: Davidn       Date: 23/10/02   Time: 13:34
 * Updated in $/PBL D5
 * Stopped multiple faxing of quotes to same supplier.
 * If enquiry had 3 lines to same supplier, 3 page fax would be sent to
 * supplier 3 times.
 * Now single 3 page fax is sent instead.
 * 
 * *****************  Version 22  *****************
 * User: Janiner      Date: 10/10/:2   Time: 13:09
 * Updated in $/PBL D5
 * Allow optin to print file copy of enquiry.
 * 
 * *****************  Version 21  *****************
 * User: Janiner      Date: 19/09/:1   Time: 9:38
 * Updated in $/PBL D5
 * Problem converting po rng to e-mail. fixed JR
 * 
 * *****************  Version 20  *****************
 * User: Janiner      Date: 31/07/:1   Time: 15:45
 * Updated in $/PBL D5
 * Limit no of records on look-up to 100, and re-define screens slightly.
 * 
 * *****************  Version 19  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:13
 * Updated in $/PBL D5
 * Changed to allow selection of ranges
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 25/07/:1   Time: 10:59
 * Updated in $/PBL D5 - Prototypes
 * Set property to decide wether to use get range sql or normal get sql .
 * (i.e. are we using the range select screen or the new multi-function
 * screen where a selected po number/enquiry number is input)
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 5/07/:1    Time: 13:39
 * Created in $/PBL D5 - Prototypes
 * 
 * *****************  Version 19  *****************
 * User: Janiner      Date: 28/06/:1   Time: 12:12
 * Updated in $/PBL D5
 * Make changes to allow multi-select and range options on selection
 * screens for report purposes.
 * Ensure changes regarding PO num format and 'only' legend are
 * re-included into these versions.
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 15:24
 * Created in $/pbld5 - prototypes
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 14:25
 * Created in $/PBLD5-~1
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 12:30
 * Created in $/PBLD5 - Prototypes/PBLD5-~1
 * 
 * *****************  Version 18  *****************
 * User: Paul         Date: 19/03/:1   Time: 10:55
 * Updated in $/PBL D5
 * Corrected problem where faxes weren't being sent if not for the correct
 * operator
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 6/02/:1    Time: 14:20
 * Updated in $/PBL D5
 * Modifications made to add facility to Email to multiple recipients.
 * 
 * Also uses the Workstation defaults to determine the Mail Application
 * and the temporary work directory.
 * 
 * *****************  Version 16  *****************
 * User: Paul         Date: 2/02/:1    Time: 16:59
 * Updated in $/PBL D5
 * Added new Email List form and routine
 * 
 * *****************  Version 15  *****************
 * User: Davidn       Date: 6/10/00    Time: 15:54
 * Updated in $/PBL D5
 * Changing form type to dialogue to prevent resizing,
 * Removing hte maximise/minimise buttons.
 * 
 * *****************  Version 14  *****************
 * User: Roddym       Date: 16/03/:0   Time: 15:09
 * Updated in $/PBL D5
 * New dynamic selection screens for enquiry and purchase order lookups.
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
 * User: Roddym       Date: 7/01/:0    Time: 16:42
 * Updated in $/PBL D5
 * Changes for new letter printing mechanism, driven by the
 * tb_LetterLayout and tb_LetterElement tables.  New Letter object, also
 * hard-coded version to make switch transparent to Forms Technology.
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 21/12/99   Time: 13:58
 * Updated in $/PBL D5
 * Changed to correct selection of enquiry when specifiying All Enquiries
 * 
 * *****************  Version 9  *****************
 * User: Roddym       Date: 16/12/99   Time: 17:29
 * Updated in $/PBL D5
 * Remove PrintLogo property from databrokers, use LayoutName instead.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 16/12/99   Time: 16:40
 * Updated in $/PBL D5
 * Make logic to deal with preview/print/fax more consistent (a
 * preponderance of booleans was spoiling the broth).
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 6  *****************
 * User: Debbies      Date: 16/12/99   Time: 10:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 5  *****************
 * User: Debbies      Date: 15/12/99   Time: 17:03
 * Updated in $/PBL D5
 * Fix Enquiry selection - unable to select  'All Enquiries' due to '
 * Abort' MsgDlgBox.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 13/12/99   Time: 16:10
 * Updated in $/PBL D5
 * Force print logo if faxing.
 *
 * *****************  Version 3  *****************
 * User: Roddym       Date: 13/12/99   Time: 15:14
 * Updated in $/PBL D5
 * Don't print artwork or forms per box if no data.
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
unit PBRSEnq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, CCSDataBroker, CCSPress, QrExport,
  CCSCommon, Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSEnqFrm = class(TForm)
    MyOrAllRadioGroup: TRadioGroup;
    AllOrOneRadioGroup: TRadioGroup;
    GetEnqSQL: TFDQuery;
    GetEnqSuppSQL: TFDQuery;
    gbLayouts: TGroupBox;
    Label1: TLabel;
    cmbPageLayout: TComboBox;
    Label2: TLabel;
    cmbLetterLayout: TComboBox;
    pnlButtons: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FaxBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    SelectionGroup: TGroupBox;
    SelectionMemo: TMemo;
    Label3: TLabel;
    cbPrintLogo: TCheckBox;
    SelectLst: TListBox;
    EnqLUSpeedButton: TSpeedButton;
    GetLastIntSelSQL: TFDQuery;
    AddWorkSQL: TFDQuery;
    DelWorkSQL: TFDQuery;
    AddIntSelQuery: TFDQuery;
    CBFileCpy: TCheckBox;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure EnqLUSpeedButtonClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEmailArray(Sender: TObject);
    Procedure ClearEnqNoArray(Sender: TObject);
    procedure SelectionMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SelectionMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbPrintLogoClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure GetSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Function IncrementNo(StartStr: String): String ;
    procedure BuildSelection;
    Function GetNextIntSelCode(Sender: TObject): Integer;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CBFileCpyClick(Sender: TObject);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
  private
    FPrinted: Boolean;
    FEmail : Boolean;
    FFaxing : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    FEmailLocation : string;
    FEnquiry : integer;
    FActDone : Boolean;
    Preview: ByteBool;
    DisplayPrintDialog : Boolean;
    procedure LoadCombos;
    procedure GetEmailApp;
    procedure RollThePresses(aBroker : TDataBroker);
    procedure PrintToAttachment(PrintingPress: TfrmPrintingPress);
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    iIntSelCode: Integer;
    function PrintEnquiries(enqList: TStringList): boolean;
  end;
var
  PBRSEnqFrm: TPBRSEnqFrm;
  FaxArray: array[1..100, 1..5] of string;
  EmailArray: array[1..100, 1..11] of string;
  EnqNoArray: array[1..100] of integer;
  EnqArrayCount: integer;
implementation

uses
  PBFaxList, LetterDM, PBEmailList, PBSendFax, PBDBEnqLtr, pbMainMenu, printers,
  CCSPrint, PDLetter, pbDatabase, Printer.Tools;

var
  sAttachmentType: string;

{$R *.DFM}

procedure TPBRSEnqFrm.CanPrint(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((cmbPageLayout.Text <> '') and (cmbLetterLayout.Text <> '')) and
    ((AllOrOneRadioGroup.ItemIndex = 0) or (SelectionMemo.Text <> ''));
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  FaxBitBtn.Enabled := Printable;
  EmailBitBtn.Enabled := Printable and (FEMailApplication <> '');
end;

procedure TPBRSEnqFrm.AllOrOneRadioGroupClick(Sender: TObject);
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

procedure TPBRSEnqFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  FFaxing := false;
  DisplayPrintDialog := false;
  PrintReport(Self);
end;

procedure TPBRSEnqFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  FFaxing := false;
  DisplayPrintDialog := True;
  PrintReport(Self);
end;

procedure TPBRSEnqFrm.PrintReport(Sender: TObject);
var
  dbEnqLtr : TdbEnqLtr;
  begin
  {Setup and print the report}
  getselection;
  dbEnqLtr := TdbEnqLtr.Create(Self);
  try
    dbEnqLtr.Operator := frmpbMainMenu.iOperator;
    dbEnqLtr.Preview := Preview;
    dbEnqLtr.LayoutName := cmbPageLayout.Text;
    dbEnqLtr.LetterName := cmbLetterLayout.Text;
    dbEnqLtr.OnlyMine := (MyOrAllRadioGroup.ItemIndex = 0);
    dbenqLtr.GetRngSQL := true;
    if dbenqltr.onlyMine = false then
    dbEnqLtr.Operator := 0;

    dbEnqLtr.BySupplier := 'N';
    dbEnqLtr.ByBranch := 'N';
    dbEnqLtr.FileCopy := cbFileCpy.Checked;
    dbenqltr.iintselcode := iintselcode;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      dbEnqLtr.EnquiryNo := 0
    else
        dbEnqLtr.EnquiryNo := 99;
    if dbEnqLtr.GetDetails = 0 then
          begin
          MessageDlg('Error in retreiving details. Please check selection criteria', mtError, [mbAbort], 0);
          DelIntSelCode(iIntSelCode, True);
          end
        else
        RollThePresses(dbEnqLtr);
  finally
    dbEnqLtr.Free;
end;
end;

procedure TPBRSEnqFrm.FaxReport(Sender: TObject);
var
  dbEnqLtr : TdbEnqLtr;
  faxfound: boolean;
  icount, irow: Integer;
begin
  getselection;
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetEnqSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Enquiry').AsInteger := 0
    else
      ParamByName('Enquiry').AsInteger := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator;
    ParamByName('Supplier').AsInteger := 0;
    ParamByName('iintselcode').AsInteger := iintselcode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There is nothing to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildFaxDetails;

  {For each of the Enquiry/Supplier details print a fax}
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
    PBFaxListFrm.Caption := 'Enquiry Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Enquiry';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Supplier/Branch';
    PBFaxListFrm.ShowModal;

    {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      dbEnqLtr := TdbEnqLtr.Create(Self);
      try
//        dbEnqLtr.Operator := PBMenuMainFrm.iOperator;
        dbEnqLtr.BySupplier := 'Y';
        dbEnqLtr.ByBranch := 'Y';
        dbEnqLtr.LetterName := cmbLetterLayout.Text;
        dbEnqLtr.LayoutName := dmLetter.FaxDefaultLayout;
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbEnqLtr.EnquiryNo := StrToInt(FaxArray[irow, 1]);
          dbEnqLtr.Supplier := StrToInt(FaxArray[irow, 2]);
          dbEnqLtr.Branch := StrToInt(FaxArray[irow, 3]);
          DisplayPrintDialog := false;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'Enq: ' + IntToStr(dbEnqLtr.EnquiryNo) + ' to ' + FaxArray[irow, 4], '');
          if (not FaxFound) then
            MessageDlg('The fax driver is not installed', mtError, [mbOK], 0)
          else
            RollThePresses(dbEnqLtr);
        end;
      finally
        dbEnqLtr.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSEnqFrm.EmailReport(Sender: TObject);
var
  dbEnqLtr : TdbEnqLtr;
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  Getselection;
  with GetEnqSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Enquiry').AsInteger := 0
    else
      ParamByName('Enquiry').AsInteger := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator;
    ParamByName('Supplier').AsInteger := 0;
    ParamByName('iintselcode').AsInteger := iintselcode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There is nothing to email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the Enquiry/Supplier details print a fax}
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
      PBEmailListFrm.UseBranchAddr[icount] := (EmailArray[icount, 11] = 'Y');
    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Enquiry Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.CodeType := 'S';
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      dbEnqLtr := TdbEnqLtr.Create(Self);
      try
        dbEnqLtr.Operator := frmpbMainMenu.iOperator;
        dbEnqLtr.BySupplier := 'Y';
        dbEnqLtr.ByBranch := 'Y';
        dbEnqLtr.LetterName := cmbLetterLayout.Text;
        dbEnqLtr.LayoutName := dmLetter.FaxDefaultLayout;
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]) = '' then Continue;

          {Now email the individual enquiries to the individual suppliers}
          dbEnqLtr.EnquiryNo := StrToInt(EmailArray[irow, 1]);
          dbEnqLtr.Supplier := StrToInt(EmailArray[irow, 2]);
          dbEnqLtr.Branch := StrToInt(EmailArray[irow, 3]);
          DisplayPrintDialog := false;
          FEnquiry := dbEnqLtr.EnquiryNo;

          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(dbEnqLtr);

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Enquiry Number: '+EmailArray[irow, 1];
          sSalutation := EmailArray[irow,7];
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

        end;
      finally
        dbEnqLtr.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSEnqFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetEnqSuppSQL do
  begin
    Close;
    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator;
    ParamByName('iintselcode').AsInteger := iintselcode;

    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Enquiry').AsInteger := 0
    else
      ParamByName('Enquiry').AsInteger := 99;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Enquiry').AsString;
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

procedure TPBRSEnqFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetEnqSuppSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Enquiry').AsInteger := 0
    else
      ParamByName('Enquiry').AsInteger := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator;
    ParamByName('iintselcode').AsInteger := iintselcode;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Enquiry').AsString;
      EmailArray[irow, 2] := FieldByName('Supplier').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Supp_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;
      
      if FieldByName('Email').AsString <> '' then
      begin
        EmailArray[irow, 6] := FieldByName('Email').AsString;
        EmailArray[irow, 11] := 'N';
      end
      else
      begin
        EmailArray[irow, 6] := FieldByName('branchEmail').AsString;
        EmailArray[irow, 11] := 'Y';
      end;

      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSEnqFrm.FaxBitBtnClick(Sender: TObject);
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

procedure TPBRSEnqFrm.FormActivate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  ClearEnqNoArray(Self);
  if not FActDone then
  begin
    GetEmailApp;
    DisplayPrintDialog := true;
    CanPrint(Self);
    SelectionMemo.SetFocus;
    FActDone := true;
  end;
iIntSelCode := GetNextIntSelCode(Self) ;
end;

procedure TPBRSEnqFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      Free;
    end;

end;

procedure TPBRSEnqFrm.CancelBitBtnClick(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure TPBRSEnqFrm.EnqLUSpeedButtonClick(Sender: TObject);
var
TempLoop,iloop : integer;
memolines, found: boolean;
begin
(*  ClearEnqNoArray(self);
  Selectionmemo.lines.clear;
  memolines := false;
  PBLUEnqFrm := TPBLUEnqFrm.Create(Self);
  try
    PBLUEnqFrm.Caption := 'Look-Up Enquiries';
    if SelectionMemo.Text <> '' then
      PBLUEnqFrm.SelCode := StrToInt(SelectionMemo.Text)
    else
      PBLUEnqFrm.SelCode := 0;
    if MyOrAllRadioGroup.ItemIndex = 0 then
    begin
      PBLUEnqFrm.iOperator := PBMenuMainFrm.iOperator;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption + ', Just My Enquiries';
    end
    else
    begin
      PBLUEnqFrm.iOperator := 0;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption + ', Everyone''s Enquiries';
    end;
    if AllOrOneRadioGroup.ItemIndex < 2 then
    begin
      PBLUEnqFrm.bEnqNotPrintedOnly := True;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption + ', Un-Printed Lines Only';
    end
    else
    begin
      PBLUEnqFrm.bEnqNotPrintedOnly := False;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption +
        ', Un-Printed and Printed Lines';
    end;
    if AllOrOneRadioGroup.ItemIndex = 2 then
    begin
      PBLUEnqFrm.iFromStatus := 0;
      PBLUEnqFrm.iToStatus := 0;
    end
    else
    begin
      PBLUEnqFrm.iFromStatus := 10;
      PBLUEnqFrm.iToStatus := 25;
    end;
    PBLUEnqFrm.bIs_Lookup := True;
    PBLUEnqFrm.BMulti_Select := True;
    PBLUEnqFrm.ShowModal;
    if not PBLUEnqFrm.bselected then
      exit;
    If AlloroneRadiogroup.itemindex =0 then
      begin
        PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUEnqFrm.DetsDBGrid.SelectedRows[0]));
        selectionmemo.lines.Add(InttoStr(PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger));
        end
      else
      for TempLoop := 0 to (PBLUEnqFrm.DetsDBGrid.SelectedRows.count -1) do
      begin
      found := false;
      PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUEnqFrm.DetsDBGrid.SelectedRows[TempLoop]));
      for iloop := 1 to Enqarraycount do
            begin
             if PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger =
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
            selectionmemo.Text:= selectionmemo.text+(InttoStr(PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger));
            EnqArrayCount := EnqArrayCount+1;
            EnqNoArray[EnqArrayCount] :=PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger;
        end;
    end;
  finally
    PBLUEnqFrm.Free;
  end;
  CanPrint(Self);
*)end;

procedure TPBRSEnqFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSEnqFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TPBRSEnqFrm.SelectionMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSEnqFrm.FormShow(Sender: TObject);
begin
  SelectionMemo.SetFocus;
end;

procedure TPBRSEnqFrm.SelectionMemoKeyPress(Sender: TObject; var Key: Char);
begin
  	case Ord(key) of
  	$30..$39:;
  	Ord(','):;
  	Ord('-'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;
end;

procedure TPBRSEnqFrm.RollThePresses(aBroker: TDataBroker);
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

procedure TPBRSEnqFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
begin
  var fileName := 'ENQ' + FEnquiry.ToString;
  PrinterTools.New.PrintToAttachment(PrintingPress.QuickR, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TPBRSEnqFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
var
  i: integer;
  sLocation, sFileName: string;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

//  if FEmailLocation = '' then
//    sLocation := 'C:\Windows\temp\'
//  else
//    sLocation := FEmailLocation;

  sFileName := 'ENQ' + inttostr(FEnquiry);

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(RTFFilter);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(PDFFilter);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

procedure TPBRSEnqFrm.LoadCombos;
begin
  cmbPageLayout.Items.Clear;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    cmbPageLayout.Items.Add('Blank');
    cmbPageLayout.Items.Add('Preprinted');
    cmbLetterLayout.Items.Add('Enquiry');
    if cmbPageLayout.Items.Count > 0 then
      cmbPageLayout.ItemIndex := 0;
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbPageLayout.Items.Assign(dmLetter.GetPageLayoutList);
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(ltEnquiry));
    cmbPageLayout.ItemIndex :=
      cmbPageLayout.Items.IndexOf(dmLetter.PrintDefaultLayout);
    cmbLetterLayout.ItemIndex :=
      cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(ltEnquiry));
  end;
end;

procedure TPBRSEnqFrm.FormCreate(Sender: TObject);
begin
  LoadCombos;
  { Check to see if we have an old or new database and adjust the
    form accordingly }
  if dmLetter.OldDatabase then
  begin
    gbLayouts.Hide;
    cbPrintLogo.Show;
    cbPrintLogo.Checked := true;
    cbPrintLogo.Checked := false;
    ClientHeight := ClientHeight - gbLayouts.Height;
  end;
end;

procedure TPBRSEnqFrm.cbPrintLogoClick(Sender: TObject);
begin
  if cbPrintLogo.Checked then
    cmbPageLayout.ItemIndex := 0
  else
    cmbPageLayout.ItemIndex := 1;
end;

procedure TPBRSEnqFrm.EmailBitBtnClick(Sender: TObject);
begin
  FEmail := True;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearEmailArray(Self);
    EmailReport(Self);
  finally
    FFaxing := False;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSEnqFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

procedure TPBRSEnqFrm.ClearEnqNoArray(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 1 to 100 do
      EnqNoArray[icount] := 0;
  EnqArrayCount := 0;
  end;

procedure TPBRSEnqFrm.BuildRange(sFirst, sLast: string);
var
  sNo: string;
begin
	if sFirst > sLast then exit;

  sNo := sFirst;

  {Continue adding lines until the last in the range is reached}
	repeat
      if SelectLst.Items.IndexOf(sNo) < 0 then
        	SelectLst.Items.Add(sNo);
     sNo := incrementno(sNo);
  until sNo > sLast;
end;

procedure TPBRSEnqFrm.GetSelection;
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
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;

end;

function TPBRSEnqFrm.IncrementNo(StartStr: String): String;
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

procedure TPBRSEnqFrm.BuildSelection;
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

procedure TPBRSEnqFrm.DelIntSelCode(iTempIntSelCode: Integer;
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

function TPBRSEnqFrm.GetNextIntSelCode(Sender: TObject): Integer;
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

procedure TPBRSEnqFrm.FormDeactivate(Sender: TObject);
begin
DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSEnqFrm.CBFileCpyClick(Sender: TObject);
begin
FaxBitBtn.Enabled := (CBFileCpy.Checked = False);
EmailBitBtn.Enabled := (CBFileCpy.Checked = False);
end;

procedure TPBRSEnqFrm.GetDefaultPrinter;
var
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Enquiry Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Enquiry Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;
end;

procedure TPBRSEnqFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Enquiry Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Enquiry Bin',inttostr(DefaultBin));
      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSEnqFrm.SetPrinterBin(BinCode : integer );
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

function TPBRSEnqFrm.GetBinSelection: integer;
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

procedure TPBRSEnqFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSEnqFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

function TPBRSEnqFrm.PrintEnquiries(enqList: TStringList): boolean;
var
  inx: integer;
begin
  for inx := 0 to enqList.Count - 1 do
  begin
    SelectLst.Items.Add(enqList[inx]);
    if inx = 0 then
      SelectionMemo.Text := enqList[inx]
    else
      SelectionMemo.Text := SelectionMemo.Text + ', ' + enqList[inx];
  end;
  self.ShowModal;
  if ModalResult <> mrCancel then
    Result := true
  else
    Result := false;
end;

end.
