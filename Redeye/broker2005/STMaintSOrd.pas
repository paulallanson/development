unit STMaintSOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, DBCtrls, DB, ExtCtrls, ComCtrls, Grids, STSOObjects, Menus, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintSOrdFrm = class(TForm)
    FlashTimer: TTimer;
    pnlTop: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    OrdNoLabel: TLabel;
    Label2: TLabel;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    DtReqEdit: TEdit;
    DtReqBitBtn: TBitBtn;
    OfficeComboBox: TDBLookupComboBox;
    pnlFooter: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlAddCharges: TPanel;
    pMnuMaint: TPopupMenu;
    LineAddBitBtn: TMenuItem;
    LineDelBitBtn: TMenuItem;
    LineChgBitBtn: TMenuItem;
    pMnuView: TPopupMenu;
    SelectBitBtn: TMenuItem;
    Label10: TLabel;
    memoTotal: TMemo;
    NotesBitBtn: TBitBtn;
    pnlDetails: TPanel;
    pnlLines: TPanel;
    LineDetsStringGrid: TStringGrid;
    pnlHead: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    CustNameEdit: TEdit;
    CustBitBtn: TBitBtn;
    ContactEdit: TEdit;
    SelContactBtn: TButton;
    CstCntrEdit: TEdit;
    CstCntrBitBtn: TBitBtn;
    OrdEdit: TEdit;
    dbLkpCmbRep: TDBLookupComboBox;
    DeliveryBitBtn: TBitBtn;
    DeliveryEdit: TEdit;
    dblkpReplType: TDBLookupComboBox;
    pnlWarehouse: TPanel;
    Label14: TLabel;
    StoreComboBox: TDBLookupComboBox;
    pnlSupplier: TPanel;
    Label4: TLabel;
    Label15: TLabel;
    edtSupplier: TEdit;
    btnSupplierLU: TBitBtn;
    dblkpOrdertype: TDBLookupComboBox;
    Label16: TLabel;
    ExtChgDetsStringGrid: TStringGrid;
    ExtChgMenu: TPopupMenu;
    ChrgAddBitBtn: TMenuItem;
    ChrgChgBitBtn: TMenuItem;
    ChrgDelBitBtn: TMenuItem;
    Label17: TLabel;
    Panel1: TPanel;
    RdBtnToCust: TRadioButton;
    RDBtnToAdHoc: TRadioButton;
    N1: TMenuItem;
    LineSerialNos: TMenuItem;
    btnAddService: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ShortNameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure CustNameEditChange(Sender: TObject);
    procedure DateBitBtnClick(Sender: TObject);
    procedure CustBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DeleteLines(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
    procedure DtReqBitBtnClick(Sender: TObject);
    procedure DetsGrpBoxClick(Sender: TObject);
    procedure ShowLineGrid(Sender: TObject);
    procedure ShowQtyLineGrid(Sender: TObject);
    procedure ShowExtChgGrid(Sender: TObject);
    procedure LineAddBitBtnClick(Sender: TObject);
    procedure LineChgBitBtnClick(Sender: TObject);
    procedure LineDelBitBtnClick(Sender: TObject);
    procedure SetupDetails(Sender: TObject);
    procedure LineDetsStringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure LineDetsStringGridDrawCell(Sender: TObject; vCol, vRow: Integer; Rect: TRect; State: TGridDrawState);
    procedure SelContactBtnClick(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure CstCntrBitBtnClick(Sender: TObject);
    procedure LineDetsStringGridDblClick(Sender: TObject);
    procedure OrdEditChange(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure DtReqEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure LineDetsStringGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RepBitBtnClick(Sender: TObject);
    procedure edtDeliveryNotesChange(Sender: TObject);
    procedure DeliveryBitBtnClick(Sender: TObject);
    procedure dbLkpCmbRepClick(Sender: TObject);
    procedure btnSupplierLUClick(Sender: TObject);
    procedure dblkpReplTypeClick(Sender: TObject);
    procedure dblkpOrdertypeClick(Sender: TObject);
    procedure StoreComboBoxClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure ChrgAddBitBtnClick(Sender: TObject);
    procedure ChrgChgBitBtnClick(Sender: TObject);
    procedure ChrgDelBitBtnClick(Sender: TObject);
    procedure ExtChgDetsStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure ExtChgMenuPopup(Sender: TObject);
    procedure RdBtnToCustClick(Sender: TObject);
    procedure RDBtnToAdHocClick(Sender: TObject);
    procedure ExtChgDetsStringGridDrawCell(Sender: TObject; VCol,
      VRow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ExtChgDetsStringGridDblClick(Sender: TObject);
    procedure pMnuMaintPopup(Sender: TObject);
    procedure LineSerialNosClick(Sender: TObject);
    procedure btnAddServiceClick(Sender: TObject);
  private
    function GetSelectedCharge: TExtraCharge;
  private
    { Private declarations }
    bNotesFlash: ByteBool;
    sBranch: string;
    sDelCustName: string;
    sDelBranchName: string;
    FActiveDone: Boolean;
    FFuncMode: Char;
    FSelectedLineIndex: Integer;
    bDisableLineNameChangeEvent : Boolean;
    Disc_Val : real;
    disc_type : string;
    FSelectedRepPercIndex: Integer;
    FSelectedChargeIndex: Integer;
    function GetSelectedLine: TOrderLine;
    function getselectedRepPerc: TRepLine;
    function OKAdding: Boolean;
    function OKChanging: Boolean;
    function OKDeleting: Boolean;
    function HasCostCentres: Boolean;
    function GetPartDescription(sPart: string; irow: integer): boolean;
    function GetSellPrice(TempPart: string): real;
    function GetOrderValue: real;
    procedure DeleteSerialNos(const inx: integer);
    procedure SaveSerialNos(const inx: integer);
    procedure UpdateSOLines;
    procedure UpdateRepPerc;
    procedure CreateExtraChargeLine;
    procedure UpdateExtraCharges;
    procedure RecalcTotals;
    procedure CallExtChgMaintScreen(sTempFuncMode: Char);
    procedure DefContact(iTempCust, iTempBranch: Integer);
    procedure CallLineMaintScreen(sTempFuncMode: Char);
    procedure CallServiceMaintScreen(sTempFuncMode: Char);
    procedure HandleSOLine(Query: TFDQuery; const inx: Integer);
    procedure HandleSORepPerc(Query: TFDQuery; const inx: integer);
    procedure GetSupplierOrderTypes;
    procedure DisplaySourceDetails;
    procedure SetDeliverTo;
    property SelectedCharge: TExtraCharge read GetSelectedCharge;
  public
    { Public declarations }
    bOK: Boolean;
    iCst_Cntr_Count : integer;
    fTempOrdTot: Real ;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property SelectedLine: TOrderLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedRepPerc: TRepLine read GetSelectedRepPerc;
    property SelectedRepPercIndex: Integer read FSelectedRepPercIndex;
    property SelectedChargeIndex: Integer read FSelectedChargeIndex;
    end;

var
  STMaintSOrdFrm: TSTMaintSOrdFrm;

implementation

uses Variants, STSODataMod, DateSelV5, CSDBMemo, CSLUCust;

var
  CSDBSOMemoFrm: TCSDBMemoFrm;
  
{$R *.DFM}

procedure TSTMaintSOrdFrm.FormActivate(Sender: TObject);
begin
  if not FActiveDone then
  try
    ShowLineGrid(Self);
    CheckOK(Self);
  finally
    FActiveDone := True;
  end;
  if STSalesOrdDM.IsCustomerOnStop(SalesOrder.Customer) then
    MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);

end;

procedure TSTMaintSOrdFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
if ffuncMode = soDelete then
  OKBitBtn.Enabled := true
else
    OKBitBtn.Enabled := (Trim(CustNameEdit.Text) <> '') and
    (Trim(DateEdit.Text) <> '') and
    (Trim(DTReqEdit.Text) <> '') and
    (Trim(OrdEdit.Text) <> '') and
    (Trim(ContactEdit.text) <> '') and
    (Trim(DeliveryEdit.text) <> '') and
    (dbLkpCmbRep.keyvalue <> 0) and
    (((SalesOrder.ReplenishSource = 2) and (storecombobox.keyvalue <> Null)) or
     ((SalesOrder.ReplenishSource = 1) and (DbLkpOrderType.Keyvalue <> Null) and (Trim(edtSupplier.Text) <> ''))) and
    (SalesOrder.OrderLines.Count > 0);
end;

procedure TSTMaintSOrdFrm.CancelBitBtnClick(Sender: TObject);
begin
(*  if FuncMode <> 'S' then
    begin
    if MessageDlg('Do you want to cancel any changes?', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo then
    begin
      Exit;
    end;
    end;
*)
  Close ;
end;

procedure TSTMaintSOrdFrm.ShortNameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMaintSOrdFrm.OKBitBtnClick(Sender: TObject);
  begin
  if (FSelectedLineIndex = -1) and (FFuncMode = soChange) then
  begin
    if MessageDlg('There are now no lines on this order. ' +
      'Do you want to delete it ?',
      mtConfirmation, [mbOK, mbAbort], 0) = mrOK then
      FFuncMode := soDelete
    else
      Exit;
  end;

  if STSalesOrdDM.IsCustomerOnStop(SalesOrder.Customer) then
    begin
      if MessageDlg('This Customer is currently ON STOP, do you want to save these order details?', mtWarning,
        [mbYes, mbNo], 0) = mrNo then
          exit;
    end;
(*  else if MessageDlg('Do you want to save these order details?', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
      Exit;
*)
  Screen.Cursor := crHourGlass;
  try
    if (FFuncMode = soAdd) then
      bOK := OKAdding
    else
      if (FFuncMode = soChange) or (FFuncMode = soChangeHead) then
          bOK := OKChanging
      else
        if FFuncMode = soDelete then
          bOK := OKDeleting
        else
          bOK := True;
  finally
    Screen.Cursor := crDefault;
  end;
  if bOK then
    Close;
end;

procedure TSTMaintSOrdFrm.NameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMaintSOrdFrm.CustNameEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMaintSOrdFrm.DateBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
    SalesOrder.datepoint := DateSelV5Form.MonthCalendar1.Date;
  finally
    DateSelV5Form.Free;
  end;
CheckOK(Self) ;
end;

procedure TSTMaintSOrdFrm.CustBitBtnClick(Sender: TObject);
var
i: integer;
begin
  CSLUCustFrm := TCSLUCustFrm.Create(Self);
  try
    CSLUCustFrm.bIs_LookUp := True ;
    CSLUCustFrm.bAllow_Upd := True ;
    CSLUCustFrm.bSel_Branch := True ;
    CSLUCustFrm.SelCode := SalesOrder.Customer;
    CSLUCustFrm.SelBranch := SalesOrder.BranchNo;
    CSLUCustFrm.ShowModal;
    If CSLUCustFrm.Selected then
      begin
        LineDetsStringGrid.enabled := True;
        if (SalesOrder.Customer <> CSLUCustFrm.SelCode)
          or (SalesOrder.BranchNo <> CSLUCustFrm.SelBranch) then
        begin
          SalesOrder.SOHeadStatus := soCreated;
          for i := 0 to pred(SalesOrder.OrderLines.Count) do
            SalesOrder.OrderLines[i].SOLineStatus := slNotYetSent;

          defContact(CSLUCustFrm.selcode, CSLUCustFrm.SelBranch);
        end;
        SalesOrder.Customer := CSLUCustFrm.SelCode;
        CustNameEdit.Text := CSLUCustFrm.SelName + '/' + CSLUCustFrm.SelBranchName;
        sBranch := CSLUCustFrm.SelBranchName;
        SalesOrder.BranchNo := CSLUCustFrm.SelBranch;
        if deliveryEdit.text = '' then
          begin
            SalesOrder.deliveryCustomer := SalesOrder.Customer;
            SalesOrder.DeliveryBranch := SalesOrder.Branchno;
            DeliveryEdit.text :=  STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                                + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
          end;

        if hascostcentres then
          CstCntrBitBtn.click;
        if STSalesOrdDM.IsCustomerOnStop(SalesOrder.Customer) then
          MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);
      end;

       {Display Rep}
       dbLkpCmbRep.keyvalue := STSalesOrdDM.DefaultRep(CSLUCustFrm.SelCode,CSLUCustFrm.SelBranch);
       dbLkpCmbRepClick(Self);
  finally
    CSLUCustFrm.Free;
  end;
CheckOK(Self) ;
end;

procedure TSTMaintSOrdFrm.FormDestroy(Sender: TObject);
begin
STSalesOrdDM.Free ;
SalesOrder.Free;
end;


procedure TSTMaintSOrdFrm.DeleteLines(Sender: TObject);
begin
{Delete the detail lines} ;
end;

procedure TSTMaintSOrdFrm.FormCreate(Sender: TObject);
begin
  {Activate the invoice method SQL}
  CSDBSOMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBSOMemoFrm.bAllow_Upd := True;
  STSalesOrdDM := TStSalesOrdDM.Create(Self);
  with StSalesOrdDM do
  begin
    OperatorSQL.Close;
    OperatorSQL.Open;
    DefWHouseSQL.Close;
    DefWHouseSQL.Open;
    StoreSQL.Close;
    StoreSQL.Open;
    RepSourceSQL.Close;
    RepSourceSQL.Open;

    dblkprepltype.keyvalue := 2; {Replenish from Warehouse}
    GetPartSQL.close;
    GetPartSQL.open;
    RepSQL.close;
    RepSQL.open;
    end;
  { Create objects we need }
  SalesOrder := TSalesOrder.Create(STSalesOrdDM);

  {Display Supplier selection as default}
  pnlSupplier.Visible := true;
  pnlSupplier.Top := pnlWarehouse.top;
  pnlSupplier.left := pnlWarehouse.left;
  pnlSupplier.bevelOuter := bvNone;
end;

procedure TSTMaintSOrdFrm.DescrEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMaintSOrdFrm.DtReqBitBtnClick(Sender: TObject);
begin
 DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DtReqEdit.Text);
    DateSelV5Form.ShowModal;
    DtReqEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
CheckOK(Self) ;
end;

function TSTMaintSOrdFrm.GetSelectedLine: TOrderLine;
begin
 if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := SalesOrder.OrderLines[FSelectedLineIndex];
end;

function TSTMaintSOrdFrm.OKAdding: Boolean;
begin
  Result := False;
  if SalesOrder.OrderLines.Count = 0 then
  begin
    MessageDlg('You must add some lines to the order first', mtError,
      [mbOK], 0);
    Exit;
  end;
  SalesOrder.SoNumber := STSalesOrdDM.GetNextSONumber;
  CSDBSOMemoFrm.UpdMemoData(Self);
  with STSalesOrdDM.AddSQL, SalesOrder do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := SONumber;
    if OfficeComboBox.KeyValue = null then
      ParamByName('Office_Contact').AsInteger := STMenuMainFrm.iOperator
    else
      ParamByName('Office_Contact').AsInteger := OfficeComboBox.KeyValue;
    ParamByName('Operator').AsInteger := STMenuMainFrm.iOperator;
    ParamByName('Date_Reqd').AsDateTime := StrToDate(DtReqEdit.Text);
    ParamByName('Date_Ordrd').AsDateTime := StrToDate(DateEdit.Text);
    ParamByName('Cust_Order_No').AsString := CustOrderNo;
    ParamByName('Customer').AsInteger := Customer;
    ParamByName('Branch_No').AsInteger := BranchNo;
    if CostCentre = '' then
      begin
        ParamByName('Cost_Centre').clear;
        ParamByName('Customer0').clear;
      end
    else
      begin
        ParamByName('Cost_Centre').Asstring := CostCentre;
        ParamByName('Customer0').AsInteger := Customer;
      end;

    if AdHocAddress = 0 then
      ParamByName('Ad_Hoc_Address').clear
    else
      ParamByName('Ad_Hoc_Address').AsInteger := AdHocAddress;

    ParamByName('Order_Type').AsString := 'S';
    ParamByName('Sales_Order_Head_Status').AsInteger := shCreated;
     if CSDBSOMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBSOMemoFrm.iNarr;
    ParamByName('Contact_No').AsInteger := CustomerContactNo;
    ParamByName('Delivery_Notes').Asstring := DeliveryNotes;
    ParamByName('Delivery_Customer').Asinteger := DeliveryCustomer;
    ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
    Parambyname('Replenish_source').asinteger := ReplenishSource;
    if ReplenishSource = 1 then   {Supplier}
      begin
        Parambyname('Supplier').asinteger := Supplier;
        Parambyname('Branch_no0').asinteger := BranchNo0;
        Parambyname('Supp_Order_type').asstring := trim(SupplierOrderType);
        parambyname('Part_Store').asinteger := PartStore;
      end
    else                          {Warehouse}
      begin
        parambyname('Part_Store').asinteger := PartStore;
        Parambyname('Supplier').clear;
        Parambyname('Branch_no0').clear;
        Parambyname('Supp_Order_type').clear;
      end;
    ExecSQL;
  end;
  UpdateSOLines;
  UpdateRepPerc;
  CreateExtraChargeLine;
  MessageDlg('The sales order number is : ' +
    IntToStr(SalesOrder.SONumber), mtInformation, [mbOK], 0);
  Result := True;
end;

function TSTMaintSOrdFrm.OKChanging: Boolean;
begin
Result := True;
    CSDBSOMemoFrm.UpdMemoData(Self);
   try
    {Update an existing code}
    with StSalesOrdDM.UpdSQL, SalesOrder do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;
       if OfficeComboBox.KeyValue = null then
        ParamByName('Contact_No').AsInteger := STMenuMainFrm.iOperator
      else
        ParamByName('Contact_No').AsInteger := OfficeComboBox.KeyValue;
      ParamByName('Part_Store').AsInteger := StoreComboBox.KeyValue;
      ParamByName('Operator').AsInteger := STMenuMainFrm.iOperator;
      ParamByName('Date_Ordrd').AsDateTime := StrToDate(DateEdit.Text);
      ParamByName('Date_Reqd').AsDateTime := StrToDate(DtReqEdit.Text);
      ParamByName('Cust_order_No').AsString := CustOrderNo;
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No').AsInteger := BranchNo;
      if CostCentre = '' then
        begin
          ParamByName('Cost_Centre').clear;
          ParamByName('Customer0').clear;
        end
      else
        begin
          ParamByName('Cost_Centre').Asstring := CostCentre;
          ParamByName('Customer0').AsInteger := Customer;
        end;

//      ParamByName('Sales_Order_Head_Status').AsInteger := CalcSOHeadStatus(Self);
      ParamByName('Sales_Order_Head_Status').AsInteger := SOHeadStatus;
      if AdHocAddress = 0 then
        ParamByName('Ad_Hoc_Address').clear
      else
        ParamByName('Ad_Hoc_Address').AsInteger := AdHocAddress;
      if CSDBSOMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBSOMemoFrm.iNarr;
      ParamByName('Delivery_Notes').Asstring := DeliveryNotes;
      ParamByName('Delivery_Customer').Asinteger := DeliveryCustomer;
      ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
      Parambyname('Replenish_source').asinteger := ReplenishSource;
      if ReplenishSource = 1 then   {Supplier}
        begin
          Parambyname('Supplier').asinteger := Supplier;
          Parambyname('Branch_no0').asinteger := BranchNo0;
          Parambyname('Supp_Order_type').asstring := trim(SupplierOrderType);
          parambyname('Part_Store').asinteger := PartStore;
        end
      else                          {Warehouse}
        begin
          parambyname('Part_Store').asinteger := PartStore;
          Parambyname('Supplier').clear;
          Parambyname('Branch_no0').clear;
          Parambyname('Supp_Order_type').clear;
        end;
      ExecSQL;
    end;
    if FFuncMode = soChangeHead then
      begin
        UpdateRepPerc;
        UpdateExtraCharges;
        exit;
      end;
    UpdateSOLines;
    UpdateRepPerc;
    UpdateExtraCharges;
    except on E: Exception do
    begin
      Result := False;
      MessageDlg('Error during update: ' + E.Message, mtError, [mbAbort], 0);
    end;
  end;
end;

function TSTMaintSOrdFrm.OKDeleting: Boolean;
begin
 Result := False;
  if MessageDlg('Really delete these details ?', mtConfirmation,
    [mbNo, mbYes], 0) <> mrYes then
  begin
    Close;
    Exit;
  end;
  with StSalesOrdDM, SalesOrder do
  begin
    DeleteSOLines(SONumber);
    DeleteSalesOrder(SONumber);
    CSDBSOMemoFrm.DelMemoData(Self);
    UpdateExtraCharges;
  end;
  Result := True;
end;

procedure TSTMaintSOrdFrm.UpdateSOLines;
var
  icount: Integer;
begin {Update the sales order lines}
  for icount := 0 to Pred(SalesOrder.OrderLines.Count) do
  begin
    if SalesOrder.OrderLines[icount].ActnTkn = 'A' then
      begin
        HandleSOLine(STSalesOrdDM.AddSOLineSQL, icount);
      end
    else
    if SalesOrder.OrderLines[icount].ActnTkn = 'C' then
      begin
        HandleSOLine(STSalesOrdDM.UpdSOLineSQL, icount);
      end
    else
    if SalesOrder.OrderLines[icount].ActnTkn = 'D' then
      HandleSOLine(StSalesOrdDM.DelSOLineSQL, icount);
  end;
end;

procedure TSTMaintSOrdFrm.DetsGrpBoxClick(Sender: TObject);
begin
 if SalesOrder.SOHeadStatus > shCreated then
    MessageDlg('You can''t change the sales order header because some lines '
      + 'have been sent to the customer', mtError, [mbOK], 0);
end;

procedure TSTMaintSOrdFrm.ShowLineGrid(Sender: TObject);
var
  TempFrom, TempTo: string;
  TempCount: Integer;
  inx: Integer;
begin
  If (FuncMode = 'S') or (FuncMode = 'H') then
    begin
      ShowQtyLineGrid(Self);
      Exit;
    end;
  LineDetsStringGrid.ColWidths[7] := -1;
  for TempCount := 0 to LineDetsStringGrid.RowCount do
    begin
    LineDetsStringGrid.rows[TempCount].clear;
    end;
  LineDetsStringGrid.Cells[0, 0] := 'Line';
  LineDetsStringGrid.Cells[1, 0] := 'Part';
  LineDetsStringGrid.Cells[2, 0] := 'Description';
  LineDetsStringGrid.Cells[3, 0] := 'Pack Size';
  LineDetsStringGrid.Cells[4, 0] := 'Quantity';
  LineDetsStringGrid.Cells[5, 0] := 'Price';
  LineDetsStringGrid.Cells[6, 0] := 'Total';
  LineDetsStringGrid.Cells[0, 1] := '';
  LineDetsStringGrid.Cells[1, 1] := '';
  LineDetsStringGrid.Cells[2, 1] := '';
  LineDetsStringGrid.Cells[3, 1] := '';
  LineDetsStringGrid.Cells[4, 1] := '';
  LineDetsStringGrid.Cells[5, 1] := '';
  LineDetsStringGrid.Cells[6, 1] := '';
  TempFrom := '';
  TempTo := 'ZZZ';
  inx := 0;
  fTempOrdTot := 0;
{  if SalesOrder.OrderLines.Count = 0 then
    LineDetsStringGrid.enabled := False
  else
    LineDetsStringGrid.enabled := True;  }
  for TempCount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[TempCount] do
    begin
        with LineDetsStringGrid do
        begin
          if ActnTkn <> 'D' then
          begin
          Inc(inx);
          Cells[0, inx] := IntToStr(Line);
          Cells[1, inx] := Part;
          Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part);
          Cells[3, inx] := IntToStr(sellPackQuantity);
          //STSalesOrdDM.GetSellUnit(Part);
//          Cells[4, inx] := FormatQty(OrdQty);
          Cells[4, inx] := OrdQtyinPacks;
          Cells[5, inx] := FormatMoney(Sell_Price);
          Cells[6, inx] := FormatMoney((Ordqty / SellPackQuantity)*Sell_Price);
          Cells[7, inx] := 'C';
          fTempOrdTot := fTempOrdTot + ((Ordqty / SellPackQuantity)*Sell_Price);
      end;
    end;
  end;
  if inx > 0 then
    LineDetsStringGrid.RowCount := inx + 1
  else
    LineDetsStringGrid.RowCount := 2;
  LineChgBitBtn.Enabled := inx > 0;
  LineDelBitBtn.Enabled := inx > 0;
  SelectBitBtn.Enabled := inx > 0;

  if inx > 0 then
    begin
      FSelectedLineIndex := 0;
      LineDetsStringGrid.Cells[0, inx+1] := '';
      LineDetsStringGrid.Cells[1, inx+1] := '';
      LineDetsStringGrid.Cells[2, inx+1] := '';
      LineDetsStringGrid.Cells[3, inx+1] := '';
      LineDetsStringGrid.Cells[4, inx+1] := '';
      LineDetsStringGrid.Cells[5, inx+1] := '';
      LineDetsStringGrid.Cells[6, inx+1] := '';
      LineDetsStringGrid.Cells[7, inx+1] := '';
      end
    else
    FSelectedLineIndex := -1;
    ShowExtChgGrid(Self);
  memoTotal.text := CurrencyDisp(FloatToStr(fTempOrdTot+SalesOrder.ExtraCharges.Total)) ;
end;

procedure TSTMaintSOrdFrm.LineAddBitBtnClick(Sender: TObject);
begin
  { Is there any more room ? }
  if SalesOrder.OrderLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of lines already on this order', mtError,
      [mbAbort], 0)
  else
    begin
    CallLineMaintScreen(soAdd);
    LineDetsStringGrid.row := LineDetsStringGrid.rowcount - 1;
    end;
end;

procedure TSTMaintSOrdFrm.LineChgBitBtnClick(Sender: TObject);
begin
  if (SelectedLine.SOLineStatus >= slSalesInvoiceRaised) then
    MessageDlg('This line has been invoiced' +
      ', you cannot change it', mtError, [mbOK], 0)
  else
    CallLineMaintScreen(soChange);
end;

procedure TSTMaintSOrdFrm.LineDelBitBtnClick(Sender: TObject);
begin
 if (SelectedLine.SOLineStatus >= slSalesInvoiceRaised) then
    MessageDlg('This line has been invoiced' +
      ', you cannot delete it', mtError, [mbOK], 0)
  else
    CallLineMaintScreen(soDelete);
end;

procedure TSTMaintSOrdFrm.CallLineMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  if sTempFuncMode = soAdd then
  begin
    iOrder := SalesOrder.OrderLines.NextLineNumber;
    OrderLine := TOrderLine.Create;
    OrderLine.Line := iOrder;
    OrderLine.SOLineStatus := slNotYetSent;
    OrderLine.ActnTkn := 'A';
    end
  else
    OrderLine := SelectedLine.Clone;

  if OrderLine.PartClass = 'SERV' then
    begin
      STMaintSOrdLineServFrm := TSTMaintSOrdLineServFrm.Create(Self);
      try
        STMaintSOrdLineServFrm.FuncMode := sTempFuncMode;
        STMaintSOrdLineServFrm.SalesOrder := SalesOrder;
        STMaintSOrdLineServFrm.SONumber := SalesOrder.SONumber;
        STMaintSOrdLineServFrm.OrderLine := OrderLine;
        STMaintSOrdLineServFrm.ShowModal;
        bTempOK := STMaintSOrdLineServFrm.bOK;
      finally
        STMaintSOrdLineServFrm.Free;
      end;
    end
  else
    begin
      STMaintSOrdLineFrm := TSTMaintSOrdLineFrm.Create(Self);
      try
        STMaintSOrdLineFrm.FuncMode := sTempFuncMode;
        STMaintSOrdLineFrm.SalesOrder := SalesOrder;
        STMaintSOrdLineFrm.SONumber := SalesOrder.SONumber;
        STMaintSOrdLineFrm.OrderLine := OrderLine;
        STMaintSOrdLineFrm.Supplier := SalesOrder.Supplier;
        STMaintSOrdLineFrm.BranchNo := SalesOrder.BranchNo0;
        STMaintSOrdLineFrm.PartStore := SalesOrder.PartStore;
        STMaintSOrdLineFrm.ReplenishSource := SalesOrder.ReplenishSource;

        if SalesOrder.ReplenishSource = 1 then
          begin
            STMaintSOrdLineFrm.lblSource.Caption := 'Supplier: ';
            STMaintSOrdLineFrm.lblReplenishName.Caption := edtSupplier.text;
          end
        else
          begin
            STMaintSOrdLineFrm.lblSource.Caption := 'Warehouse: ';
            STMaintSOrdLineFrm.lblReplenishName.Caption := StoreComboBox.text;
          end;

        STMaintSOrdLineFrm.ShowModal;
        bTempOK := STMaintSOrdLineFrm.bOK;
      finally
        STMaintSOrdLineFrm.Free;
      end;
    end;
  if bTempOK then
  begin
    if sTempFuncMode = soAdd then
      SalesOrder.OrderLines.Add(OrderLine)
    else
      if sTempFuncMode = soChange then
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end
      else { Must be delete }
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end;
    ShowLineGrid(Self);
  end
  else
    OrderLine.Free;
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.CallServiceMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  if sTempFuncMode = soAdd then
  begin
    iOrder := SalesOrder.OrderLines.NextLineNumber;
    OrderLine := TOrderLine.Create;
    OrderLine.Line := iOrder;
    OrderLine.SOLineStatus := slNotYetSent;
    OrderLine.ActnTkn := 'A';
    end
  else
    OrderLine := SelectedLine.Clone;
  STMaintSOrdLineServFrm := TSTMaintSOrdLineServFrm.Create(Self);
  try
    STMaintSOrdLineServFrm.FuncMode := sTempFuncMode;
    STMaintSOrdLineServFrm.SalesOrder := SalesOrder;
    STMaintSOrdLineServFrm.SONumber := SalesOrder.SONumber;
    STMaintSOrdLineServFrm.OrderLine := OrderLine;
    STMaintSOrdLineServFrm.ShowModal;
    bTempOK := STMaintSOrdLineServFrm.bOK;
  finally
    STMaintSOrdLineServFrm.Free;
  end;
  if bTempOK then
  begin
    if sTempFuncMode = soAdd then
      SalesOrder.OrderLines.Add(OrderLine)
    else
      if sTempFuncMode = soChange then
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end
      else { Must be delete }
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end;
    ShowLineGrid(Self);
  end
  else
    OrderLine.Free;
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.LineDetsStringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
(*	if (Col = 1) or
     (Col = 4) then
    LineDetsStringGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    LineDetsStringGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing];

*)
  if FSelectedLineIndex = ARow - 1 then Exit;
  FSelectedLineIndex := ARow - 1;
