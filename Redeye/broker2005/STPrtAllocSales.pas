unit STPrtAllocSales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls, Buttons, STSOObjects,
  ComCtrls, Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPrtAllocSalesFrm = class(TForm)
    DetsDataSource: TDataSource;
    DetsDBGrid: TDBGrid;
    DetsTimer: TTimer;
    GetDetsSQL: TFDQuery;
    UpdSOHeadSQL: TFDQuery;
    Panel2: TPanel;
    stsDetails: TStatusBar;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AllBitBtn: TBitBtn;
    Panel1: TPanel;
    lblSalesOrderNo: TLabel;
    GetPartStoreSQL: TFDQuery;
    lblAllocateSeq: TLabel;
    cmbAllocateSeq: TComboBox;
    pmnuAllocate: TPopupMenu;
    mnuAllocatethisline: TMenuItem;
    mnuAllocateAllLines: TMenuItem;
    mnuAllocatebyBin: TMenuItem;
    qryGetCompositeParts: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure StoreFromDBLookupComboBoxClick(Sender: TObject);
    procedure PartEditChange(Sender: TObject);
    procedure DetsTimerTimer(Sender: TObject);
    procedure ShowSelected(Sender: TObject);
    procedure DetsDBGridCellClick(Column: TColumn);
    procedure AllBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SendRadioGroupClick(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure mnuAllocatethislineClick(Sender: TObject);
    procedure mnuAllocateAllLinesClick(Sender: TObject);
    procedure pmnuAllocatePopup(Sender: TObject);
    procedure mnuAllocatebyBinClick(Sender: TObject);
  private
    { Private declarations }
    iNoOfItems: Integer ;
    function GetPartStoreName(TempStore: integer):string;
    procedure AllocateCompositeParts(tmpPart, tmpAllocBy: string; iQty, iLineNo: integer);
  public
    { Public declarations }
    iOrder, iStore, iStoreFrom, iIntSelCode: Integer ;
    bOK, bDeAlloc, bBatchAlloc: ByteBool ;
   end;

var
  STPrtAllocSalesFrm: TSTPrtAllocSalesFrm;

implementation

uses UITypes, STStockDM, STPrtAllocStStock;

{$R *.DFM}

procedure TSTPrtAllocSalesFrm.FormActivate(Sender: TObject);
begin
  bOK := False ;
  If bDeAlloc then
    begin
      Caption := 'De-Allocate Stock From Store Orders';
      cmbAllocateSeq.Visible := false;
      lblAllocateSeq.visible := false;
      DetsDBGrid.PopupMenu := nil;
    end
  else
   Caption := 'Allocate Stock To Store Orders' ;
//  DetsTimer.Interval := StMenuMainFrm.GetCompSQL.FieldByName('Search_Timer').AsInteger ;
  DetsTimer.Interval := 250;
  with lblSalesOrderNo do
    caption := caption + ' ' + GetPartStoreName(iStoreFrom);
  cmbAllocateSeq.itemindex := 0;
  ShowGrid(Self) ;
  if not bDealloc then
    AllBitBtnClick(Self);
end;

function TSTPrtAllocSalesFrm.GetPartStoreName(TempStore: integer):string;
begin
  with GetPartStoreSQL do
    begin
      close;
      parambyname('Part_Store').asinteger := TempStore;
      open;
      result := fieldbyname('Part_Store_Name').asstring;
    end;
end;

procedure TSTPrtAllocSalesFrm.ShowGrid(Sender: TObject);
begin
stsDetails.panels[1].text := 'Please wait.....' ;
//stsDetails.panels[0].Refresh ;
DetsTimer.Enabled := False ;
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Sales_Order').AsInteger := iOrder ;
     ParamByName('Part').AsString := '%' ;
     ParamByName('Part_Store').AsInteger := iStoreFrom ;
     Open ;
     iNoOfItems := RecordCount ;
     end;
ShowSelected(Self) ;
end;

procedure TSTPrtAllocSalesFrm.StoreFromDBLookupComboBoxClick(Sender: TObject);
begin
ShowGrid(Self) ;
end;

procedure TSTPrtAllocSalesFrm.PartEditChange(Sender: TObject);
begin
DetsTimer.Enabled := False ;
DetsTimer.Enabled := True ;
end;

procedure TSTPrtAllocSalesFrm.DetsTimerTimer(Sender: TObject);
begin
ShowGrid(Self) ;
end;

procedure TSTPrtAllocSalesFrm.ShowSelected(Sender: TObject);
begin
  stsDetails.panels[0].text := IntToStr(iNoOfItems) + ' items' ;
  stsDetails.panels[1].text := IntToStr(DetsDBGrid.SelectedRows.Count) + ' selected' ;
  OKBitBtn.Enabled := (DetsDBGrid.SelectedRows.Count > 0) ;
  AllBitBtn.Enabled := True ;
end;

procedure TSTPrtAllocSalesFrm.DetsDBGridCellClick(Column: TColumn);
begin
  ShowSelected(Self) ;
end;

procedure TSTPrtAllocSalesFrm.AllBitBtnClick(Sender: TObject);
begin
With GetDetsSQL do
     begin
     First ;
     While EOF = False do
           begin
           DetsDBGrid.SelectedRows.CurrentRowSelected := True ;
           Next ;
           end;
     end;
ShowSelected(Self) ;
end;

procedure TSTPrtAllocSalesFrm.OKBitBtnClick(Sender: TObject);
Var
  iTempCount, iTempQty: Integer ;
  sAllocBy : string;
begin
  {Check that all all items can be allocated}
  if not bDeAlloc then
    begin
    if messagedlg('Stock will be allocated by ' + cmbAllocateSeq.text + ', continue?',
                            mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
    for iTempCount := 0 to (DetsDBGrid.SelectedRows.Count - 1) do
      begin
        DetsDataSource.DataSet.GotoBookmark(TBookmark(DetsDBGrid.SelectedRows[iTempCount])) ;
        With GetDetsSQL do
          begin
            if FieldByName('Qty_free').AsInteger < (FieldByName('Quantity_Ordered').AsInteger + FieldByName('Quantity_Overs').AsInteger) then
              begin
                messagedlg('There is insufficient free stock to allocate to all items on this order, cannot proceed with stock allocation',
                            mtError, [mbOK], 0);
                exit;
              end;
          end;
      end;
    end;

  case cmbAllocateSeq.itemindex of
    0: sAllocBy := 'D';
    1: sAllocBy := 'P';
    2: sAllocBy := 'U';
  else
    sAllocBy := 'D';
  end;

  {Process the allocations} ;
  For iTempCount := 0 to (DetsDBGrid.SelectedRows.Count - 1) do
    begin
    DetsDataSource.DataSet.GotoBookmark(TBookmark(DetsDBGrid.SelectedRows[iTempCount])) ;
    With GetDetsSQL do
      begin
        if bDeAlloc then
          begin
            {De-Allocate stock} ;
            iTempQty := (FieldByName('Quantity_Ordered').AsInteger + FieldByName('Quantity_Overs').AsInteger);
            If iTempQty >0 then
                begin
                {Actually do the stock de-allocation} ;
                STStockDataMod.DeAllocStock(iOrder, iTempQty, 1, FieldByName('Sales_Order_Line_No').AsInteger) ;
                end;
          end
        else
          begin
            iTempQty := (FieldByName('Quantity_Ordered').AsInteger + FieldByName('Quantity_Overs').AsInteger) -
                        FieldByName('Quantity_Delivered').AsInteger -
                        FieldByName('Qty_Alloc').AsInteger ;

(*            {Go allocate composite parts}
            if fieldbyname('Part_Has_Children').asstring = 'Y' then
              AllocateCompositeParts(FieldByName('Part').AsString, sAllocBy,iTempQty, fieldbyname('Sales_Order_Line_No').asinteger)
            else
*)
           {allocate as much stock as required/available} ;
           if iTempQty <= STStockDataMod.CheckFreePickStock(iStoreFrom, FieldByName('Part').AsString) then
                begin
                  {Actually do the stock allocation} ;
                  STStockDataMod.AllocStock(iStoreFrom, FieldByName('Part').AsString, iOrder, iTempQty, 1, FieldByName('Sales_Order_Line_No').AsInteger,sAllocby,'') ;
                end
              else
                begin
                  STStockDataMod.AllocStock(iStoreFrom, FieldByName('Part').AsString, iOrder,
                  STStockDataMod.CheckFreePickStock(iStoreFrom, FieldByName('Part').AsString), 1, FieldByName('Sales_Order_Line_No').AsInteger, sAllocBy,'') ;
                end;
          end;
        Next ;
      end;

      {Update the sales order header}
      with updSOHeadSQL do
      begin
        Close;
        ParamByName('Sales_Order').AsInteger := DetsDataSource.DataSet.FieldByName('Sales_Order').AsInteger;
        if bDeAlloc then
          ParamByName('Status').AsInteger := shCreated
        else
          ParamByName('Status').AsInteger := shAllocated;
        ExecSQL;
      end;
    end;
  {Decide whether to close the window or leave to select another line}
  if DetsDBGrid.SelectedRows.Count = DetsDBGrid.datasource.DataSet.RecordCount then
    begin
      bOK := True ;
      close;
    end
  else
    ShowGrid(Self);

  bOK := True ;
end;

procedure TSTPrtAllocSalesFrm.AllocateCompositeParts(tmpPart, tmpAllocBy: string; iQty, iLineNo: integer);
var
  iTempQty: integer;
begin
  with qryGetCompositeParts do
    begin
      close;
      parambyname('Part').asstring := tmpPart;
      parambyname('Part_Store').asinteger := iStoreFrom;
      open;

      while eof <> true do
        begin
          iTempQty := iQty * fieldbyname('Quantity').asinteger;
          if iTempQty <= STStockDataMod.CheckFreePickStock(iStoreFrom, FieldByName('Composite_Part').AsString) then
            begin
              {Actually do the stock allocation} ;
              STStockDataMod.AllocStock(iStoreFrom, FieldByName('Composite_Part').AsString, iOrder, iTempQty, 1, iLineNo, tmpAllocby,'') ;
            end
          else
            begin
              STStockDataMod.AllocStock(iStoreFrom, FieldByName('Composite_Part').AsString, iOrder,
              STStockDataMod.CheckFreePickStock(iStoreFrom, FieldByName('Composite_Part').AsString), 1, iLineNo, tmpAllocBy,'') ;
            end;
          next;
        end;
    end;
end;

procedure TSTPrtAllocSalesFrm.FormCreate(Sender: TObject);
begin
  stsDetails.Top := Screen.Height - stsDetails.Height;
  STStockDataMod := TSTStockDataMod.Create(Self) ;
end;

procedure TSTPrtAllocSalesFrm.FormDestroy(Sender: TObject);
begin
STStockDataMod.Free ;
end;

procedure TSTPrtAllocSalesFrm.SendRadioGroupClick(Sender: TObject);
begin
ShowGrid(Self) ;
end;

procedure TSTPrtAllocSalesFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bDeAlloc then exit;
  mnuAllocatebyBinClick(self);
end;

procedure TSTPrtAllocSalesFrm.mnuAllocatethislineClick(
  Sender: TObject);
begin
  OKBitBtnClick(self);
end;

procedure TSTPrtAllocSalesFrm.mnuAllocateAllLinesClick(
  Sender: TObject);
begin
  AllBitBtnClick(self);
  OKBitBtnClick(self);
end;

procedure TSTPrtAllocSalesFrm.pmnuAllocatePopup(Sender: TObject);
begin
  if bDeAlloc then
    begin
      mnuAllocatethisLine.Caption := 'De-allocate selected line';
      mnuAllocateAllLines.Caption := 'De-allocate all lines';
      mnuAllocatebyBin.Caption := 'De-allocate selected line by bin';
    end;
end;

procedure TSTPrtAllocSalesFrm.mnuAllocatebyBinClick(
  Sender: TObject);
begin
  StPrtAllocStStockFrm := TStPrtAllocStStockFrm.create(self);
  try
    StPrtAllocStStockFrm.Part := GetDetsSQL.fieldbyname('Part').asstring;
    StPrtAllocStStockFrm.iQtyOrdered := GetDetsSQL.fieldbyname('Quantity_Ordered').asinteger;
    StPrtAllocStStockFrm.iQtyDelivered := GetDetsSQL.fieldbyname('Quantity_Delivered').asinteger;
    StPrtAllocStStockFrm.iQtyAllocated := GetDetsSQL.fieldbyname('Qty_Alloc').asinteger;
    StPrtAllocStStockFrm.SOrder := GetDetsSQL.fieldbyname('Sales_Order').asinteger;
    StPrtAllocStStockFrm.SOrderLine := GetDetsSQL.fieldbyname('Sales_Order_Line_no').asinteger;
    StPrtAllocStStockFrm.PartStore := iStoreFrom;
    StPrtAllocStStockFrm.PartStoreName := GetPartStoreName(iStoreFrom);
    StPrtAllocStStockFrm.showmodal;
    if StPrtAllocStStockFrm.bOK then
      begin
        showGrid(self);
        bOK := true;
      end;
  finally
    StPrtAllocStStockFrm.free;
  end;
end;

end.
