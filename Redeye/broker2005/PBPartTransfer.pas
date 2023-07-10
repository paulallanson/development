unit PBPartTransfer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ComCtrls, Buttons, ExtCtrls, ImgList, Db, DBTables;

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
    FStockNumbers: TStockNumbers;
    SDPONumber: real;
    SDPalletID: integer;
    SDOvers: string;
    SDJobBag: integer;
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
    procedure SetOvers(const Value: string);
    procedure SetPalletID(const Value: integer);
    procedure SetJobBag(const Value: integer);
  Public
    Constructor Create(const Code: Integer; Typ: Byte; Bin, Lot: string;
                             Date: TDateTime;
                             Qty, QtyAdj, Alloc, AllocAdj: Integer;
                             Cost, CostAdj: Real;
                             PackSize, SetsInPad: Integer;
                             StockDesc, InvUpfront: String; PONumber: real;
                             PalletID: integer; Overs: string;
                             JobBag: integer;
                             Numbers: TStockNumbers) ;
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
    property PalletID: integer read SDPalletID write SetPalletID;
    property Overs: string read SDOvers write SetOvers;
    property JobBag: integer read SDJobBag write SetJobBag;
  end;
  TPBPartTransferFrm = class(TForm)
    TreeImageList: TImageList;
    GetPOLinesSQL: TQuery;
    UpdPOLineSQL: TQuery;
    CheckPOStatusSQL: TQuery;
    UpdPOStatusSQL: TQuery;
    ToDataTreeView: TTreeView;
    GetPartPackSQL: TQuery;
    GetOrdAllocsSQL: TQuery;
    UpdPFJStatusSQL: TQuery;
    DelOrdAllocSQL: TQuery;
    GetSOTransSQL: TQuery;
    GetSOTranSQL: TQuery;
    DelSOTranSQL: TQuery;
    UpdSOTranSQL: TQuery;
    qryZero: TQuery;
    AddStStkSIqry: TQuery;
    GetStStkSIqry: TQuery;
    StatusBar1: TStatusBar;
    pnlBottom: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    ToPart2Label: TLabel;
    ToPartLabel: TLabel;
    pnlTop: TPanel;
    QtyLabel: TLabel;
    QtyMemo: TMemo;
    MovedLabel: TLabel;
    MovedMemo: TMemo;
    qryGetPArt: TQuery;
    qryGetCustomer: TQuery;
    PartGroupBox: TGroupBox;
    Label2: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    PartDescrEdit: TEdit;
    edtFormReference: TEdit;
    edtCustomerName: TEdit;
    pnlcentre: TPanel;
    pnlCentreRight: TPanel;
    ToGroupBox: TGroupBox;
    ToStoreLabel: TLabel;
    ToDetsLabel: TLabel;
    ToStoreDBLookupComboBox: TDBLookupComboBox;
    ToTreeView: TTreeView;
    pnlCentreLeft: TPanel;
    FromGroupBox: TGroupBox;
    FromStoreLabel: TLabel;
    FromDetsLabel: TLabel;
    FromStoreDBLookupComboBox: TDBLookupComboBox;
    FromTreeView: TTreeView;
    GRNGroupBox: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PORefEdit: TEdit;
    SuppNameEdit: TEdit;
    GRNEdit: TEdit;
    Label3: TLabel;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    lblMoveType: TLabel;
    edtReference: TEdit;
    qryUpPODelivery: TQuery;
    qryCheckPart: TQuery;
    qryAddPart: TQuery;
    qryUpdPart: TQuery;
    qryCheckStoreLevels: TQuery;
    qryAddStoreLevels: TQuery;
    qryUpPOQtyToDeliver: TQuery;
    qryGetNextPODelivery: TQuery;
    qryAddPODelivery: TQuery;
    qryGetPartTransfer: TQuery;
    qryDelPartTransfer: TQuery;
    qryOvers: TQuery;
    qrySOPicking: TQuery;
    qryGetPODelivery: TQuery;
    lblReference: TLabel;
    dblkpMoveType: TDBLookupComboBox;
    qryMovetype: TQuery;
    dtsMoveType: TDataSource;
    dblkpVersions: TDBLookupComboBox;
    qryVersions: TQuery;
    dtsVersions: TDataSource;
    qryUpPOVersions: TQuery;
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
    procedure LoadTreeViewFromPartTransfer(sTempPart: String);
    procedure LoadTreeViewFromStore(sTempPart: String);
    procedure LoadTreeViewFromPO(Sender: TObject);
    procedure ShowToPart(TempPart: String);
    procedure LoadTreeViewToStore(sTempPart: String);
    procedure LoadTreeViewToPartTransfer(sTempPart: String);
    procedure UpdToDataTree(TempPart: String);
    procedure FromTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure UpdStoreStock(TempTN: TTreeNode; sTempPart: String; iTempStore: Integer) ;
    procedure UpdPODelivLine(TempTN: TTreeNode);
    procedure UpdPOLine(TempTN: TTreeNode) ;
    procedure ToTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure FromTreeViewDblClick(Sender: TObject);
    procedure CheckFromVisible(Sender: TObject);
    procedure ToTreeViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure AutoAllocateStock(Sender: TObject);
    procedure LoadTreeViewFromTrans(Sender: TObject);
    procedure UpdPartTransfer(TempTN: TTreeNode; sTempPart: String; iTempStore: Integer);
    procedure UpdReturns(TempTN: TTreeNode; sTempPart: String; iTempStore: Integer);
    procedure UpdTransLine(TempTN: TTreeNode) ;
    function CheckIfMixingPacks(iTempFromPack,iTempToPack: Integer): Bytebool;
    procedure DelStoreStockNumbers(tempStk: TStockDet);
    procedure UpdStoreStockNumbers(tempStk: TStockDet);
    procedure QtyMemoKeyPress(Sender: TObject; var Key: Char);
    function SetFromNumbers(tempFrom, tempTo: TStockDet): TStockDet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PartEditKeyPress(Sender: TObject; var Key: Char);
    procedure PartEditExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure dblkpMoveTypeClick(Sender: TObject);
    procedure dblkpVersionsClick(Sender: TObject);
  private
    TotalDelivered: integer;
    sOldValue, sMoveTypeIn, sMoveTypeOut, sLotText: String;
    tnTempTotal, tnTempBin, tnTempLot: TTreeNode ;
    bFromBins, bToBins, bFromLots, bToLots, bUseSerialNos: ByteBool ;
    StockDet: TStockDet ;
    sListToPart: String ;
    slSNs: TStringList ;
    MoveDate: tDateTime;
    iToTreeViewScrollPoint: Integer;
    FCustomer: integer;
    function GetPartDetails: bytebool;
    procedure PrintLabel;
    procedure GetCustomerDetails(tempCode: integer);
    procedure SetCustomer(const Value: integer);
    function GetPackCost: real;
    procedure CreatePartDetails(TempSD: TStockDet);
    procedure CreateStoreLevels(TempSD: TStockDet);
    function GetPartEdit(tempPart: string): string;
    procedure UpdateDeliveries;
    procedure UpdateVersions;
    procedure CreatePODelivery(tempPO: real; tempDelivery: integer; tempQty: integer);
    function GetOversDetails(var tmpPO, tmpCost: real; var tmpPaidStock: boolean;
                             var tmpPackSize, tmpSetsPerPad: integer; var tmpLot: string;
                             var tmpLotDate: TDateTime): boolean;
  public
    TotalReturned: integer;
    VatCode: integer;
    ProductType: integer;
    Branch: integer;
    LastPart: string;
    bNumbered: bytebool;
    PaidStock: boolean;
    OrderQty: integer;
    QtyToDeliver: integer;
    OrderPrice, SellPrice: real;
    SellUnitFactor, UnitFactor, PackSize, SellUnit: integer;
    sFromName, sPORef, sMoveType: String ;
    iPOrd, iPORef, iStore, iStoreFrom: Integer ;
    iPOrder, iDelivery, iJobBag, iPalletID: integer;
    iDelivQty: integer;
    bOK, bStore_Ord: ByteBool ;
    property Customer: integer read FCustomer write SetCustomer;
  end;

