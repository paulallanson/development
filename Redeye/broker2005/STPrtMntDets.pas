(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Scribe Parts Maintenance Details form.

VSS Info:
$Header: /Broker Stock/STPrtMntDets.pas 17    1/09/03 16:15 Paul $
$History: STPrtMntDets.pas $
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 1/09/03    Time: 16:15
 * Updated in $/Broker Stock
 * Chnaged to correctly save the service item classification
 * 
 * *****************  Version 16  *****************
 * User: Paul         Date: 25/07/03   Time: 16:37
 * Updated in $/Broker Stock
 * corrected problem of re-displaying product maintenance after coming out
 * of screen
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 23/07/03   Time: 14:22
 * Updated in $/Broker Stock
 * Added property to determine if displaying Stocked products or Service
 * Products
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 15/07/03   Time: 12:19
 * Updated in $/Broker Stock
 * Changed to update the product details correctly with the part
 * classification
 * 
 * *****************  Version 13  *****************
 * User: Janiner      Date: 10/07/:3   Time: 16:10
 * Updated in $/Broker Stock
 * Add new fields for nominals and product classifiaction
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 26/06/:3   Time: 11:29
 * Updated in $/Broker Stock
 * Allow maintenance of a new 'numbered' check box.
 * 
 * *****************  Version 11  *****************
 * User: Janiner      Date: 15/04/:3   Time: 15:05
 * Updated in $/Broker Stock
 * Bug setting branch to null if branch is head branch
 * 
 * *****************  Version 10  *****************
 * User: Janiner      Date: 15/04/:3   Time: 9:14
 * Updated in $/Broker Stock
 * Allow the specification of a customer branch against a part/parts.
 * 
 * *****************  Version 9  *****************
 * User: Janiner      Date: 26/02/:3   Time: 10:30
 * Updated in $/Broker Stock
 * Problems when clearing product group or invoice price unit.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 19/08/:2   Time: 11:26
 * Updated in $/Broker Stock
 * Changed to allow maintenance of Invoice Price Unit
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 6/06/:2    Time: 14:32
 * Updated in $/Broker Stock
 * Tidy up warnings and hints
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 12/04/:2   Time: 16:51
 * Updated in $/Broker Stock
 * Changed to update the markup % differently
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 4/02/02    Time: 9:49
 * Updated in $/Broker Stock
 * Change to use Purchase and Sell Pack Sizes on screens and in Mark Up
 * calculations.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 3/09/:1    Time: 12:02
 * Updated in $/Broker Stock
 * Changes made to Sales Order processing maintenance and lookups, to be
 * used in conjunction with the End User Sales Ordering program.
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 29/03/:1   Time: 15:11
 * Updated in $/Broker Stock
 * improve tab order routine, and allow for part group maintenance button,
 * and vat code maintenance button.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 30/10/:0   Time: 11:56a
 * Updated in $/Broker Stock
 * Convert all on-screen captions, messages etc from "Part" to "Product".
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 2/10/:0    Time: 3:52p
 * Created in $/Broker Stock
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 7/08/:0    Time: 11:03a
 * Updated in $/Scribe D3
 * New button to allow suppliers to be added when adding a part.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 8/05/:0    Time: 3:13p
 * Updated in $/Scribe D3
 * Add new "Track_Serial_No" flag.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 21/02/:0   Time: 2:15p
 * Updated in $/Scribe D3
 * Cure "Column not found" error when adding a part with nothing in grid.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 17/02/:0   Time: 10:50a
 * Updated in $/Scribe D3
 * Add new fields to for stock system and add "Suppliers".
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/11/99    Time: 11:27
 * Updated in $/Scribe D3
 * New header added to source files.  Source reformatted.  Try..finally
 * put round forms creation/free.  Boolean checks changed.

*******************************************************************************)
unit STPrtMntDets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, DBTables, Buttons, ExtCtrls;

