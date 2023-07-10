(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up a Branch Name.

VSS Info:
$Header: /PBL D5/PBLUBranch.pas 15    20/06/03 9:52 Andrewh $
$History: PBLUBranch.pas $
 * 
 * *****************  Version 15  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 14  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 13  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:14
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 2/10/:2    Time: 9:59
 * Updated in $/PBL D5
 * Need to pass the customer telephone number in case the contact tel no
 * is not set up.
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
 * 
 * *****************  Version 7  *****************
 * User: Davidn       Date: 13/06/02   Time: 13:38
 * Updated in $/PBL D5
 * Fixed Cust search function on Customer Enquiry, look up wasn't working.
 * Also passed text in search field to LUCustFrm when called so it doesn't
 * have to be typed again. Finally when LUBranch is called to find a
 * customer branch the account codee for the head office was always being
 * returned, changed it to return the account code of the selected branch.
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 22/01/:2   Time: 14:34
 * Updated in $/PBL D5
 * Ensure re-display panel details after going to branches or assign reps,
 * as reps name may have changed/been deleted.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 17/01/:2   Time: 10:11
 * Updated in $/PBL D5
 * Improve glyphs and show reps name.
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
unit PBLUBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, DBCtrls,
  ComCtrls;

type
  TPBLUBranchFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
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
    RepLabel: TLabel;
    DBRepText: TDBText;
    OpenDialog1: TOpenDialog;
    pnlImport: TPanel;
    lblImport: TLabel;
    ProgressBar1: TProgressBar;
    lblProgress: TLabel;
    qryInsBranch: TQuery;
    qryUpdBranch: TQuery;
    qrySelBranch: TQuery;
    qryNextBranch: TQuery;
    btbtnImport: TBitBtn;
    chkbxShowInactive: TCheckBox;
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
    procedure btbtnImportClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
    procedure ParseBranchDtls(tempStr: string; var Name, Code,
      Addr1, Addr2, Addr3, Addr4, PostCode: string; var HOInd: integer);
    function BranchExists(code: string; var branchNo: integer): boolean;
    procedure InsertBranch(custNo, branchNo: integer; Name, Code,
      Addr1, Addr2, Addr3, Addr4, PostCode: string; HOInd: integer);
    procedure UpdateBranch(custNo, branchNo: integer; Name, Code,
      Addr1, Addr2, Addr3, Addr4, PostCode: string; HOInd: integer);
  public
    { Public declarations }
    SelCode, iCust: Integer;
    SelName, sCustName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  PBLUBranchFrm: TPBLUBranchFrm;

implementation

uses pbDatabase, PBMaintBranch, pbMainMenu, PBLUCConta, PBLUCRep, PBDBMemo,
  PBLUFormRef;

{$R *.DFM}

procedure TPBLUBranchFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Branch';
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
    btbtnImport.visible := false;
  end
  else
  begin
    Caption := 'Maintain Customer Branches';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
    btbtnImport.visible := true;
  end;
  CustLabel.Caption := 'Customer: ' + sCustName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  ThisChkBox.Visible := bIs_Lookup;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
//  ThisChkBox.Checked := ((bIs_Lookup) and (SelCode = 0));
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUBranchFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if chkbxShowInactive.checked then
      Parambyname('inactive').asstring := 'N'
    else
      Parambyname('inactive').asstring := 'Y';

    ParamByName('Customer').AsInteger := iCust;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    ContactsBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUBranchFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUBranchFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUBranchFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUBranchFrm.SelectBitBtnClick(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
end;

procedure TPBLUBranchFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TPBLUBranchFrm.DetsDBGridDblClick(Sender: TObject);
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

procedure TPBLUBranchFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TPBLUBranchFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TPBLUBranchFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TPBLUBranchFrm.CallMaintScreen(sTempFuncMode: string);
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
  PBMaintBranchFrm := TPBMaintBranchFrm.Create(Self);
  try
    PBMaintBranchFrm.sFuncMode := sTempFuncMode;
    PBMaintBranchFrm.iCust := iCust;
    if sTempFuncMode <> 'A' then
      PBMaintBranchFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Branch_No').AsInteger
    else
      PBMaintBranchFrm.iCode := 0;
    PBMaintBranchFrm.sCustName := sCustName;
    PBMaintBranchFrm.ShowModal;
    bTempOK := (PBMaintBranchFrm.ModalResult = mrOK);
    iTempSel := PBMaintBranchFrm.iCode;
  finally
    PBMaintBranchFrm.Free;
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

procedure TPBLUBranchFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  DetsDbGrid.visible := false;
  try
    with GetDetsSQL do
    begin
      First;
      if iTempSel = -1 then Exit;
      while (not (EOF)) and (FieldByName('Branch_No').AsInteger <> iTempSel) do
        Next;
    end;
  finally
    DetsDbGrid.visible := true;
  end;
end;

procedure TPBLUBranchFrm.ThisChkBoxClick(Sender: TObject);
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

procedure TPBLUBranchFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUBranchFrm.ContactsBitBtnClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Self);
  try
    PBLUCContaFrm.bIs_Lookup := False;
    PBLUCContaFrm.bAllow_Upd := True;
    PBLUCContaFrm.iCust := iCust;
    PBLUCContaFrm.sCustName := sCustName;
    PBLUCContaFrm.iBranch := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    PBLUCContaFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBLUCContaFrm.sCustTelNo := DetsSRC.DataSet.FieldByName('Phone').AsString;
    PBLUCContaFrm.ShowModal;
  finally
    PBLUCContaFrm.Free;
  end;
end;

procedure TPBLUBranchFrm.CRepsBitBtnClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Self);
  try
    PBLUCRepFrm.bIs_Lookup := False;
    PBLUCRepFrm.bAllow_Upd := True;
    PBLUCRepFrm.iCust := iCust;
    PBLUCRepFrm.sCustName := sCustName;
    PBLUCRepFrm.iBranch := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    PBLUCRepFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBLUCRepFrm.ShowModal;
  finally
    PBLUCRepFrm.Free;
  end;
  ShowGrid(Self);
