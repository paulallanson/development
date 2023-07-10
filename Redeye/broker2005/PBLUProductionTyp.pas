(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up A Product Type.

VSS Info:
$Header: /PBL D5/PBLUPrdTyp.pas 11    20/06/03 9:52 Andrewh $
$History: PBLUPrdTyp.pas $
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 23/12/:2   Time: 11:07
 * Updated in $/PBL D5
 * Added facility to enter optional charges against a product type
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 7/08/02    Time: 15:15
 * Updated in $/PBL D5
 * Modified Product Type maintenance to allow for the default_for_all
 * capability that now goes with each product type.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:20
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 13:02
 * Updated in $/PBL D5
 * Remove semi-colons from end of comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUProductionTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUPrdTypFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
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
    procedure CapabilitiesBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuestBitBtnClick(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName, CatName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUPrdTypFrm: TPBLUPrdTypFrm;

implementation

uses pbDatabase, PBMaintPrdTyp, PBLUPrdTypCap, PBLUPrdTypQu, PBDBMemo,
  PBLUPrdTypOChg, pbMainMenu;

{$R *.DFM}

procedure TPBLUPrdTypFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Product Type';
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Product Types';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuProductTypes',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUPrdTypFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CapabilitiesBitBtn.Enabled := RecordCount > 0;
    QuestBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUPrdTypFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUPrdTypFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUPrdTypFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUPrdTypFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
  Close;
end;

procedure TPBLUPrdTypFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Product_Type').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  CatName := DetsSRC.DataSet.FieldByName('Category_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUPrdTypFrm.DetsDBGridDblClick(Sender: TObject);
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

procedure TPBLUPrdTypFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUPrdTypFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUPrdTypFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUPrdTypFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintPrdTypFrm := TPBMaintPrdTypFrm.Create(Self);
  try
    PBMaintPrdTypFrm.sFuncMode := sTempFuncMode;
    PBMaintPrdTypFrm.ShowModal;
    bTempOK := (PBMaintPrdTypFrm.ModalResult = mrOK);
    iTempSel := PBMaintPrdTypFrm.iCode;
  finally
    PBMaintPrdTypFrm.Free;
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

procedure TPBLUPrdTypFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Product_Type').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUPrdTypFrm.CapabilitiesBitBtnClick(Sender: TObject);
begin
  PBLUPrdTypCapFrm := TPBLUPrdTypCapFrm.Create(Self);
  try
    PBLUPrdTypCapFrm.bIs_Lookup := False;
    PBLUPrdTypCapFrm.bAllow_Upd := True;
    PBLUPrdTypCapFrm.iPrdTyp :=
      DetsSRC.DataSet.FieldByName('Product_Type').AsInteger;
    PBLUPrdTypCapFrm.sPrdTypDesc :=
      DetsSRC.DataSet.FieldByName('Description').AsString;
    PBLUPrdTypCapFrm.ShowModal;
  finally
    PBLUPrdTypCapFrm.Free;
  end;
end;

procedure TPBLUPrdTypFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUPrdTypFrm.QuestBitBtnClick(Sender: TObject);
begin
  PBLUPrdTypQuFrm := TPBLUPrdTypQuFrm.Create(Self);
  try
    PBLUPrdTypQuFrm.bIs_Lookup := False;
    PBLUPrdTypQuFrm.bAllow_Upd := True;
    PBLUPrdTypQuFrm.iPrdTyp :=
      DetsSRC.DataSet.FieldByName('Product_Type').AsInteger;
    PBLUPrdTypQuFrm.sPrdTypDesc :=
      DetsSRC.DataSet.FieldByName('Description').AsString;
    PBLUPrdTypQuFrm.ShowModal;
  finally
    PBLUPrdTypQuFrm.Free;
  end;
end;

procedure TPBLUPrdTypFrm.ShowNotes(Sender: TObject);
begin
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBDBMemoFrm.bAllow_Upd := False;
    PBDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    PBDBMemoFrm.ShowModal;
  finally
    PBDBMemoFrm.Free;
  end;
end;

procedure TPBLUPrdTypFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUPrdTypOChgFrm := TPBLUPrdTypOChgFrm.Create(Self);
  try
    PBLUPrdTypOChgFrm.bIs_Lookup := False;
    PBLUPrdTypOChgFrm.bAllow_Upd := True;
    PBLUPrdTypOChgFrm.iPrdTyp :=
      DetsSRC.DataSet.FieldByName('Product_Type').AsInteger;
    PBLUPrdTypOChgFrm.sPrdTypDesc :=
      DetsSRC.DataSet.FieldByName('Description').AsString;
    PBLUPrdTypOChgFrm.ShowModal;
  finally
    PBLUPrdTypOChgFrm.Free;
  end;

end;

end.
