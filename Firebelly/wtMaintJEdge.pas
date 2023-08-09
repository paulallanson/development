unit wtMaintJEdge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtJobsDM, StdCtrls, Buttons, Spin, CRControls, DBCtrls, DB, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintJEdge = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryEdgeType: TFDQuery;
    dtsEdgeType: TDataSource;
    qryEdgeThickness: TFDQuery;
    dtsEdgeThickness: TDataSource;
    qryOneEdgeThickness: TFDQuery;
    pnlDetails: TPanel;
    Label1: TLabel;
    edtMaterial: TEdit;
    dblkpEdgeType: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dblkpEdge: TDBLookupComboBox;
    edtLength: TCREditInt;
    Label8: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    edtUnitPrice: TCREditMoney;
    edtTotalPrice: TCREditMoney;
    lblDelete: TLabel;
    btnEdge: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure dblkpEdgeClick(Sender: TObject);
    procedure edtLengthChange(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnEdgeClick(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TjedgMode;
    FMaterial: integer;
    FMaterialType: string;
    FjEdge: TjEdge;
    FEdgeType: integer;
    procedure SetMode(const Value: TjedgMode);
    procedure EnableOK(Sender: TObject);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure GetTotalPrice;
    procedure ShowDetails;
    procedure SetjEdge(const Value: TjEdge);
    procedure SetEdgeType(const Value: integer);
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TjedgMode read FMode write SetMode;
    property jEdge: TjEdge read FjEdge write SetjEdge;
    property EdgeType: integer read FEdgeType write SetEdgeType;
  end;

var
  frmWTMaintJEdge: TfrmWTMaintJEdge;

implementation

uses wtLUEdgeDetails, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQEdge }

procedure TfrmWTMaintJEdge.SetMode(const Value: TjedgMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> jedgDelete);
  lblDelete.visible := (FMode = jedgDelete);
end;

procedure TfrmWTMaintJEdge.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpEdgeType.text <> '') and
                    (dblkpEdge.KeyValue <> 0) and
                    (edtLength.Text <> '') and
                    (edtUnitPrice.Text <> '');
end;
procedure TfrmWTMaintJEdge.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  jEdge.Material := FMaterial;
end;

procedure TfrmWTMaintJEdge.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintJEdge.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jedgAdd     : Caption := 'Add an edge';
    jedgChange  : Caption := 'Change an edge';
    jedgDelete  : Caption := 'Delete an edge';
    end;  { case }
    if Mode = jedgAdd then
      sTemp := ' New edget '
    else
      sTemp := ' edge ' + IntToStr(jEdge.Parent.DbKey) + ' ';

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

procedure TfrmWTMaintJEdge.ShowDetails;
begin
  if Mode <> jedgAdd then
  begin
    edtMaterial.text := MaterialType;
    dblkpEdgeType.keyvalue := jEdge.EdgeType;

    with qryEdgeThickness do
      begin
        close;
        parambyname('Material_Type').asinteger := Material;
        parambyname('Edge_Type').asinteger := jEdge.EdgeType;
        open;
      end;
    dblkpEdge.keyvalue := jEdge.Edge;

    edtunitPrice.text := formatfloat('0.00',jEdge.UnitPrice);
    edtLength.text := floattostr(jEdge.Length);
    GetTotalPrice;
  end
  else
  begin
    edtMaterial.text := MaterialType;
    dblkpEdgeType.KeyValue := self.EdgeType;
    dblkpEDgeTypeClick(self);
    edtunitPrice.text := '0.00';
    edtLength.Text := '';
    edtTotalPrice.Text := '0.00';
  end;
end;

procedure TfrmWTMaintJEdge.GetTotalPrice;
var
  rUnitPrice, rTotal: real;
  iLength: integer;
begin
  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rUnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
  except
    rUnitPrice := 0.00;
  end;

  rTotal := (iLength/1000)*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintJEdge.dblkpEdgeTypeClick(Sender: TObject);
begin
  with qryEdgeThickness do
    begin
      close;
      parambyname('Material_type').asinteger := Material;
      parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
      open;
      dblkpEdge.keyvalue := 0;
    end;
  enableOK(self);
end;

procedure TfrmWTMaintJEdge.dblkpEdgeClick(Sender: TObject);
var
  sText: string;
begin
  with qryOneEdgeThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyName('Material_type').asinteger := Material;
      parambyName('Edge_profile').asinteger := dblkpEdge.keyvalue;
      parambyName('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      open;
      edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
    end;
  GetTotalPrice;
  enableok(self);
end;

procedure TfrmWTMaintJEdge.edtLengthChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJEdge.edtUnitPriceChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJEdge.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  jEdge.Edge := dblkpEdge.KeyValue;
  jEdge.EdgeDesc := dblkpEdge.Text;
  jEdge.EdgeType := dblkpEdgeType.keyvalue;
  jEdge.EdgeTypeDesc := dblkpEdgeType.Text;
  jEdge.Length := StrToFloatDef(edtLength.text, 0, FormatSettings);
  jEdge.UnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
  if Mode = jedgAdd then
  begin
    jEdge.jEdgNumber := jEdge.Parent.Edges.Count + 1;
    jEdge.Parent.Edges.Add(jEdge);
    jEdge.PriceUnit := qryOneEdgeThickness.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = jEdgDelete then
  begin
    inx := jEdge.Parent.Edges.IndexOf(jEdge.jEdgNumber);
    jEdge.Parent.Edges.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJEdge.SetjEdge(const Value: TjEdge);
begin
  FjEdge := Value;
end;

procedure TfrmWTMaintJEdge.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintJEdge.btnEdgeClick(Sender: TObject);
begin
  frmwtLUEdgeDetails := TfrmwtLUEdgeDetails.create(application);
  try
    frmwtLUEdgeDetails.dblkpMaterialType.keyvalue := Material;
    frmwtLUEdgeDetails.showmodal;
  finally
    frmwtLUEdgeDetails.free;
  end;
  dblkpEdgeTypeClick(self);
end;

end.
