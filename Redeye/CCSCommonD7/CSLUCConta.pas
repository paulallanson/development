(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Customer/Branch Contacts.

VSS Info:
$Header: /CCSCommon/CSLUCConta.pas 1     10/01/:1 12:58 Paul $
$History: CSLUCConta.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:58
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:44
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:05
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:36
 * Updated in $/PBL D5
 * New insert method using Guids to ensure unique new key values.
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 21/01/:0   Time: 10:42
 * Updated in $/PBL D5
 * Display 'name' etc in panel
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUCConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, CSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUCContaFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    BranchLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DispPanel: TPanel;
    DBContactText: TDBText;
    DBCPhoneText: TDBText;
    DBCMobileText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    ActiveOnlyCheckBox: TCheckBox;
    qryCheckPOs: TFDQuery;
    qryCheckEnqs: TFDQuery;
    qryCheckEvents: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
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
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
    function CheckContactEvents(iTempCust, iTempBranch,
      iTempCont: integer): boolean;
    function CheckContactLive(iTempCust, iTempBranch,
      iTempCont: integer): boolean;
  public
    { Public declarations }
    SelCode, iCust, iBranch: Integer;
    SelName, sCustName, sBranchName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  CSLUCContaFrm: TCSLUCContaFrm;

implementation

uses CSMaintCConta;

{$R *.DFM}

procedure TCSLUCContaFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer/Branch Contact';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Contacts';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) and
    TestButton('PBMaintCustBitBtn');
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
end;

procedure TCSLUCContaFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    if ActiveOnlyCheckBox.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUCContaFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUCContaFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUCContaFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUCContaFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TCSLUCContaFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Contact_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TCSLUCContaFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TCSLUCContaFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer}
  CallMaintScreen('A');
end;

procedure TCSLUCContaFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer}
  CallMaintScreen('C');
end;

procedure TCSLUCContaFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Customer}
  if CheckContactLive(iCust, iBranch, DetsSRC.DataSet.FieldByName('Contact_No').AsInteger) then
  begin
     MessageDlg('This contact is associated with an Enquiry/Purchase Order, and cannot be deleted',
      mtWarning, [mbOK], 0);
    Exit;
  end;
  if CheckContactEvents(iCust, iBranch, DetsSRC.DataSet.FieldByName('Contact_No').AsInteger) then
  begin
     MessageDlg('This contact has associated event/note details, and cannot be deleted',
      mtWarning, [mbOK], 0);
    Exit;
  end;
  CallMaintScreen('D');
end;

procedure TCSLUCContaFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintCContaFrm := TCSMaintCContaFrm.Create(Self);
  try
    CSMaintCContaFrm.sFuncMode := sTempFuncMode;
    CSMaintCContaFrm.iCust := iCust;
    CSMaintCContaFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      CSMaintCContaFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Contact_No').AsInteger
    else
      CSMaintCContaFrm.iCode := 0;
    CSMaintCContaFrm.sCustName := sCustName;
    CSMaintCContaFrm.sBranchName := sBranchName;
    CSMaintCContaFrm.ShowModal;
    bTempOK := (CSMaintCContaFrm.ModalResult = mrOK);
    iTempSel := CSMaintCContaFrm.iCode;
  finally
    CSMaintCContaFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
    NameEdit.SetFocus;
  end;
end;

procedure TCSLUCContaFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with GetDetsSQL do
  begin
    First;
    if iTempSel <= 0 then Exit;
    while (not (EOF)) and (FieldByName('Contact_No').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TCSLUCContaFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

function TCSLUCContaFrm.CheckContactLive(iTempCust, iTempBranch,
  iTempCont: integer): boolean;
begin
  result := false;
  with qryCheckPOs do
  begin
    close;
    parambyname('Customer').asInteger := iTempCust;
    paramByName('Branch').asInteger := iTempBranch;
    paramByname('Contact').asInteger := iTempCont;
    open;
    if recordcount > 0 then
      begin
        result := true;
        exit;
      end;
  end;

  with qryCheckEnqs do
  begin
    close;
    parambyname('Customer').asInteger := iTempCust;
    paramByName('Branch').asInteger := iTempBranch;
    paramByname('Contact').asInteger := iTempCont;
    open;
    if recordcount > 0 then
      begin
        result := true;
        exit;
      end;
  end;
end;

function TCSLUCContaFrm.CheckContactEvents(iTempCust, iTempBranch,
  iTempCont: integer): boolean;
begin
  result := false;
  with qryCheckEvents do
  begin
    close;
    parambyname('Customer').asInteger := iTempCust;
    paramByName('Branch').asInteger := iTempBranch;
    paramByname('Contact').asInteger := iTempCont;
    open;
    if recordcount > 0 then
      result := true;
  end;
end;

end.
