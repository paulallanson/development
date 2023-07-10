unit STStkEnq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, ComCtrls, ImgList, ExtCtrls, Menus;

type
  TStockDet = class
  Private
    SDRec: Integer ;
    SDTyp: String ;
    SDDescr: String ;
    SDQty: Integer;
    SDAlloc: Integer ;
    SDOnOrd: Integer ;
    SDPack: Integer ;
    SDCost: Real ;
    FPaid: boolean;
    Procedure SetRec(const Value: Integer);
    Procedure SetTyp(const Value: string);
    Procedure SetDescr(const Value: string);
    Procedure SetQty(const Value: Integer);
    Procedure SetAlloc(const Value: Integer);
    Procedure SetOnOrd(const Value: Integer);
    Procedure SetPack(const Value: Integer);
    Procedure SetCost(const Value: Real);
    procedure SetPaid(const Value: boolean);
  Public
    Constructor Create(const Rec: Integer; Typ, Descr: String; Qty, Alloc, OnOrd, Pack: Integer; Cost: Real) ;
    property Rec: Integer read SDRec write SetRec ;
    property Typ: string read SDTyp write SetTyp ;
    property Descr: string read SDDescr write SetDescr ;
    property Qty: integer read SDQty write SetQty ;
    property Alloc: integer read SDAlloc write SetAlloc ;
    property OnOrd: integer read SDOnOrd write SetOnOrd ;
    property Pack: integer read SDPack write SetPack ;
    property Cost: real read SDCost write SetCost ;
    property Paid: boolean read FPaid write SetPaid;
  end;

  TSTStkEnqFrm = class(TForm)
    Panel1: TPanel;
    PartGroupBox: TGroupBox;
    Label2: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    PartDescrEdit: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    MoveBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    StockTreeView: TTreeView;
    ppmnStockRec: TPopupMenu;
    Edit1: TMenuItem;
    procedure Edit1Click(Sender: TObject);
  private
    fPart: string;
    fPartDesc: string;
    procedure setPart(const Value: string);
    procedure setPartDesc(const Value: string);
  published
    GetStockSQL: TQuery;
    TreeImageList: TImageList;
    GetAllocSQL: TQuery;
    GetStoreStockSQL: TQuery;
    GetPartSQL: TQuery;
    GetOnOrdSQL: TQuery;
    GetOnOrdAllocSQL: TQuery;
    GetStoresSQL: TQuery;
    procedure PartBitBtnClick(Sender: TObject);
    procedure LoadTreeViews(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MoveBitBtnClick(Sender: TObject);
    procedure StockTreeViewClick(Sender: TObject);
    property Part: string read fPart write setPart;
    property PartDesc: string read fPartDesc write setPartDesc;
     private
  public
    procedure EditStockRecord;
    { Public declarations }
  end;

var
  STStkEnqFrm: TSTStkEnqFrm;

implementation

uses pbMainMenu, CCSCommon, STPrtEnqMov, STStoreStockObj;

{$R *.DFM}

procedure TSTStkEnqFrm.PartBitBtnClick(Sender: TObject);
begin
(*  STLUStkFrm := TSTLUStkFrm.Create(Self) ;
  Try
    STLUStkFrm.ShowModal ;
    If STLUStkFrm.bOK = True then
    begin
      PartEdit.Text := STLUStkFrm.part ;
      PartDescrEdit.Text := STLUStkFrm.partDesc ;
    end;
  Finally
    STLUStkFrm.Free ;
  end;
  If PartEdit.Text <> '' then
    LoadTreeViews(self) ;
*)
end;

procedure TSTStkEnqFrm.LoadTreeViews(Sender: TObject);
Var
  iPrevStore, iStore, iRecCode: Integer;
  sPrevBin, sPrevLot, sLotText: String ;
  sBin, sLot, sAllocDescr: String ;
  sdTemp: TStockDet ;
  tnTemp, tnTempLastSave: TTreeNode ;
  tnTempLast: Array[0..3] of TTreeNode ;
  iQty, iAlloc, iTempCount, iLevel, iPack: Integer ;
  rCost: Real ;
  bSerialNo: ByteBool ;
begin
  sPrevLot := '' ;
  sPrevBin := '' ;
  ireccode := 0;
  istore := 0;
  With GetPartSQL do
  begin
    Close ;
    ParamByName('Part').AsString := PartEdit.Text ;
    Open ;
    First ;
  end;

  {Load up the tree-view} ;
  StockTreeView.Items.Clear ;
  iLevel := 0 ;
  tnTemp := StockTreeView.Items.Add(Nil,'T') ;
  tnTemp.ImageIndex := 0 ;
  tnTemp.SelectedIndex := 0 ;
  sdTemp := TStockDet.Create(0,'T','Total: ',0,0,0,0,0) ;
  tnTemp.Data := sdTemp ;
  iPrevStore := iStore ;
  sPrevBin := '' ;
  sPrevLot := '' ;
  tnTempLast[iLevel] := tnTemp ;
  With GetStoresSQL do
  begin
    Close ;
    {ParamByName('Part').AsString := PartEdit.Text} ;
    Open ;
    First ;
    If EOF  then exit ;

    bSerialNo := (GetPartSQL.FieldByName('Track_Serial_No').AsString = 'Y') ;
    If bSerialNo then
      sLotText := 'S/N'
    else
      sLotText := 'Lot' ;

    While EOF = False do
    begin
      {ParamByName('Part').AsString := PartEdit.Text} ;
      iStore := FieldByName('Part_Store').AsInteger ;
      iLevel := 1 ;
      If iStore <> iPrevStore then
      begin
        tnTemp := StockTreeView.Items.AddChild(tnTempLast[iLevel - 1],'S') ;
        tnTemp.ImageIndex := 2 ;
        tnTemp.SelectedIndex := 2 ;
        sdTemp := TStockDet.Create(iStore,'S','Store: ' + FieldByName('Part_Store_Name').AsString,
                                                 0,0,0,0,0) ;
        tnTemp.Data := sdTemp ;
        iPrevStore := iStore ;
        sPrevBin := '' ;
        sPrevLot := '' ;
        tnTempLast[iLevel] := tnTemp ;
        {This is a new store so check if anything ON ORDER} ;
        With GetOnOrdSQL do
        begin
          {Check for PURCHASE and STORE orders} ;
          Close ;
          ParamByName('Part_Store').AsInteger := iStore ;
          ParamByName('Part').AsString := PartEdit.Text ;
          Open ;
          First ;
          While EOF = False do
          begin
            {Add any orders in} ;
            tnTemp := StockTreeView.Items.AddChild(tnTempLast[iLevel],'O') ;
            tnTemp.ImageIndex := 10 ;
            tnTemp.SelectedIndex := 10 ;
            sdTemp := TStockDet.Create(iRecCode,'O','Order: ' + FieldByName('Purch_Ord_No').AsString,
                                                 0,0,FieldByName('Qty_On_Order').AsInteger,
                                                 FieldByName('Purch_Pack_Quantity').AsInteger,
                                                 FieldByName('Purch_Value').AsFloat /
                                                 FieldByName('Purch_Pack_Quantity').AsInteger) ;

            tnTemp.Data := sdTemp ;
            {Add the ON ORDER quantity into the parent entries} ;
            tnTempLastSave := tnTemp ;
            While Assigned(tnTempLastSave.Parent) do
            begin
              tnTempLastSave := tnTempLastSave.Parent ;
              sdTemp := tnTempLastSave.Data ;
              sdTemp.SDOnOrd := sdTemp.SDOnOrd + FieldByName('Qty_On_Order').AsInteger ;
              sdTemp.SDCost := sdTemp.SDCost + FieldByName('Purch_Value').AsFloat /
                                                 GetPartSQL.FieldByName('Purch_Pack_Quantity').AsInteger ;
            end;
            Next ;
          end ;
        end;
      end;

      {Here is where it actually processes the STORE STOCK records} ;
      With GetStockSQL do
      begin
        {Check for STORE STOCK} ;
        Close ;
        ParamByName('Part_Store').AsInteger := iStore ;
        ParamByName('Part').AsString := PartEdit.Text ;
        Open ;
        First ;
        While not EOF do
        begin
          iLevel := 1 ;
          iRecCode := FieldByName('Store_Stock').AsInteger ;
          sBin := FieldByName('Part_Bin').AsString ;
          sLot := FieldByName('Part_Store_Lot').AsString ;
          If sBin <> '' then
            iLevel := iLevel + 1 ;
          If sBin <> sPrevBin then
          begin
            tnTemp := StockTreeView.Items.AddChild(tnTempLast[iLevel - 1],'B') ;
            tnTemp.ImageIndex := 4 ;
            tnTemp.SelectedIndex := 4 ;
            sdTemp := TStockDet.Create(iRecCode,'B','Bin: ' + FieldByName('Part_Bin').AsString,
                                                 0,0,0,0,0) ;
            tnTemp.Data := sdTemp ;
            sPrevBin := sBin ;
            sPrevLot := '' ;
            tnTempLast[iLevel] := tnTemp ;
          end;
          If sLot <> '' then
            iLevel := iLevel + 1 ;
          If sLot <> sPrevLot then
          begin
            tnTemp := StockTreeView.Items.AddChild(tnTempLast[iLevel - 1],'L') ;
            if FieldByName('invoice_upfront').asString = 'Y' then
            begin
              tnTemp.ImageIndex := 12 ;
              tnTemp.SelectedIndex := 12 ;
            end
            else
            begin
              tnTemp.ImageIndex := 6 ;
              tnTemp.SelectedIndex := 6 ;
            end;
            sdTemp := TStockDet.Create(iRecCode,'L',sLotText + ': ' + FieldByName('Part_Store_Lot').AsString,
                                                 0,0,0,0,0) ;
            tnTemp.Data := sdTemp ;
            sPrevLot := sLot ;
            tnTempLast[iLevel] := tnTemp ;
          end;
          {All the required records have been created so go back up the details} ;
          {Adding in the quantities} ;
          tnTempLastSave := tnTempLast[iLevel] ;
          iQty := FieldByName('Store_Quantity').AsInteger ;
          iAlloc := FieldByName('Quantity_Allocated').AsInteger ;
          iPack := FieldByName('Stock_Pack_Quantity').AsInteger ;
          rCost := FieldByName('Store_Cost').AsFloat ;
          sdTemp.SDQty := iQty ;
          sdTemp.SDAlloc := iAlloc ;
          sdTemp.SDCost := rCost ;
          sdTemp.Paid := (FieldByName('invoice_upfront').asString = 'Y');
          {Put the PACK SIZE into the lowest level ONLY, because the upper levels may be a mix of sizes} ;
          sdTemp.SDPack := iPack ;
          While Assigned(tnTempLastSave.Parent) do
          begin
            tnTempLastSave := tnTempLastSave.Parent ;
            sdTemp := tnTempLastSave.Data ;
            sdTemp.SDQty := sdTemp.SDQty + iQty ;
            sdTemp.SDAlloc := sdTemp.SDAlloc + iAlloc ;
            sdTemp.SDCost := sdTemp.SDCost + rCost ;
          end;
          {Now go and get the stock allocations}
          With GetAllocSQL do
          begin
            Close ;
            ParamByName('Store_Stock').AsInteger := GetStockSQL.FieldByName('Store_Stock').AsInteger ;
            Open ;
            First ;
            While EOF = False do
            begin
              tnTemp := StockTreeView.Items.AddChild(tnTempLast[iLevel],'A') ;
              tnTemp.ImageIndex := 8 ;
              tnTemp.SelectedIndex := 8 ;
              If FieldByName('Purch_Ord_No').AsString <> '' then
                If FieldByName('Supplier').AsString = '' then
                  sAllocDescr := 'Alloc - Store Ord: ' + FieldByName('Purch_Ord_No').AsString
                else
                  sAllocDescr := 'Alloc - Purch Ord: ' + FieldByName('Purch_Ord_No').AsString ;

              If FieldByName('Sales_Order').AsString <> '' then
                sAllocDescr := 'Alloc - Sales Order: ' + FieldByName('Sales_Order').AsString ;

              sdTemp := TStockDet.Create(iRecCode, 'A',sAllocDescr, 0,FieldByName('Quantity_Allocated').AsInteger,0,0,0)  ;
              tnTemp.Data := sdTemp ;
              next ;
            end;
          end;
          Next;
        end;
      end;
      Next ;
    end;
  end;

  {Now go through and display the details} ;
  For iTempCount := StockTreeView.Items.Count - 1 downto 0 do
  begin
    sdTemp := StockTreeView.Items[iTempcount].Data ;
    If (sdTemp.SDQty = 0) and (sdTemp.SDAlloc = 0) and (sdTemp.SDOnOrd = 0) and
        (sdTemp.SDCost = 0) and (sdTemp.SDTyp <> 'T') then
    begin
      sdTemp.Free ;
      StockTreeView.Items.Delete( StockTreeView.Items[iTempcount]) ;
      Continue ;
    end;

    case StockTreeView.Items[iTempcount].level of
      0:
        begin
          StockTreeView.Items[iTempcount].Text := sdTemp.SDDescr + ' - ' +
                                             IntToStr(sdTemp.SDQty) + ' / £' +
                                             CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(sdTemp.SDCost));
        end;
      3:
        begin
          StockTreeView.Items[iTempcount].Text := sdTemp.SDDescr + ' - ' +
                                             IntToStr(sdTemp.SDQty) + ' / £' +
                                             CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(sdTemp.SDCost))
        end;
      else
        begin
          StockTreeView.Items[iTempcount].Text := sdTemp.SDDescr;
        end;
    end;
  end;

  If StockTreeView.Items.Count > 0 then
  begin
    StockTreeView.Items[0].Expanded := True ;
    StockTreeView.FullExpand;
    StockTreeViewClick(Self) ;
  end;
