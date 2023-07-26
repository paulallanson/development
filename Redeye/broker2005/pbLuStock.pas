unit pbLuStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, pbStockDM,
  Db, Inifiles, Buttons, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBLUStock = class(TForm)
    CoolBar1: TCoolBar;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsBrDetails: TStatusBar;
    imglstMaint: TImageList;
    pmnFunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    Levels1: TMenuItem;
    N2: TMenuItem;
    MovementActivity1: TMenuItem;
    Bins1: TMenuItem;
    Sales1: TMenuItem;
    ProductionOrders1: TMenuItem;
    PurchaseOrders1: TMenuItem;
    N3: TMenuItem;
    StockMovements1: TMenuItem;
    N4: TMenuItem;
    ResetGrid1: TMenuItem;
    pmuMovements: TPopupMenu;
    OpeningBalances1: TMenuItem;
    Adjustmentin1: TMenuItem;
    Adjustmentout1: TMenuItem;
    Transfers1: TMenuItem;
    tmrSearch: TTimer;
    Panel2: TPanel;
    btnClose: TButton;
    PageScroller1: TPageScroller;
    pmnEnquiry: TPopupMenu;
    StockMovements2: TMenuItem;
    BinLocations1: TMenuItem;
    Numbersequences1: TMenuItem;
    Salesorders1: TMenuItem;
    ProductionOrders2: TMenuItem;
    PurchaseOrders2: TMenuItem;
    Panel3: TPanel;
    Label3: TLabel;
    chkbxShowInactive: TCheckBox;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnLabels: TToolButton;
    ToolButton1: TToolButton;
    btnStockLevels: TToolButton;
    ToolButton2: TToolButton;
    btnEnquiry: TToolButton;
    btnTransfers: TToolButton;
    ToolButton3: TToolButton;
    btnReports: TToolButton;
    btnStockTake: TToolButton;
    pmuStocktake: TPopupMenu;
    EnterStockCount1: TMenuItem;
    StockCountValuation1: TMenuItem;
    StockCountVarianceReport1: TMenuItem;
    btnSupplier: TToolButton;
    mmnuStock: TMainMenu;
    File1: TMenuItem;
    Import1: TMenuItem;
    SupplierProducts1: TMenuItem;
    ACustomerProducts1: TMenuItem;
    N5: TMenuItem;
    Exit1: TMenuItem;
    CustomerProducts1: TMenuItem;
    btnStkTakeSep: TToolButton;
    btnReceipts: TToolButton;
    btnAdjustIn: TToolButton;
    btnAdjustOut: TToolButton;
    btnMovementsSep: TToolButton;
    chkbxShowStocked: TCheckBox;
    N6: TMenuItem;
    SearchBin1: TMenuItem;
    btnOvers: TToolButton;
    pmnChange: TPopupMenu;
    StockLevels1: TMenuItem;
    StockLevels2: TMenuItem;
    Send1: TMenuItem;
    Excel1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Backup1: TMenuItem;
    pmnSupplier: TPopupMenu;
    AssociateSuppliers1: TMenuItem;
    SupplierDiscounts1: TMenuItem;
    btnUsage: TToolButton;
    btnReturns: TToolButton;
    SwitchUser1: TMenuItem;
    btnCustomerCodes: TToolButton;
    QuantitiesandPrices1: TMenuItem;
    BitBtn1: TBitBtn;
    chkbxShowPositiveStock: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnStockLevelsClick(Sender: TObject);
    procedure btnMovementsClick(Sender: TObject);
    procedure btnLocationsClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure btnPurchaseOrdersClick(Sender: TObject);
    procedure OpeningBalances1Click(Sender: TObject);
    procedure Adjustmentin1Click(Sender: TObject);
    procedure Adjustmentout1Click(Sender: TObject);
    procedure Transfers1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSalesClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure Numbersequences1Click(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMaintainClick(Sender: TObject);
    procedure EnterStockCount1Click(Sender: TObject);
    procedure StockCountValuation1Click(Sender: TObject);
    procedure StockCountVarianceReport1Click(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SupplierProducts1Click(Sender: TObject);
    procedure ACustomerProducts1Click(Sender: TObject);
    procedure CustomerProducts1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnReceiptsClick(Sender: TObject);
    procedure btnAdjustInClick(Sender: TObject);
    procedure btnAdjustOutClick(Sender: TObject);
    procedure btnTransfersClick(Sender: TObject);
    procedure chkbxShowStockedClick(Sender: TObject);
    procedure SearchBin1Click(Sender: TObject);
    procedure btnOversClick(Sender: TObject);
    procedure StockLevels1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure AssociateSuppliers1Click(Sender: TObject);
    procedure SupplierDiscounts1Click(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnUsageClick(Sender: TObject);
    procedure btnReturnsClick(Sender: TObject);
    procedure SwitchUser1Click(Sender: TObject);
    procedure btnCustomerCodesClick(Sender: TObject);
    procedure QuantitiesandPrices1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkbxShowPositiveStockClick(Sender: TObject);
  private
    ActiveCode: string;
    bShowOnlyStock: boolean;
    bShowPositiveStock: boolean;
    DontSaveLayout: Boolean;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure CallMoveScreen(TempMoveType: String);
    procedure SetButtonProperties(Sender: TObject);
    procedure CallMaintWizard;
    procedure CallMultiSelection;
    procedure MultiSQLAdd(sTempStr: String; tmpQuery: TFDQuery);
  private
    bSQLAdd: boolean;
    iMnuMaint: integer;
    dtmdlAllStock: TdtmdlStock;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmPBLUStock: TfrmPBLUStock;

implementation

uses CCSCommon, STMaintProduct, STLUProductLvls, STLUStkMvmnts, STLUStkLoc,
  STLUStkSales, STLUStkPurchases, STPrtTran, STLUStkProduction, STRSLabels,
  STLUStkNmbr, pbLUStockRpts, pbDatabase, pbMainMenu, STStkEnq, StStkTkSel,
  StMntPrtSupp, STProdImport, STProdImportCust, STProdImportAllCust,
  STRSStockLabels, PBPartTransfer, STLUStockLocations, PBLUPartBOM,
  PBLUJobReturns, PBMaintProduct1, STLUSuppPrt, STMaintStockUsage,
  STMaintStockReturns, STLUCustPart, STMaintProductQtyPrices, STPrtMntDetsMulti;

{$R *.DFM}

procedure TfrmPBLUStock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'StockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;

end;

procedure TfrmPBLUStock.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      bShowOnlyStock := (ReadString('Redeye', 'Show Only Stock', 'N')= 'Y');
      bShowPositiveStock := (ReadString('Redeye', 'Show Only Positive Stock', 'N')= 'Y');
      Free;
    end;

  dtmdlAllStock := TdtmdlStock.create(self);

  dtmdlAllStock.dtsStock.OnDataChange := SetButtons;

  dbgDetails.DataSource := dtmdlAllStock.dtsStock;

  btnOvers.Visible := dmBroker.UseProduction;
  btnUsage.Visible := dmBroker.UseProduction;
  
  CCSCommon.SetDBGridCols('', 'StockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUStock.CallMaintScreen(sTempFuncMode: Char);
var
  bTempOK: ByteBool;
  TempPart: string;
begin
  frmSTMaintProduct := TfrmSTMaintProduct.Create(Self);
  try
    if sTempFuncMode = 'A' then
      frmSTMaintProduct.sPart := ''
    else
      frmSTMaintProduct.sPart := dbgDetails.datasource.DataSet.fieldbyname('Part').asstring;

//    frmSTMaintProduct.iCustomer := Customer;
    frmSTMaintProduct.sFuncMode := sTempFuncMode;
    frmSTMaintProduct.ShowModal;
    bTempOK := frmSTMaintProduct.bOK;
    TempPart := frmSTMaintProduct.edtProductCode.text;
  finally
    frmSTMaintProduct.Free;
  end;
  if bTempOK then
  begin
    dtmdlAllStock.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
    end;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
  end;
end;

procedure TfrmPBLUStock.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllStock do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnLabels.Enabled := HeaderCount > 0;
    btnStockLevels.Enabled := HeaderCount > 0;
    btnSupplier.enabled := HeaderCount > 0;
    btnCustomerCodes.enabled := HeaderCount > 0;
(*
    btnMaintain.Enabled := HeaderCount > 0;
    btnMovements.Enabled := HeaderCount > 0;
    btnLocations.Enabled := HeaderCount > 0;
    btnsales.Enabled := HeaderCount > 0;
    btnProduction.Enabled := HeaderCount > 0;
    btnPurchaseOrders.Enabled := HeaderCount > 0;
*)
    btnEnquiry.Enabled := HeaderCount > 0;
    btnTransfers.Enabled := HeaderCount > 0;
    btnReceipts.Enabled := HeaderCount > 0;
    btnAdjustIn.Enabled := HeaderCount > 0;
    btnAdjustOut.Enabled := HeaderCount > 0;
    btnOvers.Enabled := HeaderCount > 0;
    SetButtonProperties(self);
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUStock.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
//  iTempAccCtrl := iMnuBtnPOMaint ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5));
  {They can ADD orders IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnChange.Caption := '  &Change  ';
    end
  else
    begin
      btnChange.Caption := '   &View   ';
    end;
  btnDelete.Visible := bTempCanUpd;
//  btnMaintain.Visible := bTempCanUpd;
  btnTransfers.Visible := bTempCanUpd;
  btnAdjustOut.Visible := bTempCanUpd;
  btnAdjustIn.Visible := bTempCanUpd;
  btnReceipts.Visible := bTempCanUpd;

  btnMovementsSep.visible := bTempCanUpd;

  btnSupplier.Visible := bTempCanUpd;

  btnStockTake.Visible := bTempCanUpd;
  btnStkTakeSep.Visible := btempCanUpd;
  btnReports.Enabled := true;
end;

procedure TfrmPBLUStock.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  ShowOnlyStock, ShowPositiveStock: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  if chkbxShowStocked.checked then
    ShowOnlyStock := 'Y'
  else
    ShowOnlyStock := 'N';

  if chkbxShowPositiveStock.checked then
    ShowPositiveStock := 'Y'
  else
    ShowPositiveStock := 'N';

  with IniFile do
    begin
      WriteString('Redeye', 'Show Only Stock', ShowOnlyStock);
      WriteString('Redeye', 'Show Only Positive Stock', ShowPositiveStock);
      Free;
    end;

  dtmdlAllStock.free;
end;

procedure TfrmPBLUStock.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllStock.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUStock.FormShow(Sender: TObject);
begin
//  dtmdlAllStock.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUStock.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllStock.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmPBLUStock.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUStock.btnAddClick(Sender: TObject);
begin
//  CallMaintWizard;
  CallMaintScreen('A');
end;

procedure TfrmPBLUStock.CallMaintWizard;
var
  tempPart: string;
begin
  PBMaintProduct1frm := TPBMaintProduct1frm.create(self);
  try
    PBMaintProduct1frm.showmodal;
    if PBMaintProduct1frm.bOK then
      begin
        tempPart := PBMaintProduct1frm.edtProductCode.Text;
        dtmdlAllStock.Refreshdata;
        dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
      end;
  finally
    PBMaintProduct1frm.free;
  end;
end;

procedure TfrmPBLUStock.btnChangeClick(Sender: TObject);
var
  bTempAskDets, bTempCalcList, bTempCalcCat: ByteBool ;
  iTempCount: Integer ;
  FirstPart, TempPart, sTempPurchPrice, sTempListMU, sTempCatMU, sTempPurchPack, sTempSellPack, TempNotInUse: String ;
begin
  if dbgDetails.SelectedRows.Count = 1 then
    CallMaintScreen('C')
  else
    begin
      bTempAskDets := False ;
      for iTempCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iTempCount])) ;
          TempPart := dbgDetails.datasource.DataSet.fieldbyname('Part').asstring;
          if iTempCount = 0 then
            FirstPart := TempPart;
          if bTempAskDets = False then
            begin
              STPrtMntDetsMultiFrm := TSTPrtMntDetsMultiFrm.Create(Self);
              try
                with dtmdlAllStock.qryGetPart do
                  begin
                    Close ;
                    ParamByName('Part').AsString := TempPart ;
                    Open ;
                    First ;

                    STPrtMntDetsMultiFrm.iPartCount := dbgDetails.SelectedRows.Count ;

                    if fieldByName('Product_Class').AsString = 'NSTK' then
                      STPrtMntDetsMultiFrm.rdgrpClass.itemindex := 1
                    else
                    if fieldByName('Product_Class').AsString = 'SERV' then
                      STPrtMntDetsMultiFrm.rdgrpClass.itemindex := 2
                    else
                    if fieldByName('Product_Class').AsString = 'POD' then
                      STPrtMntDetsMultiFrm.rdgrpClass.itemindex := 3
                    else
                    if fieldByName('Product_Class').AsString = 'STK' then
                      STPrtMntDetsMultiFrm.rdgrpClass.itemindex := 0;

                    STPrtMntDetsMultiFrm.PurchPriceMemo.Text := FormatFloat('######0.00', FieldByName('Part_Purchase_Price').AsFloat);
                    STPrtMntDetsMultiFrm.ListMUMemo.Text := FormatFloat('##0.00', FieldByName('Part_Mark_Up_List').AsFloat);
                    STPrtMntDetsMultiFrm.CatMUMemo.Text := FormatFloat('##0.00', FieldByName('Part_Mark_Up_Cat').AsFloat);
                    STPrtMntDetsMultiFrm.PurchPackQtySpinEdit.Value := FieldByName('Purch_Pack_Quantity').AsInteger;
                    STPrtMntDetsMultiFrm.SellPackQtySpinEdit.Value := FieldByName('Sell_Pack_Quantity').AsInteger;
                    STPrtMntDetsMultiFrm.VATDBLookUpComboBox.KeyValue := FieldByName('Vat_Code').AsInteger;
                    STPrtMntDetsMultiFrm.AutoUpdCheckBox.Checked := (FieldByName('Auto_Update').AsString = 'Y');
                    STPrtMntDetsMultiFrm.NotInUseCheckBox.Checked := (FieldByName('Not_In_Use').AsString = 'Y');
                    STPrtMntDetsMultiFrm.UseSNsCheckBox.Checked := (FieldByName('Track_Serial_No').AsString = 'Y');
                    STPrtMntDetsMultiFrm.ChkBxNumbrd.Checked := (FieldByName('Numbered').AsString = 'Y');
                    if FieldByName('Part_Group').AsInteger = 0 then
                      STPrtMntDetsMultiFrm.PartGroupDBLookUpComboBox.KeyValue := 0
                    else
                      STPrtMntDetsMultiFrm.PartGroupDBLookUpComboBox.KeyValue := FieldByName('Part_Group').AsInteger;

                    if FieldByName('Price_unit').AsInteger = 0 then
                      STPrtMntDetsMultiFrm.dblkpPriceUnit.KeyValue := 0
                    else
                      STPrtMntDetsMultiFrm.dblkpPriceUnit.KeyValue := FieldByName('Price_unit').AsInteger;

                    STPrtMntDetsMultiFrm.SelCust := FieldByName('Customer').AsInteger;
                    STPrtMntDetsMultiFrm.SelBranch := FieldByName('Branch_No').AsInteger;

                    if fieldByName('Customer').AsInteger <> 0 then
                      begin
                        dtmdlAllStock.qryGetCustName.Close;
                        dtmdlAllStock.qryGetCustName.ParamByName('Customer').AsInteger := FieldByName('Customer').AsInteger;
                        dtmdlAllStock.qryGetCustName.ParamByName('Branch').AsInteger := FieldByName('Branch_No').ASInteger;
                        dtmdlAllStock.qryGetCustName.Open;
                        STPrtMntDetsMultiFrm.CustNameEdit.Text := dtmdlAllStock.qryGetCustName.fieldByName('Cust_Name').AsString+'/'+
                                                                  dtmdlAllStock.qryGetCustName.FieldByName('Branch_Name').AsString;
                        STPrtMntDetsMultiFrm.CustNameToEdit.Text := dtmdlAllStock.qryGetCustName.fieldByName('Cust_Name').AsString+'/'+
                                                                  dtmdlAllStock.qryGetCustName.FieldByName('Branch_Name').AsString;
                      end;
                  end;
                STPrtMntDetsMultiFrm.showmodal;
                if STPrtMntDetsMultiFrm.bOK = false then
                  exit;
                bTempCalcList := False ;
                bTempCalcCat := False ;
                sTempPurchPrice := 'Part.Part_Purchase_Price' ;
                sTempListMU := '.Part.Part_Mark_Up_List' ;
                sTempCatMU := 'Part.Part_Mark_Up_Cat' ;
                sTempPurchPack := 'Part.Purch_Pack_Quantity' ;
                sTempSellPack := 'Part.Sell_Pack_Quantity' ;

                with dtmdlAllStock.qryUpdMulti do
                  begin
                    bSQLAdd := True ;

                    SQL.Clear;
                    SQL.Add('Update Part') ;
                    SQL.Add('Set Part_Updated = Part_Updated ') ;
                  end;

                if (STPrtMntDetsMultiFrm.CustNameEdit.text <> STPrtMntDetsMultiFrm.CustNameToEdit.Text) then
                  begin
                    if STPrtMntDetsMultiFrm.CustNameToEdit.Text = '' then
                      begin
                        MultiSQLAdd('Customer = null', dtmdlAllStock.qryUpdMulti );
                        MultiSQLAdd('Branch_No = null', dtmdlAllStock.qryUpdMulti);
                      end
                    else
                      begin
                        MultiSQLAdd('Customer = '+inttostr(STPrtMntDetsMultiFrm.selcust), dtmdlAllStock.qryUpdMulti);
                        MultiSQLAdd('Branch_No = '+inttostr(STPrtMntDetsMultiFrm.selBranch), dtmdlAllStock.qryUpdMulti);
                    end;
                  end;

                {Part Group}
                if (STPrtMntDetsMultiFrm.PartGroupToDBLookupComboBox.text <> '') then
                  MultiSQLAdd('Part_Group = ' + IntToStr(STPrtMntDetsMultiFrm.PartGroupToDBLookupComboBox.KeyValue), dtmdlAllStock.qryUpdMulti)
                else
                if STPrtMntDetsMultiFrm.bgroupcleared then
                  MultiSQLAdd('Part_Group = null', dtmdlAllStock.qryUpdMulti) ;

                {Product Type}
                if (STPrtMntDetsMultiFrm.PartTypeToDBLookupComboBox.text <> '') then
                  MultiSQLAdd('Product_Type = ' + IntToStr(STPrtMntDetsMultiFrm.PartTypeToDBLookupComboBox.KeyValue), dtmdlAllStock.qryUpdMulti)
                else
                if STPrtMntDetsMultiFrm.bTypecleared then
                  MultiSQLAdd('Product_Type = null', dtmdlAllStock.qryUpdMulti) ;

                {VAT Code}
                if (STPrtMntDetsMultiFrm.VATToDBLookupComboBox.text <> '') then
                  MultiSQLAdd('VAT_code = ' + IntToStr(STPrtMntDetsMultiFrm.VATToDBLookupComboBox.KeyValue), dtmdlAllStock.qryUpdMulti) ;

                if (STPrtMntDetsMultiFrm.dblkpPriceUnitTo.text <> '') then
                  MultiSQLAdd('Price_unit = ' + IntToStr(STPrtMntDetsMultiFrm.dblkpPriceUnitTo.KeyValue), dtmdlAllStock.qryUpdMulti)
                else
                  if STPrtMntDetsMultiFrm.bpricecleared then
                    MultiSQLAdd('Price_unit = null', dtmdlAllStock.qryUpdMulti);

                if (STPrtMntDetsMultiFrm.PurchPackQtyToSpinEdit.Text <> '') then
                  begin
                    sTempPurchPack := STPrtMntDetsMultiFrm.PurchPackQtyToSpinEdit.Text ;
                    bTempCalcList := True ;
                    bTempCalcCat := True ;
                    MultiSQLAdd('Purch_Pack_Quantity = ' + STPrtMntDetsMultiFrm.PurchPackQtyToSpinEdit.Text, dtmdlAllStock.qryUpdMulti) ;
                  end;

                if (STPrtMntDetsMultiFrm.SellPackQtyToSpinEdit.Text <> '') then
                  begin
                    sTempSellPack := STPrtMntDetsMultiFrm.SellPackQtyToSpinEdit.Text ;
                    bTempCalcList := True ;
                    bTempCalcCat := True ;
                    MultiSQLAdd('Sell_Pack_Quantity = ' + STPrtMntDetsMultiFrm.SellPackQtyToSpinEdit.Text, dtmdlAllStock.qryUpdMulti);
                  end;

                if (STPrtMntDetsMultiFrm.PurchPriceToMemo.Text <> '') then
                  begin
                    MultiSQLAdd('Part_Purchase_Price = ' + STPrtMntDetsMultiFrm.PurchPriceToMemo.Text, dtmdlAllStock.qryUpdMulti) ;
                    sTempPurchPrice := STPrtMntDetsMultiFrm.PurchPriceToMemo.Text ;
                    bTempCalcList := True ;
                    bTempCalcCat := True ;
                  end;

                if (STPrtMntDetsMultiFrm.ListMUToMemo.Text <> '') then
                  begin
                    MultiSQLAdd('Part_Mark_Up_List = ' + STPrtMntDetsMultiFrm.ListMUToMemo.Text, dtmdlAllStock.qryUpdMulti) ;
                    sTempListMU := STPrtMntDetsMultiFrm.ListMUToMemo.Text ;
                    bTempCalcList := True ;
                  end;

                if (STPrtMntDetsMultiFrm.CatMUToMemo.Text <> '') then
                  begin
                    MultiSQLAdd('Part_Mark_Up_Cat = ' + STPrtMntDetsMultiFrm.CatMUToMemo.Text, dtmdlAllStock.qryUpdMulti) ;
                    sTempCatMU := STPrtMntDetsMultiFrm.CatMUToMemo.Text ;
                    bTempCalcCat := True ;
                  end;

                if bTempCalcList then
                  begin
                    {Need to re-calculate the LIST price} ;
                    MultiSQLAdd('Part_Cost_List = (' + sTempPurchPrice + ' * ' + sTempSellPack + ' * (1 + (' +
                                            sTempListMU + ' / 100.00)) / ' + sTempPurchPack + ' ) ', dtmdlAllStock.qryUpdMulti) ;
                  end;

                if bTempCalcCat then
                  begin
                    {Need to re-calculate the CAT price} ;
                    MultiSQLAdd('Part_Cost_Cat = (' + sTempPurchPrice + ' * ' + sTempSellPack + ' * (1 + (' +
                                            sTempCatMU + ' / 100.00)) / ' + sTempPurchPack + ' ) ', dtmdlAllStock.qryUpdMulti) ;
                  end;

                TempNotInUse := '';
                if (STPrtMntDetsMultiFrm.NotInUseToCheckBox.State <> cbGrayed) then
                  if STPrtMntDetsMultiFrm.NotInUseToCheckBox.Checked then
                    TempNotInUse := 'Y'
                  else
                    TempNotInUse := 'N';

                if (STPrtMntDetsMultiFrm.ChkBxToNumbrd.State <> cbGrayed) then
                  if STPrtMntDetsMultiFrm.ChkBxToNumbrd.Checked then
                    MultiSQLAdd('Numbered = ''Y''', dtmdlAllStock.qryUpdMulti)
                  else
                    MultiSQLAdd('Numbered = ''N''', dtmdlAllStock.qryUpdMulti) ;

                if (STPrtMntDetsMultiFrm.UseSNsToCheckBox.State <> cbGrayed) then
                  if STPrtMntDetsMultiFrm.UseSNsToCheckBox.Checked then
                    MultiSQLAdd('Track_Serial_No = ''Y''', dtmdlAllStock.qryUpdMulti)
                  else
                    MultiSQLAdd('Track_Serial_No = ''N''', dtmdlAllStock.qryUpdMulti) ;

                if (STPrtMntDetsMultiFrm.AutoUpdToCheckBox.State <> cbGrayed) then
                  if STPrtMntDetsMultiFrm.AutoUpdToCheckBox.Checked then
                    MultiSQLAdd('Auto_Update = ''Y''', dtmdlAllStock.qryUpdMulti)
                  else
                    MultiSQLAdd('Auto_Update = ''N''', dtmdlAllStock.qryUpdMulti) ;

                if STPrtMntDetsMultiFrm.rdGrpClassTo.ItemIndex = 0 then
                  MultiSQLAdd('Product_Class = ''STK''', dtmdlAllStock.qryUpdMulti)
                else
                if STPrtMntDetsMultiFrm.rdGrpClassTo.ItemIndex = 1 then
                  MultiSQLAdd('Product_Class = ''NSTK''', dtmdlAllStock.qryUpdMulti)
                else
                if STPrtMntDetsMultiFrm.rdGrpClassTo.ItemIndex = 2 then
                  MultiSQLAdd('Product_Class = ''SERV''', dtmdlAllStock.qryUpdMulti)
                else
                if STPrtMntDetsMultiFrm.rdGrpClassTo.ItemIndex = 3 then
                  MultiSQLAdd('Product_Class = ''POD''', dtmdlAllStock.qryUpdMulti);

                dtmdlAllStock.qryUpdMulti.SQL.Add(' Where Part = :Part') ;
                bTempAskDets := True ;
              finally
                STPrtMntDetsMultiFrm.free;
              end;

            end;
          {Run the update for each product selected}
          with dtmdlAllStock.qryUpdMulti do
            begin
              close ;
              ParamByName('Part').AsString := TempPart ;
              execSQL ;
            end;

          {Run the update of product Not_In_Use}
          if TempNotInUse <> '' then
            begin
              with dtmdlAllStock.qryUpdMultiPartInactive do
                begin
                  close ;
                  ParamByName('Part').AsString := TempPart ;
                  ParamByName('Not_In_Use').AsString := TempNotInUse ;
                  execSQL ;
                end;
            end;
        end;
        {Refresh the data and find the first product}
        dtmdlAllStock.Refreshdata;
        dbgDetails.datasource.DataSet.locate('Part', Variant(FirstPart),[lopartialKey]) ;
    end;
end;

procedure TfrmPBLUStock.MultiSQLAdd(sTempStr: String; tmpQuery: TFDQuery);
begin
  if bSQLAdd = False then
    begin
      tmpQuery.SQL.Add(sTempStr) ;
      bSQLAdd := True ;
    end
  else
    tmpQuery.SQL.Add(', ' + sTempStr)
end;

procedure TfrmPBLUStock.CallMultiSelection;
begin

end;

procedure TfrmPBLUStock.btnStockLevelsClick(Sender: TObject);
begin
  frmSTLUProductLvls := TfrmSTLUProductLvls.create(self);
  try
    frmSTLUProductLvls.sPart := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    frmSTLUProductLvls.showmodal;
  finally
    frmSTLUProductLvls.free;
  end;
end;

procedure TfrmPBLUStock.btnMovementsClick(Sender: TObject);
begin
  try
    with dtmdlAllStock.qryPartMvmnts do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkMvmntsFrm := TSTLUStkMvmntsFrm.Create(self);
    STLUStkMvmntsFrm.dtmdlStockEnquiry := dtmdlAllStock;

    if dtmdlAllStock.qryPartMvmnts.RecordCount = 0 then
    begin
      MessageDlg('There are no movements for this product', mtInformation, [mbOk], 0);
      dtmdlAllStock.qryPartMvmnts.close;
      exit;
    end;

    STLUStkMvmntsFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkMvmntsFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;
    STLUStkMvmntsFrm.lblTotalStock.Caption := formatfloat('#,##0',dbgDetails.dataSource.DataSet.FieldByName('store_qty').Asfloat);
    STLUStkMvmntsFrm.lblFreeStock.Caption := formatfloat('#,##0',dbgDetails.dataSource.DataSet.FieldByName('qty_free').Asfloat);

    STLUStkMvmntsFrm.ShowModal;
  finally
    STLUStkMvmntsFrm.Free;
  end;
  dtmdlAllStock.qryPartMvmnts.close;
end;

procedure TfrmPBLUStock.btnLocationsClick(Sender: TObject);
var
  TempPart: string;
begin
  TempPart := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
  try
    with dtmdlAllStock.qryPartStoreBins do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkLocFrm := TSTLUStkLocFrm.Create(self);
    STLUStkLocFrm.dtmdlStockEnquiry := dtmdlAllStock;

    if dtmdlAllStock.qryPartStoreBins.RecordCount = 0 then
    begin
      MessageDlg('No stock exists for this product', mtInformation, [mbOk], 0);
      dtmdlAllStock.qryPartStoreBins.close;
      exit;
    end;

    STLUStkLocFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkLocFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkLocFrm.ShowModal;
    if STLUStkLocFrm.Changed then
      begin
        {Refresh the data and find the first product}
        dtmdlAllStock.Refreshdata;
        dbgDetails.datasource.DataSet.locate('Part', Variant(TempPArt),[lopartialKey]) ;
      end;
  finally
    STLUStkLocFrm.Free;
  end;
end;

procedure TfrmPBLUStock.btnProductionClick(Sender: TObject);
begin
  try
    with dtmdlAllStock.qryPartProduction do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkProductionFrm := TSTLUStkProductionFrm.Create(self);
    STLUStkProductionFrm.dtmdlStockEnquiry := dtmdlAllStock;

    if dtmdlAllStock.qryPartProduction.RecordCount = 0 then
    begin
      MessageDlg('There are no production orders for this product', mtInformation, [mbOk], 0);
    end
    else
    begin
      STLUStkProductionFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      STLUStkProductionFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

      STLUStkProductionFrm.ShowModal;
    end;
  finally
    STLUStkProductionFrm.Free;
  end;
  dtmdlAllStock.qryPartProduction.close;
end;

procedure TfrmPBLUStock.btnPurchaseOrdersClick(Sender: TObject);
begin
  try
    with dtmdlAllStock.qryPartPOs do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkPurchasesFrm := TSTLUStkPurchasesFrm.Create(self);
    STLUStkPurchasesFrm.dtmdlStockEnquiry := dtmdlAllStock;

    if dtmdlAllStock.qryPartPOs.RecordCount = 0 then
    begin
      MessageDlg('There are no purchase orders for this product', mtInformation, [mbOk], 0);
    end
    else
    begin
      STLUStkPurchasesFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      STLUStkPurchasesFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

      STLUStkPurchasesFrm.ShowModal;
    end;
  finally
    STLUStkPurchasesFrm.Free;
  end;
  dtmdlAllStock.qryPartPOs.close;

end;

procedure TfrmPBLUStock.OpeningBalances1Click(Sender: TObject);
begin
  CallMoveScreen('O')

end;

procedure TfrmpbluStock.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  if dbgDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y' then
    begin
      MessageDlg('This product is inactive therefore no stock movements can be performed. Either re-activate the product or contact Client Services for further assistance.', mtInformation, [mbOk], 0);
      exit;
    end;

  tempPart := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;
    PBPartTransferFrm.edtFormReference.Text := dbgDetails.dataSource.DataSet.FieldByName('Form_Reference_ID').AsString;
    PBPartTransferFrm.Customer := dbgDetails.dataSource.DataSet.FieldByName('Customer').AsInteger;
    PBPartTransferFrm.sMoveType := TempMoveType ;
    PBPartTransferFrm.ShowModal;
    bTempOK := PBPartTransferFrm.bOK;
  finally
    PBPartTransferFrm.Free;
  end;
  dtmdlAllStock.Refreshdata;
  dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUStock.Adjustmentin1Click(Sender: TObject);
begin
  CallMoveScreen('A')

end;

procedure TfrmPBLUStock.Adjustmentout1Click(Sender: TObject);
begin
  CallMoveScreen('B')

end;

procedure TfrmPBLUStock.Transfers1Click(Sender: TObject);
begin
  CallMoveScreen('T')
end;

procedure TfrmPBLUStock.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUStock.btnSalesClick(Sender: TObject);
begin
  try
    with dtmdlAllStock.qryPartSales do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkSalesFrm := TSTLUStkSalesFrm.Create(self);
    STLUStkSalesFrm.dtmdlStockEnquiry := dtmdlAllStock;

    if dtmdlAllStock.qryPartSales.RecordCount = 0 then
    begin
      MessageDlg('There are no sales orders for this product', mtInformation, [mbOk], 0);
      dtmdlAllStock.qryPartSales.close;
      exit;
    end;

    STLUStkSalesFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkSalesFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkSalesFrm.ShowModal;
  finally
    STLUStkSalesFrm.Free;
  end;
  dtmdlAllStock.qryPartSales.close;
end;

procedure TfrmPBLUStock.btnLabelsClick(Sender: TObject);
begin
  STRSLabelsFrm := TSTRSLabelsFrm.create(self);
  try
    STRSLabelsfrm.Selcode := dbgDetails.datasource.DataSet.fieldbyname('Part').asstring;
    STRSLabelsfrm.SelName := dbgDetails.datasource.DataSet.fieldbyname('Description').asstring;
    STRSLabelsFrm.showmodal;
  finally
    STRSLabelsFrm.free;
  end;
end;

procedure TfrmPBLUStock.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUStock.Numbersequences1Click(Sender: TObject);
begin
 try
    with dtmdlAllStock.qryPartNumbers do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkNmbrFrm := TSTLUStkNmbrFrm.Create(self);
    STLUStkNmbrFrm.dtmdlStockEnquiry := dtmdlAllStock;

    if dtmdlAllStock.qryPartNumbers.RecordCount = 0 then
    begin
      MessageDlg('No numbers exists for this product', mtInformation, [mbOk], 0);
      dtmdlAllStock.qryPartNumbers.close;
      exit;
    end;

    STLUStkNmbrFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkNmbrFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkNmbrFrm.ShowModal;
  finally
    STLUStkNmbrFrm.Free;
  end;
end;

procedure TfrmPBLUStock.btnReportsClick(Sender: TObject);
begin
  frmPBLUStockRpts := TfrmPBLUStockRpts.create(self);
  try
    frmPBLUStockRpts.showmodal;
  finally
    frmPBLUStockRpts.free;
  end;
end;

procedure TfrmPBLUStock.FormActivate(Sender: TObject);
begin
  iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuStock') ;
  chkbxShowStocked.checked := bShowOnlyStock;
  chkbxShowPositiveStock.checked := bShowPositiveStock;
  dtmdlAllStock.ShowOnlyStock := chkbxShowStocked.checked;
  dtmdlAllStock.ShowPositiveStock := chkbxShowPositiveStock.checked;
  dtmdlAllStock.refreshdata;
  dbgDetails.datasource.DataSet.locate('Part', Variant(ActiveCode),[lopartialKey]) ;
end;

procedure TfrmPBLUStock.btnMaintainClick(Sender: TObject);
var
  tempPart: string;
begin
  temppart := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
  STStkEnqFrm := TSTStkEnqFrm.Create(Self);
  try
    STStkEnqFrm.Part := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    STStkEnqFrm.ShowModal;
  finally
    STStkEnqFrm.Free;
  end;
  dtmdlAllStock.Refreshdata;
  dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
end;

procedure TfrmPBLUStock.EnterStockCount1Click(Sender: TObject);
begin
STStkTkSelFrm := TSTStkTkSelFrm.Create(Self);
  try
    STStkTkSelFrm.fMaintmode := 'E';
    STStkTkSelFrm.ShowModal;
  finally
    STStkTkSelFrm.Free;
  end;
end;

procedure TfrmPBLUStock.StockCountValuation1Click(Sender: TObject);
begin
STStkTkSelFrm := TSTStkTkSelFrm.Create(Self);
  try
    STStkTkSelFrm.fMaintmode := 'R';
    STStkTkSelFrm.bIs_VariancePrint := False;
    STStkTkSelFrm.ShowModal;
  finally
    STStkTkSelFrm.Free;
  end;
end;

procedure TfrmPBLUStock.StockCountVarianceReport1Click(Sender: TObject);
begin
STStkTkSelFrm := TSTStkTkSelFrm.Create(Self);
  try
    STStkTkSelFrm.fMaintmode := 'R';
    STStkTkSelFrm.bIs_VariancePrint := True;
    STStkTkSelFrm.ShowModal;
  finally
    STStkTkSelFrm.Free;
  end;
end;

procedure TfrmPBLUStock.chkbxShowInactiveClick(Sender: TObject);
begin
  if chkbxShowInactive.Checked then
    dtmdlAllStock.NotInUse := 'Y'
  else
    dtmdlAllStock.NotInUse := 'N';
  dtmdlAllStock.Refreshdata;
end;

procedure TfrmPBLUStock.FormDeactivate(Sender: TObject);
begin
  try
    ActiveCode := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
  except
    Activecode := '';
  end;
end;

procedure TfrmPBLUStock.Exit1Click(Sender: TObject);
begin
  frmpbMainMenu.miExitClick(self);
end;

procedure TfrmPBLUStock.SupplierProducts1Click(Sender: TObject);
var
  STProdImportFrm: TSTProdImportFrm;
begin

  STProdImportFrm := TSTProdImportFrm.Create(Self);
  STProdImportFrm.ShowModal;

  STProdImportFrm.Free;
end;

procedure TfrmPBLUStock.ACustomerProducts1Click(Sender: TObject);
var
  STProdImportCustFrm: TSTProdImportCustFrm;
begin

  STProdImportCustFrm := TSTProdImportCustFrm.Create(Self);
  try
    STProdImportCustFrm.ShowModal;
  finally
    STProdImportCustFrm.Free;
  end;
end;

procedure TfrmPBLUStock.CustomerProducts1Click(Sender: TObject);
var
  STProdImportAllCustFrm: TSTProdImportAllCustFrm;
begin

  STProdImportAllCustFrm := TSTProdImportAllCustFrm.Create(Self);
  try
    STProdImportAllCustFrm.ShowModal;
  finally
    STProdImportAllCustFrm.Free;
  end;
end;

procedure TfrmPBLUStock.btnDeleteClick(Sender: TObject);
begin
  if dtmdlAllStock.CanDeleteProduct(dbgDetails.DataSource.DataSet.fieldbyname('Part').asstring) then
    CallMaintScreen('D')
  else
    MessageDlg('Unable to delete, stock movements have been recorded for this product', mtInformation, [mbOk], 0);
end;

procedure TfrmPBLUStock.btnReceiptsClick(Sender: TObject);
begin
  CallMoveScreen('O')
end;

procedure TfrmPBLUStock.btnAdjustInClick(Sender: TObject);
begin
  CallMoveScreen('A')
end;

procedure TfrmPBLUStock.btnAdjustOutClick(Sender: TObject);
begin
  CallMoveScreen('B')
end;

procedure TfrmPBLUStock.btnTransfersClick(Sender: TObject);
begin
  CallMoveScreen('T')
end;

procedure TfrmPBLUStock.chkbxShowStockedClick(Sender: TObject);
begin
  bShowOnlyStock := chkbxShowStocked.Checked;
  dtmdlAllStock.ShowOnlyStock := chkbxShowStocked.Checked;
  dtmdlAllStock.Refreshdata;
end;

procedure TfrmPBLUStock.SearchBin1Click(Sender: TObject);
begin
  frmSTLUStockLocations := TfrmSTLUStockLocations.Create(self);

  try
//    frmSTLUStockLocations.dtmdlStockBins := dtmdlAllStock;
    frmSTLUStockLocations.ShowModal;
  finally
    frmSTLUStockLocations.Free;
  end;
end;

procedure TfrmPBLUStock.btnOversClick(Sender: TObject);
begin
  if dbgDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y' then
    begin
      MessageDlg('This product is inactive therefore no stock movements can be performed. Either re-activate the product or contact Client Services for further assistance.', mtInformation, [mbOk], 0);
      exit;
    end;

  if dtmdlAllStock.OversCanExist(dbgDetails.dataSource.DataSet.FieldByName('Part').AsString) then
    CallMoveScreen('P')
  else
    begin
      messagedlg('This product has never been requested for production, therefore no overs should exist!', mtError, [mbOk], 0);
      exit;
    end;
end;

procedure TfrmPBLUStock.StockLevels1Click(Sender: TObject);
begin
  PBLUPartBOMfrm := TPBLUPartBOMfrm.create(self);
  try
    PBLUPartBOMfrm.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBLUPartBOMfrm.Part := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    PBLUPartBOMfrm.Description := dbgDetails.datasource.dataset.fieldbyname('Description').asstring;
    PBLUPartBOMfrm.showmodal;
  finally
    PBLUPartBOMfrm.free;
  end;
end;

procedure TfrmPBLUStock.Excel1Click(Sender: TObject);
begin
  frmpbMainMenu.miExcelClick(self);
end;

procedure TfrmPBLUStock.AssociateSuppliers1Click(Sender: TObject);
begin
  STMntPrtSuppFrm := TSTMntPrtSuppFrm.Create(Self);
  try
    STMntPrtSuppFrm.iNoParts := 1;
    STMntPrtSuppFrm.sSelPart := dbgDetails.DataSource.DataSet.fieldbyname('Part').asstring;
    STMntPrtSuppFrm.sSelDescr := dbgDetails.DataSource.DataSet.FieldByName('Description').AsString;
    STMntPrtSuppFrm.ShowModal;
  finally
    STMntPrtSuppFrm.Free;
  end;
end;

procedure TfrmPBLUStock.SupplierDiscounts1Click(Sender: TObject);
begin
  STLUSuppPrtfrm := TSTLUSuppPrtFrm.create(self);
  try
    STLUSuppPrtfrm.Selcode := dbgDetails.DataSource.DataSet.fieldbyname('Part').asstring;
    STLUSuppPrtfrm.SelName := dbgDetails.DataSource.DataSet.FieldByName('Description').AsString;
    STLUSuppPrtfrm.showmodal;
  finally
    STLUSuppPrtfrm.free;
  end;
end;

procedure TfrmPBLUStock.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
VAR
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
  TempRect := Rect;
  if (dbgDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'STK') then
    begin
      if (dbgDetails.datasource.dataset.fieldbyname('Store_Qty').asinteger < dbgDetails.datasource.dataset.fieldbyname('Reorder_Level').asinteger) then
        (Sender as TDBGrid).Canvas.font.color := clRed;
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'NSTK') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clYellow;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'SERV') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'POD') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clBlue;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'In Stock') and
      (Column.Title.Caption <> 'Allocated') and
      (Column.Title.Caption <> 'Free Stock') and
      (Column.Title.Caption <> 'Paid for') and
      (Column.Title.Caption <> 'Unpaid') and
      (Column.Title.Caption <> 'On Buy Print') and
      (Column.Title.Caption <> 'Maximum') and
      (Column.Title.Caption <> 'Minimum') and
      (Column.Title.Caption <> 'In Production') and
      (Column.Title.Caption <> 'Reorder') and
      (Column.Title.Caption <> 'Forward') and
      (Column.Title.Caption <> 'Unallocated SO') and
      (Column.Title.Caption <> 'Future Stock') and
      (Column.Title.Caption <> 'On Purchase') then
  	begin
      StrPCopy(txt, Column.field.text);
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		StrPCopy(Txt, Column.field.text);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmPBLUStock.btnUsageClick(Sender: TObject);
var
  tempPart: string;
