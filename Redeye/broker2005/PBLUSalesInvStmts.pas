unit PBLUSalesInvStmts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, ComCtrls, ToolWin, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, PBPOObjects, Data.DB, System.ImageList, FireDAC.Stan.Param;

type
  TPBLUSalesInvStmtsFrm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    DetsDBGrid: TDBGrid;
    Label1: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    SIStatusBar: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnPrint: TToolButton;
    btnClose: TToolButton;
    btnSelect: TToolButton;
    btnRemove: TToolButton;
    ImgHot: TImageList;
    ImgCool: TImageList;
    ToolButton2: TToolButton;
    pMnuGeneral: TPopupMenu;
    Print1: TMenuItem;
    SelectAll1: TMenuItem;
    Statements1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    SearchTimer: TTimer;
    CustomerLbl: TLabel;
    grpInvDate: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DateFromEdit: TEdit;
    DateToEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    Label2: TLabel;
    cmbStatements: TComboBox;
    btnClear: TBitBtn;
    chkbxShowUnpaid: TCheckBox;
    procedure btnCustomerClick(Sender: TObject);
    procedure edtCustomerChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure GetStatements(Sender: TObject);
    procedure InitialiseDate(Sender: TObject);
    procedure cmbStatementsChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure cmbStatementsClick(Sender: TObject);
    procedure chkbxShowUnpaidClick(Sender: TObject);
  private
    { Private declarations }
    FCustLUActivated, FActivated: Boolean;
    DateFrom, DateTo: TDateTime;
    StatementList: TStringList;
    Reprint: boolean;
    procedure ShowGrid;
    procedure GetCustomer;
    procedure SelectionChanged;
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
    SelCode: real;
    SelLine, iCust, iCustBranch: Integer;
    sCustBranchName, sCustName: string;
  end;

var
  PBLUSalesInvStmtsFrm: TPBLUSalesInvStmtsFrm;

implementation

uses UITypes, PBLUCust, PBLUSInvDM, DateSelV5, PBRSCustState, pbMainMenu, CCSCommon;

{$R *.DFM}

procedure TPBLUSalesInvStmtsFrm.btnCustomerClick(Sender: TObject);
begin
  FCustLUActivated := true;
  PBLUCustfrm := TPBLUCustfrm.Create(Owner);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;

    PBLUCustfrm.Selcode := iCust;
    PBLUCustfrm.SelBranch := iCustBranch;

    PBLUCustfrm.SelName := sCustName;
    PBLUCustfrm.SelBranchName := sCustBranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      icust := PBLUCustfrm.Selcode;
      sCustName := PBLUCustfrm.SelName;
      iCustBranch := PBLUCustfrm.SelBranch;
      sCustBranchName := PBLUCustfrm.SelBranchName;
      CustomerLbl.caption := 'Name: '+sCustName+'/'+sCustBranchName;
      if PBLUCustFrm.SelAccount <> '' then
        edtCustomer.text := PBLUCustFrm.SelAccount
      else
        edtCustomer.Text := sCustName;

      {Now Get the details}
      GetStatements(self);
      SelectionChanged;
    end;
  finally
    PBLUCustfrm.Free;
    FCustLUActivated := false;
  end;
end;

procedure TPBLUSalesInvStmtsFrm.edtCustomerChange(Sender: TObject);
begin
   if not FCustLUActivated then
    begin
      SearchTimer.Enabled := False;
      SearchTimer.Enabled := True;
      if Sender is TEdit then
      with TEdit(Sender) do
      begin
        dmLookupSInv.Customer := Trim(Text);
      end;
    end;
end;

procedure TPBLUSalesInvStmtsFrm.ShowGrid;
begin
  dmLookUpSInv.RefreshData;
  with dmLookUpSInv do
  begin
    DetsSRC.DataSet.Open;
    btnPrint.enabled := (recordcount > 0);
    btnSelect.enabled := (recordcount > 0);
    btnRemove.enabled := (recordcount > 0) and Reprint;
    SIStatusBar.panels[0].text := IntToStr(RecordCount) + ' invoices displayed';
  end;
end;

procedure TPBLUSalesInvStmtsFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    DetsDBGrid.DataSource := dmLookUpSInv.DetsSRC;
    btnCustomer.SetFocus;
    Initialisedate(self);
    FActivated := true;
  end;