end;

procedure TSTMaintSOrdFrm.LineDetsStringGridDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (vCol = 0) or (vCol = 1) or (vCol = 2) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;

end;

procedure TSTMaintSOrdFrm.SetupDetails(Sender: TObject);
var
  RepLine: TRepLine;
begin
  Repline := TRepline.create;
 if FFuncMode = soAdd then
    Caption := 'Add a new sales order'
  else
    if FFuncMode = soChange then
      Caption := 'Change a sales order'
    else
      if FFuncMode = soDelete then
        Caption := 'Delete a sales order'
      else
        if FFuncMode = soView then
          Caption := 'View sales order';
  {Setup the details for the form}
  if (FFuncMode = soAdd) then
  begin
    {Empty details}
    OrdNoLabel.Caption := '<New Order>';
    CustNameEdit.Text := '';
    OrdEdit.Text := '';
//    edtDeliveryNotes.Text := '';
    SalesOrder.Clear;
    DateEdit.Text := PBDateStr(date);
    DTReqEdit.Text := PBDateStr(date);
    ContactEdit.Text := '';
    CstCntrEdit.Text := '';
    edtSupplier.Text := '';
    SalesOrder.OfficeContact := STMenuMainFrm.iOperator;
    if SalesOrder.OfficeContact <> 0 then
      OfficeComboBox.KeyValue := SalesOrder.OfficeContact;
    SalesOrder.PartStore := stSalesOrdDM.DefWHouseSQL.fieldByName('Default_Warehouse').AsInteger;
    StoreComboBox.KeyValue := stSalesOrdDM.DefWHouseSQL.fieldByName('Default_Warehouse').AsInteger;
    SalesOrder.RepLines.Add(RepLine);
    SalesOrder.DatePoint := date;
    DisplaySourceDetails;
  end
  else
  begin
    if FFuncMode <> soAddToExisting then
    begin
      with dmLookupSord.SelectedSQL do
      begin
        if FFuncMode = soAddToExisting then
          FFuncMode := soChange;
        SalesOrder.SONumber := FieldByName('Sales_Order').AsInteger;
        SalesOrder.FuncMode := FFuncMode;
        STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
        STSalesOrdDM.LoadExtChgOrd(SalesOrder);
        DateEdit.Text := DateToStr(FieldByName('Date_Ordered').AsDateTime);
        DtReqEdit.Text := DateToStr(FieldByName('Date_Required').AsDateTime);
        OrdNoLabel.Caption := IntToStr(SalesOrder.SONumber);
        OrdEdit.Text := FieldByName('Cust_Order_No').AsString;
