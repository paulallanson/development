unit PBLUCountry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUCountryFrm = class(TForm)
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
    DummySRC: TDataSource;
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
    procedure chkbxActiveOnlyClick(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode: string;
    sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUCountryFrm: TPBLUCountryFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintCountry;

{$R *.DFM}

procedure TPBLUCountryFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup Country';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Country';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuCountry',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUCountryFrm.ShowGrid(Sender: TObject);
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

procedure TPBLUCountryFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCountryFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCountryFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUCountryFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUCountryFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Country_Id').AsString;
  SelName := DetsSRC.DataSet.FieldByName('Country_Id_Descr').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUCountryFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUCountryFrm.AddBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TPBLUCountryFrm.ChgBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TPBLUCountryFrm.DelBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TPBLUCountryFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK, bDefault: ByteBool;
  sTempSel: string;
begin
  PBMaintCountryFrm := TPBMaintCountryFrm.Create(Self);
  try
    PBMaintCountryFrm.sFuncMode := sTempFuncMode;
    PBMaintCountryFrm.ShowModal;
    bTempOK := (PBMaintCountryFrm.ModalResult = mrOK);
    sTempSel := inttostr(PBMaintCountryFrm.iCode);
  finally
    PBMaintCountryFrm.Free;
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

procedure TPBLUCountryFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Country_Id').Asstring <> sTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUCountryFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBLUCountryFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

end.