type
  TSTPrtMntDetsFrm = class(TForm)
    CodeEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DescrEdit: TEdit;
    CatMemo: TMemo;
    Label4: TLabel;
    VATDBLookupComboBox: TDBLookupComboBox;
    Label5: TLabel;
    VATsDataSource: TDataSource;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    CheckPartExistsQuery: TQuery;
    AddPartQuery: TQuery;
    UpdPartQuery: TQuery;
    DelPartQuery: TQuery;
    PurchPriceMemo: TMemo;
    Label6: TLabel;
    PurchPackQtyMemo: TMemo;
    Label7: TLabel;
    PartGroupDBLookupComboBox: TDBLookupComboBox;
    Label8: TLabel;
    GetGroupsQuery: TQuery;
    GroupsDataSource: TDataSource;
    GroupClearBitBtn: TBitBtn;
    NotInUseCheckBox: TCheckBox;
    GetVatsQuery: TQuery;
    OKSuppBitBtn: TBitBtn;
    VatMaintBitBtn: TBitBtn;
    PrtGrpMaintBitBtn: TBitBtn;
    SellPackQtyMemo: TMemo;
    Label9: TLabel;
    Label10: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    srcPriceUnit: TDataSource;
    qryPriceUnit: TQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    CustNameEdit: TEdit;
    CustBitBtn: TBitBtn;
    BitBtnClrCust: TBitBtn;
    ChkBxNumbrd: TCheckBox;
    LblSlsNomCode: TLabel;
    LblPurchNom: TLabel;
    EdtSlsNom: TEdit;
    EdtPurchNom: TEdit;
    RadGrpPrdClass: TRadioGroup;
    Label12: TLabel;
    DBLUCmbBxCstUplft: TDBLookupComboBox;
    Label3: TLabel;
    qryCstUplft: TQuery;
    DataSRCCstUplft: TDataSource;
    CatMUMemo: TMemo;
    Label13: TLabel;
    Label14: TLabel;
    MemoUplift: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
    procedure VATDBLookupComboBoxClick(Sender: TObject);
    procedure CodeEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveMemoField(Sender: TObject);
    function FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
    procedure GroupClearBitBtnClick(Sender: TObject);
    procedure ListMUMemoExit(Sender: TObject);
    procedure CatMUMemoExit(Sender: TObject);
    procedure PurchPackQtyMemoExit(Sender: TObject);
    procedure ListMemoExit(Sender: TObject);
    procedure CatMemoExit(Sender: TObject);
    procedure CodeEditExit(Sender: TObject);
    procedure OKSuppBitBtnClick(Sender: TObject);
    procedure VatMaintBitBtnClick(Sender: TObject);
    procedure PrtGrpMaintBitBtnClick(Sender: TObject);
    procedure PurchPriceMemoChange(Sender: TObject);
    procedure PurchPriceMemoKeyPress(Sender: TObject; var Key: Char);
    procedure ValidateMoney(Sender: TObject);
    procedure PurchPackQtyMemoChange(Sender: TObject);
    procedure PurchPackQtyMemoKeyPress(Sender: TObject; var Key: Char);
    procedure SellPackQtyMemoChange(Sender: TObject);
    procedure SellPackQtyMemoExit(Sender: TObject);
    procedure SellPackQtyMemoKeyPress(Sender: TObject; var Key: Char);
    procedure ListMemoKeyPress(Sender: TObject; var Key: Char);
    procedure CatMemoKeyPress(Sender: TObject; var Key: Char);
    procedure ListMemoChange(Sender: TObject);
    procedure CatMemoChange(Sender: TObject);
    procedure ListMUMemoKeyPress(Sender: TObject; var Key: Char);
    procedure CatMUMemoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CustBitBtnClick(Sender: TObject);
    procedure CustNameEditChange(Sender: TObject);
    procedure BitBtnClrCustClick(Sender: TObject);
    procedure RadGrpPrdClassClick(Sender: TObject);
    procedure MemoUpliftKeyPress(Sender: TObject; var Key: Char);
    procedure MemoUpliftExit(Sender: TObject);
    procedure MemoUpliftChange(Sender: TObject);
  private
    sOldValue: string;
//    procedure CalcListMarkup;
    procedure CalcCatMarkup;
  public
    sFuncType: string;
    bOK, bCodeOK: ByteBool;
    selCust, SelBranch :Integer;
  end;

var
  STPrtMntDetsFrm: TSTPrtMntDetsFrm;

implementation

uses StMntPrtSupp, CCSCommon, pbLUVatCode, STLUPrtGrp, PBLUPriceUnit,
  PBLUCust;

{$R *.DFM}

procedure TSTPrtMntDetsFrm.FormCreate(Sender: TObject);
begin
  with GetVatsQuery do
  begin
    Close;
    Open;
  end;
end;