end;

procedure TPBLUSalesInvStmtsFrm.InitialiseDate(Sender: TObject);
begin
    DateTo := Date;
    DateToEdit.Text := PBDatestr(DateTo);
    DateFrom := Date - 30;
    DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBLUSalesInvStmtsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  GetCustomer;
end;

procedure TPBLUSalesInvStmtsFrm.GetCustomer;
begin
  with dmLookUpSInv.GetCustSQL do
    begin
      close;
      parambyname('Code_from').asstring := '%'+edtCustomer.text+'%';
      open;
      if recordcount = 1 then
        begin
          sCustName := fieldbyname('Customer_Name').asstring;
          sCustBranchName := fieldbyname('Branch_Name').asstring;
          CustomerLbl.caption := 'Name: '+sCustName+'/'+sCustBranchName;
          iCust := fieldbyname('Customer').asinteger;
          iCustBranch := fieldbyname('Branch_no').asinteger;
          GetStatements(self);
          SelectionChanged;
        end
      else
        begin
          dmLookupSInv.DetsSRC.DataSet.close;
          grpInvDate.enabled := false;
          CustomerLbl.caption := 'Name: ';
          iCust := 0;
          iCustBranch := 0;
        end;
    end;
end;

procedure TPBLUSalesInvStmtsFrm.FormCreate(Sender: TObject);
begin
  SIStatusBar.Top := Screen.Height - SIStatusBar.Height;

  dmLookUpSInv := TdmLookUpSInv.Create(Self);
  StatementList := TStringList.create;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUSalesInvStmtsFrm.FormDestroy(Sender: TObject);
begin
  dmLookUpSInv.free;
  StatementList.Free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUSalesInvStmtsFrm.btnCloseClick(Sender: TObject);
begin
close;
end;

procedure TPBLUSalesInvStmtsFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
  selectionchanged;
end;

procedure TPBLUSalesInvStmtsFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DatefromEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
  selectionchanged;
end;

procedure TPBLUSalesInvStmtsFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  selectionchanged;
end;

procedure TPBLUSalesInvStmtsFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  Dateto := InputDate(Dateto);
  DatetoEdit.Text := PBDatestr(Dateto);
  selectionchanged;
end;

function TPBLUSalesInvStmtsFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
  selectionchanged;
end;

procedure TPBLUSalesInvStmtsFrm.SelectionChanged;
begin
  dmLookupSInv.Customer := edtCustomer.Text;
  dmLookupSInv.DateFrom := DateFrom;
  dmLookupSInv.DateTo := DateTo;

  if cmbStatements.text = '' then
    dmLookupSInv.Statement := ''
  else
    dmLookupSInv.Statement := statementList.strings[cmbStatements.itemindex];

  grpInvDate.enabled := (cmbStatements.text = '');
  RePrint := (cmbStatements.text <> '');

  showgrid;
end;

procedure TPBLUSalesInvStmtsFrm.btnSelectClick(Sender: TObject);
begin
  With dmLookUpSInv.DetsSRC.DataSet do
     begin
      First ;
      While EOF = False do
        begin
          DetsDBGrid.SelectedRows.CurrentRowSelected := True ;
          Next ;
        end;
     end;
end;

procedure TPBLUSalesInvStmtsFrm.btnPrintClick(Sender: TObject);
var
  temploop: integer;
