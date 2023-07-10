unit PBLUProcess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUProcessFrm = class(TForm)
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
    QuestBitBtn: TBitBtn;
    btnWCGroups: TBitBtn;
    chkbxActiveOnly: TCheckBox;
    btnOps: TBitBtn;
    btnCosts: TBitBtn;
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
    procedure QuestBitBtnClick(Sender: TObject);
    procedure btnWCGroupsClick(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure btnOpsClick(Sender: TObject);
    procedure btnCostsClick(Sender: TObject);
  private
    { Private declarations }
    Customer: integer;
    CustomerName: string;
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode, ProcessGroup: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUProcessFrm: TPBLUProcessFrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintProcess, PBLUProcessQstn,
  PBMaintProcessWCGroup, PBLUProcessOps, PBLUProcessCost;

{$R *.DFM}

procedure TPBLUProcessFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Process';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Processes';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuProcesses',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUProcessFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Parambyname('Process_Group').asinteger := ProcessGroup;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    QuestBitBtn.Enabled := RecordCount > 0;
    btnWCGroups.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUProcessFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUProcessFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUProcessFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUProcessFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUProcessFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Process').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Process_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUProcessFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUProcessFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUProcessFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUProcessFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUProcessFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProcessFrm := TPBMaintProcessFrm.Create(Self);
  try
    PBMaintProcessFrm.sFuncMode := sTempFuncMode;
    PBMaintProcessFrm.ShowModal;
    bTempOK := (PBMaintProcessFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessFrm.iCode;
  finally
    PBMaintProcessFrm.Free;
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

procedure TPBLUProcessFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Process').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUProcessFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  ProcessGroup := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUProcessFrm.QuestBitBtnClick(Sender: TObject);
begin
  PBLUProcessQstnFrm := TPBLUProcessQstnFrm.Create(Self);
  try
    PBLUProcessQstnFrm.bIs_Lookup := False;
    PBLUProcessQstnFrm.bAllow_Upd := True;
    PBLUProcessQstnFrm.iProcess :=
      DetsSRC.DataSet.FieldByName('Process').AsInteger;
    PBLUProcessQstnFrm.sProcessDesc :=
      DetsSRC.DataSet.FieldByName('Process_Description').AsString;
    PBLUProcessQstnFrm.ShowModal;
  finally
    PBLUProcessQstnFrm.Free;
  end;
end;

procedure TPBLUProcessFrm.btnWCGroupsClick(Sender: TObject);
begin
  PBMaintProcessWCGroupFrm := TPBMaintProcessWCGroupFrm.Create(Self);
  try
    PBMaintProcessWCGroupFrm.ProcessCode := DetsSRC.DataSet.FieldByName('Process').AsInteger;
    PBMaintProcessWCGroupFrm.ProcessName := DetsSRC.DataSet.FieldByName('Process_Description').AsString;
    PBMaintProcessWCGroupFrm.ShowModal;
  finally
    PBMaintProcessWCGroupFrm.Free;
  end;

end;

procedure TPBLUProcessFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TPBLUProcessFrm.btnOpsClick(Sender: TObject);
begin
  PBLUProcessOpsFrm := TPBLUProcessOpsFrm.Create(Self);
  try
    PBLUProcessOpsFrm.iProcess :=
      DetsSRC.DataSet.FieldByName('Process').AsInteger;
    PBLUProcessOpsFrm.sProcessDesc :=
      DetsSRC.DataSet.FieldByName('Process_Description').AsString;
    PBLUProcessOpsFrm.ShowModal;
  finally
    PBLUProcessOpsFrm.Free;
  end;

end;

procedure TPBLUProcessFrm.btnCostsClick(Sender: TObject);
begin
  PBLUProcessCostFrm := TPBLUProcessCostFrm.Create(Self);
  try
    PBLUProcessCostFrm.CustomerName := self.customerName;
    PBLUProcessCostFrm.Customer := self.customer;
    PBLUProcessCostFrm.SelectProcess := false;
    PBLUProcessCostFrm.ProcessCode := DetsSRC.DataSet.FieldByName('Process').AsInteger;
    PBLUProcessCostFrm.PriceUnitDefault := DetsSRC.DataSet.FieldByName('Price_Unit').AsInteger;
    PBLUProcessCostFrm.lblProcessDescription.caption := DetsSRC.DataSet.FieldByName('Process_Description').AsString;
    PBLUProcessCostFrm.ShowModal;
    Customer := PBLUProcessCostFrm.Customer;
    CustomerName := PBLUProcessCostFrm.edtCustomer.text;
  finally
    PBLUProcessCostFrm.Free;
  end;
end;

end.