var
  PBPartTransferFrm: TPBPartTransferFrm;

implementation

uses STStockDM, STPrtMnt, DateSelV5, STPrtTransQty, STPrtTransRecv,
  STPrtTransSN, STLUStStkNumbers, pbDatabase, ccscommon, pbMainMenu, STRSStockLabels, PBLUDeliveriesDM,
  PBLUPartOvers;

{$R *.DFM}

procedure TPBPartTransferFrm.FormCreate(Sender: TObject);
begin
  STStockDataMod := TSTStockDataMod.Create(Self) ;
  slSNs := TStringList.Create ;
  FromTreeView.Images := TreeImageList ;
  ToTreeView.Images := TreeImageList ;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBPartTransferFrm.FormDestroy(Sender: TObject);
begin
STStockDataMod.Free ;
TreeViewClearFrom(Self) ;
TreeViewClearTo(Self) ;
slSNs.Free ;
end;

procedure TPBPartTransferFrm.FormActivate(Sender: TObject);
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
if sMoveType = 'B' then
  begin
    With qryMoveType do
     begin
     Close ;
     Parambyname('Part_Move_Type_In').AsString := sMoveTypeIn;
     Parambyname('Part_Move_Type_Out').AsString := sMoveTypeOut;
     Open ;
     if recordcount = 1 then
        begin
          dblkpMovetype.keyvalue := fieldbyname('Part_Movement_Type').asstring;
          sMoveType := fieldbyname('Part_Movement_Type').asstring;
        end;
     end;
    lblMoveType.Visible := true;
    dblkpMoveType.Visible := true;
  end
else
  begin
    lblMoveType.Visible := false;
    dblkpMoveType.Visible := false;
  end;

PartGroupBox.Visible := (Pos(sMoveTypeIn,'PT') = 0) ;
lblReference.Visible := (Pos(sMoveTypeIn,'PT') = 0) ;
edtReference.Visible := (Pos(sMoveTypeIn,'PT') = 0) ;

if sMoveType = 'O' then
  begin
    lblReference.caption := 'GRN Number';
    with qryVersions do
      begin
        close;
        parambyname('Purchase_Order').asfloat := iPOrder;
        open;
        if recordcount > 0 then
          begin
            dblkpVersions.Visible := true;
            PartBitBtn.Visible := false;
            PartDescrEdit.Text := '';
            edtFormReference.Text := '';
          end
        else
          begin
            dblkpVersions.Visible := false;
          end;
      end;
  end
else
if sMoveType = 'P' then
  edtReference.text := 'OVERS';
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

  if sMoveTypeOut = 'S' then
  begin
    ToStoreLabel.Visible := true;
    ToStoreDBLookupComboBox.Visible := true;
    ToStoreDBLookupComboBox.KeyValue := dmBroker.qryCompany.FieldByName('Default_Warehouse').AsInteger;
    ToStoreDBLookupComboBoxClick(Self);
  end
  else
  begin
    ToStoreLabel.Visible := false;
    ToStoreDBLookupComboBox.Visible := false;
  end;

//ToStoreLabel.Visible := (sMoveTypeOut = 'S')  ;
//ToStoreDBLookupComboBox.Visible := (sMoveTypeOut = 'S')  ;
//QtyMemo.Visible := (sMoveTypeIn = 'B')  ;
//QtyLabel.Visible := (SMoveTypeIn = 'B') ;

QtyMemo.ReadOnly := (sMoveTypeIn <> 'B')  ;
QtyLabel.Enabled := (SMoveTypeIn = 'B') ;

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

procedure TPBPartTransferFrm.MoveTypeDBLookupComboBoxClick(Sender: TObject);
begin
{DISPLAY FROM/TO HERE} ;
sMoveTypeIn := STStockDataMod.GetMoveTypesSQL.FieldByName('Part_Move_Type_In').AsString ;
sMoveTypeOut := STStockDataMod.GetMoveTypesSQL.FieldByName('Part_Move_Type_Out').AsString ;
FromStoreLabel.Visible := (sMoveTypeIn = 'S') ;
FromStoreDBLookupComboBox.Visible := (sMoveTypeIn = 'S') ;
ToStoreLabel.Visible := (sMoveTypeOut = 'S') ;
ToStoreDBLookupComboBox.Visible := (sMoveTypeOut = 'S') ;
//QtyMemo.Visible := (sMoveTypeIn = 'B') ;
//QtyLabel.Visible := (sMoveTypeIn = 'B') ;

QtyMemo.ReadOnly := (sMoveTypeIn <> 'B') ;
QtyLabel.Enabled := (sMoveTypeIn = 'B') ;

LoadTreeViews(Self) ;
end;

procedure TPBPartTransferFrm.PartBitBtnClick(Sender: TObject);
begin
STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
Try
   STPrtMntFrm.bIs_LookUp := true ;
   STPrtMntFrm.sCode := PartEdit.Text ;
   STPrtMntFrm.ShowModal ;
   If STPrtMntFrm.bOK = True then
      begin
      LastPart := STPrtMntfrm.sCode;
      PartEdit.Text := STPrtMntFrm.sCode ;
      PartDescrEdit.Text := STPrtMntFrm.sCodeDescr;
      edtFormReference.Text := STPrtMntFrm.sFormRef;
      Customer := STPrtMntFrm.Customer;
//      PartSelected(PartEdit.Text);
      end;
Finally
   STPrtMntFrm.Free ;
   end;
LoadTreeViews(self) ;
end;

procedure TPBPartTransferFrm.GetCustomerDetails(tempCode: integer);
begin
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;
      edtCustomerName.text := fieldbyname('Name').asstring;
      PaidStock := (fieldbyname('Invoice_upfront').asstring = 'Y');
    end;
end;

procedure TPBPartTransferFrm.PartSelected(TempPart: String);
begin
{PART SELECTED HERE} ;
end;

procedure TPBPartTransferFrm.DateBitBtnClick(Sender: TObject);
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

procedure TPBPartTransferFrm.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBPartTransferFrm.QtyMemoExit(Sender: TObject);
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

function TPBPartTransferFrm.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
begin
  {Format the qunatity};
  if Trim(TempQty) = '' then
  begin
    Result := '';
    Exit;
  end;
  try
    begin
      Result := FormatFloat(TempFormat, StrToFloat(TempQty));
      if (StrToFloat(Result) < 0) and (TempNeg = False) then
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

procedure TPBPartTransferFrm.SetTreeText(tnTempSBT: TTreeNode);
Var
sTempTypeDescr, sTempDate, sTempLot, stempDesc: String ;
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
//     sTempDate := DateToStr(TempStockDet.Date) + ' - ' ;
     sTempDate := DateToStr(TempStockDet.Date);

if trim(TempStockDet.StockDesc) = '' then
  stempDesc := ' - '
else
  sTempDesc := ' - ' + trim(TempStockDet.StockDesc) + ' - ';

