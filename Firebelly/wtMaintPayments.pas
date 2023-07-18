unit wtMaintPayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, QrCtrls, AllCommon,
  CRControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintPayments = class(TForm)
    lblName: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    dblkpPaymentMethod: TDBLookupComboBox;
    qryPaymentMethod: TFDQuery;
    dtsPaymentMethod: TDataSource;
    edtDate: TEdit;
    btnDate: TBitBtn;
    edtPaymentDescription: TEdit;
    edtPaidAmount: TCREditMoney;
    qryAdd: TFDQuery;
    qryUpdate: TFDQuery;
    qryGetLast: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
  private
    FfunctionMode: string;
    FSalesOrder: integer;
    FSalesInvoice: integer;
    procedure SetfunctionMode(const Value: string);
    procedure SetSalesInvoice(const Value: integer);
    procedure SetSalesOrder(const Value: integer);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure SaveToDB;
    function GetLastKey: integer;
    { Private declarations }
  public
    bOK: boolean;
    iCode: integer;
    Payment: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property SalesInvoice: integer read FSalesInvoice write SetSalesInvoice;
  end;

var
  frmWTMaintPayments: TfrmWTMaintPayments;

implementation

uses wtLUPayments, DateSelV5;

{$R *.dfm}

{ TfrmWTMaintReps }

procedure TfrmWTMaintPayments.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintPayments.btnOKClick(Sender: TObject);
begin
  SaveToDB;

  bOK := true;
end;

procedure TfrmWTMaintPayments.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtDate.text <> '') AND
                    (edtPaidAmount.text <> '') AND
                    (edtPaymentDescription.text <> '') AND
                    (dblkpPaymentMethod.KeyValue <> 0);
end;

procedure TfrmWTMaintPayments.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintPayments.SetSalesInvoice(const Value: integer);
begin
  FSalesInvoice := Value;
end;

procedure TfrmWTMaintPayments.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TfrmWTMaintPayments.FormActivate(Sender: TObject);
begin
  with qryPaymentMethod do
    begin
      close;
      open;
    end;

  if FunctionMode = 'A' then
    begin
      edtDate.Text := padatestr(date);

      edtPaidAmount.Text := '0.00';
      edtPaymentDescription.Text := '';
    end
  else
    with frmWTLUPayments.qryPayments do
      begin
        iCode := fieldbyname('Payment').asinteger;

        edtDate.Text := padatestr(fieldbyname('Payment_Date').asdatetime);

        edtPaidAmount.Text := formatfloat('0.00',fieldbyname('Paid_Amount').asfloat);
        dblkpPaymentMethod.keyvalue := fieldbyname('Payment_Method').asinteger;
        edtPaymentDescription.Text := fieldbyname('Payment_Description').asstring;
      end;

  EnableOK(self);
end;

procedure TfrmWTMaintPayments.edtDateExit(Sender: TObject);
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

procedure TfrmWTMaintPayments.btnDateClick(Sender: TObject);
var
  tempDate: string;
  dtTemp: TDateTime;
begin
  if trim(edtDate.Text) = '' then
    begin
      dtTemp := date + 1;
      tempdate := padateStr(dtTemp);
    end
  else
    tempdate := edtDate.text;

  edtDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintPayments.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintPayments.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Payment_Description').asstring := edtPaymentDescription.Text;
          parambyname('Paid_Amount').asfloat := strtofloat(edtPaidAmount.text);
          parambyname('Payment_Date').asdatetime := padatestr(edtDate.text);
          parambyname('Payment_Method').asinteger := dblkpPaymentMethod.keyvalue;

          parambyname('Sales_Order').AsInteger := SalesOrder;

          if SalesInvoice = 0 then
            parambyname('Sales_Invoice').clear
          else
            parambyname('Sales_Invoice').AsInteger := SalesInvoice;
          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('Payment').asinteger := iCode;

          parambyname('Payment_Description').asstring := edtPaymentDescription.Text;
          parambyname('Paid_Amount').asfloat := strtofloat(edtPaidAmount.text);
          parambyname('Payment_Date').asdatetime := padatestr(edtDate.text);
          parambyname('Payment_Method').asinteger := dblkpPaymentMethod.keyvalue;

          parambyname('Sales_Order').AsInteger := SalesOrder;

          if SalesInvoice = 0 then
            parambyname('Sales_Invoice').clear
          else
            parambyname('Sales_Invoice').AsInteger := SalesInvoice;
          ExecSQL;
        end;
    end;
  end;
end;

function TfrmWTMaintPayments.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Last_Payment').AsInteger;
    end;
end;


end.
