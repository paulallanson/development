unit wtMaintJCutOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtJobsDM, StdCtrls, Buttons, Spin, CRControls, DBCtrls, DB, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtMaintJCutOut = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryEdgeType: TFDQuery;
    dtsEdgeType: TDataSource;
    qryCOThickness: TFDQuery;
    qryOneCOThickness: TFDQuery;
    dtsCOThickness: TDataSource;
    pnlDetails: TPanel;
    Label1: TLabel;
    edtMaterial: TEdit;
    dblkpEdgeType: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dblkpCutOut: TDBLookupComboBox;
    spnQuantity: TSpinEdit;
    Label8: TLabel;
    Label4: TLabel;
    edtUnitPrice: TCREditMoney;
    edtTotalPrice: TCREditMoney;
    Label7: TLabel;
    lblDelete: TLabel;
    btnCutOuts: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dblkpCutOutClick(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure btnCutOutsClick(Sender: TObject);
  private
    FActivated: boolean;
    FMaterial: integer;
    FMaterialType: string;
    FMode: TjcoMode;
    FJCutOut: TJCutOut;
    FEdgeType: integer;
    procedure SetMode(const Value: TjcoMode);
    procedure EnableOK(Sender: TObject);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure GetTotalPrice;
    procedure ShowDetails;
    procedure SetJCutOut(const Value: TJCutOut);
    procedure SetEdgeType(const Value: integer);
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TjcoMode read FMode write SetMode;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property JCutOut: TJCutOut read FJCutOut write SetJCutOut;
  end;

var
  frmWtMaintJCutOut: TfrmWtMaintJCutOut;

implementation

uses wtLUCutOutDetails, wtDataModule;

{$R *.dfm}

{ TfrmWtMaintQCutOut }

procedure TfrmWtMaintJCutOut.SetMode(const Value: TjcoMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> jcoDelete);
  lblDelete.visible := (FMode = jcoDelete);
end;

procedure TfrmWtMaintJCutOut.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpCutOut.text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpEdgeType.KeyValue <> 0);
end;

procedure TfrmWtMaintJCutOut.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  JCutOut.Material := FMaterial;
end;

procedure TfrmWtMaintJCutOut.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWtMaintJCutOut.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jcoAdd     : Caption := 'Add a cutout';
    jcoChange  : Caption := 'Change a cutout';
    jcoDelete  : Caption := 'Delete a cutout';
    end;  { case }
    if Mode = jcoAdd then
      sTemp := ' New cutout '
    else
      sTemp := ' cutout ' + IntToStr(JCutOut.Parent.DbKey) + ' ';

    with qryEdgeType do
      begin
        close;
        open;
      end;

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWtMaintJCutOut.ShowDetails;
begin
  if Mode <> jcoAdd then
  begin
    edtMaterial.text := MaterialType;
    dblkpEdgeType.keyvalue := JCutOut.EdgeType;

    with qryCOThickness do
      begin
        close;
        parambyname('Material_Type').asinteger := Material;
        parambyname('Edge_Type').asinteger := JCutOut.EdgeType;
        open;
      end;
    dblkpCutOut.keyvalue := JCutOut.Cutout;

    edtunitPrice.text := formatfloat('0.00',JCutOut.UnitPrice);
    spnQuantity.value := round(JCutOut.Quantity);
    GetTotalPrice;
  end
  else
  begin
    edtMaterial.text := MaterialType;
    dblkpEdgeType.keyvalue := Self.EdgeType;
    dblkpEdgeTypeClick(self);
    edtunitPrice.text := '0.00';
    spnQuantity.value := 1;
    edtTotalPrice.Text := '0.00';
  end;
end;

procedure TfrmWtMaintJCutOut.GetTotalPrice;
var
  rUnitPrice, rTotal: real;
  iQuantity: integer;
begin
  try
    rUnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
  except
    rUnitPrice := 0.00;
  end;

  iQuantity := spnQuantity.value;

  rTotal := iQuantity*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWtMaintJCutOut.dblkpEdgeTypeClick(Sender: TObject);
begin
  with qryCOThickness do
    begin
      close;
      parambyname('Material_type').asinteger := Material;
      parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
      open;
    end;
  enableOK(self);
end;

procedure TfrmWtMaintJCutOut.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  JCutOut.CutOut := dblkpCutOut.KeyValue;
  JCutOut.CutOutDesc := dblkpCutOut.Text;
  JCutOut.EdgeType := dblkpEdgeType.keyvalue;
  JCutOut.EdgeTypeDesc := dblkpEdgeType.Text;
  JCutOut.Quantity := spnQuantity.Value;
  JCutOut.UnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
  if Mode = jcoAdd then
  begin
    JCutOut.jCONumber := JCutOut.Parent.CutOuts.Count + 1;
    JCutOut.Parent.CutOuts.Add(JCutOut);
    JCutOut.PriceUnit := qryOneCOThickness.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = jcoDelete then
  begin
    inx := JCutOut.Parent.CutOuts.IndexOf(JCutOut.jCONumber);
    JCutOut.Parent.CutOuts.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWtMaintJCutOut.dblkpCutOutClick(Sender: TObject);
var
  sText: string;
begin
  with qryOneCOThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyName('Material_type').asinteger := Material;
      parambyName('cutout').asinteger := dblkpCutout.keyvalue;
      parambyName('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      open;
      edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
    end;
  GetTotalPrice;
  enableok(self);
end;

procedure TfrmWtMaintJCutOut.edtUnitPriceChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWtMaintJCutOut.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWtMaintJCutOut.SetJCutOut(const Value: TJCutOut);
begin
  FJCutOut := Value;
end;

procedure TfrmWtMaintJCutOut.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWtMaintJCutOut.btnCutOutsClick(Sender: TObject);
begin
  frmwtLUCutOutDetails := TfrmwtLUCutOutDetails.create(application);
  try
    frmwtLUCutOutDetails.dblkpMaterialType.keyvalue := Material;
    frmwtLUCutOutDetails.showmodal;
  finally
    frmwtLUCutOutDetails.free;
  end;
  dblkpEdgeTypeClick(self);
end;

end.
