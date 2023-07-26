unit PBLUCustomerCats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCustomerCatsFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    CustLabel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
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
    iCust: integer;
    sCustName: string;
    SelCode, iThisCode: Integer;
    SelName: string;
    SelTeam: integer;
    SelTeamName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUCustomerCatsFrm: TPBLUCustomerCatsFrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintAccountManager, PBMaintCustomerCats;

{$R *.DFM}

procedure TPBLUCustomerCatsFrm.FormActivate(Sender: TObject);
begin
  CustLabel.Caption := 'Customer: ' + sCustName;
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Category';
  end
  else
  begin
    Caption := 'Maintain Customer Categories';
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
end;

procedure TPBLUCustomerCatsFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Customer').asinteger := iCust;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;

    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUCustomerCatsFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCustomerCatsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCustomerCatsFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Category').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUCustomerCatsFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUCustomerCatsFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Rep}
  CallMaintScreen('A');
end;

procedure TPBLUCustomerCatsFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Rep}
  CallMaintScreen('C');
end;

procedure TPBLUCustomerCatsFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Rep}
  CallMaintScreen('D');
end;

procedure TPBLUCustomerCatsFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintCustomerCatsFrm := TPBMaintCustomerCatsFrm.Create(Self);
  try
    PBMaintCustomerCatsFrm.sFuncMode := sTempFuncMode;
    PBMaintCustomerCatsFrm.iCust := iCust;
    if sTempFuncMode <> 'A' then
      PBMaintCustomerCatsFrm.iCat := detsDBGrid.DataSource.DataSet.fieldbyname('Category').asinteger
    else
      PBMaintCustomerCatsFrm.iCat := 0;

    PBMaintCustomerCatsFrm.ShowModal;
    bTempOK := (PBMaintCustomerCatsFrm.ModalResult = mrOK);
    iTempSel := PBMaintCustomerCatsFrm.iCat;
  finally
    PBMaintCustomerCatsFrm.Free;
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

procedure TPBLUCustomerCatsFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Category').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TPBLUCustomerCatsFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

end.
