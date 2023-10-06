unit STMaintProduct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask, Spin, ComCtrls,
  Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSTMaintProduct = class(TForm)
    qryProduct: TFDQuery;
    qryPartGroup: TFDQuery;
    dtsPartGroup: TDataSource;
    dtsVatCode: TDataSource;
    qryVatCode: TFDQuery;
    qryCostUplift: TFDQuery;
    dtsCostUplift: TDataSource;
    qryPriceUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    qryGetCust: TFDQuery;
    qryDelPart: TFDQuery;
    qryUpPart: TFDQuery;
    qryAddPart: TFDQuery;
    qryCheckProductCode: TFDQuery;
    qryAddLevels: TFDQuery;
    qryUOM: TFDQuery;
    dtsUOM: TDataSource;
    qryProductTypes: TFDQuery;
    dtsProductTypes: TDataSource;
    qryUpStockRef: TFDQuery;
    qryUpFormRef: TFDQuery;
    qryDelPartLevels: TFDQuery;
    qryFSCClaim: TFDQuery;
    dtsFSCClaim: TDataSource;
    pgDetails: TPageControl;
    Panel1: TPanel;
    btnImage: TBitBtn;
    lblDelete: TLabel;
    btnOKSupp: TBitBtn;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    tsGeneral: TTabSheet;
    grpbxDetails: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    LblSlsNomCode: TLabel;
    LblPurchNom: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lblPrefix: TLabel;
    dblkpPartGroup: TDBLookupComboBox;
    edtCustomer: TEdit;
    edtDescription: TEdit;
    edtProductCode: TEdit;
    btnClearPartGroup: TBitBtn;
    btnPartGroup: TBitBtn;
    btnClearCustomer: TBitBtn;
    btnCustomer: TBitBtn;
    rdgrpClass: TRadioGroup;
    ChkBxNumbered: TCheckBox;
    dblkpVat: TDBLookupComboBox;
    memPurchPrice: TMemo;
    memPurchPackQty: TMemo;
    memSellPackQty: TMemo;
    memCatMArkup: TMemo;
    memCatPrice: TMemo;
    dblkpCostUplift: TDBLookupComboBox;
    MemCostUplift: TMemo;
    btnPriceUnit: TBitBtn;
    btnClearPriceUnit: TBitBtn;
    dblkpPriceUnit: TDBLookupComboBox;
    chkbxNotinUse: TCheckBox;
    VatMaintBitBtn: TBitBtn;
    dblkpUOM: TDBLookupComboBox;
    btnUOM: TBitBtn;
    btnClearUOM: TBitBtn;
    dblkpProductType: TDBLookupComboBox;
    btnPType: TBitBtn;
    btnClearPType: TBitBtn;
    edtFormReference: TEdit;
    btnFormReference: TBitBtn;
    btnClearFormRef: TBitBtn;
    chkbxOrderOnline: TCheckBox;
    edtPurchaseNominal: TMaskEdit;
    edtSalesNominal: TMaskEdit;
    chkbxStockZero: TCheckBox;
    pnlFSCClaim: TPanel;
    lblFSCClaim: TLabel;
    lblFSCMix: TLabel;
    dblkpFSCClaim: TDBLookupComboBox;
    spnFSCMix: TSpinEdit;
    btnClearClaim: TBitBtn;
    chkbxHasBOM: TCheckBox;
    tsBOM: TTabSheet;
    pnlComponents: TPanel;
    qryGetBOM: TFDQuery;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    dbgComponents: TDBGrid;
    dtsGetBOM: TDataSource;
    qryGetProductType: TFDQuery;
    chkbxGlobalProduct: TCheckBox;
    qryDelStoreStockSN: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnOKSuppClick(Sender: TObject);
    procedure edtProductCodeExit(Sender: TObject);
    procedure rdgrpClassClick(Sender: TObject);
    procedure memPurchPriceChange(Sender: TObject);
    procedure memPurchPriceKeyPress(Sender: TObject; var Key: Char);
    procedure memSellPackQtyKeyPress(Sender: TObject; var Key: Char);
    procedure CheckOK(Sender: TObject);
    procedure SaveMemoField(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQuantity(Sender: TObject);
    procedure memCatPriceChange(Sender: TObject);
    procedure btnClearCustomerClick(Sender: TObject);
    procedure btnClearPartGroupClick(Sender: TObject);
    procedure btnClearPriceUnitClick(Sender: TObject);
    procedure btnPriceUnitClick(Sender: TObject);
    procedure VatMaintBitBtnClick(Sender: TObject);
    procedure btnPartGroupClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearFormRefClick(Sender: TObject);
    procedure btnClearPTypeClick(Sender: TObject);
    procedure btnClearUOMClick(Sender: TObject);
    procedure btnFormReferenceClick(Sender: TObject);
    procedure btnImageClick(Sender: TObject);
    procedure edtProductCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClaimClick(Sender: TObject);
    procedure chkbxHasBOMClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgComponentsDblClick(Sender: TObject);
    procedure btnPTypeClick(Sender: TObject);
    procedure dblkpProductTypeClick(Sender: TObject);
  private
    sPrefix: string;
    FNumbered: boolean;
    function FormatMemoValue(TempQty, TempFormat, TempError: string;
      TempNeg: ByteBool): string;
    procedure CalcCatMarkup;
    procedure GetCustomerDetails(tempCust, tempBranch: integer);
    procedure ShowComponents;
    procedure CallMaintScreen(funcMode: string);
    procedure SetNumbered(const Value: boolean);
    { Private declarations }
  public
    sFuncMode: string;
    sPart: string;
    iCustomer, iBranch, iFormReference: integer;
    bOK: bytebool;
    sOldValue: string;
    property Numbered: boolean read FNumbered write SetNumbered;
  end;
var
  frmSTMaintProduct: TfrmSTMaintProduct;

implementation

uses UITypes, StMntPrtSupp, CCSCommon, PBLUPriceUnit, STLUPrtGrp, PBLUCust,
  pbluVatCode, STLUFormRef, CCSMaintProdImages, pbDatabase, pbMainMenu,
  PBMaintPartComponent, PBLUPrdTyp;

{$R *.DFM}

procedure TfrmSTMaintProduct.FormActivate(Sender: TObject);
begin

  qryFSCClaim.close;
  qryFSCClaim.open;

  qryPartGroup.close;
  qryPartGroup.open;

  qryVatCode.close;
  qryVatCode.open;

  qryProductTypes.close;
  qryProductTypes.open;

  qryUOM.close;
  qryUOM.open;

  qryCostUplift.close;
  qryCostUplift.open;

  qryPriceUnit.close;
  qryPriceUnit.open;

  edtCustomer.Enabled := (iCustomer = 0);
  btnCustomer.enabled := edtCustomer.Enabled;
  btnClearCustomer.enabled := edtCustomer.Enabled;

  pnlFSCClaim.Visible := dmBroker.UseFSCClaim;

  if sFuncMode = 'A' then
    Caption := 'Add a new product';
  if sFuncMode = 'C' then
    Caption := 'Change a product';
  if sFuncMode = 'D' then
    Caption := 'Delete a product';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    edtDescription.Text := '';
    edtProductCode.Text := '' ;
    edtCustomer.Text := '' ;
    if iCustomer <> 0 then
      begin
        iBranch := 0;
        GetCustomerDetails(iCustomer,iBranch);
      end
    else
      begin
        iCustomer := 0;
        iBranch := 0;
      end;
    memCatPrice.Text := '0.000' ;
    memPurchPrice.Text := '0.000' ;
    memCatMarkup.Text := '0.000';
    memPurchPackQty.Text := '1' ;
    memSellPackQty.Text := '1' ;
    dblkpVAT.KeyValue := dmBroker.GetCompanyVatCode ;
    dblkpPartGroup.KeyValue := 0 ;
    dblkpPriceUnit.KeyValue := 0 ;
    dblkpUOM.KeyValue := 0 ;
    dblkpProductType.KeyValue := 0 ;
    edtSalesNominal.Text := '';
    edtPurchaseNominal.Text := '';
    memCostUplift.Text := '0.00';
    rdgrpClass.itemindex := 0;
    edtFormReference.text := '';
    iFormReference := 0;
    edtProductCode.setfocus;
    tsBOM.TabVisible := false;
    Numbered := false;
  end
  else
  begin
    btnImage.enabled := true;
    with qryProduct do
    begin
      close;
      parambyname('Part').asstring := sPart;
      open;
      edtProductCode.Text := sPart;
      edtDescription.text := fieldbyname('Part_Description').asstring;
      iCustomer := FieldByName('Customer').AsInteger;
      iBranch := FieldByName('Branch_No').AsInteger;
      iFormReference := FieldByName('Form_Reference').Asinteger;
      edtFormReference.text := FieldByName('Form_Reference_ID').Asstring;
      memCatPrice.Text := FormatFloat('######0.000', FieldByName('Part_Cost_Cat').AsFloat);
      memPurchPrice.Text := FormatFloat('######0.000', FieldByName('Part_Purchase_Price').AsFloat);
      memCatMarkup.Text := FormatFloat('##0.00', FieldByName('Part_Mark_Up_Cat').AsFloat);
      memPurchPackQty.Text := FormatFloat('######0', FieldByName('Purch_Pack_Quantity').AsFloat);
      memSellPackQty.Text := FormatFloat('######0', FieldByName('Sell_Pack_Quantity').AsFloat);
      dblkpVAT.KeyValue := FieldByName('Vat_Code').AsInteger;
      ChkBxNumbered.Checked := FieldByName('Numbered').ASString = 'Y';
      Numbered := chkbxNumbered.checked;
      chkbxNotInUse.Checked := FieldByName('Not_In_Use').AsString = 'Y';
      chkbxStockZero.Checked := FieldByName('Inactive_When_Balance_Zero').AsString = 'Y';
      chkbxOrderOnline.Checked := FieldByName('Order_Part_Online').AsString = 'Y';
      chkbxGlobalProduct.Checked := FieldByName('Global_Product').AsString = 'Y';

      dblkpFSCClaim.KeyValue := fieldbyname('FSC_Material_Claim').asinteger;
      spnFSCMix.Value := round(fieldbyname('FSC_Mixed_Percentage').asfloat);

      if FieldByName('Product_Type').AsInteger = 0 then
        dblkpProductType.KeyValue := 0
      else
        dblkpProductType.KeyValue := FieldByName('Product_Type').AsInteger;

      if FieldByName('Unit_of_Measure').AsInteger = 0 then
        dblkpUOM.KeyValue := 0
      else
        dblkpUOM.KeyValue := FieldByName('Unit_of_Measure').AsInteger;

      if FieldByName('Part_Group').AsInteger = 0 then
        dblkpPartGroup.KeyValue := 0
      else
        dblkpPartGroup.KeyValue := FieldByName('Part_Group').AsInteger;

      if FieldByName('Price_Unit').AsInteger = 0 then
        dblkpPriceUnit.KeyValue := 0
      else
        dblkpPriceUnit.KeyValue := FieldByName('Price_Unit').AsInteger;

      if FieldByName('MarkUp_Type').AsString = '' then
        begin
          dblkpCostUplift.Keyvalue := 0;
          memCostUplift.Text := '0.00';
        end
      else
        dblkpCostUplift.KeyValue := FieldByName('Markup_Type').AsString;

      if FieldByName('MarkUp_Type').AsString = 'C' then
        memCostUpLift.Text := FormatFloat('#######0.00',FieldByName('MarkUp_Value').ASFloat)
      else
        if FieldByname('MarkUp_Type').AsString = 'V' then
          memCostUpLift.Text := FormatFloat('######0.00',FieldByName('MarkUp_Value').ASFloat);

      edtSalesNominal.Text := fieldbyName('Sales_Nominal').AsString;
      edtPurchaseNominal.Text := FieldByName('Purchase_Nominal').AsString;
      rdgrpClass.itemindex := 0;
      if fieldByName('Product_Class').AsString = 'NSTK' then
        rdgrpClass.itemindex := 1
      else
      if fieldByName('Product_Class').AsString = 'SERV' then
        rdgrpClass.itemindex := 2
      else
      if fieldByName('Product_Class').AsString = 'POD' then
        rdgrpClass.itemindex := 3
      else
      if fieldByName('Product_Class').AsString = 'STK' then
        rdgrpClass.itemindex := 0;

      if iCustomer <> 0 then
        begin
          GetCustomerDetails(iCustomer, iBranch)
         end;
      chkbxHasBOM.Checked := (fieldbyname('Part_Has_Children').asstring = 'Y');
      tsBOM.TabVisible := chkbxHasBOM.Checked;
    end;
//    edtDescription.setfocus;
  end;

  ShowComponents;

  {Enable or disable the buttons};
  grpbxDetails.Enabled := (sFuncMode <> 'D');
  lblDelete.Visible := (sFuncMode = 'D');
  btnOKSupp.Visible := (sFuncMode = 'A');
  edtProductCode.Enabled := (sFuncMode = 'A');

  chkbxStockZero.Enabled := dmBroker.OperatorCanDeactProduct(frmPBMainMenu.iOperator);
  chkbxNotinUse.Enabled := dmBroker.OperatorCanDeactProduct(frmPBMainMenu.iOperator);

  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TfrmSTMaintProduct.ShowComponents;
begin
  with qryGetBOM do
    begin
      close;
      parambyname('Part').asstring := sPart;
      open;

      btnChange.enabled := (recordcount > 0);
      btnDelete.Enabled := btnChange.enabled;
    end;
end;

procedure TfrmSTMaintProduct.CheckOK(Sender: TObject);
begin
  btnOK.Enabled := (edtDescription.Text <> '') and
    (memCatPrice.Text <> '') and
    (dblkpVat.text <> '') and
    (memPurchPackQty.Text <> '') and
    (memSellPackQty.Text <> '') and
    (memPurchPrice.Text <> '') and
    (memCostUplift.Text <> '') and
    (memCatMarkup.Text <> '');
  btnOKSupp.Enabled := btnOK.Enabled ;
end;

procedure TfrmSTMaintProduct.btnOKClick(Sender: TObject);
var
  ilength: integer;
  TempWord: Word;
begin

  if sFuncMode = 'A' then
  begin
    {Check the prefix is correct}
    if (rdgrpClass.itemindex = 0) or (rdgrpClass.itemindex = 3) then
      begin
        ilength := length(sPrefix);

        if (trim(edtCustomer.Text) = '') then
          begin
            TempWord := MessageDlg('A customer must be associated with a product, please select a customer for this product.',
                    mtError,[mbOk], 0);
            exit;
          end;

        if dmBroker.ProductPrefixRequired(iCustomer) then
          begin
            if (iLength = 0) and (edtCustomer.Text <> '') then
              begin
                TempWord := MessageDlg('The selected customer doesn''t have a product prefix, ensure that a product prefix is set up for this customer before continuing.',
                    mtError,[mbOk], 0);
                exit;
              end;

            if (trim(sPrefix) = trim(edtProductCode.Text)) then
              begin
                TempWord := MessageDlg('The product code cannot just be the customer product prefix, a code must follow the prefix',
                    mtError,[mbOk], 0);
                exit;
              end;

            if (copy(trim(edtProductCode.text),1,ilength) <> sPrefix) and (ilength > 0) then
              begin
                TempWord := MessageDlg('The product code prefix doesn''t match the customer product prefix, please amend the product code to incorporate the prefix, ' + sPrefix, mtError,
                  [mbYes], 0) ;
                exit;
              end;
          end;
      end;

    with qryAddPart do
    begin
      Close;
      ParamByName('Part').AsString := edtProductCode.Text;
      ParamByName('Part_Description').AsString := edtDescription.Text;
      ParamByName('Part_Cost_List').AsFloat := 0.00 ;
      ParamByName('Part_Cost_Cat').AsFloat := StrToFloatDef(memCatPrice.Text, 0, FormatSettings);
      ParamByName('VAT').AsInteger := dblkpVAT.KeyValue;
      if dblkpPartGroup.text = '' then
        ParamByName('Part_Group').Clear
      else
        ParamByName('Part_Group').AsInteger := dblkpPartGroup.KeyValue ;
      ParamByName('Part_Purchase_Price').AsFloat := StrToFloatDef(memPurchPrice.Text, 0, FormatSettings) ;
      ParamByName('Part_Mark_Up_List').AsFloat := StrToFloatDef('0.00', 0, FormatSettings) ;
      ParamByName('Part_Mark_Up_Cat').AsFloat := StrToFloatDef(memCatMarkup.Text, 0, FormatSettings) ;
      ParamByName('Purch_Pack_Quantity').AsFloat := StrToFloatDef(memPurchPackQty.Text, 0, FormatSettings) ;
      ParamByName('Sell_Pack_Quantity').AsFloat := StrToFloatDef(memSellPackQty.Text, 0, FormatSettings) ;
      ParamByName('Track_Serial_No').AsString := 'N';

      if ChkBxHasBOM.Checked then
        ParamByName('Part_Has_Children').AsString := 'Y'
      else
        ParamByName('Part_Has_Children').AsString := 'N';

      if ChkBxNumbered.Checked then
        ParamByName('Numbered').AsString := 'Y'
      else
        ParamByName('Numbered').AsString := 'N';
      ParamByName('Auto_Update').AsString := 'N';
      if chkbxNotInUse.Checked then
        ParamByName('Not_In_Use').AsString := 'Y'
      else
        ParamByName('Not_In_Use').AsString := 'N';
      if chkbxStockZero.Checked then
        ParamByName('Inactive_When_Balance_Zero').AsString := 'Y'
      else
        ParamByName('Inactive_When_Balance_Zero').AsString := 'N';

      if chkbxOrderOnline.Checked then
        ParamByName('Order_part_online').AsString := 'Y'
      else
        ParamByName('Order_part_online').AsString := 'N';

      if chkbxGlobalProduct.Checked then
        ParamByName('Global_Product').AsString := 'Y'
      else
        ParamByName('Global_Product').AsString := 'N';

      If dblkpPriceUnit.text = '' then
        ParamByName('Price_unit').Clear
      else
        ParamByName('Price_unit').AsInteger := dblkpPriceUnit.KeyValue;

      If dblkpProductType.text = '' then
        ParamByName('Product_Type').Clear
      else
        ParamByName('Product_Type').AsInteger := dblkpProductType.KeyValue;

      If dblkpUOM.text = '' then
        ParamByName('Unit_of_Measure').Clear
      else
        ParamByName('Unit_of_Measure').AsInteger := dblkpUOM.KeyValue;

      if iCustomer = 0 then
        begin
          ParamByName('Customer').clear;
          ParamByName('Branch').clear;
        end
      else
        begin
          ParamByName('Customer').AsInteger := iCustomer;
          ParamByName('Branch').AsInteger := iBranch;
        end;

      try
        parambyname('FSC_Material_Claim').asinteger := dblkpFSCClaim.keyvalue;
      except
        parambyname('FSC_Material_Claim').clear;
      end;

      Parambyname('FSC_Mixed_Percentage').asfloat := spnFSCMix.value;

      ParamByName('Sales_Nom').AsString := edtSalesNominal.Text;
      ParamByName('Purch_Nom').AsString := edtPurchaseNominal.Text;
      ParamByName('Markup_Type').clear;
      ParamBYName('MarkUp_Val').clear;
      if rdGrpClass.ItemIndex = 0 then
        ParamByName('Prod_Class').AsString := 'STK'
      else
      if rdGrpClass.ItemIndex = 1 then
        ParamByName('Prod_Class').AsString := 'NSTK'
      else
      if rdGrpClass.ItemIndex = 2 then
        ParamByName('Prod_Class').AsString := 'SERV'
      else
      if rdGrpClass.ItemIndex = 3 then
        ParamByName('Prod_Class').AsString := 'POD';

      if (rdGrpClass.ItemIndex = 1) and (dblkpCostUplift.text <> '') then
      begin
        ParamByName('MarkUp_Type').AsString := dblkpCostUplift.Keyvalue;
        ParamByName('MarkUp_Val').ASFloat := StrToFloatDef(memCostUplift.Text, 0, FormatSettings);
      end;

      Parambyname('Product_ID').asinteger := dmBroker.GetNextProductID;
      ExecSQL;
    end;
    with qryAddLevels do
      begin
      Close;
      Parambyname('Part').AsString := edtProductCode.Text;
      parambyname('Stock_Levels').asinteger := strtoint(memPurchPackQty.text);
      execsql;
      end;
  end;
  if sFuncMode = 'C' then
  begin
    {If made inactve and stock still exists then do not allow}
    if chkbxNotinUse.checked and dmBroker.DoesStockExist(edtProductCode.Text) then
      begin
        TempWord := MessageDlg('Stock exists for this product, you cannot make the product inactive', mtError,[mbOk], 0);
        exit;
      end;

    {Check if this item has been changed to not be numbered}
    if self.Numbered and not chkbxNumbered.checked then
      begin
        with qryDelStoreStockSN do
          begin
            close;
            parambyname('Part').asstring := edtProductCode.text;
            execsql;
          end;
      end
    else
    if not self.Numbered and chkbxNumbered.checked and dmBroker.DoesStockExist(edtProductCode.Text) then
      begin
        TempWord := MessageDlg('Stock exists for this product, in order to make this product numbered you must firstly adjust the stock out ' + #13 +
                                ' then make the product numbered and then adjust the stock back in.', mtError,[mbOk], 0);
        exit;
      end;

    {Update the product details}
    with qryUpPart do
    begin
      Close;
      ParamByName('Part').AsString := edtProductCode.Text;
      ParamByName('Part_Description').AsString := edtDescription.Text;
      ParamByName('Part_Cost_List').AsFloat := StrToFloatDef('0.00', 0, FormatSettings);
      ParamByName('Part_Cost_Cat').AsFloat := StrToFloatDef(memCatPrice.Text, 0, FormatSettings);
      ParamByName('VAT').AsInteger := dblkpVat.KeyValue;
      if dblkpPartGroup.text = '' then
        ParamByName('Part_Group').Clear
      else
        ParamByName('Part_Group').AsInteger := dblkpPartGroup.KeyValue ;
      ParamByName('Part_Purchase_Price').AsFloat := StrToFloatDef(memPurchPrice.Text, 0, FormatSettings) ;
      ParamByName('Part_Mark_Up_List').AsFloat := StrToFloatDef('0.00', 0, FormatSettings) ;
      ParamByName('Part_Mark_Up_Cat').AsFloat := StrToFloatDef(memCatMarkup.Text, 0, FormatSettings) ;
      ParamByName('Purch_Pack_Quantity').AsFloat := StrToFloatDef(memPurchPackQty.Text, 0, FormatSettings) ;
      ParamByName('Sell_Pack_Quantity').AsFloat := StrToFloatDef(memSellPackQty.Text, 0, FormatSettings) ;
      ParamByName('Track_Serial_No').AsString := 'N';
      if ChkBxNumbered.Checked then
        ParamByName('Numbered').AsString := 'Y'
      else
        ParamByName('Numbered').AsString := 'N';

      if ChkBxHasBOM.Checked then
        ParamByName('Part_Has_Children').AsString := 'Y'
      else
        ParamByName('Part_Has_Children').AsString := 'N';

      ParamByName('Auto_Update').AsString := 'N';
      if chkbxNotInUse.Checked then
        ParamByName('Not_In_Use').AsString := 'Y'
      else
        ParamByName('Not_In_Use').AsString := 'N';

      try
        parambyname('FSC_Material_Claim').asinteger := dblkpFSCClaim.keyvalue;
      except
        parambyname('FSC_Material_Claim').clear;
      end;

      Parambyname('FSC_Mixed_Percentage').asfloat := spnFSCMix.value;

      if chkbxStockZero.Checked then
        ParamByName('Inactive_When_Balance_Zero').AsString := 'Y'
      else
        ParamByName('Inactive_When_Balance_Zero').AsString := 'N';

      if chkbxOrderOnline.Checked then
        ParamByName('Order_part_online').AsString := 'Y'
      else
        ParamByName('Order_part_online').AsString := 'N';

      if chkbxGlobalProduct.Checked then
        ParamByName('Global_Product').AsString := 'Y'
      else
        ParamByName('Global_Product').AsString := 'N';

      If dblkpPriceUnit.text = '' then
        ParamByName('Price_unit').Clear
      else
        ParamByName('Price_unit').AsInteger := dblkpPriceUnit.KeyValue;

      If dblkpProductType.text = '' then
        ParamByName('Product_Type').Clear
      else
        ParamByName('Product_Type').AsInteger := dblkpProductType.KeyValue;

      If dblkpUOM.text = '' then
        ParamByName('Unit_of_Measure').Clear
      else
        ParamByName('Unit_of_Measure').AsInteger := dblkpUOM.KeyValue;

      if iCustomer = 0 then
        begin
          ParamByName('Customer').clear ;
          ParamByName('Branch').clear;
        end
      else
        begin
          ParamByName('Customer').AsInteger := iCustomer;
          ParamByName('Branch').AsInteger := iBranch;
        end;

      ParamByName('Sales_Nom').AsString := edtSalesNominal.Text;
      ParamByName('Purch_Nom').AsString := edtPurchaseNominal.Text;
      ParamByName('Markup_Type').clear;
      ParamBYName('MarkUp_Val').clear;

      if rdGrpClass.ItemIndex = 0 then
        ParamByName('Prod_Class').AsString := 'STK'
      else
      if rdGrpClass.ItemIndex = 1 then
        ParamByName('Prod_Class').AsString := 'NSTK'
      else
      if rdGrpClass.ItemIndex = 2 then
        ParamByName('Prod_Class').AsString := 'SERV'
      else
      if rdGrpClass.ItemIndex = 3 then
        ParamByName('Prod_Class').AsString := 'POD';

      if (rdgrpClass.ItemIndex = 1) and (dblkpCostUplift.KeyValue <> 0) then
      begin
        ParamByName('MarkUp_Type').AsString := dblkpCostUplift.Keyvalue;
        ParamByName('MarkUp_Val').ASFloat := StrToFloatDef(memCostUplift.Text, 0, FormatSettings);
      end;
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    // Delete the Part Stock Levels
    with qryDelPartLevels do
    begin
      Close;
      ParamByName('Part').AsString := edtProductCode.Text;
      ExecSQL;
    end;

    // Delete the Part
    with qryDelPart do
    begin
      Close;
      ParamByName('Part').AsString := edtProductCode.Text;
      ExecSQL;
    end;
  end;

  {If Form Reference allocated to Stock Reference then update form reference table}
  if (sFuncMode <> 'D') and (edtFormReference.text <> '') then
  begin
    with qryUpFormRef do
    begin
      Close;
      parambyname('Stock_Reference').asstring := edtProductCode.Text;
      execSQL;
    end;

    with qryUpStockRef do
    begin
      Close;
      parambyname('Form_Reference').asinteger := iFormReference;
      parambyname('Stock_Reference').asstring := edtProductCode.Text;
      execSQL;
    end;
  end;


  {If delete product or nothing in form reference then remove stock reference from Form Reference table}
  if (sFuncMode = 'D') or (edtFormReference.text = '') then
  begin
    with qryUpFormRef do
    begin
      Close;
      parambyname('Stock_Reference').asstring := edtProductCode.Text;
      execSQL;
    end;
  end;

  bOK := True;
  close;
end;

procedure TfrmSTMaintProduct.btnOKSuppClick(Sender: TObject);
begin
  {Accept the part and add suppliers} ;
  btnOKClick(self) ;

  if bOK <> true then exit;

  STMntPrtSuppFrm := TSTMntPrtSuppFrm.Create(Self);
  try
    STMntPrtSuppFrm.iNoParts := 1;
    STMntPrtSuppFrm.sSelPart := edtProductCode.Text;
    STMntPrtSuppFrm.sSelDescr := edtDescription.Text;
    STMntPrtSuppFrm.ShowModal;
  finally
    STMntPrtSuppFrm.Free;
  end;
end;

procedure TfrmSTMaintProduct.edtProductCodeExit(Sender: TObject);
begin
  if sFuncMode <> 'A' then
    exit ;
  With qryCheckProductCode do
    begin
      Close ;
      ParamByName('Part').AsString := edtProductCode.Text ;
      Open ;
      if RecordCount > 0 then
        begin
          MessageDlg('Product code already exists', mtError, [mbOK],0) ;
            edtProductCode.SetFocus ;
        end ;
    end;
end;

procedure TfrmSTMaintProduct.rdgrpClassClick(Sender: TObject);
begin
  chkbxnumbered.Enabled := rdGrpClass.itemindex = 0;
  dblkpCostUplift.Enabled := rdGrpClass.Itemindex <> 0;
  memCostUplift.Enabled := rdGrpClass.ItemIndex <> 0;
  if rdGrpClass.ItemIndex = 0 then
    begin
      memCostUplift.color := clBtnFace;
      dblkpCostUplift.Color := clBtnFace;
    end
  else
    begin
      memCostUplift.color := clwindow;
      dblkpCostUplift.Color := clwindow;
    end;
end;

procedure TfrmSTMaintProduct.memPurchPriceChange(Sender: TObject);
begin
  CalcCatMarkup;
  CheckOK(Self) ;
end;

procedure TfrmSTMaintProduct.CalcCatMarkup;
var
  rCatValue: real;
  rSellPrice, rPurchPrice: real;
  iSellPack, iPurchPack: integer;
begin
  if (trim(memPurchPrice.text) = '') or
     (trim(memCatPrice.text) = '') or
     (trim(memPurchPackQty.text) = '') or
     (trim(memSellPackQty.text) = '') then
     exit;

  iSellPack := strtoint(trim(memSellPackQty.text));
  iPurchPack := strtoint(trim(memPurchPackQty.text));

  rSellPrice := StrToFloatDef(memCatPrice.text, 0, FormatSettings);
  rPurchPrice := StrToFloatDef(memPurchPrice.text, 0, FormatSettings);

  if rSellPrice = 0 then
    memCatMarkup.Text := '0.00'
  else
    begin
      if rPurchPrice = 0 then
        memCatMarkup.Text := '100.00'
      else
        begin
          rCatValue := (((rSellPrice/iSellPack) - (rPurchPrice/iPurchPack))
                    /(rPurchPrice/iPurchPack)) * 100.;
          memCatMarkup.text := formatfloat('0.00',rCatValue);
        end;
    end;
end;

procedure TfrmSTMaintProduct.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

function TfrmSTMaintProduct.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
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
procedure TfrmSTMaintProduct.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmSTMaintProduct.ValidateQuantity(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmSTMaintProduct.memPurchPriceKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintProduct.memSellPackQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintProduct.memCatPriceChange(Sender: TObject);
begin
  CalcCatMarkup;
  CheckOK(Self) ;
end;

procedure TfrmSTMaintProduct.btnClearCustomerClick(Sender: TObject);
begin
  iCustomer := 0;
  iBranch := 0;
  edtCustomer.Text := '';
end;

procedure TfrmSTMaintProduct.btnClearPartGroupClick(Sender: TObject);
begin
  dblkpPartGroup.KeyValue := 0;
end;

procedure TfrmSTMaintProduct.btnClearPriceUnitClick(Sender: TObject);
begin
  dblkpPriceUnit.KeyValue := 0 ;
end;

procedure TfrmSTMaintProduct.btnPriceUnitClick(Sender: TObject);
begin
  PBLUPriceUnitfrm := TPBLUPriceUnitfrm.create(self);
  try
    PBLUPriceUnitFrm.bIs_Lookup := False;
    PBLUPriceUnitFrm.bAllow_Upd := True;
    PBLUPriceUnitfrm.showmodal;
  finally
    PBLUPriceUnitfrm.free
  end;
  With qryPriceUnit do
    begin
      Close ;
      Open ;
    end;
end;

procedure TfrmSTMaintProduct.VatMaintBitBtnClick(Sender: TObject);
begin
  PBLUVatCodefrm := TPBLUVatCodefrm.Create(self) ;
  try
    PBLUVatCodefrm.bIs_Lookup := False ;
    PBLUVatCodefrm.bAllow_Upd := True ;
    PBLUVatCodefrm.iSelCode := 0 ;
    PBLUVatCodefrm.ShowModal ;
  finally
    PBLUVatCodefrm.Free ;
  end;
  
  qryVatCode.Active := False;
  qryVatCode.Active := True;
end;

procedure TfrmSTMaintProduct.btnPartGroupClick(Sender: TObject);
begin
  STLUPrtGrpFrm := TSTLUPrtGrpFrm.Create(Self);
  try
    STLUPrtGrpFrm.bIs_LookUp := False ;
    STLUPrtGrpFrm.bAllow_Upd := True ;
    STLUPrtGrpFrm.ShowModal;
  finally
    STLUPrtGrpFrm.Free;
  end;
  qryPartGroup.Active := False;
  qryPartGroup.Active := True;
end;

procedure TfrmSTMaintProduct.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := True ;
    PBLUCustFrm.bSel_Branch := True ;
    PBLUCustFrm.SelCode := iCustomer;
    PBLUCustFrm.SelBranch := iBranch;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
      begin
        iCustomer := PBLUCustFrm.SelCode;
        iBranch := PBLUCustFrm.SelBranch;
        GetCustomerDetails(iCustomer, iBranch);
      end;
  finally
    PBLUCustFrm.Free;
  end;
  CheckOK(Self) ;
end;

procedure TfrmSTMaintProduct.GetCustomerDetails(tempCust, tempBranch: integer);
begin
  with qryGetCust do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch').asinteger := tempBranch;
      open;
      edtCustomer.Text := qryGetCust.fieldByName('Cust_Name').AsString+'/'+
            qryGetCust.FieldByName('Branch_Name').AsString;
      sPrefix := fieldbyname('Product_Code_prefix').asstring;

      if (sFuncMode = 'A') and (trim(edtProductCode.Text) = '') then
        begin
          edtProductCode.Text := sPrefix;
        end;
      lblPrefix.Caption := 'Prefix: ' + sPrefix;
    end;
end;

procedure TfrmSTMaintProduct.FormCreate(Sender: TObject);
begin
  {Set Nominal Code length}
  if dmBroker.GetAccountsPackage = 'SAGEMMS' then
    begin
      edtSalesNominal.editMask := '!00009999/AAA/AAA;0;_';
      edtSalesNominal.MaxLength := 16;

      edtPurchaseNominal.editMask := '!00009999/AAA/AAA;0;_';
      edtPurchaseNominal.MaxLength := 16;
    end
  else
    begin
      edtSalesNominal.editMask := '';
      edtSalesNominal.MaxLength := 8;

      edtPurchaseNominal.editMask := '';
      edtPurchaseNominal.MaxLength := 8;
    end;

  iCustomer := 0;
  iBranch := 0;
  sPrefix := '';
end;

procedure TfrmSTMaintProduct.btnClearFormRefClick(Sender: TObject);
begin
  edtFormReference.Text := '';
  iFormReference := 0;
end;

procedure TfrmSTMaintProduct.btnClearPTypeClick(Sender: TObject);
begin
  dblkpProductType.KeyValue := 0 ;
end;

procedure TfrmSTMaintProduct.btnClearUOMClick(Sender: TObject);
begin
  dblkpUOM.KeyValue := 0 ;
end;

procedure TfrmSTMaintProduct.btnFormReferenceClick(Sender: TObject);
begin
  frmSTLUFormRef := TfrmSTLUFormRef.create(self);
  try
    frmSTLUFormRef.bIs_LookUp := True ;
    frmSTLUFormRef.bAllow_Upd := True ;
    frmSTLUFormRef.iCust := iCustomer;

    frmSTLUFormRef.sProduct := edtProductCode.text;
    frmSTLUFormRef.sDescription := edtDescription.text;

    frmSTLUFormRef.sCustName := edtCustomer.text;
    frmSTLUFormRef.iBranch := iBranch;
    frmSTLUFormRef.SelCode := iFormReference;
    frmSTLUFormRef.showmodal;
    if frmSTLUFormRef.bSelected then
      begin
        edtFormReference.Text := frmSTLUFormRef.SelName;
        iFormReference := frmSTLUFormRef.SelCode;
      end;
  finally
    frmSTLUFormRef.free;
  end;
end;

procedure TfrmSTMaintProduct.btnImageClick(Sender: TObject);
var
  PartImagesFrm: TCCSMaintProdImagesFrm;
begin
  PartImagesFrm := TCCSMaintProdImagesFrm.Create(self);
  try
    PartImagesFrm.display(trim(edtProductCode.text));
  finally
    PartImagesFrm.Free;
  end;
end;

procedure TfrmSTMaintProduct.edtProductCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    ' ', '"', '''', '>', '<':     Key := #0;
  end;
end;

procedure TfrmSTMaintProduct.edtDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '"', '''', ',':     Key := #0;
  end;
end;

procedure TfrmSTMaintProduct.btnClearClaimClick(Sender: TObject);
begin
  dblkpFSCClaim.KeyValue := 0;
end;

procedure TfrmSTMaintProduct.chkbxHasBOMClick(Sender: TObject);
begin
  tsBOM.TabVisible := (Sender as Tcheckbox).checked;
//  pgDetails.ActivePage := tsGeneral;
end;

procedure TfrmSTMaintProduct.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmSTMaintProduct.CallMaintScreen(funcMode: string);
var
  iRow: integer;
begin

  PBMaintPartComponentFrm := TPBMaintPartComponentFrm.create(self);
  try
    if sFuncMode = 'A' then
      begin
        PBMaintPartComponentFrm.sPart := sPart;
        PBMaintPartComponentFrm.sProduct := '';
        PBMaintPartComponentFrm.iQuantity := 1;
      end
    else
      begin
        PBMaintPartComponentFrm.sPart := sPart;
        PBMaintPartComponentFrm.sProduct := dbgComponents.DataSource.DataSet.fieldbyname('Composite_Part').asstring;
        PBMaintPartComponentFrm.iQuantity := dbgComponents.DataSource.DataSet.fieldbyname('Quantity').asinteger;
        PBMaintPartComponentFrm.iElementNo := dbgComponents.DataSource.DataSet.fieldbyname('Element_No').asinteger;
      end;

    PBMaintPartComponentFrm.sFuncMode := FuncMode;
    PBMaintPartComponentFrm.showmodal;
    if PBMaintPartComponentFrm.bOK then
      begin
        ShowComponents;
        if PBMaintPartComponentFrm.sFuncMode <> 'D' then
          begin
            dbgComponents.DataSource.DataSet.Locate('Element_no', Variant(inttostr(PBMaintPartComponentFrm.iElementNo)),[lopartialKey]) ;
          end;
      end;
  finally
    PBMaintPartComponentFrm.free;
  end;
end;

procedure TfrmSTMaintProduct.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmSTMaintProduct.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TfrmSTMaintProduct.dbgComponentsDblClick(Sender: TObject);
begin
  if dbgComponents.DataSource.DataSet.FieldByName('Composite_Part').asstring <> '' then
    btnChangeClick(self);
end;

procedure TfrmSTMaintProduct.btnPTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      qryProductTypes.close;
      qryProductTypes.open;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
end;

procedure TfrmSTMaintProduct.dblkpProductTypeClick(Sender: TObject);
begin
  {If the default nominal level is Product Type then default the Nominal codes to the codes from the Product Type}
  if dmBroker.GetDefaultNominalLevel = 'PRODTYPE' then
    begin
      with qryGetProductType do
        begin
          close;
          parambyname('Product_Type').asinteger := dblkpProductType.keyvalue;
          open;

          if recordcount > 0 then
            begin
              edtSalesNominal.Text := fieldbyname('Nominal').asstring;
              edtPurchaseNominal.Text := fieldbyname('Purchase_Nominal').asstring;
            end;
        end;
    end;

  CheckOK(self);
end;

procedure TfrmSTMaintProduct.SetNumbered(const Value: boolean);
begin
  FNumbered := Value;
end;

end.
