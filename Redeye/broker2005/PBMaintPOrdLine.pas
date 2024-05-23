(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Purchase Order Lines form.

VSS Info:
$Header: /PBL D5/PBMaintPOrdLine.pas 23    20/06/03 9:53 Andrewh $
$History: PBMaintPOrdLine.pas $
 * 
 * *****************  Version 23  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 22  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 21  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 20  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 19  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 18  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:38
 * Updated in $/PBL D5
 * Added a host of new fields to the Purchase Order line, Delivery
 * Details, Call Off details objects.
 * 
 * *****************  Version 16  *****************
 * User: Paul         Date: 19/03/:1   Time: 11:12
 * Updated in $/PBL D5
 * When entering Customer Description the Supplier description will
 * default, also identifies whether th Box Qty has changed.
 * 
 * *****************  Version 15  *****************
 * User: Janiner      Date: 12/10/:0   Time: 11:47
 * Updated in $/PBL D5
 * Standardise formatdatetime to use PBDatestr in PBPOObjects, which
 * formats the date based on the selections in the control panel, regional
 * settings, data, short style.
 * 
 * *****************  Version 14  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:25
 * Updated in $/PBL D5
 * Allow '' in date selection until checked in check routine
 * 
 * *****************  Version 13  *****************
 * User: Janiner      Date: 3/10/:0    Time: 11:25
 * Updated in $/PBL D5
 * set maxlength of on date to 10 not 8
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 3/10/:0    Time: 10:48
 * Updated in $/PBL D5
 * Allow input of required by date, in addition to look-up facility.
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 6/07/:0    Time: 16:45
 * Updated in $/PBL D5
 * A new field called Numbering has been introduced which allows the
 * specifying of the range of numbers to be included in the Purchase
 * Order, these number details can then be printed on Delivery Notes
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 5/07/:0    Time: 14:27
 * Updated in $/PBL D5
 * The Artwork section has been increased to allow greater description of
 * the Artwork requirements.
 * 
 * The Customer Description and the Supplier Description fields have been
 * increased to allow greater detail to be entered, both now allow up to
 * 80 characters.
 * 
 * The Proof section has been moved to the bottom right-hand corner of the
 * screen.
 * 
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 3/05/:0    Time: 14:59
 * Updated in $/PBL D5
 * Changes made to display the Form Reference description
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 23/02/:0   Time: 17:19
 * Updated in $/PBL D5
 * Fix dates being displayed when date value = 0.  Fix bug in Proof
 * History record updates.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 17/02/:0   Time: 12:08
 * Updated in $/PBL D5
 * Changed to ensure that Supplier Description is always entered.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 11/02/:0   Time: 15:29
 * Updated in $/PBL D5
 * Fix bug where all questions were not being associated with a Purchase
 * Order, especially when adding from scratch rather than from an enquiry.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 7/02/:0    Time: 14:57
 * Updated in $/PBL D5
 * Change field Price_Unit from char to integer so we can have more than 9
 * price units.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 2/02/:0    Time: 10:11
 * Updated in $/PBL D5
 * Change OrderUnit and SellUnit from incorrect integer to char (the key
 * field to Price_Unit table is a single character, not necessarily
 * numeric).  Also, when displaying cost and sell price, calculate the
 * total rather than show unit prices.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 24/12/99   Time: 9:56
 * Updated in $/PBL D5
 * Database changes so Purchase Orders don't need to refer to Enquiry
 * details.  Fixes to Quotation letter to show all quantities.  
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 10/12/99   Time: 17:16
 * Updated in $/PBL D5
 * Changed the layout of the Purchase Order line screen and updated the
 * Depth, Width, Artwork and Unist fields correctly
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 13  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:33
 * Updated in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBMaintPOrdLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, PBPOObjects,
  ComCtrls;

type
  TPBMaintPOrdLineFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    SuppGrpBox: TGroupBox;
    Label1: TLabel;
    SuppRefEdit: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    SuppJobRefEdit: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    CustRefEdit: TEdit;
    Label8: TLabel;
    CustNameEdit: TEdit;
    CustBranchEdit: TEdit;
    Label9: TLabel;
    CustLUBtn: TButton;
    QtysGrpBox: TGroupBox;
    Label20: TLabel;
    FormRefEdit: TEdit;
    FormRefButton: TButton;
    FormRefClrBitBtn: TBitBtn;
    Label15: TLabel;
    QtyMemo: TMemo;
    Label16: TLabel;
    OrdPriceMemo: TMemo;
    Label18: TLabel;
    SellPriceMemo: TMemo;
    ListPriceMemo: TMemo;
    Label13: TLabel;
    Label7: TLabel;
    SellUnitDBLCB: TDBLookupComboBox;
    OrderUnitDBLCB: TDBLookupComboBox;
    labEnquiryNo: TLabel;
    Label10: TLabel;
    ReqByDateEdit: TEdit;
    ReqByDateLUBtn: TButton;
    Label11: TLabel;
    ExpectedLifeSpinEdit: TSpinEdit;
    Label19: TLabel;
    RepEdit: TEdit;
    RepLUButton: TButton;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    ProdTypeEdit: TEdit;
    Label3: TLabel;
    DepthEdit: TEdit;
    Unit1: TEdit;
    UpDown1: TUpDown;
    SizeCombo: TComboBox;
    Label22: TLabel;
    Unit2: TEdit;
    UpDown2: TUpDown;
    WidthEdit: TEdit;
    Label14: TLabel;
    ProdTypeBtn: TButton;
    Label21: TLabel;
    FormsPerBoxEdit: TEdit;
    Label25: TLabel;
    ContactLUBtn: TButton;
    ContactCombo: TComboBox;
    PlateChangeLbl: TLabel;
    PlateChangeSpin: TSpinEdit;
    FormDescEdit: TEdit;
    Label17: TLabel;
    CustDescEdit: TMemo;
    SuppDescEdit: TMemo;
    Label24: TLabel;
    ArtEdit: TMemo;
    NumberingEdit: TEdit;
    Label26: TLabel;
    Label23: TLabel;
    SetsEdit: TEdit;
    OnHoldChkBox: TCheckBox;
    ProofsGrpBox: TGroupBox;
    ProofByLabel: TLabel;
    ProofStatLabel: TLabel;
    ProofsReqChkBox: TCheckBox;
    ProofsDateEdit: TEdit;
    ProofDateBtn: TButton;
    ProofStatDBLUCB: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CustLUBtnClick(Sender: TObject);
    procedure ProdTypeBtnClick(Sender: TObject);
    procedure ProofsReqChkBoxClick(Sender: TObject);
    procedure ProofDateBtnClick(Sender: TObject);
    procedure ReqByDateLUBtnClick(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure RepLUButtonClick(Sender: TObject);
    procedure FormRefButtonClick(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
    procedure SizeComboDropDown(Sender: TObject);
    procedure SizeComboClick(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure ContactLUBtnClick(Sender: TObject);
    procedure ContactComboDropDown(Sender: TObject);
    procedure ReqByDateEditExit(Sender: TObject);
    procedure ProofsDateEditExit(Sender: TObject);
    procedure FormsPerBoxEditExit(Sender: TObject);
    procedure CustDescEditChange(Sender: TObject);
    procedure CustDescEditEnter(Sender: TObject);
    procedure CustDescEditExit(Sender: TObject);
  private
    FbAllowDescChg: boolean;
    procedure SetbAllowDescChg(const Value: boolean);
  private
    FOrderLine: TOrderLine;
    FFuncMode: Char;
    FPONumber: real;
    sOldValue: string;
    FFormsPerBoxChange: boolean;
    procedure CreateDelivery;
    procedure CreateQuestions;
    procedure UpdateOrderLine;
    function JobIsInBag: Boolean;
    procedure NewOrderLine;
    procedure LoadOrderLine;
    procedure SetFormsPerBoxChange(const Value: boolean);
    property bAllowDescChg: boolean read FbAllowDescChg write SetbAllowDescChg;
  public
    bOK: Boolean;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property OrderLine: TOrderLine read FOrderLine write FOrderLIne;
    property PONumber: real read FPONumber write FPONumber;
    property FormsPerBoxChange: boolean read FFormsPerBoxChange write SetFormsPerBoxChange;
  end;

var
  PBMaintPOrdLineFrm: TPBMaintPOrdLineFrm;

implementation

uses UITypes, FireDAC.Stan.Param, 
  PBMaintPOrd, PBLUCust, PBLUPrdTyp, PBLURep, PBLUFormRef, PBPODataMod,
  DateSelV5, PBLUCConta;

{$R *.DFM}

procedure TPBMaintPOrdLineFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintPOrdLineFrm.NewOrderLine;
begin
  {Empty details}
  SuppDescEdit.Text := '';
  SuppRefEdit.Text := '';
  SuppJobRefEdit.Text := '';
  CustNameEdit.Text := '';
  CustBranchEdit.Text := '';
  CustDescEdit.Text := '';
  CustRefEdit.Text := '';
  FormRefEdit.Text := '';
  FormsperboxEdit.Text := '';
  ReqByDateEdit.Text := PBDateStr(date);
  ExpectedLifeSpinEdit.Value := 1;
  ProdTypeEdit.Text := '';
  OrderUnitDBLCB.KeyValue :=0;
  SellUnitDBLCB.KeyValue := 0;
  ContactCombo.Items.Clear;
  ProofsReqChkBox.Checked := False;
  ProofsDateEdit.Text := '';
  QtyMemo.Text := '';
  OrdPriceMemo.Text := '0.00';
  ListPriceMemo.Text := '0.00';
  SellPriceMemo.Text := '0.00';
end;

procedure TPBMaintPOrdLineFrm.LoadOrderLine;
var
  sText : string;
begin
  with OrderLine do
  begin
    SuppDescEdit.Text := SuppliersDesc;
    SuppRefEdit.Text := SupplierReference;
    FormsPerBoxEdit.Text := FormsPerBox;
    SuppJobRefEdit.Text := SupplierJobRef;
    CustNameEdit.Text := PBPODM.GetCustName(Customer);
    CustBranchEdit.Text := PBPODM.GetCustBranchName(Customer, BranchNo);
    ContactComboDropDown(nil);
    sText := PBPODM.GetCustContactName(Customer, BranchNo, CustomerContact);
    ContactCombo.Itemindex := ContactCombo.Items.IndexOf(stext);
    CustDescEdit.Text := CustomersDesc;
    CustRefEdit.Text := CustOrderNo;
    FormRefEdit.Text := PBPODM.GetFormRef(FormReference);
    FormDescEdit.Text := PBPODM.GetFormDesc(FormReference);
    ReqByDateEdit.Text := DateToStr(GoodsRequired);
    ExpectedLifeSpinEdit.Value := ExpectedLife;
    ProdTypeEdit.Text := PBPODM.GetProdTypeDesc(ProductType);
    RepEdit.Text := PBPODM.GetRepDesc(Rep);
    ProofsReqChkBox.Checked := ProofRequired;
    if ProofDate < 1 then { unassigned }
      ProofsDateEdit.Text := ''
    else
      ProofsDateEdit.Text := DateToStr(ProofDate);
    QtyMemo.Text := FormatQty(Quantity);
    OrdPriceMemo.Text := FormatMoney(OrderPrice);
    ListPriceMemo.Text := FormatMoney(ListPrice);
    SellPriceMemo.Text := FormatMoney(SellingPrice);
    OrderUnitDBLCB.KeyValue := OrderUnit;
    SellUnitDBLCB.KeyValue := SellUnit;
    if ProofStatus = '' then
      ProofStatDBLUCB.KeyValue := 0
    else
      ProofStatDBLUCB.KeyValue := ProofStatus;
(*
    if NCROTCMix = '' then
      NCRLookup.KeyValue := null
    else
      NCRLookup.KeyValue := NCROTCMix;
*)
    DepthEdit.Text := PBFloatStr(Depth);
    if DepthUnit = '' then
      DepthUnit := cMillimetres;
    Unit1.Text := DepthUnit;
    WidthEdit.Text := PBFloatStr(Width);
    if WidthUnit = '' then
      WidthUnit := cMillimetres;
    Unit2.Text := WidthUnit;
    ArtEdit.Text := Artwork;
    NumberingEdit.Text := Numbering;
    PlateChangeSpin.Value := NoOfPlateChanges;
    SetsEdit.text := NoOfSets;
    if OnHold = 'Y' then
      OnHoldChkBox.checked := true
    else
      OnHoldChkBox.checked := false;
  end;
end;

procedure TPBMaintPOrdLineFrm.FormActivate(Sender: TObject);
begin
  FormsPerBoxChange := False;
  bOK := False;
  {Re-activate the lookup SQLs}
  with PBPODM do
  begin
    GetPriceUnitSQL1.Active := False;
    GetPriceUnitSQL1.Active := True;
    GetPriceUnitSQL2.Active := False;
    GetPriceUnitSQL2.Active := True;
    GetProofStatSQL.Active := False;
    GetProofStatSQL.Active := True;
    NCRSQL.Active := False;
    NCRSQL.Active := True;
  end;
  {Setup titles}
  if FFuncMode = poAdd then
    Caption := 'Add a new order line'
  else
    if FFuncMode = poChange then
      Caption := 'Change an order line'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete an order line'
      else
        if FFuncMode = poView then
          Caption := 'View purchase order line';
  if FFuncMode = poAdd then
    NewOrderLine
  else
    LoadOrderLine;
  if FPONumber = 0 then
    DetsGrpBox.Caption := 'Purchase Order: <New>   Line: '
  else
    DetsGrpBox.Caption := 'Purchase Order: ' + floatToStr(FPONumber) +
      '   Line: ';
  if FuncMode = poAdd then
    DetsGrpBox.Caption := DetsGrpBox.Caption + '<New>'
  else
    DetsGrpBox.Caption := DetsGrpBox.Caption + IntToStr(OrderLine.Line);
  DetsGrpBox.Caption := DetsGrpBox.Caption + '   Supplier: ' +
    OrderLine.SuppliersDesc;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not CharInSet(FFuncMode, [poDelete, poView]);
  DelLabel.Visible := (FFuncMode = poDelete);
  ProofsReqChkBoxClick(Self);
  OKBitBtn.Visible := (FFuncMode <> poView);
  if OrderLine.Enquiry > 0 then
    labEnquiryNo.Caption := 'Original Enquiry No. ' +
      PBIntStr(OrderLine.Enquiry)
  else
    labEnquiryNo.Hide;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := ((CustNameEdit.Text <> '') and
     (SuppDescEdit.Text <> '') and
    (CustBranchEdit.Text <> '') and
    (CustRefEdit.Text <> '') and
    (ProdTypeEdit.Text <> '') and
    (RepEdit.Text <> '') and
    (OrderUnitDBLCB.KeyValue <> 0) and
    (SellUnitDBLCB.KeyValue <> 0) and
    (CustNameEdit.Text <> '') and
    (CustBranchEdit.Text <> '') and
    (ContactCombo.Text <> '') and
    (QtyMemo.Text <> '') and
    (OrdPriceMemo.Text <> '') and
    (SellPriceMemo.Text <> '') and
//    (NCRLookup.Text <> '') and
    (DepthEdit.Text <> '') and
    (WidthEdit.Text <> '') and
    {(ListPriceMemo.Text <> '') and }
    (ReqByDateEdit.Text <> '') and
    (((ProofsDateEdit.Text <> '') and
    ((ProofStatDBLUCB.KeyValue <> 0) or (not (ProofStatDBLUCB.Visible))))
    or (not (ProofsReqChkBox.Checked)))) or
    (FFuncMode = poDelete);
end;

procedure TPBMaintPOrdLineFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPOrdLineFrm.CreateDelivery;
var
  aLine: TDeliveryLine;
begin
  aLine := TDeliveryLine.Create;
  with aLine do
  begin
    Line := OrderLine.Line;
    DeliveryNo := 1;
    QtyToDeliver := PBFloatStr(QtyMemo.Text);
    DatePoint := Date;
    NoOfBoxes := PBMaintPOrdfrm.GetNumberofBoxes(OrderLine.FormsPerBox,QtyToDeliver);
    Customer := OrderLine.Customer;
    BranchNoZero := OrderLine.BranchNo;
  end;
  OrderLine.DeliveryLines.Add(aLine);
end;

procedure TPBMaintPOrdLineFrm.UpdateOrderLine;
begin
  with OrderLine do
  begin
    SuppliersDesc := SuppDescEdit.Text;
    SupplierReference := SuppRefEdit.Text;
    SupplierJobRef := SuppJobRefEdit.Text;
    CustomersDesc := CustDescEdit.Text;
    CustOrderNo := CustRefEdit.Text;
    GoodsRequired := PBDateStr(ReqByDateEdit.Text);
    ExpectedLife := ExpectedLifeSpinEdit.Value;
    ProofRequired := ProofsReqChkBox.Checked;
    ProofDate := PBDateStr(ProofsDateEdit.Text);
    if ProofStatDBLUCB.KeyValue = 0 then
      ProofStatus := ''
    else
      ProofStatus := ProofStatDBLUCB.KeyValue;
(*
    if NCRLookup.KeyValue = null then
      NCROTCMix := ''
    else
      NCROTCMix := NCRLookup.KeyValue;
*)
    Quantity := PBFloatStr(QtyMemo.Text);
    OrderPrice := PBFloatStr(OrdPriceMemo.Text);
    ListPrice := PBFloatStr(ListPriceMemo.Text);
    SellingPrice := PBFloatStr(SellPriceMemo.Text);
    OrderUnit := OrderUnitDBLCB.KeyValue;
    SellUnit := SellUnitDBLCB.KeyValue;
    FormsPerBox := FormsPerBoxEdit.Text;
    Depth := PBFloatStr(DepthEdit.Text);
    DepthUnit := Unit1.Text;
    Width := PBFloatStr(WidthEdit.Text);
    WidthUnit := Unit2.Text;
    ArtWork := ArtEdit.Text;
    Numbering := NumberingEdit.Text;
    NoOfPlateChanges := PlateChangeSpin.Value;
    if ContactCombo.ItemIndex >= 0 then
      CustomerContact :=
        integer(ContactCombo.Items.Objects[ContactCombo.ItemIndex]);
    if ONHoldchkBox.checked then
      OnHold := 'Y'
    else
      OnHold := 'N';
    NoOfSets := SetsEdit.text;
  end;
end;

procedure TPBMaintPOrdLineFrm.OKBitBtnClick(Sender: TObject);
begin
  if FFuncMode = poAdd then
  begin
    UpdateOrderLine;
    {If no delivery details have been specified on a new order line}
    {Setup a delivery to the customer, or company if there is no customer}
    if OrderLine.DeliveryLines.Count = 0 then
      CreateDelivery;
    if OrderLine.Questions.Count = 0 then
      CreateQuestions;
  end
  else
    if FFuncMode = poChange then
      UpdateOrderLine
    else
      if FFuncMode = poDelete then
      begin
        if MessageDlg('Really delete these details ?', mtConfirmation,
          [mbNo, mbYes], 0) <> mrYes then
        begin
          Close;
          Exit;
        end;
      end;
  bOK := True;
  Close;
end;

function TPBMaintPOrdLineFrm.JobIsInBag: Boolean;
begin
  { If you're amending an existing line, block customer changes where
    the Purchase Order Line is already in a job bag }
  Result := False;
  with PBPODM.GetJobBagDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := FPONumber;
    ParamByName('Line').AsInteger := OrderLine.Line;
    Open;
    First;
    if not EOF then
    begin
      MessageDlg('You cannot change the customer because this Purchase ' +
        'Order Line is in job bag number ' +
        IntToStr(FieldByName('Job_Bag').AsInteger), mtError, [mbOK], 0);
      Result := True;
    end;
    Close;
  end;
end;

procedure TPBMaintPOrdLineFrm.CustLUBtnClick(Sender: TObject);
begin
  if (FFuncMode = poChange) and JobIsInBag then
    Exit;
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := OrderLine.Customer;
    PBLUCustFrm.SelBranch := OrderLine.BranchNo;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      if (OrderLine.Customer <> PBLUCustFrm.SelCode)
        or (OrderLine.BranchNo <> PBLUCustFrm.SelBranch) then
      begin {The form reference will be invalid for another customer}
        OrderLine.FormReference := 0;
        FormRefEdit.Text := '';
        FormDescEdit.Text := '';
        {And so will the REP}
        OrderLine.Rep := PBPODM.DefaultRep(PBLUCustFrm.SelCode,
          PBLUCustFrm.SelBranch);
        RepEdit.Text := PBPODM.GetRepDesc(OrderLine.Rep);
      end;
      OrderLine.Customer := PBLUCustFrm.SelCode;
      CustNameEdit.Text := PBLUCustFrm.SelName;
      OrderLine.BranchNo := PBLUCustFrm.SelBranch;
      CustBranchEdit.Text := PBLUCustFrm.SelBranchName;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.ProdTypeBtnClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := OrderLine.ProductType;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      OrderLine.ProductType := PBLUPrdTypFrm.SelCode;
      ProdTypeEdit.Text := PBLUPrdTypFrm.SelName;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.ProofsReqChkBoxClick(Sender: TObject);
begin
  ProofsDateEdit.Enabled := ProofsReqChkBox.Checked;
  ProofDateBtn.Enabled := ProofsReqChkBox.Checked;
  ProofByLabel.Enabled := ProofsReqChkBox.Checked;
  ProofStatLabel.Enabled := ProofsReqChkBox.Checked;
  ProofStatDBLUCB.Enabled := ProofsReqChkBox.Checked;

  if (not OrderLine.ProofRequired) and (ProofsReqChkBox.Checked) then
  begin
    ProofStatLabel.Visible := True;
    ProofStatDBLUCB.Visible := True;
  end
  else
  begin
    ProofStatLabel.Visible := False;
    ProofStatDBLUCB.Visible := False;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.ProofDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(ProofsDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      ProofsDateEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdLineFrm.ReqByDateLUBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(ReqByDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      ReqByDateEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdLineFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.ValidateMoney(Sender: TObject);
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
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdLineFrm.RepLUButtonClick(Sender: TObject);
begin
  {Lookup a rep}
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := True;
    PBLURepFrm.SelCode := OrderLine.Rep;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      OrderLine.Rep := PBLURepFrm.SelCode;
      RepEdit.Text := PBLURepFrm.SelName;
    end;
  finally
    PBLURepFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.FormRefButtonClick(Sender: TObject);
begin
  if (FFuncMode = poChange) and JobIsInBag then
    Exit;
  PBLUFormRefFrm := TPBLUFormRefFrm.Create(Self);
  try
    PBLUFormRefFrm.bIs_Lookup := True;
    PBLUFormRefFrm.bAllow_Upd := True;
    PBLUFormRefFrm.iCust := OrderLine.Customer;
    PBLUFormRefFrm.sCustName := CustNameEdit.Text;
    PBLUFormRefFrm.iBranch := OrderLine.BranchNo;
    PBLUFormRefFrm.sBranchName := CustBranchEdit.Text;
    PBLUFormRefFrm.SelCode := OrderLine.FormReference;
    PBLUFormRefFrm.ShowModal;
    if PBLUFormRefFrm.bSelected then
    begin
      OrderLine.FormReference := PBLUFormRefFrm.SelCode;
      FormRefEdit.Text := PBLUFormRefFrm.SelName;
      FormDescEdit.Text := PBLUFormRefFrm.SelDescr;
    end;
  finally
    PBLUFormRefFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineFrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  OrderLine.FormReference := 0;
  FormRefEdit.Text := '';
  FormDescEdit.Text := '';
end;

procedure TPBMaintPOrdLineFrm.SizeComboDropDown(Sender: TObject);
var
  stext: string;
begin
  with PBPODM.StdSizeSQL do
  begin
    Close;
    Open;
    stext := SizeCombo.Text;
    SizeCombo.Clear;
    First;
    while not EOF do
    begin
      SizeCombo.Items.Add(FieldByName('Description').AsString);
      Next;
    end;
    SizeCombo.Itemindex := SizeCombo.Items.IndexOf(sText);
  end;
end;

procedure TPBMaintPOrdLineFrm.SizeComboClick(Sender: TObject);
begin
  with PBPODM.StdSizeSQL do
  begin
    First;
    Moveby(SizeCombo.itemindex);
    DepthEdit.Text := FieldByName('Paper_Depth_mm').AsString;
    Unit1.Text := cMillimetres;
    WidthEdit.Text := FieldByName('Paper_Width_mm').AsString;
    Unit2.Text := cMillimetres;
  end;
end;

procedure TPBMaintPOrdLineFrm.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Unit1.Text = cMillimetres then
    Unit1.Text := cInches
  else
    Unit1.Text := cMillimetres;
end;

procedure TPBMaintPOrdLineFrm.UpDown2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Unit2.Text = cMillimetres then
    Unit2.Text := cInches
  else
    Unit2.Text := cMillimetres;
end;

procedure TPBMaintPOrdLineFrm.ContactLUBtnClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := OrderLine.Customer;
    PBLUCContaFrm.iBranch := OrderLine.BranchNo;
    PBLUCContaFrm.sCustName := CustNameedit.Text;
    PBLUCContaFrm.sBranchName := CustBranchedit.Text;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      OrderLine.CustomerContact := PBLUCContaFrm.SelCode;
      ContactComboDropDown(Self);
      ContactCombo.Itemindex :=
        ContactCombo.Items.Indexof(PBLUCContaFrm.SelName);
    end;
  finally
    PBLUCContaFrm.Free;
  end;
end;

procedure TPBMaintPOrdLineFrm.ContactComboDropDown(Sender: TObject);
var
  stext: string;
begin
  with PBPODM do
  begin
    CustContactSQL.Close;
    CustContactSQL.ParamByName('Customer').AsInteger := OrderLine.Customer;
    CustContactSQL.ParamByName('Branch').AsInteger := OrderLine.BranchNo;
    CustContactSQL.Open;
    stext := ContactCombo.Text;
    ContactCombo.Items.Clear;
    while (not CustContactSQL.EOF) do
    begin
      ContactCombo.Items.AddObject
        (Trim(CustContactSQL.FieldByName('Name').AsString),
         TObject(CustContactSQL.FieldByName('Contact_No').AsInteger));
      CustContactSQL.Next;
    end;
    CustContactSQL.Close;
    if ContactCombo.Items.Count = 1 then
      ContactCombo.Itemindex := 0
    else
      ContactCombo.Itemindex := ContactCombo.Items.IndexOf(stext);
    if ContactCombo.Itemindex = -1 then
      ContactCombo.Text := stext;
  end;
end;

procedure TPBMaintPOrdLineFrm.CreateQuestions;
var
  aQuestion: TQuestion;
begin
  { Add all questions for this product type. }
  with PBPODM.AnyQuestions do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := OrderLine.ProductType;
    Open;
    while not EOF do
    begin
      aQuestion := TQuestion.Create;
      with aQuestion do
      begin
        ProductType := OrderLine.ProductType;
        QuestionNo := FieldByName('Question').AsInteger;
        QuestionText := FieldByName('Question_Text').AsString;
      end;
      OrderLine.Questions.Add(aQuestion);
      Next;
    end;
    Close;
  end;
end;

procedure TPBMaintPOrdLineFrm.ReqByDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If ReqByDateEdit.Text = '' then
    Exit;
    try
    NewDate := StrToDate(ReqByDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      ReqByDateEdit.SetFocus;
      Exit;
    end;
  end;

  ReqByDateEdit.Text := PBDatestr(NewDate);

end;

procedure TPBMaintPOrdLineFrm.ProofsDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(ProofsDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      ProofsDateEdit.SetFocus;
      Exit;
    end;
  end;

  ProofsDateEdit.Text := PBDatestr(NewDate);

end;


procedure TPBMaintPOrdLineFrm.SetFormsPerBoxChange(const Value: boolean);
begin
  FFormsPerBoxChange := Value;
end;

procedure TPBMaintPOrdLineFrm.FormsPerBoxEditExit(Sender: TObject);
begin
  if OrderLine.FormsPerBox <> (Sender as Tedit).text then
    FormsPerBoxChange := true;
end;

procedure TPBMaintPOrdLineFrm.CustDescEditChange(Sender: TObject);
begin
  if bAllowDescChg then
    SuppDescEdit.text := (Sender as TMemo).text;
end;

procedure TPBMaintPOrdLineFrm.CustDescEditEnter(Sender: TObject);
begin
  if SuppDescEdit.Text = '' then
    bAllowDescChg := true;
end;

procedure TPBMaintPOrdLineFrm.CustDescEditExit(Sender: TObject);
begin
  bAllowDescChg := false;
end;

procedure TPBMaintPOrdLineFrm.SetbAllowDescChg(const Value: boolean);
begin
  FbAllowDescChg := Value;
end;

end.
