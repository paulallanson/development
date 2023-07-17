unit WTRSJobValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtnrs, QrCtrls;

type
  TfrmWTRSJobValue = class(TForm)
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
    chkbxPageBreak: TCheckBox;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnPreview: TButton;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  frmWTRSJobValue: TfrmWTRSJobValue;

implementation

uses WTRPJobValue, allCommon, WTSrchCustomer, DateSelV5;

{$R *.dfm}

procedure TfrmWTRSJobValue.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSJobValue.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSJobValue.RunReport(const bPreview: boolean);
begin
  frmwtRPJobValue := TfrmwtRPJobValue.create(self);
  try

//  Check if any records
    frmwtRPJobValue.customer := customer;
    frmwtRPJobValue.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPJobValue.dateto := padatestr(edtDateTo.Text);
    if frmwtRPJobValue.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPJobValue.qrlblCaption.Caption := frmwtRPJobValue.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmwtRPJobValue.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;

    frmwtRPJobValue.qrgCustomerHead.ForceNewPage := chkbxPageBreak.checked;

    if bPreview then
      begin
        frmwtRPJobValue.qrpDetails.Preview;
      end
    else
      begin
        frmwtRPJobValue.qrpDetails.PrinterSetup;
        if frmwtRPJobValue.qrpDetails.tag = 0 then
            frmwtRPJobValue.qrpDetails.Print;
      end;
  finally
    frmwtRPJobValue.free;
  end;
end;

procedure TfrmWTRSJobValue.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSJobValue.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSJobValue.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSJobValue.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSJobValue.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSJobValue.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSJobValue.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSJobValue.FormCreate(Sender: TObject);
var
  DateFrom: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(date);
end;

procedure TfrmWTRSJobValue.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPJobValue := TfrmWTRPJobValue.create(self);
  try

    frmwtRPJobValue.customer := customer;
    frmwtRPJobValue.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPJobValue.dateto := padatestr(edtDateTo.Text);

//  Check if any records exist
    reccount := frmwtRPJobValue.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPJobValue.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPJobValue.Free;
    Application.ProcessMessages;
  end;

end;

procedure TfrmWTRSJobValue.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

end.
