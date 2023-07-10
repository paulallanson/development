unit WTSrchCustContacts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmWTSrchCustContacts = class(TForm)
    dbgdetails: TDBGrid;
    Label1: TLabel;
    edtSearch: TEdit;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    qryDetails: TQuery;
    dtsDetails: TDataSource;
    tmrSearch: TTimer;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
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
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure dbgdetailsDblClick(Sender: TObject);
  private
    FisLookup: bytebool;
    procedure Refreshdata;
    procedure CallMaintScreen(FuncMode: string);
    procedure SetisLookup(const Value: bytebool);
    { Private declarations }
  public
    Customer: integer;
    ContactName: string;
    ContactNo: integer;
    property isLookup: bytebool read FisLookup write SetisLookup;
  end;

var
  frmWTSrchCustContacts: TfrmWTSrchCustContacts;

implementation

uses wtMaintCustomerConts;

{$R *.dfm}

procedure TfrmWTSrchCustContacts.FormShow(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmWTSrchCustContacts.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTSrchCustContacts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TfrmWTSrchCustContacts.Refreshdata;
begin
  with qrydetails do
    begin
      close;
      parambyname('Name').asstring := '%' + edtSearch.text + '%';
      parambyname('customer').asinteger := Customer;
      open;
    end;
end;

procedure TfrmWTSrchCustContacts.btnSelectClick(Sender: TObject);
begin
  ContactName := qryDetails.fieldbyname('Contact_name').asstring;
  ContactNo := qryDetails.fieldbyname('Contact_No').asinteger;
end;

procedure TfrmWTSrchCustContacts.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTSrchCustContacts.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintCustomerConts := TfrmWTMaintCustomerConts.create(Application);
    if FuncMode <> 'A' then
      begin
        iCode := dbgDetails.datasource.dataset.fieldbyname('Contact_no').asinteger;
      end
    else
      iCode := 0;
//    getRecord(iCode);

    frmWTMaintCustomerConts.FunctionMode := FuncMode;
    frmWTMaintCustomerConts.Customer := Customer;
    frmWTMaintCustomerConts.showmodal;
    if frmWTMaintCustomerConts.modalresult = mrOK then
      icode := frmWTMaintCustomerConts.iCode;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustomerConts.free;
  end;
  refreshData;
  qrydetails.locate('Customer; Contact_no',VarArrayOf([inttostr(Customer),inttostr(iCode)]),[lopartialKey]);
end;

procedure TfrmWTSrchCustContacts.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTSrchCustContacts.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTSrchCustContacts.btnDeleteClick(Sender: TObject);
var
  icode: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Customer_Contact WHERE Customer = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Customer').asinteger)
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

procedure TfrmWTSrchCustContacts.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsDetails.dataset do
  begin
    btnChange.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
  end;
end;

procedure TfrmWTSrchCustContacts.FormCreate(Sender: TObject);
begin
  dtsDetails.OnDataChange := SetButtons;
end;

procedure TfrmWTSrchCustContacts.SetisLookup(const Value: bytebool);
begin
  FisLookup := Value;
  btnSelect.Visible := FisLookup;
end;

procedure TfrmWTSrchCustContacts.dbgdetailsDblClick(Sender: TObject);
begin
  if dtsDetails.DataSet.RecordCount = 0 then exit;
  btnChangeClick(self);
end;

end.
