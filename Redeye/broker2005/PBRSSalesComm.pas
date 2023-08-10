unit PBRSSalesComm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, DateSelV5, PBPOObjects, ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesCommFrm = class(TForm)
    qrySalesComm: TFDQuery;
    dtsrcSalesComm: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    rdgrpRep: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    dbgrdSalesInvoice: TDBGrid;
    lblRecordCount: TLabel;
    CancelBitBtn: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    oldqrySalesComm: TFDQuery;
    qrySalesCommCustomer: TIntegerField;
    qrySalesCommBranch_no: TIntegerField;
    qrySalesCommSales_Invoice: TIntegerField;
    qrySalesCommAccount_Code: TStringField;
    qrySalesCommName: TStringField;
    qrySalesCommRep_Name: TStringField;
    qrySalesCommSales_Invoice_No: TStringField;
    qrySalesCommGoods_Value: TCurrencyField;
    qrySalesCommVat_Value: TCurrencyField;
    qrySalesCommGoods_Total: TCurrencyField;
    qrySalesCommInvoice_Date: TDateTimeField;
    qrySalesCommInvoice_or_Credit: TStringField;
    qrySalesCommPaid_Date: TDateTimeField;
    qrySalesCommPaid_Amount: TCurrencyField;
    qrySalesCommPaid_Status: TStringField;
    qrySalesCommCommission_Rate: TFloatField;
    qrySalesCommReference: TStringField;
    qrySalesCommInvoice_Description: TStringField;
    qryCompanyCommType: TFDQuery;
    qrySalesCommPaidDateDesc: TStringField;
    rdgrpCommType: TRadioGroup;
    qryRepName: TFDQuery;
    RdGrpRepTyp: TRadioGroup;
    ChkBxNewPgRep: TCheckBox;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btbtnExcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure rdgrpRepClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure dbgrdSalesInvoiceDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrySalesCommPaidDateDescGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure rdgrpCommTypeClick(Sender: TObject);
    procedure RdGrpRepTypClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    RepsCommOnPaidInvs: boolean;
    SelRepCode: integer;
    SelRepText : string;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure CallReport(const bPreview : Boolean);
    procedure callCatReport(const bpreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CheckCompanyCommissionType;
    procedure SetPerformanceType;
    procedure CallExcelCatReport;
  public
    { Public declarations }
    DateFrom, DateTo: TDateTime;
  end;

var
  PBRSSalesCommFrm: TPBRSSalesCommFrm;

implementation

uses PBRPSalesComm, PBDatabase, PBLURep, PBRPSalesCommbyCat, pbMainMenu, CCSCommon;

{$R *.DFM}

const
  SQLCore =
  'SELECT distinct '+
	'Sales_Invoice.Customer, '+
	'Sales_Invoice.Branch_no, '+
	'Sales_Invoice.Sales_Invoice, '+
	'Customer_Branch.Account_Code, '+
	'Customer.Name, '+
	'Rep.Name AS Rep_Name, '+
  'Rep.Rep, '+
	'Sales_Invoice.Sales_Invoice_No, '+
	'Sales_Invoice.Goods_Value, '+
	'Sales_Invoice.Sales_Invoice_type, '+
	'Sales_Invoice.Vat_Value, '+
	'Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Goods_Total, '+
	'Sales_Invoice.Invoice_Date, '+
	'Sales_Invoice.Invoice_or_Credit, '+
	'Sales_Invoice.Paid_Date, '+
	'Sales_Invoice.Paid_Amount, '+
	'Sales_Invoice.Paid_Status, '+
	'Rep.Commission_Rate, '+
	'Sales_Invoice.Reference, '+
  '(select Reps_Branches.Percentage '+
  ' from Reps_Branches '+
  ' where Reps_Branches.customer = sales_invoice.customer and '+
  '       Reps_Branches.branch_no = sales_invoice.branch_no and '+
  '       Reps_Branches.rep = sales_invoice.rep) as Rep_Responsibility, '+
	'Sales_Invoice.Invoice_Description '+
  'FROM Rep '+
	'INNER JOIN (Customer '+
	'INNER JOIN (Customer_Branch '+
	'INNER JOIN (Sales_Invoice '+
	'INNER JOIN Sales_Invoice_Line ON '+
	'	Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
	'	(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) AND '+
	'	(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer)) ON '+
	'	Customer.Customer = Customer_Branch.Customer) ON '+
	'	Rep.Rep = Sales_Invoice.Rep ';

  SQLCorebyProd =
  ' SELECT DISTINCT Sales_Invoice.Customer, '+
	' Sales_Invoice.Branch_no, '+
	' Sales_Invoice.Sales_Invoice, '+
	' Customer_Branch.Account_Code, '+
	' Customer.Name, Rep.Name AS Rep_Name, '+
	' Rep.Rep, '+
	' Sales_Invoice.Sales_Invoice_No, '+
	' Sales_Invoice_Line.Invoice_Line_No, '+
	' Sales_Invoice_Line.Goods_Value, '+
	' Sales_Invoice.Sales_invoice_type, '+
	' Sales_Invoice_Line.Qty_Invoiced, '+
	' Sales_Invoice_Line.Vat_Value, '+
	' Sales_Invoice_Line.Goods_Value+Sales_Invoice_Line.Vat_Value AS Goods_Total, '+
	' Sales_Invoice.Invoice_Date, '+
	' Sales_Invoice.Invoice_or_Credit, '+
	' Sales_Invoice.Paid_Date, '+
	' Sales_Invoice.Paid_Amount, '+
	' Sales_Invoice.Paid_Status, '+
	' Rep.Commission_Rate, '+
	' Sales_Invoice.Reference, '+
	' Sales_Invoice.Invoice_Description, '+
  '(select Reps_Branches.Percentage '+
  ' from Reps_Branches '+
  ' where Reps_Branches.customer = sales_invoice.customer and '+
  '       Reps_Branches.branch_no = sales_invoice.branch_no and '+
  '       Reps_Branches.rep = sales_invoice.rep) as Rep_Responsibility, '+
	' Price_Unit.Price_Unit_Factor, '+
	' Product_Type.Category, '+
	' Category.Description as Category_Description '+
  ' FROM Category '+
	'   RIGHT JOIN (Customer '+
	'   INNER JOIN (Product_Type '+
	'   RIGHT JOIN (Price_Unit '+
	'   INNER JOIN ((Rep '+
	'   INNER JOIN (Customer_Branch '+
	'   INNER JOIN Sales_Invoice ON '+
	'   	(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AND '+
	'   	(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)) ON '+
	'   	Rep.Rep = Sales_Invoice.Rep) '+
	'   INNER JOIN Sales_Invoice_Line ON '+
	'   	Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
	'   	Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) ON '+
	'   	Product_Type.Product_Type = Sales_Invoice_Line.Product_Type) ON '+
	'   	Customer.Customer = Customer_Branch.Customer) ON '+
	'   	Category.Category = Product_Type.Category ';

procedure TPBRSSalesCommFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 0;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  If dmBroker.iAccCtrlMenu = 4 then
    begin
      btnRep.enabled := false;
      selRepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      rdgrpRep.ItemIndex := 1;
      rdgrpRep.Enabled := false;
      with qryRepName do
      begin
        close;
        paramByName('Sel_rep').asInteger := selrepcode;
        open;
        if not eof then
          edtRep.Text := qryRepName.fieldByName('Name').asString;
      end;
     end
  else
    begin
      selRepCode := 0 ;
      btnRep.enabled := True;
    end;

  self.CheckCompanyCommissionType;

  SetPerformanceType;

  FixQuery(False);
end;

procedure TPBRSSalesCommFrm.rdgrpRepClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rdgrpRep.ItemIndex = 0) then
  begin
    pnlRepSearch.Visible := False;
    EdtRep.Text := '';
    qrySalesCommName.visible := True;
  end
  else
  begin
    pnlRepSearch.Visible := True;
  end;
  FixQuery(False);
  ChkBxNewPgRep.visible:= (rdgrpRep.ItemIndex = 1);
