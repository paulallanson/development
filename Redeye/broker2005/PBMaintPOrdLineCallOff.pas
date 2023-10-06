unit PBMaintPOrdLineCallOff;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,
  PBPOObjects, DBCtrls, Db;

type
  TPBMaintPOrdLineCallOffFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    AddrTypeRadGrp: TRadioGroup;
    AddrGrpBox: TGroupBox;
    AddrTypeLabel: TLabel;
    BranchNameLabel: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    QtysGrpBox: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    QtyToDeliverMemo: TMemo;
    QtyDeliveredMemo: TMemo;
    NoOfBoxesMemo: TMemo;
    DatePointEdit: TEdit;
    DelInstructPanel: TPanel;
    Label18: TLabel;
    DelInstructMemo: TMemo;
    DeliveryDateEdit: TEdit;
    DeliveryDateBtn: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    SupplierEdt: TEdit;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    CustomerEdt: TEdit;
    BitBtn4: TBitBtn;
    OKBitBtn: TBitBtn;
    BitBtn7: TBitBtn;
    Label5: TLabel;
    CustDescEdit: TMemo;
    Label20: TLabel;
    FormRefEdit: TEdit;
    FormRefButton: TButton;
    FormRefClrBitBtn: TBitBtn;
    FormDescEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    CustRefEdit: TEdit;
    Label2: TLabel;
    BoxQtyMemo: TMemo;
    OrderDateEdt: TEdit;
    Label7: TLabel;
    Label23: TLabel;
    NumberingEdit: TEdit;
    DatePointBtn: TBitBtn;
    OrderDateBtn: TBitBtn;
    CustContactDBCmbo: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    SellPriceMemo: TMemo;
    CostPriceMemo: TMemo;
    PriceUnitDBcmbo: TDBLookupComboBox;
    CostUnitDBcmbo: TDBLookupComboBox;
    RepEdit: TEdit;
    Label24: TLabel;
    RepLUBtn: TBitBtn;
    lblDelete: TLabel;
    chkbxmake2invoice: TCheckBox;
    btnLUContact: TButton;
    lblFAO: TLabel;
    edtFAO: TEdit;
    SearchBtn: TButton;
    Label25: TLabel;
    ContactEdit: TEdit;
    SelContactBtn: TButton;
    procedure FormActivate(Sender: TObject);
    procedure AddrTypeRadGrpClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure DatePointBtnClick(Sender: TObject);
    procedure DeliveryDateBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure QtyToDeliverMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QtyToDeliverMemoChange(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure ValidateMoney(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VAlidateQty(Sender: TObject);
    procedure DatePointEditExit(Sender: TObject);
    procedure OrderDateBtnClick(Sender: TObject);
    procedure OrderDateEdtExit(Sender: TObject);
    procedure BoxQtyMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormRefButtonClick(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
    procedure RepLUBtnClick(Sender: TObject);
    procedure CustRefEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure chkbxmake2invoiceClick(Sender: TObject);
    procedure btnLUContactClick(Sender: TObject);
    procedure SelContactBtnClick(Sender: TObject);
  private
    FFuncMode: Char;
    FCallOffOrder: TCallOffOrder;
    FFormsPerBox: string;
    FAdHocAddress: Integer;
    FCustomer: Integer;
    FSupplier: Integer;
    FRep: Integer;
    FCustomerBranch: Integer;
    FSupplierBranch: Integer;
    sOldValue: string;
    FInvoicedUpfront: string;
    FFAO: string;
    procedure SetFormsPerBox(const Value: string);
    procedure SetAdHocAddress(const Value: Integer);
    procedure SetCustomer(const Value: Integer);
    procedure SetCustomerBranch(const Value: Integer);
    procedure SetRep(const Value: Integer);
    procedure SetSupplier(const Value: Integer);
    procedure SetSupplierBranch(const Value: Integer);
    procedure ShowAddress(Sender: TObject);
    procedure UpdateCallOff;
    procedure GetNumberofBoxes;
    procedure GetCustContacts;
    procedure SetInvoicedUpfront(const Value: string);
    procedure SetFAO(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    bOK: boolean;
    MaxQty: integer;
    property CallOffOrder: TCallOffOrder read FCallOffOrder
      write FCallOffOrder;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property FormsPerBox: string read FFormsPerBox write SetFormsPerBox;
    property InvoicedUpfront: string read FInvoicedUpfront write SetInvoicedUpfront;
    property Supplier: Integer read FSupplier write SetSupplier;
    property SupplierBranch: Integer read FSupplierBranch write SetSupplierBranch;
    property Customer: Integer read FCustomer write SetCustomer;
    property CustomerBranch: Integer read FCustomerBranch write SetCustomerBranch;
    property AdHocAddress: Integer read FAdHocAddress write SetAdHocAddress;
    property Rep: Integer read FRep write SetRep;
    property FAO: string read FFAO write SetFAO;
  end;

var
  PBMaintPOrdLineCallOffFrm: TPBMaintPOrdLineCallOffFrm;

implementation

uses FireDAC.Stan.Param, 
  System.UITypes,
  PBLUAdHoc, PBLUSupp, PBLURep, PBLUCust, PBPODataMod, DateSelV5,
  PBLUFormRef, PBMaintPOrd, PBLUCConta, PBLUSConta;

{$R *.DFM}

{ TPBMaintPOrdLineCallOffFrm }

procedure TPBMaintPOrdLineCallOffFrm.SetFormsPerBox(const Value: string);
begin
  FFormsPerBox := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  {Setup titles}
  if FFuncMode = poAdd then
    Caption := 'Add a Call Off Order'
  else
    if FFuncMode = poChange then
      Caption := 'Change Call Off Order'
    else
      if FFuncMode = poDelete then
        begin
        Caption := 'Delete a Call Off Order';
        lblDelete.visible := true;
        end
      else
        if FFuncMode = poView then
          Caption := 'View Call Off Order';

  with PBPODM do
  begin
    GetPriceUnitSQL.Active := False;
    GetPriceUnitSQL.Active := True;
  end;

  GetCustContacts;

  with CallOffOrder do
    begin
      {Get the Customer and Supplier details}
      CustomerEdt.Text := PBPODM.GetCustName(Customer) + '/'+
                        PBPODM.GetCustBranchName(Customer, CallOffOrder.CustBranch);
      CustContactDBCmbo.keyvalue := CustContact;
      RepEdit.text := PBPODM.GetRepDesc(Rep);
      SupplierEdt.Text := PBPODM.GetSuppName(Supplier) + '/'+
                        PBPODM.GetSuppBranchName(Supplier, SuppBranch);

      ContactEdit.Text := PBPODM.GetSuppContactName(Supplier, SuppBranch, SuppContact);
      
      if PONumber = 0 then
        PBMaintPOrdLineCallOffFrm.caption := PBMaintPOrdLineCallOffFrm.caption + ' <New Order>'
      else
        PBMaintPOrdLineCallOffFrm.caption := PBMaintPOrdLineCallOffFrm.caption + ' ' +PBFloatStr(PONumber);

      OrderDateEdt.Text := PBDateStr(OrderDate);
      {Get the apppropriate address and display it}

      DeliveryDateEdit.Text := PBDateStr(DateDelivActual);

      QtyToDeliverMemo.Text := PBIntStr(OrderQty);
      QtyDeliveredMemo.Text := PBFloatStr(QtyDelivered);
      BoxQtyMemo.Text := BoxQty;

      {Set the Number of Boxes field}
      NoofBoxesMemo.Text := PBIntStr(NoofBoxes);
      DelInstructMemo.Text := Instructions;
      CustRefEdit.text := CustOrderNo;
      FormRefEdit.text := PBPODm.GetFormRef(FormReference);
      FormDescEdit.text := PBPODm.GetFormDesc(FormReference);
      NumberingEdit.text := NumberInstructions;

      SellPriceMemo.text := formatfloat('0.00',SellPrice);
      CostPriceMemo.text := formatfloat('0.00',CostPrice);

      CustDescEdit.text := Description;
      PriceUnitDBCmbo.keyValue := SellUnit;
      CostUnitDBCmbo.keyvalue := CostUnit;

      chkbxMake2Invoice.enabled := (Status <> 30);
      chkbxMake2Invoice.checked := not (CallOffInvoicedUpfront = 'Y');
      edtFAO.text := FAO;
    end;

  if FFuncMode = poAdd then
  begin
    SupplierEdt.Text := '';
    ContactEdit.Text := '';
    MaxQty := CallOffOrder.OrderQty;
    {Empty details}
    AddrTypeRadGrp.ItemIndex := 3;
//    BoxQtyMemo.Text := CallOffOrder.BoxQty;
    {Display the number of boxes}
    QtyDeliveredMemo.Text := '0';
    GetNumberofBoxes;
    DatePointEdit.Text := PBDateStr(CallOffOrder.OrderDate);

    DelInstructMemo.Text := '';

    FCustomer := CallOffOrder.Customer;
    CustomerBranch := CallOffOrder.CustBranch;
    ShowAddress(self);
  end
  else
    with CallOffOrder do
    begin
      DatePointEdit.Text := PBDateStr(RequiredDate);
      FCustomer := DelCustomer;
      CustomerBranch := DelCustBranchNo;
      FSupplier := DelSupplier;
      SupplierBranch := DelSuppBranchNo;
      FRep := DelRep;
      FAdHocAddress := AdHocAddress;
      if FCustomer <> 0 then
        AddrTypeRadGrp.ItemIndex := 3
      else
        if FSupplier <> 0 then
          AddrTypeRadGrp.ItemIndex := 1
        else
          if FRep <> 0 then
            AddrTypeRadGrp.ItemIndex := 2
          else
            if FAdHocAddress <> 0 then
              AddrTypeRadGrp.ItemIndex := 0
            else
              AddrTypeRadGrp.ItemIndex := 4;
      ShowAddress(Self);
    end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not CharInSet(FFuncMode, [poDelete, poView]);
  OKBitBtn.Visible := (FFuncMode <> poView);
  CheckOK(Self);

  if PBPODM.IsCustomerOnStop(FCustomer) then
    MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);
end;

procedure TPBMaintPOrdLineCallOffFrm.ShowAddress(Sender: TObject);
begin
  {Diplay the address on-screen}
  with PBPODM do
    case AddrTypeRadGrp.ItemIndex of
      0: GetDelivDescr(FAdHocAddress, 0, 0);
      1: GetDelivDescr(FSupplier, SupplierBranch, 1);
      2: GetDelivDescr(FRep, 0, 2);
      3: GetDelivDescr(FCustomer, CustomerBranch, 3);
      4: GetDelivDescr(0, 0, 4);
    end;
  with PBPODM.AddrSRC.DataSet do
  begin
    NameEdit.Text := FieldByName('Name').AsString;
    if (AddrTypeRadGrp.ItemIndex = 1) or (AddrTypeRadGrp.ItemIndex = 3) then
      BranchNameEdit.Text := FieldByName('Branch_Name').AsString;
    BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
    StreetEdit.Text := FieldByName('Street').AsString;
    LocaleEdit.Text := FieldByName('Locale').AsString;
    TownEdit.Text := FieldByName('Town').AsString;
    PostCodeEdit.Text := FieldByName('PostCode').AsString;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetAdHocAddress(const Value: Integer);
begin
  FAdHocAddress := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetCustomer(const Value: Integer);
begin
  FCustomer := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetCustomerBranch(
  const Value: Integer);
begin
  FCustomerBranch := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetRep(const Value: Integer);
begin
  FRep := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetSupplier(const Value: Integer);
begin
  FSupplier := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetSupplierBranch(
  const Value: Integer);
begin
  FSupplierBranch := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.AddrTypeRadGrpClick(Sender: TObject);
begin
  {Setup the address box}
  case AddrTypeRadGrp.ItemIndex of
    0:
      begin
        AddrTypeLabel.Caption := 'Ad Hoc';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
        self.edtFAO.Visible := true;
        lblFAO.Visible := true;
        btnLUContact.Visible := false;
      end;
    1:
      begin
        AddrTypeLabel.Caption := 'Supplier';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
        self.edtFAO.Visible := false;
        lblFAO.Visible := false;
        btnLUContact.Visible := false;
      end;
    2:
      begin
        AddrTypeLabel.Caption := 'Rep';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
        self.edtFAO.Visible := false;
        lblFAO.Visible := false;
        btnLUContact.Visible := false;
      end;
    3:
      begin
        AddrTypeLabel.Caption := 'Customer';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
        self.edtFAO.Visible := true;
        lblFAO.Visible := true;
        btnLUContact.Visible := true;

        if CallOffOrder.Customer = 0 then
        begin
          Customer := PBMaintPOrdFrm.selectedLine.customer;
          CustomerBranch := PBMaintPOrdFrm.selectedLine.BranchNo;
          self.edtFAO.text := PBMaintPOrdFrm.ContactCombo.text;
        end;
      end;
  end;
  SearchBtn.Enabled := (AddrTypeRadGrp.ItemIndex <> 4);
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineCallOffFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (SupplierEdt.Text <> '') and
    (Contactedit.Text <> '') and
    (DatePointEdit.Text <> '') and
    (QtyToDeliverMemo.Text <> '') and
    (QtyDeliveredMemo.Text <> '') and
    (NoOfBoxesMemo.Text <> '') and
    (SellPriceMemo.Text <> '') and
    (CostPriceMemo.Text <> '') and
    (RepEdit.Text <> '') and
    (CustRefEdit.text <> '');
end;

procedure TPBMaintPOrdLineCallOffFrm.OKBitBtnClick(Sender: TObject);
begin
  if StrToInt(QtyToDeliverMemo.Text) > MaxQty then
    begin
      MessageDlg('Quantity to deliver cannot be greater than the outstanding quantity in stock.', mtError, [mbok],0);
      Exit;
    end;

  if StrToInt(QtyDeliveredMemo.Text) > StrToInt(QtyToDeliverMemo.Text) then
    if MessageDlg('Quantity Delivered is greater than ' +
      'Quantity To Deliver - Continue ?', mtWarning, [mbNo, mbYes], 0) <> mrYes
      then Exit;

  if FFuncMode <> poDelete then
  begin
    UpdateCallOff
  end
  else
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
  end;
  Modalresult := idOK;
  bOK := True;

end;

procedure TPBMaintPOrdLineCallOffFrm.UpdateCallOff;
begin
  with CallOffOrder do
  begin
    if FFuncMode = poAdd then
      begin
        PONumber := 0;
        POLine := 0;
      end;

    FAO := edtFAO.text;
    OrderQty := PBFloatStr(QtyToDeliverMemo.Text);
    QtyDelivered := PBFloatStr(QtyDeliveredMemo.Text);
    RequiredDate := PBDateStr(DatePointEdit.Text);
    NoOfBoxes := PBIntStr(NoOfBoxesMemo.Text);
    Instructions := DelInstructMemo.Text;
    DateDelivActual := PBDateStr(DeliveryDateEdit.Text);
    OrderDate := PBDateStr(OrderDateEdt.text);

    SellPrice := PBFloatStr(SellPriceMemo.Text);
    CostPrice := PBFloatStr(CostPriceMemo.Text);

    SellUnit := PriceUnitDBCmbo.keyvalue;
    CostUnit := CostUnitDBCmbo.keyvalue;

    CustOrderNo := CustRefEdit.text;
    NumberInstructions := NumberingEdit.Text;
    BoxQty := BoxQtyMemo.Text;
    Description := CustDescEdit.text;

    CustContact := CustContactDBCmbo.keyvalue;
    { Clear the address fields before setting choice }
    AdHocAddress := 0;
    DelSupplier := 0;
    DelSuppBranchNo := 0;
    DelCustomer := 0;
    DelCustBranchNo := 0;
    DelRep := 0;
    case AddrTypeRadGrp.ItemIndex of
      0: AdHocAddress := FAdHocAddress;
      1:
        begin
          DelSupplier := FSupplier;
          DelSuppBranchNo := SupplierBranch;
        end;
      2: DelRep := FRep;
      3:
        begin
          DelCustomer := FCustomer;
          DelCustBranchNo := CustomerBranch;
        end;
      else ;
    end;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.SearchBtnClick(Sender: TObject);
begin
  {Access the searches}
  case AddrTypeRadGrp.ItemIndex of
    0:
      begin
        PBLUAdHocFrm := TPBLUAdHocFrm.Create(Self);
        try
          PBLUAdHocFrm.bIs_Lookup := True;
          PBLUAdHocFrm.bAllow_Upd := True;
          PBLUAdHocFrm.SelCode := FAdHocAddress;
          PBLUAdHocFrm.ShowModal;
          if PBLUAdHocFrm.Selected then
            FAdHocAddress := PBLUAdHocFrm.SelCode;
        finally
          PBLUAdHocFrm.Free;
        end;
      end;
    1:
      begin
        PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
        try
          PBLUSuppFrm.bIs_Lookup := True;
          PBLUSuppFrm.bAllow_Upd := False;
          PBLUSuppFrm.bSel_Branch := True;
          PBLUSuppFrm.SelCode := FSupplier;
          PBLUSuppFrm.SelBranch := SupplierBranch;
          PBLUSuppFrm.ShowModal;
          if PBLUSuppFrm.Selected then
          begin
            FSupplier := PBLUSuppFrm.SelCode;
            SupplierBranch := PBLUSuppFrm.SelBranch;
          end;
        finally
          PBLUSuppFrm.Free;
        end;
      end;
    2:
      begin
        PBLURepFrm := TPBLURepFrm.Create(Self);
        try
          PBLURepFrm.bIs_Lookup := True;
          PBLURepFrm.bAllow_Upd := False;
          PBLURepFrm.SelCode := FRep;
          PBLURepFrm.ShowModal;
          if PBLURepFrm.Selected then
            FRep := PBLURepFrm.SelCode;
        finally
          PBLURepFrm.Free;
        end;
      end;
    3:
      begin
        PBLUCustFrm := TPBLUCustFrm.Create(Self);
        try
          PBLUCustFrm.bIs_Lookup := True;
          PBLUCustFrm.bAllow_Upd := False;
          PBLUCustFrm.bSel_Branch := True;
          PBLUCustFrm.SelCode := FCustomer;
          PBLUCustFrm.SelBranch := CustomerBranch;
          PBLUCustFrm.ShowModal;
          if PBLUCustFrm.Selected then
          begin
            FCustomer := PBLUCustFrm.SelCode;
            CustomerBranch := PBLUCustFrm.SelBranch;
          end;
        finally
          PBLUCustFrm.Free;
        end;
      end;
  end;
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineCallOffFrm.DatePointBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DatePointEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      DatePointEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.DeliveryDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DeliveryDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      DeliveryDateEdit.Text := DateToStr(DateSelV5Form.Date);
      QtyDeliveredMemo.text := QtyToDeliverMemo.text;
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.BitBtn1Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(OrderDateEdt.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      OrderDateEdt.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.QtyToDeliverMemoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  GetNumberofBoxes;
end;

procedure TPBMaintPOrdLineCallOffFrm.GetNumberofBoxes;
var
  iBoxes: integer;
begin
  {Try and determine how many boxes if Adding Delivery}
  try
    iBoxes := strtoint(QtyToDeliverMemo.Text) div strtoint(BoxQtyMemo.text);
    if iBoxes < 1 then
      NoofBoxesMemo.Text := inttostr(1)
    else
      NoofBoxesMemo.Text := inttostr(iBoxes);
  except
    NoofBoxesMemo.Text := '1'
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.QtyToDeliverMemoChange(
  Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintPOrdLineCallOffFrm.ValidateQty(Sender: TObject);
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

procedure TPBMaintPOrdLineCallOffFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdLineCallOffFrm.DatePointEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DatePointEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DatePointEdit.SetFocus;
      Exit;
    end;
  end;

  DatePointEdit.Text := PBDatestr(NewDate);
end;


procedure TPBMaintPOrdLineCallOffFrm.OrderDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(OrderDateEdt.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      OrderDateEdt.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.OrderDateEdtExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(OrderDateEdt.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      OrderDateEdt.SetFocus;
      Exit;
    end;
  end;

  OrderDateEdt.Text := PBDatestr(NewDate);

end;

procedure TPBMaintPOrdLineCallOffFrm.ValidateMoney(Sender: TObject);
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

procedure TPBMaintPOrdLineCallOffFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintPOrdLineCallOffFrm.BoxQtyMemoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  GetNumberofBoxes;
end;

procedure TPBMaintPOrdLineCallOffFrm.BitBtn3Click(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.SelCode := CallOffOrder.Supplier;
    PBLUSuppFrm.SelBranch := CallOffOrder.SuppBranch;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      CallOffOrder.Supplier := PBLUSuppFrm.SelCode;
      SupplierEdt.Text := PBLUSuppFrm.SelName + '/' + PBLUSuppFrm.SelBranchName;
      CallOffOrder.SuppBranch := PBLUSuppFrm.SelBranch;
      CheckOk(self);
    end;
  finally
    PBLUSuppFrm.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.BitBtn4Click(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := CallOffOrder.Customer;
    PBLUCustFrm.SelBranch := CallOffOrder.CustBranch;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      CallOffOrder.Customer := PBLUCustFrm.SelCode;
      CustomerEdt.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      CallOffOrder.CustBranch := PBLUCustFrm.SelBranch;
      GetCustContacts;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.GetCustContacts;
begin
  with PBPODM do
  begin
    CustContactSQL.close;
    CustContactSQl.Parambyname('Customer').asinteger := CallOffOrder.Customer;
    CustContactSQl.Parambyname('Branch').asinteger := CallOffOrder.CustBranch;
    CustContactSQL.Open;
  end;
end;
procedure TPBMaintPOrdLineCallOffFrm.FormRefButtonClick(Sender: TObject);
begin
  PBLUFormRefFrm := TPBLUFormRefFrm.Create(Self);
  try
    PBLUFormRefFrm.bIs_Lookup := True;
    PBLUFormRefFrm.bAllow_Upd := True;
    PBLUFormRefFrm.iCust := CallOffOrder.Customer;
    PBLUFormRefFrm.sCustName := PBPODM.GetCustName(CallOffOrder.Customer);
    PBLUFormRefFrm.iBranch := CallOffOrder.CustBranch;
    PBLUFormRefFrm.sBranchName := PBPODM.GetCustBranchName(CallOffOrder.Customer,CalloffOrder.CustBranch);
    PBLUFormRefFrm.SelCode := CallOffOrder.FormReference;
    PBLUFormRefFrm.ShowModal;
    if PBLUFormRefFrm.bSelected then
    begin
      CallOffOrder.FormReference := PBLUFormRefFrm.SelCode;
      FormRefEdit.Text := PBLUFormRefFrm.SelName;
      FormDescEdit.Text := PBLUFormRefFrm.SelDescr;
    end;
  finally
    PBLUFormRefFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineCallOffFrm.FormRefClrBitBtnClick(
  Sender: TObject);
begin
  CalloffOrder.FormReference := 0;
  FormRefEdit.Text := '';
  FormDescEdit.Text := '';
end;

procedure TPBMaintPOrdLineCallOffFrm.RepLUBtnClick(Sender: TObject);
begin
  {Lookup a rep}
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := True;
    PBLURepFrm.SelCode := CallOffOrder.Rep;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      CallOffOrder.Rep := PBLURepFrm.SelCode;
      RepEdit.Text := PBLURepFrm.SelName;
    end;
  finally
    PBLURepFrm.Free;
  end;
  CheckOK(Self);

end;

procedure TPBMaintPOrdLineCallOffFrm.CustRefEditChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TPBMaintPOrdLineCallOffFrm.chkbxmake2invoiceClick(
  Sender: TObject);
begin
  if chkbxMake2Invoice.checked then
    CallOffOrder.CalloffInvoicedUpfront := 'N'
  else
    CallOffOrder.CalloffInvoicedUpfront := 'Y'

end;

procedure TPBMaintPOrdLineCallOffFrm.SetInvoicedUpfront(
  const Value: string);
begin
  FInvoicedUpfront := Value;
  chkbxMake2Invoice.Visible := (InvoicedUpfront = 'Y')
end;

procedure TPBMaintPOrdLineCallOffFrm.btnLUContactClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := false;

    PBLUCContaFrm.icust := self.Customer;
    PBLUCContaFrm.iBranch := self.CustomerBranch;
    //PBLUCContaFrm.SelCode := SelectedLine.CustomerContact;
    PBLUCContaFrm.sCustName := NameEdit.Text;
    PBLUCContaFrm.sBranchName := BranchNameEdit.text;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      edtFAO.text := PBLUCContaFrm.SelName;
    end;
  finally
    PBLUCContaFrm.Free;
  end;
end;

procedure TPBMaintPOrdLineCallOffFrm.SetFAO(const Value: string);
begin
  FFAO := Value;
end;

procedure TPBMaintPOrdLineCallOffFrm.SelContactBtnClick(Sender: TObject);
begin
  PBLUSContaFrm := TPBLUSContaFrm.Create(Self);
  try
    PBLUSContaFrm.bIs_Lookup := true;
    PBLUSContaFrm.bAllow_Upd := true;

    PBLUSContaFrm.iSupp := CallOffOrder.Supplier;
    PBLUSContaFrm.iBranch := CallOffOrder.SuppBranch;
    PBLUSContaFrm.SelCode := CallOffOrder.SuppContact;
    PBLUSContaFrm.sSuppName := SupplierEdt.Text;
//    PBLUSContaFrm.sBranchName := PBPODM.GetSuppBranchName(PurchaseOrder.Supplier,PurchaseOrder.BranchNo);

    PBLUSContaFrm.ShowModal;
    if PBLUSContaFrm.bSelected then
    begin
      CallOffOrder.SuppContact := PBLUSContaFrm.SelCode;
      ContactEdit.Text := PBLUSContaFrm.SelName;
      CheckOK(Self);
    end;
  finally
    PBLUSContaFrm.Free;
  end;

end;

end.
