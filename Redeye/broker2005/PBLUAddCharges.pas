unit PBLUAddCharges;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUAddChrgFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    Panel1: TPanel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    CountLabel: TLabel;
    dbgrdDets: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
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
    procedure dbgrdDetsDblClick(Sender: TObject);
    procedure dbgrdDetsCellClick(Column: TColumn);
    procedure CheckBtns(Sender: TObject);
    procedure dbgrdDetsColEnter(Sender: TObject);
  private
    FChargeType: String;
    procedure SetChargeType(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelDescription: string;
    SelCost, SelCharge: double;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    property ChargeType: String read FChargeType write SetChargeType;
  end;

var
  PBLUAddChrgFrm: TPBLUAddChrgFrm;

implementation

uses PBMaintPrdTyp, PBMaintAddChrgs, PBDBMemo, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUAddChrgFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup an Additional Charge';
    SelectBitBtn.Visible := True;
    dbgrdDets.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
  end
  else
  begin
    Caption := 'Maintain Additional Charges';
    SelectBitBtn.Visible := False;
  end;
  {Load up the string grid};
  ShowGrid(Self);
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuAddCharges',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUAddChrgFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUAddChrgFrm.SearchTimerTimer(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TPBLUAddChrgFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUAddChrgFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUAddChrgFrm.SelectCode(Sender: TObject);
begin
  Selected := True;
  Close;
end;

procedure TPBLUAddChrgFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUAddChrgFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TPBLUAddChrgFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TPBLUAddChrgFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TPBLUAddChrgFrm.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
begin
  PBMaintAddChrgsFrm := TPBMaintAddChrgsFrm.Create(Self);
  try
    PBMaintAddChrgsFrm.sFuncMode := sTempFuncMode;

    if CharInSet(sTempFuncMode[1], ['C', 'D']) then
    begin
      PBMaintAddChrgsFrm.SelCode := DetsSRC.DataSet.FieldByName('Additional_Charge').AsInteger;
      PBMaintAddChrgsFrm.edtdescription.Text :=
        DetsSRC.DataSet.FieldByName('Details').AsString;
      PBMaintAddChrgsFrm.memCost.Text := formatfloat('0.00',DetsSRC.DataSet.FieldByName('Amount').Asfloat);
      PBMaintAddChrgsFrm.memSell.Text := formatfloat('0.00',DetsSRC.DataSet.FieldByName('Quotation_Price').Asfloat);
    end;

    PBMaintAddChrgsFrm.sFuncMode := sTempFuncMode;
    PBMaintAddChrgsFrm.ShowModal;
    iTempSel := PBMaintAddChrgsFrm.SelCode;
  finally
    PBMaintAddChrgsFrm.Free;
  end;
  if iTempSel <> 0 then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      //if bIs_Lookup then
      //  SelectCode(Self);
    end;
  end;
end;

procedure TPBLUAddChrgFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Additional_charge').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUAddChrgFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
end;

procedure TPBLUAddChrgFrm.SetChargeType(const Value: String);
begin
  FChargeType := Value;
end;

procedure TPBLUAddChrgFrm.dbgrdDetsDblClick(Sender: TObject);
begin
  chgBitBtnClick(self);
end;

procedure TPBLUAddChrgFrm.dbgrdDetsCellClick(Column: TColumn);
begin
//  CheckBtns(Self) ;
end;

procedure TPBLUAddChrgFrm.CheckBtns(Sender: TObject);
begin
    SelectBitBtn.Enabled := dbgrdDets.SelectedRows.Count > 0;
    ChgBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
    DelBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
end;

procedure TPBLUAddChrgFrm.dbgrdDetsColEnter(Sender: TObject);
begin
  SelectBitBtn.Enabled := True;
end;

end.
