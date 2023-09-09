(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Auto-convert Enquiry to Purchase Order (Details) form.

VSS Info:
$Header: /PBL D5/PBAutoPODets.pas 18    9/07/03 14:08 Davidn $
$History: PBAutoPODets.pas $
 * 
 * *****************  Version 18  *****************
 * User: Davidn       Date: 9/07/03    Time: 14:08
 * Updated in $/PBL D5
 * 
 * *****************  Version 17  *****************
 * User: Davidn       Date: 9/07/03    Time: 13:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 16  *****************
 * User: Davidn       Date: 9/07/03    Time: 13:02
 * Updated in $/PBL D5
 * Changed to prompt for delivery address type, delivery in to stock and
 * invoiced upfront
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 6/01/:3    Time: 11:12
 * Updated in $/PBL D5
 * Changed to prevent the showing of the Add to existing PO button.
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 13/09/:2   Time: 16:06
 * Updated in $/PBL D5
 * Changed to use the Run on cost and Run On Sell price when calculating
 * Order Cost and Sell
 *
 * *****************  Version 13  *****************
 * User: Paul         Date: 13/09/:2   Time: 11:49
 * Updated in $/PBL D5
 * Fixed "division by zero" problem
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 13/09/:2   Time: 9:38
 * Updated in $/PBL D5
 * Changed to correctly work out the prices if Run On qty entered.
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 12/09/:2   Time: 10:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 5/09/:2    Time: 9:41
 * Updated in $/PBL D5
 * Changed to incorporate the selection of a Run On Qty
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 2/05/:1    Time: 12:49
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 1/02/:1    Time: 16:01
 * Updated in $/PBL D5
 * Added code to default the contact from the Enquiry
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 12/10/:0   Time: 11:47
 * Updated in $/PBL D5
 * Standardise formatdatetime to use PBDatestr in PBPOObjects, which
 * formats the date based on the selections in the control panel, regional
 * settings, data, short style.
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:03
 * Updated in $/PBL D5
 * Allow '' for date
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 4/10/:0    Time: 9:54
 * Updated in $/PBL D5
 * Set focus not set correctly after reqby date error. is now though!!!
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 3/10/:0    Time: 11:27
 * Updated in $/PBL D5
 * Enhance date routines to allow input of dates, as well as using the
 * look-up facility.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 14/03/:0   Time: 14:58
 * Updated in $/PBL D5
 * Remove Invoice Method from Purchase Order screens and objects.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 16/12/99   Time: 10:33
 * Updated in $/PBL D5
 * Changed to correct problem when multiple Contacts are available, the
 * Create Purchase Order Button never became available when creating order
 * from enquiry
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 6  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:32
 * Updated in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBAutoPODets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBCtrls, Spin, ExtCtrls, PBPOObjects, FireDAC.Stan.Param;

type
  TPBAutoPODetsFrm = class(TForm)
    pnlCustomer: TPanel;
    EnqLabel: TLabel;
    CustomerLabel: TLabel;
    pnlOrderQty: TPanel;
    Label4: TLabel;
    QtyDBLCB: TDBLookupComboBox;
    pnlFunctions: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlRunOnQty: TPanel;
    Label3: TLabel;
    Label12: TLabel;
    spedtQty: TSpinEdit;
    edtQty: TEdit;
    edtRunOnQty: TEdit;
    Label13: TLabel;
    pnlOrder: TPanel;
    Label1: TLabel;
    CustOrdEdit: TEdit;
    DatePointLabel: TLabel;
    DateEdit: TEdit;
    ProofsGrpBox: TGroupBox;
    ProofByLabel: TLabel;
    ProofStatLabel: TLabel;
    ProofsReqChkBox: TCheckBox;
    ProofsDateEdit: TEdit;
    ProofStatDBLUCB: TDBLookupComboBox;
    Label10: TLabel;
    ReqByDateEdit: TEdit;
    SuppDescEdit: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    CustDescEdit: TEdit;
    pnlDelivery: TPanel;
    AddrTypeRadGrp: TRadioGroup;
    AddrGrpBox: TGroupBox;
    mmDeliveryAddress: TMemo;
    DeliveryToStockChk: TCheckBox;
    chkbxInvoiceUpfront: TCheckBox;
    pnlSupplier: TPanel;
    SuppLabel: TLabel;
    Label7: TLabel;
    ContactDBLookupComboBox: TDBLookupComboBox;
    SelContactBtn: TButton;
    pnlPrices: TPanel;
    Label6: TLabel;
    PriceLbl: TLabel;
    Label8: TLabel;
    SellLbl: TLabel;
    Label9: TLabel;
    ListLbl: TLabel;
    OrdPriceMemo: TMemo;
    SellPriceMemo: TMemo;
    ListPriceMemo: TMemo;
    Label14: TLabel;
    CustReqDateEdit: TEdit;
    Label11: TLabel;
    ExpectedLifeSpinEdit: TSpinEdit;
    SelDateBtn: TBitBtn;
    ReqByDateLUBtn: TBitBtn;
    CustReqDateBtn: TBitBtn;
    ProofDateBtn: TBitBtn;
    spdbtnLUCust: TButton;
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SelDateBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure SelContactBtnClick(Sender: TObject);
    procedure ReqByDateLUBtnClick(Sender: TObject);
    procedure ProofsReqChkBoxClick(Sender: TObject);
    procedure ProofDateBtnClick(Sender: TObject);
    procedure CustOrdEditChange(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure SuppDescEditChange(Sender: TObject);
    procedure CustDescEditChange(Sender: TObject);
    procedure InvMethDBLCBClick(Sender: TObject);
    procedure QtyDBLCBClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ProofStatDBLUCBClick(Sender: TObject);
    procedure ContactDBLookupComboBoxClick(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure ReqByDateEditExit(Sender: TObject);
    procedure ProofsDateEditExit(Sender: TObject);
    procedure spedtQtyChange(Sender: TObject);
    procedure AddrTypeRadGrpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeliveryToStockChkClick(Sender: TObject);
    procedure CustReqDateEditExit(Sender: TObject);
    procedure CustReqDateBtnClick(Sender: TObject);
    procedure CustReqDateEditChange(Sender: TObject);
    procedure CustReqDateEditEnter(Sender: TObject);
    procedure spdbtnLUCustClick(Sender: TObject);
  private
    InvoiceUpFront: boolean;
    sOldValue: string;
    FFormOK: Boolean;
    FEnqNo,
    FEnqLineNo,
    FContact: integer;
    FExistingPO: real;
    FUseRunOn: Boolean;
    FDateEntered: Boolean;
    FActivate: Boolean;
    FOrderPrice: real;
    FSellPrice: real;
    FDeliveryDetail: TDeliveryLine;
    procedure SetDeliveryDetail(const Value: TDeliveryLine);
    procedure LookUpAdHocAddress;
    procedure LookUpSupplierAddress;
    procedure LookUpRepAddress;
    procedure LookUpCustAddress;
    procedure LookUpCompanyAddress;
  public
    FOrderQty: integer;
    FOrderUnit: integer;
    FSellUnit: integer;
    function GetEnqDets(Sender: TObject): Integer;
    property Contact: Integer read FContact;
    property FormOK: Boolean read FFormOK;
    property EnqNo: Integer read FEnqNo write FEnqNo;
    property EnqLineNo: Integer read FEnqLineNo write FEnqLineNo;
    property ExistingPO: real read FExistingPO write FExistingPO;
    property DeliveryDetail: TDeliveryLine read FDeliveryDetail write SetDeliveryDetail;
  end;

var
  PBAutoPODetsFrm: TPBAutoPODetsFrm;

implementation

uses
  System.UITypes,
  PBAutoPO, PBLUSConta, PBAutoPODataMod, DateSelV5, PBLUAdHoc, pbDatabase,
  pbMainMenu, PBLUCust;

{$R *.DFM}

procedure TPBAutoPODetsFrm.OKBitBtnClick(Sender: TObject);
begin
  FFormOK := True;
  {Set the existing PO number to 0 to force creation of a new PO};
  FExistingPO := 0;
  if FUseRunOn then
    FOrderQty := spedtQty.Value
  else
    FOrderQty := QtyDBLCB.keyvalue;
end;

procedure TPBAutoPODetsFrm.FormActivate(Sender: TObject);
begin
  Factivate := true;
  with PBAutoPODM do
  begin
    GetVATSQL.Close;
    GetVATSQL.Open;
    GetInvMethSQL.Close;
    GetInvMethSQL.Open;
    GetProofStatSQL.Active := False;
    GetProofStatSQL.Active := True;
    EnqLabel.Caption := 'Creating from enquiry: ' +
      IntToStr(GetEnqSQL.FieldByName('Enquiry').AsInteger) +
      ',   Line: ' + GetEnqSQL.FieldByName('Form_Description').AsString;
    CustomerLabel.Caption := 'Customer: ' +
      GetEnqSQL.FieldByName('Name').AsString;
    InvoiceUpfront := (GetEnqSQL.FieldByName('Invoice_upfront').AsString = 'Y');
    {Default the VAT rate to the Customer Default VAT rate};
(*    if FExistingPO = 0 then
      AddBitBtn.Visible := False
    else
    begin
      AddBitBtn.Visible := True;
      AddBitBtn.Caption := 'Add To Purch Order No: ' + floatToStr(FExistingPO);
    end;
*)
    FFormOK := False;
    DateEdit.Text := DateToStr(Date);
    FContact := 0;
    CustOrdEdit.Text := '';
    ReqByDateEdit.Text := '';
    CustReqDateEdit.Text := '';
    SuppDescEdit.Text := GetEnqSQL.FieldByName('Form_Description').AsString;
    CustDescEdit.Text := GetEnqSQL.FieldByName('Form_Description').AsString;

    FUseRunOn := (GetEnqSQL.fieldbyname('Run_on_Quantity').asstring <> '') and
                 (GetEnqSQL.fieldbyname('Run_on_Quantity').asinteger <> 0) ;

    if FUseRunOn then
      begin
        if QtyDBLCB.ListSource.dataset.recordcount = 1 then
          begin
            QtyDBLCB.ListSource.dataset.first;
            edtQty.Text := QtyDBLCB.ListSource.dataset.fieldbyname('Quantity').asstring;
            QtyDBLCB.keyvalue := QtyDBLCB.ListSource.dataset.fieldbyname('Quantity').asinteger;
            QtyDBLCBClick(self);
          end
        else
          edtQty.Text := '0';

        edtRunOnQty.Text := GetEnqSQL.fieldbyname('Run_on_Quantity').asstring;
        spedtQty.Value := strtoint(edtQty.Text);
        spedtQty.increment := GetEnqSQL.fieldbyname('Run_on_Quantity').asinteger;
        spedtQty.MinValue := QtyDBLCB.ListSource.dataset.fieldbyname('Quantity').asinteger;
        spedtQty.MaxValue := 99999999;
      end;
    pnlRunOnQty.Visible := FUseRunON;
    pnlOrderQty.Visible := not FUseRunON;
  end;
  ProofsReqChkBox.Checked := False;
  ProofsDateEdit.Text := '';
  ProofsReqChkBoxClick(Self);
  self.AddrTypeRadGrp.ItemIndex := 3;
  chkbxInvoiceUpfront.Enabled := false;
  self.LookUpCustAddress;

  CheckOK(Self);
  Factivate := false;
end;

procedure TPBAutoPODetsFrm.SelDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DateEdit.Text);
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

procedure TPBAutoPODetsFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (DateEdit.Text <> '') and
    (FContact <> 0) and
    (CustOrdEdit.Text <> '') and
    (ReqByDateEdit.Text <> '') and
    (CustReqDateEdit.Text <> '') and
    (SuppDescEdit.Text <> '') and
    (CustDescEdit.Text <> '') and
    (QtyDBLCB.KeyValue <> 0) and
    (OrdPriceMemo.Text <> '') and
    (SellPriceMemo.Text <> '') and
    (ListPriceMemo.Text <> '') and
    (not ((ProofsReqChkBox.Checked)) or
    ((ProofsDateEdit.Text <> '') and (ProofStatDBLUCB.text <> '')));
//  AddBitBtn.Enabled := OKBitBtn.Enabled;
end;

function TPBAutoPODetsFrm.GetEnqDets(Sender: TObject): Integer;
var
  opStatus: integer;
begin
  {Get the enquiry line detais};
  with PBAutoPODM.GetEnqSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := EnqNo;
    ParamByName('Line').AsInteger := EnqLineNo;
    Open;
    Result := RecordCount;
    if RecordCount < 1 then
    begin
      MessageDlg('Some details are missing for this enquiry - ' +
        'cannot convert to purchase order', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  {Get the enquiry quantities};
  with PBAutoPODM.GetQtysSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := EnqNo;
    ParamByName('Line').AsInteger := EnqLineNo;
    Open;
  end;

  with PBAutoPODM.qryJobTypes do
  begin
    close;
    ParamByName('job_type').asInteger := PBAutoPODM.GetEnqSQL.FieldByName('job_type').asInteger;

    open;
  end;
  //check to see if the job type will prevent the operator from converting the enquiry
  //is the operator a rep
  opStatus :=  dmBroker.GetButtonStatus(frmPBMainMenu.iOperator, 'POEnqToPOBitBtn');
  if opStatus = 4 then
  begin
    //operator is rep so need more checks

    //first can a rep convert the enquiry
    if (PBAutoPODM.qryJobTypes.FieldByName('Rep_Can_Convert_Enquiry').asString = 'N') then
    begin
      //reps are not allowed to convert this type of enquiry
      messageDlg('The selected enquiry cannot be converted by a Rep.', mtInformation, [mbOK], 0);
      result := 0;
      exit;
    end
    else
    begin
      //reps are allowed to convert this type of enquiry but it must be the right rep
      if PBAutoPODM.GetEnqSQL.FieldByName('rep').asInteger <> frmPBMainMenu.iRep then
      begin
        messageDlg('You cannot convert this enquiry. You are not the associated Rep.', mtInformation, [mbOK],0);
        Result := 0;
        exit;
      end;
    end;
  end;

  //if job type doesn't allow delivery to stock
  //then remove company from the list of delivery options
  if (PBAutoPODM.GetEnqSQL.FieldByName('job_type').asInteger <> 0) and
        (PBAutoPODM.qryJobTypes.FieldByName('Can_Deliver_to_Stock').asString <> 'Y') then
    self.AddrTypeRadGrp.Items.Delete(4);
end;

procedure TPBAutoPODetsFrm.SelContactBtnClick(Sender: TObject);
begin
  PBLUSContaFrm := TPBLUSContaFrm.Create(Self);
  with PBAutoPODM do
  try
    PBLUSContaFrm.bIs_Lookup := True;
    PBLUSContaFrm.bAllow_Upd := True;
    PBLUSContaFrm.SelCode := FContact;
    PBLUSContaFrm.iSupp := GetQtysSQL.FieldByName('Supplier').AsInteger;
    PBLUSContaFrm.iBranch := GetQtysSQL.FieldByName('Branch_No').AsInteger;
    PBLUSContaFrm.sSuppName := GetQtysSQL.FieldByName('Supp_Name').AsString;
    PBLUSContaFrm.sBranchName := GetQtysSQL.FieldByName('Branch_Name').AsString;
    PBLUSContaFrm.SelCode := FContact;
    PBLUSContaFrm.ShowModal;
    if PBLUSContaFrm.bSelected then
    begin
      FContact := PBLUSContaFrm.SelCode;
      with ContactSRC.dataset do
      begin
        active := False;
        active := True;
      end;
      ContactDBLookupComboBox.keyvalue := FContact;
    end;
  finally
    PBLUSContaFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.ReqByDateLUBtnClick(Sender: TObject);
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

procedure TPBAutoPODetsFrm.ProofsReqChkBoxClick(Sender: TObject);
begin
  ProofsDateEdit.Enabled := ProofsReqChkBox.Checked;
  ProofDateBtn.Enabled := ProofsReqChkBox.Checked;
  ProofByLabel.Enabled := ProofsReqChkBox.Checked;
  ProofStatLabel.Enabled := ProofsReqChkBox.Checked;
  ProofStatDBLUCB.Enabled := ProofsReqChkBox.Checked;
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.ProofDateBtnClick(Sender: TObject);
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

procedure TPBAutoPODetsFrm.CustOrdEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.SuppDescEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.CustDescEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.InvMethDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.QtyDBLCBClick(Sender: TObject);
begin
  {Put in the prices}
  with PBAutoPODM do
  begin
    FOrderPrice := QtysSRC.DataSet.FieldByName('Supplier_Price').AsFloat;
    FSellPrice := QtysSRC.DataSet.FieldByName('Marked_Up_Price').AsFloat;
    if FUseRunOn then
      begin
      if QtysSRC.DataSet.FieldByName('Price_Unit_Factor').asinteger = 0 then
        OrdPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(FOrderPrice))
      else
        OrdPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(((QtysSRC.DataSet.FieldByName('Quantity').Asinteger/
                             QtysSRC.DataSet.FieldByName('Price_Unit_Factor').Asinteger)*
                             FOrderPrice)));

      if QtysSRC.DataSet.FieldByName('Sell_Unit_Factor').asinteger = 0 then
        SellPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(FSellPrice))
      else
        SellPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(((QtysSRC.DataSet.FieldByName('Quantity').Asinteger/
                             QtysSRC.DataSet.FieldByName('Sell_Unit_Factor').Asinteger)*
                             FSellPrice)));

      FOrderPrice := StrToFloatDef(OrdPriceMemo.Text, 0, FormatSettings);
      FSellPrice := StrToFloatDef(SellPriceMemo.Text, 0, FormatSettings);

      ListPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(0));
      SuppLabel.Caption := 'Supplier/Branch: ' +
        Trim(QtysSRC.DataSet.FieldByName('Supp_Name').AsString) + '/' +
        QtysSRC.DataSet.FieldByName('Branch_Name').AsString;
