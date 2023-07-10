unit wtMaintJUpstand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtJobsDM, StdCtrls, Buttons, CRControls, DBCtrls, DB,
  DBTables, Spin, ExtCtrls, gtQrCtrls;

type
  TfrmWTMaintJUpstand = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWorktops: TQuery;
    qryWTThickness: TQuery;
    dtsWorktops: TDataSource;
    dtsWTThickness: TDataSource;
    qryOneWTThickness: TQuery;
    pnlDetails: TPanel;
    Label1: TLabel;
    edtMaterial: TEdit;
    dblkpWorktop: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dblkpWTThickness: TDBLookupComboBox;
    edtUnitPrice: TCREditMoney;
    Label4: TLabel;
    edtDepth: TCREditInt;
    Label5: TLabel;
    Label6: TLabel;
    edtLength: TCREditInt;
    Label8: TLabel;
    spnQuantity: TSpinEdit;
    Label7: TLabel;
    edtTotalPrice: TCREditMoney;
    lblDelete: TLabel;
    Label9: TLabel;
    edtPolishPrice: TCREditMoney;
    Label10: TLabel;
    dblkpMaterialUse: TDBLookupComboBox;
    qryMaterialUse: TQuery;
    dtsMaterialUse: TDataSource;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    spnNoOfDepths: TSpinEdit;
    spnNoOfLengths: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    spnNoOfPieces: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure edtDepthChange(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FActivated: boolean;
    FMaterialType: string;
    FMaterial: integer;
    FWorktop: integer;
    FThickness: integer;
    FMode: TjelMode;
    FjUpstand: TjUpstand;
    FPolishPrice: currency;
    FMaterialUse: integer;
    FDepth: real;
    FPolishCost: currency;
    procedure ShowDetails;
    procedure SetMaterialType(const Value: string);
    procedure GetTotalPrice;
    procedure SetMaterial(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure GetUnitPrice;
    procedure SetjUpstand(const Value: TjUpstand);
    procedure SetMode(const Value: TjelMode);
    procedure SetPolishPrice(const Value: currency);
    procedure SetMaterialUse(const Value: integer);
    procedure SetDepth(const Value: real);
    procedure RefreshMaterialUse;
    procedure SetPolishCost(const Value: currency);
    { Private declarations }
  public
    property Depth: real read FDepth write SetDepth;
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property MaterialUse: integer read FMaterialUse write SetMaterialUse;
    property Mode: TjelMode read FMode write SetMode;
    property jUpstand: TjUpstand read FjUpstand write SetjUpstand;
    property Worktop: integer read FWorktop write SetWorktop;
    property Thickness: integer read FThickness write SetThickness;
    property PolishCost: currency read FPolishCost write SetPolishCost;
    property PolishPrice: currency read FPolishPrice write SetPolishPrice;
  end;

var
  frmWTMaintJUpstand: TfrmWTMaintJUpstand;

implementation

uses wtLUMaterialUse, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQUpstand }

procedure TfrmWTMaintJUpstand.SetMode(const Value: TjelMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> jelDelete);
  lblDelete.visible := (FMode = jelDelete);
end;

procedure TfrmWTMaintJUpstand.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jelAdd     : Caption := 'Add an upstand';
    jelChange  : Caption := 'Change an upstand';
    jelDelete  : Caption := 'Delete an upstand';
    end;  { case }
    if Mode = jelAdd then
      sTemp := ' New upstand '
    else
      sTemp := ' upstand ' + IntToStr(JUpstand.Parent.DbKey) + ' ';

    with qryWorktops do
      begin
        close;
        parambyname('Material_Type').asinteger := Material;
        open;
      end;

    RefreshMaterialUse;

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintJUpstand.ShowDetails;
begin
  if Mode <> jelAdd then
  begin
    edtMaterial.text := MaterialType;
    dblkpWorktop.keyvalue := JUpstand.worktop;
    dblkpMaterialUse.keyvalue := JUpstand.MaterialUse;

    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := JUpstand.Thickness;

    edtDepth.text := formatfloat('0',JUpstand.Depth);
    edtLength.text := formatfloat('0',JUpstand.Length);
    edtunitPrice.text := formatfloat('0.00',JUpstand.UnitPrice);
    edtPolishPrice.text := formatfloat('0.00',JUpstand.PolishPrice);
    spnQuantity.value := round(JUpstand.Quantity);
    spnNoOfPieces.value := JUpstand.TotalUpstandPieces;
    GetTotalPrice;
  end
  else
  begin
    edtMaterial.text := MaterialType;
    dblkpWorktop.keyvalue := Self.Worktop;
    dblkpMaterialUse.KeyValue := MaterialUse;
    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := Self.Thickness;
    if self.Depth <> 0 then
      edtDepth.text := formatfloat('0',self.Depth)
    else
      edtDepth.text := '';
    edtLength.text := '';

    if JUpstand.UnitPrice = 0 then
      GetUnitPrice
    else
      edtUnitPrice.Text := formatfloat('0.00',JUpstand.UnitPrice);

    edtPolishPrice.text := formatfloat('0.00',Self.PolishPrice);
    spnQuantity.value := 1;
    spnNoOfPieces.value := 1;
    edtTotalPrice.Text := '0.00';

    if Self.Depth <> 0 then
      edtLength.setfocus
    else
      edtdepth.setfocus;
  end;
end;

procedure TfrmWTMaintJUpstand.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWorktop.KeyValue <> 0) and
                    (edtDepth.text <> '') and
                    (edtLength.Text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpWTThickness.KeyValue <> 0);