begin
  tempPart := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
  STMaintStockUsageFrm := TSTMaintStockUsageFrm.Create(self);
  try
    STMaintStockUsageFrm.ShowModal;
    if STMaintStockUsagefrm.bOK then
      begin
        dtmdlAllStock.Refreshdata;
        dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    STMaintStockUsageFrm.Free;
  end;
end;

procedure TfrmPBLUStock.btnReturnsClick(Sender: TObject);
var
  tempPart: string;
begin
  tempPart := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
  STMaintStockReturnsFrm := TSTMaintStockReturnsFrm.Create(self);
  try
    STMaintStockReturnsFrm.ShowModal;
    if STMaintStockReturnsFrm.bOK then
      begin
        dtmdlAllStock.Refreshdata;
        dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    STMaintStockReturnsFrm.Free;
  end;
end;

procedure TfrmPBLUStock.SwitchUser1Click(Sender: TObject);
begin
  frmpbMainMenu.miSwitchUserClick(self);
end;

procedure TfrmPBLUStock.btnCustomerCodesClick(Sender: TObject);
begin
  STLUCustPartFrm := TSTLUCustPartFrm.create(self);
  try
    STLUCustPartFrm.Selcode := dbgDetails.DataSource.DataSet.fieldbyname('Part').asstring;
    STLUCustPartFrm.SelName := dbgDetails.DataSource.DataSet.FieldByName('Description').AsString;
    STLUCustPartFrm.showmodal;
  finally
    STLUCustPartFrm.free;
  end;
end;

procedure TfrmPBLUStock.QuantitiesandPrices1Click(Sender: TObject);
begin
  STMaintProductQtyPricesFrm := TSTMaintProductQtyPricesFrm.create(self);
  try
    STMaintProductQtyPricesFrm.Selcode := dbgDetails.DataSource.DataSet.fieldbyname('Part').asstring;
    STMaintProductQtyPricesFrm.SelName := dbgDetails.DataSource.DataSet.FieldByName('Description').AsString;
    STMaintProductQtyPricesFrm.showmodal;
  finally
    STMaintProductQtyPricesFrm.free;
  end;

end;

procedure TfrmPBLUStock.BitBtn1Click(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmPBLUStock.chkbxShowPositiveStockClick(Sender: TObject);
begin
  if chkbxShowPositiveStock.Checked then
    dtmdlAllStock.ShowPositiveStock := true
  else
    dtmdlAllStock.ShowPositiveStock := false;
  dtmdlAllStock.Refreshdata;
end;

end.
