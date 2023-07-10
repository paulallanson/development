unit PBLUProcessOps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUProcessOpsFrm = class(TForm)
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
    Label1: TLabel;
    ProcessLbl: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode, iProcess: Integer;
    SelName, sProcessDesc: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUProcessOpsFrm: TPBLUProcessOpsFrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintProcessOps;

{$R *.DFM}

procedure TPBLUProcessOpsFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Process Operation';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain a Process Operation';
    SelectBitBtn.Visible := False;
  end;
  {FuncGrpBox.Visible := (bAllow_Upd) and (PBMenuMainFrm.TestButton('ProdTypesBitBtn'));
  } NameEdit.Text := '';
  Processlbl.Caption := sProcessDesc;
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuProcesses',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUProcessOpsFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Process').AsInteger := iProcess;
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

procedure TPBLUProcessOpsFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUProcessOpsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUProcessOpsFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUProcessOpsFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUProcessOpsFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Operation').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Operation_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUProcessOpsFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUProcessOpsFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUProcessOpsFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUProcessOpsFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUProcessOpsFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProcessOpsFrm := TPBMaintProcessOpsFrm.Create(Self);
  try
    PBMaintProcessOpsFrm.sFuncMode := sTempFuncMode;
    PBMaintProcessOpsFrm.iProcess := iProcess;
    PBMaintProcessOpsFrm.sProcessDesc := sProcessDesc;
    PBMaintProcessOpsFrm.ShowModal;
    bTempOK := (PBMaintProcessOpsFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessOpsFrm.iCode;
  finally
    PBMaintProcessOpsFrm.Free;
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

procedure TPBLUProcessOpsFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Operation').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUProcessOpsFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUProcessOpsFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showgrid(self);
end;

end.
