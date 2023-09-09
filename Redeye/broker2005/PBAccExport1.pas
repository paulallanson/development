(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Export to accounts package.

VSS Info:
$Header: /PBL D5/PBAccExport1.pas 10    8/01/:3 16:20 Paul $
$History: PBAccExport1.pas $
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 8/01/:3    Time: 16:20
 * Updated in $/PBL D5
 * Added functionality to import Maximiser contacts
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 23/04/:2   Time: 10:37
 * Updated in $/PBL D5
 * Chnaged export routines to be non-SOP specific.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 26/10/:1   Time: 17:01
 * Updated in $/PBL D5
 * Added import of Payment from Sage routine
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 18/10/:1   Time: 12:38
 * Updated in $/PBL D5
 * Changes to improve the import and export of data to and from Sage Line
 * 50
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 8/09/:0    Time: 16:43
 * Updated in $/PBL D5
 * Added functionality to import Sage Customer/Supplier/Currency
 * information
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 21/03/:0   Time: 15:05
 * Updated in $/PBL D5
 * Add standard header to new units.

*******************************************************************************)
unit PBAccExport1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBAccExport1Frm = class(TForm)
    NextBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    ActionListBox: TListBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DescriptionLbl: TLabel;
    UpdateBitBtn: TBitBtn;
    ResetBitBtn: TBitBtn;
    procedure NextBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ActionListBoxClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateBitBtnClick(Sender: TObject);
    procedure ResetBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function UpdatesPending: boolean;
    procedure ReadCompany;
    procedure RunDirectDebitExport;
    procedure RunFactorInvEport;
    procedure RunFileImport;
    procedure RunOrderImport;
  public
    { Public declarations }
  end;

var
  PBAccExport1Frm: TPBAccExport1Frm;

implementation

uses
  System.UITypes,
  PBAccExport2, PBAccExport3, PBAccExport4, PBAccExportDM, PBAccImportDM, PBAccExportFactInvs,
  PBFileImport, PBAccExportDirectDebit, PBOrderImport;

var
  iRecordcounter: integer;
{$R *.DFM}

procedure TPBAccExport1Frm.NextBitBtnClick(Sender: TObject);
begin
  PBAccExport1Frm.hide;

  if (ActionListBox.ItemIndex = 16) then
  begin
    RunOrderImport;
    PBAccExport1Frm.show;
    exit;
  end;

  if (ActionListBox.ItemIndex = 11) or (ActionListBox.ItemIndex = 12) then
  begin
    RunFileImport;
    PBAccExport1Frm.show;
    exit;
  end;

  {Export Factoring details}
  if ActionListBox.ItemIndex = 14 then
  begin
    RunFactorInvEport;
    PBAccExport1Frm.show;
    exit;
  end;

  {Export Invoice Direct Debit details}
  if ActionListBox.ItemIndex = 15 then
  begin
    RunDirectDebitExport;
    PBAccExport1Frm.show;
    ActionListBoxClick(self);
    exit;
  end;

  {Check for pending update and display form accordingly}
  if UpdatesPending = true then
    PBAccExport2Frm.show
  else
  begin
    PBAccExport3Frm.sLastForm := PBAccExport1Frm;
    PBAccExport3Frm.show;
  end;
end;

function TPBAccExport1Frm.UpdatesPending: boolean;
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
        end
      else
      {Check for Direct Debit}
      if itemindex = 15 then
        begin
          with dmAccExport.DDPendingSQL do
            begin
              close;
              open;
              irecords := recordcount;
            end;
        end;
    end;
  if irecords > 0 then
    begin
      PBAccExport2Frm.iRecordCounter := irecords;
      iRecordCounter := iRecords;
      result := true;
    end;
end;

procedure TPBAccExport1Frm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBAccExport1Frm.ActionListBoxClick(Sender: TObject);
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
        DescriptionLbl.Caption := 'Import Quickbooks Customer/Supplier details'
      else
      {Import Credit Limits}
      if itemindex = 12 then
        DescriptionLbl.Caption := 'Import CSV Customer/Supplier details'
      else
      {Import Credit Limits}
      if itemindex = 13 then
        DescriptionLbl.Caption := 'Import Maximiser contact details'
      else
      {Import Credit Limits}
      if itemindex = 14 then
        DescriptionLbl.Caption := 'Export Factoring invoice details'
      else
      {Import Credit Limits}
      if itemindex = 15 then
        DescriptionLbl.Caption := 'Export invoice Direct Debit details'
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

procedure TPBAccExport1Frm.ReadCompany;
begin
  with dmAccExport.CompanySQL do
  begin
    Close;
    Open;
    First;
  end;
end;

procedure TPBAccExport1Frm.FormDestroy(Sender: TObject);
begin
  PBAccExport2Frm.free;
  PBAccExport3Frm.free;
  PBAccExport4Frm.free;
  dmAccExport.free;
  dmAccImport.free;
end;

