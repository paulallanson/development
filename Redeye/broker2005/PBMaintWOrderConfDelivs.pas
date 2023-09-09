unit PBMaintWOrderConfDelivs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, PBWOrdersDM, DB,
  FireDAC.Stan.Param;

type
  TfrmPBMaintWOrderConfDelivs = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    edtCourier: TEdit;
    btnCourier: TBitBtn;
    dblkpService: TDBLookupComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    edtDateReq: TEdit;
    btnDateRequired: TBitBtn;
    memQuantity: TMemo;
    Panel1: TPanel;
    pnlAddress: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtBuilding: TEdit;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    Label5: TLabel;
    edtDeliveryName: TEdit;
    Label7: TLabel;
    edtPackageSize: TEdit;
    btnPackageSize: TBitBtn;
    Label8: TLabel;
    memWeight: TMemo;
    rdgrpAccountType: TRadioGroup;
    grpbxAccountDetails: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edtAccountCode: TEdit;
    edtAccountName: TEdit;
    Panel3: TPanel;
    Label13: TLabel;
    edtActualDate: TEdit;
    btnDateActual: TBitBtn;
    chkbxDespatched: TCheckBox;
    lblHandoverDate: TLabel;
    edtHandoverDate: TEdit;
    btnHandoverDate: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    dblkpSort: TDBLookupComboBox;
    dblkpSpeed: TDBLookupComboBox;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure edtPackSizeChange(Sender: TObject);
    procedure edtWeightChange(Sender: TObject);
    procedure btnCourierClick(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnPackageSizeClick(Sender: TObject);
    procedure rdgrpAccountTypeClick(Sender: TObject);
    procedure chkbxDespatchedClick(Sender: TObject);
  private
    FAddressReq: boolean;
    procedure SetAddressReq(const Value: boolean);
    procedure ShowHandoverDates;
  private
    Courier: integer;
    sOldValue: string;
    FWODeliv: TWODeliv;
    FMode: TwodelivMode;
    procedure SetWODeliv(const Value: TWODeliv);
    procedure SetMode(const Value: TwodelivMode);
    procedure ShowDetails;
    procedure GetServices(tempcode, tempService: integer);
    procedure GetSorts(tempcode, tempSort: integer);
    procedure GetSpeeds(tempcode, tempSpeed: integer);
    function InputDate(TempDate: TDateTime): TDateTime;
    property AddressReq: boolean read FAddressReq write SetAddressReq;
  public
    FActivated: Boolean;
    property Mode: TwodelivMode read FMode write SetMode;
    property WODeliv: TWODeliv read FWODeliv write SetWODeliv;
  end;

var
  frmPBMaintWOrderConfDelivs: TfrmPBMaintWOrderConfDelivs;

implementation

uses
  System.UITypes,
  CCSCommon, STLUCourier, DateSelV5, PBLUPackageSize;

{$R *.dfm}

{ TfrmPBMaintWOrderDelivs }

procedure TfrmPBMaintWOrderConfDelivs.SetMode(const Value: TwodelivMode);
begin
  FMode := Value;
end;

procedure TfrmPBMaintWOrderConfDelivs.SetWODeliv(const Value: TWODeliv);
begin
  FWODeliv := Value;
end;

procedure TfrmPBMaintWOrderConfDelivs.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    wodelAdd     : Caption := 'Add a Despatch Line';
    wodelChange  : Caption := 'Change a Despatch line';
    wodelDelete  : Caption := 'Delete a Despatch Line';
    end;  { case }
    if Mode = wodelAdd then
      sTemp := ' New Despatch Line '
    else
      sTemp := ' Works Order ' + IntToStr(WODeliv.Parent.DbKey) + ' ';

    dblkpService.ListSource := WODeliv.Parent.DataModule.dtsCourierService;

    ShowDetails;

    AddressReq := WODeliv.AddressReq;
    
//    pnlAddress.Enabled := (Mode <> wodelView) and (WODeliv.AddressReq);
//    pnlDetails.enabled := (Mode <> wodelView);
    btnOk.visible := (Mode <> wodelView);
    lblDelete.Visible := (Mode = wodelDelete);
    
    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmPBMaintWOrderConfDelivs.ShowDetails;
begin
  if Mode = wodelAdd then
  begin
    memQuantity.text := inttostr(WODeliv.Quantity);
    edtDateReq.text := pbdatestr(WODeliv.Parent.DateRequired);
    edtHandoverDate.text := pbdatestr(WODeliv.Parent.DateRequired);

    edtCourier.Text := '';
    dblkpService.KeyValue := 0;
    dblkpSort.KeyValue := 0;
    dblkpSpeed.KeyValue := 0;
    edtPackagesize.Text := '';
    memweight.Text := '';
    rdgrpAccountType.ItemIndex := -1;
    edtAccountCode.Text := '';
    edtAccountName.Text := '';

    edtDeliveryName.Text := '';
    edtBuilding.Text := '';
    edtStreet.Text := '';
    edtLocale.Text := '';
    edtTown.Text := '';
    edtPostcode.Text := '';
  end
  else
  begin
    Courier := WODeliv.Courier;
    memQuantity.text := inttostr(WODeliv.Quantity);
    edtDateReq.text := pbdatestr(WODeliv.DelivDate);
    if WODeliv.HandOverDate = 0 then
      edtHandOverDate.Text := pbdatestr(WODeliv.DelivDate)
    else
      edtHandOverDate.Text := pbdatestr(WODeliv.HandOverDate);

    edtCourier.Text := WODeliv.CourierName;

    if WODeliv.CustomerAccount then
      rdgrpAccountType.ItemIndex := 0
    else
      rdgrpAccountType.ItemIndex := 1;

    edtAccountCode.Text := WODeliv.CustomerAccountCode;
    edtAccountName.Text := WODeliv.CustomerAccountName;

    {Go get the services for this courier}
    GetServices(Courier, WODeliv.Service);
    dblkpService.KeyValue := WODeliv.Service;

    {Go get the Sort options for this courier}
    GetSorts(Courier, WODeliv.Sort);
    dblkpSort.KeyValue := WODeliv.Sort;

    {Go get the Speed options for this courier}
    GetSpeeds(Courier, WODeliv.Speed);
    dblkpSpeed.KeyValue := WODeliv.Speed;

    edtPackagesize.Text := WODeliv.PackSizeDescr;
    memweight.Text := inttostr(WODeliv.Weight);

    edtDeliveryName.Text := WODeliv.DelivName;
    edtBuilding.Text := WODeliv.Address1;
    edtStreet.Text := WODeliv.Address2;
    edtLocale.Text := WODeliv.Address3;
    edtTown.Text := WODeliv.Town;
    edtPostcode.Text := WODeliv.Postcode;

    edtActualDate.Text := PBDateStr(WODeliv.DelivDateAct);
    chkbxDespatched.Checked := (edtActualDate.Text <> '')
  end;
  ShowHandOverDates;
end;

procedure TfrmPBMaintWOrderConfDelivs.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (memQuantity.text <> '') and
                    (edtDateReq.text <> '') and
                    (edtCourier.text <> '') and
                    (dblkpService.text <> '') and
                    (memWeight.text <> '') and
                    (rdgrpAccountType.ItemIndex <> -1);
end;

procedure TfrmPBMaintWOrderConfDelivs.memQuantityChange(Sender: TObject);
begin
  try
    WODeliv.Quantity := strtoint((Sender as TMemo).text);
  except
    WODeliv.Quantity := 1;
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWOrderConfDelivs.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmPBMaintWOrderConfDelivs.ValidateQty(Sender: TObject);
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
end;

procedure TfrmPBMaintWOrderConfDelivs.edtPackSizeChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TfrmPBMaintWOrderConfDelivs.edtWeightChange(Sender: TObject);
begin
  CheckOK(self);

end;

procedure TfrmPBMaintWOrderConfDelivs.btnCourierClick(Sender: TObject);
begin
  STLUCourierFrm := TSTLUCourierFrm.Create(Self);
  try
    STLUCourierFrm.bIs_Lookup := True;
    STLUCourierFrm.bAllow_Upd := True;
    STLUCourierFrm.SelCode := Courier;
    STLUCourierFrm.SelName := edtCourier.text;
    STLUCourierFrm.ShowModal;
    if STLUCourierFrm.Selected then
    begin
      Courier := STLUCourierFrm.SelCode;
      edtCourier.text := STLUCourierFrm.SelName;
      AddressReq := STLUCourierFrm.AddressReq;
      GetServices(Courier, WODeliv.Service);
      GetSorts(Courier, WODeliv.Sort);
      GetSpeeds(Courier, WODeliv.Speed);
    end;
  finally
    STLUCourierFrm.Free;
  end;
end;

procedure TfrmPBMaintWOrderConfDelivs.GetServices(tempcode, tempService: integer);
begin
  with WODeliv.Parent.DataModule.qryCourierService do
    begin
      Close;
      ParamByName('Courier').asinteger := tempcode;
      ParamByName('Service_no').asinteger := tempService;
      Open;
    end;
end;

procedure TfrmPBMaintWOrderConfDelivs.GetSorts(tempcode, tempSort: integer);
begin
  with WODeliv.Parent.DataModule.qryCourierSort do
    begin
      Close;
      ParamByName('Courier').asinteger := tempcode;
      ParamByName('Courier_Sort').asinteger := tempSort;
      Open;
    end;
end;

procedure TfrmPBMaintWOrderConfDelivs.GetSpeeds(tempcode, tempSpeed: integer);
begin
  with WODeliv.Parent.DataModule.qryCourierSpeed do
    begin
      Close;
      ParamByName('Courier').asinteger := tempcode;
      ParamByName('Courier_Speed').asinteger := tempSpeed;
      Open;
    end;
end;

procedure TfrmPBMaintWOrderConfDelivs.btnDateRequiredClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  NewDate := InputDate(StrToDate(edtdateReq.Text));
  edtDateReq.Text := PBDatestr(NewDate);
end;

function TfrmPBMaintWOrderConfDelivs.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmPBMaintWOrderConfDelivs.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as Tedit).Text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as Tedit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as Tedit).SetFocus;
      Exit;
    end;
  end;

  (Sender as Tedit).Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWOrderConfDelivs.btnOKClick(Sender: TObject);
