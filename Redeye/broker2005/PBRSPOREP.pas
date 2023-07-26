(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Report Selection form.

VSS Info:
$Header: /PBL D5/PBRSPORep.pas 18    9/09/:3 14:46 Janiner $
$History: PBRSPORep.pas $
 * 
 * *****************  Version 18  *****************
 * User: Janiner      Date: 9/09/:3    Time: 14:46
 * Updated in $/PBL D5
 * Allow the facility to show only cancelled orders if required.
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 27/03/:2   Time: 11:18
 * Updated in $/PBL D5
 * Changed to allow the excluding of Call Offs from the reports, had to
 * create constants and change the queries.
 * 
 * *****************  Version 16  *****************
 * User: Janiner      Date: 1/08/:1    Time: 14:58
 * Updated in $/PBL D5
 * Amend selection screen to include new radio button for customer branch.
 * Also if one customer is selected the look-up button, does not allow the
 * selection of a branch.
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 2/05/:1    Time: 13:02
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 14  *****************
 * User: Janiner      Date: 8/02/:1    Time: 16:29
 * Updated in $/PBL D5
 * Add option to include additional charges to reports.  default is no.
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 13/12/:0   Time: 14:38
 * Updated in $/PBL D5
 * Changed to provide extra sort funtionality
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 12/12/:0   Time: 13:11
 * Updated in $/PBL D5
 * Changed to allow sorting by Form Description
 * 
 * *****************  Version 11  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:30
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 10  *****************
 * User: Janiner      Date: 17/10/:0   Time: 12:56
 * Updated in $/PBL D5
 * Allow additional selection of one or all customers, in addition to
 * suppliers.
 * 
 * *****************  Version 9  *****************
 * User: Janiner      Date: 12/10/:0   Time: 12:30
 * Updated in $/PBL D5
 * Standardise on Formatdate routines to use PBDatestr from within
 * PBPOObjects, which formats the date based on the selections made in
 * control panel, regional settings, data, short date style.
 * 
 * *****************  Version 8  *****************
 * User: Davidn       Date: 6/10/00    Time: 16:34
 * Updated in $/PBL D5
 * Set the form type as dialogue to prevent resizing, removed the maximise
 * and minimise buttons.
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:12
 * Updated in $/PBL D5
 * Allow '' in date until checked in ok
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 3/10/:0    Time: 14:40
 * Updated in $/PBL D5
 * Amend format of dates to dd/mmm/yyyy and allow manual input, as well as
 * automatic look-up.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 16/03/:0   Time: 12:26
 * Updated in $/PBL D5
 * remove setting of supplier item index, on form activate, as it causes
 * access violation when selecting 'one supplier' more than once.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 3  *****************
 * User: Debbies      Date: 13/12/99   Time: 15:31
 * Updated in $/PBL D5
 * Sort print/preview 
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:31
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:43
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRSPORep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, PBPOObjects, Spin, ComCtrls,
  OleCtnrs, CCSCommon;

type
  TPBRSPORepFrm = class(TForm)
    AllOrOneRadioGroup: TRadioGroup;
    SupplierLabel: TLabel;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SuppEdit: TEdit;
    RepTypeRadioGroup: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    DateFromEdit: TEdit;
    DateToEdit: TEdit;
    LUSuppButton: TButton;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    CustRadioGroup: TRadioGroup;
    CustBranchLabel: TLabel;
    CustEdit: TEdit;
    LUCustButton: TButton;
    Sort2RadioGroup: TRadioGroup;
    Panel1: TPanel;
    exCallOffsChkBox: TCheckBox;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btbtnExcel: TBitBtn;
    ExJobBagsChkBox: TCheckBox;
    rdgrpInclude: TRadioGroup;
    AddCostsCheckBox: TCheckBox;
    ChkBxCnclld: TCheckBox;
    chkbxExcludeCosts: TCheckBox;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LUSuppButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure LUCustButtonClick(Sender: TObject);
    procedure DispCustBranch(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    Preview: ByteBool;
    DateFrom, DateTo: TDateTime;
    SelSupplier, SelBranch, SelCustomer, SelCustBranch: Integer;
    SelName, SelCustName: string;
  public
    { Public declarations }
  end;

var
  PBRSPORepFrm: TPBRSPORepFrm;

implementation

uses PBLUSupp, PBLUCust, ccsprint, PBRPPORep, PBRDPORep, DateSelV5;

{$R *.DFM}

procedure TPBRSPORepFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '')) and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
  PreviewBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> ''))and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