{If the item has NO children, show the qunatities in PACKS, otheriwse just show quantities} ;
If ((TempStockDet.Qty <> 0) or (TempStockDet.QtyAdj <> 0)) and (not tnTempSBT.HasChildren) then
        tnTempSBT.Text := sTempTypeDescr + ' ' + sTempDate + stempDesc + '(' + ShowInPacks(TempStockDet.Qty +
                          TempStockDet.QtyAdj,TempStockDet.PackSize) + '/' +
                          ShowInPacks(TempStockDet.Alloc + TempStockDet.AllocAdj,TempStockDet.PackSize) + ')' + sTempLot +
                          ' Pack Size: ' + IntToStr(TempStockDet.PackSize)
else
        tnTempSBT.Text := sTempTypeDescr + ' ' + sTempDate + '(' + ShowInPacks(TempStockDet.Qty +
                          TempStockDet.QtyAdj,1) + '/' +
                          ShowInPacks(TempStockDet.Alloc + TempStockDet.AllocAdj,1) + ')' + sTempLot ;
end;

procedure TPBPartTransferFrm.ToStoreDBLookupComboBoxClick(Sender: TObject);
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
                             StockDesc, InvUpfront: String; PONumber: real;
                             PalletID: integer; Overs: string;
                             JobBag: integer;
                             Numbers: TStockNumbers) ;
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
  SDPONumber := PONumber;
  SDPalletID := PalletID;
  SDOvers := Overs;
  SDJobBag := JobBag;
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

