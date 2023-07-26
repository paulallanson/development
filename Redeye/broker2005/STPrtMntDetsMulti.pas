(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Scribe Parts Maintenance Details form.

VSS Info:
$Header: /Broker Stock/STPrtMntDetsMulti.pas 7     26/06/:3 11:29 Janiner $
$History: STPrtMntDetsMulti.pas $
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 26/06/:3   Time: 11:29
 * Updated in $/Broker Stock
 * Allow maintenance of a new 'numbered' check box.
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 15/04/:3   Time: 9:14
 * Updated in $/Broker Stock
 * Allow the specification of a customer branch against a part/parts.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 26/02/:3   Time: 10:30
 * Updated in $/Broker Stock
 * Problems when clearing product group or invoice price unit.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 19/08/:2   Time: 11:26
 * Updated in $/Broker Stock
 * Changed to allow maintenance of Invoice Price Unit
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 4/02/02    Time: 9:49
 * Updated in $/Broker Stock
 * Change to use Purchase and Sell Pack Sizes on screens and in Mark Up
 * calculations.
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
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 8/05/:0    Time: 3:13p
 * Updated in $/Scribe D3
 * Add new "Track_Serial_No" flag.
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 19/04/:0   Time: 11:16a
 * Created in $/Scribe D3
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
unit STPrtMntDetsMulti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, Buttons, Spin, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPrtMntDetsMultiFrm = class(TForm)
    Label5: TLabel;
    VATsDataSource: TDataSource;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    GetGroupsQuery: TFDQuery;
    GroupsDataSource: TDataSource;
    GetVatsQuery: TFDQuery;
    Label1: TLabel;
    Label2: TLabel;
    FromGroupBox: TGroupBox;
    VATDBLookupComboBox: TDBLookupComboBox;
    PurchPriceMemo: TMemo;
    PartGroupDBLookupComboBox: TDBLookupComboBox;
    CheckPartExistsQuery: TFDQuery;
    AddPartQuery: TFDQuery;
    UpdPartQuery: TFDQuery;
    DelPartQuery: TFDQuery;
    ListMUMemo: TMemo;
    CatMUMemo: TMemo;
    Label6: TLabel;
    ToGroupBox: TGroupBox;
    VATToDBLookupComboBox: TDBLookupComboBox;
    PurchPriceToMemo: TMemo;
    PartGroupToDBLookupComboBox: TDBLookupComboBox;
    ListMUToMemo: TMemo;
    CATMUToMemo: TMemo;
    NotInUseCheckBox: TCheckBox;
    AutoUpdCheckBox: TCheckBox;
    NotInUseToCheckBox: TCheckBox;
    AutoUpdToCheckBox: TCheckBox;
    SellPackQtySpinEdit: TSpinEdit;
    PurchPackQtyToSpinEdit: TSpinEdit;
    UseSNsCheckBox: TCheckBox;
    UseSNsToCheckBox: TCheckBox;
    PurchPackQtySpinEdit: TSpinEdit;
    SellPackQtyToSpinEdit: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    dblkpPriceUnitTo: TDBLookupComboBox;
    qryPriceUnit: TFDQuery;
    srcPriceUnit: TDataSource;
    CustNameEdit: TEdit;
    CustNameToEdit: TEdit;
    CustBitBtn: TBitBtn;
    Label9: TLabel;
    ChkBxNumbrd: TCheckBox;
    ChkBxToNumbrd: TCheckBox;
    PartTypeToDBLookupComboBox: TDBLookupComboBox;
    PartTypeDBLookupComboBox: TDBLookupComboBox;
    Label10: TLabel;
    SQLGetPrdTyp: TFDQuery;
    DSGetPrdTyp: TDataSource;
    Label11: TLabel;
    dblkpUOM: TDBLookupComboBox;
    dblkpUOMTo: TDBLookupComboBox;
    SQLGetUOM: TFDQuery;
    DSGetUOM: TDataSource;
    chkbxOrderOnline: TCheckBox;
    chkbxToOrderOnline: TCheckBox;
    bitBtnClrCust: TBitBtn;
    GroupClearBitBtn: TBitBtn;
    TypeClearBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    rdgrpClass: TRadioGroup;
    rdgrpClassTo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SaveMemoField(Sender: TObject);
    function FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
    procedure GroupClearBitBtnClick(Sender: TObject);
    procedure PurchPriceMemoExit(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure PartGroupToDBLookupComboBoxClick(Sender: TObject);
    procedure PrimProdToDBLookupComboBoxClick(Sender: TObject);
    procedure VATToDBLookupComboBoxClick(Sender: TObject);
    procedure PackQtyToMemoChange(Sender: TObject);
    procedure PurchPriceToMemoChange(Sender: TObject);
    procedure ListMUToMemoChange(Sender: TObject);
    procedure CATMUToMemoChange(Sender: TObject);
    procedure NotInUseToCheckBoxClick(Sender: TObject);
    procedure AutoUpdToCheckBoxClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure MUMemoExit(Sender: TObject);
    procedure SellPackQtyToSpinEditChange(Sender: TObject);
    procedure PurchPackQtyToSpinEditChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblkpPriceUnitToClick(Sender: TObject);
    procedure BitBtnClrCustClick(Sender: TObject);
    procedure CustNameToEditChange(Sender: TObject);
    procedure CustBitBtnClick(Sender: TObject);
    procedure ChkBxToNumbrdClick(Sender: TObject);
    procedure TypeClearBitBtnClick(Sender: TObject);
    procedure PartTypeToDBLookupComboBoxClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dblkpUOMToClick(Sender: TObject);
    procedure chkbxToOrderOnlineClick(Sender: TObject);
 private
    sOldValue: string;
    bChanged: ByteBool ;
  public
    bOK,bgroupcleared, bpricecleared, bcustcleared, bTypeCleared, bUomCleared: ByteBool;
    iPartCount: Integer ;
    selCust, SelBranch :Integer;
  end;

var
  STPrtMntDetsMultiFrm: TSTPrtMntDetsMultiFrm;

implementation

uses PBLUCust;

{$R *.DFM}

procedure TSTPrtMntDetsMultiFrm.FormCreate(Sender: TObject);
begin
  with GetVatsQuery do
  begin
    Close;
    Open;
  end;
end;

procedure TSTPrtMntDetsMultiFrm.FormActivate(Sender: TObject);
begin
PurchPackQtyToSpinEdit.Text := '' ;
SellPackQtyToSpinEdit.Text := '' ;
GetGroupsQuery.Close ;
GetGroupsQuery.Open ;

qryPriceUnit.Close ;
qryPriceUnit.Open ;

SQLGetPrdTyp.Close;
SQLGetPrdTyp.Open;

SQLGetUom.Close;
SQLGetUom.open;

Caption := 'Changing ' + IntToStr(iPartCount) + ' products';
bChanged := False ;
bOK := False;
end;

procedure TSTPrtMntDetsMultiFrm.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

function TSTPrtMntDetsMultiFrm.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
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

procedure TSTPrtMntDetsMultiFrm.GroupClearBitBtnClick(Sender: TObject);
begin
bgroupcleared := true;
PartGroupToDBLookupComboBox.KeyValue := 0 ;
checkok(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.PurchPriceMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit};
  TempStr := FormatMemoValue((Sender as TMemo).Lines[0], '######0.00', 'finacial value', False);
   if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    begin
    (Sender as TMemo).Text := TempStr;
  end;
CheckOK(Self) ;
end;

procedure TSTPrtMntDetsMultiFrm.CheckOK(Sender: TObject);
begin
{Check if anything has changed} ;
OKBitBtn.Enabled := (VATToDBLookupComboBox.KeyValue <> 0)  or
                    ((dblkpPriceUnitTo.KeyValue <> 0) and (bpricecleared = false)) or
                    ((CustNameToEdit.Text <> '') and (bCustCleared = false)) or
                    ((PartGroupToDBLookupComboBox.KeyValue <> 0) and (bgroupcleared = false)) or
                    ((PartTypeTODBLookupComboBox.KeyValue <> 0) and (bTypecleared = false)) or
                    ((dblkpUOMTo.Keyvalue <> 0) and (bUomcleared = false)) or
                    (bpricecleared) or
                    (bgroupcleared) or
                    (bcustcleared) or
                    (btypecleared) or
                    (bUomcleared) or
                    (SellPackQtyToSpinEdit.Text <> '') or
                    (PurchPackQtyToSpinEdit.Text <> '') or
                    (PurchPriceToMemo.Text <> '') or
                    (ListMUToMemo.Text <> '') or
                    (CatMUToMemo.Text <> '') or
                    (NotInUseToCheckBox.State <> cbGrayed) or
                    (chkbxOrderOnline.State <> cbGrayed) or
                    (AutoUpdToCheckBox.State <> cbGrayed) or
                    (ChkBXToNumbrd.State <> cbGrayed);
end;

procedure TSTPrtMntDetsMultiFrm.PartGroupToDBLookupComboBoxClick(
  Sender: TObject);
begin
bgroupcleared := false;
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.PrimProdToDBLookupComboBoxClick(
  Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.VATToDBLookupComboBoxClick(
  Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.PackQtyToMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.PurchPriceToMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.ListMUToMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.CATMUToMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.NotInUseToCheckBoxClick(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.AutoUpdToCheckBoxClick(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.OKBitBtnClick(Sender: TObject);
begin
  bOK := True ;
end;

procedure TSTPrtMntDetsMultiFrm.MUMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit};
  TempStr := FormatMemoValue((Sender as TMemo).Lines[0], '##0.00', 'percentage', False);
   if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    begin
    (Sender as TMemo).Text := TempStr;
  end;
end;

procedure TSTPrtMntDetsMultiFrm.SellPackQtyToSpinEditChange(
  Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTPrtMntDetsMultiFrm.PurchPackQtyToSpinEditChange(
  Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTPrtMntDetsMultiFrm.BitBtn1Click(Sender: TObject);
begin
  bpricecleared := true;
  dblkpPriceUnitTo.KeyValue := 0 ;
  checkok(self);
end;

procedure TSTPrtMntDetsMultiFrm.dblkpPriceUnitToClick(Sender: TObject);
begin
bpricecleared := false;
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.BitBtnClrCustClick(Sender: TObject);
begin
SelCust := 0;
SelBranch := 0;
CustNameToEdit.Text := '';
bCustCleared := True;
CheckOk(self);
end;

procedure TSTPrtMntDetsMultiFrm.CustNameToEditChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TSTPrtMntDetsMultiFrm.CustBitBtnClick(Sender: TObject);
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
          CustNameToEdit.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
          SelBranch := PBLUCustFrm.SelBranch;
        end;
      end;
  finally
    PBLUCustFrm.Free;
  end;
bCustCleared := False;
CheckOK(Self) ;

end;

procedure TSTPrtMntDetsMultiFrm.ChkBxToNumbrdClick(Sender: TObject);
begin
CheckOK(Self);
end;

procedure TSTPrtMntDetsMultiFrm.TypeClearBitBtnClick(Sender: TObject);
begin
bTypecleared := true;
PartTypeToDBLookupComboBox.KeyValue := 0 ;
checkok(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.PartTypeToDBLookupComboBoxClick(
  Sender: TObject);
begin
bTypecleared := false;
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.BitBtn2Click(Sender: TObject);
begin
  bUomcleared := true;
  dblkpUomTo.KeyValue := 0 ;
  checkok(self);
end;

procedure TSTPrtMntDetsMultiFrm.dblkpUOMToClick(Sender: TObject);
begin
buomcleared := false;
CheckOK(self) ;
end;

procedure TSTPrtMntDetsMultiFrm.chkbxToOrderOnlineClick(Sender: TObject);
begin
  CheckOK(self) ;
end;

end.
