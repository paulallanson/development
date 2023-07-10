unit STImpDirectOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl, ComCtrls, CCSCommon, Db, DBTables, DBCtrls,
  ExtCtrls;

type
  TSTImpDirectOrdersFrm = class(TForm)
    pnlSupplier: TPanel;
    lblStep1: TLabel;
    LblSuppName: TLabel;
    btnSelectSupplier: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    lstbxFileNames: TListBox;
    btnImport: TBitBtn;
    BitBtn1: TBitBtn;
    btbtnDelete: TBitBtn;
    qryCompany: TQuery;
    Panel2: TPanel;
    Label1: TLabel;
    edtImportDir: TEdit;
    Panel3: TPanel;
    btnClose: TBitBtn;
    procedure btnImportClick(Sender: TObject);
    procedure EnableButtons(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btbtnDeleteClick(Sender: TObject);
    procedure btnSelectSupplierClick(Sender: TObject);
  private
    FFileTypes: string;
    iSuppCode, iSuppBranch: integer;
    procedure GetNewFileDetails;
    procedure SetFileTypes(const Value: string);
    function GetTransferDir: string;
    procedure DeleteOldArchiveFiles;
    { Private declarations }
  public
    property FileTypes: string read FFileTypes write SetFileTypes;
  end;

var
  STImpDirectOrdersFrm: TSTImpDirectOrdersFrm;

implementation

uses STImpSalesOrdersDM, pbMainMenu, STRSImportAudit,PBLUSupp;

{$R *.DFM}

var
  ImportPath: string;


procedure TSTImpDirectOrdersFrm.GetNewFileDetails;
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

  enableButtons(self);
end;

procedure TSTImpDirectOrdersFrm.btnImportClick(Sender: TObject);
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
    dtmdlImpSO.Supplier := iSuppCode;
    dtmdlImpSO.SupplierBranch := iSuppBranch;

    for i := 0 to pred(lstbxFileNames.items.count) do
      begin
        if lstbxFileNames.selected[i] then
          begin
            if copy(lstbxFileNames.Items[i],1,2) = 'SR' then
              bSuccess := dtmdlImpSO.ProcessOrder(ImportPath, lstbxFileNames.items[i])
            else
            if copy(lstbxFileNames.Items[i],(length(lstbxFileNames.Items[i])-3),4) = '.csv' then
              begin
                bSuccess := dtmdlImpSO.ProcessKingfieldOrder(ImportPath, lstbxFileNames.items[i]);
              end;

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

procedure TSTImpDirectOrdersFrm.FormCreate(Sender: TObject);
begin
  dtmdlImpSO := TdtmdlImpSO.create(self);
end;

procedure TSTImpDirectOrdersFrm.FormDestroy(Sender: TObject);
begin
  dtmdlImpSO.Free;
end;

procedure TSTImpDirectOrdersFrm.SetFileTypes(const Value: string);
begin
  FFileTypes := Value;
end;

procedure TSTImpDirectOrdersFrm.FormActivate(Sender: TObject);
begin
  FileTypes := '*.csv';
  GetNewFileDetails;
end;

procedure TSTImpDirectOrdersFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

function TSTImpDirectOrdersFrm.GetTransferDir: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Data_Transfer_Directory').asstring)+'\in\';
    end;
end;
procedure TSTImpDirectOrdersFrm.BitBtn1Click(Sender: TObject);
begin
  STRSImportAuditfrm := TSTRSImportAuditfrm.create(self);
  try
    STRSImportAuditfrm.showmodal;
  finally
    STRSImportAuditfrm.free;
  end;
end;

procedure TSTImpDirectOrdersFrm.btbtnDeleteClick(Sender: TObject);
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

procedure TSTImpDirectOrdersFrm.DeleteOldArchiveFiles;
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

procedure TSTImpDirectOrdersFrm.btnSelectSupplierClick(Sender: TObject);
var
  PBLUSuppFrm : TPBLUSuppFrm;
begin
  lblSuppName.Caption := '';
  iSuppCode := 0;
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_LookUp := True ;
    PBLUSuppFrm.bAllow_Upd := False ;
    PBLUSuppFrm.bSel_Branch := True ;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
      begin
        iSuppCode := PBLUSuppFrm.SelCode ;
        iSuppBranch := PBLUSuppFrm.SelBranch ;
        LblSuppName.Caption := PBLUSuppFrm.SelName + ', ' + PBLUSuppFrm.SelBranchName ;
      end;
  finally
    PBLUSuppFrm.Free;
  end;
  enableButtons(self);
end;

procedure TSTImpDirectOrdersFrm.EnableButtons(Sender: TObject);
begin
  btnImport.enabled := (lstbxFileNames.Items.Count > 0) and (iSuppCode <> 0);
  btbtnDelete.Enabled := (lstbxFileNames.Items.Count > 0);
end;

end.