procedure TPBPartTransferFrm.FromTreeViewStartDrag(Sender: TObject;
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

procedure TPBPartTransferFrm.ToTreeViewDragOver(Sender, Source: TObject; X,
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

procedure TPBPartTransferFrm.ToTreeViewDragDrop(Sender, Source: TObject; X,
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
  bOversOK: boolean;
  tmpPO, tmpCost: real;
  tmpPackSize, tmpSetsPerPad: integer;
  tmpPaidStock: boolean;
  tmpLot: string;
  tmpLotDate: TDateTime;
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
   end
  else
  If (sMoveType = 'P') and (SDTo.Typ = 3) then
   begin
   {If they drag onto a lot, and it's a Production Overs movement type, prentend they dragged} ;
   {onto the parent item ie the BIN or STORE} ;
   tnTo := tnTo.Parent ;
   SDTo := tnTo.Data ;
   end;
  If (Pos(sMoveTypeIn,'PT') = 0)  then
    begin
    {NOT from a purchase order} ;

(*    {If Movement Type is Production Overs then select which overs they are}
    if sMoveType = 'P' then
      begin
        PBLUPartOversFrm := TPBLUPartOversFrm.create(self);
        try
          PBLUPartOversFrm.Part := STStockDataMod.GetPartSQL.FieldByName('Part').AsString;
          PBLUPartOversFrm.PartDescription := STStockDataMod.GetPartSQL.FieldByName('Part_Description').AsString;
          PBLUPartOversFrm.OversQty := (SDFrom.Qty + SDFrom.QtyAdj) - (SDFrom.Alloc + SDFrom.AllocAdj);
          PBLUPartOversFrm.showmodal;
          if PBLUPartOversFrm.ModalResult <> idOK then
            exit;

        finally
          PBLUPartOversFrm.free;
        end;
      end;
*)
    STPrtTransQtyFrm := TSTPrtTransQtyFrm.Create(Self);
    try
       STPrtTransQtyFrm.bAllowBin := (SDTo.Typ = 1) and (bToBins = True) ;
       STPrtTransQtyFrm.iQty := (SDFrom.Qty + SDFrom.QtyAdj) - (SDFrom.Alloc + SDFrom.AllocAdj);
       STPrtTransQtyFrm.sPackSize := IntToStr(SDFrom.PackSize) ;
       STPrtTransQtyFrm.BisOpnBal := sMoveType = 'O';
       STPrtTransQtyFrm.BisAdjIn := (sMoveType = 'A') or (sMoveType = 'T');
       STPrtTransQtyFrm.BisAdjOut := sMoveType = 'B';
       STPrtTransQtyFrm.EdtStckDsc.text := SDFrom.StockDesc;
       STPrtTransQtyFrm.memPO.text := floattostr(SDFrom.PONumber);
       STPrtTransQtyFrm.edtPalletID.text := floattostr(SDFrom.PalletID);
       STPrtTransQtyFrm.chkbxOvers.checked := (SDFrom.Overs = 'Y');
       if not STPrtTransQtyFrm.bAllowBin then
          STPrtTransQtyFrm.BinEdit.text := SDTo.Bin;
       STPrtTransQtyFrm.ChkBxInvUpFrnt.checked := (SDFrom.InvUpFront = 'Y');
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
          if iPOrder <> 0 then
            begin
              STPrtTransQtyFrm.EdtStckDsc.text := inttostr(iPOrder);
              STPrtTransQtyFrm.ChkBxInvUpFrnt.checked := (self.PaidStock);
              STPrtTransQtyFrm.sCost := floattostr(SDFrom.Cost);
              STPrtTransQtyFrm.sPackSize := inttostr(SDFrom.PackSize);

(*              STPrtTransQtyFrm.sCost := floattostr(self.OrderPrice);
              STPrtTransQtyFrm.sPackSize := inttostr(self.UnitFactor);
*)            end
          else
//        Overs
          if sMoveType = 'P' then
            begin
              tmpPO := 0;
              tmpPaidStock := true;
              tmpCost := 0.00;
              tmpPackSize := 1;
              tmpSetsPerPad := 1;
              tmpLot := SDFrom.Lot;
              tmpLotDate := date;
              bOversOK := GetOversDetails(tmpPO,tmpCost, tmpPaidStock, tmpPackSize, tmpSetsPerPad, tmpLot, tmpLotDate);

              if tmpPO = 0 then
                STPrtTransQtyFrm.EdtStckDsc.text := ''
              else
                STPrtTransQtyFrm.EdtStckDsc.text := floattostr(tmpPO);
              STPrtTransQtyFrm.ChkBxInvUpFrnt.checked := (tmpPaidStock);
              STPrtTransQtyFrm.sCost := floattostr(tmpCost);
              STPrtTransQtyFrm.sPackSize := inttostr(tmpPackSize);
              STPrtTransQtyFrm.spnSets.Value := tmpSetsPerPad;
              STPrtTransQtyFrm.memPO.text := floattostr(tmpPO);
              STPrtTransQtyFrm.edtPalletID.text := '0';
              STPrtTransQtyFrm.chkbxOvers.checked := true;
              SDFrom.Lot := tmpLot;
              SDFrom.Date := tmpLotDate;
            end
          else
            begin
              STPrtTransQtyFrm.ChkBxInvUpFrnt.checked := (self.PaidStock) or (sMoveType = 'O');
              STPrtTransQtyFrm.sCost := FloatToStr(STStockDataMod.GetPartSQL.FieldByName('Part_Purchase_Price').AsFloat) ;
              STPrtTransQtyFrm.sPackSize := IntToStr(STStockDataMod.GetPartSQL.FieldByName('purch_pack_Quantity').AsInteger) ;
            end;
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
       STPrtTransQtyFrm.spnSets.value := SDFrom.SetsinPad;
       STPrtTransQtyFrm.ShowModal;
       bTempOK := STPrtTransQtyFrm.bOK ;
       if bTempOK = false then exit;
       iTempPack := StrToInt(STPrtTransQtyFrm.PackSizeMemo.Text) ;
//       iTempQty := InpToSing(STPrtTransQtyFrm.QtyMemo.Text,iTempPack) ;
       iTempQty := strtoint(STPrtTransQtyFrm.MemoQty.Text) ;
       sTempBin := STPrtTransQtyFrm.BinEdit.Text ;
       fTempCost := StrToFloat(STPrtTransQtyFrm.CostMemo.Text) / iTempPack;
//       if sMoveType = 'O' then
        begin
          SDFrom.StockDesc := STPrtTransQtyFrm.edtStckDsc.text;
          SDFrom.PONumber := strtofloat(STPrtTransQtyFrm.memPO.text);
          SDFrom.PalletID := strtoint(STPrtTransQtyFrm.edtPalletID.text);
          try
            SDFrom.JobBag := strtoint(STPrtTransQtyFrm.edtJobNumber.text);
          except
            SDFrom.JobBag := 0;
          end;
          If STPrtTransQtyFrm.ChkBxInvUpFrnt.checked then
            SDFrom.InvUpfront := 'Y'
          else
            SDFrom.InvUpFront := 'N';
          If STPrtTransQtyFrm.chkbxOvers.checked then
            SDFrom.Overs := 'Y'
          else
            SDFrom.Overs := 'N';
          SDFrom.SetsInPad := STPrtTransQtyFrm.spnSets.value;
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
       fTempCost := StrToFloat(STPrtTransRecvFrm.CostMemo.Text) / iTempPack ;
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
   For iTempCount := 0 to (self.ToTreeView.Items.Count - 1) do
       If (TStockDet(self.ToTreeView.Items[iTempCount].Data).Bin = sTempBin) and
          (TStockDet(self.ToTreeView.Items[iTempCount].Data).Typ = 2)   then
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
          // This must be Production Overs
          if sMoveType = 'P' then
            sTempLot := SDFrom.Lot
          else
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
            if (sTempLot = SDFrom.Lot) and ((iTempPack <> SDFrom.PackSize) or
               (iTempQty <> SDFrom.Qty)) then
              sTempLot := STStockDataMod.GetNextLot(PartEdit.Text) ;
            tnTemp := ToTreeView.Items.AddChild(tnTo, '') ;
            StockDet := TStockDet.Create(0,3,SDTo.Bin,
                                          sTempLot,
                                          SDFrom.Date,
                                          0,iTempQty,
                                          0,0,
                                          0,(fTempCost * iTempQty), iTempPack,SDFrom.SetsinPad,
                                          SDFrom.StockDesc, SDFrom.InvUpfront, SDFrom.PONumber,
                                          SDFrom.PalletID, SDFrom.Overs, SDFrom.JobBag, nil);
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
                                          SDFrom.StockDesc, SDFrom.InvUpfront, SDFrom.PONumber,
                                          SDFrom.PalletID, SDFrom.Overs, SDFrom.JobBag, nil);
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
                                          SDFrom.StockDesc,SDFrom.InvUpfront, SDFrom.PONumber,
                                          SDFrom.PalletID, SDFrom.Overs, SDFrom.JobBag, nil);
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

function TPBPartTransferFrm.GetOversDetails(var tmpPO, tmpCost: real; var tmpPaidStock: boolean;
                                            var tmpPackSize, tmpSetsPerPad: integer; var tmpLot: string;
                                            var tmpLotDate: TDateTime): boolean;
var
  jobBag, salesOrder: integer;
  lotRef: string;
  iStart, iEnd: integer;
  tmpDate: TdateTime;
begin
  {check for any Used for Job movement types prior to today, if none, then they must be today}
  with qryOvers do
    begin
      close;
      parambyname('Part').asstring := STStockDataMod.GetPartSQL.FieldByName('Part').AsString;
      parambyname('Date_Received').asdatetime := (date - 1);
      open;

      if recordcount = 0 then
        tmpDate := date
      else
        tmpDate := date-1;
    end;

  with qryOvers do
    begin
      close;
      parambyname('Part').asstring := STStockDataMod.GetPartSQL.FieldByName('Part').AsString;
      parambyname('Date_Received').asdatetime := tmpDate;
      open;

      if recordcount = 0 then
        begin
          result := false;
          exit;
        end;

      istart := pos('(',fieldbyname('Part_Movement_Reference').asstring);
      iend := pos(')',fieldbyname('Part_Movement_Reference').asstring);
      JobBag := strtoint(trim(copy(fieldbyname('Part_Movement_Reference').asstring,10,iStart-10)));
      SalesOrder := strtoint(trim(copy(fieldbyname('Part_Movement_Reference').asstring,iStart+4,((iend)-(istart+4)))));
      LotRef := fieldbyname('Part_Store_Lot').asstring;
      tmpPO := fieldbyname('Purchase_Order').asfloat;
      tmppackSize := fieldbyname('Stock_Pack_Quantity').AsInteger;
      tmpCost := (fieldbyname('Store_Cost').AsInteger/fieldbyname('Store_Quantity').AsInteger)*fieldbyname('Stock_Pack_Quantity').AsInteger;
      tmpLot := LotRef;
    end;

  with qrySOPicking do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      parambyname('Part_Store_Lot').asstring := LotRef;
      parambyname('Part').asstring := STStockDataMod.GetPartSQL.FieldByName('Part').AsString;
      open;
      if recordcount > 0 then
        begin
          if fieldbyname('Date_Received').Asdatetime = 0 then
            tmpLotDate := date
          else
            tmpLotDate := fieldbyname('Date_Received').AsDateTime;
          tmpPaidStock := (fieldbyname('Invoice_Upfront').asstring = 'Y');
          tmpSetsPerPad := fieldbyname('Sets_Per_Pad').asinteger;
          if tmpSetsPerPad = 0 then
            tmpSetsPerPad := 1;
        end;
    end;
  result := true;
end;

procedure TPBPartTransferFrm.SetTreeQty(tnTempSBT: TTreeNode; iTempQty, ITempAlloc: Integer; bTempAdj, bTempSetText: ByteBool);
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


procedure TPBPartTransferFrm.OKBitBtnClick(Sender: TObject);
var
  iTempCount: Integer ;
  TempTreeView: TTreeView ;
  iTempPassNo, iTempStore: Integer ;
  sTempPart, sTempPassMoveType: String ;
begin
  // Check whether a futire date has been input
  if pbdatestr(DateEdit.text) > now then
    begin
      messagedlg('The movement date entered cannot be a future date, please enter an alternative date', mtError, [mbOk], 0);
      DateEdit.SetFocus;
      exit;
    end;

  if dblkpMoveType.Visible and (dblkpMoveType.Text = '') then
    begin
      MessageDlg('Please select the relevant movement type' , mterror, [mbOk], 0);
      dblkpMoveType.SetFocus ;
      exit ;
    end;

  if (Pos(sMoveTypeIn,'PT') > 0 ) and (GRNEdit.Text = '') then
    if MessageDlg('Proceed without entering a GRN number?' , mtConfirmation, [mbNo,mbYes],0) = mrNo then
      begin
        GRNEdit.SetFocus ;
        exit ;
      end;

  if (Pos(sMoveTypeIn,'PT') = 0 ) and (edtReference.Text = '') then
    begin
      MessageDlg('Please enter a reference for this movement' , mterror, [mbOk], 0);
      edtReference.SetFocus ;
      exit ;
    end;

  UpdToDataTree(sListToPart) ;
  Totaldelivered := 0;
  TotalReturned := 0;

  for iTempPassNo := 1 to 2 do
    begin
      case iTempPassNo of
        1:  begin
              if sMoveTypeIn = 'B' then
                continue ;
              TempTreeView := FromTreeView ;
              if sMoveTypeIn = 'S' then
                iTempStore := FromStoreDBLookupComboBox.KeyValue ;
              sTempPassMoveType := sMoveTypeIn ;
            end;
        2:  begin
              if sMoveTypeOut = 'B' then
                continue ;
              TempTreeView := ToDataTreeView ;
              if sMoveTypeOut = 'S' then
                iTempStore := ToStoreDBLookupComboBox.KeyValue ;
              sTempPassMoveType := sMoveTypeOut ;
            end;
      end;

      for iTempCount := 0 to (TempTreeView.Items.Count - 1) do
        begin
          {Loop through the nodes in the FROM tree} ;
          if Pos(sMoveTypeIn, 'PT') = 0 then
            sTempPart := PartEdit.Text
          else
            sTempPart := TempTreeView.Items[iTempCount].Text ;

          if sTempPassMoveType = 'S' then
            UpdStoreStock(TempTreeView.Items[iTempCount], sTempPart, iTempStore) ;

          if (sMoveType = 'P') and (iTempPassNo = 1) then
//            UpdPartTransfer(TempTreeView.Items[iTempCount], sTempPart, iTempStore) ;
            UpdReturns(TempTreeView.Items[iTempCount], sTempPart, iTempStore) ;

          if (sTempPassMoveType = 'S') and (iPOrder <> 0) then
            UpdPODelivLine(TempTreeView.Items[iTempCount]) ;

          if sTempPassMoveType = 'P' then
            UpdPOLine(TempTreeView.Items[iTempCount]) ;

          if sTempPassMoveType = 'T' then
            UpdTransLine(TempTreeView.Items[iTempCount]) ;
        end;
    end;

  if Pos(sMoveTypeIn, 'PT') > 0 then
    begin
    {Auto-allocate stock from orders} ;
      AutoAllocateStock(Self) ;
      bOK := True ;
      Close ;
    end
  else
   SetUpdatedState(False) ;

  {If iPOrder is set then we're confirming delivery of a purchase order}
  if iPOrder <> 0 then
    begin
      UpdateDeliveries;
      // Update the Purchase_OrderlineStockCode table here
      if dblkpVersions.Text <> '' then
        UpdateVersions;
      bOK := True;
      close;
    end;

  if sMoveType = 'P' then
    begin
      bOK := True;
      close;
    end;

  QtyMemo.Clear;
  MovedMemo.Clear;
  PartEdit.SetFocus;
end;

procedure TPBPartTransferFrm.PrintLabel;
begin
  STRSStockLabelsFrm := TSTRSStockLabelsFrm.create(self);
  try
    STRSStockLabelsFrm.Selcode := PartEdit.Text;
    STRSStockLabelsFrm.SelName := PartDescrEdit.Text;
    STRSStockLabelsFrm.FromReferencelbl.caption := edtFormReference.text;
    STRSStockLabelsFrm.showmodal;
  finally
    STRSStockLabelsFrm.free;
  end;
end;

procedure TPBPartTransferFrm.TreeViewClearFrom(Sender: TObject);
Var
iTempCount: Integer ;
begin
  {Clear out the 2 treeviews and more importantly, the associated objects} ;
  For iTempCount := 0 to (FromTreeView.Items.Count - 1) do
    TStockDet(FromTreeView.Items[iTempCount].Data).Free ;
  FromTreeView.Items.Clear ;
end;

procedure TPBPartTransferFrm.TreeViewClearTo(Sender: TObject);
Var
iTempCount: Integer ;
begin
  {Clear out the 2 treeviews and more importantly, the associated objects} ;
  For iTempCount := 0 to (ToDataTreeView.Items.Count - 1) do
    TStockDet(ToDataTreeView.Items[iTempCount].Data).Free ;
  ToDataTreeView.Items.Clear ;
end;

procedure TPBPartTransferFrm.SetUpdatedState(bTempUpd: ByteBool);
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
//DateEdit.Enabled := (bTempUpd = False) ;
//DateBitBtn.Enabled := (bTempUpd = False) ;
QtyMemo.Enabled := (bTempUpd = False);
end;

procedure TPBPartTransferFrm.CancelBitBtnClick(Sender: TObject);
begin
If MessageDlg('Cancel the movement(s) you just made?', mtConfirmation, [mbNo,mbYes],0) = mrYes then 
   begin
   SetUpdatedState(False);
   LoadTreeViews(Self) ;
   If Pos(sMoveTypeIn, 'PT') > 0 then
      Close ;
   end;
end;

procedure TPBPartTransferFrm.LoadTreeViews(Sender: TObject);
begin
LoadTreeViewTo(Self) ;
LoadTreeViewFrom(Self) ;
MovedMemo.Text := '0' ;
end;

procedure TPBPartTransferFrm.LoadTreeViewFrom(Sender: TObject);
begin
  if Pos(sMoveTypeIn, 'PT') = 0 then
    begin
(*      {If Production Returns then load only bins from Production}
      if sMoveType = 'P' then
        LoadTreeViewFromPartTransfer(PartEdit.Text)
      else
*)
        LoadTreeViewFromStore(PartEdit.Text)
    end
  else
  if (sMoveTypeIn = 'P') then
    LoadTreeViewFromPO(Self)
  else
  if (sMoveTypeIn = 'T') then
    LoadTreeViewFromTrans(Self);

  if sMoveType <> 'P' then
    CheckFromVisible(Self) ;
end;

procedure TPBPartTransferFrm.LoadTreeViewTo(Sender: TObject);
begin
  If Pos(sMoveTypeIn, 'PT') = 0 then
    begin
      TreeViewClearTo(self) ;
      sListToPart := PartEdit.Text ;
      if sMoveType = 'P' then
        LoadTreeViewToPartTransfer(sListToPart)
      else
        LoadTreeViewToStore(sListToPart) ;
      ShowToPart(sListToPart) ;
    end;
  if sMoveType <> 'P' then
    CheckFromVisible(Self) ;
end;

procedure TPBPartTransferFrm.FromStoreDBLookupComboBoxClick(Sender: TObject);
begin
With STStockDataMod.GetStoresSQL do
     begin
     bFromBins := (FieldByName('Stock_Bins_In_Use').AsString = 'Y') ;
     bFromLots := (FieldByName('Stock_Lots_In_Use').AsString = 'Y')
     end;
LoadTreeViewFrom(Self) ;
end;

function TPBPartTransferFrm.GetPackCost: real;
begin
  if unitFactor = 0 then
    begin
      result := OrderPrice/OrderQty;
      PackSize := 1;
    end
  else
    begin
      result := ((OrderPrice/unitFactor) * PackSize);
      PackSize := PackSize;
    end;
end;

procedure TPBPartTransferFrm.LoadTreeViewFromStore(sTempPart: String);
Var
  PackCost: real;
  sPaidStock: string;
  sPrevBin, sPrevLot: String ;
  sBin, sLot: String ;
  tnTemp: TTreeNode ;
  tnTempLast: Array[0..3] of TTreeNode ;
  iTempCount, iLevel: Integer ;
  iNumber: integer;
  SDNumber: TStockNumber;
  sMoveInDescr, sOvers: string;
begin
  TreeViewClearFrom(Self) ;
  If (sTempPart = '') then
    exit ;
  If sMoveTypeIn = 'B' then
    begin
      {This is an adjustment in} ;
      if QtyMemo.Text = '' then
        exit ;
      tnTemp := FromTreeView.Items.Add(Nil, sTempPart) ;
      if PaidStock then
        sPaidStock := 'Y';
      if iPOrder <> 0 then
        begin
          PackCost := GetPackCost;
          StockDet := TStockDet.Create(0, 0,'Incoming stock',
                                          '',
                                          StrToDate(DateEdit.Text),
                                          StrToInt(QtyMemo.Text), 0,
                                          0, 0,
                                          (PackCost), 0, PackSize,
                                          0,inttostr(iPOrder),sPaidStock, iPOrder,
                                          iPalletID, 'N', 0, nil)
        end
      else
        begin
          if self.sMoveType = 'P' then
            begin
              sMoveInDescr := 'Production Overs';
              sOvers := 'Y';
            end
          else
            begin
              sMoveInDescr := 'Incoming Stock';
              sOvers := 'N';
            end;

          StockDet := TStockDet.Create(0, 0,sMoveInDescr,
                                          '',
                                          StrToDate(DateEdit.Text),
                                          StrToInt(QtyMemo.Text), 0,
                                          0, 0,
                                          0, 0,STStockDataMod.GetPartSQL.FieldByName('purch_pack_Quantity').AsInteger,
                                          0,'','', 0.00, 0, sOvers, 0, nil) ;
        end;
      tnTemp.Data := StockDet ;
      SetTreeText(tnTemp) ;
      exit ;
    end;

If (FromStoreDBLookUpComboBox.text = '')  then
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
                                          FieldByName('Purchase_Order').asfloat,
                                          FieldbyName('Pallet_ID').asinteger,
                                          Fieldbyname('Stock_is_Overs').AsString,
                                          0, nil) ;
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
                                          FieldByName('Purchase_Order').AsFloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
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
                                          FieldByName('Purchase_Order').Asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
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

procedure TPBPartTransferFrm.LoadTreeViewFromPartTransfer(sTempPart: String);
Var
  PackCost: real;
  sPaidStock: string;
  sPrevBin, sPrevLot: String ;
  sBin, sLot: String ;
  tnTemp: TTreeNode ;
  tnTempLast: Array[0..3] of TTreeNode ;
  iTempCount, iLevel: Integer ;
  iNumber: integer;
  SDNumber: TStockNumber;
begin
  TreeViewClearFrom(Self) ;
  if (sTempPart = '') then
    exit ;
  if (FromStoreDBLookUpComboBox.text = '')  then
    exit ;
  {Load up the stock details} ;
//  with STStockDataMod.qryGetTransferStStk do
  with STStockDataMod.qryGetReturns do
     begin
     {First, get the totals} ;
     Close ;
//     ParamByName('Part_Store').AsInteger := FromStoreDBLookupComboBox.KeyValue ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Job_bag').Asinteger := iJobBag ;
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
                                          FieldbyName('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          Fieldbyname('Pallet_ID').asinteger,
                                          Fieldbyname('Stock_is_Overs').asstring,
                                          0, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                    STStockDataMod.qryGetReturns.fieldbyname('Store_Stock').asinteger;
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
                                          FieldByName('Purchase_Order').Asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                    STStockDataMod.qryGetReturns.fieldbyname('Store_Stock').asinteger;
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
           SetTreeQty(tnTemp,FieldByName('Quantity_Overs').AsInteger,
                             FieldByName('Quantity_Allocated').AsInteger,
                             False, False) ;
           Next ;
           end;
     end;
For iTempCount := 0 to FromTreeView.Items.Count - 1 do
               SetTreeText(FromTreeView.Items[iTempCount]) ;
FromTreeView.FullExpand ;
end;

procedure TPBPartTransferFrm.LoadTreeViewFromPO(Sender: TObject);
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
                                          inttostr(iPOrd),
//                                          FieldByName('Part_Description').AsString,
                                          FieldByName('Invoice_UpFront').AsString,
                                          FieldByName('Purchase_Order').Asfloat,
                                          iPalletID,
                                          'N', 0,
                                          nil);
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

procedure TPBPartTransferFrm.ShowToPart(TempPart: String);
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

procedure TPBPartTransferFrm.LoadTreeViewToStore(sTempPart: String);
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
                                          0, 0,1, 0,'','',0.00,0,'N',0,nil) ;
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
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

procedure TPBPartTransferFrm.LoadTreeViewToPartTransfer(sTempPart: String);
var
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
  if (sTempPart = '') then
    exit ;

  if (ToStoreDBLookUpComboBox.text = '')  then
    exit ;

    {Load up the stock details} ;
  with STStockDataMod.qryGetNonTransferStStk do
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
     {Load the store_stock_serial_items}
     GetStStkSIqry.close;
     GetStStkSIqry.parambyname('Store_Stock').asinteger :=
              STStockDataMod.qryGetNonTransferStStk.fieldbyname('Store_Stock').asinteger;
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                        STStockDataMod.qryGetNonTransferStStk.fieldbyname('Store_Stock').asinteger;
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          FieldByName('Pallet_ID').Asinteger,
                                          FieldByName('Stock_is_Overs').Asstring,
                                          0, nil) ;
              {Load the store_stock_serial_items}
              GetStStkSIqry.close;
              GetStStkSIqry.parambyname('Store_Stock').asinteger :=
                    STStockDataMod.qryGetNonTransferStStk.fieldbyname('Store_Stock').asinteger;
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

