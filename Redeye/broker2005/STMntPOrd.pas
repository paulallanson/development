unit STMntPOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Contnrs, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, ComCtrls, Menus,
  Grids, STPOObjects, DBGrids, PBSupplierInvoiceDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPOLine = class
  Private
    PLPart: String ;
    PLStore: Integer;
    PLGRN: String;
    PLAllocPFJ: Integer;
    PLPOL: Integer ;
    PLQtyOrd: Integer;
    PLQtyRec: Integer ;
    PLPartPack: Integer ;
    PLExpect: TDateTime;
    PLActual: TDateTime;
    PLPrice: Real ;
    PLDiscount: Real;
    PLCost: Real;
    FDescription: string;
    FQtyInvd: real;
    FNotes: string;
    FLineIsSample: boolean;
    Procedure SetPart(const Value: string);
    Procedure SetStore(const Value: Integer);
    Procedure SetGRN(const Value: string);
    Procedure SetAllocPFJ(const Value: Integer);
    Procedure SetPOL(const Value: integer);
    Procedure SetQtyOrd(const Value: integer);
    Procedure SetQtyRec(const Value: integer);
    Procedure SetPartPack(const Value: integer);
    Procedure SetExpect(const Value: TDateTime);
    Procedure SetActual(const Value: TDateTime);
    Procedure SetPrice(const Value: Real);
    procedure SetDiscount(const Value: Real);
    procedure setCost(const Value: Real);
    procedure SetDescription(const Value: string);
    procedure SetQtyInvd(const Value: real);
    procedure SetNotes(const Value: string);
    procedure SetLineIsSample(const Value: boolean);
  Public
    Constructor Create(const Part: String; Store: Integer; GRN: String;
        AllocPFJ: Integer; POL, QtyOrd, QtyRec, PartPack: Integer;
        Expect, Actual: TDateTime; Price, Discount, Cost, qtyInvd: Real;
        Description, Notes: string; LineIsSample: boolean) ;
    property Part: string read PLPart write SetPart ;
    property Store: integer read PLStore write SetStore ;
    property GRN: string read PLGRN write SetGRN ;
    property AllocPFJ: integer read PLAllocPFJ write SetAllocPFJ ;
    property POL: integer read PLPOL write SetPOL ;
    property QtyOrd: integer read PLQtyOrd write SetQtyOrd ;
    property LineIsSample : boolean read FLineIsSample write SetLineIsSample;
    property QtyRec: integer read PLQtyRec write SetQtyRec ;
    property PartPack: integer read PLPartPack write SetPartPack ;
    property Expect: TDateTime read PLExpect write SetExpect ;
    property Actual: TDateTime read PLActual write SetActual ;
    property Price: Real read PLPrice write SetPrice ;
    property Discount: Real Read PLDiscount Write SetDiscount;
    property Cost: Real read PLCost write setCost;
    property Description: string read FDescription write SetDescription;
    property QtyInvd: real read FQtyInvd write SetQtyInvd;
    property Notes: string read FNotes write SetNotes;
  end;

  TSTMntPOrdFrm = class(TForm)
    UpdSQL: TFDQuery;
    DetsGrpBox: TGroupBox;
    AddSQL: TFDQuery;
    DelSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    Label2: TLabel;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    NoLabel: TLabel;
    OrdNoEdit: TEdit;
    GetLinesSQL: TFDQuery;
    GetStoresSQL: TFDQuery;
    StoresDataSource: TDataSource;
    GetReqdSQL: TFDQuery;
    AddWorkSQL: TFDQuery;
    UpdCompRefSQL: TFDQuery;
    GetLastLineSQL: TFDQuery;
    AddLineSQL: TFDQuery;
    UpdLineSQL: TFDQuery;
    DelLineSQL: TFDQuery;
    DelLinesSQL: TFDQuery;
    TotLabel: TLabel;
    SuppGroupBox: TGroupBox;
    Label1: TLabel;
    SuppNameEdit: TEdit;
    SuppBitBtn: TBitBtn;
    StoreFromGroupBox: TGroupBox;
    Label4: TLabel;
    StoreFromDBLookupComboBox: TDBLookupComboBox;
    GetStoresFromSQL: TFDQuery;
    StoresFromDataSource: TDataSource;
    GetReqdPOSQL: TFDQuery;
    GetReqdSOSQL: TFDQuery;
    Label5: TLabel;
    DescrEdit: TEdit;
    GetPFJJobSQL: TFDQuery;
    GetAllocsSQL: TFDQuery;
    AddPFJSQL: TFDQuery;
    DelPFJSQL: TFDQuery;
    UpdPFJStatusOSQL: TFDQuery;
    UpdPFJStatusRSQL: TFDQuery;
    pnlStoreDetails: TPanel;
    Label3: TLabel;
    StoreDBLookupComboBox: TDBLookupComboBox;
    pnlSalesDetails: TPanel;
    Label6: TLabel;
    lblSalesOrder: TLabel;
    GetDiscRateSQL: TFDQuery;
    lblSuppOrderType: TLabel;
    ppmnPOLines: TPopupMenu;
    AddPOLine: TMenuItem;
    ChangePOLine: TMenuItem;
    DeletePOLine: TMenuItem;
    RecommendPOLine: TMenuItem;
    strgrdExtChgDets: TStringGrid;
    ppmnExChrgsGrid: TPopupMenu;
    AddExChrg: TMenuItem;
    ChangeExChrg: TMenuItem;
    DeleteExChrg: TMenuItem;
    Label7: TLabel;
    pmnDummy: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    qryInsSOLine: TFDQuery;
    qrySelHighestSOLine: TFDQuery;
    qrySelPart: TFDQuery;
    qrySelSO: TFDQuery;
    pnlFooter: TPanel;
    NotesBitBtn: TBitBtn;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    FlashTimer: TTimer;
    qryDelPONarrative: TFDQuery;
    qryGetPO: TFDQuery;
    stsbrDetails: TStatusBar;
    qryGetOperator: TFDQuery;
    Label8: TLabel;
    RequestedByEdit: TEdit;
    Label9: TLabel;
    DateReqEdit: TEdit;
    BitBtn1: TBitBtn;
    TotRecLabel: TLabel;
    pgDetails: TPageControl;
    tsOrder: TTabSheet;
    tsInvoices: TTabSheet;
    LinesListView: TListView;
    dbgInvoices: TDBGrid;
    qryGetSInvoice: TFDQuery;
    dtsGetSInvoice: TDataSource;
    qryPurchChkStatus: TFDQuery;
    qryPurchUpStatus: TFDQuery;
    qryGetSOStatus: TFDQuery;
    qryUpSOStatus: TFDQuery;
    UpdSOlineSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ShortNameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SuppNameEditChange(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure FaxEditChange(Sender: TObject);
    procedure DateBitBtnClick(Sender: TObject);
    procedure SuppBitBtnClick(Sender: TObject);
    procedure LoadList(iTempOrd: Integer);
    Procedure AddListItem(sTempPart, sTempPartDescr: String; iTempStore: Integer;
           sTempStoreDescr, sTempGRN: String;
           iTempPFJ, iTempPOL, ITempQtyOrd, iTempQtyRec, iTempPartPack: Integer;
           dTempExpect, dTempActual: TDateTime; fTempPrice, fTempDiscount, fTempCost, fQtyInvd: Real; sNotes: string; bLineIsSample: boolean) ;
    procedure AddRecBitBtnClick(Sender: TObject);
    procedure AddRecs(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure WorkFileWrite(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StoreDBLookupComboBoxClick(Sender: TObject);
    procedure ClearListView(Sender: TObject);
    procedure UpdateLines(Sender: TObject);
    procedure DeleteLines(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LinesListViewClick(Sender: TObject);
    procedure CalcValue(Sender: TObject);
    procedure StoreFromDBLookupComboBoxClick(Sender: TObject);
    function CheckStores(Sender: TObject): ByteBool;
    function DiscAllowed(TempSupp: integer; TempPart: string) :bytebool;
    procedure DescrEditChange(Sender: TObject);
    procedure AddPOLineClick(Sender: TObject);
    procedure ChangePOLineClick(Sender: TObject);
    procedure DeletePOLineClick(Sender: TObject);
    procedure RecommendPOLineClick(Sender: TObject);
    procedure strgrdExtChgDetsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure ppmnExChrgsGridPopup(Sender: TObject);
    procedure AddExChrgClick(Sender: TObject);
    procedure ShowExtChgGrid(Sender: TObject);
    procedure ChangeExChrgClick(Sender: TObject);
    procedure DeleteExChrgClick(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgInvoicesDblClick(Sender: TObject);
 private
    { Private declarations }
    FExtraCharges: TObjectList;
    sItemDescr: String ;
    slDelLines: TStringList ;
    iIntSelCode: Integer ;
    FSelectedChargeIndex: Integer;
    bNotesFlash: ByteBool;
    FPONumber: integer;
    function OKtoAddLineToSO(soNum: integer): boolean;
    procedure CallExtChgMaintScreen(sTempFuncMode: Char);
    function GetExtraCharges(index: integer): TExtraCharge;
    procedure SetExtraCharges(index: integer; const Value: TExtraCharge);
    procedure SetSelectedChargeIndex(const Value: Integer);
    function SaveExtraCharges(PONum: integer): boolean;
    function LoadExtraCharges(PONum: integer): boolean;
    procedure AddSOLine(POLine: TPOLine);
    procedure SetPONumber(const Value: integer);
    procedure DisplayOperatorName(tempcode: integer);
    procedure UpdateStatus(tmpCode: integer);
    procedure UpdateSalesOrderStatus(tmpCode: integer);
  public
    { Public declarations }
    sFuncMode: Char ;
    sFuncDescr, headStatus: String ;
    iCode, iSupplCode, iSupplBranch, iTransType: Integer ;
    bStore_Ord: ByteBool ;
    procedure DeletePONarrative(narrative: integer);
    property ExtraCharges[index: integer]:TExtraCharge read GetExtraCharges write SetExtraCharges;
    property PONumber: integer read FPONumber write SetPONumber;
    property SelectedChargeIndex: Integer read FSelectedChargeIndex write SetSelectedChargeIndex;
  end;

var
  STMntPOrdFrm: TSTMntPOrdFrm;

implementation

uses
  System.UITypes,
  STStockDM, STPODataMod, DateSelV5, PBLUSupp, ccsCommon, pbMainMenu,
  pbDatabase, STMntPOrdAdd, STMntPOrdQty, STMaintPOExtChg, PBDBMemo,
  PBImages, PBMaintSuppInvoice;

{$R *.DFM}

procedure TSTMntPOrdFrm.FormActivate(Sender: TObject);
Var
iTempCount, iTempPos: Integer ;
begin
GetStoresSQL.Close ;
GetStoresSQL.Open ;
If bStore_Ord then
   begin
   GetReqdSQL.SQL := GetReqdSOSQL.SQL ;
   GetStoresFromSQL.Close ;
   GetStoresFromSQL.Open ;
   StoreFromGroupBox.Visible := True ;
   SuppGroupBox.Visible := False ;
   LinesListView.Columns[3].Caption := 'Pack' ;
   end
else
   begin
   GetReqdSQL.SQL := GetReqdPOSQL.SQL ;
   StoreFromGroupBox.Visible := False ;
   SuppGroupBox.Visible := True ;
   LinesListView.Columns[3].Caption := 'Pack' ;
   end;
{The SQL  parameter feed-in won't work under access so the SQL is copied} ;
{from the relevant query and the XUCX/XWSX text is substituted for the parameter} ;
For iTempCount := 0 to GetReqdSQL.SQL.Count - 1 do
    begin
    iTempPos := Pos('XUCX', GetReqdSQL.SQL[iTempCount]) ;
    If iTempPos > 0 then
       GetReqdSQL.SQL[iTempCount] := Copy(GetReqdSQL.SQL[iTempCount],1,iTempPos -1) +
                                                  IntToStr(iIntSelCode) +
                                              Copy(GetReqdSQL.SQL[iTempCount],iTempPos + 4, 9999) ;
    end;
slDelLines.Clear ;
Case iTransType of
   1 :          begin
                sItemDescr := 'recommended ' + sFuncDescr + ' order' ;
                end;
   2 :          begin
                sItemDescr := sFuncDescr + ' order' ;
                end;
   3 :          begin
                sItemDescr := sFuncDescr + ' goods received note' ;
                end;
   end;
{Setup titles} ;
If sFuncMode = 'A' then
   Caption := 'Add a new ' + sItemDescr ;
If sFuncMode = 'C' then
   Caption := 'Change a ' + sItemDescr ;
If sFuncMode = 'D' then
   Caption := 'Delete a ' + sItemDescr ;
If sFuncMode = 'V' then
  Caption := 'View a '+ sItemDescr;
If iTransType = 3 then
   Caption := 'Enter Goods Received Note Details' ;
If sFuncMode = 'A' then
   begin
   {Empty details} ;
    SuppNameEdit.Text := '';
    DescrEdit.Text := '';
    RequestedByEdit.Text := '';
    iSupplCode := 0 ;
    iSupplBranch := 0 ;
    OrdNoEdit.Text := '<New>' ;
    DateEdit.Text := DateToStr(Date) ;
    DateReqEdit.Text := DateToStr(Date+1) ;
    LinesListView.Items.Clear ;
    StoreDBLookupComboBox.KeyValue := 0;
    StoreFromDBLookupComboBox.KeyValue := STStockDataMod.GetDefaultStore(Self) ;
   end
else
   begin
   With qryGetPO do
        begin
        close;
        parambyname('Purch_Ord').asinteger := PONumber;
        open;

        iCode := FieldByName('Purch_Ord').AsInteger ;
        If bStore_Ord then
           begin
           StoreFromDBLookupComboBox.KeyValue := FieldByName('Part_Store_From').AsInteger ;
           iSupplCode := 0 ;
           iSupplBranch := 0 ;
           SuppNameEdit.Text := '' ;
           end
        else
           begin
           headStatus := FieldByName('Purch_ord_status').asString;
           iSupplCode := FieldByName('Supplier').AsInteger ;
           iSupplBranch := FieldByName('Branch_No').AsInteger ;
           lblSuppOrderType.Caption :=  FieldByName('Supp_Order_Type').AsString ;
           SuppNameEdit.Text := FieldByName('From_Name').AsString;
           StoreFromDBLookupComboBox.KeyValue := 0 ;
           lblSalesOrder.caption := inttostr(fieldbyname('Sales_Order').asinteger);
           with pnlSalesDetails do
            begin
              top := pnlStoreDetails.top;
              left := pnlStoreDetails.left;
              visible := (fieldbyname('Sales_Order').asinteger <> 0);
            end;
           pnlStoreDetails.visible := (fieldbyname('Sales_Order').asinteger = 0);

           end;

        OrdNoEdit.Text := FieldByName('PO_Ref').AsString;
        DescrEdit.Text := FieldByName('Purch_Ord_Descr').AsString;
        RequestedByEdit.Text := FieldByName('Requested_By').AsString;
        DateEdit.Text := DateToStr(FieldByName('Purch_Ord_Date').AsDateTime) ;
        DateReqEdit.Text := DateToStr(FieldByName('Date_Required').AsDateTime) ;
        StoreDBLookupComboBox.KeyValue := FieldByName('Part_Store').AsString;
        LoadList(iCode);
        if fieldByName('Narrative').asInteger <> 0 then
          PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').asInteger);
        DisplayOperatorName(fieldByName('Operator').asInteger);

        //Get the Supplier invoice details
        with qryGetSInvoice do
          begin
            close;
            parambyname('Purch_Ord').asinteger := iCode;
            open;
          end;
       end;
   end;
  {Enable or disable the buttons} ;
  DetsGrpBox.Enabled := (sFuncMode <> 'D') ;
  ppmnPOLines.AutoPopup := (sFuncMode <> 'V');
  ppmnExChrgsGrid.AutoPopup := ((sFuncMode <> 'V') and (headStatus < 'U'));
  DelLabel.Visible := (sFuncMode = 'D') ;
  DateBitBtn.Visible := headStatus < 'K';
  SuppBitBtn.Visible := headStatus < 'K';
  DescrEdit.ReadOnly := headStatus >= 'U';
  RequestedByEdit.ReadOnly := headStatus >= 'U';
  StoreDBLookupComboBox.enabled := headStatus < 'K';

  //load extra charges from database
  LoadExtraCharges(iCode);
  CheckNotes(Self);
  CheckOK(Self) ;
  ShowExtChgGrid(Self)

end;

procedure TSTMntPOrdFrm.DisplayOperatorName(tempcode: integer);
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      if fieldbyname('Operator_Name').asstring <> '' then
        stsbrDetails.panels[0].text := 'Created By: '+ fieldbyname('Operator_Name').asstring
      else
        stsbrDetails.panels[0].text := '';
    end;
end;

procedure TSTMntPOrdFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
OKBitBtn.Enabled := (DateEdit.Text <> '') and
                    (StoreDBLookupComboBox.KeyValue <> 0) and
                    (((SuppNameEdit.Text <> '') and (bStore_Ord = False)) or
                          ((StoreFromDBLookupComboBox.KeyValue <> 0) and (bStore_Ord))) and
                    ((LinesListView.Items.Count > 0) or (sFuncMode <> 'A')) and
                    (DescrEdit.Text <> '') ;
AddPOLine.Enabled := (DateEdit.Text <> '') and
                    (StoreDBLookupComboBox.KeyValue <> 0) and
                    (((SuppNameEdit.Text <> '') and (bStore_Ord = False)) or
                          ((StoreFromDBLookupComboBox.KeyValue <> 0) and (bStore_Ord))) and
                    (sFuncMode <> 'D');
ChangePOLine.Enabled := (LinesListView.SelCount > 0) and
                    (sFuncMode <> 'D');
DeletePOLine.Enabled := (LinesListView.SelCount > 0)  and
                    (sFuncMode <> 'D') ;
RecommendPOLine.Enabled := ppmnPOLines.Items[0].Enabled ;
CalcValue(Self) ;
end;

procedure TSTMntPOrdFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TSTMntPOrdFrm.ShortNameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.OKBitBtnClick(Sender: TObject);
Var
iTempNewCode: Integer ;
begin
If sFuncMode = 'A' then
   begin
   {Add a new code} ;
   {Add the rep narrative} ;
   {Get Next code} ;
   With GetLastSQL do
        begin
        Close ;
        Open ;
        First ;
        iTempNewCode := FieldByName('Last_Code').AsInteger + 1 ;
        Close ;
        end;
   PBDBMemoFrm.UpdMemoData(Self);
   With AddSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iTempNewCode ;
        Parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
        If bStore_Ord then
           begin
           ParamByName('Supplier').Clear ;
           ParamByName('Branch_No').Clear;
           ParambyName('Supp_Order_type').clear;
           ParamByName('Part_Store_From').AsInteger := StoreFromDBLookupComboBox.KeyValue;;
           end
        else
           begin
           ParamByName('Supplier').AsInteger := iSupplCode;
           ParamByName('Branch_No').AsInteger := iSupplBranch;
           if lblSuppOrderType.Caption = '' then
             ParamByName('Supp_Order_Type').clear
           else
             ParamByName('Supp_Order_Type').AsString := lblSuppOrderType.Caption;
           ParamByName('Part_Store_From').Clear;
           end;
        If (iTransType = 1) then
           begin
           ParamByName('Purch_Ord_Status').AsString := 'R' ;
           ParamByName('Purch_Ord_No').Clear ;
           ParamByName('Purch_Ord_Rec_Ref').AsString := STPODM.GetNextPORef(True,bStore_Ord) ;
           end;
        If (iTransType = 2) then
           begin
           ParamByName('Purch_Ord_Status').AsString := 'C' ;
           ParamByName('Purch_Ord_Rec_Ref').Clear ;
           ParamByName('Purch_Ord_No').AsString := STPODM.GetNextPORef(False,bStore_Ord) ;
           end;
        ParamByName('Purch_Ord_Date').AsDateTime := StrToDate(DateEdit.Text);
        ParamByName('Date_Required').AsDateTime := StrToDate(DateReqEdit.Text);
        ParamByName('Part_Store').AsInteger := StoreDBLookupComboBox.KeyValue;
        ParamByName('Purch_Ord_Descr').AsString := DescrEdit.Text;
        ParamByName('Requested_By').AsString := RequestedByEdit.Text;
        if PBDBMemoFrm.iNarr = 0 then
          ParamByName('Narrative').Clear
        else
          ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;

        ExecSQL ;
        end;
   iCode := iTempNewCode ;
   UpdateLines(Self);
   SaveExtraCharges(iTempNewCode);
   end;
If (sFuncMode = 'C') or (sFuncMode = 'V') then
   begin
   {Update an existing code} ;
   PBDBMemoFrm.UpdMemoData(Self);
   With UpdSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iCode ;
        If bStore_Ord then
           begin
           ParamByName('Supplier').Clear ;
           ParamByName('Branch_No').Clear ;
           ParambyName('Supp_Order_type').clear;
           ParamByName('Part_Store_From').AsInteger := StoreFromDBLookupComboBox.KeyValue;;
           end
        else
           begin
           ParamByName('Supplier').AsInteger := iSupplCode;
           ParamByName('Branch_No').AsInteger := iSupplBranch;
           if lblSuppOrderType.Caption = '' then
             ParamByName('Supp_Order_Type').clear
           else
             ParamByName('Supp_Order_Type').AsString := lblSuppOrderType.Caption;
           ParamByName('Part_Store_From').Clear;
           end;
        ParamByName('Purch_Ord_Date').AsDateTime := StrToDate(DateEdit.Text);
        ParamByName('Date_Required').AsDateTime := StrToDate(DateReqEdit.Text);
        ParamByName('Part_Store').AsInteger := StoreDBLookupComboBox.KeyValue;
        ParamByName('Purch_Ord_Descr').AsString := DescrEdit.Text;
        ParamByName('Requested_By').AsString := RequestedByEdit.Text;
        if PBDBMemoFrm.iNarr = 0 then
          ParamByName('Narrative').Clear
        else
          ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
        ExecSQL ;
        end;
   UpdateLines(Self) ;
   STPODM.DeleteExtraChargeRecords(iCode);
   SaveExtraCharges(iCode);
   end;
If sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo, mbYes],0) <> mrYes then
    begin
      Close ;
      Exit ;
    end;
   STPODM.DeleteExtraChargeRecords(iCode);
   if PBDBMemoFrm.iNarr <> 0 then
             DeletePONarrative(PBDBMemoFrm.iNarr);
    With DelLinesSQL do
    begin
      Close ;
      ParamByName('Purch_Ord').AsInteger := iCode ;
      ExecSQL ;
    end;
    With DelSQL do
    begin
      Close ;
      ParamByName('Purch_Ord').AsInteger := iCode ;
      ExecSQL ;
    end;
    try
      UpdateSalesOrderStatus(strtoint(lblSalesOrder.caption));
    except
    end;
  end;
If sFuncMode <> 'D' then
   UpdateStatus(iCode);
end;

procedure TSTMntPOrdFrm.UpdateSalesOrderStatus(tmpCode: integer);
var
  iStatus, iNewStatus: integer;
begin
  with qryGetSOStatus do
    begin
      close;
      parambyname('Sales_order').asinteger := tmpCode;
      open;

      iStatus := fieldbyname('Sales_order_Head_Status').asinteger;
    end;

  {If order hasn't been allocated etc then set the order back to the Order Created status}
  if iStatus <= 30 then
    begin
      with qryUpSOStatus do
        begin
          close;
          parambyname('Sales_Order').asinteger := tmpCode;
          execsql;
        end;
    end;

end;

procedure TSTMntPOrdFrm.UpdateStatus(tmpCode: integer);
var
  iInvoiced, iOrdered, iReceived: integer;
  sStatus: string;
begin
  with qryPurchChkStatus do
  begin
    close;
    ParamByName('Purch_Ord').Asinteger := tmpCode;
    open;
    iInvoiced := fieldbyname('Qty_Invoiced').asinteger;
    iReceived := fieldbyname('Qty_Received').asinteger;
    iOrdered := fieldbyname('Qty_Ordered').asinteger;
    sStatus := fieldbyname('Purch_Ord_status').asstring;
  end;

  with qryPurchUpStatus do
  begin
    close;
    ParamByName('Purch_Ord').Asinteger := tmpCode;
    if iInvoiced > 0 then
      begin
        if iInvoiced >= iReceived then
          Parambyname('Purch_Ord_Status').asstring := 'W'  {Fully invoiced}
        else
          Parambyname('Purch_Ord_Status').asstring := 'U'  {Part Invoiced}
      end
    else
    if iReceived > 0 then
      begin
        if iReceived >= iOrdered then
          Parambyname('Purch_Ord_Status').asstring := 'N'  {Fully received}
        else
          Parambyname('Purch_Ord_Status').asstring := 'K'  {Part received}
      end
    else
      Parambyname('Purch_Ord_Status').asstring := sStatus;  {Existing Status}
    execsql;
  end;
end;

procedure TSTMntPOrdFrm.NameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.SuppNameEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMntPOrdFrm.PhoneEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMntPOrdFrm.FaxEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMntPOrdFrm.DateBitBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.SuppBitBtnClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_LookUp := True ;
    PBLUSuppFrm.bAllow_Upd := true ;
    PBLUSuppFrm.bSel_Branch := True ;
    PBLUSuppFrm.ShowModal;
    If PBLUSuppFrm.Selected then
       begin
       iSupplCode := PBLUSuppFrm.SelCode ;
       iSupplBranch := PBLUSuppFrm.SelBranch ;
       SuppNameEdit.Text := PBLUSuppFrm.SelName + ', ' + PBLUSuppFrm.SelBranchName ;
       CheckOK(Self) ;
       end;
  finally
    PBLUSuppFrm.Free;
  end;
end;

procedure TSTMntPOrdFrm.LoadList(iTempOrd: Integer);
Var
iTempPack: Integer ;
iTempPFJs: Integer ;
sTempDescr: string;
begin
{Read the file for the selected item and put the results in the list view} ;
With GetLinesSQL do
     begin
     Close ;
     ParamByName('Purch_Ord').AsInteger := ITempOrd ;
     Open ;
     First ;
     While EOF = False do
           begin
           {Used to always force a store order packsize to 1. Now uses the size from the order line.} ;
           {if bStore_Ord then
              iTempPack := 1
           else }
              iTempPack := FieldByName('Purch_Pack_Quantity').AsInteger ;
           if Fieldbyname('Line_is_Sample').asboolean then
              sTempDescr := FieldByName('Part_Description').AsString + ' (SAMPLE)'
           else
              sTempDescr := FieldByName('Part_Description').AsString;
           iTempPFJs := 0 ;
           AddListItem(FieldByName('Part').AsString,
                           sTempDescr,
                           StoreDBLookupComboBox.KeyValue,
                           '',
                           FieldByName('GRN_No').AsString,
                           iTempPFJs,
                           FieldByName('Purch_Ord_Line_No').AsInteger,
                           FieldByName('Quantity_Ordered').AsInteger ,
                           FieldByName('Quantity_Received').AsInteger,
                           iTempPack,
                           FieldByName('Date_Deliv_Expected').AsDateTime,
                           FieldByName('Date_Deliv_Actual').AsDateTime,
                           FieldByName('Purchase_Price').AsFloat,
                           FieldByName('Discount').AsFloat,
                           FieldByName('Cost_price').AsFloat,
                           FieldByName('Qty_Invoiced').AsFloat,
                           FieldByName('Line_Notes').asstring,
                           Fieldbyname('Line_is_Sample').asboolean) ;
           Next ;
           end;
     end;
end;

Procedure TSTMntPOrdFrm.AddListItem(sTempPart, sTempPartDescr: String; iTempStore: Integer;
           sTempStoreDescr, sTempGRN: String;
           iTempPFJ, iTempPOL, iTempQtyOrd, iTempQtyRec, iTempPartPack: Integer;
           dTempExpect, dTempActual: TDateTime; fTempPrice, fTempDiscount, fTempCost, fQtyInvd: Real; sNotes: string; bLineIsSample: boolean) ;
Var
TempLI: TListItem;
TempPOL: TPOLine ;
iTempPFJs: Integer ;
begin
{Add a line into the list view} ;
iTempPFJs := 0;
TempLI := LinesListView.Items.Add ;
TempLI.Caption := sTempPart ;
TempLI.Subitems.Add(sTempPartDescr) ;
TempLI.Subitems.Add(ShowInPacks(iTempQtyOrd,iTempPartPack)) ;
TempLI.Subitems.Add(IntToStr(iTempPartPack)) ;
TempLI.Subitems.Add(CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(fTempPrice))) ;
TempLI.Subitems.Add(ShowInPacks(iTempQtyRec,iTempPartPack)) ;
{iTempPFJs := Trunc(Length(sTempPFJ)/10)} ;
If iTempPFJs = 0 then
   TempLI.Subitems.Add(CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr((iTempQtyOrd*fTempprice)/iTempPartPack)))
else
   TempLI.Subitems.Add(IntToStr(iTempPFJs)) ;
TempPOL := TPOLine.Create(sTempPart, iTempStore, sTempGRN, iTempPFJ, iTempPOL,
          iTempQtyOrd, iTempQtyRec, iTempPartPack, dTempExpect, dTempActual, fTempPrice,
          fTempDiscount, fTempCost, fQtyInvd, sTempPartDescr, sNotes, bLineIsSample) ;
TempLI.Data := TempPOL ;
end;

Constructor TPOLine.Create(const Part: String; Store: Integer; GRN: String;
  AllocPFJ: Integer; POL, QtyOrd, QtyRec, PartPack: Integer;
  Expect, Actual: TDateTime; Price, Discount, Cost, qtyInvd: Real;
  Description, Notes: string; LineIsSample: boolean) ;
begin
PLPart := Part ;
PLStore := Store ;
PLGRN := GRN ;
PLAllocPFJ := AllocPFJ ;
PLPOL := POL ;
PLQtyOrd := QtyOrd;
PLQtyRec := QtyRec ;
PLPartPack := PartPack ;
PLExpect := Expect;
PLActual := Actual;
PLPrice := Price;
PLDiscount := Discount;
PLCost := Cost;
self.QtyInvd := qtyInvd;
FDescription := Description;
FNotes := Notes;
FLineIsSample := LineIsSample;
end;

procedure TPOLine.SetPart(const Value: String) ;
begin
PLPart := Value ;
end;

procedure TPOLine.SetStore(const Value: integer) ;
begin
PLStore := Value ;
end;

procedure TPOLine.SetGRN(const Value: String) ;
begin
PLGRN := Value ;
end;

procedure TPOLine.SetAllocPFJ(const Value: Integer) ;
begin
PLAllocPFJ := Value ;
end;

procedure TPOLine.SetPOL(const Value: integer) ;
begin
PLPOL := Value ;
end;

procedure TPOLine.SetQtyOrd(const Value: integer) ;
begin
PLQtyOrd := Value ;
end;

procedure TPOLine.SetQtyRec(const Value: integer) ;
begin
PLQtyRec := Value ;
end;

procedure TPOLine.SetPartPack(const Value: integer) ;
begin
PLPartPack := Value ;
end;

procedure TPOLine.SetExpect(const Value: TDateTime) ;
begin
PLExpect := Value ;
end;

procedure TPOLine.SetActual(const Value: TDateTime) ;
begin
PLActual := Value ;
end;

procedure TPOLine.SetPrice(const Value: Real) ;
begin
PLPrice := Value ;
end;

procedure TSTMntPOrdFrm.AddRecBitBtnClick(Sender: TObject);
begin
AddRecs(self) ;
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.AddRecs(Sender: TObject);
Var
iTempQty, iTempQty2, iTempOrdQty, iTempPack, iOrdPercPack: Integer ;
sTempDescr: string;
begin
{The iOrdPercPack is the percentage of a pack that must be required for the system to round} ;
{up to the next pack} ;
  With dmBroker.qryCompany do
     begin
     Close ;
     Open ;
     First ;
     If bStore_Ord then
        iOrdPercPack := FieldByName('Store_Ord_Perc_Pack').AsInteger
     else
        iOrdPercPack := FieldByName('Purch_Ord_Perc_Pack').AsInteger ;
     end;
If iOrdPercPack < 1 then
   iOrdPercPack := 1;
WorkFileWrite(Self) ;
{Work out the requirements for a particular supplier and add them in} ;
With GetReqdSQL do
     begin
     Close ;
     ParamByName('Part_Store').AsInteger := StoreDBLookupComboBox.KeyValue ;
     If bStore_Ord then
        ParamByName('Part_Store_From').AsInteger := StoreFromDBLookupComboBox.KeyValue
     else
        begin
        ParamByName('Supplier').AsInteger := iSupplCode ;
        ParamByName('Branch_No').AsInteger := iSupplBranch ;
        end;
     Open ;
     {Add the recommendations into the grid} ;
     {Take account of any already in the grid} ;
     First ;
     While eof = False do
           begin
           {For a store order, the packsize used to be 1. Now uses the entered one} ;
           {if bStore_Ord then
              iTempPack := 1
           else } ;
              iTempPack := FieldByName('Purch_Pack_Quantity').AsInteger ;
           iTempQty := FieldByName('Free_Stock').AsInteger + FieldByName('Qty_On_Order').AsInteger -
                                                           FieldByName('Minimum_Stock').AsInteger ;
           If iTempQty < 0 then
              begin
              iTempQty2 := 0 - (FieldByName('Free_Stock').AsInteger + FieldByName('Qty_On_Order').AsInteger -
                                                           FieldByName('Maximum_Stock').AsInteger) ;
              iTempOrdQty := Trunc(((iTempQty2)) +
                                (((100 - iOrdPercPack) / 100.00){ - 0.000001})) ;
           if Fieldbyname('Line_is_Sample').asboolean then
              sTempDescr := FieldByName('Part_Description').AsString + ' (SAMPLE)'
           else
              sTempDescr := FieldByName('Part_Description').AsString;

              AddListItem(FieldByName('Part').AsString,
                           sTempDescr,
                           FieldByName('Part_Store').AsInteger,
                           FieldByName('Part_Store_Name').AsString,
                           '',
                           0,
                           0,
                           iTempOrdQty,
                           0,
                           iTempPack,
                           Date,
                           0,
                           (FieldByName('Part_Purchase_Price').AsFloat/FieldByName('Purch_Pack_Quantity').AsInteger) * iTempPack,
                           0,0,0,FieldbyName('Line_Notes').asstring, fieldbyname('Line_Is_Sample').asboolean) ;
             end;              
           Next ;
           end;
     end;
end;

procedure TSTMntPOrdFrm.AddBitBtnClick(Sender: TObject);
Var
iTempCount: Integer ;
begin
WorkFileWrite(Self) ;
{Add a part to the list} ;
STMntPOrdAddFrm := TSTMntPOrdAddFrm.Create(Self) ;
Try
   STMntPOrdAddFrm.iStore_Type := StoresDataSource.DataSet.FieldByName('Part_Store_Type').AsInteger ;
   STMntPOrdAddFrm.bStore_Ord := bStore_Ord ;
   STMntPOrdAddFrm.iTransType := iTransType ;
   STMntPOrdAddFrm.iIntSelCode := iIntSelCode ;
   STMntPOrdAddFrm.iStore := StoreDBLookupComboBox.KeyValue ;
   STMntPOrdAddFrm.sStoreName := StoreDBLookupComboBox.Text ;
   STMntPOrdAddFrm.iAllocPFJ := 0 ;
   If bStore_Ord then
      begin
      STMntPOrdAddFrm.iSuppl := 0 ;
      STMntPOrdAddFrm.iSupplBranch := 0 ;
      STMntPOrdAddFrm.sSuppDescr := '' ;
      STMntPOrdAddFrm.iStoreFrom := StoreFromDBLookupComboBox.KeyValue ;
      STMntPOrdAddFrm.sStoreFromName := StoresFromDataSource.DataSet.FieldByName('Part_Store_Name').AsString ;
      STMntPOrdAddFrm.iStoreTypeFrom := StoresFromDataSource.DataSet.FieldByName('Part_Store_Type').AsInteger ;
      end
   else
      begin
      STMntPOrdAddFrm.iSuppl := iSupplCode;
      STMntPOrdAddFrm.iSupplBranch := iSupplBranch;
      STMntPOrdAddFrm.sSuppDescr := SuppNameEdit.Text;
      STMntPOrdAddFrm.iStoreFrom := 0 ;
      STMntPOrdAddFrm.sStoreFromName := '' ;
      end;
   STMntPOrdAddFrm.sSuppDescr := SuppNameEdit.Text;
   STMntPOrdAddFrm.ShowModal ;
   If STMntPOrdAddFrm.bOK then
      begin
      {Add the details into the list} ;
      with STMntPOrdAddFrm.PartsDBGrid.DataSource.DataSet do
      for iTempCount := 0 to STMntPOrdAddFrm.PartsDBGrid.SelectedRows.Count - 1 do
          begin
          GotoBookmark(TBookmark(STMntPOrdAddFrm.PartsDBGrid.SelectedRows.Items[iTempCount]));
              AddListItem(FieldByName('Part').AsString,
                           FieldByName('Part_Description').AsString,
                           StoreDBLookupComboBox.KeyValue,
                           '',
                           '',
                           STMntPOrdAddFrm.iAllocPFJ,
                           0,
                           STMntPOrdAddFrm.iSelQty,
                           0,
                           FieldByName('Purch_Pack_Quantity').AsInteger,
                           Date,
                           0,
                           STMntPOrdAddFrm.fCost,
                           STMntPordAddFrm.fDiscount,
                           STMntPOrdAddFrm.fOrigCost, 0,'', false) ;
              end;
          end;
Finally
   STMntPOrdAddFrm.Free ;
   end;
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.DelBitBtnClick(Sender: TObject);
Var
iTempCount: Integer ;
TempLine: TPOLine ;
bTempQtyWarn: ByteBool ;
begin
bTempQtyWarn := False ;
{Delete a part} ;
for iTempCount := (LinesListView.Items.Count - 1) downto 0 do
    begin
    TempLine := LinesListView.Items[iTempCount].Data ;
    If LinesListView.Items[iTempCount].Selected then
       begin
       {This line selected for delete} ;
       If (TempLine.PLQtyRec > 0) then
          begin
          If bTempQtyWarn = False then
             begin
             MessageDlg('You can''t delete lines with received goods', mtError, [mbOK] ,0) ;
             bTempQtyWarn := True ;
             end;
          end
       else
          begin
          slDelLines.Add(IntToStr(TempLine.PLPOL))  ;
          LinesListView.Items.Delete(iTempCount) ;
          TempLine.Free ;
          end;
       end;
    end;
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.WorkFileWrite(Sender: TObject);
Var
iTempCount: Integer ;
begin
{Write details of the list to the workfile} ;
STStockDataMod.DelIntSelCode(iIntSelCode,False);
For iTempCount := 0 to (LinesListView.Items.Count - 1) do
    begin
    With AddWorkSQL do
         begin
         ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
         ParamByName('Sel1').AsInteger := iTempCount+1 ;
         ParamByName('Text100').AsString := LinesListView.Items[iTempCount].Caption ;
         ExecSQL ;
         end;
    end;
end;

procedure TSTMntPOrdFrm.FormDestroy(Sender: TObject);
begin
  STStockDataMod.DelIntSelCode(iIntSelCode, True) ;
  ClearListView(Self) ;
  slDelLines.Free ;
  STStockDataMod.Free ;
  STPODM.Free;
  PBDBMemoFrm.Free
end;


procedure TSTMntPOrdFrm.StoreDBLookupComboBoxClick(Sender: TObject);
begin
If CheckStores(Self) = True then
    StoreDBLookupComboBox.KeyValue := 0 ;
CheckOK(self) ;
end;

procedure TSTMntPOrdFrm.ClearListView(Sender: TObject);
Var
iTempCount: Integer ;
begin
{Clear out the listview, deleted items and more importantly, the associated objects} ;
For iTempCount := 0 to (LinesListView.Items.Count - 1) do
    TPOLine(LinesListView.Items[iTempCount].Data).Free ;
LinesListView.Items.Clear ;
slDelLines.Clear ;
end;

procedure TSTMntPOrdFrm.UpdateLines(Sender: TObject);
Var
iTempCount, iTempPOLineNo: Integer ;
TempPOLine: TPOLine;
addLinesToSO: string;
soNum: integer;
begin
  addLinesToSO := 'D/K';
  try
    soNum := qryGetPO.FieldByName('sales_order').asInteger;
  except
    soNum := 0;
  end;

  {Loop through the listview doing the ADDs and UPDATEs} ;
  For iTempCount := 0 to (LinesListView.Items.Count - 1) do
  begin
    TempPOLine := LinesListView.Items[iTempCount].Data ;
    If TempPOLine.POL = 0 then
    begin
      if sFuncMode = 'C' then
        begin
          //check status of Sales order if not despatch confirmed ok to proceed
          if not self.OKtoAddLineToSO(soNum) then
          begin
            MessageDlg('Cannot add any new lines to Sales Order: ' +
              IntToStr(soNum) + ', because despatch has been confirmed.',
              mtInformation, [mbOK], 0);
            addLinesToSO := 'No';
          end;

          //new line, must add to PO and SO
          if ((addLinesToSO = 'D/K') and (soNum <> 0)) then
          begin
            if MessageDlg('Do you want to add the new lines to Sales Order '+
              IntToStr(soNum) +'?',
              mtConfirmation, [mbYes,mbNo], 0) = mrYes then
            begin
              addLinesToSO := 'Yes';
            end
            else
            begin
              addLinesToSO := 'No';
            end;
          end;
        end;

      {Adding a new line to PO} ;
      With GetLastLineSQL do
      begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iCode ;
        Open ;
        First ;
        iTempPOLineNo := GetLastLineSQL.FieldByName('Last_Code').AsInteger + 1 ;
        With AddLineSQL do
        begin
          Close ;
          ParamByName('Purch_Ord').AsInteger := iCode ;
          ParamByName('Purch_Ord_Line_No').AsInteger := iTempPOLineNo ;
          ParamByName('Part').AsString := TempPOLine.PLPart ;
          ParamByName('GRN_No').AsString := TempPOLine.PLGRN ;
          ParamByName('Quantity_Ordered').AsInteger := TempPOLine.PLQtyOrd  ;
          ParamByName('Quantity_Received').AsInteger := TempPOLine.PLQtyRec ;
          ParamByName('Purch_Pack_Quantity').AsInteger := TempPOLine.PLPartPack;
          If TempPOLine.PLExpect <> 0 then
            ParamByName('Date_Deliv_Expected').AsDateTime := TempPOLine.PLExpect
          else
            ParamByName('Date_Deliv_Expected').Clear ;
          If TempPOLine.PLActual <> 0 then
            ParamByName('Date_Deliv_Actual').AsDateTime := TempPOLine.PLActual
          else
            ParamByName('Date_Deliv_Actual').Clear ;
          ParamByName('Purchase_Price').AsFloat := TempPOLine.PLPrice ;
          ParamByName('Discount').AsFloat := TempPoLine.PLDiscount;
          ParamByName('Cost_Price').AsFloat := TempPOLine.PLCost;
          ParamByName('Qty_invoiced').asFloat := 0;
          ParamByName('Line_Notes').asstring := TempPOLine.Notes;
          if TempPOLine.LineIsSample then
            ParambyName('Line_Is_Sample').asstring := 'Y'
          else
            ParambyName('Line_Is_Sample').asstring := 'N';
          ExecSQL ;
        end;
      end;
      //Adding new line to SO
      if addLinesToSO = 'Yes' then
      begin
        Self.AddSOLine(tempPOLine);
      end;
    end
    else
    begin
      With UpdLineSQL do
      begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iCode ;
        ParamByName('Purch_Ord_Line_No').AsInteger := TempPOLine.PLPOL  ;
        ParamByName('Part').AsString := TempPOLine.PLPart ;
        ParamByName('GRN_No').AsString := TempPOLine.PLGRN ;
        ParamByName('Quantity_Ordered').AsInteger := TempPOLine.PLQtyOrd  ;
        ParamByName('Quantity_Received').AsInteger := TempPOLine.PLQtyRec  ;
        ParamByName('Purch_Pack_Quantity').AsInteger := TempPOLine.PLPartPack;
        If TempPOLine.PLExpect <> 0 then
          ParamByName('Date_Deliv_Expected').AsDateTime := TempPOLine.PLExpect
        else
          ParamByName('Date_Deliv_Expected').Clear ;

        If TempPOLine.PLActual <> 0 then
          ParamByName('Date_Deliv_Actual').AsDateTime := TempPOLine.PLActual
        else
          ParamByName('Date_Deliv_Actual').Clear ;

        ParamByName('Purchase_Price').AsFloat := TempPOLine.PLPrice ;
        ParamByName('Discount').AsFloat := TempPoLine.PLDiscount;
        ParamByName('Cost_Price').AsFloat := TempPOLine.PLCost;
        ParamByName('Line_Notes').asstring := TempPOLine.Notes;
        if TempPOLine.LineIsSample then
          ParambyName('Line_Is_Sample').asstring := 'Y'
        else
          ParambyName('Line_Is_Sample').asstring := 'N';
        ExecSQL ;
      end;

      if soNum <> 0 then
        begin
          UpdSOLineSQL.close;
          UpdSOLineSQL.parambyname('Sales_Order').asinteger := soNum;
          UpdSOLineSQL.parambyname('Part').asstring := TempPOLine.PLPart;
          UpdSOLineSQL.parambyname('Part_Cost').asfloat := TempPOLine.PLPrice ;
          UpdSOLineSQL.parambyname('Purch_Pack_Quantity').asfloat := TempPOLine.PLPartPack;
          UpdSOLineSQL.Execsql;
        end;
    end;
  end;
  For iTempCount := 0 to slDelLines.Count - 1 do
  begin
    With DelLineSQL do
    begin
      Close ;
      ParamByName('Purch_Ord').AsInteger := iCode ;
      ParamByName('Purch_Ord_Line_No').AsInteger := StrToInt(slDelLines[iTempCount])  ;
      ExecSQL ;
    end;
  end;
end;

procedure TSTMntPOrdFrm.DeleteLines(Sender: TObject);
begin
{Delete the detail lines} ;
end;

procedure TSTMntPOrdFrm.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  slDelLines := TStringList.Create ;
  STStockDataMod := TSTStockDataMod.Create(Self) ;
  {Get the next int_sel_code to use} ;
  iIntSelCode := STStockDataMod.GetNextIntSelCode(Self);
  STPODM := TSTPODM.Create(self);
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);

  //create extra charges list
  FExtraCharges := TObjectList.Create;
  pgDetails.ActivePage := tsOrder;
end;

procedure TSTMntPOrdFrm.LinesListViewClick(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.CalcValue(Sender: TObject);
Var
  iTempCount: Integer ;
  fTempTot, fTempTotRec: Real ;
  TempPOLine: TPOLine ;
begin
  fTempTot := 0 ;
  fTempTotRec := 0;
  //count thru line values
  for iTempCount := 0 to (LinesListView.Items.Count - 1) do
  begin
    TempPOLine := LinesListView.Items[iTempCount].Data ;
    fTempTot := fTempTot + (TempPOLine.PLQtyOrd * TempPOLine.PLPrice / TempPOLine.PLPartPack) ;
    fTempTotRec := fTempTotRec + (TempPOLine.PLQtyRec * TempPOLine.PLPrice / TempPOLine.PLPartPack) ;
  end;

  //count thru extra charges
  for iTempCount := 0 to Pred(FExtraCharges.count) do
  begin
    fTempTot := fTempTot + ExtraCharges[iTempCount].Amount;
    fTempTotRec := fTempTotRec + ExtraCharges[iTempCount].Amount;
  end;
  TotLabel.Caption := 'Total Order Value:   ' + CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(fTempTot)) ;
  TotRecLabel.Caption := 'Total Receipt Value:   ' + CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(fTempTotRec)) ;
end;

function TSTMntPOrdFrm.CheckStores(Sender: TObject): ByteBool;
begin
Result := (bStore_Ord = True) and (StoreFromDBLookupComboBox.KeyValue = StoreDBLookupComboBox.KeyValue) and
          (StoreFromDBLookupComboBox.KeyValue <> 0) ;
If Result then
   MessageDlg('You can''t order from the same store', mtError, [mbOK],0) ;
end;

procedure TSTMntPOrdFrm.StoreFromDBLookupComboBoxClick(Sender: TObject);
begin
If CheckStores(Self) = True then
    StoreFromDBLookupComboBox.KeyValue := 0 ;
CheckOK(self) ;
end;

procedure TSTMntPOrdFrm.DescrEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

function TSTMntPOrdFrm.DiscAllowed(TempSupp: integer;
  TempPart: string): ByteBool;
begin
Result := False;
With GetDiscRateSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := TempSupp;
    ParamByName('Part').AsString := TempPart;
    Open;
    if not EOF then
        Result := True;
    end;
end;

procedure TPOLine.SetDiscount(const Value: Real);
begin
PLDiscount := Value ;
end;

procedure TPOLine.setCost(const Value: Real);
begin
PLCost := Value;
end;

procedure TSTMntPOrdFrm.AddPOLineClick(Sender: TObject);
Var
iTempCount: Integer ;
sTempDescr: string;
begin
WorkFileWrite(Self) ;
{Add a part to the list} ;
STMntPOrdAddFrm := TSTMntPOrdAddFrm.Create(Self) ;
Try
   STMntPOrdAddFrm.iStore_Type := StoresDataSource.DataSet.FieldByName('Part_Store_Type').AsInteger ;
   STMntPOrdAddFrm.bStore_Ord := bStore_Ord ;
   STMntPOrdAddFrm.iTransType := iTransType ;
   STMntPOrdAddFrm.iIntSelCode := iIntSelCode ;
   STMntPOrdAddFrm.iStore := StoreDBLookupComboBox.KeyValue ;
   STMntPOrdAddFrm.sStoreName := StoreDBLookupComboBox.Text ;
   STMntPOrdAddFrm.iAllocPFJ := 0 ;
   If bStore_Ord then
      begin
      STMntPOrdAddFrm.iSuppl := 0 ;
      STMntPOrdAddFrm.iSupplBranch := 0 ;
      STMntPOrdAddFrm.sSuppDescr := '' ;
      STMntPOrdAddFrm.iStoreFrom := StoreFromDBLookupComboBox.KeyValue ;
      STMntPOrdAddFrm.sStoreFromName := StoresFromDataSource.DataSet.FieldByName('Part_Store_Name').AsString ;
      STMntPOrdAddFrm.iStoreTypeFrom := StoresFromDataSource.DataSet.FieldByName('Part_Store_Type').AsInteger ;
      end
   else
      begin
      STMntPOrdAddFrm.iSuppl := iSupplCode;
      STMntPOrdAddFrm.iSupplBranch := iSupplBranch;
      STMntPOrdAddFrm.sSuppDescr := SuppNameEdit.Text;
      STMntPOrdAddFrm.iStoreFrom := 0 ;
      STMntPOrdAddFrm.sStoreFromName := '' ;
      end;
   STMntPOrdAddFrm.sSuppDescr := SuppNameEdit.Text;
   STMntPOrdAddFrm.ShowModal ;
   If STMntPOrdAddFrm.bOK then
      begin
      {Add the details into the list} ;
      with STMntPOrdAddFrm.PartsDBGrid.DataSource.DataSet do
      for iTempCount := 0 to STMntPOrdAddFrm.PartsDBGrid.SelectedRows.Count - 1 do
          begin
          GotoBookmark(TBookmark(STMntPOrdAddFrm.PartsDBGrid.SelectedRows.Items[iTempCount]));

           if STMntPOrdAddFrm.bIsSample then
              sTempDescr := FieldByName('Part_Description').AsString + ' (SAMPLE)'
           else
              sTempDescr := FieldByName('Part_Description').AsString;
              AddListItem(FieldByName('Part').AsString,
                           sTempDescr,
                           StoreDBLookupComboBox.KeyValue,
                           '',
                           '',
                           STMntPOrdAddFrm.iAllocPFJ,
                           0,
                           STMntPOrdAddFrm.iSelQty,
                           0,
                           FieldByName('Purch_Pack_Quantity').AsInteger,
                           Date,
                           0,
                           STMntPOrdAddFrm.fCost,
                           STMntPordAddFrm.fDiscount,
                           STMntPOrdAddFrm.fOrigCost, 0,STMntPOrdAddFrm.fNotes, STMntPOrdAddFrm.bIsSample) ;
              end;
          end;
Finally
   STMntPOrdAddFrm.Free ;
   end;
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.ChangePOLineClick(Sender: TObject);
Var
bAskedDets, bTempOK, bTempQtyWarn, bSample: ByteBool ;
iTempCount, iTempQty, iTempAllocPFJ, iTempPack: Integer ;
TempPOLine: TPOLine ;
TempLine: TListItem ;
TempCost, TempDisc: Real ;
iTempPFJ: Integer ;
sNotes: string;
begin
{Change a part} ;
bAskedDets := False ;
bTempQtyWarn := False ;
TempCost := 0.00;
iTempQty := 0;
iTempPack := 0;
iTempPFJ := 0;
for iTempCount := 0 to LinesListView.Items.Count - 1 do
    begin
    TempLine := LinesListView.Items[iTempCount] ;
    TempPOLine := TempLine.Data ;
    TempDisc := 0.00;
    If TempLine.Selected then
         begin
         If bAskedDets =  False then
              begin
              {Ask what order levels to apply to the new parts} ;
              STMntPOrdQtyFrm := TSTMntPOrdQtyFrm.Create(Self) ;
              Try
                  STMntPOrdQtyFrm.bStore_Ord := bStore_Ord ;
                  STMntPOrdQtyFrm.iTransType := iTransType ;
                  STMntPOrdQtyFrm.QtyEdit.Text := ShowInPacks(TempPOLine.QtyOrd,TempPOLine.PartPack) ;
                  STMntPOrdQtyFrm.fCost_Price := StrToFloatDef(TempLine.Subitems[3], 0, FormatSettings) ;
                  STMntPOrdQtyFrm.bAllow_Cost := LinesListView.SelCount = 1 ;
                  STMntPordQtyFrm.EdtDiscount.Text := FormatFloat('0.00',TempPOLine.Discount);
                  STMntPordQtyFrm.fOrig_Cost := TempPOLine.Cost;
                  STMntPOrdQtyFrm.sPart := TempPOLine.Part ;
                  STMntPOrdQtyFrm.sPartDesc := TempPOLine.Description;
                  STMntPOrdQtyFrm.chkbxSample.checked := TempPOLine.LineIsSample;
                  STMntPOrdQtyFrm.PackSizeEdit.Text := IntToStr(TempPOLine.PartPack) ;
                  STMntPOrdQtyFrm.iStore := StoreDBLookupComboBox.KeyValue ;
                  STMntPOrdQtyFrm.iPurchOrd := iCode ;
                  STMntPOrdQtyFrm.iPurchOrdLine := TempPOLine.POL ;
                  STMntPOrdQtyFrm.sStoreName := StoreDBLookupComboBox.Text ;
                  STMntPOrdQtyFrm.iAllocPFJ := TempPOLine.AllocPFJ ;
                  STMntPOrdQtyFrm.bAllow_Disc := DiscAllowed(iSupplCode,TempPOLine.Part);
                  STMntPOrdQtyFrm.bGoodsRecvd := (TempPOLine.PLQtyRec > 0);
                  STMntPOrdQtyFrm.bGoodsInvd := (TempPOLine.QtyInvd > 0);
                  STMntPOrdQtyFrm.memNotes.text := TempPOLine.Notes;
                  STMntPOrdQtyFrm.ShowModal ;
                  
                  bTempOK := STMntPOrdQtyFrm.bOK ;
                  iTempPack := StrToInt(STMntPOrdQtyFrm.PackSizeEdit.Text)  ;
                  iTempQty := InpToSing(STMntPOrdQtyFrm.QtyEdit.Text,iTempPack) ;
                  TempCost := STMntPOrdQtyFrm.fCost_Price ;
                  iTempPFJ := STMntPOrdQtyFrm.iAllocPFJ ;
                  TempDisc := StrToFloatDef(STMntPOrdQtyFrm.EdtDiscount.Text, 0, FormatSettings);
                  sNotes := STMntPOrdQtyFrm.memNotes.text;
                  bSample := STMntPOrdQtyFrm.chkbxSample.checked;
              Finally
                  STMntPOrdQtyFrm.Free ;
                  end;
              If bTempOK = False then
                  exit
              else
                  bAskedDets := True ;
              end;
         {Update the qty} ;
         If (iTempQty >= TempPOLine.PLQtyRec) then
            begin
            TempPOLine.PLQtyOrd := iTempQty ;
            if bSample and not TempPOLine.LineIsSample then
              TempPOLine.Description := TempPOLine.Description + ' (SAMPLE)'
            else
            if not bSample then
              TempPOLine.Description := stringreplace(TempPOLine.Description, '(SAMPLE)','',[rfReplaceall]);

            TempLine.Subitems[0] := TempPOLine.Description;

            TempLine.Subitems[1] := ShowInPacks(iTempQty,iTempPack) ;
            If (LinesListView.SelCount = 1) then
               begin
               TempPOLine.PLPrice := TempCost ;
               TempPOLine.PLDiscount := TempDisc;
               TempLine.Subitems[3] := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(TempCost)) ;
               TempPOLine.PLPartPack := iTempPack ;
               TempLine.Subitems[2] := IntToStr(iTempPack) ;
               TempPOLine.PLAllocPFJ := iTempPFJ ;
               TempPOLine.Notes := sNotes;
               TempPOLine.LineIsSample := bSample;
               iTempAllocPFJ := iTempPFJ ;
               If iTempAllocPFJ > 0 then
                  TempLine.Subitems[5] := IntToStr(iTempAllocPFJ)
               else
                  TempLine.Subitems[5] := (CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr((iTempQty*TempCost)/iTempPack))) ;
              end;
            end
         else
            begin
            If bTempQtyWarn = False then
               begin
               If (LinesListView.SelCount = 1) then
                     MessageDlg('You can''t change the ordered quantity to less than the received quantity',
                                     mtError, [mbOK],0)
               else
                     MessageDlg('You have attempted to change one or more of the ordered quantities to less ' +
                                     'than the received quantity. They have not been changed.',
                                     mtWarning, [mbOK],0) ;
               bTempQtyWarn := True ;
               end;
            end;
         end;
    end;
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.DeletePOLineClick(Sender: TObject);
Var
iTempCount: Integer ;
TempLine: TPOLine ;
bTempQtyWarn: ByteBool ;
begin
bTempQtyWarn := False ;
{Delete a part} ;
for iTempCount := (LinesListView.Items.Count - 1) downto 0 do
    begin
    TempLine := LinesListView.Items[iTempCount].Data ;
    If LinesListView.Items[iTempCount].Selected then
       begin
       {This line selected for delete} ;