//        edtDeliveryNotes.Text := FieldByName('Delivery_Notes').AsString;
        CustNameEdit.Text := FieldByName('Cust_Name').AsString + '/' + FieldByName('Branch_Name').AsString;
        CstCntrEdit.Text := FieldByName('Cost_Centre').AsString;
        if SalesOrder.OfficeContact <> 0 then
          OfficeComboBox.KeyValue := SalesOrder.OfficeContact;
        CSDBSOMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
        ContactEdit.Text :=
          dmLookupSord.GetContactSQL.FieldByName('Contact_Name').AsString;
        if SalesOrder.PartStore <> Null then
          StoreComboBox.KeyValue := SalesOrder.PartStore;
        end;
        if SalesOrder.AdHocAddress = 0 then
          begin
            RdBtnToCust.Checked := True;
            DeliveryEdit.text := STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                            + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer, SalesOrder.DeliveryBranch);
          end
        else
          begin
            RdBtnToAdHoc.Checked := True;
            DeliveryEdit.Text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
          end;
        dbLkpCmbRep.keyvalue := salesOrder.RepLines[0].rep;
        dblkpReplType.keyvalue := SalesOrder.ReplenishSource;
        if SalesOrder.Supplier <> null then
          begin
            edtSupplier.text := STSalesOrdDM.GetSuppName(SalesOrder.Supplier)
                            + '/' + STSalesOrdDM.GetSuppBranchName(SalesOrder.Supplier, SalesOrder.BranchNo0);
            GetSupplierOrderTypes;
            dblkpOrderType.keyvalue := SalesOrder.SupplierOrderType;
          end;
        DisplaySourceDetails;
    end;
  end;
  {Enable or disable the buttons}
  if (FFuncMode <> soDelete) then
    OKBitBtn.Caption := 'Save'
  else
    OKBitBtn.Caption := 'Delete';
  checknotes(Self);
  CheckOK(Self);
  DateEdit.Enabled := ((SalesOrder.SOHeadStatus <= shCreated) or (FFuncMode = soAdd));
  DateBitBtn.Enabled := ((SalesOrder.SOHeadStatus <= shCreated) or (FFuncMode = soAdd));
  DtReqEdit.Enabled := ((SalesOrder.SOHeadStatus <= shCreated) or (FFuncMode = soAdd));
  DtReqBitBtn.Enabled := ((SalesOrder.SOHeadStatus <= shCreated) or (FFuncMode = soAdd));
  OfficeComboBox.Enabled := ((SalesOrder.SOHeadStatus <= shCreated) or (FFuncMode = soAdd));

  SelectBitBtn.Visible := (FFuncMode = soView);