procedure TPBPartTransferFrm.UpdToDataTree(TempPart: String);
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

procedure TPBPartTransferFrm.FromTreeViewChange(Sender: TObject;
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

procedure TPBPartTransferFrm.UpdStoreStock(TempTN: TTreeNode; sTempPart: String;
                                              iTempStore: Integer) ;
Var
  TempSD: TStockDet ;
  TempMoveRef, sTempMoveType: String ;
  sOvers: string;
  SONumber: integer;
begin
  TempMoveRef := edtReference.text;
  if STSTockDataMod.GetPartSQL.FieldBYName('Product_Class').AsString = 'NSTK' then
    exit;
  If Pos(sMoveType, 'GH') > 0 then
    TempMoveRef := 'GRN:' + GRNEdit.Text + '/PO:' + PORefEdit.Text ;
  If Pos(sMoveType, 'O') > 0 then
    begin
      if iPOrder <> 0 then
        TempMoveRef := 'GRN:' + edtReference.text + ' - PO: ' + inttostr(iPOrder)
      else
        TempMoveRef := 'GRN:' + edtReference.text;
    end;
  TempSD := TempTN.Data ;
  If TempTN.HasChildren = False then
  begin
    begin
        sTempMoveType := sMoveType ;
        if sMoveType = 'T' then
          if TempSD.QtyAdj >= 0 then
            sTempMoveType := 'V'
          else
            sTempMoveType := 'U' ;

        if sMoveType = 'P' then
          TempSD.Overs := 'Y';

        if TempSD.Code = 0 then
          begin
            if iPOrder <> 0 then
              begin
              {Check the part exists}
              CreatePartDetails(TempSD);
              CreatestoreLevels(TempSD);
              TempSD.Lot := STStockDataMod.GetNextLot(PartEdit.Text);
              end;
            {This is a new stock item} ;
            STStockDataMod.AddStoreStock(sTempPart,iTempStore,TempSD.Bin,
                              TempSD.Lot, sTempMoveType, TempMoveRef,
                              TempSD.Date, MoveDate, TempSD.QtyAdj, TempSD.AllocAdj, TempSD.PackSize,
                              TempSD.CostAdj,TempSD.StockDesc, TempSD.Invupfront, TempSD.SetsInPad, TempSD.PONumber, TempSD.PalletID, TempSD.Overs);
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
                              TempSD.CostAdj, TempSD.StockDesc, TempSD.Invupfront, TempSD.SetsInPad, TempSD.PONumber, TempSD.PalletID, 0, TempSD.Overs);
          end;
        UpdStoreStockNumbers(TempSD);
        if TempSD.JobBag <> 0 then
          begin
            SONUmber := STStockDataMod.CreateSalesOrder(TempSD.Code,sTempPart,iTempStore,TempSD.Bin,
                              TempSD.Lot, sTempMoveType, TempMoveRef,
                              TempSD.Date, MoveDate, TempSD.QtyAdj, TempSD.AllocAdj, TempSD.PackSize,
                              TempSD.CostAdj, TempSD.StockDesc, TempSD.Invupfront, TempSD.SetsInPad, TempSD.PONumber, TempSD.PalletID, 0, TempSD.Overs, TempSD.JobBag);
            {If we have a valid order number then Allocate, and confirm the order}
            if SONumber > 0 then
              begin
                STStockDataMod.AllocateSalesOrder(SONumber, iTempStore, TempSD.Bin);
                STStockDataMod.CreatePickNote(SONumber);
                STStockDataMod.CreateDeliveryNote(SONumber);
                STStockDataMod.ConfirmPicking(SONumber);
              end;
          end;
       end;
   end;
