(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up An Operator.

VSS Info:
$Header: /PBL D5/PBLUOps.pas 8     20/06/03 9:52 Andrewh $
$History: PBLUOps.pas $
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 17/06/03   Time: 11:12
 * Updated in $/PBL D5
 * Allow Associated Rep to be added to each operator (if required).
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUOps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUOpsFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    qryCheckOpBtns: TFDQuery;
    grpbxReport: TGroupBox;
    btbtnPreview: TBitBtn;
    btbtnPrint: TBitBtn;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    chkbxActiveOnly: TCheckBox;
    SearchTimer: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btbtnPreviewClick(Sender: TObject);
    procedure btbtnPrintClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    bDisableNameChangeEvent: ByteBool;
    function CheckOperator: integer;
    { Private declarations }
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUOpsFrm: TPBLUOpsFrm;

implementation

uses UITypes, 
  System.Types,
  PBMaintPrdTyp, PBMaintOpsDet, PBDBMemo, pbMainMenu, PBDatabase, PBRPOperator;

{$R *.DFM}

procedure TPBLUOpsFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup an Operator';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Operators';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  {Load up the string grid};
  ShowGrid(Self);
  nameedit.setfocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  if CheckOperator > 0 then
    dmBroker.ScreenAccessControl(Self,'mnuOperators',frmpbMainMenu.iOperator,0,0);
end;

procedure TPBLUOpsFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if chkbxActiveOnly.Checked then
      ParamByName('operator_can_login').AsString := 'Y'
    else
      ParamByName('operator_can_login').AsString := 'N';
    Open;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

function TPBLUOpsFrm.CheckOperator: integer;
begin
  result := 0;
  with qryCheckOpBtns do
  begin
    close;
    open;
    result := recordcount;
  end;
end;

procedure TPBLUOpsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUOpsFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUOpsFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUOpsFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Operator').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUOpsFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUOpsFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TPBLUOpsFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TPBLUOpsFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TPBLUOpsFrm.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
begin
  PBMaintOpsDetFrm := TPBMaintOpsDetFrm.Create(Self);
  try
    PBMaintOpsDetFrm.CheckAccessControl := (CheckOperator > 0);

    PBMaintOpsDetFrm.sFuncMode := sTempFuncMode;
    PBMaintOpsDetFrm.iCode := DetsSRC.DataSet.FieldByName('Operator').AsInteger;
    PBMaintOpsDetFrm.NameEdit.Text := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBMaintOpsDetFrm.ShortNameEdit.Text := DetsSRC.DataSet.FieldByName('Short_Name').AsString;
    PBMaintOpsDetFrm.PhoneEdit.Text := DetsSRC.DataSet.FieldByName('Phone').AsString;
    PBMaintOpsDetFrm.MobileEdit.Text := DetsSRC.DataSet.FieldByName('Mobile_no').AsString;
    PBMaintOpsDetFrm.EmailEdit.Text := DetsSRC.DataSet.FieldByName('Email').AsString;
    PBMaintOpsDetFrm.JobTitleEdit.Text := DetsSRC.DataSet.FieldByName('Job_Title').AsString;
    PBMaintOpsDetFrm.WebEmailEdit.Text := DetsSRC.DataSet.FieldByName('Web_Ordering_Email').AsString;
    PBMaintOpsDetFrm.memCreditLimit.Text := formatfloat('#####0.00',DetsSRC.DataSet.FieldByName('Max_Unauthorised_PO_Value').Asfloat);
    PBMaintOpsDetFrm.memAuthLimit.Text := formatfloat('#####0.00',DetsSRC.DataSet.FieldByName('Authorised_PO_Cost_Limit').Asfloat);
    PBMaintOpsDetFrm.memMinValue.Text := formatfloat('#####0.00',DetsSRC.DataSet.FieldByName('Min_PO_Sales_Value').Asfloat);

    if (DetsSRC.DataSet.FieldByName('Can_Authorise_PO').AsString = 'F') then
      PBMaintOpsDetFrm.rdgrpAuthorise.itemindex := 2
    else
    if (DetsSRC.DataSet.FieldByName('Can_Authorise_PO').AsString = 'P') then
      PBMaintOpsDetFrm.rdgrpAuthorise.itemindex := 1
    else
      PBMaintOpsDetFrm.rdgrpAuthorise.itemindex := 0;

    if (DetsSRC.DataSet.FieldByName('Min_PO_Sales_Value_Type').AsString = 'C') then
      PBMaintOpsDetFrm.rdgrpMinPO.itemindex := 1
    else
      PBMaintOpsDetFrm.rdgrpMinPO.itemindex := 0;

    if (DetsSRC.DataSet.FieldByName('Delete_PO_From_Job_Bag').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanDeleteFromJB.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanDeleteFromJB.Checked := False;

    if (DetsSRC.DataSet.FieldByName('Can_Delete_Quote_Costs').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanDeleteQuoteCosts.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanDeleteQuoteCosts.Checked := False;

    if (DetsSRC.DataSet.FieldByName('Maintain_PO_in_Job_Bag').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanMaintainPO.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanMaintainPO.Checked := False;

    if (DetsSRC.DataSet.FieldByName('Can_Change_Invoiced_Orders').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanChangeInvOrders.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanMaintainPO.Checked := False;

    if (DetsSRC.DataSet.FieldByName('Cannot_View_Enq_Prices').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCannotViewPrices.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCannotViewPrices.Checked := False;

    if (DetsSRC.DataSet.FieldByName('Can_Convert_Enquiry').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanConvert.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanConvert.Checked := False;

    PBMaintOpsDetFrm.LoginEdit.Text :=
      DetsSRC.DataSet.FieldByName('Login_Name').AsString;

    if (DetsSRC.DataSet.FieldByName('Operator_Can_Login').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanLogin.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanLogin.Checked := false;

    If (DetsSRC.DataSet.FieldByName('Rep').AsString <> '') then
      PBMaintOpsDetFrm.RepComboBox.KeyValue := DetsSRC.DataSet.FieldByName('Rep').AsString
    else
      PBMaintOpsDetFrm.RepComboBox.KeyValue := 0 ;

    if (DetsSRC.DataSet.FieldByName('Cannot_Change_Rep').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCannotChangeRep.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCannotChangeRep.Checked := False;

    if (DetsSRC.DataSet.FieldByName('Can_Update_Credit_Details').AsString = 'Y') then
      PBMaintOpsDetFrm.chkbxCanMaintainCreditDetails.Checked := True
    else
      PBMaintOpsDetFrm.chkbxCanMaintainCreditDetails.Checked := False;

    PBMaintOpsDetFrm.chkbxSecurityUser.Checked := (DetsSRC.DataSet.FieldByName('security_user').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxCanPass.Checked := (DetsSRC.DataSet.FieldByName('Can_Pass_Purchase_Invoices').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxCanDeactivateProds.Checked := (DetsSRC.DataSet.FieldByName('Can_Deactivate_Products').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxCanOverride.Checked := (DetsSRC.DataSet.FieldByName('Override_Paid_Stock').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxCanDeletePOs.Checked := (DetsSRC.DataSet.FieldByName('Can_Delete_Purchase_Orders').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxCanDeleteJobBags.Checked := (DetsSRC.DataSet.FieldByName('Can_Delete_Job_Bags').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxCanConfirmProduction.Checked := (DetsSRC.DataSet.FieldByName('Can_Confirm_Production').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxActivityAdministrator.Checked := (DetsSRC.DataSet.FieldByName('Activity_Administrator').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxEnquiryReminder.Checked := (DetsSRC.DataSet.FieldByName('Set_Enquiry_Reminder').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxQuoteReminder.Checked := (DetsSRC.DataSet.FieldByName('Set_Quote_Reminder').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxProofReminder.Checked := (DetsSRC.DataSet.FieldByName('Set_Proof_Reminder').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxReorderReminder.Checked := (DetsSRC.DataSet.FieldByName('Set_Reorder_Reminder').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxOrderAckReminder.Checked := (DetsSRC.DataSet.FieldByName('Set_Order_Ack_Reminder').AsString = 'Y');
    PBMaintOpsDetFrm.chkbxDeliveryReminder.Checked := (DetsSRC.DataSet.FieldByName('Set_Delivery_Reminder').AsString = 'Y');
    PBMaintOpsDetFrm.sFuncMode := sTempFuncMode;
    PBMaintOpsDetFrm.ShowModal;
    iTempSel := PBMaintOpsDetFrm.iSelCode;
  finally
    PBMaintOpsDetFrm.Free;
  end;
  if iTempSel <> 0 then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUOpsFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Operator').AsInteger <> iTempSel) do
      Next;

    if EOF then
      First;
  end;

end;

procedure TPBLUOpsFrm.FormCreate(Sender: TObject);
begin
  bDisableNameChangeEvent := False;
  SelCode := 0;
end;

procedure TPBLUOpsFrm.btbtnPreviewClick(Sender: TObject);
var
  PBRPOperatorFrm: TPBRPOperatorFrm;
begin
  PBRPOperatorFrm := TPBRPOperatorFrm.create(self);
  try
    SelectCode(Self);
    PBRPOperatorFrm.Report(SelCode, true);
  finally
    PBRPOperatorFrm.Free;
  end;
  self.ModalResult := mrNone;
end;

procedure TPBLUOpsFrm.btbtnPrintClick(Sender: TObject);
var
  PBRPOperatorFrm: TPBRPOperatorFrm;
begin
  PBRPOperatorFrm := TPBRPOperatorFrm.create(self);
  try
    SelectCode(Self);
    PBRPOperatorFrm.Report(SelCode, false);
  finally
    PBRPOperatorFrm.Free;
  end;
  self.ModalResult := mrNone;
end;

procedure TPBLUOpsFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUOpsFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  ShowGrid(self);
end;

procedure TPBLUOpsFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(detsdbgrid.datasource.dataset.fieldByName('operator_can_login').AsString = 'N') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end.
