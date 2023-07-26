(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Job Type.

VSS Info:
$Header: /PBL D5/PBLUAddCharges.pas 12    20/06/03 9:52 Andrewh $
$History: PBLUAddCharges.pas $


*******************************************************************************)
unit PBLUJobType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUJobTypeFrm = class(TForm)
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
  PBLUJobTypeFrm: TPBLUJobTypeFrm;

implementation

uses PBMaintPrdTyp, PBMaintAddChrgs, PBDBMemo, pbMainMenu, PBDatabase,
  PBMaintJobType;

{$R *.DFM}

procedure TPBLUJobTypeFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Job Type';
    SelectBitBtn.Visible := True;
    dbgrdDets.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
  end
  else
  begin
    Caption := 'Maintain Job Types';
    SelectBitBtn.Visible := False;
  end;
  {Load up the string grid};
  ShowGrid(Self);
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuJobTypes',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUJobTypeFrm.ShowGrid(Sender: TObject);
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

procedure TPBLUJobTypeFrm.SearchTimerTimer(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TPBLUJobTypeFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUJobTypeFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUJobTypeFrm.SelectCode(Sender: TObject);
begin
  Selected := True;
  Close;
end;

procedure TPBLUJobTypeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUJobTypeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TPBLUJobTypeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TPBLUJobTypeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TPBLUJobTypeFrm.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
begin
  PBMaintJobTypeFrm := TPBMaintJobTypeFrm.Create(Self);
  try
    PBMaintJobTypeFrm.sFuncMode := sTempFuncMode;

    if sTempFuncMode[1] in ['C', 'D'] then
    begin
      PBMaintJobTypeFrm.SelCode := DetsSRC.DataSet.FieldByName('Job_type').AsInteger;
      PBMaintJobTypeFrm.edtdescription.Text :=
        DetsSRC.DataSet.FieldByName('Job_Type_Description').AsString;

      PBMaintJobTypeFrm.chkbxOneDelivery.checked :=
        (DetsSRC.DataSet.FieldByName('One_Delivery_only').asString = 'Y');

      PBMaintJobTypeFrm.chkbxDeliverToStock.checked :=
        (DetsSRC.DataSet.FieldByName('Can_Deliver_to_Stock').asString = 'Y');
        
      PBMaintJobTypeFrm.chkbxRepCanConvert.checked :=
        (DetsSRC.DataSet.FieldByName('Rep_Can_Convert_Enquiry').asString = 'Y');
    end;

    PBMaintJobTypeFrm.sFuncMode := sTempFuncMode;
    PBMaintJobTypeFrm.ShowModal;
    iTempSel := PBMaintJobTypeFrm.SelCode;
  finally
    PBMaintJobTypeFrm.Free;
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

procedure TPBLUJobTypeFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Job_type').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUJobTypeFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
end;

procedure TPBLUJobTypeFrm.SetChargeType(const Value: String);
begin
  FChargeType := Value;
end;

procedure TPBLUJobTypeFrm.dbgrdDetsDblClick(Sender: TObject);
begin
  chgBitBtnClick(self);
end;

procedure TPBLUJobTypeFrm.dbgrdDetsCellClick(Column: TColumn);
begin
//  CheckBtns(Self) ;
end;

procedure TPBLUJobTypeFrm.CheckBtns(Sender: TObject);
begin
    SelectBitBtn.Enabled := dbgrdDets.SelectedRows.Count > 0;
    ChgBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
    DelBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
end;

procedure TPBLUJobTypeFrm.dbgrdDetsColEnter(Sender: TObject);
begin
  SelectBitBtn.Enabled := True;
end;

end.
