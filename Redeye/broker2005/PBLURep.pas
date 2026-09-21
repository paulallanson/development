unit PBLURep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLURepFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
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
    chkbxActiveOnly: TCheckBox;
    btnBudgets: TBitBtn;
    chkbxIncludeSubReps: TCheckBox;
    qryDelete: TFDQuery;
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
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure btnBudgetsClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected, bOnly_Show_SubReps: ByteBool;
  end;

var
  PBLURepFrm: TPBLURepFrm;

implementation

uses UITypes, PBMaintRep, PBDBMemo, pbMainMenu, PBDatabase, PBMaintRepFinancials,
  PBMaintRepBudgets;

{$R *.DFM}

procedure TPBLURepFrm.FormActivate(Sender: TObject);
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

  FuncGrpBox.Visible := (bAllow_Upd) ;
  btnBudgets.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuReps',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLURepFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';

    if chkbxIncludeSubReps.Checked then
      ParamByName('Rep_Is_Sub_Rep').AsString := 'Y'
    else
      ParamByName('Rep_Is_Sub_Rep').AsString := 'N';
    Open;

    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLURepFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLURepFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLURepFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLURepFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
  Close;
end;

procedure TPBLURepFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLURepFrm.DetsDBGridDblClick(Sender: TObject);
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

procedure TPBLURepFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Rep}
  CallMaintScreen('A');
end;

procedure TPBLURepFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Rep}
  CallMaintScreen('C');
end;

procedure TPBLURepFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Rep}
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Rep WHERE Rep = ' + inttostr(detsDBGrid.DataSource.dataset.fieldbyname('Rep').asinteger);
            execsql;
          end;
        ShowGrid(Self);
      except messagedlg(detsDBGrid.DataSource.dataset.fieldbyname('Name').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
//  CallMaintScreen('D');
end;

procedure TPBLURepFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintRepFrm := TPBMaintRepFrm.Create(Self);
  try
    PBMaintRepFrm.sFuncMode := sTempFuncMode;
    PBMaintRepFrm.ShowModal;
    bTempOK := (PBMaintRepFrm.ModalResult = mrOK);
    iTempSel := PBMaintRepFrm.iCode;
  finally
    PBMaintRepFrm.Free;
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

procedure TPBLURepFrm.FindInGrid(iTempSel: Integer);
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

procedure TPBLURepFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLURepFrm.ShowNotes(Sender: TObject);
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

procedure TPBLURepFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TPBLURepFrm.btnBudgetsClick(Sender: TObject);
begin
  if dmBroker.GetFYBudgetType(dmBroker.GetCurrentYear) = 'C' then
    begin
      PBMaintRepFinancialsFrm := TPBMaintRepFinancialsFrm.create(self);
      try
        PBMaintRepFinancialsFrm.iCode := dmBroker.GetCurrentYear;
        PBMaintRepFinancialsFrm.iRep :=  detsdbGrid.DataSource.DataSet.fieldbyname('Rep').asinteger;
        PBMaintRepFinancialsFrm.lblRepName.Caption :=  detsdbGrid.DataSource.DataSet.fieldbyname('Name').asstring;
        PBMaintRepFinancialsFrm.showmodal;
      finally
        PBMaintRepFinancialsFrm.free;
      end;
    end
  else
    begin
      PBMaintRepBudgetsFrm := TPBMaintRepBudgetsFrm.create(self);
      try
        PBMaintRepBudgetsFrm.iCode := dmBroker.GetCurrentYear;
        PBMaintRepBudgetsFrm.iRep :=  detsdbGrid.DataSource.DataSet.fieldbyname('Rep').asinteger;
        PBMaintRepBudgetsFrm.iPeriods := dmBroker.GetCurrentYearNoPeriods(PBMaintRepBudgetsFrm.iCode);
        PBMaintRepBudgetsFrm.lblFinancialyear.caption := dmBroker.GetCurrentYearTitle(PBMaintRepBudgetsFrm.iCode);
        PBMaintRepBudgetsFrm.lblRepName.Caption :=  detsdbGrid.DataSource.DataSet.fieldbyname('Name').asstring;
        PBMaintRepBudgetsFrm.showmodal;
      finally
        PBMaintRepBudgetsFrm.free;
      end;
    end;
end;

procedure TPBLURepFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(DetsDBGrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if (DetsDBGrid.datasource.dataset.fieldByName('Rep_Is_Sub_Rep').Asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end.
