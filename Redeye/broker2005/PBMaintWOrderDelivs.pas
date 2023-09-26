unit PBMaintWOrderDelivs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, PBWOrdersDM;

type
  TfrmPBMaintWOrderDelivs = class(TForm)
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
    lblHandoverDate: TLabel;
    edtHandoverDate: TEdit;
    btnHandoverDate: TBitBtn;
    Label13: TLabel;
    dblkpSort: TDBLookupComboBox;
    Label14: TLabel;
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
    procedure dblkpServiceClick(Sender: TObject);
    procedure btnHandoverDateClick(Sender: TObject);
    procedure edtHandoverDateExit(Sender: TObject);
  private
    FAddressReq: boolean;
    FReturnAddressReq: boolean;
    procedure SetAddressReq(const Value: boolean);
    procedure ShowHandoverDates;
    procedure SetReturnAddressReq(const Value: boolean);
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
    property ReturnAddressReq: boolean read FReturnAddressReq write SetReturnAddressReq;
  public
    FActivated: Boolean;
    property Mode: TwodelivMode read FMode write SetMode;
    property WODeliv: TWODeliv read FWODeliv write SetWODeliv;
  end;

var
  frmPBMaintWOrderDelivs: TfrmPBMaintWOrderDelivs;

implementation

uses UITypes, FireDAC.Stan.Param, CCSCommon, STLUCourier, DateSelV5, PBLUPackageSize;

{$R *.dfm}

{ TfrmPBMaintWOrderDelivs }

procedure TfrmPBMaintWOrderDelivs.SetMode(const Value: TwodelivMode);
begin
  FMode := Value;
end;

procedure TfrmPBMaintWOrderDelivs.SetWODeliv(const Value: TWODeliv);
begin
  FWODeliv := Value;
end;

procedure TfrmPBMaintWOrderDelivs.FormActivate(Sender: TObject);
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
    dblkpSort.ListSource := WODeliv.Parent.DataModule.dtsCourierSort;
    dblkpSpeed.ListSource := WODeliv.Parent.DataModule.dtsCourierSpeed;

    ShowDetails;

    AddressReq := WODeliv.AddressReq;
    
    pnlAddress.Enabled := (Mode <> wodelView) and (WODeliv.AddressReq);
    pnlDetails.enabled := (Mode <> wodelView);
    btnOk.visible := (Mode <> wodelView);
    lblDelete.Visible := (Mode = wodelDelete);
    
    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmPBMaintWOrderDelivs.ShowDetails;
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
  end;
  ShowHandOverDates;
end;

procedure TfrmPBMaintWOrderDelivs.CheckOK(Sender : TObject);
begin
  if WODeliv.Deferred then
    btnOK.enabled :=  (memQuantity.text <> '') and
                    (edtDateReq.text <> '') and
                    (edtHandoverDate.text <> '') and
                    (edtCourier.text <> '') and
                    (edtPackageSize.text <> '') and
                    (dblkpService.text <> '') and
                    (memWeight.text <> '') and
                    (rdgrpAccountType.ItemIndex <> -1)
  else
    btnOK.enabled :=  (memQuantity.text <> '') and
                    (edtDateReq.text <> '') and
                    (edtCourier.text <> '') and
                    (edtPackageSize.text <> '') and
                    (dblkpService.text <> '') and
                    (memWeight.text <> '') and
                    (rdgrpAccountType.ItemIndex <> -1);
end;

procedure TfrmPBMaintWOrderDelivs.memQuantityChange(Sender: TObject);
begin
  try
    WODeliv.Quantity := strtoint((Sender as TMemo).text);
  except
    WODeliv.Quantity := 1;
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWOrderDelivs.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmPBMaintWOrderDelivs.ValidateQty(Sender: TObject);
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

procedure TfrmPBMaintWOrderDelivs.edtPackSizeChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TfrmPBMaintWOrderDelivs.edtWeightChange(Sender: TObject);
begin
  CheckOK(self);
  
end;

procedure TfrmPBMaintWOrderDelivs.btnCourierClick(Sender: TObject);
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
      ReturnAddressReq := STLUCourierFrm.ReturnAddressReq;
      GetServices(Courier, WODeliv.Service);
      GetSorts(Courier, WODeliv.Sort);
      GetSpeeds(Courier, WODeliv.Speed);
    end;
  finally
    STLUCourierFrm.Free;
  end;

end;

procedure TfrmPBMaintWOrderDelivs.GetServices(tempcode, tempService: integer);
begin
  with WODeliv.Parent.DataModule.qryCourierService do
    begin
      Close;
      ParamByName('Courier').asinteger := tempcode;
      ParamByName('Service_no').asinteger := tempService;
      Open;
    end;
end;

procedure TfrmPBMaintWOrderDelivs.GetSorts(tempcode, tempSort: integer);
begin
  with WODeliv.Parent.DataModule.qryCourierSort do
    begin
      Close;
      ParamByName('Courier').asinteger := tempcode;
      ParamByName('Courier_Sort').asinteger := tempSort;
      Open;
    end;
