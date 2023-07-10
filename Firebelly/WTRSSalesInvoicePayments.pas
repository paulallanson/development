unit WTRSSalesInvoicePayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, gtQrCtrls, OleCtnrs, DB,
  DBTables, IniFiles;

type
  TfrmWTRSSalesInvoicePayments = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpCustomer: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    rdgrpSortBy: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpCategory: TRadioGroup;
    rdgrpReps: TRadioGroup;
    grpbxReps: TGroupBox;
    Label3: TLabel;
    cmbReps: TComboBox;
    qryReps: TQuery;
    dtsReps: TDataSource;
    chkbxOnlyShowUnpaid: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure rdgrpRepsClick(Sender: TObject);
    procedure cmbRepsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadReps;
  public
    { Public declarations }
  end;

var
  frmWTRSSalesInvoicePayments: TfrmWTRSSalesInvoicePayments;

implementation

uses WTSrchCustomer, WTRPSalesInvoicePayments, Allcommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTRSSalesInvoicePayments.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSalesInvoicePayments.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSalesInvoicePayments.RunReport(const bPreview: boolean);
begin
  frmWTRPSalesInvoicePayments := TfrmWTRPSalesInvoicePayments.create(self);
  try

//  Check if any records
    frmWTRPSalesInvoicePayments.customer := customer;
    frmWTRPSalesInvoicePayments.rep := rep;
    frmWTRPSalesInvoicePayments.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSalesInvoicePayments.dateto := padatestr(edtDateTo.Text);
    frmWTRPSalesInvoicePayments.Sortby := rdgrpSortBy.itemindex;
    frmWTRPSalesInvoicePayments.OnlyUnPaid := chkbxOnlyShowUnPaid.checked;

    frmWTRPSalesInvoicePayments.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPSalesInvoicePayments.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPSalesInvoicePayments.qrlblCaption.Caption := frmWTRPSalesInvoicePayments.qrlblCaption.Caption;
    frmWTRPSalesInvoicePayments.qrlblDateRange.Caption := 'Invoiced between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPSalesInvoicePayments.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmWTRPSalesInvoicePayments.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPSalesInvoicePayments.qrpDetails.PrinterSetup;
          if frmWTRPSalesInvoicePayments.qrpDetails.tag = 0 then
            frmWTRPSalesInvoicePayments.qrpDetails.Print;
      end;
  finally
    frmWTRPSalesInvoicePayments.free;
  end;
end;

procedure TfrmWTRSSalesInvoicePayments.btnCustomerClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        customer := frmwtSrchCustomer.CodeSelected;
        edtCustomer.text := frmwtSrchCustomer.NameSelected;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSSalesInvoicePayments.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        edtCustomer.Text := 'All Customers';
        grpbxCustomer.enabled := false;
      end;
  1:  begin
        edtCustomer.Text := '';
        grpbxCustomer.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSalesInvoicePayments.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (cmbReps.Text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.Enabled;
end;

procedure TfrmWTRSSalesInvoicePayments.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSalesInvoicePayments.edtDateFromExit(Sender: TObject);
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
end;

function TfrmWTRSSalesInvoicePayments.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSalesInvoicePayments.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSalesInvoicePayments.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      if ReadString('Sales Invoice Payment Comparison', 'Only Show Paid', 'N') = 'Y' then
        chkbxOnlyShowUnpaid.checked := true
      else
        chkbxOnlyShowUnpaid.checked := false;
    end;
  finally
    IniFile.Free;
  end;

  customer := 0;
  rep := 0;
  DateFrom := Date - 30;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSalesInvoicePayments.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSalesInvoicePayments.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPSalesInvoicePayments := TfrmWTRPSalesInvoicePayments.create(self);
  try

//  Check if any records
    frmWTRPSalesInvoicePayments.customer := customer;
    frmWTRPSalesInvoicePayments.rep := rep;
    frmWTRPSalesInvoicePayments.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSalesInvoicePayments.dateto := padatestr(edtDateTo.Text);
    frmWTRPSalesInvoicePayments.Sortby := rdgrpSortBy.itemindex;
    frmWTRPSalesInvoicePayments.OnlyUnPaid := chkbxOnlyShowUnPaid.checked;

    frmWTRPSalesInvoicePayments.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPSalesInvoicePayments.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPSalesInvoicePayments.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPSalesInvoicePayments.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSSalesInvoicePayments.rdgrpRepsClick(Sender: TObject);
begin
  case rdgrpReps.itemindex of
  0:  begin
        Rep := 0;
        cmbReps.clear;
        cmbReps.items.add('All Reps');
        cmbReps.itemindex := 0;
        cmbReps.enabled := false;
        cmbReps.color := clbtnFace;
        grpbxReps.enabled := false;
      end;
  1:  begin
        loadReps;
        cmbReps.Text := '';
        cmbReps.color := clWindow;
        cmbReps.enabled := true;
        grpbxReps.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSalesInvoicePayments.cmbRepsClick(Sender: TObject);
begin
  qryReps.First;
  qryReps.MoveBy(cmbReps.itemindex);
  Rep := qryReps.fieldbyname('Rep').AsInteger;
  enableok(self);

end;

procedure TfrmWTRSSalesInvoicePayments.LoadReps;
begin
  cmbReps.clear;
  with qryReps do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbReps.Items.Add(fieldbyname('Rep_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSSalesInvoicePayments.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      if chkbxOnlyShowUnPaid.checked then
        WriteString('Sales Invoice Payment Comparison', 'Only Show Paid', 'Y')
      else
        WriteString('Sales Invoice Payment Comparison', 'Only Show Paid', 'N');
      Free;
    end;
end;

end.
