unit wtLUSalesInvoiceRFP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, ImgList, StdCtrls, Buttons,
  ExtCtrls, DB, Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList;

type
  TfrmWTLUSalesInvoiceRFP = class(TForm)
    stsbrDetails: TStatusBar;
    pnlFooter: TPanel;
    ImgHot: TImageList;
    ImgCool: TImageList;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    pnlHeader: TPanel;
    CustomerLbl: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    Label2: TLabel;
    cmbApplications: TComboBox;
    btnClear: TBitBtn;
    grpInvDate: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnPrint: TButton;
    Button4: TButton;
    qryDetails: TFDQuery;
    dtsDetails: TDataSource;
    btnSweep: TButton;
    qryGetCustAFP: TFDQuery;
    qryDummy: TFDQuery;
    Label1: TLabel;
    edtSiteName: TEdit;
    btnSite: TBitBtn;
    pmnDetails: TPopupMenu;
    pmnuPrint: TMenuItem;
    pmnuDelete: TMenuItem;
    qrySetApplication: TFDQuery;
    procedure btnCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure cmbApplicationsClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSiteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnDetailsPopup(Sender: TObject);
  private
    ApplicationReference: string;
    Customer: integer;
    DateFrom, DateTo: TDateTime;
    Reprint: boolean;
    Site: integer;
    ApplicationList: TStringList;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure RefreshData;
    procedure GetApplications(Sender: TObject);
    procedure InitialiseDate(Sender: TObject);
    procedure SetStatementNo(const TempCode: integer);
  public
    { Public declarations }
  end;

var
  frmWTLUSalesInvoiceRFP: TfrmWTLUSalesInvoiceRFP;

implementation

uses UITypes, WTSrchCustomer, allCommon, DateSelV5, wtDataModule, WTRSCustomerRFP,
  wtMain, WTLUCustomerSite;

{$R *.dfm}

procedure TfrmWTLUSalesInvoiceRFP.btnCustomerClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        if Customer <> frmwtSrchCustomer.CodeSelected then
          begin
            Site := 0;
            edtSiteName.Text := '';
            Customer := frmwtSrchCustomer.CodeSelected;
            edtCustomer.text := frmwtSrchCustomer.NameSelected;

            GetApplications(self);
            ApplicationReference := '';
            RefreshData
          end
      end;
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTLUSalesInvoiceRFP.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  ApplicationList := TStringList.create;
  allCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
  customer := 0;
  InitialiseDate(self);
end;

procedure TfrmWTLUSalesInvoiceRFP.DateFromButtonClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTLUSalesInvoiceRFP.InputDate(TempDate: TDateTime): TDateTime;
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
procedure TfrmWTLUSalesInvoiceRFP.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
  DateFrom := NewDate;
  RefreshData;
end;

procedure TfrmWTLUSalesInvoiceRFP.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
  DateTo := NewDate;
  RefreshData;
end;

procedure TfrmWTLUSalesInvoiceRFP.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesInvoiceRFP.RefreshData;
var
  sTemp: string;
  dtStart: TDateTime;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  with qryDetails do
  begin
    Close;
    sql.Text := qryDummy.SQL.Text;

    if ApplicationReference <> '' then
      begin
        sql.Text := sql.Text + ' AND ((Sales_Invoice.Application_Reference = :Application_Reference)) ';
      end
    else
      begin
        sql.Text := sql.Text + ' AND ((Sales_Invoice.Application_Reference = :Application_Reference) OR (Sales_Invoice.Application_Reference IS NULL)) ';
      end;

    sql.Text := sql.Text + 'ORDER BY Sales_Invoice.invoice_no DESC';

    Parambyname('Customer').asinteger := Customer;
    Parambyname('Branch_No').asinteger := Site;
    Parambyname('Date_From').asdatetime := DateFrom;
    Parambyname('Date_To').asdatetime := DateTo;
    parambyname('Application_Reference').asstring := ApplicationReference;
    Open;

    btnPrint.enabled := (recordcount > 0);
    btnSweep.enabled := (recordcount > 0);
  end;

  RePrint := (cmbApplications.text <> '');
end;