(*      PriceLbl.Caption :=
        QtysSRC.DataSet.FieldByName('Price_Unit_Descr').AsString;
      SellLbl.Caption := QtysSRC.DataSet.FieldByName('Sell_Unit_Descr').AsString;
      ListLbl.Caption := QtysSRC.DataSet.FieldByName('Sell_Unit_Descr').AsString;
*)
      PriceLbl.Caption := GetPriceUnitDescr(2); {Hard coded Total Job price Unit}
      SellLbl.Caption := GetPriceUnitDescr(2);  {Hard coded Total Job price unit}
      ListLbl.Caption := GetPriceUnitDescr(2);  {Hard coded Total Job price unit}
      FOrderUnit := 2;
      FSellUnit := 2;
      end
    else
      begin
      OrdPriceMemo.Text :=
        FormatMoneyTo3DP(FloatToStr(QtysSRC.DataSet.FieldByName('Supplier_Price').AsFloat));
      SellPriceMemo.Text :=
        FormatMoneyTo3DP(FloatToStr(QtysSRC.DataSet.FieldByName('Marked_Up_Price').AsFloat));
      ListPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(0));
      SuppLabel.Caption := 'Supplier/Branch: ' +
        Trim(QtysSRC.DataSet.FieldByName('Supp_Name').AsString) + '/' +
        QtysSRC.DataSet.FieldByName('Branch_Name').AsString;
      PriceLbl.Caption :=
        QtysSRC.DataSet.FieldByName('Price_Unit_Descr').AsString;
      SellLbl.Caption := QtysSRC.DataSet.FieldByName('Sell_Unit_Descr').AsString;
      ListLbl.Caption := QtysSRC.DataSet.FieldByName('Sell_Unit_Descr').AsString;
      FOrderUnit := GetQtysSQL.FieldByName('Price_Unit').AsInteger;
      FSellUnit := GetQtysSQL.FieldByName('Sell_Unit').AsInteger;
      end;

    PriceLbl.Visible := true;
    SellLbl.Visible := true;
    {Get the Supplier Contact Details}
    with GetContactSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger :=
        QtysSRC.DataSet.FieldByName('Supplier').AsInteger;
      ParamByName('Branch_No').AsInteger :=
        QtysSRC.DataSet.FieldByName('Branch_No').AsInteger;
      Open;
      if RecordCount = 1 then
      begin
        ContactDBLookupComboBox.keyvalue := 1;
        FContact := ContactSRC.dataset.FieldByName('Contact_no').AsInteger;
      end
      else
        begin
        ContactDBLookupComboBox.keyvalue := QtysSRC.Dataset.fieldbyname('Contact_no').asinteger;
        FContact := ContactDBLookupComboBox.keyvalue;
        end;
    end;
    with GetExistPosSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger :=
        QtysSRC.DataSet.FieldByName('Supplier').AsInteger;
      ParamByName('Branch_No').AsInteger :=
        QtysSRC.DataSet.FieldByName('Branch_No').AsInteger;
      Open;