end;

Constructor TStockDet.Create(const Rec: Integer; Typ, Descr: String; Qty, Alloc, OnOrd, Pack: Integer;
                                   Cost: Real) ;
begin
SDRec := Rec ;
SDTyp := Typ ;
SDDescr := Descr ;
SDQty := Qty ;
SDAlloc := Alloc ;
SDOnOrd := OnOrd ;
SDPack := Pack ;
SDCost := Cost ;
end;

procedure TStockDet.SetRec(const Value: Integer) ;
begin
SDRec := Value ;
end;

procedure TStockDet.SetTyp(const Value: String) ;
begin
SDTyp := Value ;
end;

procedure TStockDet.SetDescr(const Value: String) ;
begin
SDDescr := Value ;
end;

procedure TStockDet.SetQty(const Value: Integer) ;
begin
SDQty := Value ;
end;

procedure TStockDet.SetAlloc(const Value: Integer) ;
begin
SDAlloc := Value ;
end;

procedure TStockDet.SetOnOrd(const Value: Integer) ;
begin
SDOnOrd := Value ;
end;

procedure TStockDet.SetPack(const Value: Integer) ;
begin
SDPack := Value ;
end;

procedure TStockDet.SetCost(const Value: Real) ;
begin
SDCost := Value ;
end;


