unit PBLUWorksOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUWorksOrderStatusfrm = class(TForm)
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
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  PBLUWorksOrderStatusfrm: TPBLUWorksOrderStatusfrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintWorksOrderStatus;

{$R *.DFM}

procedure TPBLUWorksOrderStatusfrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Works Instruction Status';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain a Works Instruction Status';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuWorksOrderStatus',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUWorksOrderStatusfrm.ShowGrid(Sender: TObject);
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

procedure TPBLUWorksOrderStatusfrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUWorksOrderStatusfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUWorksOrderStatusfrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUWorksOrderStatusfrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUWorksOrderStatusfrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Works_Order_Status').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Works_Order_Status_Descr').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUWorksOrderStatusfrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUWorksOrderStatusfrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUWorksOrderStatusfrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUWorksOrderStatusfrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUWorksOrderStatusfrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintWorksOrderStatusFrm := TPBMaintWorksOrderStatusFrm.Create(Self);
  try
    PBMaintWorksOrderStatusFrm.sFuncMode := sTempFuncMode;
    PBMaintWorksOrderStatusFrm.ShowModal;
    bTempOK := (PBMaintWorksOrderStatusFrm.ModalResult = mrOK);
    iTempSel := PBMaintWorksOrderStatusFrm.iCode;
  finally
    PBMaintWorksOrderStatusFrm.Free;
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

procedure TPBLUWorksOrderStatusfrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Works_Order_Status').AsInteger <> iTempSel)
      do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUWorksOrderStatusfrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUWorksOrderStatusfrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);  
end;

procedure TPBLUWorksOrderStatusfrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(detsdbgrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if detsdbgrid.datasource.dataset.fieldByName('Color').asinteger <> 0 then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := detsdbgrid.datasource.dataset.fieldByName('Color').asinteger;
      (Sender as TDBGrid).Canvas.Font.color := detsdbgrid.datasource.dataset.fieldByName('Font_Color').asinteger;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

end.
