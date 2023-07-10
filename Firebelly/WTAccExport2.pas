(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Export to accounts package.

VSS Info:
$Header: /PBL D5/PBAccExport2.pas 5     8/09/:0 16:43 Paul $
$History: PBAccExport2.pas $
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 8/09/:0    Time: 16:43
 * Updated in $/PBL D5
 * Added functionality to import Sage Customer/Supplier/Currency
 * information
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 21/03/:0   Time: 15:05
 * Updated in $/PBL D5
 * Add standard header to new units.

*******************************************************************************)
unit WTAccExport2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, gtQrCtrls;

type
  TfrmWTAccExport2 = class(TForm)
    BackBitBtn: TBitBtn;
    UpdateBitBtn: TBitBtn;
    ResetBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    procedure UpdateBitBtnClick(Sender: TObject);
    procedure BackBitBtnClick(Sender: TObject);
    procedure ResetBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iRecordCounter: integer;
  end;

var
  frmWTAccExport2: TfrmWTAccExport2;

implementation

uses WTAccExport3, WTAccExport1, WTAccExportDM, WtAccExport4;

{$R *.DFM}

procedure TfrmWTAccExport2.UpdateBitBtnClick(Sender: TObject);
begin
  {Re the export depending on the selection}
  with frmWTAccExport1.ActionListBox do
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
  frmWTAccExport2.hide;
  frmWTAccExport3.sLastForm := frmWTAccExport1;

  frmWTAccExport3.show;
end;


procedure TfrmWTAccExport2.BackBitBtnClick(Sender: TObject);
begin
  frmWTAccExport2.hide;
  frmWTAccExport1.show;

end;

procedure TfrmWTAccExport2.ResetBitBtnClick(Sender: TObject);
begin
  {Re the export depending on the selection}
  with frmWTAccExport1.ActionListBox do
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
  frmWTAccExport2.hide;
  frmWTAccExport3.show;


end;

procedure TfrmWTAccExport2.FormShow(Sender: TObject);
begin
  Caption := frmWTAccExport1.ActionListBox.Items[frmWTAccExport1.ActionListBox.Itemindex];
end;

procedure TfrmWTAccExport2.CancelBitBtnClick(Sender: TObject);
begin
  frmWTAccExport1.close;
end;

end.
