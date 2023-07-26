(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Purchase Order Line Extra Charges form.

VSS Info:
$Header: /PBL D5/PBMaintPOrdLineExtChg.pas 11    20/06/03 9:53 Andrewh $
$History: PBMaintPOrdLineExtChg.pas $
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 7  *****************
 * User: Davidn       Date: 8/08/02    Time: 14:35
 * Updated in $/PBL D5
 * Modified PO/Additional Charge maintenance.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 7/08/02    Time: 15:08
 * Updated in $/PBL D5
 * Added use of Additional Charges look up screen.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:40
 * Updated in $/PBL D5
 * Changed to allow the entering of negative values.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 19/03/:1   Time: 10:48
 * Updated in $/PBL D5
 * Modified the appearance of the Cost and Sell fields and set the
 * defaults to 0.00 if adding new charges.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 3  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:33
 * Updated in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBMaintPOrdLineExtChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  PBPOObjects, contnrs;

type
  TPBMaintPOrdLineExtChgFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    POrdLabel: TLabel;
    Label9: TLabel;
    CostMemo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    PriceMemo: TMemo;
    DetailsEdit: TEdit;
    dblkpVatRate: TDBLookupComboBox;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure btnLUAddChargeClick(Sender: TObject);
  private
    FExtraCharge: TExtraCharge;
    FFuncMode: Char;
    sOldValue: string;
    sDescName: string;
  public
    bOK: Boolean;
    ChargeList: TObjectList;
    property ExtraCharge: TExtraCharge read FExtraCharge
      write FExtraCharge;
    property FuncMode: Char read FFuncMode write FFuncMode;
  end;

var
  PBMaintPOrdLineExtChgFrm: TPBMaintPOrdLineExtChgFrm;

implementation

uses
  PBLUAdHoc, PBLUSupp, PBLURep, PBLUCust, PBPODataMod, PBLUAddCharges;

{$R *.DFM}

procedure TPBMaintPOrdLineExtChgFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  if FFuncMode = poAdd then
    Caption := 'Add a new purchase order line extra charge'
  else
    if FFuncMode = poChange then
      Caption := 'Change a purchase order line extra charge'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete a purchase order line extra charge'
      else
        if FFuncMode = poView then
          Caption := 'View purchase order line extra charge';
  if FFuncMode = poAdd then
  begin
    {Empty details}
    DetailsEdit.Text := '';
    CostMemo.Text := '0.00';
    PriceMemo.Text := '0.00';
    dblkpVatRate.KeyValue := ExtraCharge.VatCode;
  end
  else
    with ExtraCharge do
    begin
      {Get the apppropriate detail and display it}
      DetailsEdit.Text := Details;
      CostMemo.Text := FormatMoney(Amount);
      PriceMemo.Text := FormatMoney(QuotationPrice);
      dblkpVatRate.KeyValue := VatCode;
    end;
  POrdLabel.Caption := sDescName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not (FFuncMode in [poDelete, poView]);
  DelLabel.Visible := (FFuncMode = poDelete);
  OKBitBtn.Visible := (FFuncMode <> poView);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineExtChgFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DetailsEdit.Text <> '') and
    (CostMemo.Text <> '') and
    (PriceMemo.Text <> '');
end;

procedure TPBMaintPOrdLineExtChgFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPOrdLineExtChgFrm.OKBitBtnClick(Sender: TObject);
begin
  if FFuncMode in [poChange, poAdd] then
  begin
    with ExtraCharge do
    begin
      Details := DetailsEdit.Text;
      Amount := PBFloatStr(CostMemo.Text);
      QuotationPrice := PBFloatStr(PriceMemo.Text);
      VatCode := dblkpVatRate.KeyValue;
    end;
  end
  else if FFuncMode = poDelete then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
  end;
  bOK := True;
end;

procedure TPBMaintPOrdLineExtChgFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdLineExtChgFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineExtChgFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineExtChgFrm.btnLUAddChargeClick(Sender: TObject);
var
  x: integer;
begin
  PBLUAddChrgFrm := TPBLUAddChrgFrm.Create(Self);
  try
    PBLUAddChrgFrm.bIs_Lookup := True;
    PBLUAddChrgFrm.bAllow_Upd := False;
    PBLUAddChrgFrm.ShowModal;


    with PBLUAddChrgFrm.dbgrdDets.datasource.dataset do
    begin
      for x:=0 to pred(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Count) do
      begin
        ExtraCharge := TExtraCharge.Create;
        GotoBookmark(TBookmark(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Items[x]));
        ExtraCharge.Details := FieldByName('Details').asString;
        ExtraCharge.Amount := FieldByName('Amount').asFloat;
        ExtraCharge.QuotationPrice := FieldByName('Quotation_price').asFloat;
        ChargeList.Add(ExtraCharge);
      end;
      DetailsEdit.Text := FieldByName('Details').asString;
      CostMemo.Text := FloatToStr(FieldByName('Amount').asFloat);
      PriceMemo.Text := FloatToStr(FieldByName('Quotation_price').asFloat);
    end;
  finally
    PBLUAddChrgFrm.Free;
  end;

end;

end.
