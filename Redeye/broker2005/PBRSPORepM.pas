(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Margins Report Selection form.

VSS Info:
$Header: /PBL D5/PBRSPORepM.pas 16    9/09/:3 14:46 Janiner $
$History: PBRSPORepM.pas $
 * 
 * *****************  Version 16  *****************
 * User: Janiner      Date: 9/09/:3    Time: 14:46
 * Updated in $/PBL D5
 * Allow the facility to show only cancelled orders if required.
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 27/03/:2   Time: 11:18
 * Updated in $/PBL D5
 * Changed to allow the excluding of Call Offs from the reports, had to
 * create constants and change the queries.
 * 
 * *****************  Version 14  *****************
 * User: Janiner      Date: 1/08/:1    Time: 14:58
 * Updated in $/PBL D5
 * Amend selection screen to include new radio button for customer branch.
 * Also if one customer is selected the look-up button, does not allow the
 * selection of a branch.
 * 
 * *****************  Version 13  *****************
 * User: Janiner      Date: 8/02/:1    Time: 16:29
 * Updated in $/PBL D5
 * Add option to include additional charges to reports.  default is no.
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 13/12/:0   Time: 14:38
 * Updated in $/PBL D5
 * Changed to provide extra sort funtionality
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
 * User: Davidn       Date: 6/10/00    Time: 16:35
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
 * User: Janiner      Date: 16/03/:0   Time: 15:39
 * Updated in $/PBL D5
 * take out setting of index no to one on all or one supplier within form
 * activate routine. As this seems to cause access violation from
 * switching from all suppliers to one supplier on the sam run.
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
unit PBRSPORepM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, PBPOObjects, Spin;

type
  TPBRSPORepMFrm = class(TForm)
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
    sort2RadioGroup: TRadioGroup;
    Panel1: TPanel;
    AddCostsCheckBox: TCheckBox;
    ExCallOffsChkBox: TCheckBox;
    ChkBxCnclld: TCheckBox;
    rdgrpInclude: TRadioGroup;
    ExJobBagsChkBox: TCheckBox;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    procedure DispCustBranch(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LUSuppButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure LUCustButtonClick(Sender: TObject);
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
  PBRSPORepMFrm: TPBRSPORepMFrm;

implementation

uses PBLUSupp, PBRPPORepM, PBRDPORep, DateSelV5, CCSPrint, PBLUCust;

{$R *.DFM}

procedure TPBRSPORepMFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '')) and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
  PreviewBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> ''))and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
end;

procedure TPBRSPORepMFrm.AllOrOneRadioGroupClick(Sender: TObject);
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

procedure TPBRSPORepMFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSPORepMFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSPORepMFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  if (RepTypeRadioGroup.ItemIndex = 0) and
     (Sort2RadioGroup.ItemIndex = 1) then
     begin
      MessageDlg('Invalid sort selection, each sort selection must be different.', mterror,
      [mbOk], 0);
      exit;
     end;

  {Setup and print the report}
  {Create the form with the report on}
  PBRPPORepMFrm := TPBRPPORepMFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPORepMFrm.PrinterSettings := PrinterSettings;
      {Create the form with the 8 SQLs on}
      PBRDPORepDataMod := TPBRDPORepDataMod.Create(Self);
      try
        PBRPPORepMFrm.Preview := Preview;
        PBRPPORepMFrm.DateFrom := DateFrom;
        PBRPPORepMFrm.DateTo := DateTo;
        PBRPPORepMFrm.Additcosts := AddCostsCheckBox.checked;
        PBRPPORepMFrm.ExcludeCallOffs := ExCallOffsChkBox.checked;
        PBRPPORepMFrm.ExcludeJobBags := ExJobBagsChkBox.checked;
        PBRPPoRepMFrm.bActive := not ChkBxCnclld.Checked;

        case rdgrpInclude.ItemIndex of
          0: PBRPPORepMFrm.OnlyInvOnCallOff := false;
          1: PBRPPORepMFrm.OnlyInvOnCallOff := true;
        end;

        if Sort2RadioGroup.ItemIndex > 0 then
          begin
          PBRPPORepMFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]) + ' + ' +
            trim(Sort2RadioGroup.Items[Sort2RadioGroup.ItemIndex]);
          end
        else
          begin
          PBRPPORepMFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]);
          end;

        PBRPPORepMFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
        PBRPPORepMFrm.SeqNo2 := Sort2RadioGroup.ItemIndex;
        if AllOrOneRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepMFrm.SupplierNo := 0;
          PBRPPORepMFrm.BranchNo := 0;
        end
        else
        begin
          PBRPPORepMFrm.SupplierNo := SelSupplier;
          PBRPPORepMFrm.BranchNo := SelBranch;
          PBRPPORepMFrm.SupplierName := SelName;
        end;
       if CustRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepMFrm.CustomerNo := 0;
          PBRPPORepMFrm.CustBranchNo := 0;
        end
        else
        begin
          PBRPPORepMFrm.CustomerNo := SelCustomer;
          PBRPPORepMFrm.CustBranchNo := SelCustBranch;
          PBRPPORepMFrm.CustomerName := SelCustName;
        end;
        if PBRPPORepMFrm.GetDetails(Self) = 0 then
        begin
          {Record count is zero - nothing to print}
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
          Exit;
        end;
        {Actually print or preview the report}
        if Preview then
          PBRPPORepMFrm.PrintPOsQuickReport.Preview
        else
          if SetupPrinter(PrinterSettings) then
            PBRPPORepMFrm.PrintPOsQuickReport.Print;
        {Free up the report form and the form with the SQLs}
      finally
        PBRDPORepDataMod.Free;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPORepMFrm.Free;
  end;
end;

procedure TPBRSPORepMFrm.FormActivate(Sender: TObject);
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

procedure TPBRSPORepMFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

function TPBRSPORepMFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSPORepMFrm.LUSuppButtonClick(Sender: TObject);
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

procedure TPBRSPORepMFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSPORepMFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSPORepMFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateFromEdit.Text = '' then
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

procedure TPBRSPORepMFrm.DateToEditExit(Sender: TObject);
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

  DateToEdit.Text := PBdatestr(NewDate);
  DateTo := NewDate;
end;



procedure TPBRSPORepMFrm.CustRadioGroupClick(Sender: TObject);
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

procedure TPBRSPORepMFrm.DispCustBranch(Sender: TObject);
begin
 {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TPBRSPORepMFrm.LUCustButtonClick(Sender: TObject);
begin
 PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.SelCode := SelCustomer;
    PBLUCustFrm.SelBranch := SelCustBranch;
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

end.

