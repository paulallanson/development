unit STPrtMnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, ImgList,
  ComCtrls, ToolWin, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPrtMntFrm = class(TForm)
    PartsDataSource: TDataSource;
    GridTimer: TTimer;
    GetPartsQuery: TFDQuery;
    GetPartQuery: TFDQuery;
    UpdMultiSQL: TFDQuery;
    DelSuppsQuery: TFDQuery;
    AddSuppsQuery: TFDQuery;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    AddBitBtn: TToolButton;
    ChangeBitBtn: TToolButton;
    DelBitBtn: TToolButton;
    ToolButton4: TToolButton;
    CloseBitBtn: TToolButton;
    HotImageList1: TImageList;
    CoolImageList1: TImageList;
    ToolBar2: TToolBar;
    SelectBitBtn: TToolButton;
    ToolButton2: TToolButton;
    SelAllBitBtn: TToolButton;
    SuppBitBtn: TToolButton;
    ToolButton1: TToolButton;
    HotImageList2: TImageList;
    CoolImageList2: TImageList;
    Panel2: TPanel;
    ShowAllCheckBox: TCheckBox;
    Panel3: TPanel;
    PartsDBGrid: TDBGrid;
    Label1: TLabel;
    CodeEdit: TEdit;
    StatusBar1: TStatusBar;
    ImportBitBtn: TToolButton;
    ToolButton5: TToolButton;
    SuppPartBitBtn: TToolButton;
    Label2: TLabel;
    EdtDesc: TEdit;
    GetCustNameSQL: TFDQuery;
    qryPartsOnSOs: TFDQuery;
    btbtnEComm: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure CodeEditChange(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
    procedure GridTimerTimer(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChangeBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(Sender: TObject);
    procedure PartsDBGridDblClick(Sender: TObject);
    procedure FindInGrid(TempPart: string);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure NoneBitBtnClick(Sender: TObject);
    procedure WriteGridSQL(Sender: TObject);
    procedure AddToDBGrid(TempFld, TempTitle: String; TempWidth: Integer);
    procedure ShowAllCheckBoxClick(Sender: TObject);
    procedure SuppBitBtnClick(Sender: TObject);
    procedure PartsDBGridCellClick(Column: TColumn);
    procedure ShowNoSelected(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelAllBitBtnClick(Sender: TObject);
    procedure MultiSQLAdd(sTempStr: String);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure PartsDataSourceDataChange(Sender: TObject; Field: TField);
    procedure CodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure ImportBitBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SuppPartBitBtnClick(Sender: TObject);
    procedure btbtnECommClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    sFuncType: string[1];
    iGridColCount: Integer ;
  public
    bIs_Lookup, bOK, bDontShowGrid, bMulti_Parts, bSQLAdd: ByteBool;
    sCode, SCodeDescr, sSupp, sSuppDescr, sFormRef: string;
    PurchPrice: real;
    Customer: integer;
    iStore_Type: Integer ;
    bService, bStocked: bytebool;
    bShowAll: bytebool;
  end;

var
  STPrtMntFrm: TSTPrtMntFrm;

implementation

uses UITypes, STPrtMntDetsMulti, STPrtMntDets, pbDatabase, StMntPrtSupp, STProdImport, STLUSuppPrt,
      STMaintPrtEComm, CCSCommon, pbMainMenu;

{$R *.DFM}

procedure TSTPrtMntFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  bDontShowGrid := False ;
  if not bIs_LookUp then
    Caption := 'Maintain Parts'
  else
  If bMulti_Parts then
    Caption := 'Select Parts'
  else
  if bService then
    Caption := 'Look-up a service item'
  else
    Caption := 'Look-up a Part';

  AddBitBtn.Visible := (not bIs_LookUp);
  ChangeBitBtn.Visible := (not bIs_LookUp);
  SuppPartBitBtn.Visible := (not bIs_LookUp);
  DelBitBtn.Visible := (not bIs_LookUp);
  SuppBitBtn.Visible := (not bIs_LookUp);
//
  ToolBar1.visible := (not bIs_LookUp);
  ToolBar2.visible := (bIs_LookUp);
  If bMulti_Parts then
    PartsDBGrid.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
  else
    PartsDBGrid.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit] ;
  if (bIs_LookUp) and (sCode <> '') then
       begin
       bDontShowGrid := True ;
       CodeEdit.Text := sCode ;
       bDontShowGrid := False ;
       end;
  SelAllBitBtn.Visible := bMulti_Parts ;
  ShowGrid(Self);
  If bMulti_Parts then
     ShowNoSelected(Self)
  else
     statusBar1.panels[0].text := '' ;
  if (bIs_LookUp) and (sCode <> '') then
    FindInGrid(sCode);
  CodeEdit.SetFocus ;
end;

procedure TSTPrtMntFrm.ShowGrid(Sender: TObject);
begin
  with GetPartsQuery do
  begin
    Close;
    (*If (CodeEdit.Text = '') and (DescrEdit.Text = '') and (GroupEdit.Text = '') and
       (PrimEdit.Text = '') and (ShowAllCheckBox.Checked = False) then *)
    If (CodeEdit.Text = '') and (EdtDesc.Text = '') and
        (ShowAllCheckBox.Checked = False) then
    begin
      StatusBar1.panels[1].text := 'Narrow the search';
      ChangeBitBtn.Enabled := False;
      SuppPartBitBtn.Enabled := False;
      DelBitBtn.Enabled := False;
      SelectBitBtn.Enabled := False;
      SuppBitBtn.Enabled := False;
      SelAllBitBtn.Enabled := False ;
      SuppBitBtn.Enabled := False;
      self.btbtnEComm.Enabled := false;
    end
    else
    begin
      WriteGridSQL(Self) ;
      Open;
      StatusBar1.panels[0].text := IntToStr(RecordCount) + ' parts shown';
      ChangeBitBtn.Enabled := RecordCount > 0;
      SuppPartBitBtn.Enabled := RecordCount > 0;
      DelBitBtn.Enabled := RecordCount > 0;
      SelectBitBtn.Enabled := RecordCount > 0;
      SuppBitBtn.Enabled := RecordCount > 0;
      SelAllBitBtn.Enabled := (RecordCount > 0) ;
      self.btbtnEComm.Enabled := (RecordCount > 0);
      if RecordCount = 1 then
      begin
        PartsDBGrid.SelectedRows.CurrentRowSelected := True ;
        (*if bIs_Lookup then
            SelectBitbtn.default
          else
            ChangeBitBtn.setfocus;*)
      end;
    end;
  end;
  ShowNoSelected(Self) ;
end;

procedure TSTPrtMntFrm.CodeEditChange(Sender: TObject);
begin
  GridTimer.Enabled := False;
  If bDontShowGrid = False then
     GridTimer.Enabled := True;
end;

procedure TSTPrtMntFrm.DescrEditChange(Sender: TObject);
begin
  GridTimer.Enabled := False;
  GridTimer.Enabled := True;
end;

procedure TSTPrtMntFrm.GridTimerTimer(Sender: TObject);
begin
  GridTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TSTPrtMntFrm.AddBitBtnClick(Sender: TObject);
begin
  sFuncType := 'A';
  CallMaintScreen(Self);
end;

procedure TSTPrtMntFrm.ChangeBitBtnClick(Sender: TObject);
Var
bTempAskDets, bTempCalcList, bTempCalcCat: ByteBool ;
iTempCount: Integer ;
TempPart, sTempPurchPrice, sTempListMU, sTempCatMU, sTempPurchPack, sTempSellPack: String ;
begin
If PartsDBGrid.SelectedRows.Count < 2 then
   begin
   {Change a single part}
   sFuncType := 'C';
   CallMaintScreen(Self);
   end
else
   begin
   {Change multiple parts} ;
   bTempAskDets := False ;
   For iTempCount := 0 to (PartsDBGrid.SelectedRows.Count - 1) do
       begin
       PartsDataSource.DataSet.GotoBookmark(TBookmark(PartsDBGrid.SelectedRows[iTempCount])) ;
       TempPart := PartsDataSource.DataSet.FieldByName('Part').AsString; ;
       If bTempAskDets = False then
          begin
          STPrtMntDetsMultiFrm := TSTPrtMntDetsMultiFrm.Create(Self);
          With GetPartQuery do
               begin
               Close ;
               ParamByName('Part').AsString := TempPart ;
               Open ;
               First ;
               STPrtMntDetsMultiFrm.iPartCount := PartsDBGrid.SelectedRows.Count ;
               STPrtMntDetsMultiFrm.PurchPriceMemo.Text := FormatFloat('######0.00',
                                                    FieldByName('Part_Purchase_Price').AsFloat);
               STPrtMntDetsMultiFrm.ListMUMemo.Text := FormatFloat('##0.00',
                                                FieldByName('Part_Mark_Up_List').AsFloat);
               STPrtMntDetsMultiFrm.CatMUMemo.Text := FormatFloat('##0.00',
                                               FieldByName('Part_Mark_Up_Cat').AsFloat);
               STPrtMntDetsMultiFrm.PurchPackQtySpinEdit.Value := FieldByName('Purch_Pack_Quantity').AsInteger;
               STPrtMntDetsMultiFrm.SellPackQtySpinEdit.Value := FieldByName('Sell_Pack_Quantity').AsInteger;
               STPrtMntDetsMultiFrm.VATDBLookUpComboBox.KeyValue :=
                                                   FieldByName('Vat_Code').AsInteger;
               STPrtMntDetsMultiFrm.AutoUpdCheckBox.Checked :=
                                                        FieldByName('Auto_Update').AsString = 'Y';
               STPrtMntDetsMultiFrm.NotInUseCheckBox.Checked :=
                                                         FieldByName('Not_In_Use').AsString = 'Y';
               STPrtMntDetsMultiFrm.UseSNsCheckBox.Checked :=
                                                         FieldByName('Track_Serial_No').AsString = 'Y';
               STPrtMntDetsMultiFrm.ChkBxNumbrd.Checked :=
                                                        FieldByName('Numbered').AsString = 'Y';
               If FieldByName('Part_Group').AsInteger = 0 then
                  STPrtMntDetsMultiFrm.PartGroupDBLookUpComboBox.KeyValue := 0
               else
                  STPrtMntDetsMultiFrm.PartGroupDBLookUpComboBox.KeyValue :=
                                                                      FieldByName('Part_Group').AsInteger;
               If FieldByName('Price_unit').AsInteger = 0 then
                  STPrtMntDetsMultiFrm.dblkpPriceUnit.KeyValue := 0
               else
                  STPrtMntDetsMultiFrm.dblkpPriceUnit.KeyValue := FieldByName('Price_unit').AsInteger;
               STPrtMntDetsMultiFrm.SelCust := FieldByName('Customer').AsInteger;
               STPrtMntDetsMultiFrm.SelBranch := FieldByName('Branch_No').AsInteger;
               if fieldByName('Customer').AsInteger <> 0 then
               begin
                GetCustNameSql.Close;
                GetCustNameSql.ParamByName('Customer').AsInteger :=
                  FieldByName('Customer').AsInteger;
                GetCustNameSQL.ParamByName('Branch').AsInteger :=
                  FieldByName('Branch_No').ASInteger;
                GetCustNameSQL.Open;
                STPrtMntDetsMultiFrm.CustNameEdit.Text := GetCustNameSQL.fieldByName('Cust_Name').AsString+'/'+
                GetCustNameSQL.FieldByName('Branch_Name').AsString;
                STPrtMntDetsMultiFrm.CustNameToEdit.Text := GetCustNameSQL.fieldByName('Cust_Name').AsString+'/'+
                GetCustNameSQL.FieldByName('Branch_Name').AsString;
              end;
            end;

          STPrtMntDetsMultiFrm.ShowModal ;
          If STPrtMntDetsMultiFrm.bOK = False then
             begin
             STPrtMntDetsMultiFrm.Free ;
             exit ;
             end;
             bTempCalcList := False ;
             bTempCalcCat := False ;
             sTempPurchPrice := 'Part.Part_Purchase_Price' ;
             sTempListMU := '.Part.Part_Mark_Up_List' ;
             sTempCatMU := 'Part.Part_Mark_Up_Cat' ;
             sTempPurchPack := 'Part.Purch_Pack_Quantity' ;
             sTempSellPack := 'Part.Sell_Pack_Quantity' ;
             UpdMultiSQL.SQL.Clear ;
             bSQLAdd := False ;
             UpdMultiSQL.SQL.Add('Update Part') ;
             UpdMultiSQL.SQL.Add('Set') ;
             if (STPrtMntDetsMultiFrm.CustNameEdit.text <> STPrtMntDetsMultiFrm.CustNameToEdit.Text) then
              begin
              if STPrtMntDetsMultiFrm.CustNameToEdit.Text = '' then
                begin
                  MultiSQLAdd('Customer = null');
                  MultiSQLAdd('Branch_No = Null');
                end
              else
                begin
                  MultiSQLAdd('Customer = '+inttostr(STPrtMntDetsMultiFrm.selcust));
                  MultiSQLAdd('Branch_No = '+inttostr(STPrtMntDetsMultiFrm.selBranch));
                end;
              end;
             If (STPrtMntDetsMultiFrm.PartGroupToDBLookupComboBox.KeyValue <> 0) then
                MultiSQLAdd('Part_Group = ' + IntToStr(STPrtMntDetsMultiFrm.PartGroupToDBLookupComboBox.KeyValue) )
             else
              if STPrtMntDetsMultiFrm.bgroupcleared then
                  MultiSQLAdd('Part_Group = null') ;
             If (STPrtMntDetsMultiFrm.VATToDBLookupComboBox.KeyValue <> 0) then
                MultiSQLAdd('VAT_code = ' + IntToStr(STPrtMntDetsMultiFrm.VATToDBLookupComboBox.KeyValue) ) ;
             If (STPrtMntDetsMultiFrm.dblkpPriceUnitTo.KeyValue <> 0) then
                MultiSQLAdd('Price_unit = ' + IntToStr(STPrtMntDetsMultiFrm.dblkpPriceUnitTo.KeyValue) )
             else
              if STPrtMntDetsMultiFrm.bpricecleared then
                  MultiSQLAdd('Price_unit = null');
             If (STPrtMntDetsMultiFrm.PurchPackQtyToSpinEdit.Text <> '') then
                begin
                sTempPurchPack := STPrtMntDetsMultiFrm.PurchPackQtyToSpinEdit.Text ;
                bTempCalcList := True ;
                bTempCalcCat := True ;
                MultiSQLAdd('Purch_Pack_Quantity = ' + STPrtMntDetsMultiFrm.PurchPackQtyToSpinEdit.Text) ;
                end;
             If (STPrtMntDetsMultiFrm.SellPackQtyToSpinEdit.Text <> '') then
                begin
                sTempSellPack := STPrtMntDetsMultiFrm.SellPackQtyToSpinEdit.Text ;
                bTempCalcList := True ;
                bTempCalcCat := True ;
                MultiSQLAdd('Sell_Pack_Quantity = ' + STPrtMntDetsMultiFrm.SellPackQtyToSpinEdit.Text) ;
                end;
             If (STPrtMntDetsMultiFrm.PurchPriceToMemo.Text <> '') then
                begin
                MultiSQLAdd('Part_Purchase_Price = ' + STPrtMntDetsMultiFrm.PurchPriceToMemo.Text) ;
                sTempPurchPrice := STPrtMntDetsMultiFrm.PurchPriceToMemo.Text ;
                bTempCalcList := True ;
                bTempCalcCat := True ;
                end;
             If (STPrtMntDetsMultiFrm.ListMUToMemo.Text <> '') then
                begin
                MultiSQLAdd('Part_Mark_Up_List = ' + STPrtMntDetsMultiFrm.ListMUToMemo.Text) ;
                sTempListMU := STPrtMntDetsMultiFrm.ListMUToMemo.Text ;
                bTempCalcList := True ;
                end;
             If (STPrtMntDetsMultiFrm.CatMUToMemo.Text <> '') then
                begin
                MultiSQLAdd('Part_Mark_Up_Cat = ' + STPrtMntDetsMultiFrm.CatMUToMemo.Text) ;
                sTempCatMU := STPrtMntDetsMultiFrm.CatMUToMemo.Text ;
                bTempCalcCat := True ;
                end;
             If bTempCalcList then
                begin
                {Need to re-calculate the LIST price} ;
                MultiSQLAdd('Part_Cost_List = (' + sTempPurchPrice + ' * ' + sTempSellPack + ' * (1 + (' +
                                            sTempListMU + ' / 100.00)) / ' + sTempPurchPack + ' ) ') ;
                end;
             If bTempCalcCat then
                begin
                {Need to re-calculate the CAT price} ;
                MultiSQLAdd('Part_Cost_Cat = (' + sTempPurchPrice + ' * ' + sTempSellPack + ' * (1 + (' +
                                            sTempCatMU + ' / 100.00)) / ' + sTempPurchPack + ' ) ') ;
                end;
             If (STPrtMntDetsMultiFrm.NotInUseToCheckBox.State <> cbGrayed) then
                If STPrtMntDetsMultiFrm.NotInUseToCheckBox.Checked then
                   MultiSQLAdd('Not_In_Use = ''Y''')
                else
                   MultiSQLAdd('Not_In_Use = ''N''') ;
            If (STPrtMntDetsMultiFrm.ChkBxToNumbrd.State <> cbGrayed) then
                If STPrtMntDetsMultiFrm.ChkBxToNumbrd.Checked then
                   MultiSQLAdd('Numbered = ''Y''')
                else
                   MultiSQLAdd('Numbered = ''N''') ;
             If (STPrtMntDetsMultiFrm.UseSNsToCheckBox.State <> cbGrayed) then
                If STPrtMntDetsMultiFrm.UseSNsToCheckBox.Checked then
                   MultiSQLAdd('Track_Serial_No = ''Y''')
                else
                   MultiSQLAdd('Track_Serial_No = ''N''') ;
             If (STPrtMntDetsMultiFrm.AutoUpdToCheckBox.State <> cbGrayed) then
                If STPrtMntDetsMultiFrm.AutoUpdToCheckBox.Checked then
                   MultiSQLAdd('Auto_Update = ''Y''')
                else
                   MultiSQLAdd('Auto_Update = ''N''') ;
             UpdMultiSQL.SQL.Add('Where Part = :Part') ;
          bTempAskDets := True ;
          STPrtMntDetsMultiFrm.Free ;
          end;
       With UpdMultiSQL do
          begin
          Close ;
          ParamByName('Part').AsString := TempPart ;
          ExecSQL ;
          end;
       end;
    ShowGrid(Self);
    if sFuncType <> 'D' then
      FindInGrid(TempPart);
  end ;
end;

procedure TSTPrtMntFrm.DelBitBtnClick(Sender: TObject);
begin
  sFuncType := 'D';
  CallMaintScreen(Self);
end;

procedure TSTPrtMntFrm.CallMaintScreen(Sender: TObject);
var
  bTempOK: ByteBool;
  TempPart: string;
begin
  STPrtMntDetsFrm := TSTPrtMntDetsFrm.Create(Self);
  try
  if sFuncType <> 'A' then
     begin
     TempPart := PartsDataSource.DataSet.FieldByName('Part').AsString; ;
     With GetPartQuery do
       begin
       Close ;
       ParamByName('Part').AsString := TempPart ;
       Open ;
       First ;
            begin
            STPrtMntDetsFrm.CodeEdit.Text := TempPart;
            STPrtMntDetsFrm.DescrEdit.Text :=
                FieldByName('Part_Description').AsString;
            STPrtMntDetsFrm.SelCust :=
                FieldByName('Customer').AsInteger;
            STPrtMntDetsFrm.SelBranch :=
                FieldByName('Branch_No').AsInteger;
//            STPrtMntDetsFrm.ListMemo.Text := FormatFloat('######0.00',
//                FieldByName('Part_Cost_List').AsFloat);
            STPrtMntDetsFrm.CatMemo.Text := FormatFloat('######0.00',
                FieldByName('Part_Cost_Cat').AsFloat);
            STPrtMntDetsFrm.PurchPriceMemo.Text := FormatFloat('######0.00',
                FieldByName('Part_Purchase_Price').AsFloat);
 //           STPrtMntDetsFrm.ListMUMemo.Text := FormatFloat('##0.00',
 //               FieldByName('Part_Mark_Up_List').AsFloat);
            STPrtMntDetsFrm.CatMUMemo.Text := FormatFloat('##0.00',
                FieldByName('Part_Mark_Up_Cat').AsFloat);
            STPrtMntDetsFrm.PurchPackQtyMemo.Text := FormatFloat('######0',
                FieldByName('Purch_Pack_Quantity').AsFloat);
            STPrtMntDetsFrm.SellPackQtyMemo.Text := FormatFloat('######0',
                FieldByName('Sell_Pack_Quantity').AsFloat);
            STPrtMntDetsFrm.VATDBLookUpComboBox.KeyValue :=
                FieldByName('Vat_Code').AsInteger;
{            STPrtMntDetsFrm.AutoUpdCheckBox.Checked :=
                FieldByName('Auto_Update').AsString = 'Y';    }
{            STPrtMntDetsFrm.UseSNsCheckBox.Checked :=
                FieldByName('Track_Serial_No').AsString = 'Y';    }
            StPrtMntDetsFrm.ChkBxNumbrd.Checked :=
                FieldByName('Numbered').ASString = 'Y';
            STPrtMntDetsFrm.NotInUseCheckBox.Checked :=
                FieldByName('Not_In_Use').AsString = 'Y';
            If FieldByName('Part_Group').AsInteger = 0 then
                STPrtMntDetsFrm.PartGroupDBLookUpComboBox.KeyValue := 0
            else
                STPrtMntDetsFrm.PartGroupDBLookUpComboBox.KeyValue :=
                       FieldByName('Part_Group').AsInteger;
            If FieldByName('Price_Unit').AsInteger = 0 then
                STPrtMntDetsFrm.dblkpPriceUnit.KeyValue := 0
            else
                STPrtMntDetsFrm.dblkpPriceUnit.KeyValue :=
                       FieldByName('Price_Unit').AsInteger;
            end;
            If FieldByName('MarkUp_Type').AsString = '' then
              begin
                STPrtMntDetsFrm.DBLUCmbBxCstUplft.Keyvalue := 0;
                STPrtMntDetsFrm.MemoUplift.Text := '0.00';
              end
            else
              STPrtMntDetsFrm.DBLUCmbBxCstUplft.KeyValue := FieldByName('Markup_Type').AsString;
            If FieldByName('MarkUp_Type').AsString = 'C' then
              STPrtMntDetsFrm.MemoUpLift.Text := FormatFloat('#######0.00',FieldByName('MarkUp_Value').ASFloat)
            else
              if FieldByname('MarkUp_Type').AsString = 'V' then
                STPrtMntDetsFrm.MemoUpLift.Text := FormatFloat('######0.00',FieldByName('MarkUp_Value').ASFloat);
            STPrtMntDetsFrm.EdtSlsNom.Text := fieldbyName('Sales_Nominal').AsString;
            STPrtMntDetsFrm.EdtPurchNom.Text := FieldByName('Purchase_Nominal').AsString;
            STPrtMntDetsFrm.RadGrpPrdClass.itemindex := 0;
            if fieldByName('Product_Class').AsString = 'NSTK' then
                STPrtMntDetsFrm.RadGrpPrdClass.itemindex := 1;
            if fieldByName('Product_Class').AsString = 'SERV' then
                STPrtMntDetsFrm.RadGrpPrdClass.itemindex := 2;
            if fieldByName('Product_Class').AsString = 'STK' then
                STPrtMntDetsFrm.RadGrpPrdClass.itemindex := 0;
         if fieldByName('Customer').AsInteger <> 0 then
         begin
          GetCustNameSql.Close;
          GetCustNameSql.ParamByName('Customer').AsInteger :=
              FieldByName('Customer').AsInteger;
          GetCustNameSQL.ParamByName('Branch').AsInteger :=
              FieldByName('Branch_No').ASInteger;
          GetCustNameSQL.Open;
          STPrtMntDetsFrm.CustNameEdit.Text := GetCustNameSQL.fieldByName('Cust_Name').AsString+'/'+
            GetCustNameSQL.FieldByName('Branch_Name').AsString;
         end;
       end;
     end
  else
     begin
             {Adding a new product} ;
            STPrtMntDetsFrm.CodeEdit.Text := '' ;
            STPrtMntDetsFrm.DescrEdit.Text := '' ;
            STPrtMntDetsFrm.CustNameEdit.Text := '' ;
            STPrtMntDetsFrm.SelCust := 0;
            STPrtMntDetsFrm.SelBranch := 0;
//            STPrtMntDetsFrm.ListMemo.Text := '0.00' ;
            STPrtMntDetsFrm.CatMemo.Text := '0.00' ;
            STPrtMntDetsFrm.PurchPriceMemo.Text := '0.00' ;
//            STPrtMntDetsFrm.ListMUMemo.Text := '0.00';
            STPrtMntDetsFrm.CatMUMemo.Text := '0.00';
            STPrtMntDetsFrm.PurchPackQtyMemo.Text := '1' ;
            STPrtMntDetsFrm.SellPackQtyMemo.Text := '1' ;
            STPrtMntDetsFrm.VATDBLookUpComboBox.KeyValue := 0 ;
//            STPrtMntDetsFrm.AutoUpdCheckBox.Checked := True ;
 //           STPrtMntDetsFrm.UseSNsCheckBox.Checked := False ;
            STPrtMntDetsFrm.PartGroupDBLookUpComboBox.KeyValue := 0 ;
            STPrtMntDetsFrm.dblkpPriceUnit.KeyValue := 0;
            STPrtMntDetsFrm.EdtSlsNom.Text := '';
            STPrtMntDetsFrm.EdtPurchNom.Text := '';
            STPrtMntDetsFrm.MemoUplift.Text := '0.00';
            STPrtMntDetsFrm.RadGrpPrdClass.itemindex := 0;
            end;
          STPrtMntDetsFrm.sFuncType := sFuncType;
          STPrtMntDetsFrm.ShowModal;
          bTempOK := STPrtMntDetsFrm.bOK;
       finally
            STPrtMntDetsFrm.Free;
       end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sFuncType <> 'D' then
      FindInGrid(TempPart);
  end;
end;

procedure TSTPrtMntFrm.PartsDBGridDblClick(Sender: TObject);
begin
  if PartsDataSource.DataSet.RecordCount < 1 then Exit;
  if not bIs_LookUp then
  begin
    sFuncType := 'C';
    CallMaintScreen(Self);
  end
  else
  begin
    SelectBitBtnClick(Self);
    Close;
  end;
end;

procedure TSTPrtMntFrm.FindInGrid(TempPart: string);
begin
 If GetPartsQuery.Active = False then
                          exit ;   
  PartsDataSource.Enabled := False;
  with GetPartsQuery do
  begin
    First;
    while GetPartsQuery.FieldByName('Part').AsString <> TempPart do
    begin
      if EOF then
      begin
        First;
        Break;
      end;
      Next;
    end;
  end;
  PartsDataSource.Enabled := True;
end;

procedure TSTPrtMntFrm.SelectBitBtnClick(Sender: TObject);
begin
  if PartsDataSource.dataset.fieldbyname('Not_in_Use').asstring = 'Y' then
    begin
      MessageDlg('This product is inactive therefore no stock requests can be made. Either re-activate the product or contact Client Services for further assistance.', mtInformation, [mbOk], 0);
      exit;
    end;

  sCode := PartsDataSource.DataSet.FieldByName('Part').AsString;
  sCodeDescr := PartsDataSource.DataSet.FieldByName('Part_Description').AsString;
  sFormRef := PartsDataSource.DataSet.FieldByName('Form_Reference_ID').AsString;
  PurchPrice := PartsDataSource.DataSet.FieldByName('Part_Purchase_Price').Asfloat;
  Customer := PartsDataSource.DataSet.FieldByName('Customer').Asinteger;
  bOK := True;
  close;
end;

procedure TSTPrtMntFrm.NoneBitBtnClick(Sender: TObject);
begin
  sCode := '';
  bOK := True;
end;

procedure TSTPrtMntFrm.WriteGridSQL(Sender: TObject);
Var
bNeedGroup, bNeedProd: ByteBool ;
sLUGF: String;
begin
  {Write the grid SQL based on the settings} ;
  // bNeedGroup := (GroupEdit.Text <> '') ;
  bNeedGroup := false;
  //bNeedProd := (PrimEdit.Text <> '') ;
  bNeedProd := false;
  PartsDBGrid.Columns.Clear ;
  iGridColCount := 0 ;
  GetPartsQuery.SQL.Clear ;
  sLUGF := dmBroker.qryCompany.FieldByName('Parts_LUG_Fields').AsString ;
  GetPartsQuery.SQL.Add('Select top 1000 Part.Part, ') ;
  GetPartsQuery.SQL.Add('Part.Customer, ') ;
  GetPartsQuery.SQL.Add('Part.Not_in_Use, ') ;
  GetPartsQuery.SQL.Add('(Select top 1 form_reference.form_reference_id ');
  GetPartsQuery.SQL.Add('from form_reference where part.part = form_reference.stock_reference ');
  GetPartsQuery.SQL.Add(') as form_reference_id') ;
  AddToDBGrid('Part','Part Code',25) ;
  AddToDBGrid('Form_Reference_ID','Form Reference',25) ;
  If Copy(sLUGF,1,1) = 'Y' then
  begin
    GetPartsQuery.SQL.Add(', Part.Part_Description') ;
    AddToDBGrid('Part_Description','Description',50) ;
  end;
  If Copy(sLUGF,2,1) = 'Y' then
  begin
    GetPartsQuery.SQL.Add(', Part_Group.Part_Group_Descr_Short') ;
    AddToDBGrid('Part_Group_Descr_Short','Group',30) ;
    bNeedGroup := True ;
  end;
  If Copy(sLUGF,3,1) = 'Y' then
  begin
    GetPartsQuery.SQL.Add(', Product.Model_Number') ;
    AddToDBGrid('Model_Number','Primary Model',30) ;
    bNeedProd := True ;
  end;
  If Copy(sLUGF,4,1) = 'Y' then
  begin
    GetPartsQuery.SQL.Add(', Part.Part_Purchase_Price') ;
    AddToDBGrid('Part_Purchase_Price','Cost',20) ;
  end;
  If Copy(sLUGF,5,1) = 'Y' then
  begin
    GetPartsQuery.SQL.Add(', Part.Part_Cost_Cat') ;
    AddToDBGrid('Part_Cost_Cat','Sell Price',20) ;
  end;
  If bIs_Lookup = True then
  begin
    GetPartsQuery.SQL.Add(', Part.Purch_Pack_Quantity') ;
  end;
  GetPartsQuery.SQL.Add('From Part') ;
  If bNeedGroup = True then
    GetPartsQuery.SQL.Add(' Left Join Part_Group on Part_Group.Part_Group = Part.Part_Group') ;
  If bNeedProd = True then
    GetPartsQuery.SQL.Add(' Left Join Product on Product.Product = Part.Part_Primary_Product') ;
  GetPartsQuery.SQL.Add('Where Part.Part Like ''%' + CodeEdit.Text + '%''') ;
  If EdtDesc.Text <> '' then
    GetPartsQuery.SQL.Add('and Part.Part_Description Like ''%' +EdtDesc.Text + '%''') ;
  If iStore_Type <> 0  then
  begin
    GetPartsQuery.SQL.Add('and Part.Part Not In (Select Part From Part_Store_Levels') ;
    GetPartsQuery.SQL.Add('         Where (Part_Store_Levels.Part = Part.Part)') ;
    GetPartsQuery.SQL.Add('           and (Part_Store_Levels.Part_Store_Type = ' + IntToStr(iStore_Type) + '))');
  end;

  if bService then
    GetPartsQuery.SQL.Add('and Part.Product_class = ''SERV''')
  else
  if bStocked then
    GetPartsQuery.SQL.Add('and ((Part.product_class <> ''SERV'') or (Part.product_class is NULL))');

  if not ShowAllCheckBox.checked then
    GetPartsQuery.SQL.Add('and ((Part.Not_in_Use = ''N''))');
  (*If DescrEdit.Text <> '' then
      GetPartsQuery.SQL.Add('and Part.Part_Description Like ''' + DescrEdit.Text + '%''') ;
    If GroupEdit.Text <> '' then
      GetPartsQuery.SQL.Add('and Part_Group.Part_Group_Descr_Short Like ''' + GroupEdit.Text + '%''') ;
    If PrimEdit.Text <> '' then
      GetPartsQuery.SQL.Add('and Product.Model_Number Like ''' + PrimEdit.Text + '%''') ;*)
end;

procedure TSTPrtMntFrm.AddToDBGrid(TempFld, TempTitle: String; TempWidth: Integer);
begin
  PartsDBGrid.Columns.Add ;
  PartsDBGrid.Columns[iGridColCount].FieldName := TempFld ;
  PartsDBGrid.Columns[iGridColCount].Title.Caption := TempTitle ;
  PartsDBGrid.Columns[iGridColCount].Width := TempWidth * 5 ;
  iGridColCount := iGridColCount + 1 ;
end;

procedure TSTPrtMntFrm.ShowAllCheckBoxClick(Sender: TObject);
begin
 ShowGrid(Self) ;
end;

procedure TSTPrtMntFrm.SuppBitBtnClick(Sender: TObject);
Var
bTempAskDets, bTempOK: ByteBool ;
iTempCount: Integer ;
sTemp1stPart: String ;
begin
bTempAskDets := False ;
For iTempCount := 0 to (PartsDBGrid.SelectedRows.Count - 1) do
    begin
    PartsDataSource.DataSet.GotoBookmark(TBookmark(PartsDBGrid.SelectedRows[iTempCount])) ;
    If bTempAskDets = False then
       begin
       STMntPrtSuppFrm := TSTMntPrtSuppFrm.Create(Self);
       try
            STMntPrtSuppFrm.iNoParts := PartsDBGrid.SelectedRows.Count;
            STMntPrtSuppFrm.sSelPart := GetPartsQuery.FieldByName('Part').AsString;
            STMntPrtSuppFrm.sSelDescr := GetPartsQuery.FieldByName('Part_Description').AsString;
            STMntPrtSuppFrm.ShowModal;
            bTempOK := STMntPrtSuppFrm.bOK ;
       finally
            STMntPrtSuppFrm.Free;
            end;
       If bTempOK = False then
          exit ;
       sTemp1stPart := GetPartsQuery.FieldByName('Part').AsString;
       bTempAskDets := True ;
       end
    else
       begin
       {Update the others} ;
       With DelSuppsQuery do
            begin
            Close ;
            ParamByName('Part').AsString := GetPartsQuery.FieldByName('Part').AsString;
            ExecSQL ;
            end;
       With AddSuppsQuery do
            begin
            Close ;
            ParamByName('Part').AsString := GetPartsQuery.FieldByName('Part').AsString;
            ParamByName('Part_1st').AsString := sTemp1stPart ;
            ExecSQL ;
            end;
      end;
    end; 
end;

procedure TSTPrtMntFrm.PartsDBGridCellClick(Column: TColumn);
begin
ShowNoSelected(Self) ;
end;

procedure TSTPrtMntFrm.ShowNoSelected(Sender: TObject);
begin
If bMulti_Parts then
   begin
   StatusBar1.panels[1].text := IntToStr(PartsDBGrid.SelectedRows.Count) + ' parts selected' ;
   SelectBitBtn.Enabled := (PartsDBGrid.SelectedRows.Count > 0) ;
   ChangeBitBtn.Enabled := (PartsDBGrid.SelectedRows.Count > 0) ;
   SuppPartBitBtn.Enabled := (PartsDBGrid.SelectedRows.Count > 0) ;
   DelBitBtn.Enabled := (PartsDBGrid.SelectedRows.Count = 1) ;
   end;
end;

procedure TSTPrtMntFrm.FormCreate(Sender: TObject);
begin
  bService := False;
  bIs_Lookup := False;
  bOK := False;
  bDontShowGrid := False;
  bMulti_Parts := False;
  sCode := '' ;
  sCodeDescr := '' ;
  iStore_Type := 0 ;
  sSupp := '' ;
  sSuppDescr := '' ;
  sFormRef := '';
  CCSCommon.SetDBGridCols('', 'ProductLU Col Order', frmPBMainMenu.AppIniFile, PartSDBGrid);
end;

procedure TSTPrtMntFrm.SelAllBitBtnClick(Sender: TObject);
begin
With GetPartsQuery do
     begin
     First ;
     While EOF = False do
           begin
           PartsDBGrid.SelectedRows.CurrentRowSelected := True ;
           Next ;
           end;
     end;
ShowNoSelected(Self) ;
end;

procedure TSTPrtMntFrm.MultiSQLAdd(sTempStr: String);
begin
If bSQLAdd = False then
   begin
   UpdMultiSQL.SQL.Add(sTempStr) ;
   bSQLAdd := True ;
   end
else
   UpdMultiSQL.SQL.Add(', ' + sTempStr)
end;

procedure TSTPrtMntFrm.CloseBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TSTPrtMntFrm.PartsDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  changebitbtn.Enabled := (partsdatasource.dataset.recordcount > 0);
  SuppPartbitbtn.Enabled := (partsdatasource.dataset.recordcount > 0);
  Delbitbtn.Enabled := (partsdatasource.dataset.recordcount > 0);
  SelAllbitbtn.Enabled := (partsdatasource.dataset.recordcount > 0);
  Suppbitbtn.Enabled := (partsdatasource.dataset.recordcount > 0);
end;

procedure TSTPrtMntFrm.CodeEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if bIs_Lookup = true then
      SelectBitBtnclick(self)
    else
      ChangeBitBtnclick(self);
end;

procedure TSTPrtMntFrm.ImportBitBtnClick(Sender: TObject);
var
  STProdImportFrm: TSTProdImportFrm;
begin

  STProdImportFrm := TSTProdImportFrm.Create(Self);
  STProdImportFrm.ShowModal;

  STProdImportFrm.Free;

end;

procedure TSTPrtMntFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
(*  if Key = #13 then { if it's an enter key }
    if bIs_Lookup = true then
      SelectBitBtnclick(self)
    else
      ChangeBitBtnclick(self);
*)
end;

procedure TSTPrtMntFrm.SuppPartBitBtnClick(Sender: TObject);
begin
  STLUSuppPrtfrm := TSTLUSuppPrtFrm.create(self);
  try
    STLUSuppPrtfrm.Selcode := GetPartsQuery.FieldByName('Part').AsString;
    STLUSuppPrtfrm.SelName := GetPartsQuery.FieldByName('Part_Description').AsString;
    STLUSuppPrtfrm.showmodal;
  finally
    STLUSuppPrtfrm.free;
  end;
end;

procedure TSTPrtMntFrm.btbtnECommClick(Sender: TObject);
var
  ECommFrm: TSTMaintPrtECommFrm;
begin
  ECommFrm := TSTMaintPrtECommFrm.Create(self);
  try
    ECommFrm.display(self.PartsDBGrid.DataSource.DataSet.FieldByName('part').asString);
  finally
    ECommFrm.Free;
  end;
end;

procedure TSTPrtMntFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveDBGridCols('', 'Product LU Col Order', frmPBMainMenu.AppIniFile, self.PartsDBGrid);
end;

end.

