unit PBLUQuoteReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUQuoteReasonFrm = class(TForm)
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
    rdgReasonType: TRadioGroup;
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
    procedure rdgReasonTypeClick(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode, sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUQuoteReasonFrm: TPBLUQuoteReasonFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintQuoteReason;

{$R *.DFM}

procedure TPBLUQuoteReasonFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Quote Reason';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Quote Reasons';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuQuoteReasons',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUQuoteReasonFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    if rdgReasonType.itemindex = 0 then
      ParamByName('Quote_Reason_Type').AsString := 'L'
    else
      ParamByName('Quote_Reason_Type').AsString := 'W';

    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUQuoteReasonFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUQuoteReasonFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUQuoteReasonFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUQuoteReasonFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUQuoteReasonFrm.SelectCode(Sender: TObject);
begin
  SelCode := IntToStr(DetsSRC.DataSet.FieldByName('Quote_Reason').AsInteger);
  SelName := DetsSRC.DataSet.FieldByName('Quote_Reason_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUQuoteReasonFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUQuoteReasonFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Credit Note Reason}
  CallMaintScreen('A');
end;

procedure TPBLUQuoteReasonFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUQuoteReasonFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUQuoteReasonFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  PBMaintQuoteReasonFrm := TPBMaintQuoteReasonFrm.Create(Self);
  try
    PBMaintQuoteReasonFrm.sFuncMode := sTempFuncMode;
    PBMaintQuoteReasonFrm.ShowModal;
    bTempOK := (PBMaintQuoteReasonFrm.ModalResult = mrOK);
    sTempSel := IntToStr(PBMaintQuoteReasonFrm.iCode);
  finally
    PBMaintQuoteReasonFrm.Free;
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

procedure TPBLUQuoteReasonFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (IntToStr(FieldByName('Quote_Reason').AsInteger) <> sTempSel) do
      Next;
  end;
end;

procedure TPBLUQuoteReasonFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBLUQuoteReasonFrm.rdgReasonTypeClick(Sender: TObject);
begin
  showGrid(self);
end;

end.