end;

procedure TfrmWTMaintJUpstand.GetTotalPrice;
var
  rUnitPrice, rPolishPrice, rTotal: real;
  idepth,iLength,iQuantity, iNoLengths, iNoDepths: integer;
begin
  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rUnitPrice := strtofloat(edtUnitPrice.text);
  except
    rUnitPrice := 0.00;
  end;

  try
    rPolishPrice := strtofloat(edtPolishPrice.text);
  except
    rPolishPrice := 0.00;
  end;

  iQuantity := spnQuantity.value;

  iNoDepths := spnNoOfDepths.value;

  iNoLengths := spnNoOflengths.value;

  rTotal := (((idepth * iLength)/1000000)*iQuantity*rUnitPrice)+(((iLength/1000)*iNoLengths)*rPolishPrice*iQuantity)
                                                               +(((iDepth/1000)*iNoDepths)*rPolishPrice*iQuantity);
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintJUpstand.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintJUpstand.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  JUpstand.Material := FMaterial;
end;

procedure TfrmWTMaintJUpstand.dblkpWorktopClick(Sender: TObject);
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintJUpstand.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintJUpstand.GetUnitPrice;
var
  sText: string;
begin
  with qryOneWTThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
      parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
      open;
      edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
      JUpstand.PriceUnit := fieldbyname('Price_unit').asinteger;
    end;
end;

procedure TfrmWTMaintJUpstand.edtDepthChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJUpstand.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJUpstand.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  JUpstand.MaterialUse := dblkpMaterialUse.keyValue;
  JUpstand.MaterialUseDescr := dblkpMaterialUse.text;
  JUpstand.Worktop := dblkpWorktop.KeyValue;
  JUpstand.worktopDesc := dblkpWorktop.Text;
  JUpstand.thickness := dblkpWTThickness.keyvalue;
  JUpstand.thicknessDesc := dblkpWTThickness.Text;
  JUpstand.Depth := strtoint(edtDepth.text);
  JUpstand.Length := strtoint(edtLength.text);
  JUpstand.Quantity := spnQuantity.Value;
  JUpstand.UnitPrice := strtofloat(edtUnitPrice.text);
  JUpstand.PolishPrice := strtofloat(edtPolishPrice.text);
  JUpstand.NoOfDepths := spnNoOfDepths.Value;
  JUpstand.NoOfLengths := spnNoOfLengths.Value;
  JUpstand.TotalUpstandPieces := spnNoofPieces.value;

  if Mode = jelAdd then
  begin
    JUpstand.jENumber := (JUpstand.Parent.Upstands.Count + 1)+1000;
    JUpstand.Parent.Upstands.Add(JUpstand);
//    JUpstand.PriceUnit := qryOneWTThickness.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = jelDelete then
  begin
    inx := JUpstand.Parent.Upstands.IndexOf(JUpstand.jENumber);
    JUpstand.Parent.Upstands.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJUpstand.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintJUpstand.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintJUpstand.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintJUpstand.SetjUpstand(const Value: TjUpstand);
begin
  FjUpstand := Value;
end;

procedure TfrmWTMaintJUpstand.SetPolishPrice(const Value: currency);
begin
  FPolishPrice := Value;
end;

procedure TfrmWTMaintJUpstand.SetMaterialUse(const Value: integer);
begin
  FMaterialUse := Value;
end;

procedure TfrmWTMaintJUpstand.SetDepth(const Value: real);
begin
  FDepth := Value;
end;

procedure TfrmWTMaintJUpstand.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUMaterialUse := TfrmWTLUMaterialUse.create(self);
  try
    frmWTLUMaterialUse.showmodal;
  finally
    frmWTLUMaterialUse.free;
  end;

  RefreshMaterialUse;

end;

procedure TfrmWTMaintJUpstand.RefreshMaterialUse;
begin
  with qryMaterialUse do
    begin
      close;
      parambyname('Material_Use').AsInteger := JUpstand.MaterialUse;
      open;
    end;
end;

procedure TfrmWTMaintJUpstand.SetPolishCost(const Value: currency);
begin
  FPolishCost := Value;
end;

end.
