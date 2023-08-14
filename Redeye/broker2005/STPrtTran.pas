unit STPrtTran;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ComCtrls, Buttons, ExtCtrls, ImgList, Db, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TStockDet     = class;

  TStockNumber = class
  private
    FSILine: integer;
    FItemTo: string;
    FItemFrom: string;
    FParent: TStockDet;
    procedure SetItemFrom(const Value: string);
    procedure SetItemTo(const Value: string);
    procedure SetSILine(const Value: integer);
    procedure SetParent(const Value: TStockDet);
  public
    constructor Create(StockDet : TStockDet);
    destructor Destroy; override;
    function Clone : TStockNumber;
    property ItemFrom: string read FItemFrom write SetItemFrom;
    property ItemTo: string read FItemTo write SetItemTo;
    property Parent: TStockDet read FParent write SetParent;
    property SILine: integer read FSILine write SetSILine;
  end;

  TStockNumbers  = class
  private
    FItems: TList;
    FParent: TStockDet;
    function GetCount: integer;
    function GetItems(Index: integer): TStockNumber;
    procedure SetItems(Index: integer; const Value: TStockNumber);
  public
    constructor Create(StockDet : TStockDet);
    destructor Destroy; override;
    procedure Add(aLine : TStockNumber);
    procedure Clear;
    function  Clone : TStockNumbers;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TStockNumber read GetItems write SetItems;
      default;
    property Parent : TStockDet read FParent;
  end;

  TStockDet = class
  Private
    SDCode: Integer ;
    SDTyp: Byte ;
    SDBin: String;
    SDLot: String ;
    SDDate: TDateTime;
    SDQty: Integer;
    SDQtyAdj: Integer ;
    SDAlloc: Integer ;
    SDAllocAdj: Integer ;
    SDCost: Real;
    SDCostAdj: Real;
    SDPackSize: Integer ;
    SDStockDesc: String ;
    SDInvUpFront: String ;
    SDSetsInPad: Integer;
    SDPONumber: real;
    FStockNumbers: TStockNumbers;
    Procedure SetCode(const Value: integer);
    Procedure SetTyp(const Value: byte);
    Procedure SetBin(const Value: string);
    Procedure SetLot(const Value: string);
    Procedure SetDate(const Value: TDateTime);
    Procedure SetQty(const Value: Integer);
    Procedure SetQtyAdj(const Value: Integer);
    Procedure SetAlloc(const Value: Integer);
    Procedure SetAllocAdj(const Value: Integer);
    Procedure SetCost(const Value: Real);
    Procedure SetCostAdj(const Value: Real);
    Procedure SetPackSize(const Value: Integer);
    procedure SetStockDesc(const Value: string);
    procedure setInvUpfront(const Value: string);
    procedure SetSetsInPad(const Value: integer);
    procedure SetPONumber(const Value: real);
  Public
    Constructor Create(const Code: Integer; Typ: Byte; Bin, Lot: string;
                             Date: TDateTime;
                             Qty, QtyAdj, Alloc, AllocAdj: Integer;
                             Cost, CostAdj: Real;
                             PackSize, SetsInPad: Integer;
                             StockDesc, InvUpfront: String; PONumber: real; Numbers: TStockNumbers) ;
    property Code: integer read SDCode write SetCode ;
    property Typ: byte read SDTyp write SetTyp ;
    property Bin: string read SDBin write SetBin ;
    property Lot: string read SDLot write SetLot ;
    property Date: TDateTime read SDDate write SetDate ;
    property Qty: integer read SDQty write SetQty ;
    property QtyAdj: integer read SDQtyAdj write SetQtyAdj ;
    property Alloc: integer read SDAlloc write SetAlloc ;
    property AllocAdj: integer read SDAllocAdj write SetAllocAdj ;
    property Cost: real read SDCost write SetCost ;
    property CostAdj: real read SDCostAdj write SetCostAdj ;
    property PackSize: integer read SDPackSize write SetPackSize ;
    property StockDesc: string read SDStockDesc write SetStockDesc ;
    property InvUpfront: string read SDInvUpfront write setInvUpfront ;
    property Numbers : TStockNumbers read FStockNumbers;
    property SetsInPad: integer read SDSetsInPad write SetSetsInPad;
    property PONumber: real read SDPONumber write SetPONumber;
  end;
  TSTPrtTranFrm = class(TForm)
    TreeImageList: TImageList;
    GetPOLinesSQL: TFDQuery;
    UpdPOLineSQL: TFDQuery;
    CheckPOStatusSQL: TFDQuery;
    UpdPOStatusSQL: TFDQuery;
    ToDataTreeView: TTreeView;
    GetPartPackSQL: TFDQuery;
    GetOrdAllocsSQL: TFDQuery;
    UpdPFJStatusSQL: TFDQuery;
    DelOrdAllocSQL: TFDQuery;
    GetSOTransSQL: TFDQuery;
    GetSOTranSQL: TFDQuery;
    DelSOTranSQL: TFDQuery;
    UpdSOTranSQL: TFDQuery;
    qryZero: TFDQuery;
    AddStStkSIqry: TFDQuery;
    GetStStkSIqry: TFDQuery;
    pnlTop: TPanel;
    Label3: TLabel;
    QtyLabel: TLabel;
    MovedLabel: TLabel;
    GRNGroupBox: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PORefEdit: TEdit;
    SuppNameEdit: TEdit;
    GRNEdit: TEdit;
    PartGroupBox: TGroupBox;
    Label2: TLabel;
    Label8: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    PartDescrEdit: TEdit;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    QtyMemo: TMemo;
    MovedMemo: TMemo;
    pnlBottom: TPanel;
    ToPart2Label: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    ToPartLabel: TLabel;
    pnlCentre: TPanel;
    pnlCentreLeft: TPanel;
    FromGroupBox: TGroupBox;
    FromStoreLabel: TLabel;
    FromDetsLabel: TLabel;
    FromStoreDBLookupComboBox: TDBLookupComboBox;
    FromTreeView: TTreeView;
    pnlCentreRight: TPanel;
    ToGroupBox: TGroupBox;
    ToStoreLabel: TLabel;
    ToDetsLabel: TLabel;
    ToStoreDBLookupComboBox: TDBLookupComboBox;
    ToTreeView: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MoveTypeDBLookupComboBoxClick(Sender: TObject);
    procedure PartBitBtnClick(Sender: TObject);
    procedure PartSelected(TempPart: String);
    procedure DateBitBtnClick(Sender: TObject);
    procedure SaveMemoField(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    function FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
    procedure SetTreeText(tnTempSBT: TTreeNode);
    procedure ToStoreDBLookupComboBoxClick(Sender: TObject);
    procedure FromTreeViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ToTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ToTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SetTreeQty(tnTempSBT: TTreeNode; iTempQty, ITempAlloc: Integer; bTempAdj, bTempSetText: ByteBool);
    procedure OKBitBtnClick(Sender: TObject);
    procedure TreeViewClearFrom(Sender: TObject);
    procedure TreeViewClearTo(Sender: TObject);
    procedure SetUpdatedState(bTempUpd: ByteBool);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure LoadTreeViews(Sender: TObject);
    procedure LoadTreeViewTo(Sender: TObject);
    procedure LoadTreeViewFrom(Sender: TObject);
    procedure FromStoreDBLookupComboBoxClick(Sender: TObject);
    procedure LoadTreeViewFromStore(sTempPart: String);
    procedure LoadTreeViewFromPO(Sender: TObject);
    procedure ShowToPart(TempPart: String);
    procedure LoadTreeViewToStore(sTempPart: String);
    procedure UpdToDataTree(TempPart: String);
    procedure FromTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure UpdStoreStock(TempTN: TTreeNode; sTempPart: String; iTempStore: Integer) ;
    procedure UpdPOLine(TempTN: TTreeNode) ;
    procedure ToTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure FromTreeViewDblClick(Sender: TObject);
    procedure CheckFromVisible(Sender: TObject);
    procedure ToTreeViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure AutoAllocateStock(Sender: TObject);
    procedure LoadTreeViewFromTrans(Sender: TObject);
    procedure UpdTransLine(TempTN: TTreeNode) ;
    function CheckIfMixingPacks(iTempFromPack,iTempToPack: Integer): Bytebool;
    procedure DelStoreStockNumbers(tempStk: TStockDet);
    procedure UpdStoreStockNumbers(tempStk: TStockDet);
    procedure QtyMemoKeyPress(Sender: TObject; var Key: Char);
    function SetFromNumbers(tempFrom, tempTo: TStockDet): TStockDet;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sOldValue, sMoveTypeIn, sMoveTypeOut, sLotText: String;
    tnTempTotal, tnTempBin, tnTempLot: TTreeNode ;
    bFromBins, bToBins, bFromLots, bToLots, bUseSerialNos, bNumbered: ByteBool ;
    StockDet: TStockDet ;
    sListToPart: String ;
    slSNs: TStringList ;
    MoveDate: tDateTime;
    iToTreeViewScrollPoint: Integer;
  public
    { Public declarations }
    sFromName, sPORef, sMoveType: String ;
    iPOrd, iPORef, iStore, iStoreFrom: Integer ;
    bOK, bStore_Ord: ByteBool ;
  end;

var
  STPrtTranFrm: TSTPrtTranFrm;

implementation

uses STStockDM, STPrtMnt, DateSelV5, STPrtTransQty, STPrtTransRecv,
  STPrtTransSN, STLUStStkNumbers, pbDatabase, ccscommon, pbMainMenu;

{$R *.DFM}

procedure TSTPrtTranFrm.FormCreate(Sender: TObject);
begin
STStockDataMod := TSTStockDataMod.Create(Self) ;
slSNs := TStringList.Create ;
FromTreeView.Images := TreeImageList ;
ToTreeView.Images := TreeImageList ;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TSTPrtTranFrm.FormDestroy(Sender: TObject);
begin
STStockDataMod.Free ;
TreeViewClearFrom(Self) ;
TreeViewClearTo(Self) ;
slSNs.Free ;
end;

procedure TSTPrtTranFrm.FormActivate(Sender: TObject);
begin
iToTreeViewScrollPoint := 0 ;
bOK := False ;
FromDetsLabel.Caption := '' ;
ToDetsLabel.Caption := '' ;
With STStockDataMod.GetMoveTypeSQL do
     begin
     Close ;
     ParamByName('Part_Movement_Type').AsString := sMoveType ;
     Open ;
     First ;
     end;
With STStockDataMod.GetStoresSQL do
     begin
     Close ;
     Open ;
     end;
DateEdit.Text := DateToStr(Date) ;
MoveDate := Date;
{DISPLAY FROM/TO HERE} ;
sMoveTypeIn := STStockDataMod.GetMoveTypeSQL.FieldByName('Part_Move_Type_In').AsString ;
sMoveTypeOut := STStockDataMod.GetMoveTypeSQL.FieldByName('Part_Move_Type_Out').AsString ;
PartGroupBox.Visible := (Pos(sMoveTypeIn,'PT') = 0) ;
GRNGroupBox.Visible := (Pos(sMoveTypeIn,'PT') > 0) ;
FromStoreLabel.Visible := (sMoveTypeIn = 'S')  ;
FromStoreDBLookupComboBox.Visible := (sMoveTypeIn = 'S')  ;
if sMoveTypeIn = 'S' then
  begin
    FromStoreDBLookupComboBox.KeyValue := dmBroker.qryCompany.FieldByName('Default_Warehouse').AsInteger;
    FromStoreDBLookupComboBoxClick(Self);
  end
  else
  if sMoveTypeIn = 'B' then
  begin
    ToStoreDBLookupComboBox.KeyValue := dmBroker.qryCompany.FieldByName('Default_Warehouse').AsInteger;
    ToStoreDBLookupComboBoxClick(Self);
  end;
ToStoreLabel.Visible := (sMoveTypeOut = 'S')  ;
ToStoreDBLookupComboBox.Visible := (sMoveTypeOut = 'S')  ;
QtyMemo.Visible := (sMoveTypeIn = 'B')  ;
QtyLabel.Visible := (SMoveTypeIn = 'B') ;
ToPartLabel.Visible := (Pos(sMoveTypeIn,'PT') > 0) ;
ToPart2Label.Visible := (Pos(sMoveTypeIn,'PT') > 0) ;
CloseBitBtn.Visible := (Pos(sMoveTypeIn,'PT') = 0) ;
Caption := 'Enter ' + STStockDataMod.GetMoveTypeSQL.FieldByName('Part_Move_Type_Descr').AsString + ' details';
If (Pos(sMoveTypeIn,'PT') > 0)  then
   begin
   PORefEdit.Text := sPORef ;
   SuppNameEdit.Text := sFromName ;
   ToStoreDBLookupComboBox.KeyValue := iStore ;
   ToStoreDBLookupComboBoxClick(Self) ;
   end;
LoadTreeViews(Self) ;
SetUpdatedState(False) ;
end;

procedure TSTPrtTranFrm.MoveTypeDBLookupComboBoxClick(Sender: TObject);
begin
{DISPLAY FROM/TO HERE} ;
sMoveTypeIn := STStockDataMod.GetMoveTypesSQL.FieldByName('Part_Move_Type_In').AsString ;
sMoveTypeOut := STStockDataMod.GetMoveTypesSQL.FieldByName('Part_Move_Type_Out').AsString ;
FromStoreLabel.Visible := (sMoveTypeIn = 'S') ;
FromStoreDBLookupComboBox.Visible := (sMoveTypeIn = 'S') ;
ToStoreLabel.Visible := (sMoveTypeOut = 'S') ;
ToStoreDBLookupComboBox.Visible := (sMoveTypeOut = 'S') ;
QtyMemo.Visible := (sMoveTypeIn = 'B') ;
QtyLabel.Visible := (sMoveTypeIn = 'B') ;
LoadTreeViews(Self) ;
end;

procedure TSTPrtTranFrm.PartBitBtnClick(Sender: TObject);
begin
STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
Try
   STPrtMntFrm.bIs_LookUp := True ;
   STPrtMntFrm.sCode := PartEdit.Text ;
   STPrtMntFrm.ShowModal ;
   If STPrtMntFrm.bOK = True then
      begin
      PartEdit.Text := STPrtMntFrm.sCode ;
      PartDescrEdit.Text := STPrtMntFrm.sCodeDescr ;
      PartSelected(PartEdit.Text);
      end;
Finally
   STPrtMntFrm.Free ;
   end;
LoadTreeViews(self) ;
end;

procedure TSTPrtTranFrm.PartSelected(TempPart: String);
begin
{PART SELECTED HERE} ;
end;

procedure TSTPrtTranFrm.DateBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
    MoveDate :=DateSelV5Form.MonthCalendar1.Date;
    LoadTreeViews(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTPrtTranFrm.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTPrtTranFrm.QtyMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit};
  TempStr := FormatMemoValue((Sender as TMemo).Lines[0], '####0', 'quantity', False);
  if TempStr = 'X' then
    begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
    end
  else
    begin  
    (Sender as TMemo).Text := TempStr;
    end;
LoadTreeViews(Self);
end;

function TSTPrtTranFrm.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
begin
  {Format the qunatity};
  if Trim(TempQty) = '' then
  begin
    Result := '';
    Exit;
  end;
  try
    begin
      Result := FormatFloat(TempFormat, StrToFloatDef(TempQty, 0, FormatSettings));
      if (StrToFloatDef(Result, 0, FormatSettings) < 0) and (TempNeg = False) then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    MessageDlg('Invalid ' + TempError + ' - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

procedure TSTPrtTranFrm.SetTreeText(tnTempSBT: TTreeNode);
Var
sTempTypeDescr, sTempDate, sTempLot: String ;
TempStockDet: TStockDet ;
iTempEmpty: integer ;
begin
TempStockDet := tnTempSBT.data ;
sTempLot := '' ;
Case TempStockDet.Typ of
     0: sTempTypeDescr := TempStockDet.Bin + ': ' ;
     1: sTempTypeDescr := 'Store: ' ;
     2: sTempTypeDescr := 'Bin: ' + TempStockDet.Bin ;
     3: sTempTypeDescr := sLotText + ': ' + TempStockDet.Lot ;
     4: begin
        sTempLot := Copy(TempStockDet.Lot,2,Length(TempStockDet.Lot) - 1) ;
        sTempTypeDescr := Trim(TempStockDet.Bin) + StringOfChar(' ', + 15 - Length(Trim(TempStockDet.Bin))) ;
        end;
     end;
If (TempStockDet.Qty + TempStockDet.QtyAdj) -
   (TempStockDet.Alloc + TempStockDet.AllocAdj) > 0 then
                        iTempEmpty := 0
   else
                        iTempEmpty := 1 ;
tnTempSBT.ImageIndex := (TempStockDet.Typ * 2) + iTempEmpty ;
tnTempSBT.SelectedIndex := (TempStockDet.Typ * 2) + iTempEmpty ;
If (TempStockDet.Date = 0) or (tnTempSBT.HasChildren) or (TempStockDet.Typ = 4) then
     sTempDate := ''
else
     sTempDate := DateToStr(TempStockDet.Date) + ' - ' ;
{If the item has NO children, show the qunatities in PACKS, otheriwse just show quantities} ;
If ((TempStockDet.Qty <> 0) or (TempStockDet.QtyAdj <> 0)) and (not tnTempSBT.HasChildren) then
        tnTempSBT.Text := sTempTypeDescr + ' ' + sTempDate + '(' + ShowInPacks(TempStockDet.Qty +
                          TempStockDet.QtyAdj,TempStockDet.PackSize) + '/' +
                          ShowInPacks(TempStockDet.Alloc + TempStockDet.AllocAdj,TempStockDet.PackSize) + ')' + sTempLot +
                          ' PackSize: ' + IntToStr(TempStockDet.PackSize)
else
        tnTempSBT.Text := sTempTypeDescr + ' ' + sTempDate + '(' + ShowInPacks(TempStockDet.Qty +
                          TempStockDet.QtyAdj,1) + '/' +
                          ShowInPacks(TempStockDet.Alloc + TempStockDet.AllocAdj,1) + ')' + sTempLot ;
end;

procedure TSTPrtTranFrm.ToStoreDBLookupComboBoxClick(Sender: TObject);
begin
With STStockDataMod.GetStoresSQL do
     begin
     bToBins := (FieldByName('Stock_Bins_In_Use').AsString = 'Y') ;
     bToLots := (FieldByName('Stock_Lots_In_Use').AsString = 'Y')
     end;
LoadTreeViewTo(Self) ;
end;

Constructor TStockDet.Create(const Code: Integer; Typ: Byte; Bin, Lot: string;
                             Date: TDateTime;
                             Qty, QtyAdj, Alloc, AllocAdj: Integer;
                             Cost, CostAdj: Real;
                             PackSize, SetsInPad: Integer;
                             StockDesc, InvUpfront: String; PONumber: real; Numbers: TStockNumbers) ;
begin
FStockNumbers := TStockNumbers.Create(Self);
SDCode := Code ;
SDTyp := Typ ;
SDBin := Bin ;
SDLot := Lot ;
SDDate := Date ;
SDQty := Qty ;
SDQtyAdj := QtyAdj ;
SDAlloc := Alloc ;
SDAllocAdj := AllocAdj ;
SDCost := Cost ;
SDCostAdj := CostAdj ;
SDPackSize := PackSize ;
if SetsInPad = 0 then
  SDSetsInPad := 1
else
  SDSetsInPad := SetsInPad;
SDStockDesc := StockDesc;
SDInvUpFront := InvUpfront;
end;

procedure TStockDet.SetCode(const Value: Integer) ;
begin
SDCode := Value ;
end;

procedure TStockDet.SetTyp(const Value: Byte) ;
begin
SDTyp := Value ;
end;

procedure TStockDet.SetBin(const Value: String) ;
begin
SDBin := Value ;
end;

procedure TStockDet.SetLot(const Value: String) ;
begin
SDLot := Value ;
end;

procedure TStockDet.SetDate(const Value: TDateTime) ;
begin
SDDate := Value ;
end;

procedure TStockDet.SetQty(const Value: Integer) ;
begin
SDQty := Value ;
end;

procedure TStockDet.SetQtyAdj(const Value: Integer) ;
begin
SDQtyAdj := Value ;
end;

procedure TStockDet.SetAlloc(const Value: Integer) ;
begin
SDAlloc := Value ;
end;

procedure TStockDet.SetAllocAdj(const Value: Integer) ;
begin
SDAllocAdj := Value ;
end;

procedure TStockDet.SetCost(const Value: Real) ;
begin
SDCost := Value ;
end;

procedure TStockDet.SetCostAdj(const Value: Real) ;
begin
SDCostAdj := Value ;
end;

procedure TStockDet.SetPackSize(const Value: Integer) ;
begin
SDPackSize := Value ;
end;

procedure TSTPrtTranFrm.FromTreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
If (Pos(sMoveTypeIn,'PT') > 0) then
   exit ;
If (Assigned(FromTreeView.Selected.Data) = False) then
   begin
   MessageDlg('You cannot move this item', mtError, [mbOK],0) ;
   end
else
   begin
   If FromTreeView.Selected.HasChildren then
      MessageDlg('You can only move individual items', mtError, [mbOK],0) ;
   If (TStockDet(FromTreeView.Selected.Data).Qty + TStockDet(FromTreeView.Selected.Data).QtyAdj) < 1 then
      MessageDlg('There is no stock to move', mtError, [mbOK],0) ;
   end;
end;

procedure TSTPrtTranFrm.ToTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
{If ((Source is TTreeView) = False )then
   Accept := ((Source as TTreeView).Name = 'FromTreeView') };
   // Scroll treeview when dragging close to border
   // Taken from GOOGLE
   //On the upper edge - scroll up
   if (y < 15) then
   begin
     SendMessage(ToTreeView.Handle,WM_VSCROLL,SB_LINEUP,0);
     ToTreeview.Invalidate;
   end
   // On the lower edge - scroll down
   else if (ToTreeView.Height - y < 15) then
   begin
     SendMessage(ToTreeView.Handle,WM_VSCROLL,SB_LINEDOWN,0);
     ToTreeview.Invalidate;
   end;
end;

procedure TSTPrtTranFrm.ToTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
tnFrom, tnTo, tnTemp, tnTempLastBin: TTreeNode ;
SDFrom, SDTo: TStockDet ;
iTempQty, iTempQty2, iTempQtyFrom, iTempPack, iTempCount, iTempCount2, iTempCount3: Integer ;
fTempCost, fTempCost2, fTempCostFrom: Real ;
sTempBin, sTempFR, sTempLot: String ;
bTempOK,bNonStkd: ByteBool ;
sdNumber: TStockNumber;
iNumber: integer;
stestFrom: string;
begin
{Actually decide what to do with the drop} ;
tnFrom := (Source as TTreeView).Selected ;
SDFrom := tnFrom.Data ;
tnTo := (Sender as TTreeView).GetNodeAt(x,y) ;
{Exit if not on top of anything} ;
If Assigned(tnTo) = False then
   exit ;
SDTo := tnTo.Data ;
If (sMoveTypeOut = 'S') and (bUseSerialNos) and (SDTo.Typ = 3) then
   begin
   {If we're using serial numbers and they drag onto a lot, prentend they dragged} ;
   {onto the parent item ie the BIN or STORE} ;
   tnTo := tnTo.Parent ;
   SDTo := tnTo.Data ;
   end;
If (sMoveTypeOut = 'S') and (bNumbered) and (SDTo.Typ = 3) then
   begin
   {If they drag onto a lot, and it's a numbered item, prentend they dragged} ;
   {onto the parent item ie the BIN or STORE} ;
   tnTo := tnTo.Parent ;
   SDTo := tnTo.Data ;
   end;
If (Pos(sMoveTypeIn,'PT') = 0)  then
   begin
   {NOT from a purchase order} ;
   STPrtTransQtyFrm := TSTPrtTransQtyFrm.Create(Self);
       try
       STPrtTransQtyFrm.bAllowBin := (SDTo.Typ = 1) and (bToBins = True) ;
       STPrtTransQtyFrm.iQty := (SDFrom.Qty + SDFrom.QtyAdj) - (SDFrom.Alloc + SDFrom.AllocAdj);
       STPrtTransQtyFrm.sPackSize := IntToStr(SDFrom.PackSize) ;
       STPrtTransQtyFrm.BisOpnBal := sMoveType = 'O';
       If sMoveTypeIn <> 'B' then
          begin
          {Not an incoming balance} ;
          If (SDFrom.Qty + SDFrom.QtyAdj) > 0 then
             STPrtTransQtyFrm.sCost := FloatToStr(((SDFrom.Cost + SDFrom.CostAdj) *
                                        (SDFrom.PackSize)) / (SDFrom.Qty + SDFrom.QtyAdj))
          else
             STPrtTransQtyFrm.sCost := '' ;
          end
       else
          begin
          STPrtTransQtyFrm.sCost := FloatToStr(STStockDataMod.GetPartSQL.FieldByName('Part_Purchase_Price').AsFloat) ;
          STPrtTransQtyFrm.sPackSize := IntToStr(STStockDataMod.GetPartSQL.FieldByName('purch_pack_Quantity').AsInteger) ;
          end;
       If ToStoreDBLookupComboBox.visible then
          begin
          STPrtTransQtyFrm.iPartStore := ToStoreDBLookupComboBox.KeyValue ;
          STPrtTransQtyFrm.sPartStoreName := ToStoreDBLookupComboBox.Text ;
          end
       else
          begin
          STPrtTransQtyFrm.iPartStore := 0 ;
          STPrtTransQtyFrm.sPartStoreName := '' ;
          end;
       STPrtTransQtyFrm.sPart := STStockDataMod.GetPartSQL.FieldByName('Part').AsString ;
       STPrtTransQtyFrm.sPartDescr := STStockDataMod.GetPartSQL.FieldByName('Part_Description').AsString ;
       STPrtTransQtyFrm.ShowModal;
       bTempOK := STPrtTransQtyFrm.bOK ;
       iTempPack := StrToInt(STPrtTransQtyFrm.PackSizeMemo.Text) ;
//       iTempQty := InpToSing(STPrtTransQtyFrm.QtyMemo.Text,iTempPack) ;
       iTempQty := strtoint(STPrtTransQtyFrm.memoQty.text);
       sTempBin := STPrtTransQtyFrm.BinEdit.Text ;
       fTempCost := StrToFloatDef(STPrtTransQtyFrm.CostMemo.Text, 0, FormatSettings) / iTempPack;
       if sMoveType = 'O' then
        begin
          SDFrom.StockDesc := STPrtTransQtyFrm.edtStckDsc.text;
          If STPrtTransQtyFrm.ChkBxInvUpFrnt.checked then
            SDFrom.InvUpfront := 'Y'
          else
            SDFrom.InvUpFront := 'N';
        end;
       finally
          STPrtTransQtyFrm.Free;
       end;
   end
else
   begin
   {From a purchase order} ;
   STPrtTransRecvFrm := TSTPrtTransRecvFrm.Create(Self);
       try
       STPrtTransRecvFrm.bAllowBin := (SDTo.Typ = 1) and (bToBins = True) ;
       STPrtTransRecvFrm.iQty := (SDFrom.Qty + SDFrom.QtyAdj) - (SDFrom.Alloc + SDFrom.AllocAdj);
       STPrtTransRecvFrm.iPack := SDFrom.PackSize ;
       STPrtTransRecvFrm.fCost := SDFrom.Cost ;
       STPrtTransRecvFrm.bFR := (Copy(SDFrom.Lot,1,1) = 'Y') ;
       STPrtTransRecvFrm.bStore_Ord := (sMoveTypeIn = 'T') ;
       If ToStoreDBLookupComboBox.visible then
          begin
          STPrtTransRecvFrm.iPartStore := ToStoreDBLookupComboBox.KeyValue ;
          STPrtTransRecvFrm.sPartStoreName := ToStoreDBLookupComboBox.Text ;
          end
       else
          begin
          STPrtTransRecvFrm.iPartStore := 0 ;
          STPrtTransRecvFrm.sPartStoreName := '' ;
          end;
       STPrtTransRecvFrm.sPart := STStockDataMod.GetPartSQL.FieldByName('Part').AsString ;
       STPrtTransRecvFrm.sPartDescr := STStockDataMod.GetPartSQL.FieldByName('Part_Description').AsString ;
       bNonStkd := STSTockDataMod.GetPartSQL.FieldBYName('Product_Class').AsString = 'NSTK';
  //     tnTo.MakeVisible := not(bNonStkd);
       STPrtTransRecvFrm.bAllowBin := not(bNonStkd);
       STPrtTransRecvFrm.ShowModal;
       bTempOK := STPrtTransRecvFrm.bOK ;
       iTempPack := StrToInt(STPrtTransRecvFrm.PackSizeMemo.Text) ;
       iTempQty := InpToSing(STPrtTransRecvFrm.QtyMemo.Text, iTempPack) ;
       if bNonStkd then
        sTempBin := 'Non Stocked'
       else
        sTempBin := STPrtTransRecvFrm.BinEdit.Text ;
       fTempCost := StrToFloatDef(STPrtTransRecvFrm.CostMemo.Text, 0, FormatSettings) / iTempPack ;
       If STPrtTransRecvFrm.FRCheckBox.Checked then
          sTempFR := 'Y'
       else
          sTempFR := 'N' ;
       finally
          STPrtTransRecvFrm.Free;
       end;
   end;
If bTempOK = False then
   exit ;
If (bToBins) and (SDTo.SDTyp = 1) then
   begin
   {If dragging onto the total, check if the entered bin exists} ;
   For iTempCount := 0 to (STPrtTranFrm.ToTreeView.Items.Count - 1) do
       If (TStockDet(STPrtTranFrm.ToTreeView.Items[iTempCount].Data).Bin = sTempBin) and
          (TStockDet(STPrtTranFrm.ToTreeView.Items[iTempCount].Data).Typ = 2)   then
          begin
          {if the bin does exists, pretend they just dragged on the bin} ;
          TNTo := ToTreeView.Items[iTempCount] ;
          SDTo := ToTreeView.Items[iTempCount].Data ;
          end;
   end;
{Dowmdate the TO view (RIGHT hand side of screen} ;
{If serial numbers are switched on, loop through for each individual item} ;
iTempQtyFrom := iTempQty ;
fTempCostFrom := fTempCost ;
If (bUseSerialNos) and (sMoveTypeOut = 'S') then
   begin
   iTempCount2 := iTempQty ;
   iTempQty := 1 ;
   end
else
   begin
   iTempCount2 := 1 ;
   end;
slSNs.Clear ;
{Nee to prompt for a serial number if:} ;
{Serial numbers are in use and we're moving into a store AND any ONE of the following} ;
{       We're NOT moving from a store or a transfer} ;
{       The type is less than 3 (not a LOT) } ;
{       The type is 4 (Order Line) and there is no serial number attached to the from LOT} ;
{ MesaageDlg(Inttostr(sdFrom.Typ) + '-' + sdFrom.Lot,0 } ;
If (bUseSerialNos) and (sMoveTypeOut = 'S') and
   ((Pos(sMoveTypeIn, 'ST') = 0) or (sdFrom.Typ < 3) or
                      ((sdFrom.Typ = 4) and (Length(sdFrom.Lot) < 2))) then
   begin
   {Prompt for a S/N} ;
   STPrtTransSNFrm := TSTPrtTransSNFrm.Create(Self) ;
      Try
      STPrtTransSNFrm.iNoOfSNs := iTempCount2 ;
      STPrtTransSNFrm.ShowModal ;
      bTempOK := STPrtTransSNFrm.bOK ;
      If bTempOK then
               For iTempcount3 := 1 to iTempCount2 do
                     slSNs.Add(STPrtTransSNFrm.SNStringGrid.Cells[1,iTempCount3]) ;
      Finally
            STPrtTransSNFrm.Free;
            end;
      end;
If bTempOK = False then
   exit ;
if bNumbered then
  begin
    STLUStStkNumbersFrm := TSTLUStStkNumbersFrm.create(self);
    try
      if (sMoveTypeOut = 'B') or (sMoveTypeOut = 'S') then
        begin
          STLUStSTkNumbersFrm.NumberedItems := sdFrom.Numbers.count;
          for iNumber := 0 to pred(sdFrom.Numbers.count) do
            begin
              STLUStSTkNumbersFrm.sgDetail.cells[0,iNumber+1] := sdFrom.Numbers[iNumber].ItemFrom;
              STLUStSTkNumbersFrm.sgDetail.cells[1,iNumber+1] := sdFrom.Numbers[iNumber].ItemTo;
            end;
        end;
      try
        STLUStSTkNumbersFrm.SetsPerPad := sdFrom.SDSetsInPad;
      except
        STLUStSTkNumbersFrm.SetsPerPad := 1;
      end;

      STLUStSTkNumbersFrm.MovementQty := iTempQty;
      STLUStSTkNumbersFrm.lblQuantity.caption := inttostr(iTempQty);
      STLUStSTkNumbersFrm.lblProduct.caption := STLUStSTkNumbersFrm.lblProduct.caption + ' ' +
                    STStockDataMod.GetPartSQL.FieldByName('Part').AsString;
      STLUStSTkNumbersFrm.lblDescription.caption := STLUStSTkNumbersFrm.lblDescription.caption +  ' ' +
                    STStockDataMod.GetPartSQL.FieldByName('Part_Description').AsString;
      STLUStStkNumbersFrm.showmodal;
      bTempOK := (STLUStStkNumbersFrm.Modalresult = idOK);
      if bTempOK then
        begin
//          sdTo.FStockNumbers.clear;
          for iNumber := pred(sdTo.FStockNumbers.Count) downto 0 do
            sdTo.FStockNumbers.Delete(iNumber);

          for iNumber := 1 to STLUStStkNumbersFrm.sgDetail.rowcount do
            begin
              if STLUStStkNumbersFrm.sgDetail.cells[0,iNumber] = '' then break;
              SDNumber := TStockNumber.create(sdTo);
              SDNumber.SILine := iNumber;
              SDNumber.ItemFrom := STLUStStkNumbersFrm.sgDetail.cells[0,iNumber];
              SDNumber.ItemTo := STLUStStkNumbersFrm.sgDetail.cells[1,iNumber];
              sdTo.FStockNumbers.add(SDNumber);
            end;
          {If movement out then reconstruct the numbers for From}
          if (sMoveTypeOut = 'B') or (sMoveTypeOut = 'S') then
            begin
              sdFrom := SetFromNumbers(sdFrom, sdTo);
            end;
        end;
    finally
      STLUStStkNumbersFrm.free;
    end;
  end;
If bTempOK = False then
   exit ;
For iTempCount := 1 to iTempCount2 do
    begin
    if ((bUseSerialNos) or (bToLots)) and (sMoveTypeOut = 'S') then
         begin
         if ((sMoveTypeIn <> 'S') or (SDFrom.Typ <> 3)) and
            ((sMoveTypeIn <> 'T') or (Length(SDFrom.Lot) < 2)) then
            begin
            {The stock does not already have a LOT or SERIAL NO attached} ;
            If bUseSerialNos then
               sTempLot := slSNs[iTempcount - 1]
            else
               sTempLot := STStockDataMod.GetNextLot(PartEdit.Text) ;
            end
    else
            begin
            If sMoveTypeIn <> 'T' then
               sTempLot := SDFrom.Lot
            else
               sTempLot := Copy(SDFrom.Lot, 2, Length(SDFrom.Lot) - 1) ;
            end;
         end;
    Case SDTo.Typ of
     3,0:  begin
         {Dragging onto a LOT or a OUTGOING total} ;
         If SDTo.Typ = 0 then
                begin
                {If it's an outgoing total, just set the pack to the current packsize} ;
                SDTo.PackSize := iTempPack ;
                end
         else
                begin
                {If it's a LOT and the packsizes are mixed, give the operator the option to abort} ;
                If CheckIfMixingPacks(iTempPack,SDTo.PackSize) then
                        exit ;
                end;
         SetTreeQty(tnTo, iTempQty, 0, True, True) ;
         SDTo.CostAdj := SDTo.CostAdj + (fTempCost * iTempQty) ;
         end;
     2:  begin
         {Dragging onto BIN} ;
         If (bToLots = True) or (bUseSerialNos = True) then
            begin
            {...and the TO store has LOTS} ;
            {So create a new lot in the bin} ;
            tnTemp := ToTreeView.Items.AddChild(tnTo, '') ;
            StockDet := TStockDet.Create(0,3,SDTo.Bin,
                                          sTempLot,
                                          SDFrom.Date,
                                          0,iTempQty,
                                          0,0,
                                          0,(fTempCost * iTempQty), iTempPack,SDFrom.SetsinPad,
                                          SDFrom.StockDesc, SDFrom.InvUpfront, SDFrom.PONumber, nil);
            StockDet.FStockNumbers.clear;
            for iNumber := 0 to pred(SDTo.Numbers.count) do
              begin
                SDNumber := TStockNumber.create(stockdet);
                SDNumber.SILine := sdTo.Numbers[iNumber].SILine;
                SDNumber.ItemFrom := sdTo.Numbers[iNumber].ItemFrom;
                SDNumber.ItemTo := sdTo.Numbers[iNumber].ItemTo;
                StockDet.FStockNumbers.add(SDNumber);
              end;
            tnTemp.Data := StockDet ;
            SetTreeText(tnTemp) ;
            SetTreeQty(tnTo, iTempQty, 0, True, True) ;
            end
         else
            begin
            {...the TO store has NO LOTS} ;
            {so just add it into the bin} ;
            {If the packsizes are mixed, give the operator the option to abort} ;
            If CheckIfMixingPacks(iTempPack,SDTo.PackSize) then
                exit ;
            SetTreeQty(tnTo, iTempQty, 0, True, True) ;
            SDTo.CostAdj := SDTo.CostAdj + (fTempCost * iTempQty) ;
            end;
         end;
     1:  begin
         {Dragging into total} ;
         tnTemp := tnTo ;
         If bToBins then
               begin
               {There are bins} ;
               {Create a bin} ;
               If (bToLots) or (bUseSerialNos) then
                  begin
                  fTempCost2 := 0 ;
                  iTempQty2 := 0 ;
                  end
               else
                  begin
                  fTempCost2 := fTempCost ;
                  iTempQty2 := iTempQty ;
                  end;
               If iTempCount = 1 then
                  begin
                  {You only create the bin the 1st time through because subsequent} ;
                  {loops through are additional serial numbers};
                  tnTemp := ToTreeView.Items.AddChild(tnTemp, '') ;
                  StockDet := TStockDet.Create(0,2,sTempBin,
                                          '',
                                          SDFrom.Date,
                                          0,0,
                                          0,0,
                                          0,(fTempCost2 * iTempQty2),iTempPack, SDFrom.SetsInPad,
                                          SDFrom.StockDesc, SDFrom.InvUpfront, SDFrom.PONumber, nil);
                  StockDet.FStockNumbers.clear;
                  for iNumber := 0 to pred(SDTo.Numbers.count) do
                    begin
                      SDNumber := TStockNumber.create(stockdet);
                      SDNumber.SILine := sdTo.Numbers[iNumber].SILine;
                      SDNumber.ItemFrom := sdTo.Numbers[iNumber].ItemFrom;
                      SDNumber.ItemTo := sdTo.Numbers[iNumber].ItemTo;
                      StockDet.FStockNumbers.add(SDNumber);
                    end;
                  tnTemp.Data :=  StockDet ;
                  tnTempLastBin := tnTemp ;
                  If (bToLots = False) and (bUseSerialNos= False) then
                     SetTreeQty(tnTemp, iTempQty, 0, True, True) ;
                  end
               end;
         If (bToLots) or (bUseSerialNos) then
               begin
              {Create a lot} ;
               tnTemp := ToTreeView.Items.AddChild(tnTemp, '') ;
               StockDet := TStockDet.Create(0,3,sTempBin,
                                          sTempLot,
                                          SDFrom.Date,
                                          0,0,
                                          0,0,
                                          0,(fTempCost * iTempQty),iTempPack,SDFrom.SetsInPad,
                                          SDFrom.StockDesc,SDFrom.InvUpfront, SDFrom.PONumber, nil);
               StockDet.FStockNumbers.clear;
               for iNumber := 0 to pred(SDTo.Numbers.count) do
                begin
                  SDNumber := TStockNumber.create(stockdet);
                  SDNumber.SILine := sdTo.Numbers[iNumber].SILine;
                  SDNumber.ItemFrom := sdTo.Numbers[iNumber].ItemFrom;
                  SDNumber.ItemTo := sdTo.Numbers[iNumber].ItemTo;
                  StockDet.FStockNumbers.add(SDNumber);
                end;
               tnTemp.Data :=  StockDet ;
               SetTreeQty(tnTemp, iTempQty, 0, True, True) ;
               end;
     If (bToBins = False) and (bTolots = False) and (bUseSerialNos = False)then
            begin
            If SDTo.Packsize = 0 then
                SDTo.PackSize := iTempPack ;
            {If the packsizes are mixed, give the operator the option to abort} ;
            If CheckIfMixingPacks(iTempPack,SDTo.PackSize) then
                exit ;
            SetTreeQty(tnTo, iTempQty, 0, True,True) ;
            SDTo.CostAdj := SDTo.CostAdj + (fTempCost * iTempQty) ;
            SDTo.Date :=  StrToDate(DateEdit.Text);
            {need to set the date, else 0 is passed as the date};
            end;
         end;
     end;
     If Assigned(tnTempLastBin) then
         begin
         {Save the last created bin in case of serial numbers} ;
         tnTo := tnTempLastBin ;
         SDTo := tnTempLastBin.Data ;
         end;
     Next;
     end;
ToTreeView.FullExpand ;
{Now do the FROM tree} ;
If (Pos(sMoveTypeIn,'PT') = 0)  then
   begin
   SDFrom.SDCostAdj := SDFrom.SDCostAdj - (iTempQtyFrom * fTempCostFrom) ;
   SetTreeQty(tnFrom,  0 - iTempQtyFrom, 0 , True, True) ;
   end
else
   begin
   {This is for purchase orders} ;
   {Store the Fully_Received flag as Y or N in the SDLot} ;
   If sMoveTypeIn = 'T' then
      SDFrom.SDLot := sTempFR + Copy(SDFrom.SDLot,2,Length(SDFrom.SDLot) - 1)
   else
      SDFrom.SDLot := sTempFR ;
   SetTreeQty(tnFrom,  0 , iTempQtyFrom, True, True) ;
   end;
MovedMemo.Text := IntToStr(StrToInt(MovedMemo.Text) + iTempQty) ;
SetUpdatedState(True) ;
end;

procedure TSTPrtTranFrm.SetTreeQty(tnTempSBT: TTreeNode; iTempQty, ITempAlloc: Integer; bTempAdj, bTempSetText: ByteBool);
Var
tnTempSBT2: TTreeNode ;
TempStockDet: TStockDet ;
bNotDone: ByteBool ;
begin
{Update the qunatities backwards through the tree} ;
tnTempSBT2 := tnTempSBT ;
bNotDone := True;
While bNotDone do
      begin
      TempStockDet := tnTempSBT2.Data ;
      If bTEmpAdj then
         begin
         TempStockDet.QtyAdj := TempStockDet.QtyAdj + iTempQty ;
         TempStockDet.AllocAdj := TempStockDet.AllocAdj + iTempAlloc ;
         end
      else
         begin
         TempStockDet.Qty := TempStockDet.Qty + iTempQty ;
         TempStockDet.Alloc := TempStockDet.Alloc + iTempAlloc ;
         end;
      If bTempSetText then
         SetTreeText(tnTempSBT2) ;
      If Assigned(tnTempSBT2.Parent) then
          tnTempSBT2 := tnTempSBT2.Parent
      else
          bNotDone := False ;
      end;
end;


procedure TSTPrtTranFrm.OKBitBtnClick(Sender: TObject);
Var
iTempCount: Integer ;
TempTreeView: TTreeView ;
iTempPassNo, iTempStore: Integer ;
sTempPart, sTempPassMoveType: String ;
begin
If (Pos(sMoveTypeIn,'PT') > 0 ) and (GRNEdit.Text = '') then
   If MessageDlg('Proceed without entering a GRN number?' , mtConfirmation, [mbNo,mbYes],0) = mrNo then
      begin
      GRNEdit.SetFocus ;
      exit ;
      end;
UpdToDataTree(sListToPart) ;
For iTempPassNo := 1 to 2 do
    begin
    Case iTempPassNo of
         1: begin
            If sMoveTypeIn = 'B' then
                continue ;
            TempTreeView := FromTreeView ;
            If sMoveTypeIn = 'S' then
               iTempStore := FromStoreDBLookupComboBox.KeyValue ;
            sTempPassMoveType := sMoveTypeIn ;
            end;
         2: begin
            If sMoveTypeOut = 'B' then
                continue ;
            TempTreeView := ToDataTreeView ;
            If sMoveTypeOut = 'S' then
               iTempStore := ToStoreDBLookupComboBox.KeyValue ;
            sTempPassMoveType := sMoveTypeOut ;
            end;
         end;
         For iTempCount := 0 to (TempTreeView.Items.Count - 1) do
             begin
             {Loop through the nodes in the FROM tree} ;
             If Pos(sMoveTypeIn, 'PT') = 0 then
               sTempPart := PartEdit.Text
             else
               sTempPart := TempTreeView.Items[iTempCount].Text ;
             If sTempPassMoveType = 'S' then
               UpdStoreStock(TempTreeView.Items[iTempCount], sTempPart, iTempStore) ;
             If sTempPassMoveType = 'P' then
               UpdPOLine(TempTreeView.Items[iTempCount]) ;
             If sTempPassMoveType = 'T' then
               UpdTransLine(TempTreeView.Items[iTempCount]) ;
             end;
         end;
If Pos(sMoveTypeIn, 'PT') > 0 then
   begin
   {Auto-allocate stock from orders} ;
   AutoAllocateStock(Self) ;
   bOK := True ;
   Close ;
   end
else
   SetUpdatedState(False) ;
end;

procedure TSTPrtTranFrm.TreeViewClearFrom(Sender: TObject);
Var
iTempCount: Integer ;
begin
{Clear out the 2 treeviews and more importantly, the associated objects} ;
For iTempCount := 0 to (FromTreeView.Items.Count - 1) do
    TStockDet(FromTreeView.Items[iTempCount].Data).Free ;
FromTreeView.Items.Clear ;
end;

procedure TSTPrtTranFrm.TreeViewClearTo(Sender: TObject);
Var
iTempCount: Integer ;
begin
{Clear out the 2 treeviews and more importantly, the associated objects} ;
For iTempCount := 0 to (ToDataTreeView.Items.Count - 1) do
    TStockDet(ToDataTreeView.Items[iTempCount].Data).Free ;
ToDataTreeView.Items.Clear ;
end;

procedure TSTPrtTranFrm.SetUpdatedState(bTempUpd: ByteBool);
begin
{Set the state of the screen components depending on whether the user has updated}
{anything} ;
OKBitBtn.Enabled := bTempUpd ;
If Pos(sMoveTypeIn, 'PT') > 0 then
   CancelBitBtn.Enabled := True
else
   CancelBitBtn.Enabled := bTempUpd ;
CloseBitBtn.Enabled := (bTempUpd = False) ;
FromStoreDBLookupComboBox.Enabled := (bTempUpd = False) ;
ToStoreDBLookupComboBox.Enabled := ((bTempUpd = False) and (Pos(sMoveTypeIn, 'PT') = 0));
PartEdit.Enabled := (bTempUpd = False) ;
PartBitBtn.Enabled := (bTempUpd = False) ;
DateEdit.Enabled := (bTempUpd = False) ;
DateBitBtn.Enabled := (bTempUpd = False) ;
QtyMemo.Enabled := (bTempUpd = False) ;
end;

procedure TSTPrtTranFrm.CancelBitBtnClick(Sender: TObject);
begin
If MessageDlg('Cancel the movement(s) you just made?', mtConfirmation, [mbNo,mbYes],0) = mrYes then 
   begin
   SetUpdatedState(False);
   LoadTreeViews(Self) ;
   If Pos(sMoveTypeIn, 'PT') > 0 then
      Close ;
   end;
end;

procedure TSTPrtTranFrm.LoadTreeViews(Sender: TObject);
begin
LoadTreeViewTo(Self) ;
LoadTreeViewFrom(Self) ;
MovedMemo.Text := '0' ;
end;

procedure TSTPrtTranFrm.LoadTreeViewFrom(Sender: TObject);
begin
If Pos(sMoveTypeIn, 'PT') = 0 then
    LoadTreeViewFromStore(PartEdit.Text) ;
If (sMoveTypeIn = 'P') then
    LoadTreeViewFromPO(Self) ;
If (sMoveTypeIn = 'T') then
    LoadTreeViewFromTrans(Self) ;
CheckFromVisible(Self) ;
end;

procedure TSTPrtTranFrm.LoadTreeViewTo(Sender: TObject);
begin
If Pos(sMoveTypeIn, 'PT') = 0 then
        begin
        TreeViewClearTo(self) ;
        sListToPart := PartEdit.Text ;
        LoadTreeViewToStore(sListToPart) ;
        ShowToPart(sListToPart) ;
        end;
CheckFromVisible(Self) ;
end;

procedure TSTPrtTranFrm.FromStoreDBLookupComboBoxClick(Sender: TObject);
begin
With STStockDataMod.GetStoresSQL do
     begin
     bFromBins := (FieldByName('Stock_Bins_In_Use').AsString = 'Y') ;
     bFromLots := (FieldByName('Stock_Lots_In_Use').AsString = 'Y')
     end;
LoadTreeViewFrom(Self) ;
end;

procedure TSTPrtTranFrm.LoadTreeViewFromStore(sTempPart: String);
Var
sPrevBin, sPrevLot: String ;
sBin, sLot: String ;
tnTemp: TTreeNode ;
tnTempLast: Array[0..3] of TTreeNode ;
iTempCount, iLevel: Integer ;
iNumber: integer;
SDNumber: TStockNumber;
begin
TreeViewClearFrom(Self) ;
If (sTempPart = '') then
   exit ;
If sMoveTypeIn = 'B' then
   begin
   {This is an adjustment in} ;
   If QtyMemo.Text = '' then
      exit ;
   tnTemp := FromTreeView.Items.Add(Nil, sTempPart) ;
   StockDet := TStockDet.Create(0, 0,'Incoming stock',
                                          '',
                                          StrToDate(DateEdit.Text),
                                          StrToInt(QtyMemo.Text), 0,
                                          0, 0,
                                          0, 0,STStockDataMod.GetPartSQL.FieldByName('purch_pack_Quantity').AsInteger,
                                          0,'','', 0.00, nil) ;
   tnTemp.Data := StockDet ;
   SetTreeText(tnTemp) ;
   exit ;
   end;
If (FromStoreDBLookUpComboBox.KeyValue = 0)  then
   exit ;
{Load up the stock details} ;
With STStockDataMod.GetStoreStocksSQL do
     begin
     {First, get the totals} ;
     Close ;
     ParamByName('Part_Store').AsInteger := FromStoreDBLookupComboBox.KeyValue ;
     ParamByName('Part').AsString := sTempPart ;
     Open ;
     First ;
     iLevel := 0 ;
     sPrevBin := '' ;
     sPrevLot := '' ;
     {Create a stock total} ;
     tnTemp := FromTreeView.Items.Add(Nil, sTempPart) ;
     StockDet := TStockDet.Create(FieldByName('Store_Stock').AsInteger,1,FieldByName('Part_Bin').AsString,
                                          FieldByName('Part_Store_Lot').AsString,
                                          FieldByName('Date_Received').AsDateTime,
                                          0, 0,
                                          0, 0,
                                          FieldByName('Store_Cost').AsFloat, 0,
                                          FieldByName('Stock_Pack_Quantity').AsInteger,
                                          FieldByName('Sets_Per_Pad').AsInteger,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
     tnTemp.Data := StockDet ;
     tnTempLast[iLevel] := tnTemp ;
     While EOF = False do
           begin
           iLevel := 0 ;
           sBin := FieldByName('Part_Bin').AsString ;
           sLot := FieldByName('Part_Store_Lot').AsString ;
           If sBin <> '' then
              iLevel := iLevel + 1 ;
           if sBin <> sPrevBin then
              begin
              {Add a new bin into the treeview} ;
              tnTemp := FromTreeView.Items.AddChild(tnTempLast[iLevel -1], sTempPart) ;
              StockDet := TStockDet.Create(FieldByName('Store_Stock').AsInteger,2,FieldByName('Part_Bin').AsString,
                                          FieldByName('Part_Store_Lot').AsString,
                                          FieldByName('Date_Received').AsDateTime,
                                          0, 0,
                                          0, 0,
                                          FieldByName('Store_Cost').AsFloat, 0,
                                          FieldByName('Stock_Pack_Quantity').AsInteger,
                                          FieldByName('Sets_Per_Pad').AsInteger,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                    STStockDataMod.GetStoreStocksSQL.fieldbyname('Store_Stock').asinteger;
              GetStStkSIqry.open;
              StockDet.FStockNumbers.clear;
              iNumber := 0;
              while GetStStkSIqry.eof <> true do
                begin
                  SDNumber := TStockNumber.create(stockdet);
                  SDNumber.SILine := iNumber;
                  SDNumber.ItemFrom := GetStStkSIqry.fieldbyname('Serial_item_from').asstring;
                  SDNumber.ItemTo := GetStStkSIqry.fieldbyname('Serial_item_to').asstring;
                  StockDet.FStockNumbers.add(SDNumber);
                  inc(iNumber);
                  GetStStkSIqry.next;
                end;

              tnTemp.Data := StockDet ;
              sPrevBin := sBin ;
              sPrevLot := '' ;
              tnTempLast[iLevel] := tnTemp ;
              end;
           If sLot <> '' then
              iLevel := iLevel + 1 ;
           if sLot <> sPrevLot then
              begin
              {Add a new lot into the treeview} ;
              tnTemp := FromTreeView.Items.AddChild(tnTempLast[iLevel -1], sTempPart) ;
              StockDet := TStockDet.Create(FieldByName('Store_Stock').AsInteger,3,FieldByName('Part_Bin').AsString,
                                          FieldByName('Part_Store_Lot').AsString,
                                          FieldByName('Date_Received').AsDateTime,
                                          0,0,0,0,
                                          FieldByName('Store_Cost').AsFloat,0,
                                          FieldByName('Stock_Pack_Quantity').AsInteger,
                                          FieldByName('Sets_Per_Pad').AsInteger,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                    STStockDataMod.GetStoreStocksSQL.fieldbyname('Store_Stock').asinteger;
              GetStStkSIqry.open;
              StockDet.FStockNumbers.clear;
              iNumber := 0;
              while GetStStkSIqry.eof <> true do
                begin
                  SDNumber := TStockNumber.create(stockdet);
                  SDNumber.SILine := iNumber;
                  SDNumber.ItemFrom := GetStStkSIqry.fieldbyname('Serial_item_from').asstring;
                  SDNumber.ItemTo := GetStStkSIqry.fieldbyname('Serial_item_to').asstring;
                  StockDet.FStockNumbers.add(SDNumber);
                  inc(iNumber);
                  GetStStkSIqry.next;
                end;

              tnTemp.Data := StockDet ;
              sPrevLot := sLot ;
              tnTempLast[iLevel] := tnTemp ;
              end;
           SetTreeQty(tnTemp,FieldByName('Store_Quantity').AsInteger,
                             FieldByName('Quantity_Allocated').AsInteger,
                             False, False) ;
           Next ;
           end;
     end;
For iTempCount := 0 to FromTreeView.Items.Count - 1 do
               SetTreeText(FromTreeView.Items[iTempCount]) ;
FromTreeView.FullExpand ;
end;

procedure TSTPrtTranFrm.LoadTreeViewFromPO(Sender: TObject);
//var
  //inv_upfront: string;
begin
TreeViewClearFrom(Self) ;
TreeViewClearTo(Self) ;
{Load up the PO details} ;
With GetPOLinesSQL do
     begin
     {First, get the totals} ;
     Close ;
     ParamByName('Purch_Ord').AsInteger := iPOrd ;
     ParamByName('Purch_Ord_Line_No').AsInteger := 0 ;
     Open ;
     First ;
     While EOF = False do
           begin
           {Create a detail line} ;
           tnTempTotal := FromTreeView.Items.Add(Nil, '') ;
           StockDet := TStockDet.Create(FieldByName('Purch_Ord_Line_No').AsInteger, 4,FieldByName('Part').AsString,
                                          FieldByName('Fully_Received').AsString,
                                          FieldByName('Date_Deliv_Expected').AsDateTime,
                                          0,0,0,0,
                                          FieldByName('Purchase_Price').AsFloat,0,
                                          FieldByName('Purch_Pack_Quantity').AsInteger,
                                          0,
                                          FieldByName('Part_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          0, nil);
           tnTempTotal.Data := StockDet ;
           If (bFromBins = False) then
                 SetTreeQty(tnTempTotal, FieldByName('Quantity_Ordered').AsInteger,
                                          FieldByName('Quantity_Received').AsInteger, False,True) ;
           LoadTreeViewToStore(FieldByName('Part').AsString) ;
           Next ;
           end;
     end;
FromTreeView.FullExpand ;
FromTreeView.Font.Name := 'FixedSys' ;
end;

procedure TSTPrtTranFrm.ShowToPart(TempPart: String);
Var
iTempCount: Integer;
begin
ToTreeView.Items.Clear ;
PartEdit.Text := TempPart ;
With STStockDataMod.GetPartSQL do
     begin
     Close ;
     ParamByName('Part').AsString := TempPart ;
     Open ;
     First ;
     ToPartLabel.Caption := 'Product: ' + TempPart + '  ' + FieldByName('Part_Description').AsString ;
     ToPart2Label.Caption := 'Pack Size: ' + IntToStr(FieldByName('purch_pack_Quantity').AsInteger) +
                          ',   Pack Cost: ' + CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(FieldByName('Part_Purchase_Price').AsFloat)) ;
     bUseSerialNos := (FieldByName('Track_Serial_No').AsString = 'Y');
     bNumbered := (FieldByName('Numbered').AsString = 'Y');
     if bUseSerialNos then
        sLotText := 'S/N'
     else
        sLotText := 'Lot' ;
     end;
ToDetsLabel.Caption := 'Quantities are (stock/allocated)' ;
If Pos(sMoveTypeIn,'PT') >0 then
   begin
   FromDetsLabel.Caption := 'Quantities are (ordered/received)' ;
   end
else
    begin
    FromDetsLabel.Caption := 'Quantities are (stock/allocated)' ;
    end;
{Show the selected part in the TO list} ;
ToTreeView.Items := ToDataTreeView.Items ;
For iTempCount := (ToDataTreeView.Items.Count - 1) downto 0 do
    begin
    If ToTreeView.Items[iTempCount].Text <> TempPart then
        begin
        ToTreeView.Items[iTempCount].Delete ;
        end;
    end;
For iTempCount := 0 to (ToTreeView.Items.Count - 1) do
    SetTreeText(ToTreeView.Items[iTempCount]) ;
ToTreeView.FullExpand ;
end;

procedure TSTPrtTranFrm.LoadTreeViewToStore(sTempPart: String);
Var
sPrevBin, sPrevLot, sLotText: String ;
sBin, sLot: String ;
tnTemp: TTreeNode ;
tnTempLast: Array[0..3] of TTreeNode ;
iLevel: Integer ;
iNumber: integer;
SDNumber: TStockNumber;
begin
if bUseSerialNos then
   sLotText := 'S/N'
else
   sLotText := 'Lot' ; 
If (sTempPart = '') then
   exit ;
If sMoveTypeOut = 'B' then
   begin
   {This is an adjustment out} ;
   tnTemp := ToDataTreeView.Items.Add(Nil, sTempPart) ;
   StockDet := TStockDet.Create(0, 0,'Outgoing stock',
                                          '',
                                          StrToDate(DateEdit.Text),
                                          0, 0,
                                          0, 0,
                                          0, 0,1, 0,'','', 0.00, nil) ;
   tnTemp.Data := StockDet ;
   exit ;
   end;
If (ToStoreDBLookUpComboBox.text = '')  then
   exit ;
{Load up the stock details} ;
With STStockDataMod.GetStoreStocksSQL do
     begin
     {First, get the totals} ;
     Close ;
     ParamByName('Part_Store').AsInteger := ToStoreDBLookupComboBox.KeyValue ;
     ParamByName('Part').AsString := sTempPart ;
     Open ;
     First ;
     iLevel := 0 ;
     sPrevBin := '' ;
     sPrevLot := '' ;
     {Create a stock total} ;
     tnTemp := ToDataTreeView.Items.Add(Nil, sTempPart) ;
     StockDet := TStockDet.Create(FieldByName('Store_Stock').AsInteger,1,FieldByName('Part_Bin').AsString,
                                          FieldByName('Part_Store_Lot').AsString,
                                          FieldByName('Date_Received').AsDateTime,
                                          0, 0,
                                          0, 0,
                                          FieldByName('Store_Cost').AsFloat, 0,
                                          FieldByName('Stock_Pack_Quantity').AsInteger,
                                          FieldByName('Sets_Per_Pad').AsInteger,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
     {Load the store_stock_serial_items}
     GetStStkSIqry.close;
     GetStStkSIqry.parambyname('Store_Stock').asinteger :=
              STStockDataMod.GetStoreStocksSQL.fieldbyname('Store_Stock').asinteger;
     GetStStkSIqry.open;
     StockDet.FStockNumbers.clear;
     iNumber := 0;
     while GetStStkSIqry.eof <> true do
      begin
        SDNumber := TStockNumber.create(stockdet);
        SDNumber.SILine := iNumber;
        SDNumber.ItemFrom := GetStStkSIqry.fieldbyname('Serial_item_from').asstring;
        SDNumber.ItemTo := GetStStkSIqry.fieldbyname('Serial_item_to').asstring;
        StockDet.FStockNumbers.add(SDNumber);
        inc(iNumber);
        GetStStkSIqry.next;
      end;

     tnTemp.Data := StockDet ;
     tnTempLast[iLevel] := tnTemp ;
     While EOF = False do
           begin
           iLevel := 0 ;
           sBin := FieldByName('Part_Bin').AsString ;
           sLot := FieldByName('Part_Store_Lot').AsString ;
           If sBin <> '' then
              iLevel := iLevel + 1 ;
           if sBin <> sPrevBin then
              begin
              {Add a new bin into the treeview} ;
              tnTemp := ToDataTreeView.Items.AddChild(tnTempLast[iLevel -1], sTempPart) ;
              StockDet := TStockDet.Create(FieldByName('Store_Stock').AsInteger,2,FieldByName('Part_Bin').AsString,
                                          FieldByName('Part_Store_Lot').AsString,
                                          FieldByName('Date_Received').AsDateTime,
                                          0, 0,
                                          0, 0,
                                          FieldByName('Store_Cost').AsFloat, 0,
                                          FieldByName('Stock_Pack_Quantity').AsInteger,
                                          FieldByName('Sets_Per_Pad').AsInteger,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                        STStockDataMod.GetStoreStocksSQL.fieldbyname('Store_Stock').asinteger;
              GetStStkSIqry.open;
              StockDet.FStockNumbers.clear;
              iNumber := 0;
              while GetStStkSIqry.eof <> true do
                begin
                  SDNumber := TStockNumber.create(stockdet);
                  SDNumber.SILine := iNumber;
                  SDNumber.ItemFrom := GetStStkSIqry.fieldbyname('Serial_item_from').asstring;
                  SDNumber.ItemTo := GetStStkSIqry.fieldbyname('Serial_item_to').asstring;
                  StockDet.FStockNumbers.add(SDNumber);
                  inc(iNumber);
                  GetStStkSIqry.next;
                end;

              tnTemp.Data := StockDet ;
              sPrevBin := sBin ;
              sPrevLot := '' ;
              tnTempLast[iLevel] := tnTemp ;
              end;
           If sLot <> '' then
              iLevel := iLevel + 1 ;
           if sLot <> sPrevLot then
              begin
              {Add a new lot into the treeview} ;
              tnTemp := ToDataTreeView.Items.AddChild(tnTempLast[iLevel -1], sTempPart) ;
              StockDet := TStockDet.Create(FieldByName('Store_Stock').AsInteger,3,FieldByName('Part_Bin').AsString,
                                          FieldByName('Part_Store_Lot').AsString,
                                          FieldByName('Date_Received').AsDateTime,
                                          0,0,0,0,
                                          FieldByName('Store_Cost').AsFloat,0,
                                          FieldByName('Stock_Pack_Quantity').AsInteger,
                                          FieldByName('Sets_Per_Pad').AsInteger,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                    STStockDataMod.GetStoreStocksSQL.fieldbyname('Store_Stock').asinteger;
              GetStStkSIqry.open;
              StockDet.FStockNumbers.clear;
              iNumber := 0;
              while GetStStkSIqry.eof <> true do
                begin
                  SDNumber := TStockNumber.create(stockdet);
                  SDNumber.SILine := iNumber;
                  SDNumber.ItemFrom := GetStStkSIqry.fieldbyname('Serial_item_from').asstring;
                  SDNumber.ItemTo := GetStStkSIqry.fieldbyname('Serial_item_to').asstring;
                  StockDet.FStockNumbers.add(SDNumber);
                  inc(iNumber);
                  GetStStkSIqry.next;
                end;

              tnTemp.Data := StockDet ;
              sPrevLot := sLot ;
              tnTempLast[iLevel] := tnTemp ;
              end;
           SetTreeQty(tnTemp,FieldByName('Store_Quantity').AsInteger,
                             FieldByName('Quantity_Allocated').AsInteger,
                             False, False) ;
           Next ;
           end;
     end;
ToTreeView.FullExpand ;
end;

procedure TSTPrtTranFrm.UpdToDataTree(TempPart: String);
Var
iTempCount: Integer;
TempTreeNode, TempTreeNode2: TTreeNode ;
begin
If TempPart = '' then
   exit ;
{First, delete all references to the part} ;
For iTempCount :=  (ToDataTreeView.Items.Count - 1) downto 0 do
    begin
    If ToDataTreeView.Items[iTempCount].Text = TempPart then
        ToDataTreeView.Items[iTempCount].Delete ;
    end;
{Now add in the new stuff} ;
For iTempCount := 0 to (ToTreeView.Items.Count - 1) do
    begin
    TempTreeNode := ToTreeView.Items[iTempCount] ;
    StockDet := TempTreeNode.Data ;
    If Assigned(TempTreeNode.Parent) = False then
       begin
       tnTempTotal := ToDataTreeView.Items.Add(Nil,'') ;
       tnTempTotal.Text := TempPart ;
       tnTempTotal.Data := TempTreeNode.Data  ;
       end
    else
       begin
       Case TStockDet(TempTreeNode.Parent.Data).Typ of
            1:  TempTreeNode2 := tnTempTotal ;
            2:  TempTreeNode2 := tnTempBin ;
            3:  TempTreeNode2 := tnTempLot ;
            end;
       Case TStockDet(TempTreeNode.Data).Typ of
            2:  begin
                tnTempBin := ToDataTreeView.Items.AddChild(TempTreeNode2,'') ;
                tnTempBin.Text := TempPart ;
                tnTempBin.Data := StockDet ;
                end;
            3:  begin
                tnTempLot := ToDataTreeView.Items.AddChild(TempTreeNode2,'') ;
                tnTempLot.Text := TempPart ;
                tnTempLot.Data := StockDet ;
                end;
            end;
       end;
    end;
end;

procedure TSTPrtTranFrm.FromTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
If Pos(sMoveTypeIn,'PT') > 0 then 
   begin
   UpdToDataTree(sListToPart) ;
   StockDet := Node.Data ;
   sListToPart := StockDet.SDBin ;
   ShowToPart(sListToPart) ;
   end;
StockDet := Node.Data ;
end;

procedure TSTPrtTranFrm.UpdStoreStock(TempTN: TTreeNode; sTempPart: String;
                                              iTempStore: Integer) ;
Var
TempSD: TStockDet ;
TempMoveRef, sTempMoveType: String ;
begin
TempMoveRef := '' ;
if STSTockDataMod.GetPartSQL.FieldBYName('Product_Class').AsString = 'NSTK' then
  exit;
If Pos(sMoveType, 'GH') > 0 then
    TempMoveRef := 'GRN:' + GRNEdit.Text + '/PO:' + PORefEdit.Text ;
TempSD := TempTN.Data ;
If TempTN.HasChildren = False then
   begin
      begin
                    sTempMoveType := sMoveType ;
                    If sMoveType = 'T' then
                       If TempSD.QtyAdj >= 0 then
                               sTempMoveType := 'V'
                           else
                               sTempMoveType := 'U' ;
                    If TempSD.Code = 0 then
                        begin
                        {This is a new stock item} ;
                        STStockDataMod.AddStoreStock(sTempPart,iTempStore,TempSD.Bin,
                              TempSD.Lot, sTempMoveType, TempMoveRef,
                              TempSD.Date, MoveDate, TempSD.QtyAdj, TempSD.AllocAdj, TempSD.PackSize,
                              TempSD.CostAdj,TempSD.StockDesc, TempSD.Invupfront, TempSD.SetsInPad, TempSD.PONumber,0,'N');
                        {Save the newly created store stock code so auto-allocate knows what}
                        {stock to allocate};
                        TempSD.Code := STStockDataMod.iNewStoreStock ;
                        end
                     else
                        begin
                        DelStoreStockNumbers(TempSD);
                        {Update an existing stock item} ;
                        STStockDataMod.UpdStoreStock(TempSD.Code,sTempPart,iTempStore,TempSD.Bin,
                              TempSD.Lot, sTempMoveType, TempMoveRef,
                              TempSD.Date, MoveDate, TempSD.QtyAdj, TempSD.AllocAdj, TempSD.PackSize,
                              TempSD.CostAdj, TempSD.StockDesc, TempSD.Invupfront, TempSD.SetsInPad, TempSD.PONumber,0,0,'N');
                        end;
                     UpdStoreStockNumbers(TempSD);
       end;
   end;
end;

procedure TSTPrtTranFrm.UpdPOLine(TempTN: TTreeNode) ;
Var
TempSD: TStockDet ;
TempStat: String;
begin
TempSD := TempTN.Data ;
{Update the purchase order line} ;
With UpdPOLineSQL do
      begin
      Close ;
      ParamByName('Purch_Ord').AsInteger := iPOrd ;
      ParamByName('Purch_Ord_Line_No').AsInteger := TempSD.SDCode ;
      {Note that the quantity received is an ADJUSTMENT} ;
      ParamByName('Quantity_Received').AsInteger := TempSD.AllocAdj ;
      ParamByName('Date_Deliv_Actual').AsDateTime := StrToDate(DateEdit.Text) ;
      ParamByName('Fully_Received').AsString := TempSD.SDLot ;
      ParamByName('GRN_No').AsString := GRNEdit.Text ;
      ExecSQL ;
      end;
With CheckPOStatusSQL do
      begin
      Close ;
      ParamByName('Purch_Ord').AsInteger := iPOrd ;
      Open ;
      First ;
      If (FieldByName('Purch_Ord_Status').AsString <= 'N') then
         begin
         {All delivered} ;
         If (FieldByName('No_Not_Deliv').AsInteger = 0) and
            (FieldByName('No_Deliv').AsInteger > 0) then TempStat := 'N' ;
         {None delivered} ;
         If (FieldByName('No_Not_Deliv').AsInteger > 0) and
            (FieldByName('No_Deliv').AsInteger = 0) then TempStat := 'G' ;
         {Some delivered} ;
         If (FieldByName('No_Not_Deliv').AsInteger > 0) and
            (FieldByName('No_Deliv').AsInteger > 0) then TempStat := 'K' ;
         With UpdPOStatusSQL do
              begin
              Close ;
              ParamByName('Purch_Ord').AsInteger := iPOrd ;
              ParamByName('Purch_Ord_Status').AsString := TempStat ;
              ExecSQL ;
              end;
         end;
      end;
{Check for any allocations, do an auto allocation if there are any} ;
If (TempSD.SDLot = 'Y') and (bStore_Ord) then
      begin
      {The stock is fully received, clear any outstanding allocations} ;
      STStockDataMod.DeAllocStock(iPOrd, 99999999, 2, TempSD.SDCode);
      end;
end;

procedure TSTPrtTranFrm.ToTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
StockDet := Node.Data ;
end;

procedure TSTPrtTranFrm.FromTreeViewDblClick(Sender: TObject);
begin
{Allow double click to auto-transfer} ;
{Can't do it if a decision about bins/lots is required} ;
If (bToBins) or (bToLots) then
   exit ;
ToTreeViewDragDrop(ToTreeView, FromTreeView ,10,10) ;
end;

procedure TSTPrtTranFrm.CheckFromVisible(Sender: TObject);
begin
{Check if FROM treeview should be visible and if not, allow drag from TO tree} ;
If (sMoveTypeIn = 'S') and (sMoveTypeOut = 'S') and
   (FromStoreDBLookupComboBox.KeyValue = ToStoreDBLookupComboBox.KeyValue) and
   (FromStoreDBLookupComboBox.KeyValue <> 0) then
        begin
        FromTreeView.Visible := False ;
        ToTreeView.DragMode := dmAutomatic ;
        end
   else
        begin
        FromTreeView.Visible := True ;
        ToTreeView.DragMode := dmManual ;
        end;
end;

procedure TSTPrtTranFrm.ToTreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
   If ToTreeView.Selected.HasChildren then
      begin
      MessageDlg('You can only move individual items', mtError, [mbOK],0) ;
   If (TStockDet(ToTreeView.Selected.Data).Qty + TStockDet(ToTreeView.Selected.Data).QtyAdj) < 1 then
      MessageDlg('There is no stock to move', mtError, [mbOK],0) ;
   end;
end;

procedure TSTPrtTranFrm.AutoAllocateStock(Sender: TObject);
Var
iTempCount, iTempCount2: Integer ;
sdTempFrom, sdTempTo: TStockDet ;
iTempQtyRecd, iTempQtyReqd, iTempQtyThisRecord: Integer ;
begin
{NOTE: This routine is for SCRIBE. It is disabled to avoid having to copy most of SCRIBE's} ;
{      file structures into the stock system} ;
EXIT ;
{If there are allocations attached to the incoming order line, the stock must be} ;
{automatically allocated to them} ;
For iTempCount := 0 to (FromTreeView.Items.Count - 1) do
      begin
      sdTempFrom := TTreeNode(FromTreeView.Items[iTempCount]).Data ;
      {Save the quantity received from this line} ;
      iTempQtyRecd := sdTempFrom.AllocAdj ;
      {Note that GetOrdAllocsSQL also gets the actual parts for job record} ;
       With GetOrdAllocsSQL do
           begin
           Close ;
           ParamByName('Purch_Ord').AsInteger := iPord ;
           ParamByName('Purch_Ord_Line_No').AsInteger := sdTempFrom.Code ;
           Open ;
           First ;
           While (EOF = False)  do
                 begin
                 iTempQtyReqd := FieldByName('Part_Qty').AsInteger ;
                 {If this PFJ can't be fully allocated, go on to the next order line} ;
                 If iTempQtyReqd <= iTempQtyRecd then
                    begin
                    {Scan down the TO tree looking for useable stock of the part} ;
                    For iTempCount2 := 0 to (ToDataTreeView.Items.Count - 1) do
                        begin
                        {Only use TO treeview nodes for the same part} ;
                        If (TTreeNode(ToDataTreeView.Items[iTempCount2]).Text = sdTempFrom.Bin) and
                           (TTreeNode(ToDataTreeView.Items[iTempCount2]).HasChildren = False) then
                           begin
                           sdTempTo := TTreeNode(ToDataTreeView.Items[iTempCount2]).Data ;
                           If sdTempTo.QtyAdj > iTempQtyReqd then
                                iTempQtyThisRecord := iTempQtyReqd
                           else
                                iTempQtyThisRecord := sdTempTo.QtyAdj ;
                           If iTempQtyThisRecord > 0 then
                                begin
                                STStockDataMod.AllocStoreStock(sdTempTo.Code, FieldByName('Parts_For_Job').AsInteger,
                                    iTempQtyThisRecord, 1, 0, 0, 0);
                                iTempQtyRecd := iTempQtyRecd - iTempQtyThisRecord ;
                                iTempQtyReqd := iTempQtyReqd - iTempQtyThisRecord ;
                                end;
                           end;
                        {End of item in TO tree} ;
                        end;
                    With UpdPFJStatusSQL do
                        begin
                        {Set the PFJ status to (I)nstock} ;
                        Close ;
                        ParamByName('Parts_For_Job').AsInteger := GetOrdAllocsSQL.FieldByName('Parts_For_Job').AsInteger ;
                        ParamByName('Part_Status').AsString := 'I' ;
                        ExecSQL ;
                        end;
                    With DelOrdAllocSQL do
                        begin
                        {Delete the Order Allocation} ;
                        Close ;
                        ParamByName('Purch_Ord').AsInteger := iPord ;
                        ParamByName('Purch_Ord_Line_No').AsInteger := sdTempFrom.Code ;
                        ParamByName('Parts_For_Job').AsInteger := GetOrdAllocsSQL.FieldByName('Parts_For_Job').AsInteger ;
                        ExecSQL ;
                        end;
                    {End of can allocate this PFJ} ;
                    end
                 else
                    begin
                    {Can't allocate this PFJ, if fully received get rid of the allocations} ;
                    If sdTempFrom.Lot = 'Y' then
                       begin
                       With DelOrdAllocSQL do
                            begin
                            {Delete the Order Allocation} ;
                            Close ;
                            ParamByName('Purch_Ord').AsInteger := iPord ;
                            ParamByName('Purch_Ord_Line_No').AsInteger := sdTempFrom.Code ;
                            ParamByName('Parts_For_Job').AsInteger := GetOrdAllocsSQL.FieldByName('Parts_For_Job').AsInteger ;
                            ExecSQL ;
                            end;
                       With UpdPFJStatusSQL do
                            begin
                            {Set the PFJ status to (R)equired} ;
                            Close ;
                            ParamByName('Parts_For_Job').AsInteger := GetOrdAllocsSQL.FieldByName('Parts_For_Job').AsInteger ;
                            ParamByName('Part_Status').AsString := 'R' ;
                            ExecSQL ;
                            end;
                       end;
                    end;
                 Next ;
                 {End of allocation records} ;
                 end;
           {Next order line}
           end;
      end;
end;

procedure TSTPrtTranFrm.LoadTreeViewFromTrans(Sender: TObject);
var
sTempLot, sPrevPart: String ;
fTempUnitCost: Real ;
begin
TreeViewClearFrom(Self) ;
TreeViewClearTo(Self) ;
{Load up the Transfer File details} ;
With GetSOTransSQL do
     begin
     {First, get the totals} ;
     Close ;
     ParamByName('Purch_Ord').AsInteger := iPOrd ;
     ParamByName('Purch_Ord_Line_No').AsInteger := 0 ;
     Open ;
     First ;
     sPrevPart := '' ;
     While EOF = False do
           begin
           {Create a detail line} ;
           If ((bUseSerialNos) or (bToLots)) and
                               (FieldByName('Part_Store_Lot').AsString <> '') then
              sTempLot := FieldByName('Part_Store_Lot').AsString
           else
              sTempLot := '' ; 
           tnTempTotal := FromTreeView.Items.Add(Nil, '') ;
           If FieldByName('Store_Quantity').AsInteger <> 0 then
                      fTempUnitCost := FieldByName('Store_Cost').AsFloat/FieldByName('Store_Quantity').AsInteger
           else
                      fTempUnitCost := FieldByName('Store_Cost').AsFloat;
           StockDet := TStockDet.Create(FieldByName('Part_Transfer').AsInteger, 4,FieldByName('Part').AsString,
                                          'N' + sTempLot,
                                          FieldByName('Date_Received').AsDateTime,
                                          0,0,0,0,
                                          fTempUnitCost ,0,FieldByName('Purch_Pack_Quantity').AsInteger,
                                          0,
                                          FieldByName('Store_Stock_Description').AsString,
                                          FieldByName('Invoice_Upfront').AsString,
                                          FieldByName('Purchase_Order').Asfloat, nil) ;
           tnTempTotal.Data := StockDet ;
           If (bFromBins = False) then
                 SetTreeQty(tnTempTotal, FieldByName('Store_Quantity').AsInteger,
                                          FieldByName('Quantity_Received').AsInteger, False,True) ;
           If sPrevPart <> FieldByName('Part').AsString then
              begin
              {Don't load the part in more than once} ;
              LoadTreeViewToStore(FieldByName('Part').AsString) ;
              sPrevPart := FieldByName('Part').AsString ;
              end;
           Next ;
           end;
     end;
FromTreeView.FullExpand ;
FromTreeView.Font.Name := 'FixedSys' ;
end;

procedure TSTPrtTranFrm.UpdTransLine(TempTN: TTreeNode) ;
Var
TempSD: TStockDet ;
TempStat, sTempFR: String;
iTempPO: Integer ;
iTempPOL: Integer ;
begin
TempSD := TempTN.Data ;
{Get the purchase order line no} ;
With GetSOTranSQL do
     begin
     Close ;
     ParamByName('Part_Transfer').AsInteger := TempSD.SdCode ;
     Open ;
     First ;
     iTempPO := FieldByName('Purch_Ord').AsInteger ;
     iTempPOL := FieldByName('Purch_Ord_Line_No').AsInteger ;
     end;
If Copy(TempSD.SDLot,1,1) = 'Y' then
   begin
   With DelSOTranSQL do
      begin
      Close ;
      ParamByName('Part_Transfer').AsInteger := TempSD.SdCode ;
      ExecSQL ;
      end ;
   end
else
   begin
   {Update the transfer line} ;
   With UpdSOTranSQL do
      begin
      Close ;
      ParamByName('Part_Transfer').AsInteger := TempSD.SdCode ;
      ParamByName('Quantity_Received').AsInteger := TempSD.AllocAdj ;
      ParamByName('Date_Received').AsDateTime := StrToDate(DateEdit.Text) ;
      ParamByName('Store_Cost').AsFloat := TempSD.SDCostAdj ;
      ExecSQL ;
      end;
   end;
With GetSOTransSQL do
   begin
   Close ;
   ParamByName('Purch_Ord').AsInteger := iTempPO ;
   ParamByName('Purch_Ord_Line_No').AsInteger := iTempPOL ;
   Open ;
   First ;
   If RecordCount = 0 then
      sTempFR := 'Y'
   else
      sTempFR := 'N' ;
   end;
With UpdPOLineSQL do
   begin
   Close ;
   ParamByName('Purch_Ord').AsInteger := iTempPO ;
   ParamByName('Purch_Ord_Line_No').AsInteger := iTempPOL ;
   {Note that the quantity received is an ADJUSTMENT} ;
   ParamByName('Quantity_Received').AsInteger := TempSD.AllocAdj ;
   ParamByName('Date_Deliv_Actual').AsDateTime := StrToDate(DateEdit.Text) ;
   ParamByName('Fully_Received').AsString := sTempFR ;
   ParamByName('GRN_No').AsString := GRNEdit.Text ;
   ExecSQL ;
   end;  
With CheckPOStatusSQL do
      begin
      Close ;
      ParamByName('Purch_Ord').AsInteger := iTempPO ;
      Open ;
      First ;
      If (FieldByName('Purch_Ord_Status').AsString <= 'N') then
         begin
         {All delivered} ;
         If (FieldByName('No_Not_Deliv').AsInteger = 0) and
            (FieldByName('No_Deliv').AsInteger > 0) then TempStat := 'N' ;
         {None delivered} ;
         If (FieldByName('No_Not_Deliv').AsInteger > 0) and
            (FieldByName('No_Deliv').AsInteger = 0) then TempStat := 'G' ;
         {Some delivered} ;
         If (FieldByName('No_Not_Deliv').AsInteger > 0) and
            (FieldByName('No_Deliv').AsInteger > 0) then TempStat := 'K' ;
         With UpdPOStatusSQL do
              begin
              Close ;
              ParamByName('Purch_Ord').AsInteger := iTempPO ;
              ParamByName('Purch_Ord_Status').AsString := TempStat ;
              ExecSQL ;
              end;
         end;
      end;
{Check for any allocations, do an auto allocation if there are any} ;
If (sTempFR = 'Y') and (bStore_Ord) then
      begin
      {The stock is fully received, clear any outstanding allocations} ;
      STStockDataMod.DeAllocStock(iPOrd, 99999999, 2, iTempPOL);
      end;
end;

function TSTPrtTranFrm.CheckIfMixingPacks(iTempFromPack,iTempToPack: Integer): Bytebool;
begin
{This routine is activated if the operator attempts to put stock for different pack sizes into the} ;
{same place.} ;
Result := False ;
{If the incoming and existing pack sizes are the same, there's no problem so don't do anything} ;
If iTempFromPack = iTempToPack then
        exit ;
{Tell them what's about to happen and ask if they want to proceed} ;
Result := (MessageDlg('If you move the stock with packsize ' + IntToStr(iTempFromPack) +
                ' into the same place as the stock with packsize ' + IntToStr(iTempToPack) +
                ' all the stock will have a packsize of ' + IntToStr(iTempToPack) +
                '. Sure you want to proceed?', mtWarning, [mbNo,mbYes],0) <> mrYes) ;
end;

procedure TSTPrtTranFrm.UpdStoreStockNumbers(tempStk: TStockDet);
var
  dbkey: integer;
  i: integer;
begin
  dbKey := tempstk.SDCode;
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Store_Stock_serial_item WHERE Store_Stock =' + IntToStr(DbKey));
    ExecSQL;
  end;
  for i:= 0 to pred(tempstk.Numbers.count) do
    begin
      AddStStkSIqry.close;
      AddStStkSIqry.parambyname('Store_Stock').asinteger := dbkey;
      AddStStkSIqry.parambyname('serial_item_no').asinteger := i+1;
      AddStStkSIqry.parambyname('serial_item_from').asstring := tempstk.Numbers[i].ItemFrom;
      AddStStkSIqry.parambyname('serial_item_to').asstring := tempstk.Numbers[i].ItemTo;
      AddStStkSIqry.execsql;
    end;
end;

procedure TSTPrtTranFrm.DelStoreStockNumbers(tempStk: TStockDet);
var
  dbkey: integer;
begin
  dbKey := tempstk.SDCode;
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Store_Stock_serial_item WHERE Store_Stock =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

function TSTPrtTranFrm.SetFromNumbers(tempFrom, tempTo: TStockDet): TStockDet;
var
  OrigFrom: TStockDet;
  iNumber, iToNumbers: integer;
  sFirst, sLast, sOutFirst, sOutLast: string;
  SDNumber: TStockNumber;
  bKeepThis: boolean;
begin
  OrigFrom := TStockDet.Create(0,3,TempFrom.Bin,
                                          TempFrom.Lot,
                                          TempFrom.Date,
                                          0,0,
                                          0,0,
                                          0,0, 0,0, 
                                          TempFrom.StockDesc, TempFrom.InvUpfront, TempFrom.PONumber, nil);
  OrigFrom.FStockNumbers.clear;
  for iNumber := 0 to pred(TempFrom.Numbers.count) do
    begin
      SDNumber := TStockNumber.create(OrigFrom);
      SDNumber.SILine := TempFrom.Numbers[iNumber].SILine;
      SDNumber.ItemFrom := TempFrom.Numbers[iNumber].ItemFrom;
      SDNumber.ItemTo := TempFrom.Numbers[iNumber].ItemTo;
      OrigFrom.FStockNumbers.add(SDNumber);
    end;

  for iNumber := pred(tempfrom.Numbers.count) downto 0 do
    begin
      tempfrom.Numbers.Delete(iNumber);
    end;

  for iNumber := 0 to pred(Origfrom.Numbers.count) do
    begin
      sFirst := Origfrom.Numbers[iNumber].ItemFrom;
      sLast := OrigFrom.Numbers[iNumber].ItemTo;

      bKeepThis := true;

      for iToNumbers := 0 to pred(tempTo.Numbers.count) do
        begin
          sOutFirst := tempTo.Numbers[iToNumbers].ItemFrom;
          sOutLast := tempTo.Numbers[iToNumbers].ItemTo;

          {if first number is greater than last - then not removed from this batch}
          if (sOutFirst > sLast) then
            continue
          else
          if (sOutFirst < sFirst) and (sOutLast < sFirst) then
            continue
          else
          {if first number is same as first number in batch then see}
          if (sOutFirst = sFirst) then
            begin
              bKeepThis := false;
              if (sOutLast < sLast) then
                begin
                  {Add in those numbers not taken, i.e. before the first}
                  SDNumber := TStockNumber.create(tempfrom);
                  SDNumber.SILine := iNumber;
                  SDNumber.ItemFrom := inttostr(strtoint(sOutLast)+1);
                  SDNumber.ItemTo := sLast;
                  tempfrom.FStockNumbers.add(SDNumber);

                end;
            end
          else
          if (sOutFirst > sFirst) then
            begin
              {Add in those numbers not taken, i.e. before the first}
              SDNumber := TStockNumber.create(tempfrom);
              SDNumber.SILine := iNumber;
              SDNumber.ItemFrom := sFirst;
              SDNumber.ItemTo := inttostr(strtoint(sOutFirst)-1);
              tempfrom.FStockNumbers.add(SDNumber);
              if (sOutLast < sLast) then
                begin
                  {Add in those numbers not taken, i.e. before the first}
                  SDNumber := TStockNumber.create(tempfrom);
                  SDNumber.SILine := iNumber;
                  SDNumber.ItemFrom := inttostr(strtoint(sOutLast)+1);
                  SDNumber.ItemTo := sLast;
                  tempfrom.FStockNumbers.add(SDNumber);
                end;
              bKeepThis := false;
            end;
        end;

      if bKeepThis then
        begin
          SDNumber := TStockNumber.create(tempfrom);
          SDNumber.SILine := iNumber;
          SDNumber.ItemFrom := sFirst;
          SDNumber.ItemTo := sLast;
          tempfrom.FStockNumbers.add(SDNumber);
        end;
    end;
  Result := tempfrom;
end;

procedure TStockDet.SetStockDesc(const Value: string);
begin
SDStockDesc := Value ;
end;

procedure TStockDet.setInvUpfront(const Value: string);
begin
SDInvUpfront := Value;
end;

{ TStockNumbers }

procedure TStockNumbers.Add(aLine: TStockNumber);
begin
  FItems.Add(aLine);
end;

procedure TStockNumbers.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TStockNumber(FItems[i]).Free;
end;

function TStockNumbers.Clone: TStockNumbers;
var
  i : integer;
begin
  Result := TSTockNumbers.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TStockNumber(FItems[i]).Clone);
end;

constructor TStockNumbers.Create(StockDet: TStockDet);
begin
  FParent := StockDet;
  FItems := TList.Create;
end;

procedure TStockNumbers.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TStockNumbers.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TStockNumber(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TStockNumbers.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TStockNumbers.GetItems(Index: integer): TStockNumber;
begin
  Result := TStockNumber(FItems[Index]);
end;

function TStockNumbers.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TStockNumber(FItems[i]).SILine = LineNumber then
      Result := i;
end;

procedure TStockNumbers.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TStockNumber(FItems[i]).SILine:= (i+1);
end;

procedure TStockNumbers.SetItems(Index: integer;
  const Value: TStockNumber);
begin
  FItems[Index] := Value;
end;

{ TStockNumber }

function TStockNumber.Clone: TStockNumber;
begin
  Result := TStockNumber.Create(FParent);
end;

constructor TStockNumber.Create(StockDet: TStockDet);
begin
  FParent := StockDet;
end;

destructor TStockNumber.Destroy;
begin
  inherited;

end;

procedure TStockNumber.SetItemFrom(const Value: string);
begin
  FItemFrom := Value;
end;

procedure TStockNumber.SetItemTo(const Value: string);
begin
  FItemTo := Value;
end;

procedure TStockNumber.SetParent(const Value: TStockDet);
begin
  FParent := Value;
end;

procedure TStockNumber.SetSILine(const Value: integer);
begin
  FSILine := Value;
end;

procedure TSTPrtTranFrm.QtyMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if trim(QtyMemo.text) <> '' then
        FromTreeView.setfocus;
    end;
end;

procedure TStockDet.SetSetsInPad(const Value: integer);
begin
  SDSetsInPad := Value ;
end;

procedure TSTPrtTranFrm.FormResize(Sender: TObject);
begin
  self.pnlCentreLeft.Width := trunc(self.pnlCentre.Width / 2);
end;

procedure TSTPrtTranFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TStockDet.SetPONumber(const Value: real);
begin
  SDPONumber := Value ;
end;

end.
