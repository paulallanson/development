(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up An Additional Charge.

VSS Info:
$Header: /PBL D5/PBLUAddCharges.pas 12    20/06/03 9:52 Andrewh $
$History: PBLUAddCharges.pas $
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:14
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 1/11/:2    Time: 15:06
 * Updated in $/PBL D5
 * Changed to correct problem of not enabling the Change and Delete
 * buttons.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 17/09/02   Time: 16:46
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 6/09/:2    Time: 17:06
 * Updated in $/PBL D5
 * Added operator permissions
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 22/08/:2   Time: 16:13
 * Updated in $/PBL D5
 * changed maintenance screen to display the values with 2 dec places,
 * also to only enable OK button when all fields have been entered
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 8/08/02    Time: 14:35
 * Updated in $/PBL D5
 * Modified PO/Additional Charge maintenance.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 7/08/02    Time: 15:10
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 15/09/:0   Time: 10:53
 * Created in $/PBL D5
 * Initial takeon of Invoice Additional Charges Lookup and Maintenance
 * forms
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUAddCharges;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUAddChrgFrm = class(TForm)
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
  CSLUAddChrgFrm: TCSLUAddChrgFrm;

implementation

uses STDatabase, CSMaintAddChrgs;

{$R *.DFM}

procedure TCSLUAddChrgFrm.FormActivate(Sender: TObject);
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
end;

procedure TCSLUAddChrgFrm.ShowGrid(Sender: TObject);
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

procedure TCSLUAddChrgFrm.SearchTimerTimer(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TCSLUAddChrgFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUAddChrgFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TCSLUAddChrgFrm.SelectCode(Sender: TObject);
begin
  Selected := True;
  Close;
end;

procedure TCSLUAddChrgFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
  end
  else
    chgbitbtnclick(Self);
end;

procedure TCSLUAddChrgFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TCSLUAddChrgFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TCSLUAddChrgFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TCSLUAddChrgFrm.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
begin
  CSMaintAddChrgsFrm := TCSMaintAddChrgsFrm.Create(Self);
  try
    CSMaintAddChrgsFrm.sFuncMode := sTempFuncMode;

    if sTempFuncMode[1] in ['C', 'D'] then
    begin
      CSMaintAddChrgsFrm.SelCode := DetsSRC.DataSet.FieldByName('Additional_Charge').AsInteger;
      CSMaintAddChrgsFrm.edtdescription.Text :=
        DetsSRC.DataSet.FieldByName('Details').AsString;
      CSMaintAddChrgsFrm.memCost.Text := formatfloat('0.00',DetsSRC.DataSet.FieldByName('Amount').Asfloat);
      CSMaintAddChrgsFrm.memSell.Text := formatfloat('0.00',DetsSRC.DataSet.FieldByName('Quotation_Price').Asfloat);
    end;

    CSMaintAddChrgsFrm.sFuncMode := sTempFuncMode;
    CSMaintAddChrgsFrm.ShowModal;
    iTempSel := CSMaintAddChrgsFrm.SelCode;
  finally
    CSMaintAddChrgsFrm.Free;
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

procedure TCSLUAddChrgFrm.FindInGrid(iTempSel: Integer);
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

procedure TCSLUAddChrgFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
end;

procedure TCSLUAddChrgFrm.SetChargeType(const Value: String);
begin
  FChargeType := Value;
end;

procedure TCSLUAddChrgFrm.dbgrdDetsDblClick(Sender: TObject);
begin
  chgBitBtnClick(self);
end;

procedure TCSLUAddChrgFrm.dbgrdDetsCellClick(Column: TColumn);
begin
//  CheckBtns(Self) ;
end;

procedure TCSLUAddChrgFrm.CheckBtns(Sender: TObject);
begin
    SelectBitBtn.Enabled := dbgrdDets.SelectedRows.Count > 0;
    ChgBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
    DelBitBtn.Enabled := dbgrdDets.SelectedRows.Count = 1;
end;

procedure TCSLUAddChrgFrm.dbgrdDetsColEnter(Sender: TObject);
begin
  SelectBitBtn.Enabled := True;
end;

end.