end;

procedure TPBRSSalesCommFrm.btnRepClick(Sender: TObject);
{creates the Rep look up form, stores the cust and branch number, displays the cust name and branch name in the Cust edit box}
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
    FixQuery(False);
  finally
    PBLURepFrm.Free;
    qrySalesCommName.visible := False;
  end;
end;

procedure TPBRSSalesCommFrm.FormShow(Sender: TObject);
begin
  dbgrdSalesInvoice.columns[9].Visible := (RepsCommOnPaidInvs);
  dbgrdSalesInvoice.columns[10].Visible:= (RepsCommOnPaidInvs);

  qrySalesComm.Active := True;
end;

procedure TPBRSSalesCommFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesCommFrm: TPBRPSalesCommFrm;
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;
  fixquery(True);
  if rdGrpCommtype.ItemIndex = 1 then
  begin
    callcatReport(bPreview);
    exit;
  end;
  {add total order by clause to report query}

  PBRPSalesCommfrm := TPBRPSalesCommfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesCommfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPSalesCommfrm.qrySalesComm.SQL.Clear;
          PBRPSalesCommfrm.TotalByRep := True;
          PBRPSalesCommfrm.FinancialYear := dmBroker.GetCurrentYear;
//          PBRPSalesCommfrm.commbyCat := rdgrpCommType.ItemIndex = 1;
          PBRPSalesCommFrm.isSummary := RdGrpRepTyp.ItemIndex = 1;
          PBRPSalesCommfrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
          if (ChkBxNewPgRep.checked) and (chkBxNewPgRep.visible) then
            PBRPSalesCommFrm.RepPgBrk := true   ;
          if RdGrpRepTyp.ItemIndex = 1 then
            PBRPSalesCommfrm.qrlblTitle.caption := PBRPSalesCommfrm.qrlblTitle.caption +'Summary by Rep - Run Date '+ DateToStr(Date)
          else
            PBRPSalesCommfrm.qrlblTitle.caption := PBRPSalesCommfrm.qrlblTitle.caption +'Report by Rep - Run Date '+ DateToStr(Date);

          PBRPSalesCommfrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;
          if self.RepsCommOnPaidInvs then
          begin
            PBRPSalesCommfrm.qrlblDateRange.caption :=
              PBRPSalesCommfrm.qrlblDateRange.caption + DateFromEdit.Text +
              ' to: ' + DateToEdit.Text;
          end
          else
          begin
            PBRPSalesCommfrm.qrlblDateRange.caption :=
              'For Invoices Dated from: ' + DateFromEdit.Text +
              ' to: ' + DateToEdit.Text;
          end;

          PBRPSalesCommfrm.qrlblDateRange.caption :=
            PBRPSalesCommfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text;
          if (cbSort2.Text <>'') then
          begin
            PBRPSalesCommfrm.qrlblDateRange.caption :=
              PBRPSalesCommfrm.qrlblDateRange.caption + ' then by: ' +
              cbSort2.Text;
          end;
          if bPreview then
            PBRPSalesCommfrm.qckrpSalesByInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSalesCommfrm.qckrpSalesByInv.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;

