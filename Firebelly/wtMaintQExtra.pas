unit wtMaintQExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtQuotesDM, StdCtrls, Buttons, DB, DBTables, CRControls, Spin,
  DBCtrls, ExtCtrls, QrCtrls;

type
  TfrmWTMaintQExtra = class(TForm)
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
    Label1: TLabel;
    edtUnitCost: TCREditMoney;
    Label2: TLabel;
    edtTotalCost: TCREditMoney;
    btnWorktops: TSpeedButton;
    edtUnitPrice: TEdit;
    chkbxDoNotDiscount: TCheckBox;
    procedure dblkpExtrasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure edtUnitPriceOldChange(Sender: TObject);
    procedure edtQuantityChange(Sender: TObject);
    procedure edtUnitCostChange(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure edtUnitPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnitPriceEnter(Sender: TObject);
    procedure edtUnitPriceExit(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TqexMode;
    FOldValue : string;
    FQExtra: TQExtra;
    procedure SetMode(const Value: TqexMode);
    procedure SetQExtra(const Value: TQExtra);
    procedure EnableOK(Sender: TObject);
    procedure ShowDetails;
    procedure GetTotalPrice;
    procedure GetTotalCost;
    procedure RefreshExtras;
    { Private declarations }
  public
    property Mode: TqexMode read FMode write SetMode;
    property QExtra: TQExtra read FQExtra write SetQExtra;
  end;

var
  frmWTMaintQExtra: TfrmWTMaintQExtra;

implementation

uses wtLUAddChgs, AllCommon, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQExtra }

procedure TfrmWTMaintQExtra.SetMode(const Value: TqexMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qexDelete);
  lblDelete.visible := (FMode = qexDelete);
end;

procedure TfrmWTMaintQExtra.SetQExtra(const Value: TQExtra);
begin
  FQExtra := Value;
end;

procedure TfrmWTMaintQExtra.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtUnitPrice.Text <> '') and
                    (edtUnitCost.Text <> '') and
                    (edtQuantity.Text <> '') and
                    (dblkpExtras.KeyValue <> 0);
end;

procedure TfrmWTMaintQExtra.dblkpExtrasClick(Sender: TObject);
var
  sText: string;
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
      edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
      edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
      chkbxDoNotDiscount.checked := (fieldbyname('Do_Not_Discount').asstring = 'Y');
    end;
  EnableOK(self);
end;

procedure TfrmWTMaintQExtra.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qexAdd     : Caption := 'Add an extra charge';
    qexChange  : Caption := 'Change an extra charge';
    qexDelete  : Caption := 'Delete an extra charge';
    end;  { case }
    if Mode = qexAdd then
      sTemp := ' New extra charge '
    else
      sTemp := ' extra charge ' + IntToStr(QExtra.Parent.DbKey) + ' ';

    RefreshExtras;
    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQExtra.ShowDetails;
begin
  if Mode <> qexAdd then
  begin
    dblkpExtras.keyvalue := QExtra.extra;
    chkbxDoNotDiscount.checked := QExtra.DoNotDiscount;
    edtunitCost.text := formatfloat('0.00',QExtra.UnitCost);
    edtunitPrice.text := formatfloat('0.00',QExtra.UnitPrice);
    edtQuantity.text := formatfloat('0.00',QExtra.Quantity);
    GetTotalPrice;
  end
  else
  begin
    chkbxDoNotDiscount.checked := false;
    edtunitCost.text := '0.00';
    edtunitPrice.text := '0.00';
    edtQuantity.text := '1.00';
    edtTotalPrice.Text := '0.00';
  end;
end;

procedure TfrmWTMaintQExtra.GetTotalCost;
var
  rUnitCost, rTotal: real;
  rQuantity: real;
begin
  try
    rUnitCost := strtofloat(edtUnitCost.text);
  except
    rUnitCost := 0.00;
  end;

  try
    rQuantity := strtofloat(edtQuantity.text);
  except
    rQuantity := 1.00;
  end;

  rTotal := rQuantity*rUnitCost;
  edtTotalCost.text := formatfloat('0.00',rTotal);
  enableOK(self);
end;

procedure TfrmWTMaintQExtra.GetTotalPrice;
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
    rQuantity := 1.00;
  end;

  rTotal := rQuantity*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self);
end;

procedure TfrmWTMaintQExtra.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  QExtra.DoNotDiscount := chkbxDoNotDiscount.Checked;
  QExtra.Extra := dblkpExtras.KeyValue;
  QExtra.ExtraDesc := dblkpExtras.Text;
  QExtra.Quantity := strtofloat(edtQuantity.text);
  QExtra.UnitCost := strtofloat(edtUnitCost.text);
  QExtra.UnitPrice := strtofloat(edtUnitPrice.text);
  if Mode = qexAdd then
  begin
    QExtra.QExNumber := QExtra.Parent.Extras.Count + 1;
    QExtra.Parent.Extras.Add(QExtra);
    QExtra.PriceUnit := qryOneExtra.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = qexDelete then
  begin
    inx := QExtra.Parent.Extras.IndexOf(QExtra.QExNumber);
    QExtra.Parent.Extras.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQExtra.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQExtra.edtUnitPriceOldChange(Sender: TObject);
begin
  GetTotalPrice;
  enableok(self);
end;

procedure TfrmWTMaintQExtra.edtQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
  GetTotalCost;
  enableok(self);
end;

procedure TfrmWTMaintQExtra.edtUnitCostChange(Sender: TObject);
begin
  GetTotalCost;
  enableok(self);
end;

procedure TfrmWTMaintQExtra.btnWorktopsClick(Sender: TObject);
begin
  frmWTLUAddChgs := TfrmWTLUAddChgs.create(self);
  try
    frmWTLUAddChgs.showmodal;
  finally
    frmWTLUAddChgs.free;
  end;

  RefreshExtras;
end;

procedure TfrmWTMaintQExtra.RefreshExtras;
begin
  with qryExtras do
    begin
      close;
      parambyname('Extra_Charge').asinteger := QExtra.Extra;
      open;
    end;
end;

procedure TfrmWTMaintQExtra.edtUnitPriceKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmWTMaintQExtra.edtUnitPriceEnter(Sender: TObject);
begin
  if Sender is TEdit then
    FOldValue := (Sender as TEdit).Text;
end;

procedure TfrmWTMaintQExtra.edtUnitPriceExit(Sender: TObject);
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

procedure TfrmWTMaintQExtra.edtUnitPriceChange(Sender: TObject);
begin
  GetTotalPrice;
  enableok(self);
end;

end.