procedure TSTPrtMntDetsFrm.FormActivate(Sender: TObject);
begin
  GetGroupsQuery.Close ;
  GetGroupsQuery.Open ;

  qryPriceUnit.Close ;
  qryPriceUnit.Open ;

  qryCstUplft.Close;
  qryCstUplft.Open;

  if sFuncType = 'A' then
    Caption := 'Add A Product'
  else
  if sFuncType = 'C' then
    Caption := 'Change A Product'
  else
  if sFuncType = 'D' then
      Caption := 'Delete A Product';
  CodeEdit.Enabled := (sFuncType = 'A');
  OKSuppBitBtn.Visible := (sFuncType = 'A');
  bOK := False;
  bCodeOK := (sFuncType <> 'A');
  RadGrpPrdClassClick(Self);
  
  CheckOK(Self);
end;

procedure TSTPrtMntDetsFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
//    (ListMemo.Text <> '') and
    (CatMemo.Text <> '') and
    (VATDBLookupComboBox.KeyValue <> 0) and
    (PurchPackQtyMemo.Text <> '') and
    (SellPackQtyMemo.Text <> '') and
    (PurchPriceMemo.Text <> '') and
    (memoUplift.Text <> '') and
//   (ListMUMemo.Text <> '') and
    (CatMUMemo.Text <> '') and
    (bCodeOK);
OKSuppBitBtn.Enabled := OKBitBtn.Enabled ;
end;

procedure TSTPrtMntDetsFrm.DescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTPrtMntDetsFrm.VATDBLookupComboBoxClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTPrtMntDetsFrm.CodeEditChange(Sender: TObject);
begin
  with CheckPartExistsQuery do
  begin
    Close;
    ParamByName('Part').AsString := CodeEdit.Text;
    Open;
    bCodeOK := (RecordCount = 0) and (CodeEdit.Text <> '');
  end;
  CheckOK(Self);
end;

