unit PBMaintJobBagDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, PBJobBagDM;

type
  TPBMaintJobBagDeliveryfrm = class(TForm)
    BottomPanel: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    Panel1: TPanel;
    Label9: TLabel;
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
    DelivNotesBitBtn: TBitBtn;
    edtFAO: TEdit;
    btnLUContact: TButton;
    QtysGrpBox: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    QtyToDeliverMemo: TMemo;
    NoOfBoxesMemo: TMemo;
    BoxQtyMemo: TMemo;
    WeightMemo: TMemo;
    DatePointEdit: TEdit;
    SearchBtn: TButton;
    DatePointBtn: TBitBtn;
    btnClear: TBitBtn;
    pnlCourierService: TPanel;
    lblCourier: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dblkpCourierService: TDBLookupComboBox;
    dblkppackageType: TDBLookupComboBox;
    DelInstructPanel: TPanel;
    Label10: TLabel;
    DelInstructMemo: TMemo;
    btnCourier: TButton;
    edtCourierName: TEdit;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DatePointBtnClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure AddrTypeRadGrpClick(Sender: TObject);
    procedure btnLUContactClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure QtyToDeliverMemoKeyPress(Sender: TObject; var Key: Char);
    procedure QtyToDeliverMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCourierClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FActivated: boolean;
    FJobBagDelivery: TJobBagDelivery;
    FMode: TJBDelivMode;
    iCustomer: integer;
    sOldValue: string;
    procedure CheckOK(Sender: TObject);
    procedure SetJobBagDelivery(const Value: TJobBagDelivery);
    procedure ShowDetails;
    procedure SetMode(const Value: TJBDelivMode);
    procedure ShowAddress(Sender: TObject);
    procedure GetNumberofBoxes;
    procedure GetCourierService;
    { Private declarations }
  public
    FAdhocAddress, FRep, FCustomer, FCustomerBranch, FSupplier, FSupplierBranch, FCompanyBranch: integer;
    property JobBagDelivery: TJobBagDelivery read FJobBagDelivery write SetJobBagDelivery;
    property Mode: TJBDelivMode read FMode write SetMode;
  end;

var
  PBMaintJobBagDeliveryfrm: TPBMaintJobBagDeliveryfrm;

implementation

uses UITypes, CCSCommon, DateSelV5, PBLUAdHoc, PBLUSupp, PBLURep, PBLUCust,
  pbLUCompBranch, pbDatabase, PBLUCConta, STLUCourier;

{$R *.dfm}

procedure TPBMaintJobBagDeliveryfrm.FormActivate(Sender: TObject);
var
  sJobBag: string;
