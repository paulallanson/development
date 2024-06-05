unit PBLUPrdTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUPrdTypFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    GoToGrpBox: TGroupBox;
    CapabilitiesBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    QuestBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    chkbxActiveOnly: TCheckBox;
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
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    Category: integer;
    SelCode, iThisCode: Integer;
    SelName, CatName, SelShort: string;
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
    Parambyname('Category').asinteger := Category;
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
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
  SelectCode(Self);
  Close;
end;

procedure TPBLUPrdTypFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Product_Type').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  SelShort := DetsSRC.DataSet.FieldByName('Short_Desc').AsString;
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

procedure TPBLUPrdTypFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if(detsDBGrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
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
    while (not (EOF)) and (FieldByName('Product_Type').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
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
  Category := 0;
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

procedure TPBLUPrdTypFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

end.