procedure TSTPrtMntDetsFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncType = 'A' then
  begin
    with AddPartQuery do
    begin
      Close;
      ParamByName('Part').AsString := CodeEdit.Text;
      ParamByName('Part_Description').AsString := DescrEdit.Text;
      ParamByName('Part_Cost_List').AsFloat := 0.00 ;
      ParamByName('Part_Cost_Cat').AsFloat := StrToFloat(CatMemo.Text);
      ParamByName('VAT').AsInteger := VATDBLookupComboBox.KeyValue;
      If PartGroupDBLookUpComboBox.KeyValue = 0 then
              ParamByName('Part_Group').Clear
      else
              ParamByName('Part_Group').AsInteger := PartGroupDBLookUpComboBox.KeyValue ;
      ParamByName('Part_Purchase_Price').AsFloat := StrToFloat(PurchPriceMemo.Text) ;
      ParamByName('Part_Mark_Up_List').AsFloat := StrToFloat('0.00') ;
      ParamByName('Part_Mark_Up_Cat').AsFloat := StrToFloat(CatMUMemo.Text) ;
      ParamByName('Purch_Pack_Quantity').AsFloat := StrToFloat(PurchPackQtyMemo.Text) ;
      ParamByName('Sell_Pack_Quantity').AsFloat := StrToFloat(SellPackQtyMemo.Text) ;
      ParamByName('Track_Serial_No').AsString := 'N';
      if ChkBxNumbrd.Checked then
        ParamByName('Numbered').AsString := 'Y'
      else
        ParamByName('Numbered').AsString := 'N';
      ParamByName('Auto_Update').AsString := 'N';
      if NotInUseCheckBox.Checked then
        ParamByName('Not_In_Use').AsString := 'Y'
      else
        ParamByName('Not_In_Use').AsString := 'N';
      If dblkpPriceUnit.KeyValue = 0 then
        ParamByName('Price_unit').Clear
      else
        ParamByName('Price_unit').AsInteger := dblkpPriceUnit.KeyValue;
      if SelCust = 0 then
        begin
          ParamByName('Customer').clear;
          ParamByName('Branch').clear;
        end
      else
        begin
          ParamByName('Customer').AsInteger := SelCust;
          ParamByName('Branch').AsInteger := SelBranch;
        end;
      ParamByName('Sales_Nom').AsString := EdtSlsNom.Text;
      ParamByName('Purch_Nom').AsString := EdtPurchNom.Text;
      ParamByName('Markup_Type').clear;
      ParamBYName('MarkUp_Val').clear;
      if RadGrpPrdClass.ItemIndex = 0 then
        ParamByName('Prod_Class').AsString := 'STK';
      if RadGrpPrdClass.ItemIndex = 1 then
        ParamByName('Prod_Class').AsString := 'NSTK';
      if RadGrpPrdClass.ItemIndex = 2 then
        ParamByName('Prod_Class').AsString := 'SERV';
      if (RadGrpPrdClass.ItemIndex <> 0) and (DBLuCmbBxCstUplft.KeyValue <> 0) then
      begin
        ParamByName('MarkUp_Type').AsString := DBLUcmbBxCstUpLft.Keyvalue;
        ParamByName('MarkUp_Val').ASFloat := StrToFloat(MemoUpLift.Text);
      end;
      ExecSQL;
    end;
  end;
  if sFuncType = 'C' then
  begin
    with UpdPartQuery do
    begin
      Close;
      ParamByName('Part').AsString := CodeEdit.Text;
      ParamByName('Part_Description').AsString := DescrEdit.Text;
      ParamByName('Part_Cost_List').AsFloat := StrToFloat('0.00');
      ParamByName('Part_Cost_Cat').AsFloat := StrToFloat(CatMemo.Text);
      ParamByName('VAT').AsInteger := VATDBLookupComboBox.KeyValue;
      If PartGroupDBLookUpComboBox.KeyValue = 0 then
              ParamByName('Part_Group').Clear
      else
              ParamByName('Part_Group').AsInteger := PartGroupDBLookUpComboBox.KeyValue ;
     ParamByName('Part_Purchase_Price').AsFloat := StrToFloat(PurchPriceMemo.Text) ;
      ParamByName('Part_Mark_Up_List').AsFloat := StrToFloat('0.00') ;
      ParamByName('Part_Mark_Up_Cat').AsFloat := StrToFloat(CatMUMemo.Text) ;
      ParamByName('Purch_Pack_Quantity').AsFloat := StrToFloat(PurchPackQtyMemo.Text) ;
      ParamByName('Sell_Pack_Quantity').AsFloat := StrToFloat(SellPackQtyMemo.Text) ;
      ParamByName('Track_Serial_No').AsString := 'N';
      if ChkBxNumbrd.Checked then
        ParamByName('Numbered').AsString := 'Y'
      else
        ParamByName('Numbered').AsString := 'N';
      ParamByName('Auto_Update').AsString := 'N';
      if NotInUseCheckBox.Checked then
        ParamByName('Not_In_Use').AsString := 'Y'
      else
        ParamByName('Not_In_Use').AsString := 'N';

      If dblkpPriceUnit.KeyValue = 0 then
        ParamByName('Price_unit').Clear
      else
        ParamByName('Price_unit').AsInteger := dblkpPriceUnit.KeyValue;
      if SelCust = 0 then
        begin
          ParamByName('Customer').clear ;
          ParamByName('Branch').clear;
        end
      else
        begin
          ParamByName('Customer').AsInteger := SelCust;
          ParamByName('Branch').AsInteger := SelBranch;
        end;

      ParamByName('Sales_Nom').AsString := EdtSlsNom.Text;
      ParamByName('Purch_Nom').AsString := EdtPurchNom.Text;
       ParamByName('Markup_Type').clear;
      ParamBYName('MarkUp_Val').clear;
      if RadGrpPrdClass.ItemIndex = 0 then
        ParamByName('Prod_Class').AsString := 'STK';
      if RadGrpPrdClass.ItemIndex = 1 then
        ParamByName('Prod_Class').AsString := 'NSTK';
      if RadGrpPrdClass.ItemIndex = 2 then
        ParamByName('Prod_Class').AsString := 'SERV';
      if (RadGrpPrdClass.ItemIndex <> 0) and (DBLuCmbBxCstUplft.KeyValue <> 0) then
      begin
        ParamByName('MarkUp_Type').AsString := DBLUcmbBxCstUpLft.Keyvalue;
        ParamByName('MarkUp_Val').ASFloat := StrToFloat(MemoUpLift.Text);
      end;
       ExecSQL;
    end;
  end;
  if sFuncType = 'D' then
  begin
    with DelPartQuery do
    begin
      Close;
      ParamByName('Part').AsString := CodeEdit.Text;
      ExecSQL;
    end;
  end;
  bOK := True;
end;

procedure TSTPrtMntDetsFrm.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

