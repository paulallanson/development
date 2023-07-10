unit PBLUCustDeliveries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, pbStockDM, ComCtrls, DB,
  DBTables;

type
  TPBLUCustDeliveriesFrm = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    Label1: TLabel;
    btnClose: TButton;
    btnNone: TButton;
    btnSelect: TButton;
    dbgDetails: TDBGrid;
    edtCustomerName: TEdit;
    stsBrDetails: TStatusBar;
    Label2: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNoneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
  private
    FCustomer: integer;
    FCustomerName: string;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMoveScreen(TempMoveType: String);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
  public
    dtmdlAllStock: TdtmdlStock;
    bOK: boolean;
    bNone: boolean;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
  end;

var
  PBLUCustDeliveriesFrm: TPBLUCustDeliveriesFrm;

implementation

uses PBPartTransfer, CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TPBLUCustDeliveriesFrm.btnCloseClick(Sender: TObject);
begin
  bNone := false;
  bOK := false;
  close;
end;

procedure TPBLUCustDeliveriesFrm.btnSelectClick(Sender: TObject);
begin
  if dbgDetails.dataSource.DataSet.FieldByName('Stock_Reference').AsString = '' then
    begin
      messagedlg('Cannot receipt this order, the order doesn''t have an associated Product Code.', mtError, [mbOk], 0);
      exit;
    end
  else
    CallMoveScreen('O');
end;

procedure TPBLUCustDeliveriesFrm.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  tempPart := dbgDetails.dataSource.DataSet.FieldByName('Stock_Reference').AsString;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := dbgDetails.dataSource.DataSet.FieldByName('Form_Reference_Descr').asstring;
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
        dtmdlAllStock.RefreshCustDeliveries(Customer);
      end;
  finally
    PBPartTransferFrm.Free;
  end;
end;

procedure TPBLUCustDeliveriesFrm.FormActivate(Sender: TObject);
begin
  dtmdlAllStock.dtsCustDeliveries.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlAllStock.dtsCustDeliveries;

  dtmdlAllStock.RefreshCustDeliveries(Customer);
end;

procedure TPBLUCustDeliveriesFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllStock do
  begin
    btnSelect.Enabled := OrderDeliveryCount > 0;
    stsBrDetails.panels[0].text := inttostr(OrderDeliveryCount) + ' records displayed';
  end;
end;

procedure TPBLUCustDeliveriesFrm.btnNoneClick(Sender: TObject);
begin
  bNone := true;
end;

procedure TPBLUCustDeliveriesFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBLUCustDeliveriesFrm.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  edtCustomerName.text := FCustomerName;
end;

procedure TPBLUCustDeliveriesFrm.FormCreate(Sender: TObject);
begin
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUCustDeliveriesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUCustDeliveriesFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllStock.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUCustDeliveriesFrm.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUCustDeliveriesFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllStock.RefreshCustDeliveries(Customer);
end;

procedure TPBLUCustDeliveriesFrm.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

end.
