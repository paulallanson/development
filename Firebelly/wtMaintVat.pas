unit wtMaintVat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, CRControls, DB,
  DBTables;

type
  TfrmwtMaintVat = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    grpbxReverseCharge: TGroupBox;
    Label4: TLabel;
    chkbxReverseCharge: TCheckBox;
    edtVatRate: TCREditFloat;
    edtDescription: TEdit;
    edtVatCode: TEdit;
    edtInvoiceText: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryDelete: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    Label5: TLabel;
    edtRCVateRate: TCREditFloat;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkbxReverseChargeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: Integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmwtMaintVat: TfrmwtMaintVat;

implementation

uses UITypes, wtLUVat, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmwtMaintVat.btnOKClick(Sender: TObject);
begin
  if chkbxReverseCharge.Checked and (edtInvoiceText.text = '') then
    begin
      MessageDlg('Invoice text is required if VAT is a Reverse Charge', mtError, [mbAbort], 0);
      edtInvoiceText.SetFocus;
      exit;
    end;

  SaveToDB;
  
  close;
end;

procedure TfrmwtMaintVat.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmwtMaintVat.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmwtMaintVat.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;
      
      edtVATRate.Text := '';
      edtDescription.Text := '';
      edtVATCode.Text := '';
      edtInvoiceText.Text := '';
      edtRCVateRate.Text := '0.00';
      chkbxReverseCharge.Checked := false;
      chkbxInactive.Checked := false;
    end
  else
    with frmwtLUVat.qryVAT do
      begin
        iCode := fieldbyname('Vat').asinteger;

        edtVATRate.Text := formatfloat('0.000',fieldbyname('Vat_Rate').asfloat);
        edtDescription.Text := fieldbyname('Description').asstring;
        edtVATCode.Text := fieldbyname('Vat_Code').asstring;
        edtInvoiceText.Text := fieldbyname('Invoice_Text').asstring;
        edtRCVateRate.Text := formatfloat('0.000',fieldbyname('Reverse_Charge_Vat_Rate').asfloat);
        chkbxReverseCharge.Checked := (fieldbyname('Reverse_Charge').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmwtMaintVat.chkbxReverseChargeClick(Sender: TObject);
begin
  grpbxReverseCharge.Enabled := (Sender as TCheckBox).checked;
  if not (Sender as TCheckBox).checked then
    edtInvoiceText.Text := '';
end;

procedure TfrmwtMaintVat.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('VAT').asinteger := iCode;

      parambyname('Vat_Rate').asfloat := strtofloat(edtVATRate.Text);
      parambyname('Description').asstring := edtDescription.Text;
      parambyname('Vat_Code').asstring := edtVATCode.Text;
      parambyname('Invoice_Text').asstring := edtInvoiceText.Text;
      parambyname('Reverse_Charge_Vat_Rate').asfloat := strtofloat(edtRCVateRate.Text);

      if chkbxReverseCharge.Checked then
        ParamByName('Reverse_Charge').asstring := 'Y'
      else
        ParamByName('Reverse_Charge').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmwtMaintVat.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
    with qryAdd do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Vat').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmwtMaintVat.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Vat ' +
            '(Vat, Vat_Rate, Description) ' +
            'VALUES(0, 0.00, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmwtMaintVat.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Vat Where Vat = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmwtMaintVat.FormShow(Sender: TObject);
begin
  edtVatRate.SetFocus;
end;

end.