//  tbshtDetails.Enabled := (FFuncMode <> soView);
//  tbshtNotes.Enabled := (FFuncMode <> soView);
//  pnlDetails.enabled := (FFuncMode <> soView);
//  pnlLines.enabled := (FFuncMode <> soView) and (FFuncMode <> soChangeHead);
//  pnlAddCharges.enabled := (FFuncMode <> soView) and (FFuncMode <> soChangeHead);
  OKBitBtn.Visible := (FFuncMode <> soView);
  if (ffuncmode = soView) or (ffuncmode = SOChangeHead) then
    begin
      lineaddBitBtn.Enabled := False;
      LineChgBitBtn.Enabled := False;
      LineDelBitBtn.Enabled := False;
(*      ChrgAddBitBtn.Enabled := False;
      ChrgChgBitBtn.Enabled := False;
      ChrgDelBitBtn.Enabled := False;
*)    end;
  bOK := False;
  bDisableLineNameChangeEvent := False;
end;

procedure TSTMaintSOrdFrm.HandleSOLine(Query: TFDQuery; const inx: Integer);
var
  i: Integer;
begin
  {Delete any Serial numbers attached to this sales order line}
  DeleteSerialNos(inx);

  with Query, SalesOrder.OrderLines[inx] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    if query.name = 'UpdSOLineSQL' then
    begin
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Part').AsString := Part;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
      ParamByName('Quantity_Ordered').AsInteger := OrdQty;
      ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Discount_Type').asString := Disc_Type;
      ParamByName('Discount_Value').asFloat := Disc_Val;
      ParamByName('Quantity_Delivered').Asinteger := DelQty;
      if MarkupType = '' then
        ParamByName('Markup_Type').clear
      else
        ParamByName('Markup_Type').asstring := MarkupType;
      ParamByName('Markup_Value').asfloat := MarkupValue;
    end ;
    if query.name= 'AddSOLineSQL' then
    begin
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Part').AsString := Part;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
      ParamByName('Quantity_Ordered').AsInteger := OrdQty;
      ParamByName('Quantity_Allocated').AsInteger := AllocQty;
      ParamByName('Quantity_Delivered').AsInteger := DelQty;