function TSTPrtMntDetsFrm.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
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

procedure TSTPrtMntDetsFrm.GroupClearBitBtnClick(Sender: TObject);
begin
PartGroupDBLookupComboBox.KeyValue := 0 ;
end;

procedure TSTPrtMntDetsFrm.ListMUMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TSTPrtMntDetsFrm.CatMUMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TSTPrtMntDetsFrm.PurchPackQtyMemoExit(Sender: TObject);
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

procedure TSTPrtMntDetsFrm.ListMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TSTPrtMntDetsFrm.CatMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TSTPrtMntDetsFrm.CodeEditExit(Sender: TObject);
begin
If sFuncType <> 'A' then
   exit ;
With CheckPartExistsQuery do
     begin
     Close ;
     ParamByName('Part').AsString := CodeEdit.Text ;
     Open ;
     If RecordCount > 0 then
        begin
        MessageDlg('Product code already exists', mtError, [mbOK],0) ;
        CodeEdit.SetFocus ;
        end ;
     end;
end;

procedure TSTPrtMntDetsFrm.OKSuppBitBtnClick(Sender: TObject);
begin
{Accept the part and add suppliers} ;
OKBitBtnClick(self) ;
STMntPrtSuppFrm := TSTMntPrtSuppFrm.Create(Self);
try
     STMntPrtSuppFrm.iNoParts := 1;
     STMntPrtSuppFrm.sSelPart := CodeEdit.Text;
     STMntPrtSuppFrm.sSelDescr := DescrEdit.Text;
     STMntPrtSuppFrm.ShowModal;
finally
     STMntPrtSuppFrm.Free;
     end;
end;

procedure TSTPrtMntDetsFrm.VatMaintBitBtnClick(Sender: TObject);
begin
  PBLUVatCodeFrm := TPBLUVatCodeFrm.Create(self) ;
  try
    PBLUVatCodeFrm.bIs_Lookup := False ;
    PBLUVatCodeFrm.bAllow_Upd := True ;
    PBLUVatCodeFrm.iSelCode := 0 ;
    PBLUVatCodeFrm.ShowModal ;
  finally
  PBLUVatCodeFrm.Free ;
  end;
  GetVATsQuery.Active := False;
  GetVATsQuery.Active := True;
end;

procedure TSTPrtMntDetsFrm.PrtGrpMaintBitBtnClick(Sender: TObject);
begin
  STLUPrtGrpFrm := TSTLUPrtGrpFrm.Create(Self);
  try
    STLUPrtGrpFrm.bIs_LookUp := False ;
    STLUPrtGrpFrm.bAllow_Upd := True ;
    STLUPrtGrpFrm.ShowModal;
  finally
    STLUPrtGrpFrm.Free;
  end;
GetGroupsQuery.Active := False;
GetGroupsQuery.Active := True;end;

procedure TSTPrtMntDetsFrm.PurchPriceMemoChange(Sender: TObject);
begin
//  CalcListMarkup;
  CalcCatMarkup;
  CheckOK(Self) ;
end;

procedure TSTPrtMntDetsFrm.PurchPriceMemoKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

{procedure TSTPrtMntDetsFrm.CalcListMarkup;
var
  rListValue: real;
  rSellPrice, rPurchPrice: real;
  iSellPack, iPurchPack: integer;
begin
  if (trim(PurchPriceMemo.text) = '') or
     (trim(ListMemo.text) = '') or
     (trim(PurchPackQtyMemo.text) = '') or
     (trim(SellPackQtyMemo.text) = '') then
     exit;

  iSellPack := strtoint(trim(SellPackQtyMemo.text));
  iPurchPack := strtoint(trim(PurchPackQtyMemo.text));

  rSellPrice := strtofloat(ListMemo.text);
  rPurchPrice := strtofloat(PurchPriceMemo.text);

  if rSellPrice = 0 then
    ListMUMemo.Text := '0.00'
  else
    begin
      rListValue := (((rSellPrice/iSellPack) - (rPurchPrice/iPurchPack))
                    /(rPurchPrice/iPurchPack)) * 100.;
      ListMUMemo.text := formatfloat('0.00',rListValue);
    end;  
end;  }

procedure TSTPrtMntDetsFrm.CalcCatMarkup;
var
  rCatValue: real;
  rSellPrice, rPurchPrice: real;
  iSellPack, iPurchPack: integer;
