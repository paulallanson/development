(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Margins Report Selection form.

VSS Info:
$Header: /PBL D5/PBRSSupCap.pas 2     10/09/02 12:17 Andrewh $
$History: PBRSSupCap.pas $
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 10/09/02   Time: 12:17
 * Updated in $/PBL D5
 * Complete new Supplier/Capability report.
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 9/09/02    Time: 11:51
 * Created in $/PBL D5
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
unit PBRSSupCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, PBPOObjects, Spin, CCSPrint ;

type
  TPBRSSupCapFrm = class(TForm)
    AllOrOneSuppRadioGroup: TRadioGroup;
    SupplierLabel: TLabel;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SuppEdit: TEdit;
    RepTypeRadioGroup: TRadioGroup;
    LUSuppButton: TButton;
    AllOrOnePrdGrpRadioGroup: TRadioGroup;
    PrdTypLabel: TLabel;
    PrdTypEdit: TEdit;
    LUPrdTypButton: TButton;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneSuppRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LUSuppButtonClick(Sender: TObject);
    procedure AllOrOnePrdGrpRadioGroupClick(Sender: TObject);
    procedure LUPrdTypButtonClick(Sender: TObject);
    procedure DispPrdTyp(Sender: TObject);
  private
    { Private declarations }
    Preview: ByteBool;
    DateFrom, DateTo: TDateTime;
    SelSupplier, SelBranch, SelPrdTyp: Integer;
    SelName, SelCustName, SelPrdTypName: string;
  public
    { Public declarations }
  end;

var
  PBRSSupCapFrm: TPBRSSupCapFrm;

implementation

uses DateSelV5, PBRPSupCap, PBRDPORep, PBLUSupp, PBLUCust, PBLUPrdTyp;

{$R *.DFM}

procedure TPBRSSupCapFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (((AllOrOneSuppRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '')) and ((AllOrOnePrdGrpRadioGroup.ItemIndex=0) or
    (PrdTypEdit.Text <> '')));
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled ;
end;

procedure TPBRSSupCapFrm.AllOrOneSuppRadioGroupClick(Sender: TObject);
begin
  if AllOrOneSuppRadioGroup.ItemIndex = 0 then
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

procedure TPBRSSupCapFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSSupCapFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSSupCapFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  {Create the form with the report on}
  PBRPSupCapFrm := TPBRPSupCapFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
      PBRPSupCapFrm.PrinterSettings := PrinterSettings;
      try
        PBRPSupCapFrm.Preview := Preview;
        PBRPSupCapFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
        PBRPSupCapFrm.SeqName := RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex] ;
        if AllOrOneSuppRadioGroup.ItemIndex = 0 then
        begin
          PBRPSupCapFrm.SupplierNo := 0;
          PBRPSupCapFrm.BranchNo := 0;
        end
        else
        begin
          PBRPSupCapFrm.SupplierNo := SelSupplier;
          PBRPSupCapFrm.BranchNo := SelBranch;
          PBRPSupCapFrm.SupplierName := SelName;
        end;
       if AllOrOnePrdGrpRadioGroup.ItemIndex = 0 then
        begin
          PBRPSupCapFrm.PrdTyp := 0;
        end
        else
        begin
          PBRPSupCapFrm.PrdTyp := SelPrdTyp;
          PBRPSupCapFrm.PrdTypName := SelPrdTypName;
        end;
        if PBRPSupCapFrm.GetDetails(Self) = 0 then
        begin
          {Record count is zero - nothing to print}
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
          Exit;
        end;
        {Actually print or preview the report}
        if Preview then
          PBRPSupCapFrm.SupCapQuickReport.Preview
        else
          if SetupPrinter(PrinterSettings) then
            PBRPSupCapFrm.SupCapQuickReport.Print;
        {Free up the report form and the form with the SQLs}
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPSupCapFrm.Free;
  end;
end;

procedure TPBRSSupCapFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

function TPBRSSupCapFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSupCapFrm.LUSuppButtonClick(Sender: TObject);
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

procedure TPBRSSupCapFrm.AllOrOnePrdGrpRadioGroupClick(Sender: TObject);
begin
  if AllOrOnePrdGrpRadioGroup.ItemIndex = 0 then
  begin
    PrdTypLabel.Visible := False;
    PrdTypEdit.Visible := False;
    LUPrdTypButton.Visible := False;
    PrdTypEdit.Text := '';
  end
  else
  begin
    PrdTypLabel.Visible := True;
    PrdTypEdit.Visible := True;
    LUPrdTypButton.Visible := True;
    DispPrdTyp(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSSupCapFrm.LUPrdTypButtonClick(Sender: TObject);
begin
  PBLUPrdTypfrm := TPBLUPrdTypfrm.Create(Owner);
  PBLUPrdTypfrm.bIs_Lookup := True;
  PBLUPrdTypfrm.bAllow_Upd := False;
  PBLUPrdTypfrm.Selcode := SelPrdTyp;
  PBLUPrdTypfrm.ShowModal;
  if PBLUPrdTypfrm.selected then
  begin
    SelPrdTyp := PBLUPrdTypfrm.Selcode;
    SelPrdTypName := PBLUPrdTypfrm.SelName;
    DispPrdTyp(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSSupCapFrm.DispPrdTyp(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelPrdTyp <> 0 then
    PrdTypEdit.Text := SelPrdTypName
  else
    PrdTypEdit.Text := '';
end;


end.