//    ParamByName('Quantity_Delivered').AsInteger := OrdQty;
      ParamByName('Contract').Clear;
      ParamByName('Contract_Line_No').Clear;
      ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
      ParamByName('Quantity_Invoiced').AsInteger := InvQty;
      ParamByName('Discount_Type').asString := Disc_Type;
      ParamByName('Discount_Value').asFloat := Disc_Val;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParambyName('Original_Sell_Price').asfloat := OriginalSellPrice;
      if MarkupType = '' then
        ParamByName('Markup_Type').clear
      else
        ParamByName('Markup_Type').asstring := MarkupType;
      ParamByName('Markup_Value').asfloat := MarkupValue;
    end;
    if query.name = 'DelSOLineSQL' then
    begin
     ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Line').AsInteger := Line;
    end;
    ExecSQL;
  end;

  {Add serial numbers if adding or updating a line}
  if (query.name = 'UpdSOLineSQL') or
     (query.name = 'AddSOLineSQL') then
    SaveSerialNos(inx);
end;

procedure TSTMaintSOrdFrm.DefContact(iTempCust, iTempBranch: Integer);
begin
  {Default the contact if there is ONLY 1 for the selected Customer}
  with STSalesOrdDM.GetCustContSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := iTempCust;
    ParamByName('Branch_no').AsInteger := iTempBranch;
    Open;
    if RecordCount = 1 then
    begin
    SalesOrder.CustomerContactNo := FieldByName('Contact_No').AsInteger;
      ContactEdit.Text := FieldByName('Name').AsString;
    end
    else
    begin
      SalesOrder.CustomerContactNo := 0;
      ContactEdit.Text := '';
    end;
  end;
end;

procedure TSTMaintSOrdFrm.SelContactBtnClick(Sender: TObject);
begin
  CSLUCContaFrm := TCSLUCContaFrm.Create(Self);
  try
    CSLUCContaFrm.bIs_Lookup := True;
    CSLUCContaFrm.bAllow_Upd := True;
    CSLUCContaFrm.SelCode := SalesOrder.CustomerContactNo;
    CSLUCContaFrm.iCust := SalesOrder.Customer;
    CSLUCContaFrm.iBranch := SalesOrder.BranchNo;
    CSLUCContaFrm.sCustName := CustNameEdit.Text;
    CSLUCContaFrm.sBranchName := sBranch;
    CSLUCContaFrm.ShowModal;
    if CSLUCContaFrm.bSelected then
    begin
      SalesOrder.CustomerContactNo := CSLUCContaFrm.SelCode;
      ContactEdit.Text := CSLUCContaFrm.SelName;
    end;
  finally
    CSLUCContaFrm.Free;
  end;
   if (hascostcentres) and (CstCntrEdit.Text = '') then
    begin
    MessageDlg('You must select a Cost Centre for this Customer', mtError, [mbOK], 0);
    OKBitbtn.Enabled := False;
    CstCntrBitBtn.click;
    end;
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.SelectBitBtnClick(Sender: TObject);
begin
 CallLineMaintScreen(soView);
end;

procedure TSTMaintSOrdFrm.CstCntrBitBtnClick(Sender: TObject);
begin
  CSLUCustCstCntrFrm := TCSLUCustCstCntrFrm.Create(Self);
  try
    CSLUCustCstCntrFrm.bIs_Lookup := True;
    CSLUCustCstCntrFrm.bAllow_Upd := True;
    CSLUCustCstCntrFrm.sSelCode := SalesOrder.CostCentre;
    CSLUCustCstCntrFrm.iCust := SalesOrder.Customer;
    CSLUCustCstCntrFrm.sCustName := CustNameEdit.Text;
    CSLUCustCstCntrFrm.ShowModal;
    if CSLUCustCstCntrFrm.Selected then
    begin
      SalesOrder.CostCentre := CSLUCustCstCntrFrm.sSelCode;
      CstCntrEdit.Text := CSLUCustCstCntrFrm.sSelCode;
    end;
  finally
    CSLUCustCstCntrFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.LineDetsStringGridDblClick(Sender: TObject);
begin
  If (FuncMode = 'S') or (FuncMode = 'H') then
    SelectBitBtnClick(Self)
  else
    LineChgBitBtnClick(self);

(*  if LineChgBitBtn.Enabled then
    if FFuncMode <> soView then
      LineChgBitBtnClick(Self)
    else
      SelectBitBtnClick(Self)
*)
end;

procedure TSTMaintSOrdFrm.OrdEditChange(Sender: TObject);
begin
SalesOrder.CustOrderNo := OrdEdit.Text;
CheckOk(Self);
end;

