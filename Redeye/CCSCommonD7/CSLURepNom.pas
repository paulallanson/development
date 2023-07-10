(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
A description of the unit here

VSS Info:
$Header: /CCSCommon/CSLURepNom.pas 1     23/05/:2 8:02 Pahome $
$History: CSLURepNom.pas $
 * 
 * *****************  Version 1  *****************
 * User: Pahome       Date: 23/05/:2   Time: 8:02
 * Created in $/CCSCommon
 * Initial take on of common Rep LU and Maintenance units
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLURepNom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, CSCommon;

type
  TCSLURepNomFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SelectBitBtn: TBitBtn;
    RepLabel: TLabel;
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
  CSLURepNomFrm: TCSLURepNomFrm;

implementation

uses CSLURep, CSDBMemo, CSMaintRepNom;

{$R *.DFM}

procedure TCSLURepNomFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Nominal';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Nominal';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) and
    (TestButton('PBMaintRepsBitBtn'));
  RepLabel.Caption := SelName;
  {Load up the string grid};
  ShowGrid(Self);
end;

procedure TCSLURepNomFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsInteger := selcode;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLURepNomFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLURepNomFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLURepNomFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TCSLURepNomFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Rep').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
  Close;
end;

procedure TCSLURepNomFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  Selected := True;
  Close;
end;

procedure TCSLURepNomFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    if DetsSRC.DataSet.FieldByName('Rep').AsInteger <> 0 then
      ShowNotes(Self);
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TCSLURepNomFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Nominal};
  CallMaintScreen('A');
end;

procedure TCSLURepNomFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Nominal};
  CallMaintScreen('C');
end;

procedure TCSLURepNomFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Nominal};
  CallMaintScreen('D');
end;

procedure TCSLURepNomFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintRepNomFrm := TCSMaintRepNomFrm.Create(Self);
  try
    CSMaintRepNomFrm.sFuncMode := sTempFuncMode;
    CSMaintRepNomFrm.Selname := RepLabel.Caption;
    CSMaintRepNomFrm.ShowModal;
    bTempOK := (CSMaintRepNomFrm.ModalResult = mrOK);
    iTempSel := CSMaintRepNomFrm.iCode;
  finally
    CSMaintRepNomFrm.Free;
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
  end;
end;

procedure TCSLURepNomFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Rep').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TCSLURepNomFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TCSLURepNomFrm.ShowNotes(Sender: TObject);
begin
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  try
    CSDBMemoFrm.bAllow_Upd := False;
    CSDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Rep').AsInteger);
    CSDBMemoFrm.ShowModal;
  finally
    CSDBMemoFrm.Free;
  end;
end;
end.
