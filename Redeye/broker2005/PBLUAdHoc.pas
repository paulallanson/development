unit PBLUAdHoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUAdHocFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    ThisChkBox: TCheckBox;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
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
    procedure ThisChkBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
    FCustomer: integer;
    procedure SetCustomer(const Value: integer);
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    property Customer: integer read FCustomer write SetCustomer;
  end;

var
  PBLUAdHocFrm: TPBLUAdHocFrm;

implementation

uses PBMaintAdHoc, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUAdHocFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup an Ad-Hoc Address';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Ad-Hoc Addresses';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  ThisChkBox.Visible := (iThisCode <> 0);
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  ThisChkBox.Checked := ((iThisCode <> 0) and (iThisCode = SelCode));
  dmBroker.ScreenAccessControl(Self,'mnuAdHoc',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUAdHocFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').Asinteger := self.Customer;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUAdHocFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUAdHocFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUAdHocFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUAdHocFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUAdHocFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Ad_Hoc_Address').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUAdHocFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self)
end;

procedure TPBLUAdHocFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Rep};
  CallMaintScreen('A');
end;

procedure TPBLUAdHocFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Rep};
  CallMaintScreen('C');
end;

procedure TPBLUAdHocFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Rep};
  CallMaintScreen('D');
end;

procedure TPBLUAdHocFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintAdHocFrm := TPBMaintAdHocFrm.Create(Self);
  try
    PBMaintAdHocFrm.sFuncMode := sTempFuncMode;
    if sTempFuncMode = 'A' then
      PBMaintAdHocFrm.iAdHoc := 0
    else
      PBMaintAdHocFrm.iAdhoc := detsdbGrid.datasource.dataset.fieldbyname('Ad_Hoc_address').asinteger;
    PBMaintAdHocFrm.ShowModal;
    bTempOK := (PBMaintAdHocFrm.ModalResult = mrOK);
    iTempSel := PBMaintAdHocFrm.iCode;
  finally
    PBMaintAdHocFrm.Free;
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

procedure TPBLUAdHocFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Ad_Hoc_Address').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUAdHocFrm.ThisChkBoxClick(Sender: TObject);
begin
  {If checked, disable the grid etc};
  DetsDBGrid.Enabled := (not (ThisChkBox.Checked));
  SearchGrpBox.Enabled := (not (ThisChkBox.Checked));
  if ThisChkBox.Checked then
  begin
    bDisableNameChangeEvent := True;
    NameEdit.Text := '';
    bDisableNameChangeEvent := False;
    ShowGrid(Self);
    FindInGrid(iThisCode);
  end
  else
    FindInGrid(0)
end;

procedure TPBLUAdHocFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUAdHocFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

end.