(*       If (TempLine.PLQtyRec > 0) then
          begin
          If bTempQtyWarn = False then
             begin
             MessageDlg('You can''t delete lines with received goods', mtError, [mbOK] ,0) ;
             bTempQtyWarn := True ;
             end;
          end
       else
          begin
*)
          slDelLines.Add(IntToStr(TempLine.PLPOL))  ;
          LinesListView.Items.Delete(iTempCount) ;
          TempLine.Free ;
//          end;
       end;
    end;
CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.RecommendPOLineClick(Sender: TObject);
begin
AddRecs(self) ;
CheckOK(Self) ;
end;

function TSTMntPOrdFrm.GetExtraCharges(index: integer): TExtraCharge;
begin
  Result := FExtraCharges.Items[Index] as TExtraCharge;
end;

procedure TSTMntPOrdFrm.SetExtraCharges(index: integer;
  const Value: TExtraCharge);
begin
  FExtraCharges[index] := Value;
end;

procedure TSTMntPOrdFrm.SetSelectedChargeIndex(const Value: Integer);
begin
  FSelectedChargeIndex := Value;
end;

procedure TSTMntPOrdFrm.strgrdExtChgDetsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if FSelectedChargeIndex = ARow - 1 then Exit;
  FSelectedChargeIndex := ARow - 1;
