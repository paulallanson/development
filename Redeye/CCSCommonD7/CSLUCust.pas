(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up a Customer Name.

VSS Info:
$Header: /CCSCommon/CSLUCust.pas 6     18/06/:3 9:05 Paul $
$History: CSLUCust.pas $
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 18/06/:3   Time: 9:05
 * Updated in $/CCSCommon
 * Changed so that double clicking the grid will activate the select.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 10/04/03   Time: 16:05
 * Updated in $/CCSCommon
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 5/06/02    Time: 16:33
 * Updated in $/CCSCommon
 * Modified the customer look up so that it works the same way as in
 * Broker.
 * The select button noe returns the customer no along with the head
 * office branch details, or the branch button can be selected to choose a
 * different branch.
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 11/01/:1   Time: 15:31
 * Updated in $/CCSCommon
 * Add customer discount look-up button
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 11/01/:1   Time: 14:30
 * Updated in $/CCSCommon
 * Add Cost Centre button
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:58
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:41
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:08
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 25/07/:0   Time: 17:11
 * Updated in $/PBL D5
 * Changed to wrap the Branch Maint form create in a try, finally, end
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 10/12/99   Time: 15:40
 * Updated in $/PBL D5
 * Changed to re-activate double click
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 10/12/99   Time: 14:22
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, CSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUCustFrm = class(TForm)
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
    GoToGrpBox: TGroupBox;
    BranchesBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SelectedSQL: TFDQuery;
    NullSRC: TDataSource;
    ActiveOnlyCheckBox: TCheckBox;
    DispPanel: TPanel;
    DBCustText: TDBText;
    DBPhoneText: TDBText;
    DBFaxText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    CstCntrBitBtn: TBitBtn;
    DiscBitBtn: TBitBtn;
    SelBranchBitBtn: TBitBtn;
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
    procedure ThisChkBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function SelectBranch(Sender: TObject): ByteBool;
    procedure ActiveOnlyCheckBoxClick(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
    procedure CstCntrBitBtnClick(Sender: TObject);
    procedure DiscBitBtnClick(Sender: TObject);
    procedure SelBranchBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode, SelBranch: Integer;
    SelName, SelBranchName: string;
    bIs_Lookup, bAllow_Upd, bSel_Branch, Selected, SelectedBranch: ByteBool;
  end;

var
  CSLUCustFrm: TCSLUCustFrm;

implementation

uses CSMaintCust, CSLUBranch, CSDBMemo, CSLUCustCstCntr, CSLUCustDisc,
  CSMaintCConta, CSMaintCRep;

{$R *.DFM}

procedure TCSLUCustFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  SelectedBranch := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer';
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
    SelBranchBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customers';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
    SelBranchBitBtn.Visible := False;
  end;
{$IFDEF BROKER}
  FuncGrpBox.Visible := (bAllow_Upd) and
    PBMenuMainFrm.TestButton('CSMaintCustBitBtn');
{$ELSE}
  FuncGrpBox.Visible := (bAllow_Upd) and
    TestButton('PBMaintCustBitBtn');
{$ENDIF}
  ThisChkBox.Visible := (iThisCode <> 0);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  ThisChkBox.Checked := ((iThisCode <> 0) and (iThisCode = SelCode));
end;

procedure TCSLUCustFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if ActiveOnlyCheckBox.Checked then
      ParamByName('Active_Only').AsString := 'Y'
    else
      ParamByName('Active_Only').AsString := 'N';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    SelBranchBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    BranchesBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUCustFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSLUCustFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUCustFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
  SelBranchBitBtn.Enabled := True;
end;

procedure TCSLUCustFrm.SelectBitBtnClick(Sender: TObject);
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
end;

procedure TCSLUCustFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  with SelectedSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := SelCode;
    Open;
    First;
  end;
  Selected := True;
end;

procedure TCSLUCustFrm.DetsDBGridDblClick(Sender: TObject);
begin
   If bIs_Lookup then
     begin
       If DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0  then
         ShowNotes(Self) ;
//       If (not SelectBranch(Self)) then exit ;
       SelectCode(Self) ;
       SelBranch :=
            DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
       SelBranchName :=
            DetsSRC.DataSet.FieldByName('Branch_Name').AsString;
       Close ;
     end
   else
     ChgBitBtnclick(self);
end;

procedure TCSLUCustFrm.AddBitBtnClick(Sender: TObject);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  {Add a new customer}

  CSMaintCustFrm := TCSMaintCustFrm.Create(Self);
  try
    CSMaintCustFrm.sFuncMode := 'A';
    CSMaintCustFrm.ShowModal;
    bTempOK := (CSMaintCustFrm.ModalResult = mrOK);
    iTempSel := CSMaintCustFrm.iCode;

    if bTempOK then
    begin
      CSMaintCContaFrm := TCSMaintCContaFrm.Create(Self);
      try
        CSMaintCContaFrm.sFuncMode := 'A';
        CSMaintCContaFrm.iCust := iTempSel;
        CSMaintCContaFrm.iBranch := 0;

        CSMaintCContaFrm.iCode := 0;
        CSMaintCContaFrm.sCustName := CSMaintCustFrm.NameEdit.text;
        CSMaintCContaFrm.sBranchName := 'Head Office';
        CSMaintCContaFrm.PhoneEdit.text := CSMaintCustFrm.PhoneEdit.text;
        CSMaintCContaFrm.FaxEdit.text := CSMaintCustFrm.FaxEdit.text;

        CSMaintCContaFrm.ShowModal;
      finally
        CSMaintCContaFrm.Free;
      end;

      CSMaintCRepFrm := TCSMaintCRepFrm.Create(Self);
      try
        CSMaintCRepFrm.sFuncMode := 'A';
        CSMaintCRepFrm.iCust := iTempSel;
        CSMaintCRepFrm.iBranch := 0;

        CSMaintCRepFrm.iCode := 0;
        CSMaintCRepFrm.sCustName := CSMaintCustFrm.NameEdit.text;
        CSMaintCRepFrm.sBranchName := 'Head Office';
        CSMaintCRepFrm.ShowModal;
      finally
        CSMaintCRepFrm.Free;
      end;
    end;
  finally
    CSMaintCustFrm.Free;
  end;

  if bTempOK then
  begin
    ShowGrid(Self);
    FindInGrid(iTempSel);
    NameEdit.SetFocus;
  end;
end;

procedure TCSLUCustFrm.ChgBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  {Change a customer}
  CallMaintScreen('C');
end;

procedure TCSLUCustFrm.DelBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  {Delete a customer}
  CallMaintScreen('D');
end;

procedure TCSLUCustFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintCustFrm := TCSMaintCustFrm.Create(Self);
  try
    CSMaintCustFrm.sFuncMode := sTempFuncMode;
    CSMaintCustFrm.ShowModal;
    bTempOK := (CSMaintCustFrm.ModalResult = mrOK);
    iTempSel := CSMaintCustFrm.iCode;
  finally
    CSMaintCustFrm.Free;
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

procedure TCSLUCustFrm.FindInGrid(iTempSel: Integer);
begin
  DetsDBGrid.DataSource := NullSRC;
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel <> 0 then
    begin
      while (not (EOF)) and (FieldByName('Customer').AsInteger <> iTempSel) do
        Next;
    end;
  end;
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TCSLUCustFrm.BranchesBitBtnClick(Sender: TObject);
begin
  CSLUBranchFrm := TCSLUBranchFrm.Create(Self);
  try
    CSLUBranchFrm.bIs_Lookup := False;
    CSLUBranchFrm.bAllow_Upd := True;
    CSLUBranchFrm.iCust := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
    CSLUBranchFrm.sCustName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUBranchFrm.ShowModal;
  finally
    CSLUBranchFrm.Free;
  end;
end;

procedure TCSLUCustFrm.ThisChkBoxClick(Sender: TObject);
begin
  {If checked, disable the grid etc}
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

procedure TCSLUCustFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

function TCSLUCustFrm.SelectBranch(Sender: TObject): ByteBool;
begin
  Result := True;
  if bSel_Branch then
  begin
    CSLUBranchFrm := TCSLUBranchFrm.Create(Self);
    try
      CSLUBranchFrm.bIs_Lookup := True;
      CSLUBranchFrm.bAllow_Upd := True;
      CSLUBranchFrm.iCust := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
      CSLUBranchFrm.sCustName := DetsSRC.DataSet.FieldByName('Name').AsString;
      CSLUBranchFrm.ShowModal;
      Result := CSLUBranchFrm.bSelected;
      if Result then
      begin
        SelBranch :=
          CSLUBranchFrm.DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
          CSLUBranchFrm.DetsSRC.DataSet.FieldByName('Name').AsString;
      end;
    finally
      CSLUBranchFrm.Free;
    end;
  end;
end;

procedure TCSLUCustFrm.ActiveOnlyCheckBoxClick(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TCSLUCustFrm.ShowNotes(Sender: TObject);
var
  CSLUDBMemoFrm: TCSDBMemoFrm;
begin
  CSLUDBMemoFrm := TCSDBMemoFrm.Create(Self);
  try
    CSLUDBMemoFrm.bAllow_Upd := False;
    CSLUDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    CSLUDBMemoFrm.ShowModal;
  finally
    CSLUDBMemoFrm.Free;
  end;
end;

procedure TCSLUCustFrm.CstCntrBitBtnClick(Sender: TObject);
begin
  CSLUCustCstCntrFrm := TCSLUCustCstCntrFrm.Create(Self);
  try
    CSLUCustCstCntrFrm.bIs_Lookup := False;
    CSLUCustCstCntrFrm.bAllow_Upd := True;
    CSLUCustCstCntrFrm.iCust := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
    CSLUCustCstCntrFrm.sCustName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUCustCstCntrFrm.ShowModal;
  finally
    CSLUCustCstCntrFrm.Free;
  end;
end;

procedure TCSLUCustFrm.DiscBitBtnClick(Sender: TObject);
begin
  CSLUCustDiscFrm := TCSLUCustDiscFrm.Create(Self);
  try
    CSLUCustDiscFrm.bIs_Lookup := False;
    CSLUCustDiscFrm.bAllow_Upd := True;
    CSLUCustDiscFrm.iCust := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
    CSLUCustDiscFrm.sCustName := DetsSRC.DataSet.FieldByName('Name').AsString;
    CSLUCustDiscFrm.ShowModal;
  finally
    CSLUCustDiscFrm.Free;
  end;
end;

procedure TCSLUCustFrm.SelBranchBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
  if (not SelectBranch(Self)) then
    begin
      SelectedBranch := false;
      Exit;
    end
  else
    SelectedBranch := true;
  Close;
end;

end.