(*      if EOF then
        AddBitBtn.Visible := False
      else
      begin
        AddBitBtn.Visible := True;
        AddBitBtn.Caption := 'Add To Purch Ord No: ' +
          floatToStr(GetExistPosSQL.FieldByName('Purchase_Order').asfloat);

      end;
*)
    end;
  end;
  SelContactBtn.Enabled := True;
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBAutoPODetsFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit};
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.ProofStatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.ContactDBLookupComboBoxClick(Sender: TObject);
begin
  FContact := ContactDBLookupComboBox.keyvalue;
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.DateEditExit(Sender: TObject);
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

  DateEdit.Text := PBDateStr(NewDate);
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.ReqByDateEditExit(Sender: TObject);
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

  ReqByDateEdit.Text := PBDateStr(NewDate);

  FDateEntered := (trim(ReqByDateEdit.Text) <> '');
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.ProofsDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If proofsDateEdit.Text = '' then
    begin
      CheckOK(Self);
      Exit;
    end;
    
  try
    NewDate := StrToDate(proofsDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      proofsDateEdit.SetFocus;
      Exit;
    end;
  end;

  proofsDateEdit.Text := PBDateStr(NewDate);
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.spedtQtyChange(Sender: TObject);
var
  iTempValue: integer;
begin
  if Factivate then exit;
  try
    with Sender as TSpinEdit do
      begin
        iTempValue := ((Value-MinValue) div strtoint(edtRunOnQty.text));
      end;
  except
    iTempValue := 0
  end;

  with PBAutoPODM do
    begin
      OrdPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(FOrderPrice +
                             (GetEnqSQL.FieldByName('Run_On_Cost').AsFloat*iTempValue)));

      SellPriceMemo.Text := FormatMoneyTo3DP(FloatToStr(FSellPrice +
                              (GetEnqSQL.FieldByName('Run_On_Price').AsFloat*iTempValue)));
    end;
