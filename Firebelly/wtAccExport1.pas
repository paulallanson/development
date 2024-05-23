unit wtAccExport1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, QrCtrls, DBCtrls, IniFiles, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTAccExport1 = class(TForm)
    pnlFooter: TPanel;
    NextBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdateBitBtn: TBitBtn;
    ResetBitBtn: TBitBtn;
    pnlMain: TPanel;
    Label1: TLabel;
    ActionListBox: TListBox;
    GroupBox1: TGroupBox;
    DescriptionLbl: TLabel;
    pnlRevenueCentre: TPanel;
    rdgrpRevenueCentre: TRadioGroup;
    grpbxRevCentre: TGroupBox;
    Label3: TLabel;
    dblkpRevCentre: TDBLookupComboBox;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
    procedure NextBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ActionListBoxClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateBitBtnClick(Sender: TObject);
    procedure ResetBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdgrpRevenueCentreClick(Sender: TObject);
    procedure dblkpRevCentreClick(Sender: TObject);
  private
    { Private declarations }
    function UpdatesPending: boolean;
    procedure ReadCompany;
    procedure RunFactorInvEport;
    procedure RunFileImport;
  public
    bUseRevenueCentre: boolean;
    iRevenueCentre: integer;
  end;

var
  frmWTAccExport1: TfrmWTAccExport1;

implementation

uses UITypes, 
  WTAccExport2, WTAccExport3, WTAccExport4, WTAccExportDM, WTAccExportFactInvs,
  WTAccImportDM, WTFileImport, wtDataModule, WTMain;

var
  iRecordcounter: integer;

{$R *.DFM}

procedure TfrmWTAccExport1.NextBitBtnClick(Sender: TObject);
begin
  frmWTAccExport1.hide;

  if (ActionListBox.ItemIndex = 11) or (ActionListBox.ItemIndex = 12) or (ActionListBox.ItemIndex = 15) then
  begin
    RunFileImport;
    frmWTAccExport1.show;
    exit;
  end;

  if ActionListBox.ItemIndex = 14 then
  begin
    RunFactorInvEport;
    frmWTAccExport1.show;
    exit;
  end;

  if ActionListBox.ItemIndex = 2 then
  begin
    if bUseRevenueCentre and (rdgrpRevenueCentre.itemindex = 1) then
      dblkpRevCentreClick(self);
  end;

  {Check for pending update and display form accordingly}
  if UpdatesPending = true then
    frmWTAccExport2.show
  else
  begin
    frmWTAccExport3.sLastForm := frmWTAccExport1;
    frmWTAccExport3.show;
  end;
end;

function TfrmWTAccExport1.UpdatesPending: boolean;
var
  irecords: integer;
begin
  irecords := 0;
  result:= false;
  with ActionListBox do
    begin
      {Check for Customer Updates pending}
      if itemindex = 0 then
        begin
          with dmAccExport.CustPendingSQL do
            begin
              close;
              open;
              irecords := recordcount;
            end;
        end
      else
      {Check for Supplier Updates pending}
      if itemindex = 1 then
        begin
          with dmAccExport.SuppPendingSQL do
            begin
              close;
              open;
              irecords := recordcount;
            end
        end
      else
      {Check for Sales Invoice Updates pending}
      if itemindex = 2 then
        begin
          with dmAccExport.SalesPendingSQL do
            begin
              close;
              sql.Text := dmAccExport.SalesPendingBaseSQL.SQL.Text ;
              if bUseRevenueCentre then
                begin
                  if iRevenueCentre = 0 then
                    sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre is NULL '
                  else
                    sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre = ' + inttostr(iRevenueCentre);
                end;
              open;
              irecords := recordcount;
            end;
        end
      else
      {Check for Purchase Invoice Updates pending}
      if itemindex = 3 then
        begin
          with dmAccExport.PurchPendingSQL do
            begin
              close;
              open;
              irecords := recordcount;
            end;
        end
      else
      {Check for New Order Accounts}
      if itemindex = 3 then
        begin
          with dmAccExport.CustPendingSQL do
            begin
              close;
              open;
              irecords := recordcount;
            end;
        end;
    end;
  if irecords > 0 then
    begin
      frmWTAccExport2.iRecordCounter := irecords;
      iRecordCounter := iRecords;
      result := true;
    end;
end;

