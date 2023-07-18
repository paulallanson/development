unit wtMaintQEdge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtQuotesDM, StdCtrls, Buttons, Spin, CRControls, DBCtrls, DB, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintQEdge = class(TForm)
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
    Label5: TLabel;
    edtUnitCost: TCREditMoney;
    Label6: TLabel;
    edtTotalCost: TCREditMoney;
    Label9: TLabel;
    edtSellPrice: TCREditMoney;
    lblDiscount: TLabel;
    edtDiscount: TCREditMoney;
    qryContractEdge: TFDQuery;
    qryOneCustomerPrice: TFDQuery;
    dtsEdgePrice: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure dblkpEdgeClick(Sender: TObject);
    procedure edtLengthChange(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnEdgeClick(Sender: TObject);
    procedure edtDiscountChange(Sender: TObject);
  private
    FActivated: boolean;
    FQEdge: TQEdge;
    FMode: TqedgMode;
    FMaterial: integer;
    FMaterialType: string;
    FEdgeType: integer;
    FUseCustomerPrices: boolean;
    procedure SetMode(const Value: TqedgMode);
    procedure SetQEdge(const Value: TQEdge);
    procedure EnableOK(Sender: TObject);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure GetTotalCost;
    procedure GetTotalPrice;
    procedure ShowDetails;
    procedure SetEdgeType(const Value: integer);
    procedure EnableButtons;
    procedure GetUnitPrice;
    procedure SetUseCustomerPrices(const Value: boolean);
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TqedgMode read FMode write SetMode;
    property QEdge: TQEdge read FQEdge write SetQEdge;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property UseCustomerPrices: boolean read FUseCustomerPrices write SetUseCustomerPrices;
  end;

var
  frmWTMaintQEdge: TfrmWTMaintQEdge;

implementation

uses wtLUEdgeDetails, wtMain, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQEdge }

procedure TfrmWTMaintQEdge.SetMode(const Value: TqedgMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qedgDelete);
  lblDelete.visible := (FMode = qedgDelete);
end;

procedure TfrmWTMaintQEdge.SetQEdge(const Value: TQEdge);
begin
  FQEdge := Value;
end;

procedure TfrmWTMaintQEdge.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpEdgeType.text <> '') and
                    (dblkpEdge.KeyValue <> 0) and
                    (edtLength.Text <> '') and
                    (edtUnitPrice.Text <> '');
end;

procedure TfrmWTMaintQEdge.EnableButtons;
begin
  btnEdge.visible := false;
end;

procedure TfrmWTMaintQEdge.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  QEdge.Material := FMaterial;
end;

procedure TfrmWTMaintQEdge.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQEdge.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qedgAdd     : Caption := 'Add an edge';
    qedgChange  : Caption := 'Change an edge';
    qedgDelete  : Caption := 'Delete an edge';
    end;  { case }
    if Mode = qedgAdd then
      sTemp := ' New edget '
    else
      sTemp := ' edge ' + IntToStr(Qedge.Parent.DbKey) + ' ';

    with qryEdgeType do
      begin
        close;
        parambyname('Edge_Type').asinteger := QEdge.EdgeType;
        open;
        if recordcount = 1 then
          dblkpEdgeType.KeyValue := fieldbyname('Edge_type').asinteger;
      end;

    EnableButtons;

    {If Contract quote then show cut out discount}
    lblDiscount.Visible := QEdge.Parent.ContractQuote;
    edtDiscount.visible := QEdge.Parent.ContractQuote;

    edtUnitPrice.Enabled := not frmWTMain.bEndUser;
    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQEdge.ShowDetails;
begin
  if Mode <> qedgAdd then
  begin
    edtMaterial.text := MaterialType;
    dblkpEdgeType.keyvalue := QEdge.EdgeType;

    with qryEdgeThickness do
      begin
        close;
        parambyname('Material_Type').asinteger := Material;
        parambyname('Edge_Type').asinteger := QEdge.EdgeType;
        parambyname('Edge_Profile').asinteger := QEdge.Edge;
        open;
      end;
    dblkpEdge.keyvalue := QEdge.Edge;

    edtDiscount.text := formatfloat('0.00',QEdge.Discount);
    edtSellPrice.Text := formatfloat('0.00',((QEdge.UnitPrice / (1-(QEdge.Discount/100.0000)))));
    edtunitPrice.text := formatfloat('0.00',QEdge.UnitPrice);
    edtunitCost.text := formatfloat('0.00',QEdge.UnitCost);
    edtLength.text := floattostr(QEdge.Length);
  end
  else
  begin
    edtMaterial.text := MaterialType;
    if qryEdgeType.recordcount = 1 then
      dblkpEdgeType.KeyValue := qryEdgeType.fieldbyname('Edge_type').asinteger
    else
      dblkpEdgeType.keyvalue := Self.EdgeType;
    dblkpEdgeTypeClick(self);
    edtDiscount.text := formatfloat('0.00',QEdge.parent.EdgeDiscount);
    edtSellPrice.text := '0.00';
    edtunitPrice.text := '0.00';
    edtunitCost.text := '0.00';
    edtLength.Text := '';
  end;
  GetTotalPrice;
  GetTotalCost;
end;

procedure TfrmWTMaintQEdge.GetTotalPrice;
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
    rUnitPrice := strtofloat(edtUnitPrice.text);
  except
    rUnitPrice := 0.00;
  end;

  rTotal := (iLength/1000)*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQEdge.GetTotalCost;
var
  rUnitCost, rTotal: real;
  iLength: integer;
