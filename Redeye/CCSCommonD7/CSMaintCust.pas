(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Customers/Contacts.

VSS Info:
$Header: /CCSCommon/CSMaintCust.pas 1     10/01/:1 13:00 Paul $
$History: CSMaintCust.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:00
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 11  *****************
 * User: Janiner      Date: 27/09/:0   Time: 15:48
 * Updated in $/PBL D5
 * Add maintenace bitbtn's for vat codes and customer types.
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 31/07/:0   Time: 10:56
 * Updated in $/PBL D5
 * Fixed bug whereby the Customer Status was not being updated
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 16/03/:0   Time: 12:32
 * Updated in $/PBL D5
 * Added two new status's:
 * 
 * I - Sales Invoice Pending
 * O - Purchase Invoice Pending
 * 
 * These are loaded into the ProspectComboBox
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 14/03/:0   Time: 17:33
 * Updated in $/PBL D5
 * Changed to display the new Account Code on Ledger status.
 * U = Pending Update
 * I = Invoice Pending
 * O = Purchase Order update pending
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 3/02/:0    Time: 15:38
 * Updated in $/PBL D5
 * Add code to create/delete zero-keyed records so the GUID inserts work
 * on empty tables.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 3/02/:0    Time: 14:34
 * Updated in $/PBL D5
 * Use new insert method to guarantee unique keys when adding new
 * customers.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 24/01/:0   Time: 9:11
 * Updated in $/PBL D5
 * Changes to set Tab Order and set focus
 * 
 * *****************  Version 3  *****************
 * User: Debbies      Date: 14/01/:0   Time: 12:23
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 14/01/:0   Time: 11:11
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintCustFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetTypesSQL: TFDQuery;
    TypesSRC: TDataSource;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    AddBranchSQL: TFDQuery;
    UpdBranchSQL: TFDQuery;
    DelBranchSQL: TFDQuery;
    GetCrdStatSQL: TFDQuery;
    CrdStatSRC: TDataSource;
    GetCustNameSQL: TFDQuery;
    GetBranchNameSQL: TFDQuery;
    FlashTimer: TTimer;
    GetIntrastatSQL: TFDQuery;
    IntrastatSRC: TDataSource;
    GetCountrySQL: TFDQuery;
    CountrySRC: TDataSource;
    GetCurrSQL: TFDQuery;
    CurrSRC: TDataSource;
    CheckCustAccExistsSQL: TFDQuery;
    GetCompSQL: TFDQuery;
    CheckSuppAccExistsSQL: TFDQuery;
    FlashDelivTimer: TTimer;
    VATSRC: TDataSource;
    GetVATSQL: TFDQuery;
    PageControl1: TPageControl;
    ContDetTabSheet: TTabSheet;
    FinLedTabSheet: TTabSheet;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    CredStatDBLCB: TDBLookupComboBox;
    CredLimMemo: TMemo;
    SettDiscMemo: TMemo;
    SettDaysMemo: TMemo;
    IntrastatDBLookupComboBox: TDBLookupComboBox;
    CountryDBLookupComboBox: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    VATRefEdit: TEdit;
    CredAvailMemo: TMemo;
    DefCurrDBLookupComboBox: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    DetsGroupBox: TGroupBox;
    DetsGrpBox: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    TownEdit: TEdit;
    NameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    EMailEdit: TEdit;
    PostCodeEdit: TEdit;
    ProspectComboBox: TComboBox;
    NotesBitBtn: TBitBtn;
    DelivNotesBitBtn: TBitBtn;
    ActiveChkBox: TCheckBox;
    Label2: TLabel;
    DefVATDBLookupComboBox: TDBLookupComboBox;
    AccCodeEdit: TEdit;
    InvToGrpBox: TGroupBox;
    InvToCustLabel: TLabel;
    InvToBranchLabel: TLabel;
    InvCustBtn: TButton;
    InvToBranch: TButton;
    Label1: TLabel;
    TypeDBLUCB: TDBLookupComboBox;
    qryZero: TFDQuery;
    VatMaintBitBtn: TBitBtn;
    CustTypeMaintBitBtn: TBitBtn;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    EdtEmailOrder: TEdit;
    ChkBxInvUpFrnt: TCheckBox;
    GroupBox2: TGroupBox;
    EdtDtCreated: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure TypeDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SettDaysMemoExit(Sender: TObject);
    procedure SettDiscMemoExit(Sender: TObject);
    procedure CredLimMemoExit(Sender: TObject);
    procedure ShowCustName(Sender: TObject);
    procedure ShowBranchName(Sender: TObject);
    procedure InvCustBtnClick(Sender: TObject);
    procedure InvToBranchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CountryClearBitBtnClick(Sender: TObject);
    procedure CredAvailMemoExit(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure VATBitBtnClick(Sender: TObject);
    procedure DefVATDBLookupComboBoxClick(Sender: TObject);
    procedure VatMaintBitBtnClick(Sender: TObject);
    procedure CustTypeMaintBitBtnClick(Sender: TObject);
  private
    sOldValue: string;
    iInvToCust, iInvToBranch: Integer;
    bNotesFlash, bDelivNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  CSMaintCustFrm: TCSMaintCustFrm;

implementation

uses CSLUCust, CSDBMemo, CSLUBranch, CSImages, CSDelivNotes,
     ComObj, ActiveX, CSLUVATCode, CSMaintGroups;

var
  InvToCustFrm: TCSLUCustFrm;
  InvToBranchFrm: TCSLUBranchFrm;
{$R *.DFM}

procedure TCSMaintCustFrm.FormActivate(Sender: TObject);
begin
  {Create the delivery narrative form}
  CSDelivNotesFrm := TCSDelivNotesFrm.Create(Self);
  CSDelivNotesFrm.bAllow_Upd := True;
  {Create the memo form}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  {Re-activate the lookup SQLs}
  GetTypesSQL.Active := False;
  GetTypesSQL.Active := True;
  GetCrdStatSQL.Active := False;
  GetCrdStatSQL.Active := True;
  GetIntrastatSQL.Active := False;
  GetIntrastatSQL.Active := True;
  GetCountrySQL.Active := False;
  GetCountrySQL.Active := True;
  GetCurrSQL.Active := False;
  GetCurrSQL.Active := True;
  GetVATSQL.Active := False;
  GetVATSQL.Active := True;
  GetCompSQL.active := False;
  GetCompSQL.active := True;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new customer';
  if sFuncMode = 'C' then
    Caption := 'Change a customer';
  if sFuncMode = 'D' then
    Caption := 'Delete a customer';
  if sFuncMode = 'A' then
  begin
    {Disable Invoice To Group Box}
    InvToGrpBox.Enabled := False;
    {Empty details}
    NameEdit.Text := '';
    TypeDBLUCB.KeyValue := Null;
    ActiveChkBox.Checked := True;
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PhoneEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    EDTEmailOrder.Text := '';
    CredLimMemo.Text := '0.00';
    SettDaysMemo.Text := '0';
    SettDiscMemo.Text := '0.00';
    PostCodeEdit.Text := '';
    AccCodeEdit.Text := '';
    CredStatDBLCB.KeyValue := 'L';
    IntrastatDBLookupComboBox.keyvalue := 1;
    CountryDBLookupComboBox.KeyValue := Null;
    DefCurrDBLookupComboBox.KeyValue :=
      GetCompSQL.FieldByName('Currency_Code_Def').AsInteger;
    VATRefEdit.Text := '';
    CredAvailMemo.Text := '0.00';
    DefVATDBLookupComboBox.KeyValue := GetCompSQL.FieldByName('Vat_Code').AsInteger;
    EdtDtCreated.Text := DateToStr(date);

     {Initially setup as a prospect}
  with ProspectComboBox do
    begin
      itemindex := 0;
      Enabled := True;
    end;
    NameEdit.setfocus;
    end
   else 
    begin  
    with CSLUCustFrm.SelectedSQL do
    begin
      iCode := FieldByName('Customer').AsInteger;
      NameEdit.Text := FieldByName('Name').AsString;
      TypeDBLUCB.KeyValue := FieldByName('Customer_Type').AsInteger;
      ActiveChkBox.Checked := (FieldByName('Acc_Active').AsString = 'Y');
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      EdtEmailOrder.Text := FieldByName('EMail_Address_Order_Confirm').AsString;
      CredLimMemo.Text := FormatFloat('######0',
        FieldByName('Credit_Limit').AsFloat);
      SettDaysMemo.Text := IntToStr(FieldByName('Settlement_Days').AsInteger);
      SettDiscMemo.Text := FormatFloat('##0.00',
        FieldByName('Settlement_Discount').AsFloat);

      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
      CredStatDBLCB.KeyValue := FieldByName('Credit_Status').AsString;

      CSDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      CSDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
      iInvToCust := FieldByName('Inv_To_Customer').AsInteger;
      iInvToBranch := FieldByName('Inv_To_Branch').AsInteger;
      IntrastatDBLookupComboBox.KeyValue :=
        FieldByName('Intrastat_Id').AsInteger;
      if FieldByName('Country_Id').AsInteger = 0 then
        CountryDBLookupComboBox.KeyValue := Null
      else
        CountryDBLookupComboBox.KeyValue := FieldByName('Country_Id').AsInteger;
      if FieldByName('Currency_Code_Def').AsInteger = 0 then
        DefCurrDBLookupComboBox.KeyValue := Null
      else
        DefCurrDBLookupComboBox.KeyValue :=
          FieldByName('Currency_Code_Def').AsInteger;
      VATRefEdit.Text := FieldByName('VAT_Reference').AsString;
      ChkBxInvUpfrnt.checked := FieldByName('Invoice_Upfront').AsString = 'Y';
      EdtDtCreated.Text := FieldByName('Date_Created').AsString;

      CredAvailMemo.Text := FormatFloat('##0.00',
        FieldByName('Available_Credit').AsFloat);

      DefVATDBLookupComboBox.KeyValue :=
        FieldByName('VAT_Code_Def').AsInteger;

      {Initially set the combo Box to 'Prospect'}
      with ProspectComboBox do
      begin
        itemindex := 0;
        Enabled := True;
        {Change to Actual Customer if Account is on Ledger}
        if FieldByName('Account_Code_on_Ledger').AsString = 'Y' then
        begin
          Items.Add('Account on Ledger');
          itemindex := 2;
          Enabled := False;
        end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'P' then
          begin
            itemindex := 1;
            Enabled := True;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'U' then
          begin
          Items.Add('Ledger Update Pending');
          itemindex := 2;
          Enabled := False;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'I' then
          begin
          Items.Add('Sales Invoice Pending');
          itemindex := 2;
          Enabled := False;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'O' then
          begin
          Items.Add('Purchase Invoice Pending');
          itemindex := 2;
          Enabled := False;
          end;
      end;
    end;
  end;

  {Show the invoice to details}
  ShowCustName(Self);
  ShowBranchName(Self);
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
    {Enable/disable OK button}
  if sfuncmode = 'D' then
    OKBitBtn.enabled := true
  else
  begin
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (TypeDBLUCB.KeyValue <> Null) and
    (PhoneEdit.Text <> '') and
    (CredStatDBLCB.KeyValue <> Null) and
    (SettDiscMemo.Text <> '') and
    (SettDaysMemo.Text <> '') and
    (CredLimMemo.Text <> '') and
    (InvToBranchLabel.Caption <> '') and
    (IntrastatDBLookupComboBox.Text <> '')and
    (DefVATDBLookupComboBox.Text <> '');
  end;
end;

procedure TCSMaintCustFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintCustFrm.TypeDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code}
    {Add the branch narrative}
    CSDBMemoFrm.UpdMemoData(Self);
    CSDelivNotesFrm.UpdMemoData(Self);
    {Get Next code}
    iTempNewCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Customer_Type').AsInteger := TypeDBLUCB.KeyValue;
      if ActiveChkBox.Checked then
        ParamByName('Acc_Active').AsString := 'Y'
      else
        ParamByName('Acc_Active').AsString := 'N';
      if chkBxInvUpfrnt.checked then
        ParamByName('Invoice_upfront').AsString := 'Y'
      else
        ParamByName('Invoice_Upfront').AsString := 'N';
      ParamByName('Credit_Limit').AsFloat := StrToFloat(CredLimMemo.Text);
      ParamByName('Settlement_Days').AsInteger := StrToInt(SettDaysMemo.Text);
      ParamByName('Settlement_Discount').AsFloat :=
        StrToFloat(SettDiscMemo.Text);
      ParamByName('Credit_Status').AsString := CredStatDBLCB.KeyValue;
      ParamByName('Intrastat_Id').AsInteger :=
        IntrastatDBLookupComboBox.KeyValue;
      if CountryDBLookupComboBox.KeyValue = Null then
        ParamByName('Country_Id').Clear
      else
        ParamByName('Country_Id').AsInteger := CountryDBLookupComboBox.KeyValue;
      if DefCurrDBLookupComboBox.KeyValue = Null then
        ParamByName('Currency_Code_Def').Clear
      else
        ParamByName('Currency_Code_Def').AsInteger :=
          DefCurrDBLookupComboBox.KeyValue;
      ParamByName('Available_Credit').AsFloat := StrToFloat(CredAvailMemo.Text);
      ParamByName('VAT_Reference').AsString := VATRefEdit.Text + '';
      ParamByName('Email_Ord').AsString := EdtEmailOrder.Text + '';
      if DefVATDBLookupComboBox.KeyValue = Null then
        ParamByName('VAT_Code_Def').Clear
      else
        ParamByName('VAT_Code_Def').AsInteger :=
          DefVATDBLookupComboBox.KeyValue;
      ParambyName('Customer_Status').asinteger := 1;
      if edtDtCreated.text = '' then
        ParamByname('Date_Created').clear
      else
        ParamByName('Date_Created').asDateTime := StrToDate(edtDtCreated.text);
      ExecSQL;
    end;
    with AddBranchSQL do
    begin
      iInvToCust := iTempNewCode;
      Close;
      ParamByName('Customer').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := 'Head Office';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if CSDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := CSDelivNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      {Update Account code on Ledger}
      if ProspectComboBox.itemindex = 0 then
        ParamByName('Account_Code_on_ledger').AsString := 'N'
      else
        if ProspectComboBox.itemindex = 1 then
          ParamByName('Account_Code_on_ledger').AsString := 'P'
      else
        if ProspectComboBox.itemindex = 2 then
          ParamByName('Account_Code_on_ledger').AsString := 'U'
      else
        if ProspectComboBox.itemindex = 3 then
          ParamByName('Account_Code_on_ledger').AsString := 'I'
      else
        if ProspectComboBox.itemindex = 4 then
          ParamByName('Account_Code_on_ledger').AsString := 'O'
        else
          ParamByName('Account_Code_on_ledger').AsString := 'Y';

      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    {Update the branch narrative}
    CSDBMemoFrm.UpdMemoData(Self);
    CSDelivNotesFrm.UpdMemoData(Self);
    {Update an existing code}
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Customer_Type').AsInteger := TypeDBLUCB.KeyValue;
      if ActiveChkBox.Checked then
        ParamByName('Acc_Active').AsString := 'Y'
      else
        ParamByName('Acc_Active').AsString := 'N';
      ParamByName('Credit_Limit').AsFloat := StrToFloat(CredLimMemo.Text);
      ParamByName('Settlement_Days').AsInteger := StrToInt(SettDaysMemo.Text);
      ParamByName('Settlement_Discount').AsFloat :=
        StrToFloat(SettDiscMemo.Text);
      ParamByName('Credit_Status').AsString := CredStatDBLCB.KeyValue;
      ParamByName('Intrastat_Id').AsInteger :=
        IntrastatDBLookupComboBox.KeyValue;
      if CountryDBLookupComboBox.KeyValue = Null then
        ParamByName('Country_Id').Clear
      else
        ParamByName('Country_Id').AsInteger := CountryDBLookupComboBox.KeyValue;
      if DefCurrDBLookupComboBox.KeyValue = Null then
        ParamByName('Currency_Code_Def').Clear
      else
        ParamByName('Currency_Code_Def').AsInteger :=
          DefCurrDBLookupComboBox.KeyValue;
      ParamByName('Available_Credit').AsFloat := StrToFloat(CredAvailMemo.Text);
      ParamByName('VAT_Reference').AsString := VATRefEdit.Text + '';
      ParamByName('Email_Ord').AsString := EdtEmailOrder.Text + '';
      if DefVATDBLookupComboBox.KeyValue = Null then
        ParamByName('VAT_Code_Def').Clear
      else
        ParamByName('VAT_Code_Def').AsInteger :=
          DefVATDBLookupComboBox.KeyValue;
      ParambyName('Customer_Status').asinteger := 1;
      if chkBxInvUpfrnt.checked then
        ParamByName('Invoice_upfront').AsString := 'Y'
      else
        ParamByName('Invoice_Upfront').AsString := 'N';
      if edtDtCreated.text = '' then
        ParamByname('Date_Created').clear
      else
        ParamByName('Date_Created').asDateTime := StrToDate(edtDtCreated.text);
      ExecSQL;
    end;
    with UpdBranchSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCode;
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if CSDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := CSDelivNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      {Update Account code on Ledger}
      if ProspectComboBox.itemindex = 0 then
        ParamByName('Account_Code_on_ledger').AsString := 'N'
      else
        if ProspectComboBox.itemindex = 1 then
          ParamByName('Account_Code_on_ledger').AsString := 'P'
      else
        if ProspectComboBox.itemindex = 2 then
          ParamByName('Account_Code_on_ledger').AsString := 'U'
      else
        if ProspectComboBox.itemindex = 3 then
          ParamByName('Account_Code_on_ledger').AsString := 'I'
      else
        if ProspectComboBox.itemindex = 4 then
          ParamByName('Account_Code_on_ledger').AsString := 'O'
        else
          ParamByName('Account_Code_on_ledger').AsString := 'Y';
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelBranchSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ExecSQL;
      end;
      with DelSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ExecSQL;
      end;
    end;
    {Delete the branch narrative}
    CSDBMemoFrm.DelMemoData(Self);
    CSDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TCSMaintCustFrm.SettDaysMemoExit(Sender: TObject);
begin
  if SettDaysMemo.Text <> '' then
  begin
    try
      SettDaysMemo.Text := IntToStr(StrToInt(SettDaysMemo.Text))
    except
      MessageDlg('Invalid settlement days', mtError, [mbOK], 0);
      SettDaysMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.SettDiscMemoExit(Sender: TObject);
begin
  if SettDiscMemo.Text <> '' then
  begin
    try
      SettDiscMemo.Text := FormatFloat('##0.00', StrToFloat(SettDiscMemo.Text))
    except
      MessageDlg('Invalid settlement discount', mtError, [mbOK], 0);
      SettDiscMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.CredLimMemoExit(Sender: TObject);
begin
  if CredLimMemo.Text <> '' then
  begin
    try
      CredLimMemo.Text := FormatFloat('######0', StrToFloat(CredLimMemo.Text))
    except
      MessageDlg('Invalid credit limit', mtError, [mbOK], 0);
      CredLimMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.ShowCustName(Sender: TObject);
begin
  if (iInvToCust = 0) then
  begin
    InvToCustLabel.Caption := 'This Customer';
  end
  else
  begin
    with GetCustNameSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iInvToCust;
      Open;
      First;
      InvToCustLabel.Caption := FieldByName('Name').AsString;
    end;
  end;
end;

procedure TCSMaintCustFrm.ShowBranchName(Sender: TObject);
begin
  if (iInvToBranch = 0) then
  begin
    InvToBranchLabel.Caption := 'Head Office';
  end
  else
  begin
    with GetBranchNameSQL do
    begin
      Close;
      ParamByName('Branch_No').AsInteger := iInvToBranch;
      if iInvToCust <> 0 then
        ParamByName('Customer').AsInteger := iInvToCust
      else
        ParamByName('Customer').AsInteger := iCode;
      Open;
      First;
      InvToBranchLabel.Caption := FieldByName('Name').AsString;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.InvCustBtnClick(Sender: TObject);
var
  iTempInvToCust: Integer;
begin
  iTempInvToCust := iInvToCust;
  {Activate the customer lookup screen}
  InvToCustFrm := TCSLUCustFrm.Create(Self);
  try
    InvToCustFrm.iThisCode := iCode;
    if iInvToCust <> 0 then
      InvToCustFrm.SelCode := iInvToCust
    else
      InvToCustFrm.SelCode := iCode;
    InvToCustFrm.bIs_Lookup := True;
    InvToCustFrm.bAllow_upd := False;
    InvToCustFrm.ShowModal;
    if (InvToCustFrm.SelCode <> iCode) then
      iInvToCust := InvToCustFrm.SelCode
    else
      iInvToCust := 0;
  finally
    InvToCustFrm.Free;
  end;
  ShowCustName(Self);
  if iTempInvToCust <> iInvToCust then
  begin
    iInvToBranch := 0;
    ShowBranchName(Self);
  end;
end;

procedure TCSMaintCustFrm.InvToBranchClick(Sender: TObject);
begin
  {Activate the branch lookup screen}
  InvToBranchFrm := TCSLUBranchFrm.Create(Self);
  try
    if iInvToCust <> 0 then
      InvToBranchFrm.iCust := iInvToCust
    else
      InvToBranchFrm.iCust := iCode;
    InvToBranchFrm.sCustName := InvToCustLabel.Caption;
    InvToBranchFrm.SelCode := iInvToBranch;
    InvToBranchFrm.bIs_Lookup := True;
    InvToBranchFrm.bAllow_upd := False;
    InvToBranchFrm.ShowModal;
    iInvToBranch := InvToBranchFrm.SelCode;
  finally
    InvToBranchFrm.Free;
  end;
  ShowBranchName(Self);
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CSDBMemoFrm.Free;
  CSDelivNotesFrm.Free;
end;

procedure TCSMaintCustFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintCustFrm.CheckNotes(Sender: TObject);
begin
  if CSDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
  if CSDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TCSMaintCustFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintCustFrm.CountryClearBitBtnClick(Sender: TObject);
begin
  CountryDBLookupComboBox.KeyValue := Null;
end;

procedure TCSMaintCustFrm.CredAvailMemoExit(Sender: TObject);
begin
  if SettDaysMemo.Text <> '' then
  begin
    try
      CredAvailMemo.Text := IntToStr(StrToInt(CredAvailMemo.Text))
    except
      MessageDlg('Invalid credit available', mtError, [mbOK], 0);
      CredAvailMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintCustFrm.AccCodeEditExit(Sender: TObject);
begin
  if AccCodeEdit.Text = '' then Exit;
  {Validate that the account code is unique}
  With GetCompSQL do
       begin
       Close ;
       Open ;
       First ;

  if GetCompSQL.FieldByName('Acc_Code_Cust_Unique').AsString <> 'Y' then
    Exit;
  end;
  with CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Customer').AsInteger := iCode;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on customer: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
  with CheckSuppAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on supplier: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
end;

procedure TCSMaintCustFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TCSMaintCustFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  CSDelivNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDelivNotesFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintCustFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TCSMaintCustFrm.VATBitBtnClick(Sender: TObject);
begin
  DefVATDBLookupComboBox.KeyValue := Null;
  CheckOk(self);
end;

procedure TCSMaintCustFrm.DefVATDBLookupComboBoxClick(Sender: TObject);
begin
   CheckOk(self);
end;

function TCSMaintCustFrm.GetNextKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Customer').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TCSMaintCustFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer (Customer) VALUES (0) ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintCustFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer Where Customer = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintCustFrm.VatMaintBitBtnClick(Sender: TObject);
begin
CSLUVatCodeFrm := TCSLUVatCodeFrm.Create(self) ;
  try
    CSLUVatCodeFrm.bIs_Lookup := False ;
    CSLUVatCodeFrm.bAllow_Upd := True ;
    CSLUVatCodeFrm.iSelCode := 0 ;
    CSLUVatCodeFrm.ShowModal ;
  finally
  CSLUVatCodeFrm.Free ;
end;
GetVATSQL.Active := False;
GetVATSQL.Active := True;
end;

procedure TCSMaintCustFrm.CustTypeMaintBitBtnClick(Sender: TObject);
begin
CSMaintGroupsFrm := TCSMaintGroupsFrm.Create(self) ;
  try
    CSMaintGroupsFrm.iGroupselect := 1;
    CSMaintGroupsFrm.ShowModal ;
  Finally;
  CSMaintGroupsFrm.Free ;
  end;
GetTypesSQL.Active := False;
GetTypesSQL.Active := True;
end;

end.
