(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up A Rep.

VSS Info:
$Header: /CCSCommon/CSLURep.pas 1     23/05/:2 8:02 Pahome $
$History: CSLURep.pas $
 * 
 * *****************  Version 1  *****************
 * User: Pahome       Date: 23/05/:2   Time: 8:02
 * Created in $/CCSCommon
 * Initial take on of common Rep LU and Maintenance units
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:24
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 9/03/:0    Time: 12:11
 * Updated in $/PBL D5
 * Changed to move the Nominal Code selection from the lookup to the
 * actual Rep maintenance screen.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:03
 * Updated in $/PBL D5
 * New insert method using GUIDs to guarantee unique new keys.
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 9/12/99    Time: 9:34
 * Updated in $/PBL D5
 * Corrected Error on NominalBtn  
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLURep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, CSCommon;

type
  TCSLURepFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    ThisChkBox: TCheckBox;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
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
    procedure ThisChkBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  CSLURepFrm: TCSLURepFrm;

implementation

uses CSMaintRep, CSDBMemo;

{$R *.DFM}

procedure TCSLURepFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Rep';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Reps';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) and
    (TestButton('PBMaintRepsBitBtn'));
  ThisChkBox.Visible := (iThisCode <> 0);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  ThisChkBox.Checked := ((iThisCode <> 0) and (iThisCode = SelCode));
end;

procedure TCSLURepFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;

    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLURepFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLURepFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLURepFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TCSLURepFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
  Close;
end;

procedure TCSLURepFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  Selected := True;
  Close;
end;

procedure TCSLURepFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
      ShowNotes(Self);
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TCSLURepFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Rep}
  CallMaintScreen('A');
end;

procedure TCSLURepFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Rep}
  CallMaintScreen('C');
end;

procedure TCSLURepFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Rep}
  CallMaintScreen('D');
end;

procedure TCSLURepFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintRepFrm := TCSMaintRepFrm.Create(Self);
  try
    CSMaintRepFrm.sFuncMode := sTempFuncMode;
    CSMaintRepFrm.ShowModal;
    bTempOK := (CSMaintRepFrm.ModalResult = mrOK);
    iTempSel := CSMaintRepFrm.iCode;
  finally
    CSMaintRepFrm.Free;
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

procedure TCSLURepFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Rep').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TCSLURepFrm.ThisChkBoxClick(Sender: TObject);
begin
  {If checked, disable the grid etc}
  DetsDBGrid.Enabled := (not (ThisChkBox.Checked));
  SearchGrpBox.Enabled := (not (ThisChkBox.Checked));
  if ThisChkBox.Checked then
  begin
    bDisableNameChangeEvent := True;
    NameEdit.Text := '';
    bDisableNameChangeEvent := False;
    ShowGrid(Self);
    FindInGrid(iThisCode);
  end
  else
    FindInGrid(0)
end;

procedure TCSLURepFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TCSLURepFrm.ShowNotes(Sender: TObject);
begin
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  try
    CSDBMemoFrm.bAllow_Upd := False;
    CSDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    CSDBMemoFrm.ShowModal;
  finally
    CSDBMemoFrm.Free;
  end;
end;

end.