procedure TSTStkEnqFrm.FormActivate(Sender: TObject);
begin
StockTreeView.Images := TreeImageList ;
if part <> '' then
  begin
  PartEdit.Text := Part;
  PartDescrEdit.Text := PartDesc;
  LoadTreeViews(Self);
  end;
end;

procedure TSTStkEnqFrm.MoveBitBtnClick(Sender: TObject);
Var
sdTemp: TStockDet ;
iTyp: Integer ;
begin
sdTemp := TTreeNode(StockTreeView.Selected).data ;
iTyp := Pos(sdTemp.Typ, 'TSBLAO') ;
If sdTemp.Typ <> 'T' then
   begin
   With GetStoreStockSQL do
        begin
        Close ;
        ParamByName('Store_Stock').AsInteger := sdTemp.Rec ;
        Open ;
        First ;
        end;
   end;
STPrtEnqMovFrm := TSTPrtEnqMovFrm.Create(Self);
try
   STPrtEnqMovFrm.sPart := PartEdit.Text;
   STPrtEnqMovFrm.dFrom := 0;
   STPrtEnqMovFrm.dTo := 0;
   If iTyp < 2 then
      STPrtEnqMovFrm.iStore := 0
   else
      If iTyp = 2 then
         STPrtEnqMovFrm.iStore := sdTemp.Rec
      else
         STPrtEnqMovFrm.iStore := GetStoreStockSQL.FieldByName('Part_Store').AsInteger ;
   If iTyp < 3 then
      STPrtEnqMovFrm.sBin := ''
   else
      STPrtEnqMovFrm.sBin := GetStoreStockSQL.FieldByName('Part_Bin').AsString ;
   If iTyp < 4 then
      STPrtEnqMovFrm.sLot := ''
   else
      STPrtEnqMovFrm.sLot := GetStoreStockSQL.FieldByName('Part_Store_Lot').AsString ;
   STPrtEnqMovFrm.ShowModal;