end;

procedure TfrmPBMaintWOrderDelivs.GetSpeeds(tempcode, tempSpeed: integer);
begin
  with WODeliv.Parent.DataModule.qryCourierSpeed do
    begin
      Close;
      ParamByName('Courier').asinteger := tempcode;
      ParamByName('Courier_Speed').asinteger := tempSpeed;
      Open;
    end;
end;

procedure TfrmPBMaintWOrderDelivs.btnDateRequiredClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  NewDate := InputDate(StrToDate(edtdateReq.Text));
  edtDateReq.Text := PBDatestr(NewDate);

  if (NewDate-7) < date then
    edtHandoverDate.Text := PBDatestr(date)
  else
    edtHandoverDate.Text := PBDatestr(NewDate-7);
end;

function TfrmPBMaintWOrderDelivs.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmPBMaintWOrderDelivs.edtDateReqExit(Sender: TObject);
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

  if (NewDate-7) < date then
    edtHandoverDate.Text := PBDatestr(date)
  else
    begin
      newDAte := (NewDate - 7);
      edtHandoverDate.Text := PBDatestr(NewDate);
    end;
end;

procedure TfrmPBMaintWOrderDelivs.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
    if (Mode = wodelAdd) or (WODeliv.parent.dbKey = 0) then
      begin
        {Check whether the Sort and Speed details have been selected}
        if (dblkpSort.Text = '') and (dblkpSort.ListSource.DataSet.RecordCount > 0) then
          begin
            messageDlg('Sort options are available for this courier, please select the relevant sort option', mtInformation, [mbOk], 0);
            dblkpSort.SetFocus;
            exit;
          end;

        {Check whether the Sort and Speed details have been selected}
        if (dblkpSpeed.Text = '') and (dblkpSpeed.ListSource.DataSet.RecordCount > 0) then
          begin
            messageDlg('Speed options are available for this courier, please select the relevant speed option', mtInformation, [mbOk], 0);
            dblkpSpeed.SetFocus;
            exit;
          end;
      end;

  if AddressReq and (trim(edtPostcode.Text) = '') then
    begin
      messageDlg('Address details are required for this courier, please enter the delivery name and at least the first line of the address and the postcode.', mtInformation, [mbOk], 0);
      edtBuilding.SetFocus;
      exit;
    end;

  WODeliv.Quantity := strtoint(memQuantity.text);
  WODeliv.DelivDate := pbdatestr(edtDateReq.text);
  if not wodeliv.Deferred then
    WODeliv.HandOverDate := 0
  else
    WODeliv.HandoverDate := pbdatestr(edtHandoverDate.text);
  WODeliv.Courier := Courier;
  
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

  WODeliv.ReturnAddressRequired := self.ReturnAddressReq;
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

  if Mode = wodelAdd then
  begin
    WODeliv.DelivNumber := WODeliv.Parent.Deliveries.Count + 1;
    WODeliv.Parent.Deliveries.Add(WODeliv);
  end
  else
  if Mode = wodelDelete then
  begin
    inx := WODeliv.Parent.Deliveries.IndexOf(WODeliv.DelivNumber);
    WODeliv.Parent.Deliveries.Delete(inx);
    WODeliv.Parent.Deliveries.Renumber;
  end;
  ModalResult := mrOK;
end;

procedure TfrmPBMaintWOrderDelivs.btnPackageSizeClick(Sender: TObject);
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
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWOrderDelivs.SetAddressReq(const Value: boolean);
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

procedure TfrmPBMaintWOrderDelivs.rdgrpAccountTypeClick(Sender: TObject);
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

procedure TfrmPBMaintWOrderDelivs.dblkpServiceClick(Sender: TObject);
begin
  if dblkpService.text = '' then exit;
  with WODeliv.Parent.DataModule.qryGetCourierService do
    begin
      close;
      parambyname('Courier').asinteger := WODeliv.Courier;
      parambyname('Service_no').asinteger := dblkpService.KeyValue;
      open;
      wodeliv.Deferred := (fieldbyname('Deferred_Service').asstring = 'Y');
      ShowHandoverDates;
    end;
end;

procedure TfrmPBMaintWOrderDelivs.btnHandoverDateClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  NewDate := InputDate(StrToDate(edtHandoverDate.Text));
  edtHandoverDate.Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWOrderDelivs.ShowHandoverDates;
begin
  edtHandoverDate.visible := woDeliv.Deferred;
  lblHandoverDate.visible := woDeliv.Deferred;
  btnHandoverDate.visible := woDeliv.Deferred;
end;

procedure TfrmPBMaintWOrderDelivs.edtHandoverDateExit(Sender: TObject);
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

procedure TfrmPBMaintWOrderDelivs.SetReturnAddressReq(
  const Value: boolean);
begin
  FReturnAddressReq := Value;
end;

end.