end;

procedure TPBAutoPODetsFrm.AddrTypeRadGrpClick(Sender: TObject);
begin
  self.spdbtnLUCust.Visible := (AddrTypeRadGrp.ItemIndex = 3);

  case AddrTypeRadGrp.ItemIndex of
    0: self.LookUpAdHocAddress;
    1: self.LookUpSupplierAddress;
    2: self.LookUpRepAddress;
    3: self.LookUpCustAddress;
    4: self.LookUpCompanyAddress;
  end;

  if (AddrTypeRadGrp.ItemIndex = 4) then
  begin
    DeliveryToStockChk.Enabled := true;
    DeliveryToStockChk.checked := true;
//    chkbxInvoiceUpfront.enabled := true;
    chkbxInvoiceUpfront.Enabled := dmBroker.CanOverridePaidStock(frmPBmainMenu.iOperator);
    chkbxInvoiceUpfront.checked := InvoiceUpFront;
  end
  else if (AddrTypeRadGrp.ItemIndex = 1) then
  begin
    DeliveryToStockChk.Enabled := true;
    DeliveryToStockChk.checked := false;
    chkbxInvoiceUpfront.enabled := false;
  end
  else
  begin
    DeliveryToStockChk.Enabled := false;
    DeliveryToStockChk.checked := false;
    chkbxInvoiceUpfront.enabled := false;
    chkbxInvoiceUpfront.checked := invoiceupfront;
  end;
