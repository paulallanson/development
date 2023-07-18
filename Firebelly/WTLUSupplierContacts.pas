unit WTLUSupplierContacts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBTables, DB;

type
  TfrmWTLUSupplierContacts = class(TForm)
    dbgdetails: TDBGrid;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    edtSearch: TEdit;
    Label1: TLabel;
    qryDetails: TQuery;
    dtsDetails: TDataSource;
    tmrSearch: TTimer;
    qryContactType: TQuery;
    dtsContactType: TDataSource;
    qryDelete: TQuery;
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgdetailsDblClick(Sender: TObject);
  private
    FisLookup: bytebool;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refreshdata;
    procedure GetRecord(Key: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetisLookup(const Value: bytebool);
    { Private declarations }
  public
    Supplier: integer;
    ContactNo: integer;
    ContactName: string;
    property isLookup: bytebool read FisLookup write SetisLookup;
  end;

var
  frmWTLUSupplierContacts: TfrmWTLUSupplierContacts;

implementation

uses
  WTMaintSupplierContact, System.UITypes;

{$R *.dfm}

procedure TfrmWTLUSupplierContacts.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmWTLUSupplierContacts.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSupplierContacts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TfrmWTLUSupplierContacts.Refreshdata;
begin
  with qrydetails do
    begin
      close;
      parambyname('Name').asstring := '%' + edtSearch.text + '%';
      parambyname('Supplier').asinteger := Supplier;
      open;
    end;
end;

procedure TfrmWTLUSupplierContacts.btnSelectClick(Sender: TObject);
begin
  ContactName := qryDetails.fieldbyname('Contact_name').asstring;
  ContactNo := qryDetails.fieldbyname('Contact_No').asinteger;
end;

procedure TfrmWTLUSupplierContacts.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSupplierContacts.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintSupplierContact := TfrmWTMaintSupplierContact.create(Application);
    if FuncMode <> 'A' then
      begin
        iCode := dbgDetails.datasource.dataset.fieldbyname('Contact_no').asinteger;
      end
    else
      iCode := 0;
    getRecord(iCode);
    frmWTMaintSupplierContact.FunctionMode := FuncMode;
    frmWTMaintSupplierContact.Supplier := Supplier;
    frmWTMaintSupplierContact.showmodal;
    if frmWTMaintSupplierContact.modalresult = mrOK then
      icode := frmWTMaintSupplierContact.iCode;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintSupplierContact.free;
  end;
  refreshData;
  qrydetails.locate('Supplier; Contact_no',VarArrayOf([inttostr(Supplier),inttostr(iCode)]),[lopartialKey]);
end;

procedure TfrmWTLUSupplierContacts.GetRecord(Key: integer);
begin
(*  tblContacts.Active := false;
  tblContacts.Filter := 'Supplier = ' + inttostr(Supplier) + 'AND Contact_no = ' + inttostr(Key);
  tblContacts.Active := true;
*)
end;

procedure TfrmWTLUSupplierContacts.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUSupplierContacts.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUSupplierContacts.btnDeleteClick(Sender: TObject);
var
  icode: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Supplier_Contact WHERE Supplier = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Supplier').asinteger)
                      + ' AND Contact_No = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Contact_no').asinteger);
            execsql;
          end;
        refreshdata;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Contact_Name').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUSupplierContacts.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsDetails.dataset do
  begin
    btnChange.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
  end;
end;

procedure TfrmWTLUSupplierContacts.FormCreate(Sender: TObject);
begin
  dtsDetails.OnDataChange := SetButtons;
end;

procedure TfrmWTLUSupplierContacts.dbgdetailsDblClick(Sender: TObject);
begin
  if dtsDetails.DataSet.RecordCount = 0 then exit;
  btnChangeClick(self);
end;

procedure TfrmWTLUSupplierContacts.SetisLookup(const Value: bytebool);
begin
  FisLookup := Value;
  btnSelect.Visible := FisLookup;
end;

end.
