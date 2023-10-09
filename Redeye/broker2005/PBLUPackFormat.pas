(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Job Type.

VSS Info:
$Header: /PBL D5/PBLUAddCharges.pas 12    20/06/03 9:52 Andrewh $
$History: PBLUAddCharges.pas $


*******************************************************************************)
unit PBLUPackFormat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUPackFormatFrm = class(TForm)
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
    chkbxActiveOnly: TCheckBox;
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
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure dbgrdDetsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  PBLUPackFormatFrm: TPBLUPackFormatFrm;

implementation

uses UITypes, pbMainMenu, PBDatabase, PBMaintPackFormat;

{$R *.DFM}

procedure TPBLUPackFormatFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Pack Format';
    SelectBitBtn.Visible := True;
    dbgrdDets.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
  end
  else
  begin
    Caption := 'Maintain Pack Formats';
    SelectBitBtn.Visible := False;
  end;
  {Load up the string grid};
  ShowGrid(Self);
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuPackFormats',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUPackFormatFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
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

procedure TPBLUPackFormatFrm.SearchTimerTimer(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TPBLUPackFormatFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUPackFormatFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUPackFormatFrm.SelectCode(Sender: TObject);
begin
  Selected := True;
  Close;
end;

procedure TPBLUPackFormatFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUPackFormatFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TPBLUPackFormatFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TPBLUPackFormatFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TPBLUPackFormatFrm.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
begin
  PBMaintPackFormatFrm := TPBMaintPackFormatFrm.Create(Self);
  try
    PBMaintPackFormatFrm.sFuncMode := sTempFuncMode;

    if CharInSet(sTempFuncMode[1], ['C', 'D']) then
    begin
      PBMaintPackFormatFrm.SelCode := DetsSRC.DataSet.FieldByName('ID').AsInteger;
      PBMaintPackFormatFrm.edtdescription.Text :=
        DetsSRC.DataSet.FieldByName('Pack_Format_Description').AsString;
      PBMaintPackFormatFrm.chkbxInactive.checked := DetsSRC.DataSet.FieldByName('inactive').AsString = 'Y';
    end;

    PBMaintPackFormatFrm.sFuncMode := sTempFuncMode;
    PBMaintPackFormatFrm.ShowModal;
    iTempSel := PBMaintPackFormatFrm.SelCode;
  finally
    PBMaintPackFormatFrm.Free;
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

procedure TPBLUPackFormatFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('ID').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUPackFormatFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
end;

procedure TPBLUPackFormatFrm.SetChargeType(const Value: String);
begin
  FChargeType := Value;
end;

procedure TPBLUPackFormatFrm.dbgrdDetsDblClick(Sender: TObject);
begin
  chgBitBtnClick(self);
end;

procedure TPBLUPackFormatFrm.dbgrdDetsCellClick(Column: TColumn);
begin
//  CheckBtns(Self) ;
end;

procedure TPBLUPackFormatFrm.CheckBtns(Sender: TObject);
begin
    SelectBitBtn.Enabled := dbgrdDets.SelectedRows.Count > 0;
    ChgBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
    DelBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
end;

procedure TPBLUPackFormatFrm.dbgrdDetsColEnter(Sender: TObject);
begin
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUPackFormatFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TPBLUPackFormatFrm.dbgrdDetsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgrdDets.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

end.
