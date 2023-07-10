unit wtRSQuoteSalesLead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, gtQrCtrls, OleCtnrs,
  ComCtrls;

type
  TfrmWTRSQuoteSalesLead = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpLeadSource: TRadioGroup;
    rdgrpCustomer: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxLeadSource: TGroupBox;
    grpbxCustomer: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    cmbLeadSource: TComboBox;
    qryLeadSource: TQuery;
    dtsLeadSource: TDataSource;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    btnExcel: TButton;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    rdgrpCategory: TRadioGroup;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgrpLeadSourceClick(Sender: TObject);
    procedure cmbLeadSourceClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    code, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadLeadSource;
  public
    { Public declarations }
  end;

var
  frmWTRSQuoteSalesLead: TfrmWTRSQuoteSalesLead;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, WTRPQuoteSalesLead,
  wtLUSalesLead;

{$R *.dfm}

procedure TfrmWTRSQuoteSalesLead.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSQuoteSalesLead.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSQuoteSalesLead.RunReport(const bPreview: boolean);
begin
  frmwtRPQuoteSalesLead := TfrmwtRPQuoteSalesLead.create(self);
  try

//  Check if any records
    frmwtRPQuoteSalesLead.customer := customer;
    frmwtRPQuoteSalesLead.code := code;
    frmwtRPQuoteSalesLead.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPQuoteSalesLead.dateto := padatestr(edtDateTo.Text);

    frmwtRPQuoteSalesLead.CustomerCategory := rdgrpCategory.itemindex;

    if frmwtRPQuoteSalesLead.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPQuoteSalesLead.qrlblCaption.Caption := frmwtRPQuoteSalesLead.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmwtRPQuoteSalesLead.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRPQuoteSalesLead.qrgCustomerHead.ForceNewPage := chkbxPageBreak.checked;

    if bPreview then
      begin
          frmwtRPQuoteSalesLead.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPQuoteSalesLead.qrpDetails.PrinterSetup;
          if frmwtRPQuoteSalesLead.qrpDetails.tag = 0 then
            frmwtRPQuoteSalesLead.qrpDetails.Print;
      end;
  finally
    frmwtRPQuoteSalesLead.free;
  end;
end;

procedure TfrmWTRSQuoteSalesLead.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSQuoteSalesLead.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSQuoteSalesLead.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (cmbLeadSource.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.Enabled;
end;

procedure TfrmWTRSQuoteSalesLead.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuoteSalesLead.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSQuoteSalesLead.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSQuoteSalesLead.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuoteSalesLead.FormCreate(Sender: TObject);
var
  DateFrom: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(date);
end;

procedure TfrmWTRSQuoteSalesLead.rdgrpLeadSourceClick(Sender: TObject);
begin
  case rdgrpLeadSource.itemindex of
  0:  begin
        Code := 0;
        cmbLeadSource.clear;
        cmbLeadSource.items.add('All Sources');
        cmbLeadSource.itemindex := 0;
        cmbLeadSource.enabled := false;
        cmbleadSource.color := clbtnFace;
        grpbxLeadSource.enabled := false;
      end;
  1:  begin
        loadLeadSource;
        cmbLeadSource.Text := '';
        cmbleadSource.color := clWindow;
        cmbleadSource.enabled := true;
        grpbxleadSource.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSQuoteSalesLead.LoadLeadSource;
begin
  cmbLeadSOurce.clear;
  with qryLeadSource do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbLeadSource.Items.Add(fieldbyname('Sales_lead_source_descr').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSQuoteSalesLead.cmbLeadSourceClick(Sender: TObject);
begin
  qryLeadSource.First;
  qryLeadSource.MoveBy(cmbLeadSource.itemindex);
  code := qryLeadSource.fieldbyname('Sales_lead_source').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSQuoteSalesLead.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSQuoteSalesLead.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmwtRPQuoteSalesLead := TfrmwtRPQuoteSalesLead.create(self);
  try

    frmwtRPQuoteSalesLead.customer := customer;
    frmwtRPQuoteSalesLead.code := code;
    frmwtRPQuoteSalesLead.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPQuoteSalesLead.dateto := padatestr(edtDateTo.Text);

    frmwtRPQuoteSalesLead.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmwtRPQuoteSalesLead.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPQuoteSalesLead.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPQuoteSalesLead.Free;
    Application.ProcessMessages;
  end;

end;

end.