end;

procedure TSTMntPOrdFrm.ppmnExChrgsGridPopup(Sender: TObject);
begin
  AddExChrg.enabled := LinesListView.Items.Count > 0;
  ChangeExChrg.enabled := (FExtraCharges.count <> 0);
  DeleteExChrg.enabled := (FExtraCharges.count <> 0);
end;

procedure TSTMntPOrdFrm.AddExChrgClick(Sender: TObject);
begin
 if LinesListView.Items.Count < 1 then
    Exit;
 CallExtChgMaintScreen(poAdd);
end;

procedure TSTMntPOrdFrm.CallExtChgMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  ExtraCharge: TExtraCharge;
begin
  if sTempFuncMode = poAdd then
  begin
    ExtraCharge := TExtraCharge.Create;
  end
  else
    ExtraCharge := ExtraCharges[strgrdExtChgDets.Row - 1];

  STMaintPOExtChgFrm := TSTMaintPOExtChgFrm.Create(Self);
  try
    STMaintPOExtChgFrm.FuncMode := sTempFuncMode;
    STMaintPOExtChgFrm.ExtraCharge := ExtraCharge;
    STmaintPOExtChgFrm.InvorOrd := 'O';
    STMaintPOExtChgFrm.ShowModal;
    bTempOK := STMaintPOExtChgFrm.bOK;
  finally
    STMaintPOExtChgFrm.Free;
  end;
  if bTempOK then
  begin
    if sTempFuncMode = poAdd then
      FExtraCharges.Add(ExtraCharge);

    if sTempFuncMode = poDelete then
    begin
      FExtraCharges.Delete(strgrdExtChgDets.Row - 1);
    end;

    ShowExtChgGrid(Self);
    CalcValue(self);
  end
  else
  //we're here cos the user clicked cancel on the maint Ex charge form
  //or because something went wrong, either way we don't want to change anything
  begin
    //if the function was add, we've got an extra charge hanging about so free it
    //if the function was change or delete the extra charge being handled was
    //one from the list so leave it alone.
    if sTempFuncMode = poAdd then
    begin
      ExtraCharge.Free;
    end;
  end;
