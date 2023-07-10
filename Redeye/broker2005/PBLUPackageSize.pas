unit PBLUPackageSize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUPackageSizeFrm = class(TForm)
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
    procedure FindInGrid(TempSel: integer);
    procedure FormCreate(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode: integer;
    sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUPackageSizeFrm: TPBLUPackageSizeFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintPackageSize;

{$R *.DFM}

procedure TPBLUPackageSizeFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Package Size';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Package Size';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuPackageSizes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUPackageSizeFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUPackageSizeFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUPackageSizeFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUPackageSizeFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUPackageSizeFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUPackageSizeFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Package_Size').Asinteger;
  SelName := DetsSRC.DataSet.FieldByName('Package_Size_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUPackageSizeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUPackageSizeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUPackageSizeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUPackageSizeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUPackageSizeFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  TempSel: integer;
begin
  PBMaintPackageSizeFrm := TPBMaintPackageSizeFrm.Create(Self);
  try
    PBMaintPackageSizeFrm.sFuncMode := sTempFuncMode;
    PBMaintPackageSizeFrm.ShowModal;
    bTempOK := (PBMaintPackageSizeFrm.ModalResult = mrOK);
    TempSel := (PBMaintPackageSizeFrm.iCode);
  finally
    PBMaintPackageSizeFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(TempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
    NameEdit.SetFocus;
  end;
end;

procedure TPBLUPackageSizeFrm.FindInGrid(TempSel: integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if TempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Package_Size').Asinteger <> TempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUPackageSizeFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUPackageSizeFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

end.
