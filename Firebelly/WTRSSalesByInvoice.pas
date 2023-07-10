unit WTRSSalesbyInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, gtQrCtrls, OleCtnrs, DB,
  DBTables;

type
  TfrmWTRSSalesbyInvoice = class(TForm)
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
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadReps;
  public
    { Public declarations }
  end;

var
  frmWTRSSalesbyInvoice: TfrmWTRSSalesbyInvoice;

implementation

uses WTSrchCustomer, WTRPSalesbyInvoice, Allcommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTRSSalesbyInvoice.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSalesbyInvoice.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSalesbyInvoice.RunReport(const bPreview: boolean);
begin
  frmWTRPSalesbyInvoice := TfrmWTRPSalesbyInvoice.create(self);
  try

//  Check if any records
    frmWTRPSalesbyInvoice.customer := customer;
    frmWTRPSalesbyInvoice.rep := rep;
    frmWTRPSalesbyInvoice.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSalesbyInvoice.dateto := padatestr(edtDateTo.Text);
    frmWTRPSalesbyInvoice.Sortby := rdgrpSortBy.itemindex;

    frmWTRPSalesbyInvoice.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPSalesbyInvoice.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPSalesbyInvoice.qrlblCaption.Caption := frmWTRPSalesbyInvoice.qrlblCaption.Caption;
    frmWTRPSalesbyInvoice.qrlblDateRange.Caption := 'Invoiced between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPSalesbyInvoice.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmWTRPSalesbyInvoice.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPSalesbyInvoice.qrpDetails.PrinterSetup;
          if frmWTRPSalesbyInvoice.qrpDetails.tag = 0 then
            frmWTRPSalesbyInvoice.qrpDetails.Print;
      end;
  finally
    frmWTRPSalesbyInvoice.free;
  end;
end;

procedure TfrmWTRSSalesbyInvoice.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSSalesbyInvoice.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSSalesbyInvoice.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (cmbReps.Text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.Enabled;
end;

procedure TfrmWTRSSalesbyInvoice.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSalesbyInvoice.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSSalesbyInvoice.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSalesbyInvoice.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSalesbyInvoice.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
begin
  customer := 0;
  rep := 0;
  DateFrom := Date - 30;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSalesbyInvoice.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSalesbyInvoice.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPSalesbyInvoice := TfrmWTRPSalesbyInvoice.create(self);
  try

//  Check if any records
    frmWTRPSalesbyInvoice.customer := customer;
    frmWTRPSalesbyInvoice.rep := rep;
    frmWTRPSalesbyInvoice.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSalesbyInvoice.dateto := padatestr(edtDateTo.Text);
    frmWTRPSalesbyInvoice.Sortby := rdgrpSortBy.itemindex;

    frmWTRPSalesbyInvoice.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPSalesbyInvoice.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPSalesbyInvoice.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPSalesbyInvoice.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSSalesbyInvoice.rdgrpRepsClick(Sender: TObject);
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

procedure TfrmWTRSSalesbyInvoice.cmbRepsClick(Sender: TObject);
begin
  qryReps.First;
  qryReps.MoveBy(cmbReps.itemindex);
  Rep := qryReps.fieldbyname('Rep').AsInteger;
  enableok(self);

end;

procedure TfrmWTRSSalesbyInvoice.LoadReps;
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

end.
