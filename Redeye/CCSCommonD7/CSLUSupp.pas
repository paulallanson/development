(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Lookup a Supplier form.

VSS Info:
$Header: /CCSCommon/CSLUSupp.pas 3     14/03/:2 9:48 Paul $
$History: CSLUSupp.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 14/03/:2   Time: 9:48
 * Updated in $/CCSCommon
 * Added option to create file transfer order types
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 13/02/:2   Time: 12:27
 * Updated in $/CCSCommon
 * Updated to the latest 'Broker' versions
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 27/11/:1   Time: 11:41
 * Updated in $/PBL D5
 * See previous comments, booked in prior to closing form in delphi.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:31
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 17/02/:0   Time: 10:34
 * Updated in $/PBL D5
 * Changed to list ALL Suppliers
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 9/02/:0    Time: 10:41
 * Updated in $/PBL D5
 * New insert method and GUIDs to ensure unique new keys when adding.
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 20/12/99   Time: 11:19
 * Updated in $/PBL D5
 * Add a Lookup Panel
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUSupp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, CSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUSuppFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    GoToGrpBox: TGroupBox;
    BranchesBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SelectedSQL: TFDQuery;
    NullSRC: TDataSource;
    GetODueEnqDetsSQL: TFDQuery;
    ActiveOnlyCheckBox: TCheckBox;
    DispPanel: TPanel;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    DBSupText: TDBText;
    DBPhoneText: TDBText;
    DBFaxText: TDBText;
    SelBranchBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
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
    procedure BranchesBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function SelectBranch(Sender: TObject): ByteBool;
    procedure ActiveOnlyCheckBoxClick(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
    procedure SelBranchBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, SelBranch: Integer;
    SelName, SelBranchName: string;
    bIs_Lookup, bAllow_Upd, bSel_Branch, Selected, bODueEnqsOnly: ByteBool;
    dODueDate: TDate;
  end;

var
  CSLUSuppFrm: TCSLUSuppFrm;

implementation

uses CSLUSupBrch, CSMaintSupp, CSDBMemo, CSLUSupOrdType, CSMaintSConta;

{$R *.DFM}

procedure TCSLUSuppFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    if (not bODueEnqsOnly) then
      Caption := 'Lookup a Supplier'
    else
      Caption := 'Lookup Suppliers With Overdue Quotes For: ' +
        DateToStr(dODueDate);
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
    If (not bODueEnqsOnly) then
      SelBranchBitBtn.Visible := True
    else
      SelBranchBitBtn.Visible := False;
    ActiveOnlyCheckBox.Checked := True;
  end
  else
  begin
    Caption := 'Maintain Supplier';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
    SelBranchBitBtn.Visible := False;
    ActiveOnlyCheckBox.Checked := True;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) and
    TestButton('PBMaintSuppBitBtn');
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TCSLUSuppFrm.ShowGrid(Sender: TObject);
begin
  GetDetsSQL.Close;
  GetODueEnqDetsSQL.Close;
  if (not bODueEnqsOnly) then
  begin
    DetsSRC.DataSet := GetDetsSQL;
    with GetDetsSQL do
    begin
      Close;
      ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
      if ActiveOnlyCheckBox.Checked then
        ParamByName('Active_Only').AsString := 'Y'
      else
        ParamByName('Active_Only').AsString := 'N';
    end;
  end
  else
  begin
    DetsSRC.DataSet := GetODueEnqDetsSQL;
    with GetODueEnqDetsSQL do
    begin
      Close;
      ParamByName('Code_From').AsString := NameEdit.Text + '%';
      ParamByName('ODue_Date').AsDateTime := dODueDate;
    end;
  end;
  with DetsSRC.DataSet do
  begin
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    BranchesBitBtn.Enabled := RecordCount > 0;
    if SelBranchBitBtn.visible then
      SelBranchBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUSuppFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUSuppFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUSuppFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
  If SelBranchBitBtn.Visible then
    SelBranchBitBtn.Enabled := True;
end;

procedure TCSLUSuppFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
//if (not SelectBranch(Self)) then Exit;
  SelectCode(Self);
  SelBranch :=
          DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
  SelBranchName :=
          DetsSRC.DataSet.FieldByName('Branch_Name').AsString;
  Close;
end;

procedure TCSLUSuppFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Supplier').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  with SelectedSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := SelCode;
    Open;
    First;
  end;
  Selected := True;
end;

procedure TCSLUSuppFrm.DetsDBGridDblClick(Sender: TObject);
begin
   If bIs_Lookup then
     begin
        if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
          ShowNotes(Self);
        // if (not SelectBranch(Self)) then Exit;
        SelectCode(Self);
        SelBranch :=
            DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
            DetsSRC.DataSet.FieldByName('Branch_Name').AsString;
        Close;
     end
   else
     ChgBitBtnclick(self);
end;

procedure TCSLUSuppFrm.AddBitBtnClick(Sender: TObject);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  SelectCode(Self);
  {Add a new Supplier}

  CSMaintSuppFrm := TCSMaintSuppFrm.Create(Self);
  try
    CSMaintSuppFrm.sFuncMode := 'A';
    CSMaintSuppFrm.ShowModal;
    bTempOK := (CSMaintSuppFrm.ModalResult = mrOK);

    if bTempOK then
    begin
      iTempSel := CSMaintSuppFrm.iCode;

      CSMaintSContaFrm := TCSMaintSContaFrm.Create(Self);
      try
        CSMaintSContaFrm.sFuncMode := 'A';
        CSMaintSContaFrm.iSupp := iTempSel;
        CSMaintSContaFrm.iBranch := 0;

        CSMaintSContaFrm.iCode := 0;
        CSMaintSContaFrm.sSuppName := CSMaintSuppFrm.nameEdit.text;
        CSMaintSContaFrm.sBranchName := 'Head Office';
        CSMaintSContaFrm.PhoneEdit.text := CSMaintSuppFrm.PhoneEdit.text;
        CSMaintSContaFrm.FaxEdit.text := CSMaintSuppFrm.FaxEdit.text;

        CSMaintSContaFrm.ShowModal;
      finally
        CSMaintSContaFrm.Free;
      end;
    end;
  finally
    CSMaintSuppFrm.Free;
  end;

  if bTempOK then
  begin
    ShowGrid(Self);
    FindInGrid(iTempSel);
    NameEdit.SetFocus;
  end;
end;

procedure TCSLUSuppFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier}
  SelectCode(Self);
  CallMaintScreen('C');