end;

procedure TPBPartTransferFrm.UpdPOLine(TempTN: TTreeNode) ;
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

procedure TPBPartTransferFrm.UpdPODelivLine(TempTN: TTreeNode) ;
var
  TempSD: TStockDet ;
  TempStat: String;
  dtmdlDeliveries: TdtmdlDeliveries;
begin
  TempSD := TempTN.Data ;

  If TempTN.HasChildren = False then
  begin
    {Update the purchase order line} ;
    with qryUpPODelivery do
      begin
        Close ;
        parambyname('Purchase_Order').AsInteger := iPOrder;
        parambyname('Line').asinteger := 1;
        paramByName('Delivery_no').AsInteger := iDelivery ;
        {Note that the quantity received is an ADJUSTMENT} ;
        ParamByName('Qty_Delivered').AsInteger := TempSD.QtyAdj ;
        ParamByName('Date_Deliv_Actual').AsDateTime := StrToDate(DateEdit.Text) ;
        ExecSQL ;
      end;

    Totaldelivered := TotalDelivered + TempSD.QtyAdj;

  end;
end;

procedure TPBPartTransferFrm.UpdateVersions;
begin
  with qryUpPOVersions do
    begin
      Close ;
        parambyname('Purchase_Order').AsInteger := iPOrder;
        parambyname('Line').asinteger := 1;
        paramByName('Stock_Code_no').AsInteger := dtsVersions.DataSet.FieldByName('Stock_Code_no').Asinteger;
        ParamByName('Quantity_Delivered').AsInteger := Totaldelivered ;
        ExecSQL ;
      end;