begin

  WODeliv.Quantity := strtoint(memQuantity.text);
  WODeliv.DelivDate := pbdatestr(edtDateReq.text);
  if not WODeliv.Deferred then
    WODeliv.HandOverDate := 0
  else
    WODeliv.HandoverDate := pbdatestr(edtHandoverDate.text);
  if dblkpService.Text = '' then
    WODeliv.Service := 0
  else
    WODeliv.Service := dblkpService.KeyValue;

  if dblkpSort.text = '' then
    WODeliv.Sort := 0
  else
    WODeliv.Sort := dblkpSort.KeyValue;

  if dblkpSpeed.text = '' then
    WODeliv.Speed :=0
  else
    WODeliv.Speed := dblkpSpeed.KeyValue;
    
  WODeliv.ServiceDescr := dblkpService.Text;
  WODeliv.PackSizeDescr := edtPackageSize.text;
  WODeliv.Weight := strtoint(memWeight.text);
  WODeliv.CourierName := edtCourier.Text;
  WODeliv.AddressReq := AddressReq;

  WODeliv.DelivName := edtDeliveryName.Text;
  WODeliv.Address1 := edtBuilding.Text;
  WODeliv.Address2 := edtStreet.Text;
  WODeliv.Address3 := edtLocale.Text;
  WODeliv.Town := edtTown.Text;
  WODeliv.Postcode := edtPostcode.Text;

  case rdgrpAccountType.ItemIndex of
    0:  begin
          WODeliv.CustomerAccount := true;
          WODeliv.CustomerAccountCode := edtAccountCode.Text;
          WODeliv.CustomerAccountName := edtAccountName.Text;
        end;
    1:  begin
          WODeliv.CustomerAccount := false;
          WODeliv.CustomerAccountCode := '';
          WODeliv.CustomerAccountName := '';
        end;
  end;

  WODeliv.DelivDateAct := PBDateStr(edtActualDate.text);
  if trim(edtActualDate.text) = '' then
    WODeliv.QuantityAct := 0
  else
    WODeliv.QuantityAct := WODeliv.Quantity;

  WODeliv.SaveDelivery;
  ModalResult := mrOK;
