unit PBMaintOpsDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, DBCtrls, DB, Menus, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintOpsDetFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    NameEdit: TEdit;
    LoginEdit: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetChecksSQL: TFDQuery;
    DelLabel: TLabel;
    CheckExistsSQL: TFDQuery;
    GetLastOpSQL: TFDQuery;
    AddOpSQL: TFDQuery;
    UpdOpSQL: TFDQuery;
    DelOpChecksSQL: TFDQuery;
    DelOpSQL: TFDQuery;
    AddCheckSQL: TFDQuery;
    qryZero: TFDQuery;
    GetLoginDetsSQL: TFDQuery;
    ChangePassSQL: TFDQuery;
    Label4: TLabel;
    RepComboBox: TDBLookupComboBox;
    RepNASpeedButton: TSpeedButton;
    GetRepsSQL: TFDQuery;
    RepsDS: TDataSource;
    EmailEdit: TEdit;
    Label6: TLabel;
    PageControl1: TPageControl;
    tbshtAccess: TTabSheet;
    Label3: TLabel;
    SelectScrollBox: TScrollBox;
    AllLabel: TLabel;
    AllComboBox: TComboBox;
    tbshtPO: TTabSheet;
    Label5: TLabel;
    memCreditLimit: TMemo;
    rdgrpMinPO: TRadioGroup;
    GroupBox1: TGroupBox;
    lblValue: TLabel;
    memMinValue: TMemo;
    chkbxCanDeleteFromJB: TCheckBox;
    chkbxCanMaintainPO: TCheckBox;
    chkbxCanOverride: TCheckBox;
    rdgrpAuthorise: TRadioGroup;
    Label7: TLabel;
    ShortNameEdit: TEdit;
    CheckShortNameExistsSQL: TFDQuery;
    tbshtEnqs: TTabSheet;
    chkbxCannotViewPrices: TCheckBox;
    chkbxCanConvert: TCheckBox;
    ChgPassBitBtn: TBitBtn;
    PhoneEdit: TEdit;
    Label8: TLabel;
    MobileEdit: TEdit;
    Label9: TLabel;
    chkbxCanLogin: TCheckBox;
    chkbxCanDeleteJobBags: TCheckBox;
    tbshtStock: TTabSheet;
    tbshtInvoicing: TTabSheet;
    chkbxSecurityUser: TCheckBox;
    chkbxCanPass: TCheckBox;
    chkbxCanDeactivateProds: TCheckBox;
    chkbxCanConfirmProduction: TCheckBox;
    Label10: TLabel;
    WebEmailEdit: TEdit;
    lstbxRevenue: TListBox;
    Label11: TLabel;
    btnRevenueCentre: TBitBtn;
    BitBtn1: TBitBtn;
    lstbxRevenueCode: TListBox;
    qryRevCodes: TFDQuery;
    qryDelRevCodes: TFDQuery;
    qryAddRevCodes: TFDQuery;
    Label12: TLabel;
    memAuthLimit: TMemo;
    TabSheet1: TTabSheet;
    chkbxCannotChangeRep: TCheckBox;
    chkbxCanChangeInvOrders: TCheckBox;
    chkbxCanMaintainCreditDetails: TCheckBox;
    Label13: TLabel;
    JobTitleEdit: TEdit;
    tbshtCRM: TTabSheet;
    chkbxActivityAdministrator: TCheckBox;
    GroupBox2: TGroupBox;
    chkbxEnquiryReminder: TCheckBox;
    chkbxQuoteReminder: TCheckBox;
    chkbxProofReminder: TCheckBox;
    chkbxReorderReminder: TCheckBox;
    chkbxOrderAckReminder: TCheckBox;
    chkbxDeliveryReminder: TCheckBox;
    tbshtQuoting: TTabSheet;
    chkbxCanDeleteQuoteCosts: TCheckBox;
    chkbxCanDeletePOs: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure ClearAllChecks(Sender: TObject);
    procedure GetChecks(Sender: TObject);
    procedure SetGroupChecks(Sender: TObject);
    procedure LoginEditChange(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    function CheckIfExists(sTempLogin: string; iTempOpCode: Integer): ByteBool;
    function CheckIfShortNameExists(sTempName: string; iTempOpCode: Integer): ByteBool;
    procedure UpdChecks(iTempCode: Integer);
    procedure AllComboBoxChange(Sender: TObject);
    procedure CreateLabel(TempComboBox: TComboBox; TempCaption: String);
    procedure SetCombo(TempComboBox: TComboBox; TempSetting: String);
    procedure DeleteComponets(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChgPassBitBtnClick(Sender: TObject);
    procedure RepNASpeedButtonClick(Sender: TObject);
    procedure AllowRepSelect(Sender: TObject);
    procedure RepComboBoxClick(Sender: TObject);
    procedure memCreditLimitExit(Sender: TObject);
    procedure rdgrpMinPOClick(Sender: TObject);
    procedure btnRevenueCentreClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    iListCount, iProcLeft, iCatLeft: Integer;
    saList: array[1..1000, 0..2] of string;
    bDoCheckEvent, bCanUpdPassword: ByteBool;
    bPassChanged: ByteBool ;
    sOldPass, sNewPass, sConfPass: String;
    procedure AddZero;
    function GetLastOp : integer;
    procedure DeleteZero;
    procedure LoadRevenueCodes;
    procedure UpdRevenueCodes;
  public
    { Public declarations }
    CheckAccessControl: bytebool;
    sFuncMode: string[1];
    iSelCode, iCode: Integer;
  end;

var
  PBMaintOpsDetFrm: TPBMaintOpsDetFrm;

implementation

uses pbMainMenu, ComObj, ActiveX, PBDatabase, PBMaintOpsDetPass,
  PBLURevenueLoc;

{$R *.DFM}

procedure TPBMaintOpsDetFrm.FormActivate(Sender: TObject);
var
  icount, iMenu, iTop: Integer;
  sCatName, sBtnName, sBtnDescr: string;
  iTempComp, iTempComp1: TComponent;
  cbComboBox: TComboBox;
begin
  {Access the REP details} ;
  With GetRepsSQL do
        begin
        Close ;
        Open ;
        end;
  iProcLeft := 80;
  iCatLeft := 40;
  bDoCheckEvent := True;
  {Get the names of all facilities from the menu};
  with frmpbMainMenu.miModules do
  begin
    iListCount := 0;
      for icount := 0 to count - 1 do
        begin
          if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
            begin
              sCatName := 'Modules';
              sBtnName := items[icount].Name;
              sBtnDescr := items[icount].hint;
              if sCatName = '' then
                Continue;
              iListCount := iListCount + 1;
              saList[iListCount, 0] := sBtnName;
              saList[iListCount, 1] := sBtnDescr;
              saList[iListCount, 2] := sCatName;
            end;
        end;
  end;

  with frmpbMainMenu.miSettings do
  begin
//    iListCount := 0;
      for icount := 0 to count - 1 do
        begin
          if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
            begin
              sCatName := 'System Settings';
              sBtnName := items[icount].Name;
              sBtnDescr := items[icount].hint;
              if sCatName = '' then
                Continue;
              iListCount := iListCount + 1;
              saList[iListCount, 0] := sBtnName;
              saList[iListCount, 1] := sBtnDescr;
              saList[iListCount, 2] := sCatName;
            end;
        end;
  end;

  if frmpbMainMenu.miStock.visible then
    with frmpbMainMenu.miStock do
    begin
//      iListCount := 0;
        for icount := 0 to count - 1 do
          begin
            if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
              begin
                sCatName := 'Stock Settings';
                sBtnName := items[icount].Name;
                sBtnDescr := items[icount].hint;
                if sCatName = '' then
                  Continue;
                iListCount := iListCount + 1;
                saList[iListCount, 0] := sBtnName;
                saList[iListCount, 1] := sBtnDescr;
                saList[iListCount, 2] := sCatName;
              end;
          end;
    end;

  if frmpbMainMenu.miManufacturing.visible then
    with frmpbMainMenu.miManufacturing do
    begin
//      iListCount := 0;
        for icount := 0 to count - 1 do
          begin
            if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
              begin
                sCatName := 'Production';
                sBtnName := items[icount].Name;
                sBtnDescr := items[icount].hint;
                if sCatName = '' then
                  Continue;
                iListCount := iListCount + 1;
                saList[iListCount, 0] := sBtnName;
                saList[iListCount, 1] := sBtnDescr;
                saList[iListCount, 2] := sCatName;
              end;
          end;
    end;

   with frmpbMainMenu.miTools do
  begin
//    iListCount := 0;
      for icount := 0 to count - 1 do
        begin
          if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
            begin
              sCatName := 'Tools';
              sBtnName := items[icount].Name;
              sBtnDescr := items[icount].hint;
              if sCatName = '' then
                Continue;
              iListCount := iListCount + 1;
              saList[iListCount, 0] := sBtnName;
              saList[iListCount, 1] := sBtnDescr;
              saList[iListCount, 2] := sCatName;
            end;
        end;
  end;

  with frmpbMainMenu.miManagement do
  begin
//    iListCount := 0;
      for icount := 0 to count - 1 do
        begin
          if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
            begin
              sCatName := 'Management';
              sBtnName := items[icount].Name;
              sBtnDescr := items[icount].hint;
              if sCatName = '' then
                Continue;
              iListCount := iListCount + 1;
              saList[iListCount, 0] := sBtnName;
              saList[iListCount, 1] := sBtnDescr;
              saList[iListCount, 2] := sCatName;
            end;
        end;
  end;

  with frmpbMainMenu.miReports do
  begin
//    iListCount := 0;
      for icount := 0 to count - 1 do
        begin
          if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
            begin
              sCatName := 'Reports';
              sBtnName := items[icount].Name;
              sBtnDescr := items[icount].hint;
              if sCatName = '' then
                Continue;
              iListCount := iListCount + 1;
              saList[iListCount, 0] := sBtnName;
              saList[iListCount, 1] := sBtnDescr;
              saList[iListCount, 2] := sCatName;
            end;
        end;
  end;
 {Put them into the scroll box};
  iTop := 30;
  sCatname := '';
  for icount := 1 to iListCount do
  begin
    if sCatName <> saList[icount, 2] then
    begin
      iTop := iTop + 10;
      cbComboBox := TComboBox.Create(Self);
      cbComboBox.Parent := SelectScrollBox;
      cbComboBox.Name := 'Cat' + saList[icount, 0];
      cbComboBox.Style := AllComboBox.Style ;
      cbComboBox.Items := AllComboBox.Items ;
      cbComboBox.Left := iCatLeft;
      cbComboBox.Top := iTop;
      cbComboBox.Width := AllComboBox.Width;
      cbComboBox.Visible := True;
      CreateLabel(cbComboBox,saList[icount, 2]);
      cbComboBox.OnChange := AllComboBoxChange;
      iTop := iTop + 26;
      sCatName := saList[icount, 2];
    end;
    cbComboBox := TComboBox.Create(Self);
    cbComboBox.Parent := SelectScrollBox;
    cbComboBox.Name := saList[icount, 0];
    cbComboBox.Style := AllComboBox.Style ;
    cbComboBox.Items := AllComboBox.Items ;
    cbComboBox.Left := iProcLeft;
    cbComboBox.Top := iTop;
    cbComboBox.Width := AllComboBox.Width;
    cbComboBox.Items.Delete(cbComboBox.Items.Count-1);
    cbComboBox.Visible := True;
    CreateLabel(cbComboBox,saList[icount, 1]);
    cbComboBox.OnChange := AllComboBoxChange;
    iTop := iTop + 26;
  end;

  NameEdit.Enabled := (sFuncMode <> 'D');
  ShortNameEdit.Enabled := (sFuncMode <> 'D');
  PhoneEdit.Enabled := (sFuncMode <> 'D');
  JobTitleEdit.Enabled := (sFuncMode <> 'D');
  MobileEdit.Enabled := (sFuncMode <> 'D');
  EmailEdit.Enabled := (sFuncMode <> 'D');
  WebEmailEdit.Enabled := (sFuncMode <> 'D');
  memCreditLimit.Enabled := (sFuncMode <> 'D');
  memAuthLimit.Enabled := (sFuncMode <> 'D');
  LoginEdit.Enabled := (sFuncMode <> 'D');
  SelectScrollBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
//  EnabledGroupBox.Enabled := (sFuncMode <> 'D');
  chkbxSecurityUser.Enabled := (sFuncMode <> 'D');
  chkbxCanPass.Enabled := (sFuncMode <> 'D');
  chkbxEnquiryReminder.Enabled := (sFuncMode <> 'D');
  chkbxQuoteReminder.Enabled := (sFuncMode <> 'D');
  chkbxProofReminder.Enabled := (sFuncMode <> 'D');
  chkbxReorderREminder.Enabled := (sFuncMode <> 'D');
  chkbxOrderAckReminder.Enabled := (sFuncMode <> 'D');
  chkbxDeliveryReminder.Enabled := (sFuncMode <> 'D');
  chkbxActivityAdministrator.Enabled := (sFuncMode <> 'D');
  tbshtCRM.TabVisible := dmBroker.UseCRM;
  tbshtPO.Enabled := (sFuncMode <> 'D');
  tbshtEnqs.Enabled := (sFuncMode <> 'D');
  tbshtAccess.Enabled := (sFuncMode <> 'D');


  if sFuncMode = 'A' then
  begin
    NameEdit.Text := '';
    PhoneEdit.text := '';
    JobTitleEdit.text := '';
    MobileEdit.text := '';
    ShortNameEdit.Text := '';
    EmailEdit.text := '';
    WebEmailEdit.text := '';
    LoginEdit.Text := '';
    memCreditLimit.Text := '0.00';
    memAuthLimit.Text := '0.00';
    memMinValue.Text := '0.00';
    RepComboBox.KeyValue := 0 ;
    chkbxCanLogin.checked := true;
//    EnabledRadioButton.Checked := True;
    ClearAllChecks(Self);
    lstbxRevenue.items.clear;
    lstbxRevenueCode.items.clear;
  end
  else
    begin
      GetChecks(Self);
      LoadRevenueCodes;
    end;
  iSelCode := 0;
  selectscrollbox.Visible := True;
  CheckOK(Self);
  if CheckAccessControl then
    dmBroker.ScreenAccessControl(Self,'mnuOperators',frmpbMainMenu.iOperator,0,0) ;
  {If database is SQL Server, check if can change password} ;
  {If we have permission to get the login details, we can also change the password} ;
  bCanUpdPassword := False ;
  bPassChanged := False ;
  sOldPass := '' ;
  sNewPass := '' ;
  sConfPass := '' ;
  If dmBroker.IsSQL then
        begin
        Try
        With GetLoginDetsSQL do
                begin
                Close ;
                ParamByName('User_Code').AsString := frmpbMainMenu.stsbrMainMenu.panels[0].text ;
                Open ;
                bCanUpdPassword := True ;
                end;
        Except
        On TempError: Exception do
                If (Pos('permission',Lowercase(TempError.Message)) = 0) and
                   (Pos('only members of the',Lowercase(TempError.Message)) = 0) then
                Raise ;
        end;
  end;
  {Check if can select rep} ;
  AllowRepSelect(Self) ;
end;

procedure TPBMaintOpsDetFrm.LoadRevenueCodes;
begin
  with qryRevCodes do
    begin
      close;
      parambyname('Operator').asinteger := iCode;
      open;

      while eof <> true do
        begin
          lstbxRevenue.items.add(fieldbyname('Invoice_Location_Descr').asstring);
          lstbxRevenueCode.items.add(fieldbyname('Invoice_Location').asstring);
          next;
        end;
    end;
  lstbxRevenue.ItemIndex := 0;
end;

procedure TPBMaintOpsDetFrm.ClearAllChecks(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 0 to ComponentCount - 1 do
    if Components[icount] is TComboBox then
    begin
      bDoCheckEvent := False;
      {Set to BLOCKED} ;
      SetCombo(TComboBox(Components[icount]), 'B');
      bDoCheckEvent := True;
    end;
end;

procedure TPBMaintOpsDetFrm.GetChecks(Sender: TObject);
var
  cTempComp: TComponent;
begin
  ClearAllChecks(Self);
  with GetChecksSQL do
  begin
    Close;
    ParamByName('Operator').AsInteger := iCode;
    Open;
    First;
    while (not EOF) do
    begin
      cTempComp :=
        PBMaintOpsDetFrm.FindComponent(FieldByName('Button_Name').AsString);
      if Assigned(cTempComp) then
      begin
        bDoCheckEvent := False;
        try
          {Set the box to the status. If the status is blank, it's from a previous version of BROKER} ;
          {so assume it's full access} ;
          If FieldByName('Button_Status').AsString <> '' then
                SetCombo((cTempComp as TComboBox), FieldByName('Button_Status').AsString)
          else
                SetCombo((cTempComp as TComboBox), 'F');
        except
        end;
        bDoCheckEvent := True;
      end;
      Next;
    end;
  end;
  {Now set all the group checks};
  SetGroupChecks(Self);
end;

procedure TPBMaintOpsDetFrm.SetGroupChecks(Sender: TObject);
var
  icount, iCount1, iLeft: Integer;
  sTempStatus: String ;
begin
  for icount := 0 to ComponentCount - 2 do
  begin
    if Components[icount] is TComboBox then
    begin
      sTempStatus := '' ;
      iLeft := TComboBox(Components[icount]).Left;
      for iCount1 := icount + 1 to ComponentCount - 1 do
      begin
        if Components[icount1] is TComboBox then
                begin
                if TComboBox(Components[iCount1]).Left <= iLeft then
                        Break;
                {Set the status of the parent = the status of the children} ;
                {If they're of differing statuses, set it to "V" for Various} ;
                If sTempStatus = '' then
                        begin
                        sTempStatus := Copy(TComboBox(Components[iCount1]).Text,1,1)
                        end
                else
                        begin
                        If sTempStatus <> Copy(TComboBox(Components[iCount1]).Text,1,1) then
                                begin
                                sTempStatus := 'V' ;
                                Break ;
                                end;
                        end;
                end;
      end;
      bDoCheckEvent := False;
      SetCombo(TComboBox(Components[icount]), sTempStatus) ;
      bDoCheckEvent := True;
    end;
  end;
end;

procedure TPBMaintOpsDetFrm.LoginEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintOpsDetFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintOpsDetFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (LoginEdit.Text <> '') and (NameEdit.Text <> '');
end;

procedure TPBMaintOpsDetFrm.OKBitBtnClick(Sender: TObject);
begin
If bPassChanged then
        begin
        {Operator has requested password change} ;
        Try
                With ChangePassSQL do
                        begin
                        Close ;
                        ParamByName('Old_Pass').AsString := sOldPass ;
                        ParamByName('New_Pass').AsString := sNewPass ;
                        ParamByName('User_Code').AsString := LoginEdit.Text ;
                        ExecSQL ;
                        end;
        Except
                On TempError: Exception do
                        begin
                        MessageDlg(TempError.Message + ' Password NOT Changed',
                                mtWarning,[mbOK],0) ;
                        end;
                end;
        end;
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if CheckIfExists(LoginEdit.Text, iCode) then
      Exit;
    if CheckIfShortNameExists(ShortNameEdit.Text, iCode) then
      Exit;
    if sFuncMode = 'A' then
      iCode :=  GetLastOp;
    with UpdOpSQL do
    begin
      ParamByName('Operator').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text;
      ParamByName('Phone').AsString := PhoneEdit.Text;
      ParamByName('Job_Title').AsString := JobTitleEdit.Text;
      ParamByName('Mobile_no').AsString := MobileEdit.Text;
      ParamByName('Short_Name').AsString := ShortNameEdit.Text;
      ParamByName('Email').AsString := EmailEdit.Text;
      ParamByName('Web_Ordering_Email').AsString := WebEmailEdit.Text;
      ParamByName('Max_Unauthorised_PO_Value').Asfloat := StrToFloatDef(memCreditLimit.Text, 0, FormatSettings);
      ParamByName('Authorised_PO_Cost_Limit').Asfloat := StrToFloatDef(memAuthLimit.Text, 0, FormatSettings);
      ParamByName('Min_PO_Sales_Value').Asfloat := StrToFloatDef(memMinValue.Text, 0, FormatSettings);

      if rdgrpAuthorise.ItemIndex = 0 then
        ParamByName('Can_Authorise_PO').Asstring := 'N'
      else
      if rdgrpAuthorise.ItemIndex = 1 then
        ParamByName('Can_Authorise_PO').Asstring := 'P'
      else
        ParamByName('Can_Authorise_PO').Asstring := 'F';

      if rdgrpMinPO.ItemIndex = 0 then
        ParamByName('Min_PO_Sales_Value_Type').Asstring := 'F'
      else
        ParamByName('Min_PO_Sales_Value_Type').Asstring := 'C';

      if chkbxCanDeleteFromJB.checked then
        ParamByName('Delete_PO_From_Job_Bag').Asstring := 'Y'
      else
        ParamByName('Delete_PO_From_Job_Bag').Asstring := 'N';

      if chkbxCanMaintainPO.checked then
        ParamByName('Maintain_PO_in_Job_Bag').Asstring := 'Y'
      else
        ParamByName('Maintain_PO_in_Job_Bag').Asstring := 'N';

      if chkbxCanDeleteQuoteCosts.checked then
        ParamByName('Can_Delete_Quote_Costs').Asstring := 'Y'
      else
        ParamByName('Can_Delete_Quote_Costs').Asstring := 'N';

      if chkbxCanDeactivateProds.checked then
        ParamByName('Can_Deactivate_Products').Asstring := 'Y'
      else
        ParamByName('Can_Deactivate_Products').Asstring := 'N';

      if chkbxCanOverride.checked then
        ParamByName('Override_Paid_Stock').Asstring := 'Y'
      else
        ParamByName('Override_Paid_Stock').Asstring := 'N';

      if chkbxCanDeleteJobBags.checked then
        ParamByName('Can_Delete_Job_Bags').Asstring := 'Y'
      else
        ParamByName('Can_Delete_Job_Bags').Asstring := 'N';

      if chkbxCanDeletePOs.checked then
        ParamByName('Can_Delete_Purchase_Orders').Asstring := 'Y'
      else
        ParamByName('Can_Delete_Purchase_Orders').Asstring := 'N';

      if chkbxCanConfirmProduction.checked then
        ParamByName('Can_Confirm_production').Asstring := 'Y'
      else
        ParamByName('Can_Confirm_production').Asstring := 'N';

      if chkbxCanChangeInvOrders.checked then
        ParamByName('Can_Change_Invoiced_Orders').Asstring := 'Y'
      else
        ParamByName('Can_Change_Invoiced_Orders').Asstring := 'N';

      ParamByName('Login_Name').AsString := LoginEdit.Text;
      if chkbxCanLogin.Checked then
        ParamByName('Operator_Can_Login').AsString := 'Y'
      else
        ParamByName('Operator_Can_Login').AsString := 'N';
      if RepComboBox.KeyValue <> 0 then
        ParamByName('Rep').AsString := RepComboBox.KeyValue
      else
        ParamByName('Rep').Clear ;

      if self.chkbxSecurityUser.Checked then
        ParamByName('security_user').asString := 'Y'
      else
        ParamByName('security_user').asString := 'N';

      if self.chkbxCannotViewPrices.Checked then
        ParamByName('Cannot_View_Enq_Prices').asString := 'Y'
      else
        ParamByName('Cannot_View_Enq_Prices').asString := 'N';

      if self.chkbxCanConvert.Checked then
        ParamByName('Can_Convert_Enquiry').asString := 'Y'
      else
        ParamByName('Can_Convert_Enquiry').asString := 'N';

      if self.chkbxCanPass.Checked then
        ParamByName('Can_Pass_purchase_invoices').asString := 'Y'
      else
        ParamByName('Can_Pass_purchase_invoices').asString := 'N';

      if self.chkbxActivityAdministrator.Checked then
        ParamByName('Activity_Administrator').asString := 'Y'
      else
        ParamByName('Activity_Administrator').asString := 'N';

      {Set CRM Reminder options}
      if self.chkbxEnquiryReminder.Checked then
        ParamByName('Set_Enquiry_Reminder').asString := 'Y'
      else
        ParamByName('Set_Enquiry_Reminder').asString := 'N';

      if self.chkbxQuoteReminder.Checked then
        ParamByName('Set_Quote_Reminder').asString := 'Y'
      else
        ParamByName('Set_Quote_Reminder').asString := 'N';

      if self.chkbxProofReminder.Checked then
        ParamByName('Set_Proof_Reminder').asString := 'Y'
      else
        ParamByName('Set_Proof_Reminder').asString := 'N';

      if self.chkbxReorderReminder.Checked then
        ParamByName('Set_Reorder_Reminder').asString := 'Y'
      else
        ParamByName('Set_Reorder_Reminder').asString := 'N';

      if self.chkbxOrderAckReminder.Checked then
        ParamByName('Set_Order_Ack_Reminder').asString := 'Y'
      else
        ParamByName('Set_Order_Ack_Reminder').asString := 'N';

      if self.chkbxDeliveryReminder.Checked then
        ParamByName('Set_Delivery_Reminder').asString := 'Y'
      else
        ParamByName('Set_Delivery_Reminder').asString := 'N';

      {End of CRM Reminders}


      if self.chkbxCannotChangeRep.Checked then
        ParamByName('Cannot_Change_Rep').asString := 'Y'
      else
        ParamByName('Cannot_Change_Rep').asString := 'N';

      if self.chkbxCanMaintainCreditDetails.Checked then
        ParamByName('Can_Update_Credit_Details').asString := 'Y'
      else
        ParamByName('Can_Update_Credit_Details').asString := 'N';

      if self.chkbxCanDeleteQuoteCosts.Checked then
        ParamByName('Can_Delete_Quote_Costs').asString := 'Y'
      else
        ParamByName('Can_Delete_Quote_Costs').asString := 'N';

      ExecSQL;
    end;
    UpdRevenueCodes;
    UpdChecks(iCode);
    iSelCode := iCode;
  end
  else
  if sFuncMode = 'D' then
  begin
    with DelOpChecksSQL do
    begin
      Close;
      ParamByName('Operator').AsInteger := iCode;
      ExecSQL;
    end;
    with DelOpSQL do
    begin
      Close;
      ParamByName('Operator').AsInteger := iCode;
      ExecSQL;
    end;
    iSelCode := iCode;
  end;
  Close;
end;

function TPBMaintOpsDetFrm.CheckIfExists(sTempLogin: string; iTempOpCode:
  Integer): ByteBool;
begin
  with CheckExistsSQL do
  begin
    Close;
    ParamByName('Login_Name').AsString := sTempLogin;
    ParamByName('Operator').AsInteger := iTempOpCode;
    Open;
    Result := (RecordCount > 0);
    if RecordCount > 0 then
      MessageDlg('This Login Name already exists', mtError, [mbOK], 0);
  end;
end;

function TPBMaintOpsDetFrm.CheckIfShortNameExists(sTempName: string; iTempOpCode:
  Integer): ByteBool;
begin
  Result := false;
  if trim(sTempName) = '' then exit;
  with CheckShortNameExistsSQL do
  begin
    Close;
    ParamByName('Short_Name').AsString := sTempName;
    ParamByName('Operator').AsInteger := iTempOpCode;
    Open;
    Result := (RecordCount > 0);
    if RecordCount > 0 then
      MessageDlg('This Short Name already exists', mtError, [mbOK], 0);
  end;
end;

procedure TPBMaintOpsDetFrm.UpdChecks(iTempCode: Integer);
var
  icount: Integer;
begin
  {Update the checks on the file};
  with DelOpChecksSQL do
  begin
    Close;
    ParamByName('Operator').AsInteger := iTempCode;
    ExecSQL;
  end;
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TComboBox then
    begin
      if (TComboBox(Components[icount]).Left = iProcLeft)  then
      begin
        with AddCheckSQL do
        begin
          Close;
          ParamByName('Operator').AsInteger := iTempCode;
          ParamByName('Button_Name').AsString :=
            TComboBox(PBMaintOpsDetFrm.Components[icount]).Name;
          ParamByName('Button_Status').AsString :=
            Copy(TComboBox(PBMaintOpsDetFrm.Components[icount]).Text,1,1);
          {Warn them if they're going to lock themselves out of this program} ;
          If (iTempCode = frmpbMainMenu.iOperator) and
                (TComboBox(PBMaintOpsDetFrm.Components[icount]).Name = 'UsersBitBtn') and
                (Copy(TComboBox(PBMaintOpsDetFrm.Components[icount]).Text,1,1) <> 'F') then
                        begin
                        If MessageDlg('The changes you just made will lock the current user from changing ' +
                                   'operator access details. Sure you want to do this?',
                                   mtConfirmation, [mbNo,mbYes], 0) <> mrYes then
                                        ParamByName('Button_Status').AsString := 'F' ;
                        end;
          ExecSQL;
        end;
      end;
    end;
  end; 
end;

function TPBMaintOpsDetFrm.GetLastOp: integer;
var
  aGuid : TGuid;
begin
  { Get the next available slot in the Operator table using the unconditional
    GUID insert technique. }
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddOpSQL do
    begin
      ParamByname('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastOpSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Operator').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintOpsDetFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO Operator (Operator, Name, Operator_Can_Login)' +
            'VALUES(0, ''Dummy'', ''N'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintOpsDetFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Operator WHERE Operator=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintOpsDetFrm.AllComboBoxChange(Sender: TObject);
var
  icount, iCount1, iLeft: Integer;
begin
  if (not bDoCheckEvent) then
    Exit;
  {All check box clicks go through here};
  if (Sender as TComboBox).Left = iProcLeft then
  begin
    SetGroupChecks(Self);
    Exit;
  end;
  if Copy((Sender as TComboBox).Text,1,1) = 'V' then Exit;
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TComboBox then
    begin
      if TComboBox(Components[icount]).Name = (Sender as TComboBox).Name then
      begin
        iLeft := TComboBox(Components[icount]).Left;
        for iCount1 := icount + 1 to ComponentCount - 1 do
        begin
          if Components[iCount1] is TComboBox then
          begin
            if TComboBox(Components[iCount1]).Left <= iLeft then
              Break;
            bDoCheckEvent := False;
            SetCombo(TComboBox(Components[iCount1]), Copy(TComboBox(Components[icount]).Text,1,1));
            bDoCheckEvent := True;
          end;
        end;
      end;
    end;
  end;
end;

procedure TPBMaintOpsDetFrm.CreateLabel(TempComboBox: TComboBox; TempCaption: String);
var
TempLabel: TLabel ;
begin
{Create a label with a supplied caption to match the combo box} ;
TempLabel := TLabel.Create(Self);
TempLabel.Parent := SelectScrollBox;
TempLabel.Caption := TempCaption ;
TempLabel.Left := TempComboBox.Left + TempComboBox.Width + 8 ;
TempLabel.Top := TempComboBox.Top + 2;
TempLabel.Visible := True;
end;

procedure TPBMaintOpsDetFrm.SetCombo(TempComboBox: TComboBox; TempSetting: String);
Var
iCount: Integer;
begin
TempComboBox.Text := '' ;
For iCount := 0 to TempComboBox.Items.Count-1 do
        If Copy(TempComboBox.Items[iCount],1,1) = TempSetting then
                TempComboBox.ItemIndex := iCount ;
end;

procedure TPBMaintOpsDetFrm.DeleteComponets(Sender: TObject);
Var
iCount: Integer;
begin
For iCount := ComponentCount-1 downto 0 do
        If (Components[iCount] is TLabel) or (Components[iCount] is TComboBox) then
                If ((Components[iCount] as TControl).Parent = SelectScrollBox) and
                   ((Components[iCount] as TControl).Name <> 'AllComboBox') then
                        Components[iCount].Free ;
end;

procedure TPBMaintOpsDetFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{Remove all the manually created components} ;
DeleteComponets(Self);
end;

procedure TPBMaintOpsDetFrm.ChgPassBitBtnClick(Sender: TObject);
begin
{Can't change the password if it's not SQL Server} ;
If not dmBroker.IsSQL then
        begin
        MessageDlg('Broker can''t change passwords on this type of database',
                        mtError,[mbOK],0) ;
        exit ;
        end;
{Can't change the password if user does not have permission} ;
If not bCanUpdPassword then
        begin
        MessageDlg('You do not have the necessary database permissions to change passwords',
                        mtError,[mbOK],0) ;
        exit ;
        end;
{Call the password change screen} ;
PBMaintOpsDetPassFrm := TPBMaintOpsDetPassFrm.Create(self) ;
PBMaintOpsDetPassFrm.Caption := 'Change Password For: ' + LoginEdit.Text ;
PBMaintOpsDetPassFrm.OldPassEdit.Text := sOldPass;
PBMaintOpsDetPassFrm.NewPassEdit.Text := sNewPass ;
PBMaintOpsDetPassFrm.ConfPassEdit.Text := sConfPass  ;
PBMaintOpsDetPassFrm.ShowModal ;
If PBMaintOpsDetPassFrm.bOK then
        begin
        bPassChanged := True ;
        sOldPass := PBMaintOpsDetPassFrm.OldPassEdit.Text ;
        sNewPass := PBMaintOpsDetPassFrm.NewPassEdit.Text ;
        sConfPass := PBMaintOpsDetPassFrm.ConfPassEdit.Text ;
        end;
PBMaintOpsDetPassFrm.Free ;
end;

procedure TPBMaintOpsDetFrm.RepNASpeedButtonClick(Sender: TObject);
Var
iCount1: Integer;
begin
for iCount1 := 0 to ComponentCount - 1 do
        begin
        if Components[iCount1] is TComboBox then
                begin
                if Copy(TComboBox(Components[iCount1]).Text,1,1) = 'R' then
                        begin
                        MessageDlg('You can''t clear the Associated Rep if any of the access settings are "Rep"',
                                mtError,[mbOK],0) ;
                        exit ;
                        end;
                end;
        end;
RepComboBox.KeyValue := 0;
{Check if can select rep} ;
AllowRepSelect(Self) ;
end;

procedure TPBMaintOpsDetFrm.AllowRepSelect(Sender: TObject);
Var
iCount1: Integer;
bTempAllowRep: ByteBool;
begin
bTempAllowRep := (RepComboBox.KeyValue <> 0) ;
for iCount1 := 0 to ComponentCount - 1 do
        begin
        if Components[iCount1] is TComboBox then
                begin
                if (Copy(TComboBox(Components[iCount1]).Items[4],1,1) = 'R') and
                        (not bTempAllowRep)  then
                                begin
                                TComboBox(Components[iCount1]).Items.Delete(4) ;
                                end;
                if (Copy(TComboBox(Components[iCount1]).Items[4],1,1) <> 'R') and
                        (bTempAllowRep)  then
                                begin
                                TComboBox(Components[iCount1]).Items.Insert(4,'Rep') ;
                                end;
                end;
        end;
end;

procedure TPBMaintOpsDetFrm.RepComboBoxClick(Sender: TObject);
begin
  {Check if can select rep} ;
  AllowRepSelect(Self) ;
end;

procedure TPBMaintOpsDetFrm.memCreditLimitExit(Sender: TObject);
begin
  if (Sender as TMemo).Text <> '' then
  begin
    try
      (Sender as TMemo).Text := FormatFloat('######0.00', StrToFloatDef((Sender as TMemo).Text, 0, FormatSettings))
    except
      MessageDlg('Invalid value', mtError, [mbOK], 0);
      (Sender as TMemo).SetFocus;
    end;
  end;
end;

procedure TPBMaintOpsDetFrm.rdgrpMinPOClick(Sender: TObject);
begin
  if (sender as TRadioGroup).itemindex = 0 then
    lblValue.Caption := 'Value'
  else
    lblValue.Caption := '% Value';
end;

procedure TPBMaintOpsDetFrm.btnRevenueCentreClick(Sender: TObject);
var
  icount: integer;
begin
  PBLURevenueLocFrm := TPBLURevenuelocFrm.Create(self);
  try
    PBLURevenueLocFrm.bIs_Lookup := true ;
    PBLURevenueLocFrm.bAllow_Upd := True ;
    PBLURevenueLocFrm.ShowModal ;
    if PBLURevenueLocFrm.selected then
      begin
        for icount := 0 to pred(lstbxRevenueCode.items.count) do
          begin
            if lstbxRevenueCode.items[icount] = PBLURevenueLocFrm.selCode then
              exit;
          end;
        lstbxRevenue.items.add(PBLURevenueLocFrm.selName);
        lstbxRevenueCode.items.add(PBLURevenueLocFrm.selCode);
        lstbxRevenue.ItemIndex := pred(lstbxRevenue.items.count);
        lstbxRevenueCode.ItemIndex := lstbxRevenue.ItemIndex;
      end;
  Finally;
    PBLURevenueLocFrm.Free ;
  end;
end;

procedure TPBMaintOpsDetFrm.BitBtn1Click(Sender: TObject);
begin
  if lstbxRevenue.ItemIndex >= 0 then
    begin
      if MessageDlg('Delete the selected Revenue Centre?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          lstbxRevenueCode.Items.delete(lstbxRevenue.itemindex);
          lstbxRevenue.Items.delete(lstbxRevenue.itemindex);
        end;
    end;
end;

procedure TPBMaintOpsDetFrm.UpdRevenueCodes;
var
  iCount: integer;
begin
  {Delete existing codes for this operator}
  with qryDelRevCodes do
    begin
      close;
      parambyname('Operator').asinteger := iCode;
      execsql;
    end;

  {Add new codes}
  for icount := 0 to pred(lstbxRevenue.items.count) do
    begin
      with qryAddRevCodes do
        begin
          close;
          parambyname('Operator').asinteger := iCode;
          parambyname('Invoice_location').asinteger := strtoint(lstbxRevenueCode.items[icount]);
          execsql;
        end;
    end;
end;

end.