end;

procedure TPBPartTransferFrm.UpdateDeliveries;
begin
  with qryUpPOQtyToDeliver do
    begin
      Close ;
        parambyname('Purchase_Order').AsInteger := iPOrder;
        parambyname('Line').asinteger := 1;
        paramByName('Delivery_no').AsInteger := iDelivery ;
        ParamByName('Qty_to_deliver').AsInteger := Totaldelivered ;
        ExecSQL ;
      end;

  if Totaldelivered < QtyToDeliver then
    CreatePOdelivery(iPOrder, iDelivery, (QtyToDeliver-TotalDelivered));

  dtmdlDeliveries := TdtmdlDeliveries.create(self);
  try
    dtmdlDeliveries.SavePurchaseOrder(iPOrder,1);
  finally
    dtmdlDeliveries.free;
  end;
end;

procedure TPBPartTransferFrm.CreateStoreLevels(TempSD: TStockDet);
begin
  with qryCheckStoreLevels do
  begin
    Close;
    ParamByname('Part').asString := trim(PartEdit.text);
    Open;
    if (recordcount = 0) then
      with qryAddStoreLevels do
      begin
        Close;
        ParamByName('Part').AsString := trim(PartEdit.text);
        ParamByName('Rep_Store').Clear;
        ParamByName('MinMax_Qty').AsFloat := TempSD.Packsize;
        ExecSQL;
      end;
  end;
end;

procedure TPBPartTransferFrm.CreatePartDetails(TempSD: TStockDet);
var
  bExists: boolean;
  PartPrice, PartCost: real;
begin
  if SellUnitFactor = 0 then
    begin
    if TempSD.PackSize > 0 then
      PartPrice := (SellPrice/OrderQty) * TempSD.PackSize
    else
      PartPrice := SellPrice;
    end
  else
    begin
    if TempSD.PackSize > 0 then
      PartPrice := (TempSD.PackSize/sellUnitFactor)*SellPrice
    else
      PartPrice := sellUnitFactor * SellPrice;
    end;

  with qryCheckPart do
  begin
    Close;
    ParamByName('Part').AsString := trim(PartEdit.text);
    Open;
    bExists := (Recordcount > 0);
  end;

  if bExists then
    begin
      with qryUpdPart do
      begin
        Close;
        ParamByName('Part').AsString := trim(PartEdit.text);
        ParamByName('Part_Purchase_Price').AsFloat := (tempSD.SDCostAdj / tempSD.SDQtyAdj) * tempSD.SDPackSize;
        ParamByName('Purch_Pack_Quantity').AsFloat := tempSD.SDPackSize;

        ParamByName('Part_Cost_List').AsFloat := PartPrice;
        ParamByName('Part_Cost_Cat').AsFloat := PartPrice;
        ParamByName('Sell_Pack_Quantity').AsFloat := tempSD.SDPackSize;

        ParambyName('Price_unit').asinteger := SellUnit;
        ParambyName('Product_Type').asinteger := ProductType;
        ExecSQL;
      end;
    end
  else
    begin
      with qryAddPart do
      begin
        Close;
        ParamByName('Part').AsString := trim(PartEdit.text);
        ParamByName('Part_Description').AsString := PartDescrEdit.Text;
        ParamByName('VAT').AsInteger := VatCode;
        ParamByName('Part_Group').Clear;
//        ParamByName('Part_Purchase_Price').AsFloat := tempSD.SDCost;
        if tempSD.SDInvUpFront = 'Y' then
          begin
            ParamByName('Part_Cost_List').AsFloat := 0;
            ParamByName('Part_Cost_Cat').AsFloat := 0;
            ParamByName('Part_Purchase_Price').AsFloat := 0;
          end
        else
          begin
            ParamByName('Part_Cost_List').AsFloat := PartPrice;
            ParamByName('Part_Cost_Cat').AsFloat := PartPrice;
            ParamByName('Part_Purchase_Price').AsFloat := (tempSD.SDCostAdj / tempSD.SDQtyAdj) * tempSD.SDPackSize;
          end;

        ParamByName('Part_Mark_Up_List').AsFloat := 0.00;
        ParamByName('Part_Mark_Up_Cat').AsFloat := 0.00;

        ParamByName('Purch_Pack_Quantity').AsFloat := tempSD.SDPackSize;

        ParamByName('Sell_Pack_Quantity').AsFloat := tempSD.SDPackSize;

        ParamByName('Track_Serial_No').AsString := 'N';
        ParamByName('Auto_Update').AsString := 'N';
        ParamByName('Not_In_Use').AsString := 'N';

        if bNumbered then
          ParamByName('Numbered').asstring := 'Y'
        else
          ParamByName('Numbered').asstring := 'N';

        ParambyName('Customer').asinteger := Customer;
        ParambyName('Branch_no').asinteger := Branch;
        ParambyName('Price_unit').asinteger := SellUnit;
        ParambyName('Product_Type').asinteger := ProductType;
        Parambyname('Product_ID').asinteger := dmBroker.GetNextProductID;
        ExecSQL;
      end;
    end;
end;

procedure TPBPartTransferFrm.ToTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
StockDet := Node.Data ;
end;