procedure TfrmWTLUSalesInvoiceRFP.DateToButtonClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTLUSalesInvoiceRFP.btnSweepClick(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmWTLUSalesInvoiceRFP.GetApplications(Sender: TObject);
var
  tempValue: string;
begin
  cmbApplications.enabled := false;
  btnClear.enabled := false;
  with qryGetCustAFP do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Branch_No').asinteger := Site;
      open;
      first;

      TempValue := cmbApplications.text;

      cmbApplications.clear;
      ApplicationList.clear;

      while eof <> true do
        begin
          if fieldbyname('Application_Reference').asstring = '' then
            begin
              next;
              continue;
            end;
          cmbApplications.items.add(formatdatetime('mmmm d yyyy',fieldbyname('Application_Date').asdatetime) + ' - ' + fieldbyname('Application_Reference').asstring);
          ApplicationList.add(fieldbyname('Application_Reference').asstring);
          next;
        end;

    cmbApplications.enabled := (cmbApplications.items.count > 0);
    btnClear.enabled := (cmbApplications.items.count > 0);

    cmbApplications.ItemIndex := cmbApplications.items.indexof(TempValue);
    if cmbApplications.itemindex >= 0 then
      cmbApplicationsClick(self)
    else
    end;
end;

procedure TfrmWTLUSalesInvoiceRFP.cmbApplicationsClick(Sender: TObject);
begin
  with qryGetCustAFP do
    begin
      first;
      moveby(cmbApplications.itemindex);
      ApplicationReference := fieldbyname('Application_Reference').asstring;
      DateFrom := fieldbyname('Application_Date_From').asdatetime;
      edtDateFrom.text := paDatestr(fieldbyname('Application_Date_From').asdatetime);
      DateTo := fieldbyname('Application_Date_to').asdatetime;
      edtDateTo.text := paDatestr(fieldbyname('Application_Date_to').asdatetime);
    end;
  RefreshData;
end;

procedure TfrmWTLUSalesInvoiceRFP.btnPrintClick(Sender: TObject);
var
  temploop: integer;
begin
  {If reprint then select all items}
  if Reprint then
    begin
      With dtsDetails.DataSet do
        begin
          First ;
          While EOF = False do
          begin
            dbgDetails.SelectedRows.CurrentRowSelected := True ;
            Next ;
          end;
        end;
    end;

  frmWTRSCustomerRFP := TfrmWTRSCustomerRFP.create(self);
  try
    frmWTRSCustomerRFP.SelCustomer := Customer;
    frmWTRSCustomerRFP.SelBranch := Site;
    frmWTRSCustomerRFP.edtCustomerName.text := edtCustomer.text;
    frmWTRSCustomerRFP.edtSiteName.text := edtSiteName.text;
    frmWTRSCustomerRFP.DateFrom := DateFrom;
    frmWTRSCustomerRFP.dateTo := DateTo;
    if Reprint then
      begin
        frmWTRSCustomerRFP.edtApplicationNo.text := ApplicationList.strings[cmbApplications.itemindex];
        frmWTRSCustomerRFP.InvoiceDate := dbgDetails.datasource.dataset.fieldbyname('Application_Date').asdatetime;
        frmWTRSCustomerRFP.memValue.text := formatfloat('0.00', dbgDetails.datasource.dataset.fieldbyname('Application_Labour_Value').asfloat);
      end
    else
      begin
        frmWTRSCustomerRFP.InvoiceDate := date;
        frmWTRSCustomerRFP.memValue.text := formatfloat('0.00', 0.00);
      end;

    frmWTRSCustomerRFP.Reprint := Reprint;
    {Update the Application Print with the selected Purchase Order details}
    dbgDetails.Datasource.Dataset.DisableControls;
    for TempLoop := 0 to pred(dbgDetails.SelectedRows.count) do
		  begin
        dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[TempLoop]));
        frmWTRSCustomerRFP.SelectLst.Add(dbgDetails.dataSource.dataset.fieldbyname('Sales_invoice').asstring);
      end;
    dbgDetails.Datasource.Dataset.EnableControls;
    frmWTRSCustomerRFP.showmodal;
    if frmWTRSCustomerRFP.tempok then
      begin
        GetApplications(self);
        RefreshData;
      end;
  finally
    frmWTRSCustomerRFP.free;
  end;

end;

procedure TfrmWTLUSalesInvoiceRFP.FormDestroy(Sender: TObject);
var
  fileName: string;
begin
  ApplicationList.Free;
  allCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTLUSalesInvoiceRFP.btnClearClick(Sender: TObject);
begin
  with cmbApplications do
    begin
      text := '';
      itemindex := -1;
      initialiseDate(self);
      RefreshData;
    end;
end;

procedure TfrmWTLUSalesInvoiceRFP.InitialiseDate(Sender: TObject);
begin
    DateTo := Date;
    edtDateTo.Text := paDatestr(DateTo);
    DateFrom := Date - 30;
    edtDateFrom.Text := paDatestr(DateFrom);
    ApplicationReference := '';
end;

procedure TfrmWTLUSalesInvoiceRFP.btnSiteClick(Sender: TObject);
begin
  frmWTLUCustomerSite := TfrmWTLUCustomerSite.create(self);
  try
    frmWTLUCustomerSite.Customer := Customer;
    frmWTLUCustomerSite.isLookup := true;
    frmWTLUCustomerSite.showmodal;
    if frmWTLUCustomerSite.selected then
      begin
        edtSiteName.Text := frmWTLUCustomerSite.SelectedName;
        Site := frmWTLUCustomerSite.SelectedCode;

        GetApplications(self);
        ApplicationReference := '';
        RefreshData;
      end;
  finally
    frmWTLUCustomerSite.free;
  end;
end;

procedure TfrmWTLUSalesInvoiceRFP.pmnuDeleteClick(Sender: TObject);
var
  temploop: integer;
begin
  if MessageDlg('Remove the selected invoices from the statement?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {Update the Statement Print with the selected Purchase Order details}
    dbgDetails.Datasource.Dataset.DisableControls;
    for TempLoop := 0 to pred(dbgDetails.SelectedRows.count) do
		  begin
        dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[TempLoop]));
        SetStatementNo(dbgDetails.dataSource.dataset.fieldbyname('Sales_invoice').asinteger);
      end;
    dbgDetails.Datasource.Dataset.EnableControls;
    GetApplications(self);
    RefreshData;
  end;
end;

procedure TfrmWTLUSalesInvoiceRFP.SetStatementNo(const TempCode: integer);
begin
  with qrySetApplication do
    begin
      close;
      parambyname('Sales_invoice').asinteger := TempCode;
      execsql;
    end;
end;

procedure TfrmWTLUSalesInvoiceRFP.pmnDetailsPopup(Sender: TObject);
begin
  pmnuPrint.Enabled := btnPrint.enabled;
  pmnuDelete.Enabled := btnPrint.enabled;
end;

end.
