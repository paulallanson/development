unit wtMaintDiscounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, CRControls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtMaintDiscounts = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    Label2: TLabel;
    edtDiscountLabel: TEdit;
    edtAmount: TCREditFloat;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    dblkpDiscountType: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmwtMaintDiscounts: TfrmwtMaintDiscounts;

implementation

uses wtLUDiscounts;

{$R *.dfm}

procedure TfrmwtMaintDiscounts.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmwtMaintDiscounts.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmwtMaintDiscounts.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtDiscountLabel.Text) <> '') and
                    (trim(dblkpDiscountType.Text) <> '')and
                    (trim(edtAmount.Text) <> '');
end;

procedure TfrmwtMaintDiscounts.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDiscountLabel.Text := '';
      dblkpDiscountType.text := '';
      edtAmount.Text := '0.00';
      chkbxInactive.Checked := false;

    end
  else
    with frmWtLUDiscounts.qryDiscounts do
      begin
        iCode := fieldbyname('Discount').asinteger;

        edtDiscountLabel.Text := fieldbyname('Discount_Label').asstring;
        dblkpDiscountType.text := fieldbyname('Discount_Type').asstring;
        edtAmount.Text := formatfloat('0.00',fieldbyname('Amount').asfloat);

        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmwtMaintDiscounts.SaveToDB;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Discount_Label').asstring := edtDiscountLabel.Text;
          parambyname('Discount_Type').asstring := dblkpDiscountType.text;
          parambyname('Amount').asfloat := StrToFloatDef(edtAmount.Text, 0, FormatSettings);

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('Discount').asinteger := iCode;

          parambyname('Discount_Label').asstring := edtDiscountLabel.Text;
          parambyname('Discount_Type').asstring := dblkpDiscountType.text;
          parambyname('Amount').asfloat := StrToFloatDef(edtAmount.Text, 0, FormatSettings);

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmwtMaintDiscounts.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Discount').AsInteger;
    end;
end;

end.
