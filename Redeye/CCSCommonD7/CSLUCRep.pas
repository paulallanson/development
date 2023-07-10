(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Reps For a Customer/Branch.

VSS Info:
$Header: /CCSCommon/CSLUCRep.pas 1     10/01/:1 12:58 Paul $
$History: CSLUCRep.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:58
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:45
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 2  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:05
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUCRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons,CSCommon;

type
  TCSLUCRepFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
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
  public
    { Public declarations }
    SelCode, iCust, iBranch: Integer;
    SelName, sCustName, sBranchName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  CSLUCRepFrm: TCSLUCRepFrm;

implementation

uses CSMaintCRep;

{$R *.DFM}

procedure TCSLUCRepFrm.FormActivate(Sender: TObject);
begin
  {Hide the rep's %age if this is a look-up};
  if bIs_LookUp then
    DetsDBGrid.Columns[0].Width := 284
  else
    DetsDBGrid.Columns[0].Width := 200;
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup Reps Assigned To Customer/Branches';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Reps Assigned To Customer/Branches';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) and
    TestButton('PBMaintRepsBitBtn');
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
end;

procedure TCSLUCRepFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
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

procedure TCSLUCRepFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUCRepFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUCRepFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUCRepFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TCSLUCRepFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TCSLUCRepFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TCSLUCRepFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TCSLUCRepFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TCSLUCRepFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TCSLUCRepFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintCRepFrm := TCSMaintCRepFrm.Create(Self);
  try
    CSMaintCRepFrm.sFuncMode := sTempFuncMode;
    CSMaintCRepFrm.iCust := iCust;
    CSMaintCRepFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      CSMaintCRepFrm.iCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger
    else
      CSMaintCRepFrm.iCode := 0;
    CSMaintCRepFrm.sCustName := sCustName;
    CSMaintCRepFrm.sBranchName := sBranchName;
    CSMaintCRepFrm.ShowModal;
    bTempOK := (CSMaintCRepFrm.ModalResult = mrOK);
    iTempSel := CSMaintCRepFrm.iCode;
  finally
    CSMaintCRepFrm.Free;
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

procedure TCSLUCRepFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Rep').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TCSLUCRepFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

end.
