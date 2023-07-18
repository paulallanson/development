(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Select Suppliers form.

VSS Info:
$Header: /PBL D5/PBEnqSelSup.pas 8     21/05/:3 9:40 Janiner $
$History: PBEnqSelSup.pas $
 * 
 * *****************  Version 8  *****************
 * User: Janiner      Date: 21/05/:3   Time: 9:40
 * Updated in $/PBL D5
 * Allow select all and de-select all option for suppliers.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 17/10/:2   Time: 12:41
 * Updated in $/PBL D5
 * Changed to select Suppliers matching the selected Capabilities plus
 * those with the Default_For_All capability set
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 13/09/:2   Time: 11:50
 * Updated in $/PBL D5
 * changed the Supplier search to search on any part of the name not just
 * the begining
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 2/10/:0    Time: 11:52
 * Updated in $/PBL D5
 * Changed to allow the creation of Suppliers whilst selecting suppliers
 * for an enquiry
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 29/09/:0   Time: 17:05
 * Updated in $/PBL D5
 * Removed reference to the Supplier maintenance form
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 27/09/:0   Time: 13:58
 * Updated in $/PBL D5
 * Improve format of screen. Add select bit button to enable maintenance
 * of supplier information, which is then added to the selected grid.
 * Also allow double click of the two grids, to force either a select or
 * de-select action.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 2/02/:0    Time: 15:36
 * Updated in $/PBL D5
 * Set the SQL text of GetSuppsSQL query to a literal string as some BDE
 * bug is making the parameterised version fail in Access.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqSelSup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, DB, DBTables, Grids, DBGrids, ExtCtrls, Menus,
  ComCtrls;

type
  TPBEnqSelSupFrm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    AddBitBtn: TBitBtn;
    RemBitBtn: TBitBtn;
    GetSuppsSQL: TQuery;
    GetSuppsSelSQL: TQuery;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    DelSuppsSQL: TQuery;
    CapableChkBox: TCheckBox;
    UpdSuppsNSQL: TQuery;
    GetSuppSQL: TQuery;
    AddSuppSQL: TQuery;
    UpdSuppYSQL: TQuery;
    GetSuppNameSQL: TQuery;
    CheckCapSQL: TQuery;
    OtherBranchesChkBox: TCheckBox;
    GetLastIntSelSQL: TQuery;
    AddIntSelSQL: TQuery;
    SuppsSRC: TDataSource;
    SuppsDBGrid: TDBGrid;
    DelIntSelsSQL: TQuery;
    SupSelDBGrid: TDBGrid;
    SelSupSRC: TDataSource;
    SelSupSQL: TQuery;
    DelIntSelSQL: TQuery;
    NoOfSuppsLabel: TLabel;
    NoOfSelSupLabel: TLabel;
    Timer1: TTimer;
    WaitLabel: TLabel;
    SelSuppBitBtn: TBitBtn;
    ChkIntSelSQL: TQuery;
    SearchGrpBox: TGroupBox;
    SearchEdit: TEdit;
    AddAllBitBtn: TBitBtn;
    RemAllBitBtn: TBitBtn;
    SelPopUpMenu: TPopupMenu;
    DeSelPopUpMenu: TPopupMenu;
    DeselPopUp: TMenuItem;
    DeSelAllPopUp: TMenuItem;
    Select1: TMenuItem;
    SelectAllpopupbtn: TMenuItem;
    chkbxShowInactive: TCheckBox;
    StatusBar1: TStatusBar;
    procedure ShowSupps(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure SuppsDBLLBClick(Sender: TObject);
    procedure RemBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure LoadSupps(Sender: TObject);
    function GetSuppName(TempSupp, TempBranch: Integer): string;
    function CheckGrid(Tempsel, TempSupp, TempBranch: Integer) :Bytebool;
    procedure UpdSupps(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CapableChkBoxClick(Sender: TObject);
    procedure OtherBranchesChkBoxClick(Sender: TObject);
    procedure SuppsLBClick(Sender: TObject);
    procedure CheckButtons(Sender: TObject);
    function SuppCapable(TempSupp, TempBranch: Integer): ByteBool;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshGrids(Sender: TObject);
    procedure AddCaps(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SelSuppBitBtnClick(Sender: TObject);
    procedure SuppsDBGridDblClick(Sender: TObject);
    procedure SupSelDBGridDblClick(Sender: TObject);
    procedure AddAllBitBtnClick(Sender: TObject);
    procedure RemAllBitBtnClick(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure SelectAllpopupbtnClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure SuppsDBGridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    showingInactive: string;
    procedure BuildGetSuppsQuery;
    procedure displaySupplierLimitWarning;
  public
    { Public declarations }
    iSelCount, iIntSelCode: Integer;
    iSelSupp, iSelBranch: array of Integer;
    iProdType, iCapCount, iEnqNo, iEnqLine: Integer;
    iCaps: array[0..199] of Integer;
  end;

var
  PBEnqSelSupFrm: TPBEnqSelSupFrm;

implementation

uses PBLUSupp;

const
  supplierLimit = 20;

{$R *.DFM}

procedure TPBEnqSelSupFrm.ShowSupps(Sender: TObject);
var
  icount: Integer;
begin
  with DelIntSelsSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    ParamByName('Sel1').AsInteger := 2;
    ExecSQL;
  end;
  {Now write all the suppliers already selected as sel1 = 2}
  for icount := 0 to (iSelCount - 1) do
  begin
    with AddIntSelSQL do
    begin
      Close;
      ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
      ParamByName('Sel1').AsInteger := 2;
      ParamByName('Sel2').AsInteger := iSelSupp[icount];
      ParamByName('Sel3').AsInteger := iSelBranch[icount];
      ParamByName('Sel4').AsInteger := 0;
      ExecSQL;
    end;
  end;
  AddCaps(Self);
  RefreshGrids(Self);
  CheckButtons(Self);
end;

procedure TPBEnqSelSupFrm.AddCaps(Sender: TObject);
var
  icount: Integer;
begin
  with DelIntSelsSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    ParamByName('Sel1').AsInteger := 1;
    ExecSQL;
  end;
  {Only do this bit if you only want capable suppliers}
  if CapableChkBox.Checked then
  begin
    {Now write all the required capabilities as sel1 = 1}
    for icount := 0 to (iCapCount - 1) do
    begin
      with AddIntSelSQL do
      begin
        Close;
        ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
        ParamByName('Sel1').AsInteger := 1;
        ParamByName('Sel2').AsInteger := iCaps[icount];
        ParamByName('Sel3').AsInteger := 0;
        ParamByName('Sel4').AsInteger := 0;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBEnqSelSupFrm.RefreshGrids(Sender: TObject);
begin
  WaitLabel.Visible := True;
  WaitLabel.Refresh;
  {Re-Activate the suppliers query}
  BuildGetSuppsQuery;
  {Activate the selected suppliers query}
  with SelSupSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    NoOfSelSupLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
  CheckButtons(Self);
  WaitLabel.Visible := False;
end;

procedure TPBEnqSelSupFrm.AddBitBtnClick(Sender: TObject);
var
  temploop: integer;
begin
  if  SupSelDBGrid.DataSource.DataSet.RecordCount >= supplierLimit then
  begin
    displaySupplierLimitWarning;
    exit;
  end;

  SuppsDbGrid.Datasource.Dataset.DisableControls;
  for TempLoop := 0 to pred(SuppsDBGrid.SelectedRows.count) do
    begin
      SuppsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(SuppsDBGrid.SelectedRows[TempLoop]));
      {Add a selected supplier into the selected list}
      with AddIntSelSQL do
      begin
        Close;
        ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
        ParamByName('Sel1').AsInteger := 2;
        ParamByName('Sel2').AsInteger :=
          SuppsSRC.DataSet.FieldByName('Supplier').AsInteger;
        ParamByName('Sel3').AsInteger :=
          SuppsSRC.DataSet.FieldByName('Branch_No').AsInteger;
        ParamByName('Sel4').AsInteger := 0;
        ExecSQL;
      end;
    end;
  SuppsDbGrid.Datasource.Dataset.EnableControls;
  {Now delete the suppliers from the left hand side}
  RefreshGrids(Self);
  CheckButtons(Self);
end;

procedure TPBEnqSelSupFrm.SuppsDBLLBClick(Sender: TObject);
begin
  CheckButtons(Self);
end;

procedure TPBEnqSelSupFrm.RemBitBtnClick(Sender: TObject);
var
  Temploop: integer;
begin
  SupSelDbGrid.Datasource.Dataset.DisableControls;
  for TempLoop := 0 to pred(SupSelDbGrid.SelectedRows.count) do
    begin
      SupSelDbGrid.DataSource.DataSet.GotoBookmark(TBookmark(SupSelDbGrid.SelectedRows[TempLoop]));
      {Delete the suppliers from the left hand side}
      with DelIntSelSQL do
      begin
        Close;
        ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
        ParamByName('Sel1').AsInteger := 2;
        ParamByName('Sel2').AsInteger :=
          SelSupSRC.DataSet.FieldByName('Supplier').AsInteger;
        ParamByName('Sel3').AsInteger :=
          SelSupSRC.DataSet.FieldByName('Branch_No').AsInteger;
        ParamByName('Sel4').AsInteger := 0;
        ExecSQL;
      end;
    end;
  SupSelDbGrid.Datasource.Dataset.EnableControls;
  RefreshGrids(Self);
  CheckButtons(Self);
end;

procedure TPBEnqSelSupFrm.OKBitBtnClick(Sender: TObject);
begin
  iSelCount := 0;
  {When OK is clicked, copy the internal to the selected array}
  with SelSupSRC.DataSet do
  begin
    First;
    while (not EOF) do
    begin
      iSelSupp[iSelCount] := FieldByName('Supplier').AsInteger;
      iSelBranch[iSelCount] := FieldByName('Branch_No').AsInteger;
      iSelCount := iSelCount + 1;
      Next;
    end;
  end;
end;

procedure TPBEnqSelSupFrm.LoadSupps(Sender: TObject);
var
  icount: Integer;
begin
  {Load up the suppliers already selected on the enquiry}
  AddBitBtn.Enabled := False;
  RemBitBtn.Enabled := False;
  RemAllBitBtn.Enabled := False;
  AddAllBitBtn.Enabled := False;
  GetSuppsSQL.Close;
  icount := 0;
  {Load the selected array from the file}
  with GetSuppsSelSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := iEnqNo;
    ParamByName('Line').AsInteger := iEnqLine;
    Open;
    First;
    while (not EOF) do
    begin
      iSelSupp[icount] := FieldByName('Supplier').AsInteger;
      iSelBranch[icount] := FieldByName('Branch_No').AsInteger;
      icount := icount + 1;
      Next;
    end;
    iSelCount := icount;
  end;
  {Set the updated flags to N}
  with UpdSuppsNSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := iEnqNo;
    ParamByName('Line').AsInteger := iEnqLine;
    ExecSQL;
  end;
end;

procedure TPBEnqSelSupFrm.UpdSupps(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 0 to (iSelCount - 1) do
  begin
    with GetSuppSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := iEnqNo;
      ParamByName('Line').AsInteger := iEnqLine;
      ParamByName('Supplier').AsInteger := iSelSupp[icount];
      ParamByName('Branch_no').AsInteger := iSelBranch[icount];
      Open;
      First;
      if EOF then
      begin
        with AddSuppSQL do
        begin
          Close;
          ParamByName('Enquiry').AsInteger := iEnqNo;
          ParamByName('Line').AsInteger := iEnqLine;
          ParamByName('Supplier').AsInteger := iSelSupp[icount];
          ParamByName('Branch_no').AsInteger := iSelBranch[icount];
          ExecSQL;
        end;
      end
      else
      begin
        {This is to simply set the updated flag to Y}
        with UpdSuppYSQL do
        begin
          Close;
          ParamByName('Enquiry').AsInteger := iEnqNo;
          ParamByName('Line').AsInteger := iEnqLine;
          ParamByName('Supplier').AsInteger := iSelSupp[icount];
          ParamByName('Branch_no').AsInteger := iSelBranch[icount];
          ExecSQL;
        end;
      end;
    end;
  end;
  {Delete any suppliers where the updated flag is still N}
  with DelSuppsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := iEnqNo;
    ParamByName('Line').AsInteger := iEnqLine;
    ExecSQL;
  end;
end;

function TPBEnqSelSupFrm.GetSuppName(TempSupp, TempBranch: Integer): string;
begin
  with GetSuppNameSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := TempSupp;
    ParamByName('Branch_No').AsInteger := TempBranch;
    Open;
    First;
    Result := Trim(FieldByName('Supp_Name').AsString) + ', ' +
      Trim(FieldByName('Branch_Name').AsString);
  end;
end;

procedure TPBEnqSelSupFrm.FormCreate(Sender: TObject);
var
  icount: Integer;
begin
  setLength(iSelSupp, supplierLimit);
  setLength(iSelBranch, supplierLimit);
  
  {Get a unique internal selection code}
  with GetLastIntSelSQL do
  begin
    Close;
    Open;
    First;
    iIntSelCode := FieldByName('Last_Code').AsInteger + 1;
  end;
  {Write a dummy record for the selection code to stop anyone else using it}
  with AddIntSelSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    ParamByName('Sel1').AsInteger := 0;
    ParamByName('Sel2').AsInteger := 0;
    ParamByName('Sel3').AsInteger := 0;
    ParamByName('Sel4').AsInteger := 0;
    ExecSQL;
  end;
  {Clear the 2 arrays}
  for icount := 0 to (iSelCount - 1) do
  begin
    iSelSupp[icount] := 0;
    iSelBranch[icount] := 0;
  end;

  self.showingInactive := 'N';
end;

procedure TPBEnqSelSupFrm.FormActivate(Sender: TObject);
begin
  {Load up the grids}
  ShowSupps(Self);
  CheckButtons(Self);
  SearchEdit.setFocus;
end;

procedure TPBEnqSelSupFrm.CapableChkBoxClick(Sender: TObject);
begin
  AddCaps(Self);
  RefreshGrids(Self);
end;

procedure TPBEnqSelSupFrm.OtherBranchesChkBoxClick(Sender: TObject);
begin
  RefreshGrids(Self);
end;

procedure TPBEnqSelSupFrm.SuppsLBClick(Sender: TObject);
begin
  CheckButtons(Self);
end;

procedure TPBEnqSelSupFrm.CheckButtons(Sender: TObject);
begin
  {Check if user can add/remove}
  AddBitBtn.Enabled := (SuppsSRC.DataSet.RecordCount > 0);
  RemBitBtn.Enabled := (SelSupSRC.DataSet.RecordCount > 0);
  AddAllBitBtn.Enabled := (SuppsSRC.DataSet.RecordCount > 0);
  RemAllBitBtn.Enabled := (SelSupSRC.DataSet.RecordCount > 0);
end;

function TPBEnqSelSupFrm.SuppCapable(TempSupp, TempBranch: Integer): ByteBool;
var
  icount: Integer;
begin
  {Check if supplier is capable}
  Result := True;
  if (not CapableChkBox.Checked) then
    Exit
  else
  begin
    for icount := 0 to (iCapCount - 1) do
    begin
      with CheckCapSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := TempSupp;
        ParamByName('Branch_No').AsInteger := TempBranch;
        ParamByName('Product_Type').AsInteger := iProdType;
        ParamByName('Capability').AsInteger := iCaps[icount];
        Open;
        if RecordCount < 1 then
        begin
          Result := False;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TPBEnqSelSupFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  icount: Integer;
begin
  for icount := 0 to 2 do
  begin
    {Now clear the workfile}
    with DelIntSelsSQL do
    begin
      Close;
      ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
      ParamByName('Sel1').AsInteger := icount;
      ExecSQL;
    end;
  end;
end;

procedure TPBEnqSelSupFrm.SearchEditChange(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TPBEnqSelSupFrm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  RefreshGrids(Self);
end;

procedure TPBEnqSelSupFrm.BuildGetSuppsQuery;
var
  OtherBranches, LikeName : string;
begin
  { Because of some esoteric bug in the BDE, the GetSuppsSQL parameterised
    query works in SQL Server but although it runs in Access, it doesn't
    return any rows.  The problem seems to be the parameters so to work
    round this bug, we actually generate the query string in here. }
  if OtherBranchesChkBox.Checked then
    OtherBranches := '''Y'''
  else
    OtherBranches := '''N''';
  LikeName := '''%' + SearchEdit.Text + '%''';
  with GetSuppsSQL do
  begin
    Close;
    SQL.Clear;
    SQL.Add
     ('Select SB1.Supplier, SB1.Branch_No, SB1.Name as Branch_Name, ' +
      'S1.Name as Supp_Name ' +
      'From Supplier S1, Supplier_Branch SB1 ' +
      'Where (S1.Supplier = SB1.Supplier) and ' +
      '((S1.Acc_active <> ''N'') or (''' + self.showingInactive + '''=''Y'')) and ' +
      '(Not Exists (Select IS1.Sel2 ' +
      'From Int_Sel IS1 ' +
      'Where (IS1.Int_Sel_Code = ' + IntToStr(iIntSelCode) +') and ' +
      '(IS1.Sel1 = 1) and ' +
      'Not Exists (Select SBPTC1.Supplier ' +
      'From Splr_BrnchPrdct_TypCpblty SBPTC1 ' +
      'Where (SBPTC1.Supplier = SB1.Supplier) and ' +
      '(SBPTC1.Branch_No = SB1.Branch_No) and ' +
      '(SBPTC1.Product_Type = ' + IntToStr(iProdType) + ') and ' +
      '((SBPTC1.Capability = IS1.Sel2) or ' +
      ' (SBPTC1.Capability = (select PTC.Capability ' +
      '                       from Product_TypeCapability PTC' +
      '                       where (PTC.Product_Type = ' + IntToStr(iProdType) + ') and ' +
//      '                             (PTC.Default_For_all = ''Y''))))))) and ' +
      '                             (PTC.Default_For_all = ''N''))))))) and ' +
      '(Not Exists (Select IS2.Sel1 ' +
      'From Int_Sel IS2 ' +
      'Where (IS2.Int_Sel_Code = ' + IntToStr(iIntSelCode) +') and ' +
      '(IS2.Sel1 = 2) and ' +
      '(IS2.Sel2 = S1.Supplier) and ' +
      '((IS2.Sel3 = SB1.Branch_No) or ' +
      '(' + OtherBranches + '= ''N'')))) and ' +
      '(S1.Name Like ' + LikeName + ') ' +
      'Order By S1.Name, SB1.Name ');
    Open;
    NoOfSuppsLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBEnqSelSupFrm.SelSuppBitBtnClick(Sender: TObject);
begin
PBLUSuppFrm := TPBLUSuppFrm.Create(self) ;
PBLUSuppFrm.bIs_Lookup := true ;
PBLUSuppFrm.bAllow_Upd := True ;
PBLUSuppFrm.bSel_Branch := True ;
PBLUSuppFrm.bODueEnqsOnly := false;
//PBLUSuppFrm.bAllow_Select := True;
PBLUSuppFrm.SelCode := 0 ;
PBLUSuppFrm.SelBranch := 0 ;
PBLUSuppFrm.ShowModal ;
If PBLUSuppFrm.Selected then
   begin
    if not checkgrid(iIntSelCode,PBLUSuppFrm.SelCode, PBLUSuppFrm.SelBranch) then
      begin
        with AddIntSelSQL do
          begin
          Close;
          ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
          ParamByName('Sel1').AsInteger := 2;
          ParamByName('Sel2').AsInteger := PBLUSuppFrm.SelCode;
          ParamByName('Sel3').AsInteger := PBLUSuppFrm.SelBranch;
          ParamByName('Sel4').AsInteger := 0;
          ExecSQL;
          end;
        iselcount := iselcount + 1;
        iselsupp[iselcount] := PBLUSuppFrm.SelCode;
        iselBranch[iselcount]:= PBLUSuppFrm.SelBranch;
        end;
        end;
PBLUSuppFrm.Free ;
RefreshGrids(Self);
end;

function TPBEnqSelSupFrm.CheckGrid(Tempsel, TempSupp, TempBranch: Integer): Bytebool;
begin
    with ChkIntSelSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := Tempsel;
    ParamByName('Sel1').AsInteger := 2;
    ParamByName('Sel2').AsInteger := TempSupp;
    ParamByName('Sel3').AsInteger := TempBranch;
    ParamByName('Sel4').AsInteger := 0;
    Open;
     if recordcount > 0 then
         result := true
      else
        result := false;
  end;
end;

procedure TPBEnqSelSupFrm.SuppsDBGridDblClick(Sender: TObject);
begin
  AddBitBtnClick(Self);
end;

procedure TPBEnqSelSupFrm.SupSelDBGridDblClick(Sender: TObject);
begin
  RemBitBtnClick(Self);
end;

procedure TPBEnqSelSupFrm.AddAllBitBtnClick(Sender: TObject);
begin
  if SuppsDBGrid.DataSource.DataSet.RecordCount +
    SupSelDBGrid.DataSource.DataSet.RecordCount > supplierLimit then
  begin
    displaySupplierLimitWarning;
    exit;
  end;

With SuppsSrc.Dataset do
     begin
     First ;
     While EOF = False do
           begin
           SuppsDBGrid.SelectedRows.CurrentRowSelected := True ;
           Next ;
           end;
     NoOfSuppsLabel.Caption := IntToStr(RecordCount) + ' items';
     end;
AddBitBtnClick(Self);
end;

procedure TPBEnqSelSupFrm.RemAllBitBtnClick(Sender: TObject);
begin
With SelSupSrc.Dataset do
     begin
     First ;
     While EOF = False do
           begin
           SupSelDBGrid.SelectedRows.CurrentRowSelected := True ;
           Next ;
           end;
     NoOfSelSupLabel.Caption := IntToStr(RecordCount) + ' items';
     end;
RemBitBtnClick(Self);
end;

procedure TPBEnqSelSupFrm.Select1Click(Sender: TObject);
begin
AddBitbtnclick(self);
end;

procedure TPBEnqSelSupFrm.SelectAllpopupbtnClick(Sender: TObject);
begin
AddAllBitBtnClick(Self);
end;

procedure TPBEnqSelSupFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  if self.chkbxShowInactive.Checked then
    self.showingInactive := 'Y'
  else
    self.showingInactive := 'N';

  RefreshGrids(Self);
end;

procedure TPBEnqSelSupFrm.SuppsDBGridCellClick(Column: TColumn);
begin
  if SuppsDBGrid.SelectedRows.Count +
    SupSelDBGrid.DataSource.DataSet.RecordCount > supplierLimit then
  begin
    displaySupplierLimitWarning;
    SuppsDBGrid.SelectedRows.CurrentRowSelected := false;
  end;
end;

procedure TPBEnqSelSupFrm.FormShow(Sender: TObject);
begin
  self.StatusBar1.Panels[0].Text := 'You may assign upto '
    + IntToStr(supplierLimit) + ' suppliers to an enquiry.';
end;

procedure TPBEnqSelSupFrm.displaySupplierLimitWarning;
begin
  messageDlg('You cannot assign more than ' + IntToStr(supplierLimit)
    + ' suppliers to an enquiry.', mtWarning, [mbOK], 0);
end;

end.