end;

procedure TPBAutoPODetsFrm.SetDeliveryDetail(const Value: TDeliveryLine);
begin
  FDeliveryDetail := Value;
end;

procedure TPBAutoPODetsFrm.LookUpAdHocAddress;
var
  PBLUAdHocFrm: TPBLUAdHocFrm;
begin
  self.DeliveryDetail.Supplier := 0;
  self.DeliveryDetail.BranchNo := 0;
  self.DeliveryDetail.Customer := 0;
  self.DeliveryDetail.Rep := 0;

  PBLUAdHocFrm := TPBLUAdHocFrm.Create(Self);
  try
    PBLUAdHocFrm.bIs_Lookup := True;
    PBLUAdHocFrm.bAllow_Upd := True;
    PBLUAdHocFrm.SelCode := self.DeliveryDetail.AdHocAddress;
    PBLUAdHocFrm.ShowModal;
    if PBLUAdHocFrm.Selected then
    begin
      self.DeliveryDetail.AdHocAddress := PBLUAdHocFrm.SelCode;

      self.mmDeliveryAddress.Clear;

      if PBLUAdHocFrm.GetDetsSQL.FieldByName('Name').asString <> '' then
        self.mmDeliveryAddress.Lines.Add(PBLUAdHocFrm.GetDetsSQL.FieldByName('Name').asString);
      if PBLUAdHocFrm.GetDetsSQL.FieldByName('Building_No_Name').asString <> '' then
        self.mmDeliveryAddress.Lines.Add(PBLUAdHocFrm.GetDetsSQL.FieldByName('Building_No_Name').asString);
      if PBLUAdHocFrm.GetDetsSQL.FieldByName('Street').asString <> '' then
        self.mmDeliveryAddress.Lines.Add(PBLUAdHocFrm.GetDetsSQL.FieldByName('Street').asString);
      if PBLUAdHocFrm.GetDetsSQL.FieldByName('Locale').asString <> '' then
        self.mmDeliveryAddress.Lines.Add(PBLUAdHocFrm.GetDetsSQL.FieldByName('Locale').asString);
      if PBLUAdHocFrm.GetDetsSQL.FieldByName('Town').asString <> '' then
        self.mmDeliveryAddress.Lines.Add(PBLUAdHocFrm.GetDetsSQL.FieldByName('Town').asString);
      if PBLUAdHocFrm.GetDetsSQL.FieldByName('PostCode').asString <> '' then
        self.mmDeliveryAddress.Lines.Add(PBLUAdHocFrm.GetDetsSQL.FieldByName('PostCode').asString);
    end
    else
    begin
      self.DeliveryDetail.AdHocAddress := 0;
      AddrTypeRadGrp.ItemIndex := 3;
      self.LookUpCustAddress;
    end;
  finally
    PBLUAdHocFrm.Free;
  end;
