unit pbluSICCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSICCodeFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    chkbxActiveOnly: TCheckBox;
    SearchTimer: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
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
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    iSelCode: Integer;
  end;

var
  PBLUSICCodeFrm: TPBLUSICCodeFrm;

implementation

uses pbMainMenu, PBMaintSICCode, PBDatabase;

{$R *.DFM}

procedure TPBLUSICCodeFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a SIC Code';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain SIC Codes';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (iSelCode <> 0) then FindInGrid(iSelCode);
//  dmBroker.ScreenAccessControl(Self,'mnuSICCodes',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUSICCodeFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('SIC_Code_ID').AsString := '%' + NameEdit.Text + '%';
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

procedure TPBLUSICCodeFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUSICCodeFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUSICCodeFrm.SelectCode(Sender: TObject);
begin
  iSelCode := DetsSRC.DataSet.FieldByName('SIC_Code').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('SIC_Code_ID').AsString + ' - ' + DetsSRC.DataSet.FieldByName('SIC_Code_Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUSICCodeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnClick(Self);
end;

procedure TPBLUSICCodeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new SIC_Code};
  CallMaintScreen('A');
end;

procedure TPBLUSICCodeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a SIC_Code};
  CallMaintScreen('C');
end;

procedure TPBLUSICCodeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a SIC_Code};
  CallMaintScreen('D');
end;

procedure TPBLUSICCodeFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintSICCodeFrm := TPBMaintSICCodeFrm.Create(Self);
  try
    PBMaintSICCodeFrm.sFuncMode := sTempFuncMode;
    PBMaintSICCodeFrm.ShowModal;
    bTempOK := (PBMaintSICCodeFrm.ModalResult = mrOK);
    iTempSel := PBMaintSICCodeFrm.iCode;
  finally
    PBMaintSICCodeFrm.Free;
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
  end;
end;

procedure TPBLUSICCodeFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  DetsDBGrid.DataSource := nil;
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('SIC_Code').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TPBLUSICCodeFrm.FormCreate(Sender: TObject);
begin
  iSelCode := 0;
end;

procedure TPBLUSICCodeFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSICCodeFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUSICCodeFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TPBLUSICCodeFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(DetsDBGrid.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

end;

end.
