(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Price Units.

VSS Info:
$Header: /Broker Stock/STMaintSuppPrt.pas 2     2/05/:2 12:14 Paul $
$History: STMaintSuppPrt.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 2/05/:2    Time: 12:14
 * Updated in $/Broker Stock
 * Changed to allow maintenance of Discount value for Supplier products
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 19/04/:2   Time: 12:50
 * Created in $/Broker Stock
 * Initial take on of Supplier part maintenance units
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 14/03/:2   Time: 12:26
 * Created in $/CCSCommon
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 14:57
 * Updated in $/PBL D5
 * Change field Price_Unit from char to integer so we can have more than 9
 * price units.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit STMaintSuppPrt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintSuppPrtFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsSRC: TDataSource;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    edtProduct: TEdit;
    edtDescr: TEdit;
    btnSupplier: TBitBtn;
    edtSupplier: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    chkDiscountPart: TCheckBox;
    edtSuppRef: TEdit;
    GetMaxPrefOrderSQL: TFDQuery;
    memDiscount: TMemo;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
    procedure btnSupplierClick(Sender: TObject);
    procedure memDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure memDiscountEnter(Sender: TObject);
    procedure memDiscountExit(Sender: TObject);
  private
    sOldValue: string;
    function GetNextPreferenceOrder: integer;
  public
    sFuncMode: string[1];
    iSupp, iBranch: integer;
    sCode, sDescr, sSupplier: string;
  end;

var
  STMaintSuppPrtFrm: TSTMaintSuppPrtFrm;

implementation

uses STLUSuppPrt, ComObj, ActiveX, PBLUSupp, CCSCommon;

{$R *.DFM}

procedure TSTMaintSuppPrtFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  edtProduct.text := sCode;
  edtdescr.text := sDescr;
  if sFuncMode = 'A' then
    Caption := 'Add new Supplier product details';
  if sFuncMode = 'C' then
    Caption := 'Change Supplier product details';
  if sFuncMode = 'D' then
    Caption := 'Delete Supplier product details';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtSupplier.Text := '';
    edtSuppRef.Text := '';
    sSupplier := '';
    memDiscount.text := '0.00';
  end
  else
  begin
    btnSupplier.enabled := false;
    with STLUSuppPrtFrm.DetsSRC.DataSet do
    begin
      iSupp := FieldByName('Supplier').asinteger;
      iBranch := FieldByName('Branch_no').asinteger;
      edtSupplier.Text := FieldByName('Supplier_Name').AsString + '/' + fieldbyname('Branch_Name').asstring;
      edtSuppRef.Text := FieldByName('Supplier_Part_Code').AsString;
      sSupplier := FieldByName('Supplier_Name').AsString;
      chkDiscountPart.checked := (fieldbyname('Discount_This_Part').asstring = 'Y');
      memDiscount.text := formatfloat('0.00',(fieldbyname('Discount').asfloat));
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
end;

procedure TSTMaintSuppPrtFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtSupplier.Text <> '');
end;

procedure TSTMaintSuppPrtFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSTMaintSuppPrtFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintSuppPrtFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintSuppPrtFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      begin
        with AddSQL do
          begin
            close;
            Parambyname('Supplier').asinteger := iSupp;
            Parambyname('Branch_no').asinteger := iBranch;
            ParamByName('Part').Asstring := sCode;
            ParamByName('Supplier_Part_Code').AsString := edtSuppRef.Text + '';
            parambyname('Supplier_Preference_Order').asinteger := GetNextPreferenceOrder;
            if chkDiscountPart.checked then
              parambyname('Discount_This_Part').asstring := 'Y'
            else
              parambyname('Discount_This_Part').asstring := 'N';
            parambyname('Discount').asfloat := strtofloat(memDiscount.text);

            ExecSQL;
          end;
      end;
    with UpdSQL do
    begin
      Parambyname('Supplier').asinteger := iSupp;
      Parambyname('Branch_no').asinteger := iBranch;
      ParamByName('Part').Asstring := sCode;
      ParamByName('Supplier_Part_Code').AsString := edtSuppRef.Text + '';
      if chkDiscountPart.checked then
        parambyname('Discount_This_Part').asstring := 'Y'
      else
        parambyname('Discount_This_Part').asstring := 'N';
      parambyname('Discount').asfloat := strtofloat(memDiscount.text);
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Part').Asstring := sCode;
        ParamByName('Supplier').Asinteger := iSupp;
        ParamByName('Branch_no').Asinteger := iBranch;
        ExecSQL;
      end;
    end;
  end;
end;

function TSTMaintSuppPrtFrm.GetNextPreferenceOrder: integer;
begin
  with GetMaxPrefOrderSQL do
    begin
      close;
      parambyname('Part').asstring := sCode;
      open;

      if recordcount = 0 then
        result := 0
      else
        result := fieldbyname('Last_number').asinteger + 1;
    end;
end;

procedure TSTMaintSuppPrtFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintSuppPrtFrm.UnitFactorEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TSTMaintSuppPrtFrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_LookUp := True ;
    PBLUSuppFrm.bAllow_Upd := True ;
    PBLUSuppFrm.bSel_Branch := True ;
    PBLUSuppFrm.SelCode := iSupp;
    PBLUSuppFrm.SelBranch := iBranch;
    PBLUSuppFrm.ShowModal;
    If PBLUSuppFrm.Selected then
      begin
        iSupp := PBLUSuppFrm.SelCode;
        edtSupplier.Text := PBLUSuppFrm.SelName + '/' + PBLUSuppFrm.SelBranchName;
        iBranch := PBLUSuppFrm.SelBranch;
        sSupplier := PBLUSuppFrm.SelName;
      end;
  finally
    PBLUSuppFrm.Free;
  end;
  CheckOK(Self) ;
end;

procedure TSTMaintSuppPrtFrm.memDiscountKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
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

procedure TSTMaintSuppPrtFrm.memDiscountEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintSuppPrtFrm.memDiscountExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  if trim((Sender as TMemo).Text) = '' then
    (Sender as TMemo).Text := '0.00';
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

end.
