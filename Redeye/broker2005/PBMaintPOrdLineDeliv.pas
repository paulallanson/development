unit PBMaintPOrdLineDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  PBPOObjects, CCSCommon;

type
  TPBMaintPOrdLineDelivFrm = class(TForm)
    pnlBottom: TPanel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlHeader: TPanel;
    POrdLabel: TLabel;
    DeliverViachk: TCheckBox;
    pnlDetails: TPanel;
    Panel2: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    AddrTypeRadGrp: TRadioGroup;
    AddrGrpBox: TGroupBox;
    AddrTypeLabel: TLabel;
    BranchNameLabel: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    lblFAO: TLabel;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    edtFAO: TEdit;
    btnLUContact: TButton;
    QtysGrpBox: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    QtyToDeliverMemo: TMemo;
    QtyDeliveredMemo: TMemo;
    QtyInvoicedMemo: TMemo;
    NoOfBoxesMemo: TMemo;
    WeightMemo: TMemo;
    SearchBtn: TButton;
    DeliveryDateEdit: TEdit;
    DatePointEdit: TEdit;
    CustReqDateEdit: TEdit;
    DatePointBtn: TBitBtn;
    DeliveryDateBtn: TBitBtn;
    CustReqDateBtn: TBitBtn;
    btnClear: TBitBtn;
    pnlCourierService: TPanel;
    Label2: TLabel;
    lblCourier: TLabel;
    Label16: TLabel;
    dblkppackageType: TDBLookupComboBox;
    Panel3: TPanel;
    Label12: TLabel;
    DelNotesMemo: TMemo;
    DelInstructPanel: TPanel;
    Label10: TLabel;
    DelInstructMemo: TMemo;
    dblkpCourierService: TDBLookupComboBox;
    DeliveryToStockChk: TCheckBox;
    Label3: TLabel;
    CountyEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure OKBitBtnClick(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure ValidateQtyto2DP(Sender: TObject);
    procedure ValidateQtyto3DP(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ShowAddress(Sender: TObject);
    procedure DatePointBtnClick(Sender: TObject);
    procedure AddrTypeRadGrpClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure QtyToDeliverMemoKeyPress(Sender: TObject; var Key: Char);
    procedure QtyToDeliverMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeliveryDateBtnClick(Sender: TObject);
    procedure DatePointEditExit(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure CustReqDateBtnClick(Sender: TObject);
    procedure btnLUContactClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure CustReqDateEditExit(Sender: TObject);
  private
    FDeliveryLine: TDeliveryLine;
    FFuncMode: Char;
    FSupplier: Integer;
    FSupplierBranch: Integer;
    FCustomer: Integer;
    FCustomerBranch: Integer;
    FAdHocAddress: Integer;
    FRep: Integer;
    FPONumber: real;
    sOldValue: string;
    sDescName: string;
    FNoDelInstruct: Boolean;
    FFormsPerBox: string;
    FAddressRadioActive: boolean;
    fDelivNotes: string;
    FCompanyBranch: integer;
    FCourierCode: integer;
    procedure UpdateDelivery;
    procedure SetNoDelInstruct(const Value: Boolean);
    procedure SetFormsPerBox(const Value: string);
    procedure SetAddressRadioActive(const Value: boolean);
    procedure GetNumberofBoxes;
    procedure SetDelivNotes(const Value: string);
    procedure SetCompanyBranch(const Value: integer);
    procedure SetCourierCode(const Value: integer);
  public
    bOK: Boolean;
    CanDeliverToStock: Boolean;
    property DeliveryLine: TDeliveryLine read FDeliveryLine
      write FDeliveryLine;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property CourierCode: integer read FCourierCode write SetCourierCode;
    property Supplier: Integer read FSupplier write FSupplier;
    property SupplierBranch: Integer read FSupplierBranch write FSupplierBranch;
    property CompanyBranch: integer read FCompanyBranch write SetCompanyBranch;
    property Customer: Integer read FCustomer write FCustomer;
    property CustomerBranch: Integer read FCustomerBranch write FCustomerBranch;
    property AdHocAddress: Integer read FAdHocAddress write FAdHocAddress;
    property NoDelInstruct : Boolean read FNoDelInstruct write SetNoDelInstruct;
    property DelivNotes: string read fDelivNotes write SetDelivNotes;
    property Rep: Integer read FRep write FRep;
    property PONumber: real read FPONumber write FPONumber;
    property FormsPerBox: string read FFormsPerBox write SetFormsPerBox;
    property AddressRadioActive: boolean read FAddressRadioActive write SetAddressRadioActive;
  end;

var
  PBMaintPOrdLineDelivFrm: TPBMaintPOrdLineDelivFrm;

implementation

uses
  System.UITypes,
  PBLUAdHoc, PBLUSupp, PBLURep, PBLUCust, PBPODataMod,
  DateSelV5, PBLUCConta, PBMaintPOrd, PBLUSConta, pbLUCompBranch;

{$R *.DFM}

procedure TPBMaintPOrdLineDelivFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  {Setup titles}
  if FFuncMode = poAdd then
    Caption := 'Add a new purchase order line delivery'
  else
    if FFuncMode = poChange then
      Caption := 'Change a purchase order line delivery'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete a purchase order line delivery'
      else
        if FFuncMode = poView then
          Caption := 'View purchase order line delivery';

  {Set the Delivery Via check box}
  with PBPODM do
    begin
      GetDelivDescr(0, 0, 4);
      DeliverViaChk.Caption := 'Deliver via ' + AddrSRC.DataSet.fieldbyname('Name').asstring;
    end;

  if FFuncMode = poAdd then
  begin
    {Empty details}
//    AddrTypeRadGrp.ItemIndex := 4;
//    DeliverytoStockChk.checked := true;
    FCustomer := DeliveryLine.Customer;
    CustomerBranch := DeliveryLine.BranchNoZero;
    FSupplier := DeliveryLine.Supplier;
    SupplierBranch := DeliveryLine.BranchNo;
    FRep := DeliveryLine.Rep;
    FAdHocAddress := DeliveryLine.AdHocAddress;
    if DeliveryLine.Customer <> 0 then
      AddrTypeRadGrp.ItemIndex := 3
    else
    if DeliveryLine.Supplier <> 0 then
          AddrTypeRadGrp.ItemIndex := 1
    else
    if DeliveryLine.Rep <> 0 then
            AddrTypeRadGrp.ItemIndex := 2
    else
    if DeliveryLine.AdHocAddress <> 0 then
              AddrTypeRadGrp.ItemIndex := 0
    else
      begin
        AddrTypeRadGrp.ItemIndex := 4;
        DeliveryLine.DeliveryToStock := 'Y';
      end;
    ShowAddress(Self);
    DeliverytoStockChk.checked := (DeliveryLine.DeliveryToStock = 'Y');
    DeliverViaChk.checked := PBMaintPOrdFrm.DefaultDeliveryViaCompany;
    NameEdit.Text := '';
    BranchNameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    CountyEdit.Text := '';
    DatePointEdit.Text := PBDateStr(DeliveryLine.Datepoint);
    CustReqDateEdit.Text := PBDateStr(DeliveryLine.GoodsRequiredbyCust);
    DeliveryDateEdit.Text := '';
    QtyToDeliverMemo.Text := '';
    QtyDeliveredMemo.Text := '0';
    QtyInvoicedMemo.Text := '0';
    NoOfBoxesMemo.Text := '';
    DelInstructMemo.Text := '';
    DelNotesMemo.Text := '';
    edtFAO.text := DeliveryLine.FAO;
    weightMemo.Text := '';
    dblkpCourierService.KeyValue := 0;
    dblkpPackageType.KeyValue := 0;
  end
  else
    with DeliveryLine do
    begin
      DeliveryToStockChk.checked := false;
      {Get the apppropriate address and display it}

      DatePointEdit.Text := PBDateStr(DatePoint);
      CustReqDateEdit.Text := PBDateStr(GoodsRequiredbyCust);

      DeliveryDateEdit.Text := PBDateStr(DateDelivActual);

      QtyToDeliverMemo.Text := PBFloatStr(QtyToDeliver);
      QtyDeliveredMemo.Text := PBFloatStr(QtyDelivered);
      QtyInvoicedMemo.Text := PBFloatStr(QtyInvoiced);

      {Set the Number of Boxes field}
      NoofBoxesMemo.Text := PBIntStr(NoofBoxes);

      weightMemo.Text := PBFloatStr(Weight);
      dblkpCourierService.KeyValue := Service;
      dblkpPackageType.KeyValue := PackType;

      FCompanyBranch := CompanyBranch;
      DelInstructMemo.Text := Instructions;
      edtFAO.text := FAO;
      FCustomer := Customer;
      CustomerBranch := BranchNoZero;
      FSupplier := Supplier;
      SupplierBranch := BranchNo;
      FRep := Rep;
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
      if DeliverViaCompany = 'Y' then
        DeliverViaChk.Checked := true;

      if DeliveryToStock = 'Y' then
        DeliveryToStockChk.Checked := true
      else
        DeliveryToStockChk.Checked := false;
      if (trim(DeliveryDateEdit.Text) <> '') then
        FFuncMode := poView;
    end;
  POrdLabel.Caption := sDescName;
  {Enable or disable the buttons}
  if CourierCode <> 0 then
    begin
      {Get Courier Service}
      with PBPODM.qryCourierService do
        begin
          close;
          parambyname('Courier').asinteger := CourierCode;
          open;
          lblCourier.Caption := 'Courier: ' + fieldbyname('Courier_Name').asstring;
        end;

      {Get Package Type}
      with PBPODM.qryPackageType do
        begin
          close;
          open;
        end;
    end;

  pnlDetails.Enabled := not (FFuncMode in [poDelete, poView]);
  DelLabel.Visible := (FFuncMode = poDelete);
  AddressRadioActive := false;
  AddrTypeRadGrpClick(Self);
  AddressRadioActive := true;
  OKBitBtn.Visible := (FFuncMode <> poView);

  self.edtFAO.Visible := (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 0) or
                         (AddrTypeRadGrp.ItemIndex = 1) ;
  lblFAO.Visible := self.edtFAO.Visible;
  btnLUContact.Visible := (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 1);

  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (DatePointEdit.Text <> '') and
    (CustReqDateEdit.Text <> '') and
    (QtyToDeliverMemo.Text <> '') and
    (QtyDeliveredMemo.Text <> '') and
    (NoOfBoxesMemo.Text <> '') and
    (QtyInvoicedMemo.Text <> '');
end;

procedure TPBMaintPOrdLineDelivFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPOrdLineDelivFrm.UpdateDelivery;
begin
  with DeliveryLine do
  begin
    FAO := edtFAO.text;
    QtyToDeliver := PBFloatStr(QtyToDeliverMemo.Text);
    QtyDelivered := PBFloatStr(QtyDeliveredMemo.Text);
    QtyInvoiced := PBFloatStr(QtyInvoicedMemo.Text);
    DatePoint := PBDateStr(DatePointEdit.Text);
    GoodsRequiredbyCust := PBDateStr(CustReqDateEdit.Text);
    NoOfBoxes := PBIntStr(NoOfBoxesMemo.Text);

    PackType := dblkpPackageType.KeyValue;
    Weight := PBfloatstr(WeightMemo.text);
    Courier := CourierCode;
    Service := dblkpCourierService.KeyValue;

    Instructions := DelInstructMemo.Text;
    DateDelivActual := PBDateStr(DeliveryDateEdit.Text);
    if DeliverViaChk.checked then
      DeliverViaCompany := 'Y'
    else
      DeliverViaCompany := 'N';

    if DeliveryToStockchk.checked then
      DeliveryToStock := 'Y'
    else
      DeliveryToStock := 'N';

    { Clear the address fields before setting choice }
    AdHocAddress := 0;
    Supplier := 0;
    BranchNo := 0;
    Customer := 0;
    BranchNoZero := 0;
    CompanyBranch := 0;
    Rep := 0;
    case AddrTypeRadGrp.ItemIndex of
      0: AdHocAddress := FAdHocAddress;
      1:
        begin
          Supplier := FSupplier;
          BranchNo := SupplierBranch;
        end;
      2: Rep := FRep;
      3:
        begin
          Customer := FCustomer;
          BranchNoZero := CustomerBranch;
        end;
      else
        CompanyBranch := FCompanyBranch;
    end;
  end;
end;

procedure TPBMaintPOrdLineDelivFrm.OKBitBtnClick(Sender: TObject);
begin
  if (CourierCode <> 0) and ((dblkpCourierService.Text = '') and (dblkpPackageType.Text = '')) then
    begin
      MessageDlg('Delivery is by courier therefore you must specify the service, package type and weight', mtError,
        [mbAbort], 0);
      exit;
    end;

  if (AddrTypeRadGrp.itemindex = 4) and (DeliverytoStockChk.Checked) and (not CanDeliverToStock) then
    begin
      MessageDlg('This job type does not allow deliveries into stock', mtError,
        [mbAbort], 0);
      exit;
    end;

  if (AddrTypeRadGrp.itemindex = 4) and (DeliverytoStockChk.Checked) and
     (PBPODM.UseCompanyBranch) and (trim(BranchNameEdit.Text) = '') and
     (FFuncMode <> poDelete) then
    begin
      MessageDlg('When delivering to the company address type, please select a company delivery location', mtError,
        [mbAbort], 0);
      exit;
    end;

  if StrToInt(QtyDeliveredMemo.Text) > StrToInt(QtyToDeliverMemo.Text) then
    if MessageDlg('Quantity Delivered is greater than ' +
      'Quantity To Deliver - Continue ?', mtWarning, [mbNo, mbYes], 0) <> mrYes
      then Exit;

  if StrToInt(QtyDeliveredMemo.Text) > StrToInt(QtyToDeliverMemo.Text) then
    if MessageDlg('Quantity Invoiced is greater than ' +
      'Quantity To Deliver - Continue ?', mtWarning, [mbNo, mbYes], 0) <> mrYes
      then Exit;
  if FFuncMode <> poDelete then
  begin
    UpdateDelivery
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
  bOK := True;
  close;
end;

procedure TPBMaintPOrdLineDelivFrm.ValidateQty(Sender: TObject);
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

procedure TPBMaintPOrdLineDelivFrm.ValidateQtyto2DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQtyTo2DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.ValidateQtyto3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQtyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdLineDelivFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.ShowAddress(Sender: TObject);
begin
  {Diplay the address on-screen}
  with PBPODM do
    case AddrTypeRadGrp.ItemIndex of
      0: GetDelivDescr(FAdHocAddress, 0, 0);
      1: GetDelivDescr(FSupplier, SupplierBranch, 1);
      2: GetDelivDescr(FRep, 0, 2);
      3: GetDelivDescr(FCustomer, CustomerBranch, 3);
      4: GetDelivDescr(0, FCompanyBranch, 4);
    end;
  with PBPODM.AddrSRC.DataSet do
  begin
    NameEdit.Text := FieldByName('Name').AsString;
    if (AddrTypeRadGrp.ItemIndex = 1) or (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 4) then
      BranchNameEdit.Text := FieldByName('Branch_Name').AsString;
    BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
    StreetEdit.Text := FieldByName('Street').AsString;
    LocaleEdit.Text := FieldByName('Locale').AsString;
    TownEdit.Text := FieldByName('Town').AsString;
    PostCodeEdit.Text := FieldByName('PostCode').AsString;
    CountyEdit.text := fieldbyname('County').asstring;
    
  end;
    with PBPODM do
      case AddrTypeRadGrp.ItemIndex of
      0: DelivNotes := GetAddressSpecInstr(atAdHoc, FAdHocAddress, 0);
      1: DelivNotes := GetAddressSpecInstr(atSupplier, FSupplier, SupplierBranch);
      2: DelivNotes := GetAddressSpecInstr(atRep, FRep, 0);
      3: DelivNotes := GetAddressSpecInstr(atCustomer, FCustomer, CustomerBranch);
      4: DelivNotes := GetAddressSpecInstr(atCompany, 0, FCompanyBranch);
      end;
     DelNotesMemo.text := DelivNotes;
end;

procedure TPBMaintPOrdLineDelivFrm.DatePointBtnClick(Sender: TObject);
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

procedure TPBMaintPOrdLineDelivFrm.AddrTypeRadGrpClick(Sender: TObject);
begin
  {Default the Delivery to stock field to false}
  if AddressRadioActive then
    DeliveryToStockChk.checked := false;

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
        btnClear.Visible := false;
      end;
    1:
      begin
        AddrTypeLabel.Caption := 'Supplier';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
        self.edtFAO.Visible := true;
        lblFAO.Visible := true;
        btnLUContact.Visible := true;
        btnClear.Visible := false;
      end;
    2:
      begin
        AddrTypeLabel.Caption := 'Rep';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
        self.edtFAO.Visible := false;
        lblFAO.Visible := false;
        btnLUContact.Visible := false;
        btnClear.Visible := false;
      end;
    3:
      begin
        AddrTypeLabel.Caption := 'Customer';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
        self.edtFAO.Visible := true;
        lblFAO.Visible := true;
        btnLUContact.Visible := true;
        btnClear.Visible := false;

        if deliveryLine.Customer = 0 then
        begin
          Customer := PBMaintPOrdFrm.selectedLine.customer;
          CustomerBranch := PBMaintPOrdFrm.selectedLine.BranchNo;
          self.edtFAO.text := PBMaintPOrdFrm.ContactCombo.text;
        end;
      end;
    4:
      begin
        AddrTypeLabel.Caption := 'Company';
        BranchNameLabel.Visible := PBPODM.UseCompanyBranch;
        BranchNameEdit.Visible := PBPODM.UseCompanyBranch;
        if AddressRadioActive then
          DeliveryToStockChk.checked := true;
          
        self.edtFAO.Visible := false;
        lblFAO.Visible := false;
        btnLUContact.Visible := false;
        btnClear.Visible := true;
      end;
  end;
//  SearchBtn.Enabled := (AddrTypeRadGrp.ItemIndex <> 4);
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.SearchBtnClick(Sender: TObject);
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
            edtFAO.Text := '';
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
          PBLURepFrm.SelCode := FSupplier;
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
            edtFAO.Text := '';
          end;
        finally
          PBLUCustFrm.Free;
        end;
      end;
    4:
      begin
        PBLUCompBranchFrm := TPBLUCompBranchFrm.Create(Self);
        try
          PBLUCompBranchFrm.bIs_Lookup := True;
          PBLUCompBranchFrm.bAllow_Upd := False;
          PBLUCompBranchFrm.SelCode := FCompanyBranch;
          PBLUCompBranchFrm.ShowModal;
          if PBLUCompBranchFrm.Selected then
          begin
            FCompanyBranch := PBLUCompBranchFrm.SelCode;
            edtFAO.Text := '';
          end;
        finally
          PBLUCompBranchFrm.Free;
        end;
      end;
  end;
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.SetNoDelInstruct(const Value: Boolean);
begin
  FNoDelInstruct := Value;
  if Value then
  begin
    DelInstructPanel.Hide;
    pnlDetails.Height := pnlDetails.Height - DelInstructPanel.Height;
    Height := Height - DelInstructPanel.Height;
  end;
end;

procedure TPBMaintPOrdLineDelivFrm.QtyToDeliverMemoKeyPress(
  Sender: TObject; var Key: Char);
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

procedure TPBMaintPOrdLineDelivFrm.SetFormsPerBox(const Value: string);
begin
  FFormsPerBox := Value;
end;

procedure TPBMaintPOrdLineDelivFrm.QtyToDeliverMemoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  GetNumberofBoxes;
end;

procedure TPBMaintPOrdLineDelivFrm.GetNumberofBoxes;
var
  iBoxes: integer;
begin
  {Try and determine how many boxes if Adding Delivery}
  try
    iBoxes := strtoint(QtyToDeliverMemo.Text) div strtoint(FormsPerBox);
    if iBoxes < 1 then
      NoofBoxesMemo.Text := inttostr(1)
    else
      NoofBoxesMemo.Text := inttostr(iBoxes);
  except
    NoofBoxesMemo.Text := '0'
  end;
end;

procedure TPBMaintPOrdLineDelivFrm.DeliveryDateBtnClick(Sender: TObject);
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

procedure TPBMaintPOrdLineDelivFrm.DatePointEditExit(Sender: TObject);
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

procedure TPBMaintPOrdLineDelivFrm.DeliveryDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if DeliveryDateedit.text = '' then exit;
  try
    NewDate := StrToDate(DeliveryDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DeliveryDateEdit.SetFocus;
      Exit;
    end;
  end;

  DeliveryDateEdit.Text := PBDatestr(NewDate);
  QtyDeliveredMemo.text := QtyToDeliverMemo.text;
end;

procedure TPBMaintPOrdLineDelivFrm.SetAddressRadioActive(
  const Value: boolean);
begin
  FAddressRadioActive := Value;
end;

procedure TPBMaintPOrdLineDelivFrm.SetDelivNotes(const Value: string);
begin
  fDelivNotes := Value;
end;

procedure TPBMaintPOrdLineDelivFrm.CustReqDateBtnClick(Sender: TObject);
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

procedure TPBMaintPOrdLineDelivFrm.btnLUContactClick(Sender: TObject);
begin
  if AddrTypeRadGrp.itemindex = 3 then
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
      end
    end
  else
  if AddrTypeRadGrp.itemindex = 1 then
    begin
      PBLUSContaFrm := TPBLUSContaFrm.Create(Owner);
      try
        PBLUSContaFrm.bIs_Lookup := True;
        PBLUSContaFrm.bAllow_Upd := false;

        PBLUSContaFrm.isupp := self.Supplier;
        PBLUSContaFrm.iBranch := self.SupplierBranch;
        //PBLUCContaFrm.SelCode := SelectedLine.CustomerContact;
        PBLUSContaFrm.sSuppName := NameEdit.Text;
        PBLUSContaFrm.sBranchName := BranchNameEdit.text;
        PBLUSContaFrm.ShowModal;
        if PBLUSContaFrm.bselected then
        begin
          edtFAO.text := PBLUSContaFrm.SelName;
        end;
      finally
        PBLUSContaFrm.Free;
      end
    end
end;

procedure TPBMaintPOrdLineDelivFrm.SetCompanyBranch(const Value: integer);
begin
  FCompanyBranch := Value;
end;

procedure TPBMaintPOrdLineDelivFrm.btnClearClick(Sender: TObject);
begin
  FCompanyBranch := 0;  
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineDelivFrm.SetCourierCode(const Value: integer);
begin
  FCourierCode := Value;
  pnlCourierService.visible := (FCourierCode <> 0);
end;

procedure TPBMaintPOrdLineDelivFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintPOrdLineDelivFrm.CustReqDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(CustReqDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      CustReqDateEdit.SetFocus;
      Exit;
    end;
  end;

  CustReqDateEdit.Text := PBDatestr(NewDate);
end;

end.
