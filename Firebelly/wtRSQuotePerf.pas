unit wtRSQuotePerf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtnrs, gtQrCtrls, DB,
  DBTables;

type
  TfrmWTRSQuotePerf = class(TForm)
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
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnExcel: TBitBtn;
    btnPreview: TButton;
    rdgrpContacts: TRadioGroup;
    grpbxContacts: TGroupBox;
    Label3: TLabel;
    cmbContacts: TComboBox;
    qryContacts: TQuery;
    dtsContacts: TDataSource;
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
    procedure btnExcelClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rdgrpContactsClick(Sender: TObject);
    procedure cmbContactsClick(Sender: TObject);
  private
    operator, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadOfficeContacts;
  public
    { Public declarations }
  end;

var
  frmWTRSQuotePerf: TfrmWTRSQuotePerf;

implementation

uses WTRPQuotePerf, allCommon, WTSrchCustomer, DateSelV5;

{$R *.dfm}

procedure TfrmWTRSQuotePerf.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSQuotePerf.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSQuotePerf.RunReport(const bPreview: boolean);
begin
  frmwtRPQuotePerf := TfrmwtRPQuotePerf.create(self);
  try

//  Check if any records
    frmwtRPQuotePerf.customer := customer;
    frmwtRPQuotePerf.Operator := Operator;
    frmwtRPQuotePerf.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPQuotePerf.dateto := padatestr(edtDateTo.Text);

    frmwtRPQuotePerf.CustomerCategory := rdgrpCategory.itemindex;

    if frmwtRPQuotePerf.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPQuotePerf.qrlblCaption.Caption := frmwtRPQuotePerf.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmwtRPQuotePerf.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRPQuotePerf.qrgCustomerHead.ForceNewPage := chkbxPageBreak.checked;

    if bPreview then
      begin
          frmwtRPQuotePerf.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPQuotePerf.qrpDetails.PrinterSetup;
          if frmwtRPQuotePerf.qrpDetails.tag = 0 then
            frmwtRPQuotePerf.qrpDetails.Print;
      end;
  finally
    frmwtRPQuotePerf.free;
  end;
end;

procedure TfrmWTRSQuotePerf.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSQuotePerf.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSQuotePerf.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '') and
                    (cmbContacts.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSQuotePerf.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuotePerf.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSQuotePerf.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSQuotePerf.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuotePerf.FormCreate(Sender: TObject);
var
  DateFrom: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(date);
end;

procedure TfrmWTRSQuotePerf.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPQuotePerf := TfrmWTRPQuotePerf.create(self);
  try

    frmWTRPQuotePerf.customer := customer;
    frmWTRPQuotePerf.Operator := Operator;
    frmWTRPQuotePerf.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPQuotePerf.dateto := padatestr(edtDateTo.Text);

    frmwtRPQuotePerf.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPQuotePerf.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPQuotePerf.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPQuotePerf.Free;
    Application.ProcessMessages;
  end;

end;

procedure TfrmWTRSQuotePerf.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSQuotePerf.rdgrpContactsClick(Sender: TObject);
begin
  case rdgrpContacts.itemindex of
  0:  begin
        Operator := 0;
        cmbContacts.clear;
        cmbContacts.items.add('All Contacts');
        cmbContacts.itemindex := 0;
        cmbContacts.enabled := false;
        cmbContacts.color := clbtnFace;
        grpbxContacts.enabled := false;
      end;
  1:  begin
        loadOfficeContacts;
        cmbContacts.Text := '';
        cmbContacts.color := clWindow;
        cmbContacts.enabled := true;
        grpbxContacts.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTRSQuotePerf.cmbContactsClick(Sender: TObject);
begin
  qryContacts.First;
  qryContacts.MoveBy(cmbContacts.itemindex);
  Operator := qryContacts.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSQuotePerf.LoadOfficeContacts;
begin
  cmbContacts.clear;
  with qryContacts do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbContacts.Items.Add(fieldbyname('Operator_Name').asstring);
          next;
        end
    end;
end;


end.