end;

procedure TfrmPBMaintWOrderConfDelivs.btnPackageSizeClick(Sender: TObject);
begin
  PBLUPackageSizeFrm := TPBLUPackageSizeFrm.Create(Self);
  try
    PBLUPackageSizeFrm.bIs_Lookup := true;
    PBLUPackageSizeFrm.bAllow_Upd := true;
    PBLUPackageSizefrm.SelCode := WODeliv.PackSize;
    PBLUPackageSizefrm.SelName := edtPackageSize.text;
    PBLUPackageSizeFrm.ShowModal;
    if PBLUPackageSizeFrm.selected then
      begin
        edtPackageSize.Text := PBLUPackageSizefrm.SelName;
        WODeliv.PackSize := PBLUPackageSizefrm.SelCode;
      end;
  finally
    PBLUPackageSizeFrm.Free;
  end
end;

procedure TfrmPBMaintWOrderConfDelivs.SetAddressReq(const Value: boolean);
begin
  FAddressReq := Value;
  pnlAddress.enabled := FAddressReq;
  if FAddressReq then
    begin
      edtDeliveryName.Color := clWindow;
      edtBuilding.Color := clWindow;
      edtStreet.Color := clWindow;
      edtLocale.Color := clWindow;
      edtTown.Color := clWindow;
      edtPostcode.Color := clWindow;
    end
  else
    begin
      edtDeliveryName.Color := clbtnFace;
      edtBuilding.Color := clbtnFace;
      edtStreet.Color := clbtnFace;
      edtLocale.Color := clbtnFace;
      edtTown.Color := clbtnFace;
      edtPostcode.Color := clbtnFace;
    end
end;

procedure TfrmPBMaintWOrderConfDelivs.rdgrpAccountTypeClick(Sender: TObject);
begin
  grpbxAccountDetails.enabled := (sender as TRadioGroup).ItemIndex = 0;
  if rdgrpAccountType.itemindex = 0 then
    begin
      edtAccountCode.Color := clWindow;
      edtAccountName.Color := clWindow;
    end
  else
    begin
      edtAccountCode.Color := clbtnFace;
      edtAccountName.Color := clbtnFace;
    end;
  CheckOK(self);
end;

procedure TfrmPBMaintWOrderConfDelivs.chkbxDespatchedClick(Sender: TObject);
begin
  if chkbxDespatched.checked then
    begin
      if edtActualDate.text = '' then
        edtActualDate.Text := PBDateStr(date);
    end
  else
    begin
      edtActualDate.Text := '';
    end;
end;

procedure TfrmPBMaintWOrderConfDelivs.ShowHandoverDates;
begin
  edtHandoverDate.visible := woDeliv.Deferred;
  lblHandoverDate.visible := woDeliv.Deferred;
  btnHandoverDate.visible := woDeliv.Deferred;
end;

end.