end;

procedure TPBLUBranchFrm.ShowNotes(Sender: TObject);
begin
  if DetsSRC.DataSet.FieldByName('Branch_No').AsInteger = 0 then Exit;
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBDBMemoFrm.bAllow_Upd := False;
    PBDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    PBDBMemoFrm.ShowModal;
  finally
    PBDBMemoFrm.Free;
  end;
end;

procedure TPBLUBranchFrm.FormRefBitBtnClick(Sender: TObject);
begin
  PBLUFormRefFrm := TPBLUFormRefFrm.Create(Self);
  try
    PBLUFormRefFrm.bIs_Lookup := False;
    PBLUFormRefFrm.bAllow_Upd := True;
    PBLUFormRefFrm.iCust := iCust;
    PBLUFormRefFrm.sCustName := sCustName;
    PBLUFormRefFrm.iBranch :=
      DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    PBLUFormRefFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBLUFormRefFrm.ShowModal;
  finally
    PBLUFormRefFrm.Free;
  end;
end;

procedure TPBLUBranchFrm.btbtnImportClick(Sender: TObject);
var
  brnchFile: textFile;
  tempStr, Name, Code, Addr1, Addr2, Addr3, Addr4, PostCode: string;
  custNo, branchNo, HOInd: integer;
  recCount, recInx: integer;
begin
  //open file
  if self.OpenDialog1.Execute then
  begin                   
    AssignFile(brnchFile, self.OpenDialog1.FileName);
  end
  else
  begin
    exit;
  end;

  //count records
  Reset(brnchFile);
  readLn(brnchFile, tempStr);
  recCount := 0;
  repeat
    readLn(brnchFile, tempStr);
    recCount := recCount + 1;
  until EOF(brnchFile);

  if recCount <> 0 then
  begin
    self.ProgressBar1.Max := recCount;
    pnlImport.BringToFront;
    pnlImport.Visible := true;
    Reset(brnchFile);
    readLn(brnchFile, tempStr);
    recInx := 0;
    custNo := self.GetDetsSQL.fieldbyname('customer').AsInteger;
    //repeat
    repeat
      readLn(brnchFile, tempStr);
      recInx := recInx + 1;
      self.ParseBranchDtls(tempStr, Name, Code, Addr1, Addr2, Addr3, Addr4,
        PostCode, HOInd);
      self.lblImport.Caption :=
        'Importing: ' + Code + ': ' + Name;
      //check existance
      if self.BranchExists(code, branchNo) then
      begin
        //update branch details
        UpdateBranch(custNo, branchNo, Name,
                     Code, Addr1, Addr2, Addr3, Addr4, PostCode, HOInd);
      end
      else
      begin
        //insert branch details
        InsertBranch(custNo, branchNo, Name,
                     Code, Addr1, Addr2, Addr3, Addr4, PostCode, HOInd);
      end;
      //increament counters refresh display
      self.ProgressBar1.StepIt;
      self.lblProgress.Caption :=
        IntToStr(recInx) + ' of ' + IntToStr(recCount) + ' Records Imported.';
      self.pnlImport.Repaint
    //until end of file
    until EOF(brnchFile);
  end
  else
  begin
    MessageDlg('The File is empty.', mtError, [mbOK], 0);
  end;

  CloseFile(brnchFile);

  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
  self.pnlImport.Visible := false;  
end;

