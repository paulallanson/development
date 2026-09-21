unit PBLUProductRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUProductRefFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    RefDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    BranchLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DispPanel: TPanel;
    DBContactText: TDBText;
    LabelName: TLabel;
    btbtnImages: TBitBtn;
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
    SelName, SelDescr, stockCode, sCustName, sBranchName: string;
    bNumbered: boolean;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  PBLUProductRefFrm: TPBLUProductRefFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintProductRef, CCSMaintProdImages;

{$R *.DFM}

procedure TPBLUProductRefFrm.FormActivate(Sender: TObject);
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
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUProductRefFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := SelectBitBtn.enabled;
    DelBitBtn.Enabled := SelectBitBtn.enabled;
    btbtnImages.Enabled := SelectBitBtn.enabled;
    
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
    first;
  end;
end;

procedure TPBLUProductRefFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUProductRefFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUProductRefFrm.RefDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUProductRefFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TPBLUProductRefFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString;
  SelDescr := DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString;
  StockCode := DetsSRC.DataSet.FieldByName('Stock_Reference').AsString;
  bNumbered := (DetsSRC.DataSet.FieldByName('Numbered').AsString = 'Y');
  bSelected := True;
  Close;
end;

procedure TPBLUProductRefFrm.RefDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    ChgBitBtnClick(Self);
end;

procedure TPBLUProductRefFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TPBLUProductRefFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TPBLUProductRefFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TPBLUProductRefFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProductRefFrm := TPBMaintProductRefFrm.Create(Self);
  try
    PBMaintProductRefFrm.sFuncMode := sTempFuncMode;
    PBMaintProductRefFrm.iCust := iCust;
    PBMaintProductRefFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      begin
        PBMaintProductRefFrm.iCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
        PBMaintProductRefFrm.RefDescrEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString);
        PBMaintProductRefFrm.RefIDEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        PBMaintProductRefFrm.edtReorder.Text := Trim(DetsSRC.DataSet.FieldByName('Reorder_Level').AsString);
        PBMaintProductRefFrm.sFormRef := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        PBMaintProductRefFrm.ChkBoxStockedItem.Checked := (DetsSRC.DataSet.FieldByName('Stocked_Item').AsString) = 'Y';
        PBMaintProductRefFrm.StockRefEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Stock_Reference').AsString);
      end
    else
      PBMaintProductRefFrm.iCode := 0;
    PBMaintProductRefFrm.sCustName := sCustName;
    PBMaintProductRefFrm.sBranchName := sBranchName;

    PBMaintProductRefFrm.ShowModal;
    bTempOK := (PBMaintProductRefFrm.ModalResult = mrOK);
    iTempSel := PBMaintProductRefFrm.iCode;
  finally
    PBMaintProductRefFrm.Free;
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

procedure TPBLUProductRefFrm.FindInGrid(iTempSel: Integer);
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

procedure TPBLUProductRefFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUProductRefFrm.btbtnImagesClick(Sender: TObject);
var
  PartImagesFrm: TCCSMaintProdImagesFrm;
begin
  PartImagesFrm := TCCSMaintProdImagesFrm.Create(self);
  try
    PartImagesFrm.display(Trim(DetsSRC.DataSet.FieldByName('Stock_Reference').AsString));
  finally
    PartImagesFrm.Free;
  end;
end;

end.