end;

procedure TPBAutoPODetsFrm.FormCreate(Sender: TObject);
begin
  Self.FDeliveryDetail := TDeliveryLine.Create;
  FDateEntered := false;
end;

procedure TPBAutoPODetsFrm.LookUpSupplierAddress;
begin
  self.DeliveryDetail.Supplier := PBAutoPODM.GetQtysSQL.FieldByName('Supplier').asInteger;
  self.DeliveryDetail.BranchNo := PBAutoPODM.GetQtysSQL.FieldByName('Branch_no').asInteger;
  self.DeliveryDetail.AdHocAddress := 0;
  self.DeliveryDetail.Customer := 0;
  self.DeliveryDetail.Rep := 0;

  self.mmDeliveryAddress.Clear;

  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Supp_Name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Branch_Name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Building_No_name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Street').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Locale').asString);
  if PBAutoPODM.GetQtysSQL.FieldByName('Town').asString <> '' then
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Town').asString +
                         '     ' + PBAutoPODM.GetQtysSQL.FieldByName('Postcode').asString)
  else
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.GetQtysSQL.FieldByName('Postcode').asString);
end;

procedure TPBAutoPODetsFrm.LookUpRepAddress;
begin
  self.DeliveryDetail.Rep := PBAutoPODM.GetEnqSQL.FieldByName('Rep').asInteger;
  self.DeliveryDetail.Supplier := 0;
  self.DeliveryDetail.BranchNo := 0;
  self.DeliveryDetail.AdHocAddress := 0;
  self.DeliveryDetail.Customer := 0;

  self.mmDeliveryAddress.Clear;

  PBAutoPODM.qrySelRep.Close;
  PBAutoPODM.qrySelRep.ParamByName('Rep').asInteger := self.DeliveryDetail.Rep;
  PBAutoPODM.qrySelRep.Open;

  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelRep.FieldByName('Name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelRep.FieldByName('Building_No_name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelRep.FieldByName('Street').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelRep.FieldByName('Locale').asString);
  if PBAutoPODM.qrySelRep.FieldByName('Town').asString <> '' then
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelRep.FieldByName('Town').asString +
                         '     ' + PBAutoPODM.qrySelRep.FieldByName('Postcode').asString)
  else
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelRep.FieldByName('Postcode').asString);

  PBAutoPODM.qrySelRep.close;
