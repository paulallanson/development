unit wtMaintJExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtJobsDM, StdCtrls, Buttons, DB, DBTables, CRControls, Spin,
  DBCtrls, ExtCtrls, gtQrCtrls;

type
  TfrmWTMaintJExtra = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryExtras: TQuery;
    dtsExtra: TDataSource;
    qryOneExtra: TQuery;
    pnlDetails: TPanel;
    dblkpExtras: TDBLookupComboBox;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    edtTotalPrice: TCREditMoney;
    Label7: TLabel;
    lblDelete: TLabel;
    edtQuantity: TCREditFloat;
    btnWorktops: TSpeedButton;
    edtUnitPrice: TEdit;
    chkbxDoNotDiscount: TCheckBox;
    procedure dblkpExtrasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
    procedure edtQuantityChange(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure edtUnitPriceEnter(Sender: TObject);
    procedure edtUnitPriceExit(Sender: TObject);
    procedure edtUnitPriceKeyPress(Sender: TObject; var Key: Char);
  private
    FActivated: boolean;
    FMode: TjexMode;
    FJExtra: TJExtra;
    FOldValue: string;
    procedure SetMode(const Value: TjexMode);
    procedure EnableOK(Sender: TObject);
    procedure ShowDetails;
    procedure GetTotalPrice;
    procedure SetJExtra(const Value: TJExtra);
    procedure RefreshExtras;
    { Private declarations }
  public
    property Mode: TjexMode read FMode write SetMode;
    property JExtra: TJExtra read FJExtra write SetJExtra;
  end;

var
  frmWTMaintJExtra: TfrmWTMaintJExtra;

implementation

uses wtLUAddChgs, AllCommon, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQExtra }

procedure TfrmWTMaintJExtra.SetMode(const Value: TjexMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> jexDelete);
  lblDelete.visible := (FMode = jexDelete);
end;

procedure TfrmWTMaintJExtra.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtUnitPrice.Text <> '') and
                    (edtQuantity.Text <> '') and
                    (dblkpExtras.KeyValue <> 0);
end;

procedure TfrmWTMaintJExtra.dblkpExtrasClick(Sender: TObject);
var
  stext: string;
begin
  with qryOneExtra do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Extra_Charge').asinteger := dblkpExtras.KeyValue;
      open;
      edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
      chkbxDoNotDiscount.checked := (fieldbyname('Do_Not_Discount').asstring = 'Y');
    end;
  EnableOK(self);
end;

procedure TfrmWTMaintJExtra.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jexAdd     : Caption := 'Add an extra charge';
    jexChange  : Caption := 'Change an extra charge';
    jexDelete  : Caption := 'Delete an extra charge';
    end;  { case }
    if Mode = jexAdd then
      sTemp := ' New extra charge '
    else
      sTemp := ' extra charge ' + IntToStr(jExtra.Parent.DbKey) + ' ';

    RefreshExtras;
    
    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintJExtra.ShowDetails;
begin
  if Mode <> jexAdd then
  begin
    dblkpExtras.keyvalue := jExtra.extra;
    chkbxDoNotDiscount.checked := jExtra.DoNotDiscount;
    edtunitPrice.text := formatfloat('0.00',jExtra.UnitPrice);
    edtQuantity.text := formatfloat('0.00',jExtra.Quantity);
    GetTotalPrice;
  end
  else
  begin
    chkbxDoNotDiscount.checked := false;
    edtunitPrice.text := '0.00';
    edtQuantity.text := '1.00';
    edtTotalPrice.Text := '0.00';
  end;
end;

procedure TfrmWTMaintJExtra.GetTotalPrice;
var
  rUnitPrice, rTotal: real;
  rQuantity: real;
begin
  try
    rUnitPrice := strtofloat(edtUnitPrice.text);
  except
    rUnitPrice := 0.00;
  end;

  try
    rQuantity := strtofloat(edtQuantity.text);
  except
    rQuantity := 1;
  end;

  rTotal := rQuantity*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self);
end;

procedure TfrmWTMaintJExtra.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  JExtra.DoNotDiscount := chkbxDoNotDiscount.Checked;
  jExtra.Extra := dblkpExtras.KeyValue;
  jExtra.ExtraDesc := dblkpExtras.Text;
  jExtra.Quantity := strtofloat(edtQuantity.text);
  jExtra.UnitPrice := strtofloat(edtUnitPrice.text);
  if Mode = jexAdd then
  begin
    jExtra.jExNumber := jExtra.Parent.Extras.Count + 1;
    jExtra.Parent.Extras.Add(jExtra);
    jExtra.PriceUnit := qryOneExtra.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = jexDelete then
  begin
    inx := jExtra.Parent.Extras.IndexOf(jExtra.jExNumber);
    jExtra.Parent.Extras.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJExtra.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJExtra.edtUnitPriceChange(Sender: TObject);
begin
  GetTotalPrice;
  enableok(self);
end;

procedure TfrmWTMaintJExtra.SetJExtra(const Value: TJExtra);
begin
  FJExtra := Value;
end;

procedure TfrmWTMaintJExtra.edtQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
  enableok(self);
end;

procedure TfrmWTMaintJExtra.RefreshExtras;
begin
  with qryExtras do
    begin
      close;
      parambyname('Extra_Charge').asinteger := JExtra.Extra;
      open;
    end;
end;

procedure TfrmWTMaintJExtra.btnWorktopsClick(Sender: TObject);
begin
  frmWTLUAddChgs := TfrmWTLUAddChgs.create(self);
  try
    frmWTLUAddChgs.showmodal;
  finally
    frmWTLUAddChgs.free;
  end;

  RefreshExtras;
end;

procedure TfrmWTMaintJExtra.edtUnitPriceEnter(Sender: TObject);
begin
  if Sender is TEdit then
    FOldValue := (Sender as TEdit).Text;
end;

procedure TfrmWTMaintJExtra.edtUnitPriceExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TEdit).Text);
  if TempStr = 'X' then
  begin
    (Sender as TEdit).Text := FOldValue;
    (Sender as TEdit).SetFocus;
  end
  else
    (Sender as TEdit).Text := TempStr;
  EnableOK(Self);
end;

procedure TfrmWTMaintJExtra.edtUnitPriceKeyPress(Sender: TObject;
  var Key: Char);
var
  P, Q: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      begin
        P := Pos('.', Text);
        Q := Pos('-', Text);
      end
  else
    if Sender is TMemo then
      with Sender as TMemo do
        begin
          P := Pos('.', Text);
          Q := Pos('-', Text);
        end
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.': if P > 0 then Key := #0;
    '-': if Q > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
