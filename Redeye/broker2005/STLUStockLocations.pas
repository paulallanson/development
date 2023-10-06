unit STLUStockLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, ComCtrls, ExtCtrls, pbStockDM,
  Buttons, ImgList, ToolWin, DB, System.ImageList;

type
  TfrmSTLUStockLocations = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    stsbrDetails: TStatusBar;
    Label2: TLabel;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    Panel3: TPanel;
    Label1: TLabel;
    dblkpWarehouse: TDBLookupComboBox;
    imglstMaint: TImageList;
    btbtnClose: TBitBtn;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    btnTransfers: TToolButton;
    btnAdjustOut: TToolButton;
    btnPrint: TBitBtn;
    btnPreview: TBitBtn;
    btnExcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpWarehouseClick(Sender: TObject);
    procedure btbtnCloseClick(Sender: TObject);
    procedure btnTransfersClick(Sender: TObject);
    procedure btnAdjustOutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMoveScreen(TempMoveType: String);
    procedure RunReport(Preview: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
  private
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    dtmdlStockBins : TdtmdlStock;
  end;

var
  frmSTLUStockLocations: TfrmSTLUStockLocations;

implementation

uses UITypes, CCSCommon, PBDatabase, PBPartTransfer, STRPStockLocations, pbMainMenu,
  STLUStkLoc;

{$R *.dfm}

procedure TfrmSTLUStockLocations.FormCreate(Sender: TObject);
begin
  dtmdlStockBins := TdtmdlStock.create(self);
  dtmdlStockBins.dtsStockLocations.OnDataChange := SetButtons;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'StoreBinsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmSTLUStockLocations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'StoreBinsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmSTLUStockLocations.FormActivate(Sender: TObject);
begin
  dbgDetails.datasource := dtmdlStockBins.dtsStockLocations;
  dblkpWarehouse.listsource := dtmdlStockBins.dtsPartStore;

  with dtmdlStockBins.dtsPartStore.DataSet do
    begin
      close;
      open;
    end;

  dblkpWarehouse.KeyValue := dmBroker.GetDefaultWarehouse;
end;

procedure TfrmSTLUStockLocations.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlStockBins.Warehouse := dblkpWarehouse.KeyValue;
  dtmdlStockBins.RefreshStockLocations;
end;

procedure TfrmSTLUStockLocations.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlStockBins.BinLocation := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmSTLUStockLocations.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlStockBins do
  begin
    btnTransfers.Enabled := BinCount > 0;
    btnPrint.Enabled := BinCount > 0;
    btnPreview.Enabled := BinCount > 0;
    btnExcel.Enabled := BinCount > 0;
    btnAdjustOut.Enabled := BinCount > 0;

    stsBrDetails.panels[0].text := inttostr(BinCount) + ' records displayed';
  end;
end;

procedure TfrmSTLUStockLocations.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmSTLUStockLocations.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmSTLUStockLocations.dblkpWarehouseClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmSTLUStockLocations.btbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSTLUStockLocations.btnTransfersClick(Sender: TObject);
begin
  CallMoveScreen('T');
end;

procedure TfrmSTLUStockLocations.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  tempPart := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := dbgDetails.dataSource.DataSet.FieldByName('Part_Description').AsString;
    PBPartTransferFrm.edtFormReference.Text := dbgDetails.dataSource.DataSet.FieldByName('Form_Reference_ID').AsString;
    PBPartTransferFrm.Customer := dbgDetails.dataSource.DataSet.FieldByName('Customer').AsInteger;
    PBPartTransferFrm.sMoveType := TempMoveType ;
    PBPartTransferFrm.ShowModal;
    bTempOK := PBPartTransferFrm.bOK;
  finally
    PBPartTransferFrm.Free;
  end;
  dtmdlStockBins.RefreshStockLocations;
  dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
end;

procedure TfrmSTLUStockLocations.btnAdjustOutClick(Sender: TObject);
begin
  CallMoveScreen('B');
end;

procedure TfrmSTLUStockLocations.FormDestroy(Sender: TObject);
begin
  dtmdlStockBins.free;
end;

procedure TfrmSTLUStockLocations.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmSTLUStockLocations.RunReport(Preview: boolean);
begin
  frmSTRPStockLocations := TfrmSTRPStockLocations.create(self);
  try
    frmSTRPStockLocations.warehouse := dblkpWarehouse.KeyValue;
    frmSTRPStockLocations.PartBin := edtSearch.Text;
    frmSTRPStockLocations.qrlblWarehouse.caption := dblkpWarehouse.Text;
    if frmSTRPStockLocations.GetDetails = 0 then
      begin
        MessageDlg('There is no stock information to print for this bin', mtError, [mbAbort], 0);
        exit;
      end;

    if not Preview then
      begin
        frmSTRPStockLocations.bPreview := false;
        frmSTRPStockLocations.qrpDetails.PrinterSetup;
        if frmSTRPStockLocations.qrpDetails.tag = 0 then
          frmSTRPStockLocations.qrpDetails.Print;
      end
    else
      begin
        frmSTRPStockLocations.bPreview := true;
        frmSTRPStockLocations.qrpDetails.Preview;
      end;
  finally
    frmSTRPStockLocations.free;
  end;
end;

procedure TfrmSTLUStockLocations.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmSTLUStockLocations.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(frmSTLUStockLocations);
end;

end.
