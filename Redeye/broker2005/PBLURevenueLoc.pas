unit PBLURevenueLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLURevenueLocFrm = class(TForm)
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
    DummySRC: TDataSource;
    UpStatSQL: TQuery;
    GetDetsSQLInvoice_Location: TIntegerField;
    GetDetsSQLInvoice_Location_Descr: TStringField;
    GetDetsSQLDefault_PM_Revenue_Centre: TStringField;
    GetDetsSQLDefault_Description: TStringField;
    GetDetsSQLinactive: TStringField;
    GetDetsSQLColor: TIntegerField;
    GetDetsSQLFont_Color: TIntegerField;
    GetDetsSQLLogo_Path: TStringField;
    GetDetsSQLRegistered_Address: TStringField;
    GetDetsSQLInvoice_Payment_Notes: TIntegerField;
    btnBudgets: TBitBtn;
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
    procedure GetDetsSQLDefault_DescriptionGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnBudgetsClick(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
    procedure SetDefault(sTempSel: string; bDefault: bytebool);
  public
    SelCode: string;
    sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLURevenueLocFrm: TPBLURevenueLocFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintRevenueLoc, PBMaintRevenueLocBudgets;

{$R *.DFM}

procedure TPBLURevenueLocFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Revenue Centre';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Revenue Centre';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuRevenueCentres',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLURevenueLocFrm.ShowGrid(Sender: TObject);
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

procedure TPBLURevenueLocFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLURevenueLocFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLURevenueLocFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLURevenueLocFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLURevenueLocFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Invoice_Location').AsString;
  SelName := DetsSRC.DataSet.FieldByName('Invoice_Location_Descr').AsString;
  Selected := True;
  Close;
end;

procedure TPBLURevenueLocFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLURevenueLocFrm.AddBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TPBLURevenueLocFrm.ChgBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TPBLURevenueLocFrm.DelBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TPBLURevenueLocFrm.SetDefault(sTempSel: string ;bDefault: bytebool);
begin
  DetsDBGrid.DataSource := DummySRC;
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + '' + '%';
    Open;
    first;
    while eof <> true do
      begin
        if GetDetsSQl.fieldbyname('Invoice_Location').asstring = sTempSel then
          begin
            next;
            continue;
          end;

        UpStatSQL.close;
        if (GetDetsSQl.fieldbyname('Default_PM_Revenue_Centre').asstring = 'Y') and
           (bDefault) then
          UpStatSQl.parambyname('Default_PM_Revenue_Centre').asstring := 'N'
        else
          UpStatSQl.parambyname('Default_PM_Revenue_Centre').asstring := GetDetsSQl.fieldbyname('Default_PM_Revenue_Centre').asstring;

        UpStatSQl.parambyname('Invoice_Location').asinteger := GetDetsSQl.fieldbyname('Invoice_Location').asinteger;
        UpStatSQL.execSQL;
        next;
      end;
  end;
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TPBLURevenueLocFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK, bDefault: ByteBool;
  sTempSel: string;
begin
  PBMaintRevenueLocFrm := TPBMaintRevenueLocFrm.Create(Self);
  try
    PBMaintRevenueLocFrm.sFuncMode := sTempFuncMode;
    PBMaintRevenueLocFrm.ShowModal;
    bTempOK := (PBMaintRevenueLocFrm.ModalResult = mrOK);
    sTempSel := inttostr(PBMaintRevenueLocFrm.iCode);
    bDefault := PBMaintRevenueLocFrm.chkbxDefault.checked
  finally
    PBMaintRevenueLocFrm.Free;
  end;
  if bTempOK then
  begin
    SetDefault(sTempSel,bDefault);
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

procedure TPBLURevenueLocFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Invoice_Location').Asstring <> sTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLURevenueLocFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBLURevenueLocFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TPBLURevenueLocFrm.GetDetsSQLDefault_DescriptionGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if GetDetsSQLDefault_PM_Revenue_Centre.asstring = 'Y' then
    text := GetDetsSQLInvoice_Location_Descr.asstring + ' (Default)'
  else
    text := GetDetsSQLInvoice_Location_Descr.asstring;
end;

procedure TPBLURevenueLocFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(DetsDBGrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TPBLURevenueLocFrm.btnBudgetsClick(Sender: TObject);
begin
  PBMaintRevenueLocBudgetsFrm := TPBMaintRevenueLocBudgetsFrm.create(self);
  try
    PBMaintRevenueLocBudgetsFrm.iCode := dmBroker.GetCurrentYear;
    PBMaintRevenueLocBudgetsFrm.iRevLoc :=  detsdbGrid.DataSource.DataSet.fieldbyname('Invoice_Location').asinteger;
    PBMaintRevenueLocBudgetsFrm.iPeriods := dmBroker.GetCurrentYearNoPeriods(PBMaintRevenueLocBudgetsFrm.iCode);
    PBMaintRevenueLocBudgetsFrm.lblFinancialyear.caption := dmBroker.GetCurrentYearTitle(PBMaintRevenueLocBudgetsFrm.iCode);
    PBMaintRevenueLocBudgetsFrm.lblRevenueLocationName.Caption :=  detsdbGrid.DataSource.DataSet.fieldbyname('Invoice_Location_Descr').asstring;
    PBMaintRevenueLocBudgetsFrm.showmodal;
  finally
    PBMaintRevenueLocBudgetsFrm.free;
  end;
end;

end.
