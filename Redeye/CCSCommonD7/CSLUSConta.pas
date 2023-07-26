(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Supplier/Branch Contacts.

VSS Info:
$Header: /CCSCommon/CSLUSConta.pas 1     10/01/:1 12:59 Paul $
$History: CSLUSConta.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:59
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:25
 * Updated in $/PBL D5
 * Changed to display the Name, Phone and Fax numbers in a panel at the
 * foot of the form.
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:29
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:53
 * Updated in $/PBL D5
 * Use new insert method and Guids to ensure new keys are unique.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUSConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUSContaFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    SuppLabel: TLabel;
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
    function CheckContactLive(iTempSupp, iTempBranch,
      iTempCont: integer): boolean;
  public
    { Public declarations }
    SelCode, iSupp, iBranch: Integer;
    SelName, sSuppName, sBranchName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  CSLUSContaFrm: TCSLUSContaFrm;

implementation

uses CSMaintSConta;

{$R *.DFM}

procedure TCSLUSContaFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Supplier/Branch Contact';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Supplier/Branch Contacts';
    SelectBitBtn.Visible := False;
  end;
  SuppLabel.Caption := sSuppName;
  BranchLabel.Caption := sBranchName;
{  FuncGrpBox.Visible := (bAllow_Upd) and
    (PBMenuMainFrm.TestButton('PBMaintSuppBitBtn'));
}  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
end;

procedure TCSLUSContaFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    if ActiveOnlyCheckBox.Checked then
      ParamByName('Inactive').AsString := 'N'
    else
      ParamByName('Inactive').AsString := 'Y';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUSContaFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUSContaFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUSContaFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUSContaFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TCSLUSContaFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Contact_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TCSLUSContaFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TCSLUSContaFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Supplier}
  CallMaintScreen('A');
end;

procedure TCSLUSContaFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier}
  CallMaintScreen('C');
end;

procedure TCSLUSContaFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier}
  if CheckContactLive(iSupp, iBranch, DetsSRC.DataSet.FieldByName('Contact_No').AsInteger) then
  begin
     MessageDlg('This contact is associated with an Enquiry/Purchase Order, and cannot be deleted',
      mtWarning, [mbOK], 0);
    Exit;
  end;
  CallMaintScreen('D');
end;

procedure TCSLUSContaFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintSContaFrm := TCSMaintSContaFrm.Create(Self);
  try
    CSMaintSContaFrm.sFuncMode := sTempFuncMode;
    CSMaintSContaFrm.iSupp := iSupp;
    CSMaintSContaFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      CSMaintSContaFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Contact_No').AsInteger
    else
      CSMaintSContaFrm.iCode := 0;
    CSMaintSContaFrm.sSuppName := sSuppName;
    CSMaintSContaFrm.sBranchName := sBranchName;
    CSMaintSContaFrm.ShowModal;
    bTempOK := (CSMaintSContaFrm.ModalResult = mrOK);
    iTempSel := CSMaintSContaFrm.iCode;
  finally
    CSMaintSContaFrm.Free;
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

procedure TCSLUSContaFrm.FindInGrid(iTempSel: Integer);
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

procedure TCSLUSContaFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

function TCSLUSContaFrm.CheckContactLive(iTempSupp, iTempBranch,
  iTempCont: integer): boolean;
begin
  result := false;
  with qryCheckPOs do
  begin
    close;
    parambyname('Supplier').asInteger := iTempSupp;
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
    parambyname('Supplier').asInteger := iTempSupp;
    paramByName('Branch').asInteger := iTempBranch;
    paramByname('Contact').asInteger := iTempCont;
    open;
    if recordcount > 0 then
      result := true;
  end;
end;

end.
