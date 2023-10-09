unit STImpSalesOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl, ComCtrls, CCSCommon, Db, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTImpSalesOrdersFrm = class(TForm)
    lstbxFileNames: TListBox;
    btnImport: TBitBtn;
    edtImportDir: TEdit;
    Label1: TLabel;
    btnClose: TBitBtn;
    Label2: TLabel;
    qryCompany: TFDQuery;
    Label3: TLabel;
    dblkpWarehouse: TDBLookupComboBox;
    qryWarehouse: TFDQuery;
    dtsWarehouse: TDataSource;
    BitBtn1: TBitBtn;
    btbtnDelete: TBitBtn;
    procedure btnImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btbtnDeleteClick(Sender: TObject);
  private
    FFileTypes: string;
    procedure GetNewFileDetails;
    procedure SetFileTypes(const Value: string);
    function GetTransferDir: string;
    procedure DeleteOldArchiveFiles;
    { Private declarations }
  public
    property FileTypes: string read FFileTypes write SetFileTypes;
  end;

var
  STImpSalesOrdersFrm: TSTImpSalesOrdersFrm;

implementation

uses UITypes, STImpSalesOrdersDM, pbMainMenu, STRSImportAudit;

var
  ImportPath: string;

{$R *.DFM}

procedure TSTImpSalesOrdersFrm.GetNewFileDetails;
var
  SearchRec : TSearchRec;
  sFileDetails: string;
  FileDateTime: TDateTime ;
begin
  btnImport.enabled := false;

  ImportPath := GetTransferDir;
  edtImportDir.text := ImportPath;

  lstbxFileNames.Items.Clear;
  //FindFirst returns 0 if successful if no files found then quit
  if FindFirst(ImportPath+FileTypes, faAnyFile, SearchRec) <> 0 then
  begin
    exit;
  end;
  FileDateTime := FileDateToDateTime(SearchRec.Time);
  sFileDetails := SearchRec.Name;
  lstbxFileNames.items.Add(sFileDetails);

  while FindNext(SearchRec) = 0 do
  begin
    FileDateTime := FileDateToDateTime(SearchRec.Time);
    sFileDetails := SearchRec.Name;
    lstbxFileNames.items.Add(sFileDetails);
  end;
  FindClose(SearchRec);

  if lstbxFileNames.Items.count > 0 then
    lstbxFileNames.ItemIndex := 0;

  btnImport.enabled := (lstbxFileNames.Items.Count > 0);
  btbtnDelete.Enabled := (lstbxFileNames.Items.Count > 0);
end;

procedure TSTImpSalesOrdersFrm.btnImportClick(Sender: TObject);
var
  i, Errorcount: integer;
  bSuccess: boolean;
begin
  self.DeleteOldArchiveFiles;

  if MessageDlg('The selected orders will be created, continue?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    errorcount := 0;
    dtmdlImpSO.Operator := frmPBMainMenu.iOperator;
    dtmdlImpSO.Warehouse := dblkpWarehouse.keyvalue;
    for i := 0 to pred(lstbxFileNames.items.count) do
      begin
        if lstbxFileNames.selected[i] then
          begin
            if copy(lstbxFileNames.Items[i],1,2) = 'SR' then
              bSuccess := dtmdlImpSO.ProcessOrder(ImportPath, lstbxFileNames.items[i])
            else
            if copy(lstbxFileNames.Items[i],(length(lstbxFileNames.Items[i])-3),4) = '.csv' then
              bSuccess := dtmdlImpSO.ProcessKingfieldOrder(ImportPath, lstbxFileNames.items[i]);

            if not bSuccess then
              inc(Errorcount);
          end;
      end;
    GetNewFileDetails;
    if errorcount > 0 then
      MessageDlg('Errors were encountered during the import, please review the audit', mtError,
      [mbOk], 0)
    else
      MessageDlg('All selected files were imported successfully', mtInformation,
      [mbOk], 0);
  end;
end;

procedure TSTImpSalesOrdersFrm.FormCreate(Sender: TObject);
begin
  dtmdlImpSO := TdtmdlImpSO.create(self);
end;

procedure TSTImpSalesOrdersFrm.FormDestroy(Sender: TObject);
begin
  dtmdlImpSO.Free;
end;

procedure TSTImpSalesOrdersFrm.SetFileTypes(const Value: string);
begin
  FFileTypes := Value;
end;

procedure TSTImpSalesOrdersFrm.FormActivate(Sender: TObject);
begin
  FileTypes := 'SR*.*';
  GetNewFileDetails;
  with qryWarehouse do
    begin
      close;
      open;
    end;
  dblkpWarehouse.keyvalue := qryCompany.fieldbyname('Default_warehouse').asinteger
end;

procedure TSTImpSalesOrdersFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

function TSTImpSalesOrdersFrm.GetTransferDir: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Data_Transfer_Directory').asstring)+'\in\';
    end;
end;
procedure TSTImpSalesOrdersFrm.BitBtn1Click(Sender: TObject);
begin
  STRSImportAuditfrm := TSTRSImportAuditfrm.create(self);
  try
    STRSImportAuditfrm.showmodal;
  finally
    STRSImportAuditfrm.free;
  end;
end;

procedure TSTImpSalesOrdersFrm.btbtnDeleteClick(Sender: TObject);
var
  i: integer;
  importPath: string;
begin
  if MessageDlg('The selected orders will be deleted, continue?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      importPath := self.GetTransferDir;

      for i := pred(lstbxFileNames.items.count) downto 0 do
      begin
        if lstbxFileNames.selected[i] then
        begin
          DeleteFile(importPath + lstbxFileNames.items[i]);
          lstbxFileNames.items.Delete(i);
        end;
      end;

      btnImport.Enabled := (lstbxFileNames.Items.Count > 0);
      btbtnDelete.Enabled := (lstbxFileNames.Items.Count > 0);
    end;
end;

procedure TSTImpSalesOrdersFrm.DeleteOldArchiveFiles;
var
  i: integer;
  archivePath: string;
  SearchRec : TSearchRec;
begin
  archivePath := self.GetTransferDir+ 'archive\';

  if FindFirst(archivePath+FileTypes, faAnyFile, SearchRec) <> 0 then
  begin
    exit;
  end;

  if FileDateToDateTime(SearchRec.Time) < (Now - 28) then
  begin
    deleteFile(archivePath+SearchRec.Name);
  end;

  while FindNext(SearchRec) = 0 do
  begin
    if FileDateToDateTime(SearchRec.Time) < (Now - 28) then
    begin
      deleteFile(archivePath+SearchRec.Name);
    end;
  end;

  FindClose(SearchRec);
end;

end.