end;

procedure TPBAutoPODetsFrm.LookUpCustAddress;
begin
  if self.DeliveryDetail.Customer = 0 then
  begin
    self.DeliveryDetail.Customer := PBAutoPODM.GetEnqSQL.FieldByName('customer').asInteger;
    self.DeliveryDetail.BranchNoZero := PBAutoPODM.GetEnqSQL.FieldByName('Branch_no').asInteger;
  end;

  self.DeliveryDetail.Rep := 0;
  self.DeliveryDetail.Supplier := 0;
  self.DeliveryDetail.BranchNo := 0;
  self.DeliveryDetail.AdHocAddress := 0;

  self.mmDeliveryAddress.Clear;

  PBAutoPODM.qrySelCustAddress.Close;
  PBAutoPODM.qrySelCustAddress.ParamByName('Customer').asInteger := self.DeliveryDetail.Customer;
  PBAutoPODM.qrySelCustAddress.ParamByName('branch').asInteger := self.DeliveryDetail.BranchNoZero;

  PBAutoPODM.qrySelCustAddress.Open;

  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('Name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('branch_name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('Building_No_name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('Street').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('Locale').asString);
  if PBAutoPODM.qrySelCustAddress.FieldByName('Town').asString <> '' then
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('Town').asString +
                         '     ' + PBAutoPODM.qrySelCustAddress.FieldByName('Postcode').asString)
  else
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCustAddress.FieldByName('Postcode').asString);

  PBAutoPODM.qrySelCustAddress.close;
