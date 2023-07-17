unit wtRSOutQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, QrCtrls, ComCtrls, OleCtnrs, DB,
  DBTables;

type
  TfrmWTRSOutQuote = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpContacts: TRadioGroup;
    rdgrpCustomer: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxContacts: TGroupBox;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    cmbContacts: TComboBox;
    Label3: TLabel;
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
  frmWTRSOutQuote: TfrmWTRSOutQuote;

implementation

uses WTRPOutQuote, allCommon, WTSrchCustomer, DateSelV5;

{$R *.dfm}

procedure TfrmWTRSOutQuote.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSOutQuote.btnPrintClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmwtRPOutQuote := TfrmwtRPOutQuote.create(self);
  try

    frmwtRPOutQuote.customer := customer;
    frmwtRPOutQuote.Operator := Operator;
    frmwtRPOutQuote.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPOutQuote.dateto := padatestr(edtDateTo.Text);

    frmwtRPOutQuote.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmwtRPOutQuote.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPOutQuote.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPOutQuote.Free;
    Application.ProcessMessages;
  end;

end;

procedure TfrmWTRSOutQuote.RunReport(const bPreview: boolean);
begin
  frmwtRPOutQuote := TfrmwtRPOutQuote.create(self);
  try

//  Check if any records
    frmwtRPOutQuote.customer := customer;
    frmwtRPOutQuote.Operator := Operator;
    frmwtRPOutQuote.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPOutQuote.dateto := padatestr(edtDateTo.Text);

    frmwtRPOutQuote.CustomerCategory := rdgrpCategory.itemindex;

    if frmwtRPOutQuote.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPOutQuote.qrlblCaption.Caption := frmwtRPOutQuote.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmwtRPOutQuote.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    if bPreview then
      begin
          frmwtRPOutQuote.qrpDetails.Preview;
      end
    else
      begin
        frmwtRPOutQuote.qrpDetails.PrinterSetup;
        if frmwtRPOutQuote.qrpDetails.tag = 0 then
            frmwtRPOutQuote.qrpDetails.Print;
      end;
  finally
    frmwtRPOutQuote.free;
  end;
end;

procedure TfrmWTRSOutQuote.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSOutQuote.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSOutQuote.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '') and
                    (cmbContacts.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.Enabled := btnPreview.Enabled;
end;

procedure TfrmWTRSOutQuote.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSOutQuote.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSOutQuote.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSOutQuote.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSOutQuote.FormCreate(Sender: TObject);
var
  DateFrom: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(date);
end;

procedure TfrmWTRSOutQuote.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSOutQuote.rdgrpContactsClick(Sender: TObject);
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

procedure TfrmWTRSOutQuote.LoadOfficeContacts;
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

procedure TfrmWTRSOutQuote.cmbContactsClick(Sender: TObject);
begin
  qryContacts.First;
  qryContacts.MoveBy(cmbContacts.itemindex);
  Operator := qryContacts.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

end.
