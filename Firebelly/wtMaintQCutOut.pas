unit wtMaintQCutOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtQuotesDM, StdCtrls, Buttons, Spin, CRControls, DBCtrls, DB, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintQCutOut = class(TForm)
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
    Label5: TLabel;
    edtUnitCost: TCREditMoney;
    Label6: TLabel;
    edtTotalCost: TCREditMoney;
    lblDiscount: TLabel;
    edtDiscount: TCREditMoney;
    Label9: TLabel;
    edtSellPrice: TCREditMoney;
    qryContractCutOut: TFDQuery;
    qryOneCustomerPrice: TFDQuery;
    dtsCutOutPrice: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dblkpCutOutClick(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure btnCutOutsClick(Sender: TObject);
    procedure edtDiscountChange(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TqcoMode;
    FQCutOut: TQCutOut;
    FMaterial: integer;
    FMaterialType: string;
    FEdgeType: integer;
    FUseCustomerPrices: boolean;
    procedure SetMode(const Value: TqcoMode);
    procedure SetQCutOut(const Value: TQCutOut);
    procedure EnableOK(Sender: TObject);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure GetTotalCost;
    procedure GetTotalPrice;
    procedure ShowDetails;
    procedure SetEdgeType(const Value: integer);
    procedure EnableButtons;
    procedure SetUseCustomerPrices(const Value: boolean);
    procedure GetUnitPrice;
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TqcoMode read FMode write SetMode;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property QCutOut: TQCutOut read FQCutOut write SetQCutOut;
    property UseCustomerPrices: boolean read FUseCustomerPrices write SetUseCustomerPrices;
  end;

var
  frmWTMaintQCutOut: TfrmWTMaintQCutOut;

implementation

uses wtLUCutOutDetails, wtMain, wtDataModule;

{$R *.dfm}

{ TfrmWtMaintQCutOut }

procedure TfrmWTMaintQCutOut.SetMode(const Value: TqcoMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qcoDelete);
  lblDelete.visible := (FMode = qcoDelete);
end;

procedure TfrmWTMaintQCutOut.SetQCutOut(const Value: TQCutOut);
begin
  FQCutOut := Value;
end;

procedure TfrmWTMaintQCutOut.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpCutOut.text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpEdgeType.KeyValue <> 0);
end;

procedure TfrmWTMaintQCutOut.EnableButtons;
begin
  btnCutOuts.visible := false;
end;

procedure TfrmWTMaintQCutOut.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  QCutOut.Material := FMaterial;
end;

procedure TfrmWTMaintQCutOut.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQCutOut.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qcoAdd     : Caption := 'Add a cutout';
    qcoChange  : Caption := 'Change a cutout';
    qcoDelete  : Caption := 'Delete a cutout';
    end;  { case }
    if Mode = qcoAdd then
      sTemp := ' New cutout '
    else
      sTemp := ' cutout ' + IntToStr(Qcutout.Parent.DbKey) + ' ';

    with qryEdgeType do
      begin
        close;
        parambyname('Edge_Type').asinteger := QcutOut.EdgeType;
        open;
      end;

    EnableButtons;

    {If Contract quote then show cut out discount}
    lblDiscount.Visible := QCutOut.Parent.ContractQuote;
    edtDiscount.visible := QCutOut.Parent.ContractQuote;

    ShowDetails;
    edtUnitPrice.Enabled := not frmWTMain.bEndUser;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQCutOut.ShowDetails;
begin
  if Mode <> qcoAdd then
  begin
    edtMaterial.text := MaterialType;
    dblkpEdgeType.keyvalue := QCutOut.EdgeType;

    with qryCOThickness do
      begin
        close;
        parambyname('Material_Type').asinteger := Material;
        parambyname('Edge_Type').asinteger := QCutOut.EdgeType;
        parambyname('CutOut').asinteger := QCutOut.CutOut;
        open;
      end;
    dblkpCutOut.keyvalue := QCutOut.Cutout;

    edtDiscount.text := formatfloat('0.00',QCutOut.Discount);
    edtSellPrice.Text := formatfloat('0.00',((QCutOut.UnitPrice / (1-(QCutOut.Discount/100.0000)))));
    edtunitPrice.text := formatfloat('0.00',QCutOut.UnitPrice);
    edtunitCost.text := formatfloat('0.00',QCutOut.UnitCost);
    spnQuantity.value := round(QCutOut.Quantity);
  end
  else
  begin
    edtMaterial.text := MaterialType;
    if qryEdgeType.recordcount = 1 then
      dblkpEdgeType.KeyValue := qryEdgeType.fieldbyname('Edge_type').asinteger
    else
      dblkpEdgeType.keyvalue := Self.EdgeType;
    dblkpEdgeTypeClick(self);
    edtDiscount.text := formatfloat('0.00',QCutOut.parent.CutOutDiscount);
    edtSellPrice.text := '0.00';
    edtunitPrice.text := '0.00';
    edtunitCost.text := '0.00';
    spnQuantity.value := 1;
  end;
  GetTotalPrice;
  GetTotalCost;
end;

procedure TfrmWTMaintQCutOut.GetTotalCost;
var
  rUnitCost, rTotal: real;
  iQuantity: integer;
begin
  try
    rUnitCost := strtofloat(edtUnitCost.text);
  except
    rUnitCost := 0.00;
  end;

  iQuantity := spnQuantity.value;

  rTotal := iQuantity*rUnitCost;
  edtTotalCost.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQCutOut.GetTotalPrice;
var
  rUnitPrice, rTotal: real;
  iQuantity: integer;
begin
  try
    rUnitPrice := strtofloat(edtUnitPrice.text);
  except
    rUnitPrice := 0.00;
  end;

  iQuantity := spnQuantity.value;

  rTotal := iQuantity*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQCutOut.dblkpEdgeTypeClick(Sender: TObject);
var
  iContractRecords: integer;
begin
  iContractRecords := 0;

  if QCutOut.Parent.ContractQuote then
    begin
      with qryContractCutOut do
        begin
          close;
          parambyname('Customer').AsInteger := QCutOut.Parent.Customer;
          parambyname('Material_type').asinteger := Material;
          parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
          parambyname('CutOut').asinteger := QCutOut.CutOut;
          open;

          iContractRecords := recordcount;
        end;
    end;

  if iContractRecords > 0 then
    begin
      UseCustomerPrices := true;
      dtsCOThickness.dataset := qryContractCutOut;
    end
  else
    begin
      with qryContractCutOut do
        begin
          close;
          parambyname('Customer').AsInteger := QCutOut.Parent.Customer;
          parambyname('Material_type').asinteger := Material;
          parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
          parambyname('CutOut').asinteger := QCutOut.CutOut;
          open;
        end;

      if qryContractCutOut.recordcount > 0 then
        begin
          UseCustomerPrices := true;
          dtsCOThickness.dataset := qryContractCutOut;
        end
      else
        begin
          with qryCOThickness do
            begin
              close;
              parambyname('Material_type').asinteger := Material;
              parambyname('Edge_Type').AsInteger := dblkpEdgeType.keyvalue;
              parambyname('CutOut').asinteger := QCutOut.CutOut;
              open;
            end;
          dtsCOThickness.dataset := qryCOThickness;
        end;
    end;

  enableOK(self);
end;

procedure TfrmWTMaintQCutOut.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  QCutOut.CutOut := dblkpCutOut.KeyValue;
  QCutOut.CutOutDesc := dblkpCutOut.Text;

  try
    if QCutOut.Parent.ContractQuote then
      QCutOut.Discount := strtofloat(edtDiscount.text)
    else
      begin
        QCutOut.Discount := ((strtofloat(edtSellPrice.Text) - strtofloat(edtUnitPrice.Text))/
                            strtofloat(edtSellPrice.Text)) * 100.0000;
      end;
  except
    QCutOut.Discount := 0.00;
  end;
  
  QCutOut.EdgeType := dblkpEdgeType.keyvalue;
  QCutOut.EdgeTypeDesc := dblkpEdgeType.Text;
  QCutOut.Quantity := spnQuantity.Value;
  QCutOut.UnitCost := strtofloat(edtUnitCost.text);
  QCutOut.UnitPrice := strtofloat(edtUnitPrice.text);
  if Mode = qcoAdd then
  begin
    QCutOut.QCONumber := QCutOut.Parent.CutOuts.Count + 1;
    QCutOut.Parent.CutOuts.Add(QCutOut);
    QCutOut.PriceUnit := dtsCutOutPrice.dataset.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = qcoDelete then
  begin
    inx := QCutOut.Parent.CutOuts.IndexOf(QCutOut.QCONumber);
    QCutOut.Parent.CutOuts.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQCutOut.GetUnitPrice;
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

          parambyname('Customer').AsInteger := QCutOut.Parent.Customer;
          parambyName('Material_type').asinteger := Material;
          parambyName('cutout').asinteger := dblkpCutout.keyvalue;
          parambyName('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
          open;

          dtsCutOutPrice.DataSet := qryOneCustomerPrice;

          edtSellPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtUnitPrice.Text := formatfloat('0.00',(fieldbyname('Unit_Price').asfloat));
        end;
    end
  else
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

          rDiscount := fieldbyname('Unit_Price').asfloat * (strtofloat(edtDiscount.text)/100.0000);

          dtsCutOutPrice.DataSet := qryOneCOThickness;

          edtSellPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtUnitPrice.Text := formatfloat('0.00',(fieldbyname('Unit_Price').asfloat - rDiscount));
        end;
    end;
end;

procedure TfrmWTMaintQCutOut.dblkpCutOutClick(Sender: TObject);
begin
  GetUnitPrice;
  GetTotalPrice;
  GetTotalCost;
  enableok(self);
end;

procedure TfrmWTMaintQCutOut.edtUnitPriceChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQCutOut.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQCutOut.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintQCutOut.btnCutOutsClick(Sender: TObject);
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

procedure TfrmWTMaintQCutOut.edtDiscountChange(Sender: TObject);
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

procedure TfrmWTMaintQCutOut.SetUseCustomerPrices(const Value: boolean);
begin
  FUseCustomerPrices := Value;
end;

end.