end;

function TPBRSSalesCommFrm.BuildQueryString(rep: Boolean): string;
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
  if (rdgrpCommType.ItemIndex = 1) then
    sTemp := SQLCorebyProd
  else
    sTemp := SQLCore;

  if self.RepsCommOnPaidInvs then
  begin
//    sTemp := sTemp + ' WHERE ((Sales_Invoice.Paid_Status = ''Y'') or (Sales_Invoice.Paid_Status = ''p''))';
    sTemp := sTemp + ' WHERE (((Sales_Invoice.Paid_Amount >= (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value)*0.99)) OR ' +
                      ' ((Sales_Invoice.Paid_Amount <= (Sales_Invoice.Goods_Value + Sales_Invoice.Vat_Value)*0.99)))';
    sTemp := sTemp + ' AND ((Sales_Invoice.Paid_Date >= ' + qDate(DateFrom) + ') and (Sales_Invoice.Paid_Date <= ' + qDate(DateTo) + '))';
  end
  else
  begin
    sTemp := sTemp + ' WHERE Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
    sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo)
  end;

  sTemp := sTemp + ' AND Sales_invoice.sales_invoice_status >= 20 ';
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

  if (edtRep.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Rep = ' + IntToStr(SelRepCode) + ' ';
  end;

  if rdGrpCommtype.ItemIndex = 0 then
    sTemp := sTemp + ' ORDER BY Rep.Name, '
  else
    sTemp := sTemp + ' ORDER BY Rep.Name, Category.Description, ';

  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
        if sTemp[Length(sTemp)] = ',' then
          sTemp[Length(sTemp)] := ' ';
    end;

  Result := sTemp;
end;

procedure TPBRSSalesCommFrm.FixQuery(rep: Boolean);
begin
  qrySalesComm.DisableControls;
  try
    qrySalesComm.Close;
    qrySalesComm.SQL.Clear;
    qrySalesComm.SQL.text := BuildQueryString(rep);
    qrySalesComm.Open;
    lblRecordCount.Caption:=IntToStr(qrySalesComm.RecordCount);
  finally
    qrySalesComm.EnableControls;
  end;
end;

function TPBRSSalesCommFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Sales_Invoice.Sales_Invoice_No,';
  1:   Result := ' Sales_Invoice.Invoice_Date,';
  2:   Result := ' Customer.Name,';
  3:   Result := ' Sales_Invoice.Reference,';
  else Result := '';
  end;
end;

procedure TPBRSSalesCommFrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
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

procedure TPBRSSalesCommFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSSalesCommFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSalesCommFrm.DateToEditChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesCommFrm.DateFromEditChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesCommFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSSalesCommFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

function TPBRSSalesCommFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSalesCommFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSSalesCommFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSSalesCommFrm.cbValuesChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesCommFrm.dbgrdSalesInvoiceDrawColumnCell(
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
  if dtsrcSalesComm.dataset.fieldbyname('Invoice_or_credit').asstring = 'C' then
    (Sender as TDBGrid).Canvas.font.Color := clRed;
  if  (Column.Title.Caption <> 'Paid') and
      (Column.Title.Caption <> 'Value') and
      (Column.Title.Caption <> 'VAT') and
      (Column.Title.Caption <> 'Total')then
  	begin
      if Assigned(Column.Field) then
	      StrPCopy(Txt, Column.Field.AsString) else
        StrPCopy(Txt, '');
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
           	if  (Column.Title.Caption <> 'Paid') and
                (Column.Title.Caption <> 'Value') and
                (Column.Title.Caption <> 'VAT') and
                (Column.Title.Caption <> 'Total') then
              	begin
        			Canvas.Brush.Color := Color;
        			Canvas.Font.Color  := Font.Color;
        			Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
          			Column.field.asstring);
                 end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Value') or
          (Column.Title.Caption = 'VAT') or
          (Column.Title.Caption = 'Total') or
          (Column.Title.Caption = 'Paid') then
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

procedure TPBRSSalesCommFrm.CheckCompanyCommissionType;
begin
  self.qryCompanyCommType.active := true;

  if self.qryCompanyCommType.FieldByName('commission_type').asString = 'PDINV' then
  begin
    self.RepsCommOnPaidInvs := true;
    self.label1.Caption := 'From Payment Date:';
    self.Label2.Caption := 'To Payment Date:';
  end
  else
  begin
    self.RepsCommOnPaidInvs := false;
    self.label1.Caption := 'From Invoice Date:';
    self.Label2.Caption := 'To Invoice Date:';
  end;

  self.qryCompanyCommType.Active := false;
end;

procedure TPBRSSalesCommFrm.qrySalesCommPaidDateDescGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesComm.fieldbyname('Paid_amount').asstring = '0' then
    text := ''
  else
    text := 'Paul';
end;

procedure TPBRSSalesCommFrm.callCatReport(const bpreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;
  fixquery(True);

  PBRPSalesCommbyCatfrm := TPBRPSalesCommbyCatfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPSalesCommbyCatfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPSalesCommbyCatfrm.qrySalesComm.SQL.Clear;
          PBRPSalesCommbyCatfrm.TotalByRep := True;
          PBRPSalesCommbyCatfrm.FinancialYear := dmBroker.GetCurrentYear;

          PBRPSalesCommbyCatfrm.commbyCat := rdgrpCommType.ItemIndex = 1;
          PBRPSalesCommbyCatFrm.isSummary := RdGrpRepTyp.ItemIndex = 1;
          PBRPSalesCommbyCatfrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
          if (ChkBxNewPgRep.checked) and (chkBxNewPgRep.visible) then
            PBRPSalesCommbyCatFrm.RepPgBrk := true   ;
         if RdGrpRepTyp.ItemIndex = 1 then
            PBRPSalesCommbyCatfrm.qrlblTitle.caption := PBRPSalesCommByCatfrm.qrlblTitle.caption +'Summary by Rep/Product Category - Run Date '+ DateToStr(Date)
          else
            PBRPSalesCommbyCatfrm.qrlblTitle.caption := PBRPSalesCommByCatfrm.qrlblTitle.caption +'Report by Rep/Product Category - Run Date '+ DateToStr(Date);

          PBRPSalesCommbyCatfrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;
          if self.RepsCommOnPaidInvs then
          begin
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
              PBRPSalesCommbyCatfrm.qrlblDateRange.caption + DateFromEdit.Text +
              ' to: ' + DateToEdit.Text;
          end
          else
          begin
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
              'For Invoices Dated from: ' + DateFromEdit.Text +
              ' to: ' + DateToEdit.Text;
          end;

          PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text;
          if (cbSort2.Text <>'') then
          begin
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
              PBRPSalesCommbyCatfrm.qrlblDateRange.caption + ' then by: ' +
              cbSort2.Text;
          end;
          if bPreview then
            PBRPSalesCommbyCatfrm.qckrpSalesByInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSalesCommbyCatfrm.qckrpSalesByInv.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;

end;

procedure TPBRSSalesCommFrm.rdgrpCommTypeClick(Sender: TObject);
begin
  FixQuery(False);
  ChkBxNewPgRep.visible:= (RDGrpRepTyp.ItemIndex = 1) and (rdGrpCommType.ItemIndex = 1);
end;

procedure TPBRSSalesCommFrm.RdGrpRepTypClick(Sender: TObject);
begin
cbsort1.enabled := RDGrpRepTyp.ItemIndex = 0;
cbsort2.enabled := cbsort1.enabled;
ChkBxNewPgRep.visible:= (RDGrpRepTyp.ItemIndex = 1) and (rdGrpCommType.ItemIndex = 1);
end;

procedure TPBRSSalesCommFrm.SetPerformanceType;
begin
  qryCompanyCommType.active := true;

  if self.qryCompanyCommType.FieldByName('performance_target_type').asString = 'C' then
  begin
    rdgrpCommType.ItemIndex := 1;
  end
  else
  begin
    rdgrpCommType.ItemIndex := 0;
  end;
  rdgrpCommType.enabled := false;

  self.qryCompanyCommType.Active := false;

end;

procedure TPBRSSalesCommFrm.btbtnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;
  fixquery(True);
  if rdGrpCommtype.ItemIndex = 1 then
  begin
    CallExcelCatReport;
    exit;
  end;
  {add total order by clause to report query}

  PBRPSalesCommfrm := TPBRPSalesCommfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      {this part copies the query and values from the report selection form to the report print form}
      PBRPSalesCommfrm.PrinterSettings := PrinterSettings;
      PBRPSalesCommfrm.qrySalesComm.SQL.Clear;
      PBRPSalesCommfrm.TotalByRep := True;
      PBRPSalesCommfrm.FinancialYear := dmBroker.GetCurrentYear;
//    PBRPSalesCommfrm.commbyCat := rdgrpCommType.ItemIndex = 1;
      PBRPSalesCommFrm.isSummary := RdGrpRepTyp.ItemIndex = 1;
      PBRPSalesCommfrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
      if (ChkBxNewPgRep.checked) and (chkBxNewPgRep.visible) then
        PBRPSalesCommFrm.RepPgBrk := true   ;

      PBRPSalesCommfrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;

      prgbrExport.Max := qrySalesComm.RecordCount;
      tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      PBRPSalesCommfrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;

      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
      finally
        PrinterSettings.Free;
      end;
  finally
      PBRPSalesCommfrm.Free;
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;
end;

procedure TPBRSSalesCommFrm.CallExcelCatReport;
var
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;
  fixquery(True);

  PBRPSalesCommbyCatfrm := TPBRPSalesCommbyCatfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPSalesCommbyCatfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPSalesCommbyCatfrm.qrySalesComm.SQL.Clear;
          PBRPSalesCommbyCatfrm.TotalByRep := True;
          PBRPSalesCommbyCatfrm.FinancialYear := dmBroker.GetCurrentYear;

          PBRPSalesCommbyCatfrm.commbyCat := rdgrpCommType.ItemIndex = 1;
          PBRPSalesCommbyCatFrm.isSummary := RdGrpRepTyp.ItemIndex = 1;
          PBRPSalesCommbyCatfrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
          if (ChkBxNewPgRep.checked) and (chkBxNewPgRep.visible) then
            PBRPSalesCommbyCatFrm.RepPgBrk := true   ;
         if RdGrpRepTyp.ItemIndex = 1 then
            PBRPSalesCommbyCatfrm.qrlblTitle.caption := PBRPSalesCommByCatfrm.qrlblTitle.caption +'Summary by Rep/Product Category - Run Date '+ DateToStr(Date)
          else
            PBRPSalesCommbyCatfrm.qrlblTitle.caption := PBRPSalesCommByCatfrm.qrlblTitle.caption +'Report by Rep/Product Category - Run Date '+ DateToStr(Date);

          PBRPSalesCommbyCatfrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;
          if self.RepsCommOnPaidInvs then
          begin
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
              PBRPSalesCommbyCatfrm.qrlblDateRange.caption + DateFromEdit.Text +
              ' to: ' + DateToEdit.Text;
          end
          else
          begin
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
              'For Invoices Dated from: ' + DateFromEdit.Text +
              ' to: ' + DateToEdit.Text;
          end;

          PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text;
          if (cbSort2.Text <>'') then
          begin
            PBRPSalesCommbyCatfrm.qrlblDateRange.caption :=
              PBRPSalesCommbyCatfrm.qrlblDateRange.caption + ' then by: ' +
              cbSort2.Text;
          end;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;

end;

end.