end;

procedure TCSLUSuppFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier}
  SelectCode(Self);
  CallMaintScreen('D');
end;

procedure TCSLUSuppFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintSuppFrm := TCSMaintSuppFrm.Create(Self);
  try
    CSMaintSuppFrm.sFuncMode := sTempFuncMode;
    CSMaintSuppFrm.ShowModal;
    bTempOK := (CSMaintSuppFrm.ModalResult = mrOK);
    iTempSel := CSMaintSuppFrm.iCode;
  finally
    CSMaintSuppFrm.Free;
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

procedure TCSLUSuppFrm.FindInGrid(iTempSel: Integer);
begin
  DetsDBGrid.DataSource := NullSRC;
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel <> 0 then
    begin
      while (not (EOF)) and (FieldByName('Supplier').AsInteger <> iTempSel) do
        Next;
    end;
  end;
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TCSLUSuppFrm.BranchesBitBtnClick(Sender: TObject);
begin
  CSLUSupBrchFrm := TCSLUSupBrchFrm.Create(Self);
  try
    CSLUSupBrchFrm.bIs_Lookup := False;
    CSLUSupBrchFrm.bAllow_Upd := True;
    CSLUSupBrchFrm.iSupp := DetsSRC.DataSet.FieldByName('Supplier').AsInteger;
    CSLUSupBrchFrm.sSuppName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUSupBrchFrm.ShowModal;
  finally
    CSLUSupBrchFrm.Free;
  end;
end;

procedure TCSLUSuppFrm.FormCreate(Sender: TObject);
begin
  {Set this if a supplier has already been selected}
  SelCode := 0;
  {Set this if a branch has already been selected}
  SelBranch := 0;
  {Set this if this is a lookup to show the SELECT button etc}
  bIs_Lookup := False;
  {Set this if this to allow ADD/CHANGE/DELETE}
  bAllow_Upd := False;
  {Set this to force the user to select a branch}
  bSel_Branch := False;
  {Set this to only show suppliers with overdue enquiries}
  bODueEnqsOnly := False;
  {Set this to the overdue date - only has effect if above switch is TRUE}
  dODueDate := 0;

  bDisableNameChangeEvent := False;
end;

function TCSLUSuppFrm.SelectBranch(Sender: TObject): ByteBool;
begin
  Result := True;
  if bSel_Branch then
  begin
    CSLUSupBrchFrm := TCSLUSupBrchFrm.Create(Self);
    try
      CSLUSupBrchFrm.bIs_Lookup := bIs_Lookup;
      CSLUSupBrchFrm.bAllow_Upd := bAllow_Upd;
      CSLUSupBrchFrm.bODueEnqsOnly := bODueEnqsOnly;
      CSLUSupBrchFrm.dODueDate := dODueDate;
      CSLUSupBrchFrm.iSupp := DetsSRC.DataSet.FieldByName('Supplier').AsInteger;
      CSLUSupBrchFrm.sSuppName := DetsSRC.DataSet.FieldByName('Name').AsString;
      CSLUSupBrchFrm.ShowModal;
      Result := CSLUSupBrchFrm.bSelected;
      if Result then
      begin
        SelBranch :=
          CSLUSupBrchFrm.DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
          CSLUSupBrchFrm.DetsSRC.DataSet.FieldByName('Name').AsString;
      end;
    finally
      CSLUSupBrchFrm.Free;
    end;
  end;
end;

procedure TCSLUSuppFrm.ActiveOnlyCheckBoxClick(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TCSLUSuppFrm.ShowNotes(Sender: TObject);
begin
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  try
    CSDBMemoFrm.bAllow_Upd := False;
    CSDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    CSDBMemoFrm.ShowModal;
  finally
    CSDBMemoFrm.Free;
  end;
end;

procedure TCSLUSuppFrm.SelBranchBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  if (not SelectBranch(Self)) then Exit;
  SelectCode(Self);
  Close;
end;

procedure TCSLUSuppFrm.BitBtn1Click(Sender: TObject);
begin
  CSLUSupOrdTypeFrm := TCSLUSupOrdTypeFrm.Create(Self);
  try
    CSLUSupOrdTypeFrm.bIs_Lookup := False;
    CSLUSupOrdTypeFrm.bAllow_Upd := True;
    CSLUSupOrdTypeFrm.iSupp := DetsSRC.DataSet.FieldByName('Supplier').AsInteger;
    CSLUSupOrdTypeFrm.sSuppName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUSupOrdTypeFrm.ShowModal;
  finally
    CSLUSupOrdTypeFrm.Free;
  end;
end;

end.