procedure TPBPartTransferFrm.FromTreeViewDblClick(Sender: TObject);
begin
{Allow double click to auto-transfer} ;
{Can't do it if a decision about bins/lots is required} ;
If (bToBins) or (bToLots) then
   exit ;
ToTreeViewDragDrop(ToTreeView, FromTreeView ,10,10) ;
end;

procedure TPBPartTransferFrm.CheckFromVisible(Sender: TObject);
begin
  {Check if FROM treeview should be visible and if not, allow drag from TO tree} ;
  if (sMoveTypeIn = 'S') and (sMoveTypeOut = 'S') and
    (FromStoreDBLookupComboBox.KeyValue = ToStoreDBLookupComboBox.KeyValue) and
//   (FromStoreDBLookupComboBox.text = '') then
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

procedure TPBPartTransferFrm.ToTreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
   If ToTreeView.Selected.HasChildren then
      begin
      MessageDlg('You can only move individual items', mtError, [mbOK],0) ;
   If (TStockDet(ToTreeView.Selected.Data).Qty + TStockDet(ToTreeView.Selected.Data).QtyAdj) < 1 then
      MessageDlg('There is no stock to move', mtError, [mbOK],0) ;
   end;
end;

procedure TPBPartTransferFrm.AutoAllocateStock(Sender: TObject);
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

procedure TPBPartTransferFrm.LoadTreeViewFromTrans(Sender: TObject);
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
                                          Fieldbyname('Purchase_Order').asfloat,
                                          iPalletID, 'N',
                                          0, nil) ;
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

procedure TPBPartTransferFrm.UpdTransLine(TempTN: TTreeNode) ;
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

function TPBPartTransferFrm.CheckIfMixingPacks(iTempFromPack,iTempToPack: Integer): Bytebool;
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

procedure TPBPartTransferFrm.UpdStoreStockNumbers(tempStk: TStockDet);
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

procedure TPBPartTransferFrm.DelStoreStockNumbers(tempStk: TStockDet);
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

function TPBPartTransferFrm.SetFromNumbers(tempFrom, tempTo: TStockDet): TStockDet;
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
                                          TempFrom.StockDesc, TempFrom.InvUpfront,
                                          TempFrom.PONumber,
                                          TempFrom.PalletID,
                                          TempFrom.Overs,
                                          0, nil);
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

procedure TPBPartTransferFrm.QtyMemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TPBPartTransferFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBPartTransferFrm.PartEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if GetPartDetails then
        begin
          LoadTreeViews(self);
          QtyMemo.setfocus;
        end
      else
        begin
          PartEdit.Text := LastPart;
          PartEdit.setfocus;
        end
    end;
end;

function TPBPartTransferFrm.GetPartDetails: bytebool;
begin
  Result := true;
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := PartEdit.text;
      open;

      if recordcount = 0 then
        begin
          MessageDlg('Product does not exist.', mterror,[mbOk], 0);
          Result := false;
          exit;
        end
      else
        begin
          LastPart := fieldbyname('Part').asstring;
          PartEdit.Text := fieldbyname('Part').asstring;
          PartDescrEdit.Text := fieldbyname('Part_Description').asstring;
          edtFormreference.Text := fieldbyname('form_Reference_ID').asstring;
          PartSelected(PartEdit.Text);
        end;
    end;
end;

procedure TPBPartTransferFrm.PartEditExit(Sender: TObject);
begin
  if not Partedit.focused then exit;
  if GetPartDetails then
    begin
      LoadTreeViews(self);
    end
  else
    begin
      PartEdit.Text := LastPart;
      PartEdit.setfocus;
    end;
end;

procedure TPBPartTransferFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  GetCustomerDetails(FCustomer);
end;

procedure TPBPartTransferFrm.FormResize(Sender: TObject);
begin
  self.pnlCentreLeft.Width := trunc(self.pnlCentre.Width / 2);
end;

procedure TPBPartTransferFrm.DateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate((Sender as Tedit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as Tedit).SetFocus;
      Exit;
    end;
  end;

  (Sender as Tedit).Text := PBDatestr(NewDate);
end;

procedure TPBPartTransferFrm.CreatePODelivery(tempPO: real; tempDelivery,
  tempQty: integer);
var
  DeliveryNo: integer;
  Branch: integer;
begin
  {Get the last delivery to check for company delivery branch}
  with qryGetPODelivery do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      Branch := fieldbyname('Company_Branch').asinteger;
    end;

  {get the next Delivery Number}
  with qryGetNextPODelivery do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;

      DeliveryNo := fieldbyname('Last_Delivery').asinteger + 1;
    end;

  with qryAddPODelivery do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      parambyname('Delivery_no').asinteger := DeliveryNo;
      parambyname('Qty_To_Deliver').asinteger := tempQty;
      parambyname('Qty_Delivered').asinteger := 0;
      parambyname('Qty_Invoiced').asinteger := 0;
      parambyname('Date_Point').asdatetime := date;
      parambyname('Company_Branch').asinteger := Branch;
      parambyname('Delivery_to_Stock').asstring := 'Y';
      execsql;
    end;

end;

function TPBPartTransferFrm.GetPartEdit(tempPart: string): string;
begin
end;

procedure TPBPartTransferFrm.UpdPartTransfer(TempTN: TTreeNode; sTempPart: String; iTempStore: Integer);
var
  TempSD: TStockDet ;
  iTransfer: integer;
begin
  TempSD := TempTN.Data ;
  with qryGetPartTransfer do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempSD.SDCode;
      parambyname('Part_Store').asinteger := iTempStore;
      parambyname('Part').asstring := sTempPart;
      open;

      itransfer := fieldbyname('Part_Transfer').asinteger;
    end;

  if TempTN.HasChildren = False then
    begin
      if Copy(TempSD.SDLot,1,1) = 'Y' then
      begin
        with DelSOTranSQL do
          begin
            Close ;
            ParamByName('Part_Transfer').AsInteger := iTransfer ;
            ExecSQL ;
          end ;
      end
      else
      begin
      {Update the transfer line} ;
        with UpdSOTranSQL do
          begin
          Close ;
          ParamByName('Part_Transfer').AsInteger := iTransfer ;
          ParamByName('Quantity_Received').AsInteger := (TempSD.QtyAdj * -1);
          ParamByName('Date_Received').AsDateTime := StrToDate(DateEdit.Text) ;
          ParamByName('Store_Cost').AsFloat := TempSD.CostAdj;
          ExecSQL ;
          end;

      {Now delete the Part Transfer record if qty received = store quantity}
        with qryDelPartTransfer do
          begin
          Close ;
          ParamByName('Part_Transfer').AsInteger := iTransfer;
          execsql;
          end;

      end;
    end;
end;

procedure TPBPartTransferFrm.UpdReturns(TempTN: TTreeNode; sTempPart: String; iTempStore: Integer);
var
  TempSD: TStockDet ;
  iTransfer: integer;
begin
  TempSD := TempTN.Data ;

  If TempTN.HasChildren = False then
    begin

      TotalReturned := TotalReturned  + (TempSD.QtyAdj*-1);
    end;
end;

procedure TStockDet.SetPONumber(const Value: real);
begin
  SDPONumber := Value;
end;

procedure TStockDet.SetOvers(const Value: string);
begin
  SDOvers := Value;
end;

procedure TStockDet.SetPalletID(const Value: integer);
begin
  SDPalletID := Value;
end;

procedure TPBPartTransferFrm.dblkpMoveTypeClick(Sender: TObject);
begin
  sMoveType := dblkpMoveType.KeyValue;
end;

procedure TPBPartTransferFrm.dblkpVersionsClick(Sender: TObject);
begin
  PartEdit.Text := dtsVersions.DataSet.FieldByName('Stock_Reference').AsString;
  PartDescrEdit.Text := dtsVersions.DataSet.FieldByName('Description').AsString;
  edtFormReference.Text := dtsVersions.DataSet.FieldByName('Form_Reference_ID').AsString;
  qtyMemo.Text := formatfloat('0',dtsVersions.dataset.fieldbyname('Quantity_Outstanding').asfloat);
  LoadTreeViews(Self);
end;

procedure TStockDet.SetJobBag(const Value: integer);
begin
  SDJobBag := Value;
end;

end.
