unit PBLUAccountManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUAccountManagerFrm = class(TForm)
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
    DelBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
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
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    SelTeam: integer;
    SelTeamName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUAccountManagerFrm: TPBLUAccountManagerFrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintAccountManager, PBMaintAccMgrsCust;

{$R *.DFM}

procedure TPBLUAccountManagerFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup an Account Manager';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Account Managers';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuAccountManagers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUAccountManagerFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;

    SelectBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUAccountManagerFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUAccountManagerFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUAccountManagerFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUAccountManagerFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUAccountManagerFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Operator').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  SelTeam := DetsSRC.DataSet.Fieldbyname('Account_Team').asinteger;
  SelTeamName := DetsSRC.DataSet.Fieldbyname('Account_Team_Name').asstring;
  Selected := True;
  Close;
end;

procedure TPBLUAccountManagerFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUAccountManagerFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Rep}
  CallMaintScreen('A');
end;

procedure TPBLUAccountManagerFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Rep}
  CallMaintScreen('C');
end;

procedure TPBLUAccountManagerFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Rep}
  CallMaintScreen('D');
end;

procedure TPBLUAccountManagerFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintAccountManagerFrm := TPBMaintAccountManagerFrm.Create(Self);
  try
    PBMaintAccountManagerFrm.sFuncMode := sTempFuncMode;
    PBMaintAccountManagerFrm.iCode := detsDBGrid.DataSource.DataSet.fieldbyname('User_Group_operator').asinteger;
    if sTempFuncMode <> 'A' then
      PBMaintAccountManagerFrm.iOperator := detsDBGrid.DataSource.DataSet.fieldbyname('Operator').asinteger
    else
      PBMaintAccountManagerFrm.iOperator := 0;

    PBMaintAccountManagerFrm.ShowModal;
    bTempOK := (PBMaintAccountManagerFrm.ModalResult = mrOK);
//    iTempSel := PBMaintAccountManagerFrm.iCode;
    iTempSel := pbMaintAccountManagerFrm.iOperator;
  finally
    PBMaintAccountManagerFrm.Free;
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

procedure TPBLUAccountManagerFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Operator').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUAccountManagerFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUAccountManagerFrm.BitBtn1Click(Sender: TObject);
begin
  PBMaintAccMgrsCustFrm := TPBMaintAccMgrsCustFrm.create(self);
  try
    PBMaintAccMgrsCustFrm.AccMgrCode := detsDBGrid.DataSource.DataSet.fieldbyname('operator').asinteger;
    PBMaintAccMgrsCustFrm.AccMgrName := detsDBGrid.DataSource.DataSet.fieldbyname('Name').asstring;
    PBMaintAccMgrsCustFrm.showmodal;
  finally
    PBMaintAccMgrsCustFrm.free;
  end
end;

end.
