unit WTSrchSuppContacts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTSrchSuppContacts = class(TForm)
    dbgdetails: TDBGrid;
    Label1: TLabel;
    edtSearch: TEdit;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    qryDetails: TFDQuery;
    dtsDetails: TDataSource;
    tmrSearch: TTimer;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    tblContacts: TFDTable;
    dtstblContacts: TDataSource;
    qryNewContact: TFDQuery;
    qryContactType: TFDQuery;
    dtsContactType: TDataSource;
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
    procedure tblContactsNewRecord(DataSet: TDataSet);
    procedure dbgdetailsDblClick(Sender: TObject);
    procedure GetRecord(Key: integer);
  private
    FisLookup: bytebool;
    procedure Refreshdata;
    procedure CallMaintScreen(FuncMode: string);
    procedure SetisLookup(const Value: bytebool);
    { Private declarations }
  public
    Supplier: integer;
    ContactName: string;
    property isLookup: bytebool read FisLookup write SetisLookup;
  end;

var
  frmWTSrchSuppContacts: TfrmWTSrchSuppContacts;

implementation

uses UITypes, WTMaintSupplierContact;

{$R *.dfm}

procedure TfrmWTSrchSuppContacts.FormShow(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmWTSrchSuppContacts.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTSrchSuppContacts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TfrmWTSrchSuppContacts.Refreshdata;
begin
  with qrydetails do
    begin
      close;
      parambyname('Name').asstring := '%' + edtSearch.text + '%';
      parambyname('Supplier').asinteger := Supplier;
      open;
    end;
end;

procedure TfrmWTSrchSuppContacts.btnSelectClick(Sender: TObject);
begin
  ContactName := qryDetails.fieldbyname('Contact_name').asstring;
end;

procedure TfrmWTSrchSuppContacts.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTSrchSuppContacts.CallMaintScreen(FuncMode: string);
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
    frmWTMaintSupplierContact.showmodal;
    if frmWTMaintSupplierContact.modalresult = mrOK then
      icode := tblContacts.FieldByName('Contact_no').asinteger;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintSupplierContact.free;
  end;
  refreshData;
  qrydetails.locate('Supplier; Contact_no',VarArrayOf([inttostr(Supplier),inttostr(iCode)]),[lopartialKey]);
end;

procedure TfrmWTSrchSuppContacts.GetRecord(Key: integer);
begin
  tblContacts.Active := false;
  tblContacts.Filter := 'Supplier = ' + inttostr(Supplier) + 'AND Contact_no = ' + inttostr(Key);
  tblContacts.Active := true;
end;

procedure TfrmWTSrchSuppContacts.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTSrchSuppContacts.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTSrchSuppContacts.btnDeleteClick(Sender: TObject);
var
  icode: integer;
begin
  iCode := dbgDetails.datasource.dataset.fieldbyname('Contact_no').asinteger;
  getRecord(iCode);
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        tblContacts.Delete;
        refreshData;
      except
        messagedlg('Contact '+ tblContacts.fieldbyname('Contact_Name').asstring
                    + ' has related data, therefore cannot be deleted.', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTSrchSuppContacts.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsDetails.dataset do
  begin
    btnChange.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
  end;
end;

procedure TfrmWTSrchSuppContacts.FormCreate(Sender: TObject);
begin
  dtsDetails.OnDataChange := SetButtons;
end;

procedure TfrmWTSrchSuppContacts.tblContactsNewRecord(DataSet: TDataSet);
begin
	qryNewContact.Close;
	qryNewContact.Parambyname('Supplier').asinteger := Supplier;
  qryNewContact.Open;

  tblContacts.FieldByName('Supplier').asinteger := Supplier;
  tblContacts.FieldByName('Contact_no').asinteger := qryNewContact.Fields[0].asinteger + 1;
end;

procedure TfrmWTSrchSuppContacts.SetisLookup(const Value: bytebool);
begin
  FisLookup := Value;
  btnSelect.Visible := FisLookup;
end;

procedure TfrmWTSrchSuppContacts.dbgdetailsDblClick(Sender: TObject);
begin
  if dtsDetails.DataSet.RecordCount = 0 then exit;
  btnChangeClick(self);
end;

end.
