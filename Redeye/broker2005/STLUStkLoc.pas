unit STLUStkLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IniFiles, ComCtrls, Menus, CCSCommon,
  pbStockDm;

type
  TSTLUStkLocFrm = class(TForm)
    pnlGrid: TPanel;
    pnlFooter: TPanel;
    dbgrdLocations: TDBGrid;
    pnlButton: TPanel;
    btbtnClose: TBitBtn;
    pnlPart: TPanel;
    lblPartDesc: TLabel;
    lblPartCode: TLabel;
    lblPart: TLabel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    btnExcel: TBitBtn;
    pmnStock: TPopupMenu;
    SerialNumbers1: TMenuItem;
    ManageStockRecord1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdLocationsDblClick(Sender: TObject);
    procedure dbgrdLocationsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure SerialNumbers1Click(Sender: TObject);
    procedure ManageStockRecord1Click(Sender: TObject);
  private
    FChanged: boolean;
    procedure SetChanged(const Value: boolean);
    { Private declarations }
  public
    dtmdlStockEnquiry : TdtmdlStock;
    property Changed: boolean read FChanged write SetChanged;
  end;

var
  STLUStkLocFrm: TSTLUStkLocFrm;

implementation

uses STLUStkBinLots, pbMainMenu, STMaintStoreStock;

{$R *.DFM}

procedure TSTLUStkLocFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'LoctnsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdLocations);
end;

procedure TSTLUStkLocFrm.FormCreate(Sender: TObject);
begin
  Changed := false;
  dtmdlStockEnquiry := TdtmdlStock.create(self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'LoctnsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdLocations);
end;

procedure TSTLUStkLocFrm.dbgrdLocationsDblClick(Sender: TObject);
var
  STLUStkBinLotsFrm: TSTLUStkBinLotsFrm;
begin
  try
    with dtmdlStockEnquiry.qryStoreStockNumberedItems do
    begin
      close;
      paramByName('Part').AsString := dbgrdLocations.dataSource.DataSet.FieldByName('Part').AsString;
      paramByName('Part_Store_Name').AsString := dbgrdLocations.dataSource.DataSet.FieldByName('Part_Store_Name').AsString;
      paramByName('Part_Bin').AsString := dbgrdLocations.dataSource.DataSet.FieldByName('Part_Bin').AsString;
      paramByName('part_store_lot').asString := dbgrdLocations.dataSource.DataSet.FieldByName('part_store_lot').AsString;
      open;

      if recordCount = 0 then
      begin
        messageDlg('There are no numbered series within this lot.', mtInformation, [mbOK], 0);
      end
      else
      begin
        STLUStkBinLotsFrm := TSTLUStkBinLotsFrm.Create(self);

        STLUStkBinLotsFrm.dbgrdBinLots.datasource := dtmdlStockEnquiry.dtsrcStoreStockNumberedItems;

        STLUStkBinLotsFrm.lblPartCode.Caption := lblPartCode.Caption + '         ' +
                                                 lblPartDesc.Caption;
        STLUStkBinLotsFrm.lblStoreName.Caption :=
          dbgrdLocations.dataSource.DataSet.FieldByName('Part_Store_Name').AsString + '         Bin: ' +
          dbgrdLocations.dataSource.DataSet.FieldByName('Part_Bin').AsString;
        STLUStkBinLotsFrm.lblQuantities.Caption := 'Quantity in stock: '+
          dbgrdLocations.dataSource.DataSet.FieldByName('Qty_in_Stock').asString + '       Allocated: ' +
          dbgrdLocations.dataSource.DataSet.FieldByName('Qty_Allocated').asString + '       Free: ' +
          dbgrdLocations.dataSource.DataSet.FieldByName('Free_Stock').asString;

        STLUStkBinLotsFrm.ShowModal;
      end;
    end;

  finally
    if assigned(STLUStkBinLotsFrm) then
      STLUStkBinLotsFrm.Free;
  end;
end;

procedure TSTLUStkLocFrm.dbgrdLocationsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dbgrdLocations.DataSource.DataSet.FieldByName('invoice_upfront').asString = 'Y' then
  begin
    if state = [gdSelected] then
    begin
      dbgrdLocations.Canvas.Font.Color := clWhite;
      dbgrdLocations.Canvas.brush.color := clRed;
    end
    else
    begin
      dbgrdLocations.Canvas.Font.Color := clRed;
      dbgrdLocations.Canvas.brush.color := clWhite;
    end
  end
  else
  begin
    if state = [gdSelected] then
    begin
      dbgrdLocations.Canvas.Font.Color := clWhite;
      dbgrdLocations.Canvas.brush.color := clNavy;
    end
    else
    begin
      dbgrdLocations.Canvas.Font.Color := clblack;
      dbgrdLocations.Canvas.brush.color := clWhite;
    end;
  end;
  dbgrdLocations.DefaultDrawColumnCell(rect, datacol, column, state);
end;

procedure TSTLUStkLocFrm.FormShow(Sender: TObject);
begin
  dbgrdLocations.datasource := dtmdlStockEnquiry.dtsrcPartStoreBins;
  btnExcel.Enabled := dtmdlStockEnquiry.dtsrcPartStoreBins.DataSet.RecordCount > 0;
end;

procedure TSTLUStkLocFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(STLUStkLocFrm);
end;

procedure TSTLUStkLocFrm.SerialNumbers1Click(Sender: TObject);
begin
  dbgrdLocationsDblClick(self);
end;

procedure TSTLUStkLocFrm.ManageStockRecord1Click(Sender: TObject);
begin
  STMaintStoreStockfrm := TSTMaintStoreStockfrm.create(self);
  try
    STMaintStoreStockfrm.StoreStock := dbgrdlocations.datasource.dataset.fieldbyname('Store_Stock').asinteger;
    STMaintStoreStockfrm.showmodal;
  finally
    STMaintStoreStockfrm.free;
  end;
  Changed := true;
end;

procedure TSTLUStkLocFrm.SetChanged(const Value: boolean);
begin
  FChanged := Value;
end;

end.