procedure TfrmWTAccExport1.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTAccExport1.ActionListBoxClick(Sender: TObject);
begin
  with ActionListBox do
    begin
      {Export Customer details}
      if itemindex = 0 then
        DescriptionLbl.Caption := 'Export details for Customers currently on ledger or pending update to ledger'
      else
      {Export Supplier details}
      if itemindex = 1 then
        DescriptionLbl.Caption := 'Export details for Suppliers currently on ledger or pending update to ledger'
      else
      {Export Sales Invoices}
      if itemindex = 2 then
        DescriptionLbl.Caption := 'Export sales invoices which have been printed, also export Customer accounts associated with the invoices'
      else
      {Export Purchase Invoices}
      if itemindex = 3 then
        DescriptionLbl.Caption := 'Export Purchase invoices which have been passed, also export Supplier accounts associated with the invoices'
      else
      {Export Order Accounts}
      if itemindex = 4 then
        DescriptionLbl.Caption := 'Export new accounts associated with Purchase Orders raised'
      else
      {Import Currency Rates}
      if itemindex = 5 then
        DescriptionLbl.Caption := 'Import latest currency rates from accounting system'
      else
      {Import Stock References}
      if itemindex = 6 then
        DescriptionLbl.Caption := 'Import Stock references and associated descriptions from stock system'
      else
      {Import Credit Limits}
      if itemindex = 7 then
        DescriptionLbl.Caption := 'Import latest credit limits for Customers from accounting system'
      else
      {Import Stock References}
      if itemindex = 8 then
        DescriptionLbl.Caption := 'Import Customer details from Sage Line 50 Customer database'
      else
      {Import Credit Limits}
      if itemindex = 9 then
        DescriptionLbl.Caption := 'Import Supplier details from Sage Line 50 Supplier database'
      else
      {Import Credit Limits}
      if itemindex = 10 then
        DescriptionLbl.Caption := 'Import payment details from Sage Line 50'
      else
      {Import Credit Limits}
      if itemindex = 11 then
        DescriptionLbl.Caption := 'Import Maximiser contact details'
   end;
  if UpdatesPending = true then
    begin
      UpdateBitBtn.Visible := true;
      ResetBitBtn.Visible := true;
      NextBitBtn.Visible := false;
      DescriptionLbl.Caption := inttostr(iRecordCounter) + ' records are pending update. Select the Update option to confirm the update status for those records, alternatively select the Reset option to cancel the export postings';
    end
  else
    begin
      UpdateBitBtn.Visible := false;
      ResetBitBtn.Visible := false;
      NextBitBtn.Visible := true;
    end;
end;

procedure TfrmWTAccExport1.ReadCompany;
begin
  with dmAccExport.CompanySQL do
  begin
    Close;
    Open;
    First;
  end;
end;

procedure TfrmWTAccExport1.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  with IniFile do
    begin
      WriteString('Sales Invoice Export', 'Revenue Centre Option', inttostr(rdgrpRevenueCentre.itemindex));
      WriteString('Sales Invoice Export', 'Revenue Centre', inttostr(iRevenueCentre));
      Free;
    end;

  frmWTAccExport2.free;
  frmWTAccExport3.free;
  frmWTAccExport4.free;
  dmAccExport.free;
  dmAccImport.free;
end;

procedure TfrmWTAccExport1.UpdateBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Update the postings pending for '+ActionListBox.items[ActionListBox.itemindex]+'?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  {Re the export depending on the selection}
  with ActionListBox do
    begin
      {Customer export}
      if itemindex = 0 then
        begin
          frmWTAccExport3.UpdateCustomers(dmAccExport.UpCustomerSQL,'U','Y');
        end
      else
      {Supplier export}
      if itemindex = 1 then
        begin
          frmWTAccExport3.UpdateSuppliers(dmAccExport.UpSupplierSQL, 'U', 'Y');
        end
      else
      {Sales Invoices export}
      if itemindex = 2 then
        begin
          frmWTAccExport3.UpdateCustomers(dmAccExport.UpCustomerSQL,'I','Y');
          frmWTAccExport3.UpdateSalesStatus(dmAccExport.UpSalesInvHeadSQL,25,30);
        end
      else
      {Purchase Invoices export}
      if itemindex = 3 then
        begin
          frmWTAccExport3.UpdateSuppliers(dmAccExport.UpSupplierSQL,'O','Y');
          frmWTAccExport3.UpdatePurchStatus(dmAccExport.UpSupplierInvHeadSQL,25,30);
        end
      else
      {New Order Customer Accounts}
      if itemindex = 4 then
        begin
          frmWTAccExport3.UpdateCustomers(dmAccExport.UpCustomerSQL,'U','Y');
        end;
    end;
  MessageDlg('Update complete for '+ActionListBox.items[ActionListBox.itemindex], mtInformation,
      [mbOk], 0);
  NextBitBtn.Visible := true;
  UpdateBitBtn.Visible := false;
  ResetBitBtn.Visible := false;

  {Redisplay the Listbox}
  ActionListBoxClick(self);
end;