end;

procedure TPBAutoPODetsFrm.LookUpCompanyAddress;
begin
  self.DeliveryDetail.Customer := 0;
  self.DeliveryDetail.BranchNo := 0;
  self.DeliveryDetail.Rep := 0;
  self.DeliveryDetail.Supplier := 0;
  self.DeliveryDetail.AdHocAddress := 0;

  self.mmDeliveryAddress.Clear;

  PBAutoPODM.qrySelCompanyAddress.Close;
  PBAutoPODM.qrySelCompanyAddress.Open;

  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCompanyAddress.FieldByName('Name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCompanyAddress.FieldByName('Building_No_name').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCompanyAddress.FieldByName('Street').asString);
  self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCompanyAddress.FieldByName('Locale').asString);
  if PBAutoPODM.qrySelCompanyAddress.FieldByName('Town').asString <> '' then
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCompanyAddress.FieldByName('Town').asString +
                         '     ' + PBAutoPODM.qrySelCompanyAddress.FieldByName('Postcode').asString)
  else
    self.mmDeliveryAddress.Lines.Add(PBAutoPODM.qrySelCompanyAddress.FieldByName('Postcode').asString);

  PBAutoPODM.qrySelCompanyAddress.close;
end;

procedure TPBAutoPODetsFrm.DeliveryToStockChkClick(Sender: TObject);
begin
  if DeliveryToStockChk.Checked then
  begin
    self.DeliveryDetail.DeliveryToStock := 'Y';
//    chkbxInvoiceUpfront.enabled := true;
    chkbxInvoiceUpfront.Enabled := dmBroker.CanOverridePaidStock(frmPBmainMenu.iOperator);
    chkbxInvoiceUpfront.checked := InvoiceUpFront;
  end
  else
  begin
    self.DeliveryDetail.DeliveryToStock := 'N';
    chkbxInvoiceUpfront.enabled := false;
    chkbxInvoiceUpfront.checked := InvoiceUpfront;
  end;
end;

procedure TPBAutoPODetsFrm.CustReqDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  FDateEntered := (trim(ReqbyDateEdit.text) <> '');

  If CustReqDateEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(CustReqDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      CustReqDateEdit.SetFocus;
      Exit;
    end;
  end;

  CustReqDateEdit.Text := PBDateStr(NewDate);
  CheckOK(Self);
end;

procedure TPBAutoPODetsFrm.CustReqDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(CustReqDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      CustReqDateEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBAutoPODetsFrm.CustReqDateEditChange(Sender: TObject);
begin
  if not FDateEntered then
    begin
      ReqbyDateEdit.text := CustReqDateEdit.text;
    end;
end;

procedure TPBAutoPODetsFrm.CustReqDateEditEnter(Sender: TObject);
begin
  FDateEntered := (trim(ReqbyDateEdit.text) <> '');
end;

procedure TPBAutoPODetsFrm.spdbtnLUCustClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := self.DeliveryDetail.Customer;
    PBLUCustFrm.SelBranch := self.DeliveryDetail.BranchNo;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      self.DeliveryDetail.Customer := PBLUCustFrm.SelCode;
      self.DeliveryDetail.BranchNo := PBLUCustFrm.SelBranch;
      self.DeliveryDetail.BranchNoZero := PBLUCustFrm.SelBranch;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  self.LookUpCustAddress;
end;

end.
