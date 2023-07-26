unit PBLURepTeam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLURepTeamfrm = class(TForm)
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
    btnMembers: TBitBtn;
    btnBudgets: TBitBtn;
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
    procedure btnMembersClick(Sender: TObject);
    procedure btnBudgetsClick(Sender: TObject);
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
  PBLURepTeamfrm: TPBLURepTeamfrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintAccountTeam, PBMaintRepTeam,
  PBMaintRepTeamMembers, PBMaintRepTeamBudgets;

{$R *.DFM}

procedure TPBLURepTeamfrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup an Rep Team';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Rep Teams';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuReps',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLURepTeamfrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;

    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    btnMembers.Enabled := RecordCount > 0;
    btnBudgets.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLURepTeamfrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLURepTeamfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLURepTeamfrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLURepTeamfrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLURepTeamfrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Rep_Team').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Rep_Team_Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLURepTeamfrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLURepTeamfrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Rep}
  CallMaintScreen('A');
end;

procedure TPBLURepTeamfrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Rep}
  CallMaintScreen('C');
end;

procedure TPBLURepTeamfrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Rep}
  CallMaintScreen('D');
end;

procedure TPBLURepTeamfrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintRepTeamFrm := TPBMaintRepTeamFrm.Create(Self);
  try
    PBMaintRepTeamFrm.sFuncMode := sTempFuncMode;
    PBMaintRepTeamFrm.ShowModal;
    bTempOK := (PBMaintRepTeamFrm.ModalResult = mrOK);
    iTempSel := PBMaintRepTeamFrm.iCode;
  finally
    PBMaintRepTeamFrm.Free;
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

procedure TPBLURepTeamfrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Rep_Team').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLURepTeamfrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLURepTeamfrm.btnMembersClick(Sender: TObject);
begin
  frmPBMaintRepTeamMembers := TfrmPBMaintRepTeamMembers.create(self);
  try
    frmPBMaintRepTeamMembers.teamCode := detsdbGrid.DataSource.DataSet.fieldbyname('Rep_Team').asinteger;
    frmPBMaintRepTeamMembers.teamName := detsdbGrid.DataSource.DataSet.fieldbyname('Rep_Team_Name').asstring;
    frmPBMaintRepTeamMembers.showmodal;
  finally
    frmPBMaintRepTeamMembers.free;
  end;

end;

procedure TPBLURepTeamfrm.btnBudgetsClick(Sender: TObject);
begin
  PBMaintRepTeamBudgetsFrm := TPBMaintRepTeamBudgetsFrm.create(self);
  try
    PBMaintRepTeamBudgetsFrm.iCode := dmBroker.GetCurrentYear;
    PBMaintRepTeamBudgetsFrm.iRepTeam :=  detsdbGrid.DataSource.DataSet.fieldbyname('Rep_Team').asinteger;
    PBMaintRepTeamBudgetsFrm.iPeriods := dmBroker.GetCurrentYearNoPeriods(PBMaintRepTeamBudgetsFrm.iCode);
    PBMaintRepTeamBudgetsFrm.lblFinancialyear.caption := dmBroker.GetCurrentYearTitle(PBMaintRepTeamBudgetsFrm.iCode);
    PBMaintRepTeamBudgetsFrm.lblRepTeamName.Caption :=  detsdbGrid.DataSource.DataSet.fieldbyname('Rep_Team_Name').asstring;
    PBMaintRepTeamBudgetsFrm.showmodal;
  finally
    PBMaintRepTeamBudgetsFrm.free;
  end;
end;

end.