end;

procedure TSTMntPOrdFrm.ShowExtChgGrid(Sender: TObject);
var
  TempCount,
    iNoOfExtChg: Integer;
begin
  iNoOfExtChg := 0;
  strgrdExtChgDets.Cells[0, 0] := 'Details';
  strgrdExtChgDets.Cells[1, 0] := 'Amount';
  strgrdExtChgDets.Cells[2, 0] := 'Vat Rate';
  strgrdExtChgDets.Cells[0, 1] := '';
  strgrdExtChgDets.Cells[1, 1] := '';
  strgrdExtChgDets.Cells[2, 1] := '';
  if (FExtraCharges.Count > 0) then
    for TempCount := 0 to Pred(FExtraCharges.Count) do
      with ExtraCharges[TempCount] do
      begin
        iNoOfExtChg := iNoOfExtChg + 1;
        strgrdExtChgDets.Cells[0, iNoOfExtChg] := Details;
        strgrdExtChgDets.Cells[1, iNoOfExtChg] := FormatMoney(Amount);
        strgrdExtChgDets.Cells[2, iNoofExtChg] := FloatToStr(STPODM.GetVatRate(VatCode));
      end;
  if iNoOfExtChg > 1 then
    strgrdExtChgDets.RowCount := iNoOfExtChg + 1
  else
    strgrdExtChgDets.RowCount := 2;
  if iNoOfExtChg > 0 then
  begin
    FSelectedChargeIndex := 0;
  end
  else
  begin
    FSelectedChargeIndex := -1;
  end;