procedure TPBAccExport1Frm.UpdateBitBtnClick(Sender: TObject);
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
          pbaccexport3frm.UpdateCustomers(dmAccExport.UpCustomerSQL,'U','Y');
        end
      else
      {Supplier export}
      if itemindex = 1 then
        begin
          pbaccexport3frm.UpdateSuppliers(dmAccExport.UpSupplierSQL, 'U', 'Y');
        end
      else
      {Sales Invoices export}
      if itemindex = 2 then
        begin
          pbaccexport3frm.UpdateCustomers(dmAccExport.UpCustomerSQL,'I','Y');
          pbaccexport3frm.UpdateSalesStatus(dmAccExport.UpSalesInvSQL,25,30);
        end
      else
      {Purchase Invoices export}
      if itemindex = 3 then
        begin
          pbaccexport3frm.UpdateSuppliers(dmAccExport.UpSupplierSQL,'O','Y');
          pbaccexport3frm.UpdatePurchStatus(dmAccExport.UpSalesInvSQL,25,30);
        end
      else
      {New Order Customer Accounts}
      if itemindex = 4 then
        begin
          pbaccexport3frm.UpdateCustomers(dmAccExport.UpCustomerSQL,'U','Y');
        end
      else
      if itemindex = 15 then
        begin
          pbaccexport3frm.UpdateDDStatus(dmAccExport.DDUpdateSQL);
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

procedure TPBAccExport1Frm.ResetBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Reset the postings pending for '+ActionListBox.items[ActionListBox.itemindex]+'?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  {Re the export depending on the selection}
  with ActionListBox do
    begin
      if itemindex = 0 then
        begin
          pbaccexport3frm.UpdateCustomers(dmAccExport.UpCustomerSQL,'U','N');
        end
      else
      if itemindex = 1 then
        begin
          pbaccexport3frm.UpdateSuppliers(dmAccExport.UpSupplierSQL,'U','N');
        end
      else
      if itemindex = 2 then
        begin
          pbaccexport3frm.UpdateCustomers(dmAccExport.UpCustomerSQL,'I','N');
          pbaccexport3frm.UpdateSalesStatus(dmAccExport.UpSalesInvSQL,25,20);
        end
      else
      if itemindex = 3 then
        begin
          pbaccexport3frm.UpdateSuppliers(dmAccExport.UpSupplierSQL,'O','N');
          pbaccexport3frm.UpdatePurchStatus(dmAccExport.UpSalesInvSQL,25,20);
        end
      else
      if itemindex = 4 then
        begin
          pbaccexport3frm.UpdateCustomers(dmAccExport.UpCustomerSQL,'P','N');
          pbaccexport3frm.UpdateSuppliers(dmAccExport.UpCustomerSQL,'P','N');
        end
      else
      if itemindex = 15 then
        begin
          pbaccexport3frm.UpdateDDStatus(dmAccExport.DDResetSQL);
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

procedure TPBAccExport1Frm.FormCreate(Sender: TObject);
begin
  PBAccExport2Frm := TPBAccExport2Frm.create(self);
  PBAccExport3Frm := TPBAccExport3Frm.create(self);
  PBAccExport4Frm := TPBAccExport4Frm.create(self);
  dmAccExport := TdmAccExport.create(self);
  dmAccImport := TdmAccImport.create(self);

  DescriptionLbl.Caption := '';
  with ActionListBox do
    begin
      itemindex := 0;
      ActionListBoxclick(self);
    end;
  ReadCompany;

  PBAccExport3Frm.AccSystemEdit.Text := dmAccExport.CompanySQL.fieldbyname('Accounts_Package_Description').asstring;
  PBAccExport3Frm.ExportPathEdit.Text := dmAccExport.CompanySQL.fieldbyname('Data_Export_Directory').asstring;
end;

procedure TPBAccExport1Frm.RunFactorInvEport;
begin
  PBAccExportFactInvsFrm := TPBAccExportFactInvsFrm.Create(Self);
  try
    PBAccExportFactInvsFrm.ShowModal;
  finally
    PBAccExportFactInvsFrm.Free;
  end;
end;

procedure TPBAccExport1Frm.RunDirectDebitExport;
begin
  PBAccExportDirectDebitFrm := TPBAccExportDirectDebitFrm.Create(Self);
  try
    PBAccExportDirectDebitFrm.ShowModal;
  finally
    PBAccExportDirectDebitFrm.Free;
  end;
end;

procedure TPBAccExport1Frm.RunFileImport;
begin
  PBFileImportFrm := TPBFileImportFrm.Create(Self);
  try
    if ActionListBox.itemindex = 11 then
      PBFileImportFrm.FileType := 'QB'
    else
      PBFileimportFrm.FileType := 'CSV';

    PBFileImportFrm.ShowModal;
  finally
    PBFileImportFrm.Free;
  end;
end;

procedure TPBAccExport1Frm.RunOrderImport;
begin
  PBOrderImportFrm := TPBOrderImportFrm.Create(Self);
  try
    PBOrderImportFrm.FileType := 'CSV';

    PBOrderImportFrm.ShowModal;
  finally
    PBOrderImportFrm.Free;
  end;
end;

end.
