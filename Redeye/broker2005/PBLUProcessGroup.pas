unit PBLUProcessGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUProcessGroupFrm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
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
  PBLUProcessGroupFrm: TPBLUProcessGroupFrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintProcessGroup;

{$R *.DFM}

procedure TPBLUProcessGroupFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Process Group';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Process Group';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuProcessGroups',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUProcessGroupFrm.ShowGrid(Sender: TObject);
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

procedure TPBLUProcessGroupFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUProcessGroupFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUProcessGroupFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUProcessGroupFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUProcessGroupFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Process_Group').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Process_Group_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUProcessGroupFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUProcessGroupFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUProcessGroupFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUProcessGroupFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUProcessGroupFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProcessGroupFrm := TPBMaintProcessGroupFrm.Create(Self);
  try
    PBMaintProcessGroupFrm.sFuncMode := sTempFuncMode;
    PBMaintProcessGroupFrm.ShowModal;
    bTempOK := (PBMaintProcessGroupFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessGroupFrm.iCode;
  finally
    PBMaintProcessGroupFrm.Free;
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

procedure TPBLUProcessGroupFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Process_Group').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUProcessGroupFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

end.
