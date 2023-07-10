unit PBLUWorkCentre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUWorkCentrefrm = class(TForm)
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
    btnSize: TBitBtn;
    btnWCGroups: TBitBtn;
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
    procedure btnSizeClick(Sender: TObject);
    procedure btnWCGroupsClick(Sender: TObject);
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
  PBLUWorkCentrefrm: TPBLUWorkCentrefrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintWorkCentreGroup, PBMaintWorkCentre,
  PBMaintWorkCentreSize, PBMaintWorkCentreWCGroup;

{$R *.DFM}

procedure TPBLUWorkCentrefrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Work Centre';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Work Centre';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuWorkCentres',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUWorkCentrefrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    btnSize.Enabled := RecordCount > 0;
    btnWCGroups.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUWorkCentrefrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUWorkCentrefrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUWorkCentrefrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUWorkCentrefrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUWorkCentrefrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Work_Centre').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Work_Centre_Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUWorkCentrefrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUWorkCentrefrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUWorkCentrefrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUWorkCentrefrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUWorkCentrefrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintWorkCentreFrm := TPBMaintWorkCentreFrm.Create(Self);
  try
    PBMaintWorkCentreFrm.sFuncMode := sTempFuncMode;
    PBMaintWorkCentreFrm.ShowModal;
    bTempOK := (PBMaintWorkCentreFrm.ModalResult = mrOK);
    iTempSel := PBMaintWorkCentreFrm.iCode;
  finally
    PBMaintWorkCentreFrm.Free;
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

procedure TPBLUWorkCentrefrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Work_Centre').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUWorkCentrefrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUWorkCentrefrm.btnSizeClick(Sender: TObject);
begin
  PBMaintWorkCentreSizeFrm := TPBMaintWorkCentreSizeFrm.Create(Self);
  try
    PBMaintWorkCentreSizeFrm.WCCode := DetsSRC.DataSet.FieldByName('Work_Centre').AsInteger;
    PBMaintWorkCentreSizeFrm.WCName := DetsSRC.DataSet.FieldByName('Work_Centre_Name').AsString;
    PBMaintWorkCentreSizeFrm.ShowModal;
  finally
    PBMaintWorkCentreSizeFrm.Free;
  end;

end;

procedure TPBLUWorkCentrefrm.btnWCGroupsClick(Sender: TObject);
begin
  PBMaintWorkCentreWCGroupFrm := TPBMaintWorkCentreWCGroupFrm.Create(Self);
  try
    PBMaintWorkCentreWCGroupFrm.WCCode := DetsSRC.DataSet.FieldByName('Work_Centre').AsInteger;
    PBMaintWorkCentreWCGroupFrm.WCName := DetsSRC.DataSet.FieldByName('Work_Centre_Name').AsString;
    PBMaintWorkCentreWCGroupFrm.ShowModal;
  finally
    PBMaintWorkCentreWCGroupFrm.Free;
  end;
end;

end.
