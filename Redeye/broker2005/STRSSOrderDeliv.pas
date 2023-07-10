unit STRSSOrderDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, DBTables, StdCtrls, Buttons, ComCtrls, CCSCommon,
  CCSemailHandler, FileCtrl, Variants;

type
  TSTRSSOrderDelivFrm = class(TForm)
    Panel2: TPanel;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    qryReport: TQuery;
    dtsReport: TDataSource;
    grpbxCustomer: TGroupBox;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDateFrom: TBitBtn;
    btnDateTo: TBitBtn;
    rgCustomer: TRadioGroup;
    Label3: TLabel;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    btnEmail: TBitBtn;
    stbDetails: TStatusBar;
    qryReportSales_Order: TIntegerField;
    qryReportSales_order_delivery_no: TIntegerField;
    qryReportDelivery_Date: TDateTimeField;
    qryReportConsignment_number: TStringField;
    qryReportCust_Order_No: TStringField;
    qryReportCustomer: TIntegerField;
    qryReportName: TStringField;
    qryExport: TQuery;
    qryCompany: TQuery;
    qryCustomer: TQuery;
    btnDetails: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure edtDateFromChange(Sender: TObject);
    procedure edtDateToChange(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure btnDateFromClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure ntomerChange(Sender: TObject);
    procedure dtsReportDataChange(Sender: TObject; Field: TField);
    procedure btnDetailsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
  private
    { Private declarations }
    DateFrom, DateTo: TDateTime;
    exportFile: textFile;
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    function CheckSelection: Boolean;
    procedure ExportToFile(fileName: string);
    function InputDate(TempDate: TDateTime): TDateTime;
    function GetTransferDir: string;
    function GetCustomerEmail(tempCode: integer): string;
  public
    { Public declarations }
  end;

var
  STRSSOrderDelivFrm: TSTRSSOrderDelivFrm;

implementation

uses DateSelV5, pbDatabase, PBLUCust, STMaintSOrdDel;

{$R *.DFM}

const
  SQLCore =
    'SELECT  Sales_Order_Delivery.Sales_Order, '+
    '    Sales_Order_Delivery.Sales_order_delivery_no, '+
    '    Sales_Order_Delivery.Delivery_Date, '+
    '    Sales_Order_Delivery.Consignment_number, '+
    '    Sales_Order.Cust_Order_No, '+
    '    Sales_Order.Customer, '+
    '    Customer.Name '+
    'FROM Customer '+
    '  INNER JOIN (Customer_Branch '+
    '  INNER JOIN (Sales_Order '+
    '  INNER JOIN Sales_Order_Delivery ON '+
    '    Sales_Order.Sales_Order = Sales_Order_Delivery.Sales_Order) ON '+
    '    (Customer_Branch.Branch_no = Sales_Order.Branch_no) AND '+
    '    (Customer_Branch.Customer = Sales_Order.Customer)) ON '+
    '    Customer.Customer = Customer_Branch.Customer ';

procedure TSTRSSOrderDelivFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date;
  edtDateFrom.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(rep);
    qryReport.Open;
    stbDetails.panels[0].text := IntToStr(qryReport.RecordCount);
  finally
    qryReport.EnableControls;
  end;
end;

function TSTRSSOrderDelivFrm.BuildQueryString(rep: Boolean): string;
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
  sTemp := sTemp + ' WHERE Sales_Order.Sales_Order_Head_Status > 100 ';
  sTemp := sTemp + ' AND Sales_Order_Delivery.Delivery_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Sales_Order_Delivery.Delivery_Date <= ' + qDate(DateTo);
  if (edtCustomer.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Order.Customer = ' + IntToStr(SelCustCode);
    sTemp := sTemp + ' AND Sales_Order.Branch_No = ' + IntToStr(SelCustBranch);
  end;

  sTemp := sTemp + ' ORDER BY Customer.Name, Sales_Order_Delivery.Delivery_Date ';
  Result := sTemp;
end;

procedure TSTRSSOrderDelivFrm.rgCustomerClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgCustomer.ItemIndex = 0) then
  begin
    grpbxCustomer.Visible := False;
    EdtCustomer.Text := '';
  end
  else
  begin
    grpbxCustomer.Visible := True;
  end;
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.btnCustomerClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  try
    pbLUCustFrm.bIs_Lookup := True;
    pbLUCustFrm.bAllow_Upd := False;
    pbLUCustFrm.SelCode := SelCustCode;
    pbLUCustFrm.SelBranch := SelCustBranch;
    pbLUCustFrm.bSel_Branch := True;
    pbLUCustFrm.ShowModal;
    if pbLUCustFrm.Selected then
    begin
      SelCustCode := pbLUCustFrm.SelCode;
      SelCustBranch := pbLUCustFrm.SelBranch;
      SelCustText := pbLUCustFrm.SelName + ' / ' + pbLUCustFrm.SelBranchName;
    end;
    edtCustomer.Text := SelCustText;
    FixQuery(False);
  finally
    pbLUCustFrm.Free;
  end;
end;

procedure TSTRSSOrderDelivFrm.edtDateFromChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.edtDateToChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDatefrom.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateFrom.SetFocus;
      Exit;
    end;
  end;

  edtDateFrom.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDateto.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateto.SetFocus;
      Exit;
    end;
  end;

  edtDateto.Text := PBDatestr(NewDate);
  Dateto := NewDate;
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.btnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TSTRSSOrderDelivFrm.btnDateToClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

function TSTRSSOrderDelivFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TSTRSSOrderDelivFrm.FormShow(Sender: TObject);
begin
  qryReport.Active := True;
end;

procedure TSTRSSOrderDelivFrm.btnEmailClick(Sender: TObject);
var
  tempFileName: string;
  emailHandler: TemailHandler;
  tempDir, sFileName, sEmailAddress: string;
  EmailAttachment : TstringList;
begin
  if qryreport.recordcount = 0 then
    begin
      MessageDlg('There are no records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  if not CheckSelection then
    begin
      MessageDlg('Consignment details have not been entered for all deliveries', mtError,
        [mbAbort], 0);
      exit;
    end;

  if MessageDlg('Create an email with a csv file attachment?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  emailHandler := TemailHandler.Create(self);

  EmailAttachment := TStringList.create;
  EmailAttachment.clear;

  tempDir := GetTransferDir;

  if not DirectoryExists(tempDir) then
    begin
      try
        CreateDir(tempDir);
      except
        exit
      end;
    end;

  sFileName := 'CD'+formatdatetime('yyyymmdd',DateFrom)+'01.csv';
  
  try
    tempFileName := TempDir+sFileName;
    ExportToFile(tempFileName);

    CloseFile(self.exportFile);
    sEmailAddress := GetCustomerEmail(SelCustCode);

    EmailAttachment.add(tempFileName);
    emailHandler.EmailViaOutlook(sEmailAddress,'Confirm Despatch File',EmailAttachment,'');
  finally
    EmailAttachment.Free;
    emailHandler.Free;
  end;
end;

function TSTRSSOrderDelivFrm.GetCustomerEmail(tempCode: integer):string;
begin
  with qryCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;
      result := fieldbyname('Email_address_order_confirm').asstring;
    end;
end;

procedure TSTRSSOrderDelivFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '';
  with qryExport do
    begin
      close;
      sql.text := qryReport.sql.text;
      open;

      tempStr := '"' + inttostr(recordcount) + '"';

      writeln(self.exportFile, tempStr);

      while eof <> true do
        begin
          tempstr := '';
          tempStr := '"' + fieldbyname('Cust_Order_no').AsString + '"';

          tempStr := tempStr + ',"' + fieldbyname('Consignment_number').asString + '"';
          tempStr := tempStr + ',"' + fieldbyname('Delivery_Date').asString + '"';

          writeln(self.exportFile, tempStr);
          next;
        end;
    end;
end;

function TSTRSSOrderDelivFrm.GetTransferDir: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Data_Transfer_Directory').asstring)+'\out\';
    end;
end;
procedure TSTRSSOrderDelivFrm.ntomerChange(Sender: TObject);
begin
  btnEmail.enabled := edtCustomer.text <> '';
end;

function TSTRSSOrderDelivFrm.CheckSelection: Boolean;
begin
  result := true;
  with qryExport do
    begin
      close;
      sql.text := qryReport.sql.text;
      open;

      while EOF <> true do
        begin
          if trim(fieldbyname('Consignment_Number').asstring) = '' then
            begin
              result := false;
              exit;
            end;
          next;
        end;
    end;
end;

procedure TSTRSSOrderDelivFrm.dtsReportDataChange(Sender: TObject;
  Field: TField);
begin
  btnDetails.enabled := dtsReport.dataset.recordcount > 0;
end;

procedure TSTRSSOrderDelivFrm.btnDetailsClick(Sender: TObject);
var
  tempSO, tempLine: integer;
begin
  tempSO := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  tempLine := dbgDetails.datasource.dataset.fieldbyname('Sales_Order_delivery_no').asinteger;
  STMaintSOrdDelFrm := TSTMaintSOrdDelFrm.create(self);
  try
    STMaintSOrdDelFrm.SalesOrder := tempSO;
    STMaintSOrdDelFrm.DeliveryNo := tempLine;
    STMaintSOrdDelFrm.showmodal;
    if STMaintSOrdDelFrm.bOK then
      begin
        FixQuery(False);
        dbgDetails.DataSource.DataSet.Locate('Sales_order;Sales_order_delivery_no', VarArrayOf([inttostr(tempSO),inttostr(tempLine)]),[lopartialKey]) ;
      end;
  finally
    STMaintSOrdDelFrm.free;
  end;
end;

procedure TSTRSSOrderDelivFrm.dbgDetailsDblClick(Sender: TObject);
begin
  btnDetailsClick(self);
end;

end.
