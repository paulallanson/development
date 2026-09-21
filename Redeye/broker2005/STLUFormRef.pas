unit STLUFormRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSTLUFormRef = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    RefDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    Label2: TLabel;
    DispPanel: TPanel;
    DBContactText: TDBText;
    LabelName: TLabel;
    btbtnImages: TBitBtn;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    lblProductCode: TLabel;
    Label3: TLabel;
    lblDescription: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure RefDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure RefDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btbtnImagesClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iCust, iBranch, iCode: Integer;
    SelName, SelDescr, stockCode, sCustName, sBranchName, sProduct: string;
    sDescription: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  frmSTLUFormRef: TfrmSTLUFormRef;

implementation

uses pbMainMenu, PBDatabase, CCSMaintPrtImages, STMaintFormRef;

{$R *.DFM}

procedure TfrmSTLUFormRef.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Form Reference';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Form Reference';
    SelectBitBtn.Visible := False;
  end;
  lblProductCode.caption := sProduct;
  lblDescription.caption := sDescription;
  CustLabel.Caption := sCustName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TfrmSTLUFormRef.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('Stock_Reference').asstring := sProduct;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := SelectBitBtn.enabled;
    DelBitBtn.Enabled := SelectBitBtn.enabled;
    btbtnImages.Enabled := SelectBitBtn.enabled;
    
    stsbrDetails.panels[0].text := IntToStr(RecordCount) + ' items';
    first;
  end;
end;

procedure TfrmSTLUFormRef.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TfrmSTLUFormRef.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TfrmSTLUFormRef.RefDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TfrmSTLUFormRef.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TfrmSTLUFormRef.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString;
  SelDescr := DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString;
  StockCode := DetsSRC.DataSet.FieldByName('Stock_Reference').AsString;
  bSelected := True;
  Close;
end;

procedure TfrmSTLUFormRef.RefDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    ChgBitBtnClick(Self);
end;

procedure TfrmSTLUFormRef.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TfrmSTLUFormRef.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TfrmSTLUFormRef.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TfrmSTLUFormRef.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  frmSTMaintFormRef := TfrmSTMaintFormRef.Create(Self);
  try
    frmSTMaintFormRef.sFuncMode := sTempFuncMode;
    frmSTMaintFormRef.iCust := iCust;
    frmSTMaintFormRef.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      begin
        frmSTMaintFormRef.iCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
        frmSTMaintFormRef.RefDescrEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString);
        frmSTMaintFormRef.RefIDEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        frmSTMaintFormRef.sFormRef := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        frmSTMaintFormRef.StockRefEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Stock_Reference').AsString);
      end
    else
      frmSTMaintFormRef.iCode := 0;
    frmSTMaintFormRef.sCustName := sCustName;
    frmSTMaintFormRef.sBranchName := sBranchName;
    frmSTMaintFormRef.sProduct := sProduct;
    frmSTMaintFormRef.sDescription := sDescription;

    frmSTMaintFormRef.ShowModal;
    bTempOK := (frmSTMaintFormRef.ModalResult = mrOK);
    iTempSel := frmSTMaintFormRef.iCode;
  finally
    frmSTMaintFormRef.Free;
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

procedure TfrmSTLUFormRef.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  RefDBGrid.visible := false;
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then
      begin
      RefDBGrid.visible := true;
      Exit;
      end;
    while (not (EOF)) and (FieldByName('Form_Reference').AsInteger <> iTempSel) do
      Next;
    if (fieldbyname('Form_Reference').asinteger <> iTempSel) then
      first;
  end;
  RefDBGrid.visible := true;
end;

procedure TfrmSTLUFormRef.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmSTLUFormRef.btbtnImagesClick(Sender: TObject);
var
  PartImagesFrm: TCCSMaintPrtImagesFrm;
begin
  PartImagesFrm := TCCSMaintPrtImagesfrm.create(self);
  try
    PartImagesFrm.display(trim(RefDBGrid.DataSource.DataSet.fieldbyname('Stock_Reference').asstring));
  finally
  end;
end;

end.