procedure TPBLUBranchFrm.ParseBranchDtls(tempStr: string; var Name, Code,
      Addr1, Addr2, Addr3, Addr4, PostCode: string; var HOInd: integer);
var
  commaPos, quotePos, fieldInx: integer;
  tempField: string;
begin
  fieldInx := 0;

  while fieldInx < 11 do
  begin
    fieldInx := fieldInx + 1;
    commaPos := pos(',', tempStr);
    quotePos := pos('"', tempStr);

    if quotePos = 1 then
    begin
      delete(tempStr, 1, 1);
      quotePos := pos('"', tempStr);
      tempField := copy(tempStr, 1, quotePos - 1);
      delete(tempStr, 1, quotePos + 1);
    end
    else
    begin
      if commaPos <> 0 then
      begin
        tempField := copy(tempStr, 1, commaPos - 1);
        delete(tempStr, 1, commaPos);
      end
      else
      begin
        tempField := tempStr;
      end;
    end;

    case fieldInx of
      1: Code := tempField;
      2: Name := tempField;
      3: Addr1 := tempField;
      4: Addr2 := tempField;
      5: Addr3 := tempField;
      6: Addr4 := tempField;
      7: if tempField <> '' then Addr4 := Addr4 + ', ' + tempField;
      8: PostCode := tempField;
      9: ;
      10:
      begin
        if tempField <> '' then
          HOInd := StrToInt(tempField)
        else
          HOInd := -1;
      end;
    end;
  end;
end;

function TPBLUBranchFrm.BranchExists(code: string;
  var branchNo: integer): boolean;
begin
  self.qrySelBranch.close;
  self.qrySelBranch.ParamByName('customer').asInteger :=
    self.GetDetsSQL.FieldByName('customer').asInteger;
  self.qrySelBranch.ParamByName('code').asString := code;
  self.qrySelBranch.open;

  if self.qrySelBranch.RecordCount > 0 then
  begin
    branchNo := self.qrySelBranch.FieldByName('Branch_no').asInteger;
    result := true;
  end
  else
  begin
    self.qryNextBranch.Close;
    self.qryNextBranch.ParamByName('customer').asInteger :=
      self.GetDetsSQL.FieldByName('customer').asInteger;
    self.qryNextBranch.Open;
    branchNo := self.qryNextBranch.FieldByName('next_branch').asInteger;
    self.qryNextBranch.Close;
    result := false;
  end;

  self.qrySelBranch.close;
end;

procedure TPBLUBranchFrm.InsertBranch(custNo, branchNo: integer; Name,
  Code, Addr1, Addr2, Addr3, Addr4, PostCode: string; HOInd: integer);
begin
  self.qryInsBranch.ParamByName('custNo').asInteger := custNo;
  self.qryInsBranch.ParamByName('branchNo').asInteger := branchNo;
  self.qryInsBranch.ParamByName('name').asString := name;
  self.qryInsBranch.ParamByName('addr1').asString := addr1;
  self.qryInsBranch.ParamByName('addr2').asString := addr2;
  self.qryInsBranch.ParamByName('addr3').asString := addr3;
  self.qryInsBranch.ParamByName('addr4').asString := addr4;
  self.qryInsBranch.ParamByName('postCode').asString := postcode;
  self.qryInsBranch.ParamByName('phone').asString := '0';
  self.qryInsBranch.ParamByName('code').asString := code;
  if HOInd = -1 then
    self.qryInsBranch.ParamByName('HOInd').clear
  else
    self.qryInsBranch.ParamByName('HOInd').asInteger := HOInd;

  self.qryInsBranch.ExecSQL;
end;

procedure TPBLUBranchFrm.UpdateBranch(custNo, branchNo: integer; Name,
  Code, Addr1, Addr2, Addr3, Addr4, PostCode: string; HOInd: integer);
begin
  self.qryUpdBranch.ParamByName('name').asString := name;
  self.qryUpdBranch.ParamByName('addr1').asString := addr1;
  self.qryUpdBranch.ParamByName('addr2').asString := addr2;
  self.qryUpdBranch.ParamByName('addr3').asString := addr3;
  self.qryUpdBranch.ParamByName('addr4').asString := addr4;
  self.qryUpdBranch.ParamByName('postCode').asString := postcode;
  self.qryUpdBranch.ParamByName('code').asString := code;
  if HOInd = -1 then
    self.qryUpdBranch.ParamByName('HOInd').clear
  else
    self.qryUpdBranch.ParamByName('HOInd').asInteger := HOInd;

  self.qryUpdBranch.ParamByName('custNo').asInteger := custNo;
  self.qryUpdBranch.ParamByName('branchNo').asInteger := branchNo;

  self.qryUpdBranch.ExecSQL
end;

procedure TPBLUBranchFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

end.
