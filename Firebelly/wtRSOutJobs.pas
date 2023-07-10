unit wtRSOutJobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, gtQrCtrls, ComCtrls, OleCtnrs;

type
  TfrmWTRSOutJobs = class(TForm)
    btnRun: TButton;
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
    rdgrpValueBy: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    procedure Button4Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  frmWTRSOutJobs: TfrmWTRSOutJobs;

implementation

uses WTRPOutQuote, allCommon, WTSrchCustomer, DateSelV5, WTRPOutJobs;

{$R *.dfm}

procedure TfrmWTRSOutJobs.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSOutJobs.btnRunClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSOutJobs.RunReport(const bPreview: boolean);
begin
  frmwtRPOutJobs := TfrmwtRPOutJobs.create(self);
  try

//  Check if any records
    frmwtRPOutJobs.customer := customer;
    frmwtRPOutJobs.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPOutJobs.dateto := padatestr(edtDateTo.Text);
    frmwtRPOutJobs.Sortby := rdgrpSortBy.itemindex;
    frmwtRPOutJobs.Valueby := rdgrpValueBy.itemindex;

    if frmwtRPOutJobs.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPOutJobs.qrlblCaption.Caption := frmwtRPOutJobs.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmwtRPOutJobs.qrlblDateRange.Caption := 'Fitting between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRpOutJobs.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmwtRPOutJobs.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPOutJobs.qrpDetails.PrinterSetup;
          if frmwtRPOutJobs.qrpDetails.tag = 0 then
            frmwtRPOutJobs.qrpDetails.Print;
      end;
  finally
    frmwtRPOutJobs.free;
  end;
end;

procedure TfrmWTRSOutJobs.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSOutJobs.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSOutJobs.enableOK(Sender: TObject);
begin
  btnRun.enabled := (edtCustomer.text <> '');
end;

procedure TfrmWTRSOutJobs.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSOutJobs.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSOutJobs.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSOutJobs.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSOutJobs.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  DateTo := Date + 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSOutJobs.Button1Click(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSOutJobs.Button2Click(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmwtRPOutJobs := TfrmwtRPOutJobs.create(self);
  try

//  Check if any records
    frmwtRPOutJobs.customer := customer;
    frmwtRPOutJobs.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPOutJobs.dateto := padatestr(edtDateTo.Text);
    frmwtRPOutJobs.Sortby := rdgrpSortBy.itemindex;
    frmwtRPOutJobs.Valueby := rdgrpValueBy.itemindex;

//  Check if any records exist
    reccount := frmwtRPOutJobs.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPOutJobs.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPOutJobs.Free;
    Application.ProcessMessages;
  end;
end;

end.