finally
   STPrtEnqMovFrm.Free;
   end;
end;

procedure TSTStkEnqFrm.StockTreeViewClick(Sender: TObject);
begin
MoveBitBtn.Enabled := Assigned(StockTreeView.Selected) ;
end;

procedure TSTStkEnqFrm.setPart(const Value: string);
begin
  fPart := Value;
end;

procedure TSTStkEnqFrm.setPartDesc(const Value: string);
begin
  fPartDesc := Value;
end;

procedure TSTStkEnqFrm.EditStockRecord;
var
  storeStock: TStoreStock;
  sdTemp: TStockDet;
begin
  sdTemp := TTreeNode(StockTreeView.Selected).data ;
  storeStock := TStoreStock.Create;
  try
    storeStock.id := sdTemp.Rec ;
    storeStock.load;
    if storeStock.quantityAllocated > 0 then
    begin
      if messageDlg('Stock has been allocated from this lot. You can only view the details.'#10#13+
                 'Click OK to view the details, or Cancel to return to the list screen.',
                 mtWarning, [mbOK,mbCancel], 0) = mrOK then
      begin
        storeStock.view;
      end
      else
      begin

      end;
    end
    else
    begin
      storeStock.edit;
      if storeStock.invoiceUpfront then
      begin
        StockTreeView.Selected.ImageIndex := 12;
        StockTreeView.Selected.SelectedIndex := 12;
      end
      else
      begin
        StockTreeView.Selected.ImageIndex := 6;
        StockTreeView.Selected.SelectedIndex := 6;
      end;
      sdTemp.SDCost := storeStock.storeCost;
      sdTemp.SDPack := storeStock.stockPackQuantity;
      StockTreeView.Selected.Text := sdTemp.SDDescr + ' - ' +
                             IntToStr(sdTemp.SDQty) + ' / £' +
                             CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(sdTemp.SDCost));
    end;
  finally

    storeStock.Free;
  end;
end;

procedure TSTStkEnqFrm.Edit1Click(Sender: TObject);
begin
  if StockTreeView.Selected.level = 3 then
  begin
    EditStockRecord;
  end;
end;

procedure TStockDet.SetPaid(const Value: boolean);
begin
  FPaid := Value;
end;

end.