begin
  if not FActivated then
  begin
    sJobBag := IntToStr(JobBagDelivery.Parent.DbKey);
    if Mode = jbdelivAdd then
      Caption := 'Add delivery details: ' + sJobBag;
    if Mode = jbdelivChange then
      Caption := 'Change delivery details: ' + sJobBag;
    if Mode = jbdelivDelete then
      Caption := 'Delete delivery details: ' + sJobBag;

    with jobBagDelivery.Parent.datamodule do
      begin
        dblkpPackageType.listsource := dtsPackageType;
        qryPackageType.Close;
        qryPackageType.Open;
      end;

    ShowDetails;

    pnlDetails.Enabled := (Mode <> jbdelivDelete) and (Mode <> jbdelivView);

    lblDelete.Visible := (Mode = jbdelivDelete);

    btnOK.Visible := not(Mode = jbdelivView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagDeliveryfrm.ShowDetails;
begin
(*  {Set the Delivery Via check box}
  with JobBagDelivery.parent.datamodule do
    begin
      GetDeliveryDescription(0, 0, 4);
      DeliverViaChk.Caption := 'Deliver via ' + AddrSRC.DataSet.fieldbyname('Name').asstring;
    end;
*)

  if Mode = jbdelivAdd then
  begin
//    DeliverViaChk.Checked := false;
    AddrTypeRadGrp.itemindex := 3;       {Customer delivery type}
    QtyToDeliverMemo.Text := '';
    BoxQtyMemo.Text := '1';
    NoOfBoxesMemo.Text := '';
    WeightMemo.Text := '0';
    DatePointEdit.Text := '';
    DelInstructMemo.Text := '';
    edtCourierName.Text := '';
  end
  else
  begin
//    DeliverViaChk.Checked := (JobBagDelivery.DeliverViaCompany = 'Y');
    FAdHocAddress := JobBagDelivery.AdhocAddress;
    FCustomer := jobBagDelivery.Customer;
    FCustomerBranch := JobBagDelivery.BranchNo;
    FSupplier := JobBagDelivery.Supplier;
    FSupplierBranch := JobBagDelivery.SupplierBranch;
    FRep := JoBBagDelivery.Rep;
    FCompanyBranch := JobBagDelivery.CompanyBranch;

    if JobBagDelivery.AdhocAddress <> 0 then
      begin
        AddrTypeRadGrp.itemindex := 0
      end
    else
    if JobBagDelivery.Supplier <> 0 then
      begin
        AddrTypeRadGrp.itemindex := 1
      end
    else
    if JobBagDelivery.Rep <> 0 then
      begin
        AddrTypeRadGrp.itemindex := 2
      end
    else
    if JobBagDelivery.Customer <> 0 then
      begin
        AddrTypeRadGrp.itemindex := 3
      end
    else
      begin
        AddrTypeRadGrp.itemindex := 4;
      end;

    edtFAO.Text := JobBagDelivery.ContactName;
    QtyToDeliverMemo.Text := floattoStr(JobBagDelivery.QtyToDeliver);
    BoxQtyMemo.Text := inttostr(JobBagDelivery.BoxQuantity);
    NoOfBoxesMemo.Text := inttoStr(JobBagDelivery.NumberOfBoxes);;
    WeightMemo.Text := floattoStr(JobBagDelivery.DeliveryWeightKilos);;
    DatePointEdit.Text := PBDateStr(JobBagDelivery.DateRequired);
    DelInstructMemo.Text := JobBagDelivery.DeliveryInstructions;
    edtCourierName.Text := JobBagDelivery.CourierName;
    GetCourierService;  {Display the courier service details}
    dblkpCourierService.KeyValue := JobBagDelivery.service;
    dblkpPackageType.KeyValue := JobBagDelivery.PackageType;
  end;
end;

procedure TPBMaintJobBagDeliveryfrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  btnOK.Enabled := (AddrTypeRadGrp.ItemIndex >= 0) and
    (NameEdit.Text <> '') and
    (QtyToDeliverMemo.Text <> '') and
    (NoOfBoxesMemo.text <> '') and
    (DatePointEdit.Text <> '');
end;

procedure TPBMaintJobBagDeliveryfrm.SetJobBagDelivery(
  const Value: TJobBagDelivery);
begin
  FJobBagDelivery := Value;
end;

procedure TPBMaintJobBagDeliveryfrm.SetMode(const Value: TJBDelivMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagDeliveryfrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  if strtoint(QtyToDeliverMemo.Text) <= 0 then
    begin
      MessageDlg('Quantity to deliver must be greater than zero!', mtError, [mbAbort], 0);
      QtyToDeliverMemo.SetFocus;
      exit;
    end;

  JobBagDelivery.AdhocAddress := 0;
  JobBagDelivery.Rep := 0;
  JobBagDelivery.Customer := 0;
  JobBagDelivery.BranchNo := 0;
  JobBagDelivery.Supplier := 0;
  JobBagDelivery.SupplierBranch := 0;
  JobBagDelivery.CompanyBranch := 0;

  case AddrTypeRadGrp.ItemIndex of
    0: begin
          JobBagDelivery.AdhocAddress := FAdhocAddress;
          JobBagDelivery.DeliveryLocation := 'Ad Hoc:  ' + NameEdit.Text;
       end;
    1: begin
          JobBagDelivery.Supplier := FSupplier;
          JobBagDelivery.SupplierBranch := FSupplierBranch;
          JobBagDelivery.ContactName := '';
          JobBagDelivery.DeliveryLocation := 'Supp/Br:  ' + NameEdit.Text + ', ' + BranchNameEdit.Text;
       end;
    2: begin
          JobBagDelivery.Rep := FRep;
          JobBagDelivery.ContactName := '';
          JobBagDelivery.DeliveryLocation := 'Rep  :  ' + NameEdit.Text;
       end;
    3: begin
          JobBagDelivery.Customer := FCustomer;
          JobBagDelivery.BranchNo := FCustomerBranch;
          JobBagDelivery.ContactName := edtFAO.text;
          JobBagDelivery.DeliveryLocation := 'Cust/Br:  ' + NameEdit.Text + ', ' + BranchNameEdit.Text;
       end
  else
    begin
      JobBagDelivery.CompanyBranch := FCompanyBranch;
      JobBagDelivery.ContactName := '';
      if FCompanyBranch <> 0 then
        JobBagDelivery.DeliveryLocation := 'Here:  ' + NameEdit.Text + ', ' + BranchNameEdit.Text
      else
        JobBagDelivery.DeliveryLocation := 'Here:  ' + NameEdit.Text ;
    end;
  end;

(*  if DeliverViaChk.checked then
    JobBagDelivery.DeliverViaCompany := 'Y'
  else
*)
  JobBagDelivery.DeliverViaCompany := 'N';


  JobBagdelivery.QtyToDeliver := StrToFloatDef(QtyToDeliverMemo.text, 0, FormatSettings);
  JobBagdelivery.QtyDelivered := 0;
  JobBagdelivery.BoxQuantity := strtoint(BoxQtyMemo.text);
  JobBagdelivery.NumberOfBoxes := strtoint(NoOfBoxesMemo.text);
  JobBagdelivery.DeliveryWeightKilos := StrToFloatDef(WeightMemo.text, 0, FormatSettings);
  JobBagdelivery.DateRequired := PBDateStr(DatePointEdit.text);
  JobBagDelivery.DeliveryInstructions := DelInstructMemo.Text;

  if JobBagDelivery.Courier <> 0 then
    JobBagDelivery.CourierName := edtCourierName.Text;
    
  if dblkpCourierService.text = '' then
    JobBagDelivery.Service := 0
  else
    JobBagDelivery.Service := dblkpCourierService.keyvalue;

  if dblkpPackageType.Text = '' then
    JobBagDelivery.PackageType := 0
  else
    JobBagDelivery.PackageType := dblkpPackageType.keyvalue;

  if Mode = jbDelivAdd then
  begin
    JobBagDelivery.DeliveryNo := JobBagDelivery.Parent.Deliveries.Count + 1;
    JobBagDelivery.Parent.Deliveries.Add(JobBagDelivery);
  end
  else
  if Mode = jbDelivDelete then
  begin
    inx := JobBagDelivery.Parent.Deliveries.IndexOf(JobBagDelivery.DeliveryNo);
    JobBagDelivery.Parent.Deliveries.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagDeliveryfrm.DatePointBtnClick(Sender: TObject);
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

procedure TPBMaintJobBagDeliveryfrm.SearchBtnClick(Sender: TObject);
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
          PBLUSuppFrm.SelBranch := FSupplierBranch;
          PBLUSuppFrm.ShowModal;
          if PBLUSuppFrm.Selected then
          begin
            FSupplier := PBLUSuppFrm.SelCode;
            FSupplierBranch := PBLUSuppFrm.SelBranch;
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
          PBLUCustFrm.SelBranch := FCustomerBranch;
          PBLUCustFrm.ShowModal;
          if PBLUCustFrm.Selected then
          begin
            FCustomer := PBLUCustFrm.SelCode;
            FCustomerBranch := PBLUCustFrm.SelBranch;
            edtFAO.text := '';
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
//  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TPBMaintJobBagDeliveryfrm.ShowAddress(Sender: TObject);
begin
  {Diplay the address on-screen}
  with JobBagDelivery.Parent.DataModule do
    case AddrTypeRadGrp.ItemIndex of
      0: GetDeliveryDescription(FAdHocAddress, 0, 0);
      1: GetDeliveryDescription(FSupplier, FSupplierBranch, 1);
      2: GetDeliveryDescription(FRep, 0, 2);
      3: GetDeliveryDescription(FCustomer, FCustomerBranch, 3);
      4: GetDeliveryDescription(0, FCompanyBranch, 4);
    end;
  with JobBagDelivery.Parent.DataModule.AddrSRC.DataSet do
  begin
    NameEdit.Text := FieldByName('Name').AsString;
    if (AddrTypeRadGrp.ItemIndex = 1) or (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 4) then
      BranchNameEdit.Text := FieldByName('Branch_Name').AsString;
    BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
    StreetEdit.Text := FieldByName('Street').AsString;
    LocaleEdit.Text := FieldByName('Locale').AsString;
    TownEdit.Text := FieldByName('Town').AsString;
    PostCodeEdit.Text := FieldByName('PostCode').AsString;
  end;

  edtFAO.text := JobBagDelivery.ContactName;
  
(*    with JobBagDelivery.Parent.DataModule do
      case AddrTypeRadGrp.ItemIndex of
      0: PBDelivNotesFrm.LoadMemoData(GetDelivNarr(atAdHoc, FAdHocAddress, 0));
      3: PBDelivNotesFrm.LoadMemoData(GetDelivNarr(atCustomer, FCustomer, CustomerBranch));
      4: PBDelivNotesFrm.LoadMemoData(GetDelivNarr(atCompany, 0, 0));
      else PBDelivNotesFrm.LoadMemoData(0);
    end;
*)
end;

procedure TPBMaintJobBagDeliveryfrm.AddrTypeRadGrpClick(Sender: TObject);
begin
  {Setup the address box}
  self.edtFAO.Visible := false;
  lblFAO.Visible := false;
  btnLUContact.Visible := false;
  case AddrTypeRadGrp.ItemIndex of
    0:
      begin
        AddrTypeLabel.Caption := 'Ad Hoc';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
        btnClear.Visible := false;
      end;
    1:
      begin
        AddrTypeLabel.Caption := 'Supplier';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
        btnClear.Visible := false;
      end;
    2:
      begin
        AddrTypeLabel.Caption := 'Rep';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
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

        if FCustomer = 0 then
        begin
          FCustomer := self.iCustomer;

(*          if (FAO = '') and (not self.Focused) then
            FAO := self.OrderContact;
*)
        end;
      end;
    4:
      begin
        AddrTypeLabel.Caption := 'Company';
        BranchNameLabel.Visible := dmBroker.UseCompanyBranch;
        BranchNameEdit.Visible := dmBroker.UseCompanyBranch;
        btnClear.Visible := true;
      end;
  end;
  ShowAddress(Self);
//  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TPBMaintJobBagDeliveryfrm.btnLUContactClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := false;

    PBLUCContaFrm.icust := FCustomer;
    PBLUCContaFrm.iBranch := FCustomerBranch;
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

procedure TPBMaintJobBagDeliveryfrm.btnClearClick(Sender: TObject);
begin
  FCompanyBranch := 0;  
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintJobBagDeliveryfrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagDeliveryfrm.ValidateQty(Sender: TObject);
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

procedure TPBMaintJobBagDeliveryfrm.QtyToDeliverMemoKeyPress(
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

procedure TPBMaintJobBagDeliveryfrm.QtyToDeliverMemoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  GetNumberofBoxes;
end;

procedure TPBMaintJobBagDeliveryfrm.GetNumberofBoxes;
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
    NoofBoxesMemo.Text := '0'
  end;
end;


procedure TPBMaintJobBagDeliveryfrm.btnCourierClick(Sender: TObject);
begin
  STLUCourierfrm := TSTLUCourierfrm.create(self);
  try
    STLUCourierfrm.selcode := jobBagDelivery.courier;
    STLUCourierfrm.bIs_Lookup := True;
    STLUCourierfrm.bAllow_upd := true;
    STLUCourierfrm.showmodal;
    if STLUCourierfrm.selected then
      begin
        edtCourierName.text := STLUCourierfrm.selName;
        JobBagDelivery.Courier := STLUCourierfrm.selcode;
        GetCourierService;
      end;

  finally
    STLUCourierfrm.Free;
  end;
end;

procedure TPBMaintJobBagDeliveryfrm.GetCourierService;
begin
  with JobBagDelivery.parent.DataModule do
    begin
      dblkpCourierService.listsource := dtsCourierService;
      qryCourierService.Close;
      qryCourierService.parambyname('Courier').asinteger := jobBagDelivery.courier;
      qryCourierService.open;

      dblkpCourierService.KeyValue := jobBagDelivery.Service;
    end;
end;

procedure TPBMaintJobBagDeliveryfrm.BitBtn1Click(Sender: TObject);
begin
  edtCourierName.Text := '';
  jobbagdelivery.Courier := 0;
  jobbagdelivery.CourierName := '';
  jobBagdelivery.Service := 0;
  dblkpCourierService.keyvalue := null;
  dblkppackagetype.KeyValue := null;
end;

end.
