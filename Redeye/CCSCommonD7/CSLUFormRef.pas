(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Form Reference.

VSS Info:
$Header: /CCSCommon/CSLUFormRef.pas 1     10/01/:1 12:59 Paul $
$History: CSLUFormRef.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:59
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 20/10/:0   Time: 15:34
 * Updated in $/PBL D5
 * Changed to display the Form Reference Description in a panel at the
 * foot of the lookup.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:49
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:13
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 23/02/:0   Time: 12:27
 * Updated in $/PBL D5
 * Changed to display the correct heading for the Lookup to Maintain
 * Customer Form Reference
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 9/02/:0    Time: 15:53
 * Updated in $/PBL D5
 * Changed to give back the Form Reference description as well
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUFormRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, DBCtrls;

type
  TCSLUFormRefFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    RefDBGrid: TDBGrid;
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
    LabelName: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure RefDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure RefDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iCust, iBranch, iCode: Integer;
    SelName, SelDescr, sCustName, sBranchName, stockRef: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
    showFreeFormRefs: boolean;
  end;

var
  CSLUFormRefFrm: TCSLUFormRefFrm;

implementation

uses CSMaintCConta, CSMaintFormRef;

{$R *.DFM}

procedure TCSLUFormRefFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Form Reference';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Contacts';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
{  FuncGrpBox.Visible := (bAllow_Upd) and
    (PBMenuMainFrm.TestButton('PBMaintCustBitBtn'));
}  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
end;

procedure TCSLUFormRefFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;

    if self.showFreeFormRefs then
      ParamByName('stockRef').asString := stockRef
    else
      ParamByName('stockRef').asString := '';

    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUFormRefFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUFormRefFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUFormRefFrm.RefDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUFormRefFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TCSLUFormRefFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString;
  SelDescr := DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString;
  bSelected := True;
  Close;
end;

procedure TCSLUFormRefFrm.RefDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    ChgBitBtnClick(Self);
end;

procedure TCSLUFormRefFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TCSLUFormRefFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TCSLUFormRefFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TCSLUFormRefFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintFormRefFrm := TCSMaintFormRefFrm.Create(Self);
  try
    CSMaintFormRefFrm.sFuncMode := sTempFuncMode;
    CSMaintFormRefFrm.iCust := iCust;
    CSMaintFormRefFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      CSMaintFormRefFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger
    else
      CSMaintFormRefFrm.iCode := 0;
    CSMaintFormRefFrm.sCustName := sCustName;
    CSMaintFormRefFrm.sBranchName := sBranchName;

    CSMaintFormRefFrm.ShowModal;
    bTempOK := (CSMaintFormRefFrm.ModalResult = mrOK);
    iTempSel := CSMaintFormRefFrm.iCode;
  finally
    CSMaintFormRefFrm.Free;
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

procedure TCSLUFormRefFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Form_Reference').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TCSLUFormRefFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

end.
