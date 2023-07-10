unit PBLUProcessWCGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUProcessWCGroupfrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    Label1: TLabel;
    ProcessLbl: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
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
    SelCode, iThisCode, iProcess: Integer;
    SelName, sProcessDesc: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUProcessWCGroupfrm: TPBLUProcessWCGroupfrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintProcessWCGroup;

{$R *.DFM}

procedure TPBLUProcessWCGroupfrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Work Centre Group';
//    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Work Centre Group';
//    SelectBitBtn.Visible := False;
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

procedure TPBLUProcessWCGroupfrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Process').AsInteger := iProcess;
    Open;
//    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUProcessWCGroupfrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUProcessWCGroupfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUProcessWCGroupfrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
//  SelectBitBtn.Enabled := True;
end;

procedure TPBLUProcessWCGroupfrm.SelectBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBLUProcessWCGroupfrm.DetsDBGridDblClick(Sender: TObject);
begin
  chgbitbtnclick(Self);
end;

procedure TPBLUProcessWCGroupfrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUProcessWCGroupfrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUProcessWCGroupfrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUProcessWCGroupfrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProcessWCGroupFrm := TPBMaintProcessWCGroupFrm.Create(Self);
  try
    PBMaintProcessWCGroupFrm.ProcessCode := iProcess;
    PBMaintProcessWCGroupFrm.ProcessName := sProcessDesc;
    PBMaintProcessWCGroupFrm.ShowModal;
    bTempOK := (PBMaintProcessWCGroupFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessWCGroupFrm.ProcessCode;
  finally
    PBMaintProcessWCGroupFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup then
//        SelectCode(Self);
    end;
    NameEdit.SetFocus;
  end;
end;

procedure TPBLUProcessWCGroupfrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Work_Centre_Group').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUProcessWCGroupfrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

end.