end;

procedure TPBRSPORepFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    SupplierLabel.Visible := False;
    SuppEdit.Visible := False;
    LUSuppButton.Visible := False;
    SuppEdit.Text := '';
  end
  else
  begin
    SupplierLabel.Visible := True;
    SuppEdit.Visible := True;
    LUSuppButton.Visible := True;
    DispSuppBranch(Self);
    end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
 end;

procedure TPBRSPORepFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSPORepFrm.PrintReport(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
  if (RepTypeRadioGroup.ItemIndex = 0) and
     (Sort2RadioGroup.ItemIndex = 1) then
     begin
      MessageDlg('Invalid sort selection, each sort selection must be different.', mterror,
      [mbOk], 0);
      exit;
     end;

  {Setup and print the report}
  {Create the report form}
  PBRPPORepFrm := TPBRPPORepFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPORepFrm.PrinterSettings := PrinterSettings;
    {Create the SQL form}
    PBRDPORepDataMod := TPBRDPORepDataMod.Create(Self);
    try
      PBRPPORepFrm.Preview := Preview;
      PBRPPORepFrm.DateFrom := DateFrom;
      PBRPPORepFrm.DateTo := DateTo;
      PBRPPORepFrm.Additcosts := AddCostsCheckBox.checked;
      PBRPPORepFrm.ExcludeCallOffs := ExCallOffsChkBox.checked;
      PBRPPORepFrm.ExcludeJobBags := ExJobBagsChkBox.checked;
      PBRPPORepFrm.ExcludeCosts := chkbxExcludeCosts.checked;

      case rdgrpInclude.ItemIndex of
        0: PBRPPORepFrm.OnlyInvOnCallOff := false;
        1: PBRPPORepFrm.OnlyInvOnCallOff := true;
      end;

      PBRPPoRepFrm.bActive := not ChkBxCnclld.Checked;

      if Sort2RadioGroup.ItemIndex > 0 then
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]) + ' + ' +
            trim(Sort2RadioGroup.Items[Sort2RadioGroup.ItemIndex]);
        end
      else
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]);
        end;

      PBRPPORepFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
      PBRPPORepFrm.SeqNo2 := Sort2RadioGroup.ItemIndex;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPPORepFrm.SupplierNo := 0;
        PBRPPORepFrm.BranchNo := 0;
      end
      else
      begin
        PBRPPORepFrm.SupplierNo := SelSupplier;
        PBRPPORepFrm.BranchNo := SelBranch;
        PBRPPORepFrm.SupplierName := SelName;
      end;
       if CustRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepFrm.CustomerNo := 0;
          PBRPPORepFrm.CustBranchNo := 0;
        end
        else
        begin
          PBRPPORepFrm.CustomerNo := SelCustomer;
          PBRPPORepFrm.CustBranchNo := SelCustBranch;
          PBRPPORepFrm.CustomerName := SelCustName;
        end;
      if PBRPPORepFrm.GetDetails(Self) = 0 then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;
      {Actually print or preview the report}
      if Preview then
        PBRPPORepFrm.PrintPOsQuickReport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPPORepFrm.PrintPOsQuickReport.Print;
    finally
      PBRDPORepDataMod.Free;
    end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPORepFrm.Free;
  end;
end;

procedure TPBRSPORepFrm.FormActivate(Sender: TObject);
begin
  if DateFromEdit.Text = '' then
  begin
    DateFrom := Date;
    DateFromEdit.Text := PBDatestr(DateFrom);
  end;
  if DateToEdit.Text = '' then
  begin
    DateTo := Date + 30;
    DateToEdit.Text := PBDatestr(DateTo);
  end;
end;

