(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Lookup a Supplier form.

VSS Info:
$Header: /PBL D5/PBLUSupp.pas 18    20/06/03 9:53 Andrewh $
$History: PBLUSupp.pas $
 * 
 * *****************  Version 18  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 17  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 16  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 15  *****************
 * User: Andrewh      Date: 9/01/03    Time: 10:38
 * Updated in $/PBL D5
 * Hide labels button when in "lookup" mode.
 * 
 * *****************  Version 14  *****************
 * User: Andrewh      Date: 8/01/03    Time: 12:03
 * Updated in $/PBL D5
 * Add labels print button.
 * 
 * *****************  Version 13  *****************
 * User: Andrewh      Date: 6/09/02    Time: 13:14
 * Updated in $/PBL D5
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 15/07/02   Time: 9:42
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 15/07/02   Time: 9:41
 * Updated in $/PBL D5
 * Add NOTES and ENQUIRY security settings.
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
unit PBLUSupp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, pbSupplierDm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSuppFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    dbgDetails: TDBGrid;
    SearchGrpBox: TGroupBox;
    edtName: TEdit;
    tmrSearch: TTimer;
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
    DispPanel: TPanel;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    DBSupText: TDBText;
    DBPhoneText: TDBText;
    DBFaxText: TDBText;
    SelBranchBitBtn: TBitBtn;
    chkbxShowInactive: TCheckBox;
    LabelsBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure dbgDetailsColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(Mode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure BranchesBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function SelectBranch(Sender: TObject): ByteBool;
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
    procedure SelBranchBitBtnClick(Sender: TObject);
    procedure LabelsBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dtmdlAllSuppliers: TdtmdlSuppliers;
    bDisableNameChangeEvent: ByteBool;
    procedure SetButtons(Sender: TObject; Field: TField);
  public
    { Public declarations }
    SelCode, SelBranch, SelCourier: Integer;
    SelName, SelBranchName: string;
    bIs_Lookup, bAllow_Upd, bSel_Branch, Selected, bODueEnqsOnly: ByteBool;
    dODueDate: TDate;
  end;

var
  PBLUSuppFrm: TPBLUSuppFrm;

implementation

uses PBLUSupBrch, PBMaintSupp, PBDBMemo, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUSuppFrm.FormActivate(Sender: TObject);
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
    chkbxShowInactive.Checked := True;
    LabelsBitBtn.Visible := False ;
  end
  else
  begin
    Caption := 'Maintain Supplier';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
    SelBranchBitBtn.Visible := False;
    chkbxShowInactive.Checked := True;
    LabelsBitBtn.Visible := True ;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  edtname.Text := '';
  {Load up the string grid}
//  ShowGrid(Self);
  edtName.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUSuppFrm.ShowGrid(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  dtmdlAllSuppliers.ShowInactive := not(chkbxShowInactive.checked);
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUSuppFrm.edtNameChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  dtmdlAllSuppliers.SupplierName := edtName.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUSuppFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
//  ShowGrid(Self);
  dtmdlAllSuppliers.refreshdata;
end;

procedure TPBLUSuppFrm.dbgDetailsColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
  If SelBranchBitBtn.Visible then
    SelBranchBitBtn.Enabled := True;
end;

procedure TPBLUSuppFrm.SelectBitBtnClick(Sender: TObject);
begin
  if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
//if (not SelectBranch(Self)) then Exit;
  SelectCode(Self);
  SelBranch :=
          dbgDetails.datasource.DataSet.FieldByName('Branch_No').AsInteger;
  SelBranchName :=
          dbgDetails.datasource.DataSet.FieldByName('Branch_Name').AsString;
  SelCourier := dbgDetails.datasource.DataSet.FieldByName('Courier').Asinteger;
  Close;
end;

procedure TPBLUSuppFrm.SelectCode(Sender: TObject);
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Supplier').AsInteger;
  SelName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
  with SelectedSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := SelCode;
    Open;
    First;
  end;
  Selected := True;
end;

procedure TPBLUSuppFrm.dbgDetailsDblClick(Sender: TObject);
begin
   If bIs_Lookup then
     begin
        if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
          ShowNotes(Self);
        // if (not SelectBranch(Self)) then Exit;
        SelectCode(Self);
        SelBranch :=
            dbgDetails.datasource.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
            dbgDetails.datasource.DataSet.FieldByName('Branch_Name').AsString;
        SelCourier :=
            dbgDetails.datasource.DataSet.FieldByName('Courier').Asinteger;
        Close;
     end
   else
     ChgBitBtnclick(self);
end;

procedure TPBLUSuppFrm.AddBitBtnClick(Sender: TObject);
begin
//  SelectCode(Self);
  {Add a new Supplier}
  CallMaintScreen('A');
end;

procedure TPBLUSuppFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier}
//  SelectCode(Self);
  CallMaintScreen('C');
end;

procedure TPBLUSuppFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier}
//  SelectCode(Self);
  CallMaintScreen('D');
end;

procedure TPBLUSuppFrm.CallMaintScreen(Mode: string);
var
  bTempOK: ByteBool;
  iTemp: Integer;
begin
  PBMaintSuppFrm := TPBMaintSuppFrm.Create(Self);
  try
    PBMaintSuppFrm.dtmdlOneSupplier := dtmdlAllSuppliers;
    if Mode = 'A' then
      PBMaintSuppFrm.iSupplier := 0
    else
      PBMaintSuppFrm.iSupplier := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;
    PBMaintSuppFrm.sFuncMode := Mode;
    PBMaintSuppFrm.ShowModal;
    bTempOK := (PBMaintSuppFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintSuppFrm.iCode;
        if Mode = 'A' then
          edtName.text := PBMaintSuppFrm.NameEdit.text
        else
          begin
            dtmdlAllSuppliers.refreshdata;
            dbgDetails.DataSource.DataSet.Locate('Supplier', Variant(inttostr(iTemp)),[lopartialKey]) ;
          end;
      end;
  finally
    PBMaintSuppFrm.Free;
  end;
end;

procedure TPBLUSuppFrm.FindInGrid(iTempSel: Integer);
begin
(*  DetsDBGrid.DataSource := NullSRC;
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
*)
end;

procedure TPBLUSuppFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSuppliers do
  begin
    AddBitBtn.Enabled := true;
    ChgBitBtn.Enabled := HeaderCount > 0;
    DelBitBtn.Enabled := HeaderCount > 0;
    BranchesBitBtn.Enabled := HeaderCount > 0;
    LabelsBitBtn.Enabled := HeaderCount > 0;
    CountLabel.Caption := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBLUSuppFrm.BranchesBitBtnClick(Sender: TObject);
begin
  PBLUSupBrchFrm := TPBLUSupBrchFrm.Create(Self);
  try
    PBLUSupBrchFrm.bIs_Lookup := False;
    PBLUSupBrchFrm.bAllow_Upd := True;
    PBLUSupBrchFrm.iSupp := dbgDetails.datasource.DataSet.FieldByName('Supplier').AsInteger;
    PBLUSupBrchFrm.sSuppName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUSupBrchFrm.ShowModal;
  finally
    PBLUSupBrchFrm.Free;
  end;
end;

procedure TPBLUSuppFrm.FormCreate(Sender: TObject);
begin
  dtmdlAllSuppliers := TdtmdlSuppliers.create(self);
  dtmdlAllSuppliers.dtsSuppliers.OnDataChange := SetButtons;
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

  dbgDetails.datasource := dtmdlAllSuppliers.dtsSuppliers;
  dbSupText.datasource := dtmdlAllSuppliers.dtsSuppliers;
  dbPhoneText.datasource := dtmdlAllSuppliers.dtsSuppliers;
  dbFaxText.datasource := dtmdlAllSuppliers.dtsSuppliers;
  
  bDisableNameChangeEvent := False;
end;

function TPBLUSuppFrm.SelectBranch(Sender: TObject): ByteBool;
begin
  Result := True;
  if bSel_Branch then
  begin
    PBLUSupBrchFrm := TPBLUSupBrchFrm.Create(Self);
    try
      PBLUSupBrchFrm.bIs_Lookup := bIs_Lookup;
      PBLUSupBrchFrm.bAllow_Upd := bAllow_Upd;
      PBLUSupBrchFrm.bODueEnqsOnly := bODueEnqsOnly;
      PBLUSupBrchFrm.dODueDate := dODueDate;
      PBLUSupBrchFrm.iSupp := dbgDetails.datasource.DataSet.FieldByName('Supplier').AsInteger;
      PBLUSupBrchFrm.sSuppName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
      PBLUSupBrchFrm.ShowModal;
      Result := PBLUSupBrchFrm.bSelected;
      if Result then
      begin
        SelBranch :=
          PBLUSupBrchFrm.DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
          PBLUSupBrchFrm.DetsSRC.DataSet.FieldByName('Name').AsString;
      end;
    finally
      PBLUSupBrchFrm.Free;
    end;
  end;
end;

procedure TPBLUSuppFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  ShowGrid(Self);
end;

procedure TPBLUSuppFrm.ShowNotes(Sender: TObject);
begin
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBDBMemoFrm.bAllow_Upd := False;
    PBDBMemoFrm.LoadMemoData(dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    PBDBMemoFrm.ShowModal;
  finally
    PBDBMemoFrm.Free;
  end;
end;

procedure TPBLUSuppFrm.SelBranchBitBtnClick(Sender: TObject);
begin
  if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  if (not SelectBranch(Self)) then Exit;
  SelectCode(Self);
  Close;
end;

procedure TPBLUSuppFrm.LabelsBitBtnClick(Sender: TObject);
begin
(*  PBRSCusSupLabsFrm := TPBRSCusSupLabsFrm.Create(Self);
  try
    {Select mode as customer/supplier} ;
    PBRSCusSupLabsFrm.bCustomer := False;
    {Feed in the supplier code} ;
    PBRSCusSupLabsFrm.iCode := DetsSRC.DataSet.FieldByName('Supplier').AsInteger;
    PBRSCusSupLabsFrm.sName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBRSCusSupLabsFrm.ShowModal;
  finally
    PBRSCusSupLabsFrm.Free;
  end;
*)
end;

procedure TPBLUSuppFrm.FormDestroy(Sender: TObject);
begin
  dtmdlAllSuppliers.free;
end;

procedure TPBLUSuppFrm.FormShow(Sender: TObject);
begin
  dtmdlAllSuppliers.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Supplier', Variant(inttostr(selcode)),[lopartialKey]) ;
  edtName.setfocus;
end;

end.