end;

procedure TSTMntPOrdFrm.ChangeExChrgClick(Sender: TObject);
begin
  if SelectedChargeIndex = -1 then
    Exit;
  CallExtChgMaintScreen(poChange);
end;

procedure TSTMntPOrdFrm.DeleteExChrgClick(Sender: TObject);
begin
 if SelectedChargeIndex = -1 then
    Exit;
  CallExtChgMaintScreen(poDelete);
end;

function TSTMntPOrdFrm.SaveExtraCharges(PONum: integer): boolean;
var
  x: integer;
begin
  Result := True;
  for x := 0 to Pred(FExtraCharges.count) do
  begin
    ExtraCharges[x].SaveToDB(STPODM, PONum, x+1);
  end;
end;

function TSTMntPOrdFrm.LoadExtraCharges(PONum: integer): boolean;
var
  ExtraCharge: TExtraCharge;
begin
  Result := True;
  with STPODM.qryGetExChgs do
  begin
    Close;
    ParamByName('Purch_Ord').AsInteger := PONum;
    Open;
    while not EOF do
    begin
    ExtraCharge := TExtraCharge.Create;
      with ExtraCharge do
      begin
        Amount := FieldByName('Amount').AsFloat;
        VatCode := FieldByName('Vat_Code').AsInteger;
        Vat := Amount * STPODM.GetVatRate(VatCode);
        Details := FieldByName('Details').AsString;
        Nominal := FieldByName('Nominal').AsString;
      end;
      FExtraCharges.Add(ExtraCharge);
      Next;
    end;
  end;
