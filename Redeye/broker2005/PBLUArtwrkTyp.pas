(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up An Artwork type.

VSS Info:
$Header: /PBL D5/PBLUArtwrkTyp.pas 8     20/06/03 9:52 Andrewh $
$History: PBLUArtwrkTyp.pas $
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:14
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 23/07/:1   Time: 15:34
 * Updated in $/PBL D5
 * Changed to use the Artwork_Instructions field instead of Description
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 23/07/:1   Time: 11:50
 * Created in $/PBL D5
 * Initial take on of Artwork type lookup and maintenance
 *
 ******************************************************************************)
unit PBLUArtwrkTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUArtwrkTypFrm = class(TForm)
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
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode, sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUArtwrkTypFrm: TPBLUArtwrkTypFrm;

implementation

uses PBMaintArtwrkTyp, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUArtwrkTypFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup an Artwork Type';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Artwork Types';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuArtworkTypes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUArtwrkTypFrm.ShowGrid(Sender: TObject);
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

procedure TPBLUArtwrkTypFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUArtwrkTypFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUArtwrkTypFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUArtwrkTypFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUArtwrkTypFrm.SelectCode(Sender: TObject);
begin
  SelCode := IntToStr(DetsSRC.DataSet.FieldByName('Artwork_Type').AsInteger);
  SelName := DetsSRC.DataSet.FieldByName('Artwork_Instructions').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUArtwrkTypFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUArtwrkTypFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUArtwrkTypFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUArtwrkTypFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUArtwrkTypFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  PBMaintArtwrkTypFrm := TPBMaintArtwrkTypFrm.Create(Self);
  try
    PBMaintArtwrkTypFrm.sFuncMode := sTempFuncMode;
    PBMaintArtwrkTypFrm.ShowModal;
    bTempOK := (PBMaintArtwrkTypFrm.ModalResult = mrOK);
    sTempSel := IntToStr(PBMaintArtwrkTypFrm.iCode);
  finally
    PBMaintArtwrkTypFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(sTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
    NameEdit.SetFocus;
  end;
end;

procedure TPBLUArtwrkTypFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (IntToStr(FieldByName('Artwork_Type').AsInteger) <> sTempSel) do
      Next;
  end;
end;

procedure TPBLUArtwrkTypFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

end.