procedure TSTMaintSOrdFrm.DateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If DateEdit.Text = '' then
    Exit;
    try
    NewDate := StrToDate(DateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateEdit.SetFocus;
      Exit;
    end;
  end;

  DateEdit.Text := PBDatestr(NewDate);
  SalesOrder.Datepoint := newdate ;
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.DtReqEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If DtReqEdit.Text = '' then
    Exit;
    try
    NewDate := StrToDate(DtReqEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DtReqEdit.SetFocus;
      Exit;
    end;
  end;

  DtReqEdit.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(OKBitBtn.enabled) then exit;

  if FFuncMode = soView then exit;

  TempWord := MessageDlg('Do you want to save these order details?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
      CSDBSOMemoFrm.Free;
      Exit;
    end
  else
  if TempWord = mrCancel then
    Action := caNone
  else
    begin
      OKBitBtnClick(self);
      CSDBSOMemoFrm.Free;
    end;

end;

procedure TSTMaintSOrdFrm.NotesBitBtnClick(Sender: TObject);
begin
  if fFuncMode = soView then
    CSDBSOMemoFrm.bAllow_Upd := false
  else
    CSDBSOMemoFrm.bAllow_Upd := true;

  CSDBSOMemoFrm.ShowModal;
  checknotes(Self);
end;

procedure TSTMaintSOrdFrm.CheckNotes(Sender: TObject);
begin
  if CSDBSOMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
end;

function TSTMaintSOrdFrm.HasCostCentres: Boolean;
begin
Result := False;
  with STSalesOrdDM.GetCustCstCntrSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := SalesOrder.Customer;
    Open;
    if RecordCount >0 then
      result := true;
  end;
end;

procedure TSTMaintSOrdFrm.LineDetsStringGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.FormKeyPress(Sender: TObject; var Key: Char);
var
  OrderLine: TOrderLine;
  iOrder: Integer;
  begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
      begin
        if name <> 'LineDetsStringGrid' then exit;
        if col = 1 then
          if GetPartDescription(cells[col,row],row) then
            begin
            if cells[7, row ] = '' then
              begin
              iOrder := SalesOrder.OrderLines.NextLineNumber;
              OrderLine := TOrderLine.Create;
              OrderLine.Line := iOrder;
              cells[0,row] := formatqty(iorder);
              OrderLine.SOLineStatus := slNotYetSent;
              OrderLine.ActnTkn := 'A';
              OrderLine.Part := cells[1,row];
              OrderLine.Sell_Price := StrToFloatDef(cells[5,row], 0, FormatSettings);
              OrderLine.OrdQty := inptoSing((cells[4,row]),OrderLine.SellPackQuantity);
              SalesOrder.OrderLines.Add(OrderLine);
              LineChgBitBtn.Enabled := True ;
              LineDelBitBtn.Enabled := True;
              SelectBitBtn.Enabled := True ;

              if SalesOrder.OrderLines.Count <> 1 then
               memoTotal.text := CurrencyDisp(FloatToStr(getOrderValue)) ;
              cells[7,row] := OrderLine.ActnTkn;
              end;
              col := 4;   {Move on to the Quantity field}
              exit;
            end
          else
            begin
            MessageDlg('Part does not exist', mtError,
              [mbOk], 0);
            exit;
            end;

        if Col = 4 then
          begin
            cells[col+2,row] := formatmoney(strToInt(cells[col,row]) * StrToFloatDef(cells[col+1,row]), 0, FormatSettings);
            salesorder.OrderLines.Lines[row-1].Ordqty := InptoSing(cells[4,row],salesorder.OrderLines.Lines[row-1].SellPackQuantity);
            if salesorder.orderlines.lines[row-1].ActnTkn <> 'A' then
              salesorder.orderlines.lines[row-1].ActnTkn := 'C';
            memoTotal.text := CurrencyDisp(FloatToStr(getOrderValue)) ;
            CheckOK(Self);
            row := row+1;
            Col := 1;
            Exit;
          end;

        if col = 5 then
          begin
            cells[col+1,row] := formatmoney(strToInt(cells[col-1,row]) * StrToFloatDef(cells[col,row]), 0, FormatSettings);
            salesorder.OrderLines.Lines[row-1].Sell_Price := StrToFloatDef(cells[5,row], 0, FormatSettings);
            if salesorder.orderlines.lines[row-1].ActnTkn <> 'A' then
              salesorder.orderlines.lines[row-1].ActnTkn := 'C';
             memoTotal.text := CurrencyDisp(FloatToStr(getOrderValue)) ;
            col := 1;
            row := row + 1;
            exit;
          end;
      end;
end;

function TSTMaintSOrdFrm.GetPartDescription(sPart: string;
  irow: integer): boolean;
begin
  LineDetsStringGrid.cells[1,irow] := UpperCase(LineDetsStringGrid.cells[1,irow]);
  with StSalesOrdDM.GetPartDetsSQL do
    begin
      close;
      parambyname('Part').asstring := sPart;
      open;

      first;

      result := (recordcount <> 0);

      if result then
        begin
        if (trim(LineDetsStringGrid.cells[1,LineDetsStringGrid.rowcount-1]) <> '') or
            (LineDetsStringGrid.row = LineDetsStringGrid.rowcount-1) then
          LineDetsStringGrid.rowcount := LineDetsStringGrid.rowcount + 1;

        LineDetsStringGrid.cells[2,irow] := fieldbyname('Part_Description').asstring;
        LineDetsStringGrid.cells[3,irow] := fieldbyname('Sell_Pack_Quantity').asstring;
        LineDetsStringGrid.cells[4,irow] := '1';
        LineDetsStringGrid.cells[5,irow] := formatmoney(getsellprice(spart));
        LineDetsStringGrid.cells[6,irow] := formatmoney(StrToFloatDef(LineDetsStringGrid.cells[5,irow], 0, FormatSettings) * StrToInt(LineDetsStringGrid.cells[4,irow]));
        end;
    end;
end;

function TSTMaintSOrdFrm.GetSellPrice(TempPart: string): real;
var
Price, Part_cost : Real;
Cost_Unit, Sell_Unit: Integer;
begin
Disc_Val := 0 ;
Sell_unit := StSalesOrdDM.GetPartDetsSQL.fieldByName('Sell_Pack_Quantity').AsInteger;
Price := StSalesOrdDM.GetPartDetsSQL.fieldByName('Part_cost_cat').AsFloat / Sell_unit;
Cost_unit := StSalesOrdDM.GetPartDetsSQL.fieldByName('Purch_Pack_Quantity').AsInteger;
Part_Cost := StSalesOrdDM.GetPartDetsSQL.fieldByName('Part_Purchase_Price').AsFloat / Cost_Unit;
With STSalesOrdDM.getPartDiscSQL do
        begin
        Close;
        ParamByName('Part').AsString := TempPart ;
        ParamBYName('Customer').AsInteger := Salesorder.Customer;
        Open;
        First;
        if recordcount > 0 then
          begin
          Disc_Val := fieldByName('Discount_Value').AsFloat;
          Disc_Type := fieldByName('Discount_Type').Asstring;
          end
        else
          begin
            with STSalesOrdDM.getGroupDiscSQL do
            begin
              close;
              ParamByName('Customer').asInteger := SalesOrder.Customer;
              ParamByName('Part_Group').AsInteger := StSalesOrdDM.GetPartDetsSQL.fieldByName('Part_Group').AsInteger;
              Open;
              first;
              if recordcount > 0 then
                Disc_Val := FieldByName('Discount_Value').AsFloat;
                Disc_Type := fieldByName('Discount_Type').AsString;
              end;
          end;
        end;


        if (Disc_Type = 'X') or (Disc_Type = 'P') then
          Price := price - Disc_Val
          else
            If Disc_Type = 'C' then
            Price := ((Part_Cost) + ((part_cost * disc_val )/100. ))
            else
              if Disc_Type = 'S' then
              Price := ((price ) - ((price * disc_val)/100. ));

      Result := price;
end;

function TSTMaintSOrdFrm.GetOrderValue: real;
var
TempCount : Integer;
TmpTotal : real;
begin
TmpTotal := 0.00;
 for TempCount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[TempCount] do
    begin
    tmpTotal := tmpTotal + (ordqty / SellPackQuantity) * sell_price;
    end;
    next;
 result := tmptotal;
end;

procedure TSTMaintSOrdFrm.RepBitBtnClick(Sender: TObject);
begin
//CallRepPercMaintScreen(ffuncmode);
end;

function TSTMaintSOrdFrm.getselectedRepPerc: TRepLine;
begin
  if (SelectedLine = nil) or (FSelectedRepPercIndex < 0) then
    Result := nil
  else
    Result := SalesOrder.RepLines[FSelectedRepPercIndex];
end;

procedure TSTMaintSOrdFrm.UpdateRepPerc;
var
  icount: Integer;
begin {Update the sales order lines}
  for icount := 0 to Pred(SalesOrder.RepLines.Count) do
  begin
    if SalesOrder.RepLines[icount].ActnTkn = 'A' then
        HandleSORepPerc(STSalesOrdDM.AddSOLineRepPercSQL, icount)
      else
      if SalesOrder.RepLines[icount].ActnTkn = 'C' then
          HandleSORepPerc(STSalesOrdDM.UpdSOLineRepPercSQL, icount)
        else
          if SalesOrder.RepLines[icount].ActnTkn = 'D' then
          HandleSORepPerc(StSalesOrdDM.DelSOLineRepPercSQL, icount);
  end;

end;

procedure TSTMaintSOrdFrm.HandleSORepPerc(Query: TFDQuery; const inx: integer);
var
  i: Integer;
begin
  with STSalesOrdDM.DelAllRepPercSQL do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      execsql;
    end;

  with Query, SalesOrder.RepLines[inx] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    if query.name = 'UpdSOLineRepPercSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    ParamByName('Rep').AsInteger := Rep;
    ParamByName('Rep_Percentage').AsFloat := Percentage;
    end ;
    if query.name= 'AddSOLineRepPercSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    ParamByName('Rep').AsInteger := Rep;
    ParamByName('Rep_Percentage').AsFloat := Percentage;
    end;
    if query.name = 'DelSOLineRepPercSQL' then
    begin
     ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Rep').AsInteger := Rep;
    end;
    ExecSQL;
  end;
end;

procedure TSTMaintSOrdFrm.edtDeliveryNotesChange(Sender: TObject);
begin
// SalesOrder.DeliveryNotes := edtDeliveryNotes.Text;

end;

procedure TSTMaintSOrdFrm.DeliveryBitBtnClick(Sender: TObject);
begin
if RdBtnToCust.checked then
  begin
    CSLUCustFrm := TCSLUCustFrm.Create(Self);
    try
      CSLUCustFrm.bIs_LookUp := True ;
      CSLUCustFrm.bAllow_Upd := True ;
      CSLUCustFrm.bSel_Branch := True ;
      CSLUCustFrm.SelCode := SalesOrder.DeliveryCustomer;
      CSLUCustFrm.SelBranch := SalesOrder.DeliveryBranch;
      CSLUCustFrm.ShowModal;
      If CSLUCustFrm.Selected then
       begin
        SalesOrder.DeliveryCustomer := CSLUCustFrm.SelCode;
        SalesOrder.DeliveryBranch := CSLUCustFrm.SelBranch;
        sDelCustName := CSLUCustFrm.SelName;
        sDelBranchName := CSLUCustFrm.SelBranchName;
        Deliveryedit.text := STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                            + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
       end;
    finally
      CSLUCustFrm.Free;
  end;
  end
else
  begin
    CSLUAdHocFrm := TCSLUAdHocFrm.Create(Self);
    try
      CSLUAdHocFrm.bIs_LookUp := True ;
      CSLUAdHocFrm.bAllow_Upd := True ;
      CSLUAdHocFrm.SelCode := SalesOrder.AdHocAddress;
      CSLUAdHocFrm.ShowModal;
      If CSLUAdHocFrm.Selected then
       begin
        SalesOrder.AdHocAddress := CSLUAdHocFrm.SelCode;
        sDelCustName := CSLUAdHocFrm.SelName;
//        sDelBranchName := CSLUAdHocFrm.SelBranchName;
        Deliveryedit.text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
       end;
    finally
      CSLUAdHocFrm.Free;
  end
end;
end;

procedure TSTMaintSOrdFrm.dbLkpCmbRepClick(Sender: TObject);
var
  RepLine: TRepLine;
begin
  FSelectedRepPercIndex := 0;
  RepLine := TRepLine.Create;
//  RepLine := SelectedRepPerc.Clone;

  SalesOrder.RepLines[0].free;
  SalesOrder.RepLines.Delete(0);
  RepLine.rep := dblkpCmbRep.keyvalue;
  RepLine.RepName := dblkpCmbRep.text;
  RepLine.ActnTkn := 'A';

  SalesOrder.RepLines.Add(RepLine);
  Checkok(Self);

end;

procedure TSTMaintSOrdFrm.ShowQtyLineGrid(Sender: TObject);
var
  TempFrom, TempTo: string;
  TempCount: Integer;
  inx: Integer;
begin
  for TempCount := 0 to LineDetsStringGrid.RowCount do
    begin
    LineDetsStringGrid.rows[TempCount].clear;
    end;
  LineDetsStringGrid.ColWidths[1] := 70;
  LineDetsStringGrid.ColWidths[2] := 150;
  LineDetsStringGrid.ColCount := 10;
  LineDetsStringGrid.Cells[0, 0] := 'Line';
  LineDetsStringGrid.Cells[1, 0] := 'Part';
  LineDetsStringGrid.Cells[2, 0] := 'Description';
  LineDetsStringGrid.Cells[3, 0] := 'Pack Size';
  LineDetsStringGrid.Cells[4, 0] := 'Qty On Ord';
  LineDetsStringGrid.Cells[5, 0] := 'Qty Alloc';
  LineDetsStringGrid.Cells[6, 0] := 'Qty Deliv';
  LineDetsStringGrid.Cells[7, 0] := 'Qty Inv';
  LineDetsStringGrid.Cells[8, 0] := 'Price';
  LineDetsStringGrid.Cells[9, 0] := 'Total';
  LineDetsStringGrid.Cells[0, 1] := '';
  LineDetsStringGrid.Cells[1, 1] := '';
  LineDetsStringGrid.Cells[2, 1] := '';
  LineDetsStringGrid.Cells[3, 1] := '';
  LineDetsStringGrid.Cells[4, 1] := '';
  LineDetsStringGrid.Cells[5, 1] := '';
  LineDetsStringGrid.Cells[6, 1] := '';
  LineDetsStringGrid.Cells[7, 1] := '';
  LineDetsStringGrid.Cells[8, 1] := '';
  LineDetsStringGrid.Cells[9, 1] := '';
  TempFrom := '';
  TempTo := 'ZZZ';
  inx := 0;
 { if SalesOrder.OrderLines.Count = 0 then
    LineDetsStringGrid.enabled := False
  else
    LineDetsStringGrid.enabled := True;  }
  for TempCount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[TempCount] do
    begin
        with LineDetsStringGrid do
        begin
          if ActnTkn <> 'D' then
          begin
          Inc(inx);
          Cells[0, inx] := IntToStr(Line);
          Cells[1, inx] := Part;
          Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part);
          Cells[3, inx] := STSalesOrdDM.GetSellUnit(Part);
//          Cells[4, inx] := FormatQty(OrdQty);
          Cells[4, inx] := ShowInPacks(OrdQty,SellPackQuantity);
          Cells[5, inx] := ShowInPacks(AllocQty,SellPackQuantity);
          Cells[6, inx] := ShowInPacks(DelQty,SellPackQuantity);
          Cells[7, inx] := ShowInPacks(InvQty,SellPackQuantity);
          Cells[8, inx] := FormatMoney(Sell_Price);
          Cells[9, inx] := FormatMoney((Ordqty/SellPackQuantity)*Sell_Price);
          Cells[10, inx] := 'C';
//          fTempTot := fTempTot + ((Ordqty/SellPackQuantity)*Sell_Price);
          fTempOrdTot := fTempOrdTot + ((Ordqty / SellPackQuantity)*Sell_Price);
      end;
    end;
  end;
  if inx > 0 then
    LineDetsStringGrid.RowCount := inx + 1
  else
    LineDetsStringGrid.RowCount := 2;
  LineChgBitBtn.Enabled := False;
  LineDelBitBtn.Enabled := False;
  SelectBitBtn.Enabled := False;

  LineDetsStringGrid.popupMenu := pMnuView;

  if inx > 0 then
    begin
      FSelectedLineIndex := 0;
      LineDetsStringGrid.Cells[0, inx+1] := '';
      LineDetsStringGrid.Cells[1, inx+1] := '';
      LineDetsStringGrid.Cells[2, inx+1] := '';
      LineDetsStringGrid.Cells[3, inx+1] := '';
      LineDetsStringGrid.Cells[4, inx+1] := '';
      LineDetsStringGrid.Cells[5, inx+1] := '';
      LineDetsStringGrid.Cells[6, inx+1] := '';
      LineDetsStringGrid.Cells[7, inx+1] := '';
      end
    else
    FSelectedLineIndex := -1;
    ShowExtChgGrid(Self);
    ExtChgDetsStringGrid.enabled := not (FuncMode = 'S');
//    memoTotal.text := CurrencyDisp(FloatToStr(fTempTot+SalesOrder.ExtraCharges.Total)) ;
    memoTotal.text := CurrencyDisp(FloatToStr(fTempOrdTot+SalesOrder.ExtraCharges.Total)) ;
    pnlTop.Enabled := not (FuncMode = 'S');
    pnlHead.Enabled := not (FuncMode = 'S');
end;

procedure TSTMaintSOrdFrm.btnSupplierLUClick(Sender: TObject);
begin
  CSLUSuppFrm := TCSLUSuppFrm.Create(Self);
  try
    CSLUSuppFrm.bIs_LookUp := True ;
    CSLUSuppFrm.bAllow_Upd := True ;
    CSLUSuppFrm.bSel_Branch := True ;
    CSLUSuppFrm.SelCode := SalesOrder.Supplier;
    CSLUSuppFrm.SelBranch := SalesOrder.BranchNo0;
    CSLUSuppFrm.ShowModal;
    If CSLUSuppFrm.Selected then
      begin
        SalesOrder.Supplier := CSLUSuppFrm.SelCode;
        edtSupplier.Text := CSLUSuppFrm.SelName + '/' + CSLUSuppFrm.SelBranchName;
        SalesOrder.BranchNo0 := CSLUSuppFrm.SelBranch;
        GetSupplierOrderTypes;
      end;
  finally
    CSLUSuppFrm.Free;
  end;
CheckOK(Self) ;
end;

procedure TSTMaintSOrdFrm.GetSupplierOrderTypes;
begin
  with STSalesOrdDM.GetSuppOTypeSQL do
    begin
      close;
      parambyname('Supplier').asinteger := SalesOrder.Supplier;
      open;
    end;
end;

procedure TSTMaintSOrdFrm.DisplaySourceDetails;
begin
  with dblkpReplType do
    begin
      SalesOrder.ReplenishSource := keyvalue;
      pnlSupplier.visible := (keyvalue = 1); {from Supplier}
      pnlWarehouse.visible := (keyvalue = 2); {from Warehouse}
      pnlSupplier.top := pnlWarehouse.top;
      pnlSupplier.left := pnlWarehouse.left;
      pnlWarehouse.BevelOuter := bvnone;
      pnlSupplier.BevelOuter := bvnone;
    end;
    CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.dblkpReplTypeClick(Sender: TObject);
begin
  DisplaySourceDetails;
end;

procedure TSTMaintSOrdFrm.dblkpOrdertypeClick(Sender: TObject);
begin
  SalesOrder.SupplierOrderType := (sender as TDBLookupComboBox).keyvalue;
  CheckOK(Self);
end;

procedure TSTMaintSOrdFrm.StoreComboBoxClick(Sender: TObject);
begin
  SalesOrder.PartStore := (Sender as TDBLookupComboBox).keyvalue;
  CheckOK(self);
end;

procedure TSTMaintSOrdFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph :=CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TSTMaintSOrdFrm.ChrgAddBitBtnClick(Sender: TObject);
begin
 if Selectedline = nil then
    Exit;
     CallExtChgMaintScreen(soAdd);
end;

procedure TSTMaintSOrdFrm.ChrgChgBitBtnClick(Sender: TObject);
begin
  if SelectedChargeIndex = -1 then
    Exit;
  CallExtChgMaintScreen(soChange);
end;

procedure TSTMaintSOrdFrm.ChrgDelBitBtnClick(Sender: TObject);
begin
 if SelectedChargeIndex = -1 then
    Exit;
  CallExtChgMaintScreen(soDelete);
end;

procedure TSTMaintSOrdFrm.CallExtChgMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  ExtraCharge: TExtraCharge;
  inx, iCharge: Integer;
begin
  if sTempFuncMode = soAdd then
  begin
    ExtraCharge := TExtraCharge.Create;
    ExtraCharge.AdditionalCharge := SalesOrder.ExtraCharges.NextChargeNumber;
  end
  else
    ExtraCharge := SelectedCharge.Clone;
  STMaintSInvExtChgFrm := TSTMaintSInvExtChgFrm.Create(Self);
  try
    STMaintSInvExtChgFrm.FuncMode := sTempFuncMode;
    STMaintSInvExtChgFrm.ExtraCharge := ExtraCharge;
    STmaintSInvExtChgFrm.InvorOrd := 'O';
    STMaintSInvExtChgFrm.ShowModal;
    bTempOK := STMaintSInvExtChgFrm.bOK;
  finally
    STMaintSInvExtChgFrm.Free;
  end;
  if bTempOK then
  begin
    iCharge := ExtraCharge.AdditionalCharge;
    if sTempFuncMode = soAdd then
      SalesOrder.ExtraCharges.Add(ExtraCharge);
    inx := SalesOrder.ExtraCharges.IndexFromChargeNo(iCharge);
    if sTempFuncMode in [soChange, soDelete] then
    begin
      SalesOrder.ExtraCharges[inx].Free;
     SalesOrder.ExtraCharges.Delete(inx);
    end;
    if sTempFuncMode = soChange then
     SalesOrder.ExtraCharges.Add(ExtraCharge);
    if sTempFuncMode = soDelete then
      ExtraCharge.Free;
    ShowExtChgGrid(Self);
    recalcTotals;
  end
  else
    ExtraCharge.Free;
end;

procedure TSTMaintSOrdFrm.CreateExtraChargeLine;
var
icount: integer;
begin
 {Insert a new Invoice Line record}
  for icount := 0 to pred(SalesOrder.ExtraCharges.Count) do
   with SalesOrder.ExtraCharges[iCount] do
      begin
  with STSalesOrdDM.AddOrdExtChgSQL do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := salesorder.SONumber;
    ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
    ParamByName('Details').Asstring := Details;
    ParamByName('Nominal').AsString := NominalCode;
    ParamByName('Amount').AsFloat := Amount;
    ParamByName('Cost').AsFloat := Cost;
    ParambyName('Vat_Code').asinteger := ChgVatCode;
    ExecSQL;
  end;
 end;
end;

procedure TSTMaintSOrdFrm.UpdateExtraCharges;
var
icount: integer;
begin
 {Insert a new Invoice Line record}
    if FFuncMode <> soAdd then
    begin
      with STSalesOrdDM.DelOrdExtChgSQL do
      begin
        Close;
        ParamByName('Sales_Order').asinteger := salesorder.SoNumber;
        execSQL;
      end;
    end;

 for icount := 0 to pred(SalesOrder.ExtraCharges.Count) do
   with SalesOrder.ExtraCharges[iCount] do
   begin
    with STSalesOrdDM.AddOrdExtChgSQL do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := salesorder.SoNumber;
      ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
      ParamByName('Details').Asstring := Details;
      ParamByName('Nominal').AsString := StSalesOrdDm.GetDefSalesNominal;
      ParamByName('Amount').AsFloat := Amount;
      ParamByName('Cost').AsFloat := Cost;
      ParamByName('Vat_Code').AsInteger := ChgVatCode;
      ExecSQL;
    end ;
   end;

end;

procedure TSTMaintSOrdFrm.RecalcTotals;
begin
 MemoTotal.text := CurrencyDisp(FloatToStr(SalesOrder.ExtraCharges.Total+FTempOrdTot));
end;

function TSTMaintSOrdFrm.GetSelectedCharge: TExtraCharge;
begin
 if (SelectedLine = nil) or (FSelectedChargeIndex < 0) then
    Result := nil
  else
    Result := SalesOrder.ExtraCharges[FSelectedChargeIndex];
end;

procedure TSTMaintSOrdFrm.ShowExtChgGrid(Sender: TObject);
var
  TempCount,
    iNoOfExtChg: Integer;
begin
  iNoOfExtChg := 0;
  ExtChgDetsStringGrid.Cells[0, 0] := 'Details';
  ExtChgDetsStringGrid.Cells[1, 0] := 'Cost';
  ExtChGDetsStringGrid.Cells[2, 0] := 'Amount';
  ExtChgDetsStringGrid.Cells[3, 0] := 'Vat Rate';
  ExtChgDetsStringGrid.Cells[0, 1] := '';
  ExtChgDetsStringGrid.Cells[1, 1] := '';
  ExtChgDetsStringGrid.Cells[2, 1] := '';
  ExtChgDetsStringGrid.Cells[3, 1] := '';
  if assigned(SalesOrder.extraCharges) then
    for TempCount := 0 to Pred(SalesOrder.ExtraCharges.Count) do
      with SalesOrder.ExtraCharges[TempCount] do
      begin
        iNoOfExtChg := iNoOfExtChg + 1;
        ExtChgDetsStringGrid.Cells[0, iNoOfExtChg] := Details;
        ExtChgDetsStringGrid.Cells[1, iNoOfExtChg] := FormatMoney(Cost);
        ExtChgDetsStringGrid.Cells[2, iNoOfExtChg] := FormatMoney(Amount);
        ExtChgDetsStringGrid.Cells[3, iNoofExtChg] := STSalesOrdDM.GetVatRate(ChgVatCode);
      end;
  if iNoOfExtChg > 1 then
    ExtChgDetsStringGrid.RowCount := iNoOfExtChg + 1
  else
    ExtChgDetsStringGrid.RowCount := 2;
  if iNoOfExtChg > 0 then
  begin
    FSelectedChargeIndex := 0;
  end
  else
  begin
    FSelectedChargeIndex := -1;
  end;
end;

procedure TSTMaintSOrdFrm.ExtChgDetsStringGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
if FSelectedChargeIndex = ARow - 1 then Exit;
  FSelectedChargeIndex := ARow - 1;
end;

procedure TSTMaintSOrdFrm.ExtChgMenuPopup(Sender: TObject);
begin
  chrgChgBitBtn.enabled := (SalesOrder.ExtraCharges.count <> 0);
  chrgDelBitBtn.enabled := (SalesOrder.ExtraCharges.count <> 0);
end;

procedure TSTMaintSOrdFrm.RdBtnToCustClick(Sender: TObject);
begin
SetDeliverTo;
end;

procedure TSTMaintSOrdFrm.SetDeliverTo;
begin
rdBtnToCust.checked := not rdBtnToAdHoc.checked;
if rdBtnToCust.Checked then
  begin
    SalesOrder.deliveryCustomer := SalesOrder.Customer;
            SalesOrder.DeliveryBranch := SalesOrder.Branchno;
            DeliveryEdit.text :=  STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                                + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
  SalesOrder.AdhocAddress := 0;
  end
else
  begin
    SalesOrder.DeliveryCustomer := 0;
    SalesOrder.DeliveryBranch := 0;
    DeliveryEdit.Text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
  end;
end;

procedure TSTMaintSOrdFrm.RDBtnToAdHocClick(Sender: TObject);
begin
Deliveryedit.Text := '';
SetDeliverTo;
end;

procedure TSTMaintSOrdFrm.ExtChgDetsStringGridDrawCell(Sender: TObject; VCol,
  VRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (vCol = 0) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;

end;

procedure TSTMaintSOrdFrm.ExtChgDetsStringGridDblClick(Sender: TObject);
begin
  ChrgChgBitBtnClick(self);
end;

procedure TSTMaintSOrdFrm.DeleteSerialNos(const inx: integer);
begin
  STSalesOrdDM.DeleteSOSerialNos(SalesOrder.SONumber,
    SalesOrder.OrderLines[inx].Line);
end;

procedure TSTMaintSOrdFrm.SaveSerialNos(const inx: integer);
var
  i, iToNumbers: Integer;
  iLength: integer;
  sFirst, sLast, sOutFirst, sOutLast: string;
  bKeepThis: boolean;
begin
  for i := 0 to pred(SalesOrder.OrderLines[inx].StockSerialNos.Count) do
    begin
      if (SalesOrder.SONumber <> SalesOrder.OrderLines[inx].StockSerialNos[i].Salesorder) and
         (SalesOrder.OrderLines[inx].StockSerialNos[i].Salesorder <> 0)  then
        continue
      else
        STSalesOrdDM.DeleteStoreStockSerialItems(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock,
                                                 SalesOrder.OrderLines[inx].StockSerialNos[i].SerialItemNo);
      sFirst := SalesOrder.OrderLines[inx].StockSerialNos[i].SerialItemFrom;
      sLast := SalesOrder.OrderLines[inx].StockSerialNos[i].SerialItemTo;

      bKeepThis := true;

      for iToNumbers := 0 to pred(SalesOrder.OrderLines[inx].SerialNumbers.Count) do
        begin
          sOutFirst := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
          sOutLast := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;

          iLength := length(sOutFirst);

          {if first number is greater than last - then not removed from this batch}
          if (sOutFirst > sLast) then
            continue
          else
          if (sOutFirst < sFirst) and (sOutLast < sFirst) then
            continue
          else
          {if first number is same as first number in batch then see where the last number falls}
          if (sOutFirst = sFirst) then
            begin
              bKeepThis := false;
              if (sOutLast < sLast) then
                begin
                  {Add those items taken but allocate the sales order number}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                  {Add the items after the last}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := PadWithZeros(strtoint(sOutLast)+1,iLength);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := sLast;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end
              else
                begin
                  {All these serial numbers have been selected, allocate the sales order number}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end;
            end
          else
          if (sOutFirst > sFirst) then
            begin
              {Add in those numbers not taken, i.e. before the first}
              STSalesOrdDM.AddStStkSerialNosSQL.close;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := sFirst;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := Padwithzeros(strtoint(sOutFirst)-1,iLength);
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
              STSalesOrdDM.AddStStkSerialNosSQL.execsql;

              if (sOutLast < sLast) then
                begin
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                  {Add in those numbers not taken, i.e. up to the last}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := Padwithzeros(strtoint(sOutLast)+1,iLength);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := sLast;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end
              else
                begin
                  {All these serial numbers have been selected, allocate the sales order number}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end;
              bKeepThis := false;
            end;
        end;

      if bKeepThis then
        begin
          {Add to Store_Stock_Serial_items with no changes}
          STSalesOrdDM.AddStStkSerialNosSQL.close;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := sFirst;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := sLast;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
          STSalesOrdDM.AddStStkSerialNosSQL.execsql;
        end;
    end;

  for i := 0 to Pred(SalesOrder.OrderLines[inx].SerialNumbers.Count) do
    with SalesOrder, OrderLines[inx], SerialNumbers[i] do
    begin
      with STSalesOrdDM.AddSerialNosSQL do
      begin
        Close;
        ParamByName('Sales_Order').asinteger := SONumber;
        ParamByName('Sales_order_Line_no').AsInteger := OrderLines[inx].Line;
        ParamByName('Serial_item_no').AsInteger := i+1;
        ParamByName('Serial_item_from').AsString := SerialItemFrom;
        ParamByName('Serial_item_to').Asstring := SerialItemTo;
       ExecSQL;
      end;
    end;
end;

procedure TSTMaintSOrdFrm.pMnuMaintPopup(Sender: TObject);
var
  inx: integer;
begin
  inx := LineDetsStringGrid.row-1;

  if (LineDetsStringGrid.row = 0) or (LineDetsStringGrid.cells[0,LineDetsStringGrid.row] = '') then
    exit;
  LineSerialNos.visible := STSalesOrdDM.GetPartNumbered(SalesOrder.OrderLines[inx].Part);
  N1.visible := STSalesOrdDM.GetPartNumbered(SalesOrder.OrderLines[inx].Part);
end;

procedure TSTMaintSOrdFrm.LineSerialNosClick(Sender: TObject);
var
  inx: integer;
begin
  inx := LinedetsStringgrid.row -1;
  STMaintSOrdSerialNosFrm := TSTMaintSOrdSerialNosFrm.create(self);
  try
    STMaintSOrdSerialNosFrm.OrderLine := SalesOrder.OrderLines[inx];
    STMaintSOrdSerialNosfrm.SONumber := SalesOrder.SONumber;
    STMaintSOrdSerialNosFrm.Product := SalesOrder.OrderLines[inx].Part;
    STMaintSOrdSerialNosFrm.lblProductCode.caption := SalesOrder.OrderLines[inx].Part + ' - ' + STSalesOrdDM.GetPartDescr(SalesOrder.OrderLines[inx].Part);
    STMaintSOrdSerialNosFrm.Quantity := SalesOrder.OrderLines[inx].OrdQty;
    STMaintSOrdSerialNosFrm.showmodal;
(*    if STMaintSOrdSerialNosFrm.modalresult = idOK then
      SalesOrder.OrderLines[inx].ActnTkn := 'C';

*)
  finally
    STMaintSOrdSerialNosFrm.free;
  end;
end;

procedure TSTMaintSOrdFrm.btnAddServiceClick(Sender: TObject);
begin
  { Is there any more room ? }
  if SalesOrder.OrderLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of lines already on this order', mtError,
      [mbAbort], 0)
  else
    begin
    CallServiceMaintScreen(soAdd);
    LineDetsStringGrid.row := LineDetsStringGrid.rowcount - 1;
    end;
end;

end.


