(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up a Branch Name.

VSS Info:
$Header: /CCSCommon/CSLUBranch.pas 2     5/06/02 16:33 Davidn $
$History: CSLUBranch.pas $
 * 
 * *****************  Version 2  *****************
 * User: Davidn       Date: 5/06/02    Time: 16:33
 * Updated in $/CCSCommon
 * Modified the customer look up so that it works the same way as in
 * Broker.
 * The select button noe returns the customer no along with the head
 * office branch details, or the branch button can be selected to choose a
 * different branch.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:58
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 18/10/00   Time: 11:00
 * Updated in $/PBL D5
 * Set form position to screen centre.
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:04
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 21/01/:0   Time: 10:42
 * Updated in $/PBL D5
 * Display 'name' etc in panel
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, CSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUBranchFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    CountLabel: TLabel;
    ThisChkBox: TCheckBox;
    FuncGrpBox: TGroupBox;
    DelBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    AddBitBtn: TBitBtn;
    GoToGrpBox: TGroupBox;
    ContactsBitBtn: TBitBtn;
    CRepsBitBtn: TBitBtn;
    FormRefBitBtn: TBitBtn;
    DispPanel: TPanel;
    DBBranchText: TDBText;
    DBBPhoneText: TDBText;
    DBBFaxText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    dtsDummy: TDataSource;
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
    procedure ContactsBitBtnClick(Sender: TObject);
    procedure CRepsBitBtnClick(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
    procedure FormRefBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iCust: Integer;
    SelName, sCustName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  CSLUBranchFrm: TCSLUBranchFrm;

implementation

uses CSMaintCust, CSMaintBranch, CSLUCConta, CSLUCRep, CSDBMemo,
  CSLUFormRef;

{$R *.DFM}

procedure TCSLUBranchFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Branch';
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer Branches';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := 'Customer: ' + sCustName;
  FuncGrpBox.Visible := (bAllow_Upd) and
    TestButton('PBMaintCustBitBtn');
  ThisChkBox.Visible := bIs_Lookup;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
  ThisChkBox.Checked := ((bIs_Lookup) and (SelCode = 0));
end;

procedure TCSLUBranchFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    ContactsBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUBranchFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUBranchFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUBranchFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUBranchFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
end;

procedure TCSLUBranchFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TCSLUBranchFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
      ShowNotes(Self);
    SelectCode(Self);
    Close;
  end
  else
    chgbitbtnclick(Self);
end;

procedure TCSLUBranchFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TCSLUBranchFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TCSLUBranchFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TCSLUBranchFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  if (sTempFuncMode = 'D') and
    (DetsSRC.DataSet.FieldByName('Branch_No').AsInteger = 0) then
  begin
    MessageDlg('You can''t delete the main (head office) address details',
      mtError, [mbOK], 0);
    Exit;
  end;
  CSMaintBranchFrm := TCSMaintBranchFrm.Create(Self);
  try
    CSMaintBranchFrm.sFuncMode := sTempFuncMode;
    CSMaintBranchFrm.iCust := iCust;
    if sTempFuncMode <> 'A' then
      CSMaintBranchFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Branch_No').AsInteger
    else
      CSMaintBranchFrm.iCode := 0;
    CSMaintBranchFrm.sCustName := sCustName;
    CSMaintBranchFrm.ShowModal;
    bTempOK := (CSMaintBranchFrm.ModalResult = mrOK);
    iTempSel := CSMaintBranchFrm.iCode;
  finally
    CSMaintBranchFrm.Free;
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

procedure TCSLUBranchFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  DetsDBGrid.datasource := dtsDummy;
  try
    with GetDetsSQL do
    begin
      First;
      if iTempSel = -1 then Exit;
      while (not (EOF)) and (FieldByName('Branch_No').AsInteger <> iTempSel) do
        Next;
    end;
  finally
    DetsDBGrid.datasource := DetsSRC;
  end;
end;

procedure TCSLUBranchFrm.ThisChkBoxClick(Sender: TObject);
begin
  {If checked, disable the grid etc};
  //DetsDBGrid.Enabled := ( not (ThisChkBox.Checked)) ;
  SearchGrpBox.Enabled := (not (ThisChkBox.Checked));
  if ThisChkBox.Checked then
  begin
    bDisableNameChangeEvent := True;
    NameEdit.Text := '';
    bDisableNameChangeEvent := False;
    ShowGrid(Self);
    FindInGrid(0);
  end
  else
    FindInGrid(-1)
end;

procedure TCSLUBranchFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TCSLUBranchFrm.ContactsBitBtnClick(Sender: TObject);
begin
  CSLUCContaFrm := TCSLUCContaFrm.Create(Self);
  try
    CSLUCContaFrm.bIs_Lookup := False;
    CSLUCContaFrm.bAllow_Upd := True;
    CSLUCContaFrm.iCust := iCust;
    CSLUCContaFrm.sCustName := sCustName;
    CSLUCContaFrm.iBranch := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    CSLUCContaFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUCContaFrm.ShowModal;
  finally
    CSLUCContaFrm.Free;
  end;
end;

procedure TCSLUBranchFrm.CRepsBitBtnClick(Sender: TObject);
begin
  CSLUCRepFrm := TCSLUCRepFrm.Create(Self);
  try
    CSLUCRepFrm.bIs_Lookup := False;
    CSLUCRepFrm.bAllow_Upd := True;
    CSLUCRepFrm.iCust := iCust;
    CSLUCRepFrm.sCustName := sCustName;
    CSLUCRepFrm.iBranch := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    CSLUCRepFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUCRepFrm.ShowModal;
  finally
    CSLUCRepFrm.Free;
  end;
end;

procedure TCSLUBranchFrm.ShowNotes(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Branch_No').AsInteger = 0 then Exit;
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  try
    CSDBMemoFrm.bAllow_Upd := False;
    CSDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    CSDBMemoFrm.ShowModal;
  finally
    CSDBMemoFrm.Free;
  end;
end;

procedure TCSLUBranchFrm.FormRefBitBtnClick(Sender: TObject);
begin
  CSLUFormRefFrm := TCSLUFormRefFrm.Create(Self);
  try
    CSLUFormRefFrm.bIs_Lookup := False;
    CSLUFormRefFrm.bAllow_Upd := True;
    CSLUFormRefFrm.iCust := iCust;
    CSLUFormRefFrm.sCustName := sCustName;
    CSLUFormRefFrm.iBranch :=
      DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    CSLUFormRefFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUFormRefFrm.ShowModal;
  finally
    CSLUFormRefFrm.Free;
  end;
end;

end.