begin
  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rUnitCost := strtofloat(edtUnitCost.text);
  except
    rUnitCost := 0.00;
  end;

  rTotal := (iLength/1000)*rUnitCost;
  edtTotalCost.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQEdge.dblkpEdgeTypeClick(Sender: TObject);
var
  iContractRecords: integer;
begin
  iContractRecords := 0;

  if QEdge.Parent.ContractQuote then
    begin
      with qryContractEdge do
        begin
          close;
          parambyname('Customer').AsInteger := QEdge.Parent.Customer;
          parambyname('Material_type').asinteger := Material;
          parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
          parambyname('Edge_Profile').asinteger := QEdge.Edge;
          open;

          iContractRecords := recordcount;
        end;
    end;

  if iContractRecords > 0 then
    begin
      UseCustomerPrices := true;
      dtsEdgeThickness.dataset := qryContractEdge;
    end
  else
    begin
      with qryContractEdge do
        begin
          close;
          parambyname('Customer').AsInteger := QEdge.Parent.Customer;
          parambyname('Material_type').asinteger := Material;
          parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
          parambyname('Edge_Profile').asinteger := QEdge.Edge;
          open;
        end;

      if qryContractEdge.recordcount > 0 then
        begin
          UseCustomerPrices := true;
          dtsEdgeThickness.dataset := qryContractEdge;
        end
      else
        begin
          with qryEdgeThickness do
            begin
              close;
              parambyname('Material_type').asinteger := Material;
              parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
              parambyname('Edge_Profile').asinteger := QEdge.Edge;
              open;

              dblkpEdge.keyvalue := 0;
            end;
          dtsEdgeThickness.dataset := qryEdgeThickness;
        end;
    end;

  enableOK(self);
end;

procedure TfrmWTMaintQEdge.GetUnitPrice;
var
  rDiscount: real;
  sText: string;
begin
  if self.UseCustomerPrices then
    begin
      with qryOneCustomerPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QEdge.Parent.Customer;
          parambyName('Material_type').asinteger := Material;
          parambyName('Edge_Profile').asinteger := dblkpEdge.keyvalue;
          parambyName('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
          open;

          dtsEdgePrice.DataSet := qryOneCustomerPrice;

          edtSellPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtUnitPrice.Text := formatfloat('0.00',(fieldbyname('Unit_Price').asfloat));
        end;
    end
  else
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

          rDiscount := fieldbyname('Unit_Price').asfloat * (strtofloat(edtDiscount.text)/100.0000);

          dtsEdgePrice.DataSet := qryOneEdgeThickness;

          edtSellPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtUnitPrice.Text := formatfloat('0.00',(fieldbyname('Unit_Price').asfloat - rDiscount));
        end;
    end;
end;

procedure TfrmWTMaintQEdge.dblkpEdgeClick(Sender: TObject);
begin
  GetUnitPrice;
  GetTotalPrice;
  GetTotalCost;
  enableok(self);
end;

procedure TfrmWTMaintQEdge.edtLengthChange(Sender: TObject);
begin
  GetTotalPrice;
  GetTotalCost;
end;

procedure TfrmWTMaintQEdge.edtUnitPriceChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQEdge.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  QEdge.Edge := dblkpEdge.KeyValue;
  QEdge.EdgeDesc := dblkpEdge.Text;

  try
    if QEdge.Parent.ContractQuote then
      QEdge.Discount := strtofloat(edtDiscount.text)
    else
      begin
        QEdge.Discount := ((strtofloat(edtSellPrice.Text) - strtofloat(edtUnitPrice.Text))/
                            strtofloat(edtSellPrice.Text)) * 100.0000;
      end;
  except
    QEdge.Discount := 0.00;
  end;

  QEdge.edgetype := dblkpedgeType.keyvalue;
  QEdge.EdgeTypeDesc := dblkpEdgeType.Text;
  QEdge.Length := strtofloat(edtLength.text);
  QEdge.UnitCost := strtofloat(edtUnitCost.text);
  QEdge.UnitPrice := strtofloat(edtUnitPrice.text);
  if Mode = qedgAdd then
  begin
    QEdge.QEdgNumber := QEdge.Parent.Edges.Count + 1;
    QEdge.Parent.Edges.Add(QEdge);
    QEdge.PriceUnit := dtsEdgePrice.DataSet.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = qEdgDelete then
  begin
    inx := QEdge.Parent.Edges.IndexOf(QEdge.QEdgNumber);
    QEdge.Parent.Edges.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQEdge.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintQEdge.btnEdgeClick(Sender: TObject);
begin
  frmWtLUEdgeDetails := TfrmWtLUEdgeDetails.create(application);
  try
    frmWtLUEdgeDetails.dblkpMaterialType.keyvalue := Material;
    frmWtLUEdgeDetails.showmodal;
  finally
    frmWtLUEdgeDetails.free;
  end;
  dblkpEdgeTypeClick(self);
end;

procedure TfrmWTMaintQEdge.edtDiscountChange(Sender: TObject);
var
  rDiscount: real;
begin
  try
    rDiscount := strtofloat(edtSellPrice.text) * (strtofloat(edtDiscount.text)/100.0000);
  except
    rDiscount := 0;
  end;

  try
    edtUnitPrice.Text := formatfloat('0.00',(strtofloat(edtSellPrice.text) - rDiscount));
  except
    edtUnitPrice.Text := formatfloat('0.00',0.00);
  end;

end;

procedure TfrmWTMaintQEdge.SetUseCustomerPrices(const Value: boolean);
begin
  FUseCustomerPrices := Value;
end;

end.