begin
  if (trim(PurchPriceMemo.text) = '') or
     (trim(CatMemo.text) = '') or
     (trim(PurchPackQtyMemo.text) = '') or
     (trim(SellPackQtyMemo.text) = '') then
     exit;

  iSellPack := strtoint(trim(SellPackQtyMemo.text));
  iPurchPack := strtoint(trim(PurchPackQtyMemo.text));

  rSellPrice := strtofloat(CatMemo.text);
  rPurchPrice := strtofloat(PurchPriceMemo.text);

  if rSellPrice = 0 then
    CatMUMemo.Text := '0.00'
  else
    begin
      if rPurchPrice = 0 then
        CatMUMemo.Text := '100.00'
      else
        begin
          rCatValue := (((rSellPrice/iSellPack) - (rPurchPrice/iPurchPack))
                    /(rPurchPrice/iPurchPack)) * 100.;
          CatMUMemo.text := formatfloat('0.00',rCatValue);
        end;
    end;

end;

procedure TSTPrtMntDetsFrm.PurchPackQtyMemoChange(Sender: TObject);
begin
//  CalcListMarkup;
  CalcCatMarkup;
  CheckOK(Self) ;
end;

procedure TSTPrtMntDetsFrm.PurchPackQtyMemoKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.SellPackQtyMemoChange(Sender: TObject);
begin
//  CalcListMarkup;
  CalcCatMarkup;
  CheckOK(Self) ;
end;

procedure TSTPrtMntDetsFrm.SellPackQtyMemoExit(Sender: TObject);
var
  tempStr: string;
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


procedure TSTPrtMntDetsFrm.SellPackQtyMemoKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.ListMemoKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.CatMemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TSTPrtMntDetsFrm.ListMemoChange(Sender: TObject);
begin
//    CalcListMarkup;
    CalcCatMarkup;
    CheckOK(Self) ;
end;

procedure TSTPrtMntDetsFrm.CatMemoChange(Sender: TObject);
begin
 //   CalcListMarkup;
    CalcCatMarkup;
    CheckOK(Self) ;
end;

procedure TSTPrtMntDetsFrm.ListMUMemoKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.CatMUMemoKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUPriceUnitfrm := TPBLUPriceUnitfrm.create(self);
  try
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

procedure TSTPrtMntDetsFrm.BitBtn2Click(Sender: TObject);
begin
  dblkpPriceUnit.KeyValue := 0;
end;

procedure TSTPrtMntDetsFrm.CustBitBtnClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := True ;
    PBLUCustFrm.bSel_Branch := True ;
    PBLUCustFrm.SelCode := SelCust;
    PBLUCustFrm.SelBranch := SelBranch;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
      begin
        if (SelCust <> PBLUCustFrm.SelCode)
          or (SelBranch <> PBLUCustFrm.SelBranch) then
        begin
          SelCust := PBLUCustFrm.SelCode;
          CustNameEdit.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
          SelBranch := PBLUCustFrm.SelBranch;
        end;
      end;
  finally
    PBLUCustFrm.Free;
  end;
CheckOK(Self) ;

end;

procedure TSTPrtMntDetsFrm.CustNameEditChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TSTPrtMntDetsFrm.BitBtnClrCustClick(Sender: TObject);
begin
SelCust := 0;
SelBranch := 0;
CustNameEdit.Text := '';
end;

procedure TSTPrtMntDetsFrm.RadGrpPrdClassClick(Sender: TObject);
begin
chkbxnumbrd.Enabled := RadGrpPrdClass.itemindex = 0;
DBLUCmbBxCstUplft.Enabled := RadGrpPrdClass.Itemindex <> 0;
MemoUplift.Enabled := RadGrpPrdClass.ItemIndex <> 0;
if RadGrpPrdClass.ItemIndex = 0 then
begin
  MemoUpLift.color := clBtnFace;
  DBLUCmbBxCstUpLft.Color := clBtnFace;
end
else
  begin
    MemoUpLift.color := clwindow;
    DBLUCmbBxCstUpLft.Color := clwindow;
  end;

end;

procedure TSTPrtMntDetsFrm.MemoUpliftKeyPress(Sender: TObject;
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

procedure TSTPrtMntDetsFrm.MemoUpliftExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;


procedure TSTPrtMntDetsFrm.MemoUpliftChange(Sender: TObject);
begin
CheckOk(self);
end;

end.
