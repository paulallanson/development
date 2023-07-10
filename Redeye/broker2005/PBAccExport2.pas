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
unit PBAccExport2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBAccExport2Frm = class(TForm)
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
  PBAccExport2Frm: TPBAccExport2Frm;

implementation

uses PBAccExport3, PBAccExport1, PBAccExportDM, PBAccExport4;

{$R *.DFM}

procedure TPBAccExport2Frm.UpdateBitBtnClick(Sender: TObject);
begin
  {Re the export depending on the selection}
  with PBAccExport1Frm.ActionListBox do
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
        end;
    end;
  pbaccexport2frm.hide;
  pbaccexport3frm.sLastForm := pbaccexport1frm;

  pbaccexport3frm.show;
end;


procedure TPBAccExport2Frm.BackBitBtnClick(Sender: TObject);
begin
  pbaccexport2frm.hide;
  pbaccexport1frm.show;

end;

procedure TPBAccExport2Frm.ResetBitBtnClick(Sender: TObject);
begin
  {Re the export depending on the selection}
  with PBAccExport1Frm.ActionListBox do
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
        end;
    end;
  pbaccexport2frm.hide;
  pbaccexport3frm.show;


end;

procedure TPBAccExport2Frm.FormShow(Sender: TObject);
begin
  Caption := PBAccExport1Frm.ActionListBox.Items[PBAccExport1Frm.ActionListBox.Itemindex];
end;

procedure TPBAccExport2Frm.CancelBitBtnClick(Sender: TObject);
begin
  PBAccExport1Frm.close;
end;

end.
