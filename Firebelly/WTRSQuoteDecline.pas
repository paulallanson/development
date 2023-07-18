unit wtRSQuoteDecline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, QrCtrls, OleCtnrs,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSQuoteDecline = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpReason: TRadioGroup;
    rdgrpCustomer: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxReason: TGroupBox;
    grpbxCustomer: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    cmbReason: TComboBox;
    qryReason: TFDQuery;
    dtsReason: TDataSource;
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
    procedure rdgrpReasonClick(Sender: TObject);
    procedure cmbReasonClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    code, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadReason;
  public
    { Public declarations }
  end;

var
  frmWTRSQuoteDecline: TfrmWTRSQuoteDecline;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, WTRPQuoteReason,
  WTRPQuoteDecline;

{$R *.dfm}

procedure TfrmWTRSQuoteDecline.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSQuoteDecline.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSQuoteDecline.RunReport(const bPreview: boolean);
begin
  frmWTRPQuoteDecline := TfrmWTRPQuoteDecline.create(self);
  try

//  Check if any records
    frmWTRPQuoteDecline.customer := customer;
    frmWTRPQuoteDecline.code := code;
    frmWTRPQuoteDecline.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPQuoteDecline.dateto := padatestr(edtDateTo.Text);

    frmWTRPQuoteDecline.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPQuoteDecline.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPQuoteDecline.qrlblCaption.Caption := frmWTRPQuoteDecline.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmWTRPQuoteDecline.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPQuoteDecline.qrgCustomerHead.ForceNewPage := chkbxPageBreak.checked;

    if bPreview then
      begin
          frmWTRPQuoteDecline.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPQuoteDecline.qrpDetails.PrinterSetup;
          if frmWTRPQuoteDecline.qrpDetails.tag = 0 then
            frmWTRPQuoteDecline.qrpDetails.Print;
      end;
  finally
    frmWTRPQuoteDecline.free;
  end;
end;

procedure TfrmWTRSQuoteDecline.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSQuoteDecline.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSQuoteDecline.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (cmbReason.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.Enabled;
end;

procedure TfrmWTRSQuoteDecline.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuoteDecline.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSQuoteDecline.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSQuoteDecline.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuoteDecline.FormCreate(Sender: TObject);
var
  DateFrom: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(date);
end;

procedure TfrmWTRSQuoteDecline.rdgrpReasonClick(Sender: TObject);
begin
  case rdgrpReason.itemindex of
  0:  begin
        Code := 0;
        cmbReason.clear;
        cmbReason.items.add('All Reasons');
        cmbReason.itemindex := 0;
        cmbReason.enabled := false;
        cmbReason.color := clbtnFace;
        grpbxReason.enabled := false;
      end;
  1:  begin
        loadReason;
        cmbReason.Text := '';
        cmbReason.color := clWindow;
        cmbReason.enabled := true;
        grpbxReason.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSQuoteDecline.LoadReason;
begin
  cmbReason.clear;
  with qryReason do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbReason.Items.Add(fieldbyname('Inactve_Reason_Descr').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSQuoteDecline.cmbReasonClick(Sender: TObject);
begin
  qryReason.First;
  qryReason.MoveBy(cmbReason.itemindex);
  code := qryReason.fieldbyname('Inactive_Reason').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSQuoteDecline.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSQuoteDecline.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPQuoteDecline := TfrmWTRPQuoteDecline.create(self);
  try

    frmWTRPQuoteDecline.customer := customer;
    frmWTRPQuoteDecline.code := code;
    frmWTRPQuoteDecline.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPQuoteDecline.dateto := padatestr(edtDateTo.Text);

    frmWTRPQuoteDecline.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPQuoteDecline.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPQuoteDecline.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPQuoteDecline.Free;
    Application.ProcessMessages;
  end;

end;

end.
