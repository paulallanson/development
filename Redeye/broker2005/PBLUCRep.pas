unit PBLUCRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCRepFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    BranchLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ChgBitBtn: TBitBtn;
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
    SelCode, iCust, iBranch: Integer;
    SelName, sCustName, sBranchName: string;
    bIs_Lookup, bAllow_Upd, bSelected, bOnlyShowSubReps: ByteBool;
    function TotalPercentage: real;
  end;

var
  PBLUCRepFrm: TPBLUCRepFrm;

implementation

uses PBMaintCRep, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUCRepFrm.FormActivate(Sender: TObject);
begin
  {Hide the rep's %age if this is a look-up};
  if bIs_LookUp then
    DetsDBGrid.Columns[0].Width := 284
  else
    DetsDBGrid.Columns[0].Width := 210;
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup Reps Assigned To Customer/Branches';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Reps Assigned To Customer/Branches';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuReps',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUCRepFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;

    if bOnlyShowSubReps then
      ParamByName('Rep_Is_Sub_Rep').Asstring := 'Y'
    else
      ParamByName('Rep_Is_Sub_Rep').Asstring := 'N';

    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUCRepFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCRepFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCRepFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUCRepFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TPBLUCRepFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TPBLUCRepFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUCRepFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TPBLUCRepFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TPBLUCRepFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TPBLUCRepFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintCRepFrm := TPBMaintCRepFrm.Create(Self);
  try
    PBMaintCRepFrm.sFuncMode := sTempFuncMode;
    PBMaintCRepFrm.iCust := iCust;
    PBMaintCRepFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      PBMaintCRepFrm.iCode := DetsSRC.DataSet.FieldByName('Rep').AsInteger
    else
      PBMaintCRepFrm.iCode := 0;
    PBMaintCRepFrm.sCustName := sCustName;
    PBMaintCRepFrm.sBranchName := sBranchName;
    PBMaintCRepFrm.ShowModal;
    bTempOK := (PBMaintCRepFrm.ModalResult = mrOK);
    iTempSel := PBMaintCRepFrm.iCode;
  finally
    PBMaintCRepFrm.Free;
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

procedure TPBLUCRepFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Rep').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUCRepFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

function TPBLUCRepFrm.TotalPercentage: real;
begin
  result := 0;
  with detsSRC.dataset do
    begin
      first;
      while eof <> true do
        begin
          result := result + fieldbyname('percentage').asfloat;
          next;
        end;
    end;
end;

end.