procedure TfrmWTAccExport1.ResetBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Reset the postings pending for '+ActionListBox.items[ActionListBox.itemindex]+'?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  {Re the export depending on the selection}
  with ActionListBox do
    begin
      if itemindex = 0 then
        begin
          frmWTAccExport3.UpdateCustomers(dmAccExport.UpCustomerSQL,'U','N');
        end
      else
      if itemindex = 1 then
        begin
          frmWTAccExport3.UpdateSuppliers(dmAccExport.UpSupplierSQL,'U','N');
        end
      else
      if itemindex = 2 then
        begin
          frmWTAccExport3.UpdateCustomers(dmAccExport.UpCustomerSQL,'I','N');
          frmWTAccExport3.UpdateSalesStatus(dmAccExport.UpSalesInvHeadSQL,25,20);
        end
      else
      if itemindex = 3 then
        begin
          frmWTAccExport3.UpdateSuppliers(dmAccExport.UpSupplierSQL,'O','N');
          frmWTAccExport3.UpdatePurchStatus(dmAccExport.UpSupplierInvHeadSQL,25,20);
        end
      else
      if itemindex = 4 then
        begin
          frmWTAccExport3.UpdateCustomers(dmAccExport.UpCustomerSQL,'P','N');
          frmWTAccExport3.UpdateSuppliers(dmAccExport.UpCustomerSQL,'P','N');
        end;
    end;
  MessageDlg('Reset complete for '+ActionListBox.items[ActionListBox.itemindex], mtInformation,
      [mbOk], 0);
  NextBitBtn.Visible := true;
  UpdateBitBtn.Visible := false;
  ResetBitBtn.Visible := false;

  {Redisplay the Listbox}
  ActionListBoxClick(self);
end;

procedure TfrmWTAccExport1.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  frmWTAccExport2 := TfrmWTAccExport2.create(self);
  frmWTAccExport3 := TfrmWTAccExport3.create(self);
  frmWTAccExport4 := TfrmWTAccExport4.create(self);
  dmAccExport := TdmAccExport.create(self);
  dmAccImport := TdmAccImport.create(self);

  DescriptionLbl.Caption := '';
  with ActionListBox do
    begin
      itemindex := 0;
      ActionListBoxclick(self);
    end;
  ReadCompany;

  frmWTAccExport3.AccSystemEdit.Text := dmAccExport.CompanySQL.fieldbyname('Accounts_Package_Description').asstring;
  frmWTAccExport3.ExportPathEdit.Text := dmAccExport.CompanySQL.fieldbyname('Data_Export_Directory').asstring;
  bUseRevenueCentre := false;

  {Set the revenue centre details}
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    with IniFile do
      begin
        try
          rdgrpRevenueCentre.ItemIndex := strtoint(ReadString('Sales Invoice Export', 'Revenue Centre Option', '0'));
        except
          rdgrpRevenueCentre.ItemIndex := 0;
        end;

        try
          iRevenueCentre := strtoint(ReadString('Sales Invoice Export', 'Revenue Centre', '-1'));
        except
          iRevenueCentre := -1;
        end;
      end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTAccExport1.RunFactorInvEport;
begin
  frmWTAccExportFactInvs := TfrmWTAccExportFactInvs.Create(Self);
  try
    frmWTAccExportFactInvs.ShowModal;
  finally
    frmWTAccExportFactInvs.Free;
  end;
end;

procedure TfrmWTAccExport1.RunFileImport;
begin
  frmWTFileImport := TfrmWTFileImport.Create(Self);
  try
    if ActionListBox.itemindex = 11 then
      frmWTFileImport.FileType := 'QB'
    else
      frmWTFileImport.FileType := 'CSV';

    frmWTFileImport.ShowModal;
  finally
    frmWTFileImport.Free;
  end;
end;

procedure TfrmWTAccExport1.FormActivate(Sender: TObject);
begin
  pnlRevenueCentre.Visible := false;
  bUseRevenueCentre := dtmdlWorktops.UseRevenueCentres;

  pnlRevenueCentre.Visible := bUseRevenueCentre;

  if bUseRevenueCentre then
    begin
      dblkpRevCentre.ListSource := dtsRevenueCentre;

      with qryRevenueCentre do
        begin
          close;
          open;
        end;

//      rdgrpRevenueCentre.ItemIndex := iRevCentreOption;

      if iRevenueCentre > 0 then
        dblkpRevCentre.KeyValue := iRevenueCentre;
    end;
end;

procedure TfrmWTAccExport1.rdgrpRevenueCentreClick(Sender: TObject);
begin
  grpbxRevCentre.Visible := false;
  case (Sender as TRadioGroup).ItemIndex of
      0:  begin
            dblkpRevCentre.keyvalue := -1;
            frmWTAccExport3.sAccountsPackage := dmAccExport.CompanySQl.fieldbyname('Accounts_Package').asstring;
            frmWTAccExport3.sRevCentrePrefix := '';

            iRevenueCentre := 0;
            ActionListBoxClick(self);
          end;
  else
    begin
      grpbxRevCentre.Visible := true;
    end;
  end;

end;

procedure TfrmWTAccExport1.dblkpRevCentreClick(Sender: TObject);
begin
  iRevenueCentre := dblkpRevCentre.KeyValue;
//  frmWTAccExport3.iRevenueCentre := dblkpRevCentre.KeyValue;
  frmWTAccExport3.sAccountsPackage := qryRevenueCentre.fieldbyname('Accounts_Package').asstring;
  frmWTAccExport3.AccSystemEdit.Text := qryRevenueCentre.fieldbyname('Accounts_Package_Description').asstring;
  frmWTAccExport3.sRevCentrePrefix := qryRevenueCentre.fieldbyname('Prefix_Value').asstring;
  ActionListBoxClick(self);
end;

end.
