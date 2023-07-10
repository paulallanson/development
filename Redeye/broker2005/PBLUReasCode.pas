(*******************************************************************************

Copyright (c) Centrereed Ltd 2000

Comments
--------
  Look-Up A Reason Code.

VSS Info:
$Header: /PBL D5/PBLUReasCode.pas 8     20/06/03 9:52 Andrewh $
$History: PBLUReasCode.pas $
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:18
 * Updated in $/PBL D5
 * Changed to add a switch to display Enquiry reasons or PO Reasons
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 28/09/:0   Time: 10:34
 * Created in $/PBL D5
 * Reason Code Look-up
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUReasCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUReasCodeFrm = class(TForm)
    DetsSRC: TDataSource;
    qryGetEnqReason: TQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    qryGetPOReason: TQuery;
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
    procedure TypeRadioGroupClick(Sender: TObject);
  private
    { Private declarations }
    sDescrField, sKeyField, sDescrFieldName: string;
  public
    { Public declarations }
    sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    SelCode: Integer;
    iGroupselect: integer;
  end;

var
  PBLUReasCodeFrm: TPBLUReasCodeFrm;

implementation

uses pbMainMenu, PBMaintReasCode, PBDatabase;

{$R *.DFM}

procedure TPBLUReasCodeFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Reason Code';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Reason Codes';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;

  {Load up the string grid};
  CountLabel.Caption := '';
  if (igroupselect > 0) and (igroupselect < 5) then
      TypeRadioGroup.ItemIndex := igroupselect -1;
(*
  {Load up the string grid};
  ShowGrid(Self);
  if (iSelCode <> 0) then FindInGrid(iSelCode);
*)
  dmBroker.ScreenAccessControl(Self,'mnuReasons',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUReasCodeFrm.ShowGrid(Sender: TObject);
begin
  DetsDBGrid.Columns.Clear;
  DetsDBGrid.Columns.Add;
  DetsDBGrid.Columns[0].FieldName := sDescrField;
  DetsDBGrid.Columns[0].Title.Caption := sDescrFieldName;
  DetsDBGrid.Columns[0].Width := 300;
  with DetsSRC.DataSet do
  begin
    Close;
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUReasCodeFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUReasCodeFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUReasCodeFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.Fields[0].asinteger;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUReasCodeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnClick(Self);
end;

procedure TPBLUReasCodeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Reason_Code};
  CallMaintScreen('A');
end;

procedure TPBLUReasCodeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Reason_Code};
  CallMaintScreen('C');
end;

procedure TPBLUReasCodeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Reason_Code};
  CallMaintScreen('D');
end;

procedure TPBLUReasCodeFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintReasCodeFrm := TPBMaintReasCodeFrm.Create(Self);
  try
    PBMaintReasCodeFrm.sFuncMode := sTempFuncMode;
    PBMaintReasCodeFrm.sDescrField := sDescrField;
    PBMaintReasCodeFrm.sDescrFieldName := sDescrFieldName;
    PBMaintReasCodeFrm.sKeyField := sKeyField;
    PBMaintReasCodeFrm.iCode :=
      DetsSRC.DataSet.FieldByName(sKeyField).AsInteger;
    PBMaintReasCodeFrm.sDescription :=
      DetsSRC.DataSet.Fields[1].asstring;
    PBMaintReasCodeFrm.ShowModal;
    bTempOK := (PBMaintReasCodeFrm.ModalResult = mrOK);
    iTempSel := PBMaintReasCodeFrm.iCode;
  finally
    PBMaintReasCodeFrm.Free;
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

procedure TPBLUReasCodeFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName(sKeyField).AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUReasCodeFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
end;

procedure TPBLUReasCodeFrm.TypeRadioGroupClick(Sender: TObject);
begin
  qryGetEnqReason.Close;
  qryGetPOReason.Close;
  case TypeRadioGroup.ItemIndex of
    0:
      begin
        sDescrField := 'Description';
        sKeyField := 'Enq_Inactive_Reason';
        sDescrFieldname := 'Description';
        DetsSRC.DataSet := qryGetEnqReason;
        Caption := 'Maintain Enquiry Reasons';
      end;
    1:
      begin
        sDescrField := 'Description';
        sKeyField := 'Inactive_Reason';
        sDescrFieldname := 'Description';
        DetsSRC.DataSet := qryGetPOReason;
        Caption := 'Maintain Purchase Order Reasons';
      end;
  end;
  FuncGrpBox.Enabled := True;
  ShowGrid(Self);

end;

end.