end;

procedure TSTMntPOrdFrm.AddSOLine(POLine: TPOLine);
var
  SONum: integer;
  LineNO: integer;
  vatCode: integer;
  sellPrice: Currency;
begin
  SONum := qryGetPO.FieldByName('sales_order').asInteger;
  //get next available line no
  with self.qrySelHighestSOLine do
  begin
    Close;
    ParamByName('sales_order').asInteger := SONum;
    open;

    LineNo := FieldByName('line_no').asInteger + 1;
    close;
  end;

  with self.qrySelPart do
  begin
    close;
    ParamByName('Part').asString := POLine.PLPart;
    open;

    vatCode := FieldByName('vat_code').asInteger;
    sellPrice := FieldByName('part_cost_cat').asCurrency;
    close;
  end;

  with self.qryInsSOLine do
  begin
    paramByName('Sales_Order').asInteger :=SONum;
    paramByName('Sales_Order_line_no').asInteger := LineNo;
    paramByName('Part').asString := POLine.PLPart;
    paramByName('Part_Cost').asCurrency := POLine.PLCost;
    paramByName('Purch_Pack_Quantity').asInteger := POLine.PLPartPack;
    paramByName('Part_Sales_Price').asCurrency := sellPrice;
    paramByName('Sell_Pack_Quantity').asInteger := POLine.PLPartPack;
    paramByName('Quantity_Ordered').asInteger := POLine.PLQtyOrd;
    paramByName('Quantity_Allocated').asInteger := 0;
    paramByName('Quantity_Delivered').asInteger := 0;
    paramByName('Contract').clear;
    paramByName('Contract_Line_no').clear;
    paramByName('Sales_order_Line_Status').asInteger := 10;
    paramByName('Quantity_Invoiced').asInteger := 0;
    paramByName('Line_Complete').clear;
    paramByName('vat_code').asInteger := vatCode;
    paramByName('Discount_Type').asString := '';
    paramByName('Discount_value').asCurrency := 0.00;
    paramByName('Replacement_For_Line').clear;
    paramByName('Original_Sell_Price').asCurrency := POLine.PLPrice;

    ExecSQL;
  end;
