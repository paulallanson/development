unit PBRSPurchByInv;

(**********************************************************************

Copyright (c)  Centrereed Ltd 2004

VSS Info:
$Header:  $
$History:  $
 *
***********************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, DateSelV5, PBPOObjects, OleCtnrs, CCSCommon, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPurchByInvFrm = class(TForm)
    dtsrcPurchByInv: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    rgSupplier: TRadioGroup;
    pnlSuppSearch: TPanel;
    lblSuppBran: TLabel;
    edtSupplier: TEdit;
    btnSupplier: TButton;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    dbgDetails: TDBGrid;
    lblRecordCount: TLabel;
    CancelBitBtn: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    cbValues: TComboBox;
    DateToEdit: TEdit;
    chkbxBranches: TCheckBox;
    btbtnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    qryPurchByInv: TFDQuery;
    qryPurchByInvvat: TCurrencyField;
    qryPurchByInvgoods: TCurrencyField;
    qryPurchByInvtotal_goods: TCurrencyField;
    qryPurchByInvInvoice_Date: TDateTimeField;
    qryPurchByInvSupplier_Invoice_no: TStringField;
    qryPurchByInvInvoice_or_Credit: TStringField;
    qryPurchByInvName: TStringField;
    qryPurchByInvName_1: TStringField;
    rdgrpType: TRadioGroup;
    qryDetail: TFDQuery;
    chkbxPageBreak: TCheckBox;
    chkbxIncludeQuery: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure rgSupplierClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure DateToEditChange(Sender: TObject);
    procedure DateFromEditChange(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure cbValuesChange(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure chkbxBranchesClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    SelSuppCode, SelSuppBranch : integer;
    SelSuppText : string;
    DateFrom, DateTo: TDateTime;
    SelRepCode: integer;
    SelRepText : string;
    procedure FixQuery(rep: Boolean);
    function BuildDetailQueryString(rep: Boolean): string;
    function BuildQueryString(rep: Boolean): string;
    procedure CallReport(const bPreview : Boolean);
    procedure CallDetailReport(const bPreview: Boolean);
    function Ordering(aBox: TComboBox): string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure FixDetailQuery(rep: Boolean);
    procedure ExportReport;
    procedure ExportDetailReport;
  public
    { Public declarations }
  end;

var
  PBRSPurchByInvFrm: TPBRSPurchByInvFrm;

implementation

uses PBLUSupp, PBDatabase, PBRPPurchByInv, PBRPPurchByInvDets;

{$R *.DFM}

const
  SQLCore =
  'SELECT Supplier_Invoice.Vat_Value as vat, '+
  'Supplier_Invoice.Goods_Value as goods, (Supplier_Invoice.Goods_value + Supplier_Invoice.Vat_Value) as total_goods, '+
  'Supplier_Invoice.Invoice_Date, Supplier_Invoice.Supplier_Invoice_no, '+
  'Supplier_Invoice.Invoice_or_Credit, Supplier_Branch.Name, Supplier.Name, Supplier_Branch.Account_Code, '+
  'Supplier_Invoice.Supp_Inv_Alt_Ref '+
  'FROM Supplier INNER JOIN (Supplier_Branch INNER JOIN Supplier_Invoice ON '+
  '(Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no) AND '+
  '(Supplier_Branch.Supplier = Supplier_Invoice.Supplier)) ON '+
  '(Supplier_Invoice.Supplier = Supplier.Supplier) AND '+
  '(Supplier.Supplier = Supplier_Branch.Supplier)';

  SQLCoreDetail =
  'SELECT 	Supplier_Invoice_Line.Supplier_Invoice, '+
	'Supplier_Invoice_Line.Invoice_Line_No, '+
	'Supplier_Invoice_Line.Purchase_Order, '+
	'Supplier_Invoice_Line.Line, '+
	'Supplier_Invoice_Line.Qty_Invoiced, '+
	'Supplier_Invoice_Line.Goods_Value, '+
	'Supplier_Invoice_Line.Vat_Code, '+
	'Supplier_Invoice_Line.Price_Unit, '+
	'Supplier_Invoice_Line.Job_Bag, '+
	'Supplier_Invoice_Line.Job_Bag_Line, '+
	'Supplier_Invoice_Line.Purch_Ord, '+
	'Supplier_Invoice_Line.Purch_Ord_Line_no, '+
	'Supplier_Invoice_Line.Credit_type, '+
	'Price_Unit.Price_Unit_Factor, '+
	'Price_Unit.Description as Price_Unit_Description, '+
	'Supplier_Invoice.Supplier, '+
	'Supplier_Invoice.Branch_no, '+
	'Supplier_Invoice.Invoice_Date, '+
	'Supplier_Invoice.Supplier_Invoice_no, '+
	'Supplier_Invoice.Supp_inv_Alt_ref, '+
	'Purchase_OrderLine.Suppliers_Desc, '+
	'Purchase_OrderLine.Quantity, '+
	'Purchase_OrderLine.Order_Price, '+
	'Purchase_OrderLine.Order_Unit, '+
	'Supplier.Name as Supplier_Name, '+
  'Supplier_Branch.Account_Code, '+
  'Vat_Code.Vat_Rate, '+
	'Supplier_Invoice.Supp_Invoice_Status, '+
	'Supplier_Invoice.Invoice_or_Credit, '+
	'Supp_Invoice_Status.Description, '+
	'Supplier_Invoice.Goods_Value_Diff, '+
	'Supplier_Invoice.Vat_Value_Diff, '+
	'Order_Unit.Price_Unit_Factor as Order_Unit_Factor, '+
	'Order_Unit.Description as Order_Unit_Description, '+
	'(select Name '+
	' from Customer '+
	' where customer.customer = purchase_orderline.customer) as Customer_Name, '+
	'(select sum(Amount) '+
	' from Supplier_invoice_Charge '+
	' where Supplier_invoice_Charge.Supplier_invoice = Supplier_invoice.Supplier_invoice) as Invoice_Additional_Charges, '+
	'(select sum(Amount) '+
	' from Purch_Ord_Line_Add_Chg '+
	' where Purch_Ord_Line_Add_Chg.Purchase_order = Purchase_orderLine.Purchase_Order and '+
	'	Purch_Ord_Line_Add_Chg.Line = Purchase_OrderLine.Line) as Order_Additional_Charges '+
  'FROM Price_Unit AS Order_Unit '+
	'   RIGHT JOIN (Supp_Invoice_Status '+
	'   INNER JOIN (Vat_Code '+
	'   INNER JOIN (Purchase_OrderLine '+
	'   RIGHT JOIN (Price_Unit '+
	'   INNER JOIN (Supplier '+
	'   INNER JOIN (Supplier_Branch '+
	'   INNER JOIN (Supplier_Invoice '+
	'   INNER JOIN Supplier_Invoice_Line '+
	'		ON Supplier_Invoice.Supplier_Invoice = Supplier_Invoice_Line.Supplier_Invoice) '+
	'		ON (Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no) AND (Supplier_Branch.Supplier = Supplier_Invoice.Supplier)) '+
	'		ON Supplier.Supplier = Supplier_Branch.Supplier) '+
	'		ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit) '+
	'		ON (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line.Purchase_Order)) '+
	'		ON Vat_Code.Vat_Code = Supplier_Invoice_Line.Vat_Code) '+
	'		ON Supp_Invoice_Status.Supp_Invoice_Status = Supplier_Invoice.Supp_Invoice_Status) '+
	'		ON Order_Unit.Price_Unit = Purchase_OrderLine.Order_Unit ';

procedure TPBRSPurchByInvFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 0;
  cbSort2.ItemIndex := 1;
  cbvalues.ItemIndex := 3;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.rgSupplierClick(Sender: TObject);
begin
{hide supplier selection edit box all suppliers selected and re-formulate query if anything changes}
  if (rgSupplier.ItemIndex = 0) then
  begin
    pnlSuppSearch.Visible := False;
    EdtSupplier.Text := '';
  end
  else
  begin
    pnlSuppSearch.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := False;
    PBLUSuppFrm.SelCode := SelSuppCode;
    PBLUSuppFrm.SelBranch := SelSuppBranch;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSuppCode := PBLUSuppFrm.SelCode;
      SelSuppBranch := PBLUSuppFrm.SelBranch;
      SelSuppText := PBLUSuppFrm.SelName + ' / ' + PBLUSuppFrm.SelBranchName;
    end;
    edtSupplier.Text := SelSuppText;
    FixQuery(False);
  finally
    PBLUSuppFrm.Free;
  end;
end;

procedure TPBRSPurchByInvFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;
   PBRPPurchByInvfrm := TPBRPPurchByInvfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPPurchByInvfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPPurchByInvfrm.qryPurchByInv.SQL.Clear;
        PBRPPurchByInvfrm.qryPurchByInv.SQL.Text := qryPurchByInv.Text;
        PBRPPurchByInvFrm.totalBySupp := cbsort1.itemindex = 0;
        PBRPPurchByInvFrm.repqrgroup.ForceNewPage := chkbxPageBreak.checked;
        PBRPPurchByInvfrm.qrlblTitle.caption := PBRPPurchByInvfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPPurchByInvfrm.qrlblDateRange.caption :=
        PBRPPurchByInvfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPPurchByInvfrm.qrlblDateRange.caption :=
        PBRPPurchByInvfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPPurchByInvfrm.qrlblDateRange.caption :=
          PBRPPurchByInvfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
//        PBRPPurchByInvfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
        if bPreview then
          PBRPPurchByInvfrm.qckrpPurchByInv.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPPurchByInvfrm.qckrpPurchByInv.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
      Application.ProcessMessages;
      qryPurchByInv.Open;

      qryPurchByInv.Close;
      fixquery(True);
    end;
end;

procedure TPBRSPurchByInvFrm.CallDetailReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  fixDetailquery(true);
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;
   PBRPPurchByInvDetsfrm := TPBRPPurchByInvDetsfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPPurchByInvDetsfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPPurchByInvDetsfrm.qryReport.SQL.Clear;
        PBRPPurchByInvDetsfrm.qryReport.SQL.Text := qryDetail.Text;
        PBRPPurchByInvDetsfrm.totalBySupp := cbsort1.itemindex = 0;
        PBRPPurchByInvDetsFrm.repqrgroup.ForceNewPage := chkbxPageBreak.checked;
        PBRPPurchByInvDetsfrm.qrlblTitle.caption := PBRPPurchByInvDetsfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPPurchByInvDetsfrm.qrlblDateRange.caption :=
        PBRPPurchByInvDetsfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPPurchByInvDetsfrm.qrlblDateRange.caption :=
        PBRPPurchByInvDetsfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPPurchByInvDetsfrm.qrlblDateRange.caption :=
          PBRPPurchByInvDetsfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
//        PBRPPurchByInvDetsfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
        if bPreview then
          PBRPPurchByInvDetsfrm.qrDetails.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPPurchByInvDetsfrm.qrDetails.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
      Application.ProcessMessages;
    end;
end;

function TPBRSPurchByInvFrm.BuildQueryString(rep: Boolean): string;
var
  sTemp : string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
{rebuilds the query string depending on the sort selections}
  stemp := SQLCore;

  if chkbxIncludeQuery.checked then
    sTemp := sTemp + ' WHERE Supplier_Invoice.Supp_Invoice_Status > 10 '
  else
    sTemp := sTemp + ' WHERE Supplier_Invoice.Supp_Invoice_Status > 15 ';

  sTemp := sTemp + ' AND Supplier_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Supplier_Invoice.Invoice_Date <= ' + qDate(DateTo);
  if (edtSupplier.Text <> '') then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Supplier = ' + IntToStr(SelSuppCode) + ' ';
    if not chkbxBranches.checked then
      sTemp := sTemp + ' AND Supplier_Invoice.Branch_no = ' + IntToStr(SelSuppBranch) + ' ';
  end;

  {Exclude zero values}
  if cbValues.itemindex = 0 then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Goods_Value > 0.00 ';
  end;

  {Zero values only}
  if cbValues.itemindex = 1 then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Goods_Value = 0.00 ';
  end;

  {Credit values only}
  if cbValues.itemindex = 2 then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Goods_Value < 0.00 ';
  end;

  sTemp := sTemp + ' ORDER BY ';
    if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end
  else
  begin
    if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end;
  end;
  Result := sTemp;
end;

function TPBRSPurchByInvFrm.BuildDetailQueryString(rep: Boolean): string;
var
  sTemp : string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
{rebuilds the query string depending on the sort selections}
  stemp := SQLCoreDetail;

  sTemp := sTemp + ' WHERE Supplier_Invoice.Supp_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Supplier_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Supplier_Invoice.Invoice_Date <= ' + qDate(DateTo);
  if (edtSupplier.Text <> '') then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Supplier = ' + IntToStr(SelSuppCode) + ' ';
    if not chkbxBranches.checked then
      sTemp := sTemp + ' AND Supplier_Invoice.Branch_no = ' + IntToStr(SelSuppBranch) + ' ';
  end;

  {Exclude zero values}
  if cbValues.itemindex = 0 then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Goods_Value > 0.00 ';
  end;

  {Zero values only}
  if cbValues.itemindex = 1 then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Goods_Value = 0.00 ';
  end;

  {Credit values only}
  if cbValues.itemindex = 2 then
  begin
    sTemp := sTemp + ' AND Supplier_Invoice.Goods_Value < 0.00 ';
  end;

  sTemp := sTemp + ' ORDER BY ';
    if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end
  else
  begin
    if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end;
  end;
  Result := sTemp;
end;

procedure TPBRSPurchByInvFrm.FixQuery(rep: Boolean);
begin
  qryPurchByInv.DisableControls;
  try
    qryPurchByInv.Close;
    qryPurchByInv.SQL.Clear;
    qryPurchByInv.SQL.text := BuildQueryString(rep);
    qryPurchByInv.Open;
    lblRecordCount.Caption:=IntToStr(qryPurchByInv.RecordCount);
  finally
    qryPurchByInv.EnableControls;
  end;
end;

procedure TPBRSPurchByInvFrm.FixDetailQuery(rep: Boolean);
begin
  qryDetail.DisableControls;
  try
    qryDetail.Close;
    qryDetail.SQL.Clear;
    qryDetail.SQL.text := BuildDetailQueryString(rep);
    qryDetail.Open;
  finally
    qryDetail.EnableControls;
  end;
end;

function TPBRSPurchByInvFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Supplier.Name,';
  1:   Result := ' Supplier_Invoice.Supplier_Invoice_No,';
  2:   Result := ' Supplier_Invoice.Invoice_Date,';
  else Result := '';
  end;
end;

procedure TPBRSPurchByInvFrm.cbSortChange(Sender: TObject);
begin
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  if rdgrpType.itemindex = 0 then
    CallReport(True)
  else
    CallDetailReport(true);
end;

procedure TPBRSPurchByInvFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  if rdgrpType.itemindex = 0 then
    CallReport(false)
  else
    CallDetailReport(false);
end;

procedure TPBRSPurchByInvFrm.DateToEditChange(Sender: TObject);
begin
//  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.DateFromEditChange(Sender: TObject);
begin
//  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

function TPBRSPurchByInvFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSPurchByInvFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
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
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
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
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.cbValuesChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  TempRect := Rect;
  if dtsrcPurchbyInv.dataset.fieldbyname('Invoice_or_credit').asstring = 'C' then
    (Sender as TDBGrid).Canvas.font.Color := clRed;
  if  (Column.Title.Caption <> 'Goods Value') and
      (Column.Title.Caption <> 'Vat Value') and
      (Column.Title.Caption <> 'Invoice Total')then
  	begin
  		StrPCopy(txt, Column.field.asstring);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if  (Column.Title.Caption <> 'Goods Value') and
                (Column.Title.Caption <> 'Vat Value') and
                (Column.Title.Caption <> 'Invoice Total')then
              	begin
        			Canvas.Brush.Color := Color;
        			Canvas.Font.Color  := Font.Color;
        			Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
          			Column.field.asstring);
                 end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Goods Value') or
          (Column.Title.Caption = 'Vat Value') or
          (Column.Title.Caption = 'Invoice Total') then
        try
          sValue := formatfloat('£#,###,##0.00;(£#,###,##0.00)',strtofloat(Column.field.asstring))
        except
          sValue := ''
        end
      else
        sValue := Column.field.asstring;
  		StrPCopy(Txt, sValue);

  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TPBRSPurchByInvFrm.chkbxBranchesClick(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSPurchByInvFrm.btbtnExcelClick(Sender: TObject);
begin
  if rdgrpType.itemindex = 0 then
    ExportReport
  else
    ExportDetailReport;
end;

procedure TPBRSPurchByInvFrm.ExportReport;
var
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  PBRPPurchByInvfrm := TPBRPPurchByInvfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPPurchByInvfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPPurchByInvfrm.qryPurchByInv.SQL.Clear;
        PBRPPurchByInvfrm.qryPurchByInv.SQL.Text := qryPurchByInv.Text;
        PBRPPurchByInvfrm.totalBySupp := cbsort1.itemindex = 0;
        PBRPPurchByInvfrm.qrlblTitle.caption := PBRPPurchByInvfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPPurchByInvfrm.qrlblDateRange.caption :=
        PBRPPurchByInvfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPPurchByInvfrm.qrlblDateRange.caption :=
        PBRPPurchByInvfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPPurchByInvfrm.qrlblDateRange.caption :=
          PBRPPurchByInvfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
        tempFileName := getWinTempDir + self.Caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;


        PBRPPurchByInvfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      finally
        PrinterSettings.Free;
      end;
    finally
      Application.ProcessMessages;
      qryPurchByInv.Open;
      qryPurchByInv.Close;
      fixquery(True);
    end;
end;

procedure TPBRSPurchByInvFrm.ExportDetailReport;
var
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  fixDetailquery(true);

  PBRPPurchByInvDetsFrm := TPBRPPurchByInvDetsFrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPPurchByInvDetsFrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPPurchByInvDetsFrm.qryReport.SQL.Clear;
        PBRPPurchByInvDetsFrm.qryReport.SQL.Text := qryDetail.Text;
        PBRPPurchByInvDetsFrm.totalBySupp := cbsort1.itemindex = 0;
        PBRPPurchByInvDetsFrm.qrlblTitle.caption := PBRPPurchByInvDetsFrm.qrlblTitle.caption + DateToStr(Date);
        PBRPPurchByInvDetsFrm.qrlblDateRange.caption :=
        PBRPPurchByInvDetsFrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPPurchByInvDetsFrm.qrlblDateRange.caption :=
        PBRPPurchByInvDetsFrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPPurchByInvDetsFrm.qrlblDateRange.caption :=
          PBRPPurchByInvDetsFrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPurchByInvDetsFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      finally
        PrinterSettings.Free;
      end;
    finally
      Application.ProcessMessages;
    end;
end;

end.
