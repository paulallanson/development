(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up A Proof Statsu.

VSS Info:
$Header: /PBL D5/PBLUProofStatus.pas 8     20/06/03 9:52 Andrewh $
$History: PBLUProofStatus.pas $
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
 * User: Paul         Date: 26/11/:1   Time: 16:00
 * Updated in $/PBL D5
 * Now allows the specifying of the Default Approval Print Status
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 23/11/:1   Time: 15:26
 * Created in $/PBL D5
 * New Proof Status maintenance form and lookup
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:23
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 14:57
 * Updated in $/PBL D5
 * Change field Price_Unit from char to integer so we can have more than 9
 * price units.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUProofStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUProofStatusFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
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
    UpStatSQL: TFDQuery;
    GetDetsSQLProof_Status: TStringField;
    GetDetsSQLDescription: TStringField;
    GetDetsSQLProof_Approval_Status: TStringField;
    GetDetsSQLProof_Description: TStringField;
    DummySRC: TDataSource;
    GetDetsSQLProof_Approved: TStringField;
    chkbxActiveOnly: TCheckBox;
    GetDetsSQLinactive: TStringField;
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
    procedure SetDefault(sTempSel: string; bDefault: bytebool);
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
    procedure GetDetsSQLProof_DescriptionGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode, sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUProofStatusFrm: TPBLUProofStatusFrm;

implementation

uses pbDatabase, PBMaintProofStatus, pbMainMenu;

{$R *.DFM}

procedure TPBLUProofStatusFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Proof Status';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Proof Status';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuProof',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUProofStatusFrm.ShowGrid(Sender: TObject);
begin
  DetsDBGrid.DataSource := DummySRC;
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
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TPBLUProofStatusFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUProofStatusFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUProofStatusFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUProofStatusFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUProofStatusFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Proof_Status').AsString;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUProofStatusFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUProofStatusFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUProofStatusFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUProofStatusFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUProofStatusFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  bDefault: ByteBool;
  sTempSel: string;
begin
  PBMaintProofStatusFrm := TPBMaintProofStatusFrm.Create(Self);
  try
    PBMaintProofStatusFrm.sFuncMode := sTempFuncMode;
    PBMaintProofStatusFrm.ShowModal;
    bTempOK := (PBMaintProofStatusFrm.ModalResult = mrOK);
    sTempSel := PBMaintProofStatusFrm.sCode;
    bDefault := PBMaintProofStatusFrm.chkbxDefault.checked
  finally
    PBMaintProofStatusFrm.Free;
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

procedure TPBLUProofStatusFrm.SetDefault(sTempSel: string ;bDefault: bytebool);
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
        if GetDetsSQl.fieldbyname('Proof_Status').asstring = sTempSel then
          begin
            next;
            continue;
          end;

        UpStatSQL.close;
        if (GetDetsSQl.fieldbyname('Proof_Approval_Status').asstring = 'Y') and
           (bDefault) then
          UpStatSQl.parambyname('Proof_Approval_Status').asstring := 'N'
        else
          UpStatSQl.parambyname('Proof_Approval_Status').asstring := GetDetsSQl.fieldbyname('Proof_Approval_Status').asstring;

        UpStatSQl.parambyname('Proof_Status').asstring := GetDetsSQl.fieldbyname('Proof_Status').asstring;
        UpStatSQL.execSQL;
        next;
      end;
  end;
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TPBLUProofStatusFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Proof_Status').AsString <> sTempSel) do
      Next;
  end;
end;

procedure TPBLUProofStatusFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBLUProofStatusFrm.GetDetsSQLProof_DescriptionGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if GetDetsSQLProof_Approval_Status.asstring = 'Y' then
    text := GetDetsSQLDescription.asstring + ' (Default)'
  else
    text := GetDetsSQLDescription.asstring;
end;

procedure TPBLUProofStatusFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showgrid(self);
end;

procedure TPBLUProofStatusFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DetsDBGrid.datasource.dataset.fieldByName('InActive').AsString = 'Y') then
  with (Sender as TDBGrid) do
  begin
    Canvas.Brush.Color := Color;
    Canvas.Font.Color := Font.Color;
    Canvas.Font.Style := [fsStrikeout];
  end;
end;

end.