end;

function TSTMntPOrdFrm.OKtoAddLineToSO(soNum: integer): boolean;
begin
  self.qrySelSO.close;
  self.qrySelSO.paramByName('sales_order').asInteger := soNum;
  self.qrySelSO.open;

  if (self.qrySelSO.FieldByName('sales_order_head_status').asInteger < 150)then
    result := true
  else
    result := false;

  self.qrySelSO.close;
end;

procedure TSTMntPOrdFrm.NotesBitBtnClick(Sender: TObject);
begin
  if sFuncMode = 'V' then
    PBDBMemoFrm.bAllow_Upd := false
  else 
    PBDBMemoFrm.bAllow_Upd := true; 

  PBDBMemoFrm.ShowModal;
  checknotes(Self);
end;

procedure TSTMntPOrdFrm.CheckNotes(Sender: TObject);
begin
  if PBDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TSTMntPOrdFrm.DeletePONarrative(narrative: integer);
begin
  qryDelPONarrative.ParamByName('narrative').asInteger := narrative;
  qryDelPONarrative.ExecSQL;
end;

procedure TSTMntPOrdFrm.FlashTimerTimer(Sender: TObject);
begin
 if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph :=PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPOLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TPOLine.SetQtyInvd(const Value: real);
begin
  FQtyInvd := Value;
