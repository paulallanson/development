unit WTRSSOrderSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, QrCtrls;

type
  TfrmWTRSSOrderSchedule = class(TForm)
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
    procedure Button4Click(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  frmWTRSSOrderSchedule: TfrmWTRSSOrderSchedule;

implementation

uses allCommon, WTSrchCustomer, DateSelV5,
  WTRPSOrderSchedule;

{$R *.dfm}

procedure TfrmWTRSSOrderSchedule.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOrderSchedule.RunReport(const bPreview: boolean);
begin
  frmwtRPSOrderSchedule := TfrmwtRPSOrderSchedule.create(self);
  try

//  Check if any records
    frmwtRPSOrderSchedule.customer := customer;
    frmwtRPSOrderSchedule.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPSOrderSchedule.dateto := padatestr(edtDateTo.Text);
    frmwtRPSOrderSchedule.Sortby := rdgrpSortBy.itemindex;
    if frmwtRPSOrderSchedule.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPSOrderSchedule.qrlblCaption.Caption := frmwtRPSOrderSchedule.qrlblCaption.Caption;
    frmwtRPSOrderSchedule.qrlblDateRange.Caption := 'Fitting between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRPSOrderSchedule.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
        frmwtRPSOrderSchedule.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPSOrderSchedule.qrpDetails.PrinterSetup;
          if frmwtRPSOrderSchedule.qrpDetails.tag = 0 then
            frmwtRPSOrderSchedule.qrpDetails.Print;
      end;
  finally
    frmwtRPSOrderSchedule.free;
  end;
end;

procedure TfrmWTRSSOrderSchedule.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSSOrderSchedule.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSSOrderSchedule.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSSOrderSchedule.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOrderSchedule.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSSOrderSchedule.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOrderSchedule.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOrderSchedule.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
begin
  customer := 0;
  DateFrom := Date - 30;
  DateTo := Date + 30;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSOrderSchedule.btnPreviewClick(Sender: TObject);
begin
  runreport(true);
end;

end.