begin
  {If reprint then select all items}
  if Reprint then
    begin
      With dmLookUpSInv.DetsSRC.DataSet do
        begin
          First ;
          While EOF = False do
          begin
            DetsDBGrid.SelectedRows.CurrentRowSelected := True ;
            Next ;
          end;
        end;
    end;

  PBRSCustStateFrm := TPBRSCustStateFrm.create(self);
  try
    PBRSCustStateFrm.SelCustomer := iCust;
    PBRSCustStateFrm.SelBranch := iCustBranch;
    PBRSCustStateFrm.edtCustomerName.text := sCustName+'/'+sCustBranchName;
    PBRSCustStateFrm.DateFrom := DateFrom;
    PBRSCustStateFrm.dateTo := DateTo;
    if Reprint then
      begin
        PBRSCustStateFrm.edtStatementNo.text := StatementList.strings[cmbStatements.itemindex];
        PBRSCustStateFrm.InvoiceDate := DetsDBGrid.datasource.dataset.fieldbyname('Statement_Date').asdatetime;
      end
    else
      begin
      PBRSCustStateFrm.InvoiceDate := date;
      end;

    PBRSCustStateFrm.Reprint := Reprint;
    {Update the Statement Print with the selected Purchase Order details}
    DetsDbGrid.Datasource.Dataset.DisableControls;
    for TempLoop := 0 to pred(DetsDBGrid.SelectedRows.count) do
		  begin
        DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(DetsDBGrid.SelectedRows[TempLoop]));
        PBRSCustStateFrm.SelectLst.Add(DetsDBGrid.dataSource.dataset.fieldbyname('Sales_invoice').asstring);
      end;
    DetsDbGrid.Datasource.Dataset.EnableControls;
    PBRSCustStateFrm.showmodal;
    if PBRSCustStateFrm.tempok then
      begin
        GetStatements(self);
        selectionchanged;
      end;
  finally
    PBRSCustStateFrm.free;
  end;
end;

procedure TPBLUSalesInvStmtsfrm.GetStatements(Sender: TObject);
var
  tempValue: string;
begin
  cmbStatements.enabled := false;
  btnClear.enabled := false;
  with dmLookUpSInv.GetCustStatSQL do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iCustBranch;
      open;
      first;

      TempValue := cmbStatements.text;

      cmbStatements.clear;
      StatementList.clear;

      while eof <> true do
        begin
          if fieldbyname('Statement_Reference').asstring = '' then
            begin
              next;
              continue;
            end;
          cmbStatements.items.add(formatdatetime('mmmm d yyyy',fieldbyname('Statement_Date').asdatetime) + ' - ' + fieldbyname('Statement_Reference').asstring);
          StatementList.add(fieldbyname('Statement_Reference').asstring);
          next;
        end;

    cmbStatements.enabled := (cmbStatements.items.count > 0);
    btnClear.enabled := (cmbStatements.items.count > 0);

    cmbStatements.ItemIndex := cmbstatements.items.indexof(TempValue);
    if cmbStatements.itemindex >= 0 then
      cmbStatementsClick(self)
    else
//      InitialiseDate(self);
    end;
end;

procedure TPBLUSalesInvStmtsFrm.cmbStatementsChange(Sender: TObject);
begin
  selectionchanged;
end;

procedure TPBLUSalesInvStmtsFrm.btnClearClick(Sender: TObject);
begin
  with cmbStatements do
    begin
      text := '';
      itemindex := -1;
      initialiseDate(self);
      selectionchanged;
    end;
end;

procedure TPBLUSalesInvStmtsFrm.btnRemoveClick(Sender: TObject);
var
  temploop: integer;
begin
  if MessageDlg('Remove the selected invoices from the statement?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {Update the Statement Print with the selected Purchase Order details}
    DetsDbGrid.Datasource.Dataset.DisableControls;
    for TempLoop := 0 to pred(DetsDBGrid.SelectedRows.count) do
		  begin
        DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(DetsDBGrid.SelectedRows[TempLoop]));
        dmLookUpSInv.SetStatementNo(DetsDBGrid.dataSource.dataset.fieldbyname('Sales_invoice').asinteger);
      end;
    DetsDbGrid.Datasource.Dataset.EnableControls;
    GetStatements(self);
    selectionchanged;
  end;

end;

procedure TPBLUSalesInvStmtsFrm.cmbStatementsClick(Sender: TObject);
begin
  with dmLookUpSInv.GetCustStatSQL do
    begin
      first;
      moveby(cmbStatements.itemindex);
      DateFrom := fieldbyname('Statement_From').asdatetime;
      DateFromEdit.text := PBDatestr(fieldbyname('Statement_From').asdatetime);
      DateTo := fieldbyname('Statement_to').asdatetime;
      DateToEdit.text := PBDatestr(fieldbyname('Statement_to').asdatetime);
    end;
end;

procedure TPBLUSalesInvStmtsFrm.chkbxShowUnpaidClick(Sender: TObject);
begin
  dmLookUpSInv.ShowUnpaid := chkbxShowUnpaid.checked;
  SelectionChanged;
end;

end.