procedure TPBRSPORepFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

function TPBRSPORepFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBRSPORepFrm.LUSuppButtonClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.SelCode := SelSupplier;
    PBLUSuppFrm.SelBranch := SelBranch;
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSupplier := PBLUSuppFrm.SelCode;
      SelBranch := PBLUSuppFrm.SelBranch;
      SelName := PBLUSuppFrm.SelName;
      DispSuppBranch(Self);
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSPORepFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSPORepFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DatefromEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
end;


procedure TPBRSPORepFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
end;


procedure TPBRSPORepFrm.LUCustButtonClick(Sender: TObject);
begin
 PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.SelCode := SelCustomer;
    PBLUCustFrm.SelBranch := 0;
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bSel_Branch := False;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustomer := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustName := PBLUCustFrm.SelName;
      DispCustBranch(Self);
    end;
  finally
    PBLUCustFrm.Free;
  end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.DispCustBranch(Sender: TObject);
begin
 {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TPBRSPORepFrm.CustRadioGroupClick(Sender: TObject);
begin
if CustRadioGroup.ItemIndex = 0 then
  begin
    CustBranchLabel.Visible := False;
    CustEdit.Visible := False;
    LUCustButton.Visible := False;
    CustEdit.Text := '';
  end
  else
  begin
    CustBranchLabel.Visible := True;
    CustEdit.Visible := True;
    LUCustButton.Visible := True;
    DispCustBranch(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.btbtnExcelClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  if (RepTypeRadioGroup.ItemIndex = 0) and
     (Sort2RadioGroup.ItemIndex = 1) then
     begin
      MessageDlg('Invalid sort selection, each sort selection must be different.', mterror,
      [mbOk], 0);
      exit;
     end;

  {Setup and print the report}
  {Create the report form}
  PBRPPORepFrm := TPBRPPORepFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPORepFrm.PrinterSettings := PrinterSettings;
    
    PBRDPORepDataMod := TPBRDPORepDataMod.Create(Self);
    try
      PBRPPORepFrm.DateFrom := DateFrom;
      PBRPPORepFrm.DateTo := DateTo;
      PBRPPORepFrm.Additcosts := AddCostsCheckBox.checked;
      PBRPPORepFrm.ExcludeCallOffs := ExCallOffsChkBox.checked;
      PBRPPORepFrm.ExcludeJobBags := ExJobBagsChkBox.checked;
      PBRPPORepFrm.ExcludeCosts := chkbxExcludeCosts.checked;
      PBRPPoRepFrm.bActive := not ChkBxCnclld.Checked;

      case rdgrpInclude.ItemIndex of
        0: PBRPPORepFrm.OnlyInvOnCallOff := false;
        1: PBRPPORepFrm.OnlyInvOnCallOff := true;
      end;

      if Sort2RadioGroup.ItemIndex > 0 then
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]) + ' + ' +
            trim(Sort2RadioGroup.Items[Sort2RadioGroup.ItemIndex]);
        end
      else
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]);
        end;

      PBRPPORepFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
      PBRPPORepFrm.SeqNo2 := Sort2RadioGroup.ItemIndex;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPPORepFrm.SupplierNo := 0;
        PBRPPORepFrm.BranchNo := 0;
      end
      else
      begin
        PBRPPORepFrm.SupplierNo := SelSupplier;
        PBRPPORepFrm.BranchNo := SelBranch;
        PBRPPORepFrm.SupplierName := SelName;
      end;
       if CustRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepFrm.CustomerNo := 0;
          PBRPPORepFrm.CustBranchNo := 0;
        end
        else
        begin
          PBRPPORepFrm.CustomerNo := SelCustomer;
          PBRPPORepFrm.CustBranchNo := SelCustBranch;
          PBRPPORepFrm.CustomerName := SelCustName;
        end;

      reccount := PBRPPORepFrm.GetDetails(Self);
      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPORepFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end
      else
      begin
        {Record count is zero - nothing to print}
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;

    finally
      PBRDPORepDataMod.Free;
    end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPORepFrm.Free;
  end;

end;

end.