end;

procedure TSTMntPOrdFrm.SetPONumber(const Value: integer);
begin
  FPONumber := Value;
end;

procedure TPOLine.SetNotes(const Value: string);
begin
  FNotes := Value;
end;

procedure TSTMntPOrdFrm.BitBtn1Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateReqEdit.Text);
    DateSelV5Form.ShowModal;
    DateReqEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  CheckOK(Self) ;
end;

procedure TSTMntPOrdFrm.dbgInvoicesDblClick(Sender: TObject);
var
  Frm: TPBMaintSuppInvoicefrm;
  aInvoice: TSuppInvoice;
  dmSuppInvoice: TdmSupplierInvoice;
  invNo: integer;
begin
  if dbgInvoices.datasource.dataset.fieldbyname('Supplier_Invoice_no').asstring = '' then
    exit;
  dmSuppInvoice := TdmSupplierInvoice.Create(self);
  aInvoice := TSuppInvoice.Create(dmSuppInvoice);
  try
    invNo := dbgInvoices.datasource.dataset.fieldbyname('Supplier_Invoice').asinteger;
    aInvoice.DbKey := invNo;
    aInvoice.LoadFromDB;
    Frm := TPBMaintSuppInvoicefrm.Create(Self);
    try
      Frm.Mode := piView;
      Frm.SupplierInvoice := aInvoice;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    aInvoice.Free;
    dmSuppInvoice.free;
  end;
end;

procedure TPOLine.SetLineIsSample(const Value: boolean);
begin
  FLineIsSample := Value;
end;

end.
