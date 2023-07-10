unit PBLUPartDeliveries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, pbStockDM, ComCtrls, DB,
  DBTables;

type
  TPBLUPartDeliveriesFrm = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    btnNone: TButton;
    btnSelect: TButton;
    dbgDetails: TDBGrid;
    edtPart: TEdit;
    edtPartDescription: TEdit;
    stsBrDetails: TStatusBar;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNoneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FPart: string;
    FPartDescription: string;
    procedure SetPart(const Value: string);
    procedure SetPartDescription(const Value: string);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMoveScreen(TempMoveType: String);
  public
    dtmdlAllStock: TdtmdlStock;
    bOK: boolean;
    bNone: boolean;
    property Part: string read FPart write SetPart;
    property PartDescription: string read FPartDescription write SetPartDescription;
  end;

var
  PBLUPartDeliveriesFrm: TPBLUPartDeliveriesFrm;

implementation

uses PBPartTransfer, CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TPBLUPartDeliveriesFrm.btnCloseClick(Sender: TObject);
begin
  bNone := false;
  bOK := false;
  close
end;

procedure TPBLUPartDeliveriesFrm.btnSelectClick(Sender: TObject);
begin
  CallMoveScreen('O');
end;

procedure TPBLUPartDeliveriesFrm.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  POrder: real;
  tempPart: string;
begin
  POrder := dbgDetails.dataSource.DataSet.FieldByName('Purchase_order').Asfloat;

  tempPart := Part;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := PartDescription;
    PBPartTransferFrm.edtFormReference.Text := dbgDetails.dataSource.DataSet.FieldByName('Form_Reference_ID').AsString;
    PBPartTransferFrm.Customer := dbgDetails.dataSource.DataSet.FieldByName('Order_Customer').AsInteger;
    PBPartTransferFrm.Branch := dbgDetails.dataSource.DataSet.FieldByName('Customer_Branch').AsInteger;
    PBPartTransferFrm.iPOrder := dbgDetails.dataSource.DataSet.FieldByName('Purchase_order').AsInteger;
    PBPartTransferFrm.iDelivery := dbgDetails.dataSource.DataSet.FieldByName('Delivery_no').AsInteger;
    PBPartTransferFrm.OrderPrice := dbgDetails.dataSource.DataSet.FieldByName('Order_Price').Asfloat;
    PBPartTransferFrm.SellPrice := dbgDetails.dataSource.DataSet.FieldByName('Selling_Price').Asfloat;
    PBPartTransferFrm.UnitFactor := dbgDetails.dataSource.DataSet.FieldByName('Price_Unit_Factor').Asinteger;
    PBPartTransferFrm.SellUnitFactor := dbgDetails.dataSource.DataSet.FieldByName('Sell_Unit_Factor').Asinteger;
    PBPartTransferFrm.SellUnit := dbgDetails.dataSource.DataSet.FieldByName('Sell_Unit').Asinteger;
    PBPartTransferFrm.OrderQty := dbgDetails.dataSource.DataSet.FieldByName('Orig_Ord_Qty').Asinteger;
    PBPartTransferFrm.PaidStock := (dbgDetails.dataSource.DataSet.FieldByName('Invoice_Upfront').Asstring = 'Y');
    try
      PBPartTransferFrm.PackSize := (dbgDetails.dataSource.DataSet.FieldByName('Forms_per_Box').Asinteger);
    except
      PBPartTransferFrm.PackSize := 1;
    end;
    PBPartTransferFrm.bNumbered := (dbgDetails.datasource.dataset.fieldbyname('Number_instructions').asstring <> '');
    PBPartTransferFrm.VatCode := dbgDetails.dataSource.DataSet.FieldByName('Vat_Code').Asinteger;
    PBPartTransferFrm.ProductType := dbgDetails.dataSource.DataSet.FieldByName('Product_Type').Asinteger;
    PBPartTransferFrm.iDelivery := dbgDetails.dataSource.DataSet.FieldByName('Delivery_no').AsInteger;
    PBPartTransferFrm.qtymemo.text := dbgDetails.dataSource.DataSet.FieldByName('Qty_to_Deliver').Asstring;
    PBPartTransferFrm.qtytodeliver := dbgDetails.dataSource.DataSet.FieldByName('Qty_to_Deliver').Asinteger;
    PBPartTransferFrm.sMoveType := TempMoveType ;
    PBPartTransferFrm.ShowModal;
    bTempOK := PBPartTransferFrm.bOK;
    if bTempOK then
      begin
        bOK := true;
        dtmdlAllStock.RefreshPartDeliveries(Part);
      end;
  finally
    PBPartTransferFrm.Free;
  end;
end;

procedure TPBLUPartDeliveriesFrm.FormActivate(Sender: TObject);
begin
  dtmdlAllStock.dtsPartDeliveries.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlAllStock.dtsPartdeliveries;

  dtmdlAllStock.RefreshPartDeliveries(Part);
end;

procedure TPBLUPartDeliveriesFrm.SetPart(const Value: string);
begin
  FPart := Value;
  edtPart.text := FPart;
end;

procedure TPBLUPartDeliveriesFrm.SetPartDescription(const Value: string);
begin
  FPartDescription := Value;
  edtPartDescription.text := FPartDescription;
end;

procedure TPBLUPartDeliveriesFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllStock do
  begin
    btnSelect.Enabled := ProductDeliveryCount > 0;
    stsBrDetails.panels[0].text := inttostr(ProductDeliveryCount) + ' records displayed';
  end;
end;

procedure TPBLUPartDeliveriesFrm.btnNoneClick(Sender: TObject);
begin
  bNone := true;
end;

procedure TPBLUPartDeliveriesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUPartDeliveriesFrm.FormCreate(Sender: TObject);
begin
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

end.
