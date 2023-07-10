unit PBRSOSSInvPayments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Db, DBTables, Buttons, ComCtrls, Printers, CCSPrint;

type
  TPBRSOSSInvPaymentsFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgDetails: TDBGrid;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    Panel3: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    Panel4: TPanel;
    btnPaid: TBitBtn;
    qryReport: TQuery;
    chkbxPaid: TCheckBox;
    dtsReport: TDataSource;
    stsbrDetails: TStatusBar;
    btnClose: TBitBtn;
    grpbxPayments: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    Label3: TLabel;
    cbSort1: TComboBox;
    Label4: TLabel;
    cbSort2: TComboBox;
    chkbxAllUnpaid: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkbxPaidClick(Sender: TObject);
    procedure btnPaidClick(Sender: TObject);
    procedure btnPaidAllClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure cbSort1Change(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    DateFrom, DateTo: TDateTime;
    DontSaveLayout: boolean;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallReport(const bPreview : Boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    function Ordering(aBox: TComboBox): string;
  public
    { Public declarations }
  end;

var
  PBRSOSSInvPaymentsFrm: TPBRSOSSInvPaymentsFrm;

implementation

uses PBLUCust, PBDatabase, pbMaintSalesInvPay, CCSCommon, DateSelV5,
  PBRPOSSInvPayments, pbMainMenu;

{$R *.DFM}

const
  SQLCore =
  ' SELECT distinct '+
	'   Sales_Invoice.Customer, '+
	'   Sales_Invoice.Branch_no, '+
	'   Sales_Invoice.Sales_Invoice, '+
	'   Customer_Branch.Account_Code, '+
	'   Customer.Name as Customer_Name, '+
	'   Rep.Name AS Rep_Name, '+
	'   Rep.Rep, '+
	'   Sales_Invoice.Sales_Invoice_No, '+
	'   Sales_Invoice.Goods_Value, '+
	'   Sales_Invoice.Sales_Invoice_type, '+
	'   Sales_Invoice.Vat_Value, '+
	'   Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Total_Value, '+
	'   Sales_Invoice.Invoice_Date, '+
	'   Sales_Invoice.Invoice_or_Credit, '+
	'   Sales_Invoice.Paid_Date, '+
	'   Sales_Invoice.Paid_Amount, '+
	'   Sales_Invoice.Paid_Status, '+
	'   Sales_Invoice.Reference, '+
  '   Sales_Invoice.Sales_Invoice_Status, '+
	'   Sales_Invoice.Invoice_Description, '+
  '   Contact_Name, '+
  '   Account_Number, '+
  '   Account_Month, '+
  '   Account_Year, '+
	'   (Account_Month + ''/'' + Account_Year) as Expiry_Date, '+
	'   Sales_Invoice.Payment_Method, '+
	'   Payment_Method.Payment_Method_Desc '+
  ' FROM (Customer '+
	'   INNER JOIN (Customer_Branch '+
	'   INNER JOIN (Payment_Method '+
	'   RIGHT JOIN Sales_Invoice '+
	'	    ON Payment_Method.Payment_Method = Sales_Invoice.Payment_Method) '+
	'	    ON (Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND (Customer_Branch.Customer = Sales_Invoice.Customer)) '+
	'	    ON Customer.Customer = Customer_Branch.Customer) '+
	'   INNER JOIN Rep '+
	'	    ON Sales_Invoice.Rep = Rep.Rep ';

procedure TPBRSOSSInvPaymentsFrm.FormShow(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSOSSInvPaymentsFrm.rgCustomerClick(Sender: TObject);
begin
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSOSSInvPaymentsFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.SelBranch := SelCustBranch;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustText := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
    end;
    edtCustomer.Text := SelCustText;
    FixQuery(False);
  finally
    PBLUCustFrm.Free;
//    QrySalesInvOutPayName.visible := False;
  end;

end;

procedure TPBRSOSSInvPaymentsFrm.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(rep);
    qryReport.Open;
    stsbrDetails.panels[0].text := IntToStr(qryReport.RecordCount) + ' records displayed';
  finally
    qryReport.EnableControls;
  end;
end;

function TPBRSOSSInvPaymentsFrm.BuildQueryString(rep: Boolean): string;
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
  sTemp := SQLCore;

  if chkbxPaid.checked then
    begin
      sTemp := sTemp + ' AND ((Sales_Invoice.Paid_Status = ''Y'') or (Sales_Invoice.Paid_Status = ''p''))';
      sTemp := sTemp + ' AND Sales_Invoice.Paid_Date >= ' + qDate(DateFrom);
      sTemp := sTemp + ' AND Sales_Invoice.Paid_Date <= ' + qDate(DateTo);
    end
  else
    sTemp := sTemp + ' AND ((Paid_Status = '''') or (Paid_Status is null))';

  if not chkbxAllUnpaid.checked then
    sTemp := sTemp + ' AND (Cash_Sales = ''Y'')';

  sTemp := sTemp + ' AND Sales_invoice.sales_invoice_status >= 20 ';
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

  if (edtCustomer.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Customer = ' + IntToStr(SelCustCode) + ' ';
  end;

  sTemp := sTemp + ' ORDER BY ';
  
  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
        if sTemp[Length(sTemp)] = ',' then
          sTemp[Length(sTemp)] := ' ';
    end;

  Result := sTemp;
end;

function TPBRSOSSInvPaymentsFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Customer.Name,';
  1:   Result := ' Sales_Invoice.Sales_Invoice_no,';
  2:   Result := ' Sales_Invoice.Invoice_Date,';
  3:   Result := ' Sales_Invoice.Reference,';
  else Result := '';
  end;
end;

procedure TPBRSOSSInvPaymentsFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsReport do
  begin
    btnPreview.Enabled := dataset.recordcount > 0;
    btnPrint.Enabled := dataset.recordcount > 0;
    btnPaid.Enabled := dataset.recordcount > 0;
//    btnPaidAll.Enabled := dataset.recordcount > 0;
  end;
end;

procedure TPBRSOSSInvPaymentsFrm.FormCreate(Sender: TObject);
begin
  cbSort1.ItemIndex := 0;
  cbSort2.ItemIndex := 2;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);

  dtsReport.OnDataChange := SetButtons;
  CCSCommon.SetDBGridCols('', 'PaymentsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSOSSInvPaymentsFrm.chkbxPaidClick(Sender: TObject);
begin
  grpbxPayments.enabled := chkbxPaid.checked;
  FixQuery(False);
end;

procedure TPBRSOSSInvPaymentsFrm.btnPaidClick(Sender: TObject);
var
  Key, tmpStatus: integer;
begin
  key := qryReport.fieldbyname('Sales_Invoice').asinteger;
  tmpStatus := qryReport.fieldbyname('Sales_Invoice_Status').asinteger;
  PBMaintSalesInvPayFrm := TPBMaintSalesInvPayFrm.Create(Self);
  try
    if tmpStatus >= 25 then
      begin
      if MessageDlg('This invoice has been posted to the sales ledger, the details can only be viewed and cannot be modified', mtWarning,
        [mbOk,mbCancel], 0) = mrCancel then
          exit;
      PBMaintSalesInvPayFrm.Mode := 'V'
      end
    else
    if qryReport.fieldbyname('Paid_Status').asstring = '' then
      PBMaintSalesInvPayFrm.Mode := 'A'
    else
      begin
      if MessageDlg('This invoice has already been paid, do you want to continue?', mtConfirmation,
        [mbOk,mbCancel], 0) = mrCancel then
      PBMaintSalesInvPayFrm.Mode := 'C';
      end;

    PBMaintSalesInvPayFrm.SalesInvoice := qryReport.fieldbyname('Sales_Invoice').asinteger;
    PBMaintSalesInvPayFrm.ShowModal;
    if PBMaintSalesInvPayFrm.bOK then
      begin
        FixQuery(False);
        qryReport.locate('Sales_Invoice', Variant(inttostr(key)),[lopartialKey]);
      end;
  finally
    PBMaintSalesInvPayFrm.Free;
  end;
end;

procedure TPBRSOSSInvPaymentsFrm.btnPaidAllClick(Sender: TObject);
begin
  if MessageDlg('Do you want to confirm the payments for the selected invoices?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
    end;
end;

procedure TPBRSOSSInvPaymentsFrm.dbgDetailsDblClick(Sender: TObject);
begin
  btnPaidClick(self);
end;

procedure TPBRSOSSInvPaymentsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
  begin
    //dont do anything
  end
  else
  begin
    CCSCommon.SaveDBGridCols('', 'PaymentsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
    CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  end;

end;

procedure TPBRSOSSInvPaymentsFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

procedure TPBRSOSSInvPaymentsFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSOSSInvPaymentsFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSOSSInvPaymentsFrm.DateToEditExit(Sender: TObject);
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

function TPBRSOSSInvPaymentsFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSOSSInvPaymentsFrm.cbSort1Change(Sender: TObject);
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

procedure TPBRSOSSInvPaymentsFrm.btnPreviewClick(Sender: TObject);
begin
 CallReport(True);
end;

procedure TPBRSOSSInvPaymentsFrm.btnPrintClick(Sender: TObject);
begin
 CallReport(False);
end;

procedure TPBRSOSSInvPaymentsFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qryReport.Close;
  fixquery(True);
  {add total order by clause to report query}
    PBRPOSSInvPaymentsfrm := TPBRPOSSInvPaymentsfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
//        PBRPOSSInvPaymentsfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPOSSInvPaymentsfrm.QrySalesInvOutPay.SQL.Clear;
        PBRPOSSInvPaymentsfrm.QrySalesInvOutPay.SQL.Text := QryReport.Text;
       if cbSort1.itemIndex >= 0 then
        begin
          if cbSort1.ItemIndex = 0 then
            PBRPOSSInvPaymentsfrm.TotalByCust := True
          else
            if cbSort1.ItemIndex = 1 then
              PBRPOSSInvPaymentsfrm.TotalByInvNo := True
            else
            if cbSort1.ItemIndex = 2 then
              PBRPOSSInvPaymentsfrm.TotalByInvDt := True
            else
              if cbSort1.ItemIndex = 3 then
                PBRPOSSInvPaymentsfrm.TotalBySalesOrdNo := True
              else
              begin
              PBRPOSSInvPaymentsfrm.TotalByCust := False;
              PBRPOSSInvPaymentsfrm.TotalByInvNo := False;
              PBRPOSSInvPaymentsfrm.TotalByInvDt := False;
              PBRPOSSInvPaymentsfrm.TotalBySalesOrdNo := False;
              end;
        end; 

        PBRPOSSInvPaymentsfrm.qrlblTitle.caption := PBRPOSSInvPaymentsfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPOSSInvPaymentsfrm.qrlblDateRange.caption :=
        PBRPOSSInvPaymentsfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPOSSInvPaymentsfrm.qrlblDateRange.caption :=
        PBRPOSSInvPaymentsfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPOSSInvPaymentsfrm.qrlblDateRange.caption :=
          PBRPOSSInvPaymentsfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
        if bPreview then
          PBRPOSSInvPaymentsfrm.QckRpSalesInvPay.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPOSSInvPaymentsfrm.QckRpSalesInvPay.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
     Application.ProcessMessages;
     QryReport.Open;
  end;
end;

end.
