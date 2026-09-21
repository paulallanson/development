unit PBLUPriceUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUPriceUnitFrm = class(TForm)
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
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode, sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUPriceUnitFrm: TPBLUPriceUnitFrm;

implementation

uses UITypes, PBMaintPriceUnit, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUPriceUnitFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Price Unit';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Price Unit';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuPriceUnits',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUPriceUnitFrm.ShowGrid(Sender: TObject);
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

procedure TPBLUPriceUnitFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUPriceUnitFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUPriceUnitFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUPriceUnitFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUPriceUnitFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Price_unit').AsString;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUPriceUnitFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUPriceUnitFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUPriceUnitFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUPriceUnitFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUPriceUnitFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  PBMaintPriceUnitFrm := TPBMaintPriceUnitFrm.Create(Self);
  try
    if (sTempFuncMode = 'D') then
      begin
        if (GetDetsSQL.fieldbyname('Price_Unit').asinteger = 1) or
           (GetDetsSQL.fieldbyname('Price_Unit').asinteger = 2) then
          begin
          MessageDlg('This Price Unit cannot be deleted.', mtWarning,
              [mbOk], 0);
          exit;
          end;
      end;
    PBMaintPriceUnitFrm.sFuncMode := sTempFuncMode;
    PBMaintPriceUnitFrm.ShowModal;
    bTempOK := (PBMaintPriceUnitFrm.ModalResult = mrOK);
    sTempSel := IntToStr(PBMaintPriceUnitFrm.iCode);
  finally
    PBMaintPriceUnitFrm.Free;
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

procedure TPBLUPriceUnitFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Price_unit').AsString <> sTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUPriceUnitFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBLUPriceUnitFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

end.
