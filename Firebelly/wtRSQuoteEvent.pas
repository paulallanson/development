unit wtRSQuoteEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtnrs, QrCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSQuoteEvent = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnExcel: TBitBtn;
    btnPreview: TButton;
    rdgrpCategory: TRadioGroup;
    rdgrpContacts: TRadioGroup;
    grpbxContacts: TGroupBox;
    Label3: TLabel;
    cmbContacts: TComboBox;
    qryContacts: TFDQuery;
    dtsReason: TDataSource;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rdgrpContactsClick(Sender: TObject);
    procedure cmbContactsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Code: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadContacts;
  public
    { Public declarations }
  end;

var
  frmWTRSQuoteEvent: TfrmWTRSQuoteEvent;

implementation

uses allCommon, DateSelV5, WTRPQuoteEvent;

{$R *.dfm}

procedure TfrmWTRSQuoteEvent.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSQuoteEvent.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSQuoteEvent.RunReport(const bPreview: boolean);
begin
  frmWTRPQuoteEvent := TfrmWTRPQuoteEvent.create(self);
  try

//  Check if any records
    frmWTRPQuoteEvent.Operator := code;
    frmWTRPQuoteEvent.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPQuoteEvent.dateto := padatestr(edtDateTo.Text);

    frmWTRPQuoteEvent.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPQuoteEvent.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPQuoteEvent.qrlblCaption.Caption := frmWTRPQuoteEvent.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmWTRPQuoteEvent.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;

    if bPreview then
      begin
          frmWTRPQuoteEvent.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPQuoteEvent.qrpDetails.PrinterSetup;
          if frmWTRPQuoteEvent.qrpDetails.tag = 0 then
            frmWTRPQuoteEvent.qrpDetails.Print;
      end;
  finally
    frmWTRPQuoteEvent.free;
  end;
end;

procedure TfrmWTRSQuoteEvent.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (cmbContacts.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSQuoteEvent.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuoteEvent.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSQuoteEvent.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSQuoteEvent.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSQuoteEvent.FormCreate(Sender: TObject);
var
  DateFrom: TDateTime;
begin
  DateFrom := Date - 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(date);
end;

procedure TfrmWTRSQuoteEvent.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPQuoteEvent := TfrmWTRPQuoteEvent.create(self);
  try

    frmWTRPQuoteEvent.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPQuoteEvent.dateto := padatestr(edtDateTo.Text);

//  Check if any records exist
    reccount := frmWTRPQuoteEvent.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPQuoteEvent.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPQuoteEvent.Free;
    Application.ProcessMessages;
  end;

end;

procedure TfrmWTRSQuoteEvent.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSQuoteEvent.rdgrpContactsClick(Sender: TObject);
begin
  case rdgrpContacts.itemindex of
  0:  begin
        Code := 0;
        cmbContacts.clear;
        cmbContacts.items.add('All Contacts');
        cmbContacts.itemindex := 0;
        cmbContacts.enabled := false;
        cmbContacts.color := clbtnFace;
        grpbxContacts.enabled := false;
      end;
  1:  begin
        loadContacts;
        cmbContacts.Text := '';
        cmbContacts.color := clWindow;
        cmbContacts.enabled := true;
        grpbxContacts.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSQuoteEvent.cmbContactsClick(Sender: TObject);
begin
  qryContacts.First;
  qryContacts.MoveBy(cmbContacts.itemindex);
  code := qryContacts.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSQuoteEvent.LoadContacts;
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

procedure TfrmWTRSQuoteEvent.FormActivate(Sender: TObject);
begin
  enableOK(self);
end;

end.
