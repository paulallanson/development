unit PBLUSalesInvoicePO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls,
  PBSalesInvoiceDm, CCSCommon, ComCtrls, Variants;

type
  TPBLUSalesInvoicePOfrm = class(TForm)
    SearchTimer: TTimer;
    Panel1: TPanel;
    chkSuppInvoiced: TCheckBox;
    CustomerGroupBox: TGroupBox;
    Label1: TLabel;
    edtCustomerName: TEdit;
    GroupBox1: TGroupBox;
    edtPONumber: TEdit;
    GroupBox2: TGroupBox;
    btnSelect: TBitBtn;
    btnClose: TBitBtn;
    Panel2: TPanel;
    dbgPO: TDBGrid;
    chkAllOrders: TCheckBox;
    stbrDetails: TStatusBar;
    Label2: TLabel;
    btnSweep: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure chkSuppInvoicedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPOCellClick(Column: TColumn);
    procedure SearchTimerTimer(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure dbgPODblClick(Sender: TObject);
    procedure chkAllOrdersClick(Sender: TObject);
    procedure edtPONumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgPODrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSweepClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FInvoiceDate: string;
    FSalesInvoice: TSalesInvoice;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetPurchaseOrderEdit(Dataset: TDataset);
    procedure SetInvoiceDate(const Value: string);
    procedure SetSalesInvoice(const Value: TSalesInvoice);
  public
   property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
   property InvoiceDate: string read FInvoiceDate write SetInvoiceDate;
   property SalesInvoice: TSalesInvoice read FSalesInvoice write SetSalesInvoice;
  end;

var
  PBLUSalesInvoicePOfrm: TPBLUSalesInvoicePOfrm;

const

NonStockSQL =
  ' AND ' +
  '((select sum(Qty_Delivered) ' +
  ' from Delivery_Detail ' +
  ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purchase_Order and '+
  ' Delivery_Detail.Line = Purchase_OrderLine.Line and '+
  ' ( ' +
  ' (Delivery_Detail.delivery_to_Stock is null) or ' +
  ' (Delivery_Detail.delivery_to_Stock = ''N''))) > 0) and '+
  '((select sum(Qty_Delivered) ' +
  ' from Delivery_Detail ' +
  ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purchase_Order and '+
  ' Delivery_Detail.Line = Purchase_OrderLine.Line and '+
  ' ( ' +
  ' (Delivery_Detail.delivery_to_Stock is null) or ' +
  ' (Delivery_Detail.delivery_to_Stock = ''N''))) > Purchase_OrderLine.Qty_Invoiced) ' +
  ' ORDER BY Purchase_OrderLine.Purchase_Order DESC, Purchase_OrderLine.Line ';

StockSQL =
  ' ORDER BY Purchase_OrderLine.Purchase_Order DESC, Purchase_OrderLine.Line ';

implementation

uses UITypes, 
  PBMaintSalesInvoice, pbMainMenu;

{$R *.DFM}

procedure TPBLUSalesInvoicePOfrm.FormShow(Sender: TObject);
begin
  dmSalesInvoice.refreshPOdata;
  with dbgPO do
    begin
      try
        if Assigned(datasource.dataset) then
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtPONumber.setfocus;
end;

procedure TPBLUSalesInvoicePOfrm.chkSuppInvoicedClick(Sender: TObject);
begin
  dmSalesInvoice.displaySuppInvoiced := (sender as Tcheckbox).checked;
  dmSalesInvoice.refreshPOdata;
  with dbgPO do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBLUSalesInvoicePOfrm.FormCreate(Sender: TObject);
begin
  stbrDetails.Top := Screen.Height - stbrDetails.Height;

  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  dmSalesInvoice.dsPOLine.OnDataChange := SetButtons;
  dmSalesInvoice.qryPOAllLines.AfterScroll := SetPurchaseOrderEdit;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUSalesInvoicePOfrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnSelect.enabled := (qryPOAllLines.recordcount > 0);
    btnSweep.enabled := (qryPOAllLines.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qryPOAllLines.recordcount) + ' purchase orders listed';
  end;
end;

procedure TPBLUSalesInvoicePOfrm.SetPurchaseOrderEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgPO.datasource := dmSalesInvoice.dsPOLine;
      try
        edtPONumber.Text := floatToStr(Dataset.FieldByName('Purchase_Order').asfloat);
      except
        edtPONumber.Text := '';
      end;
    end
  else
    dbgPO.datasource := dmSalesInvoice.dsDummy;
end;

procedure TPBLUSalesInvoicePOfrm.dbgPOCellClick(Column: TColumn);
begin
  with dbgPO do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

procedure TPBLUSalesInvoicePOfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSalesInvoice.CustomerName := edtCustomerName.text;
  dmSalesInvoice.RefreshPOData;
  with dbgPO do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBLUSalesInvoicePOfrm.edtCustomerNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSalesInvoicePOfrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSalesInvoicePOfrm.SetInvoiceDate(const Value: string);
begin
  FInvoiceDate := Value;
end;

procedure TPBLUSalesInvoicePOfrm.dbgPODblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSalesInvoicePOfrm.chkAllOrdersClick(Sender: TObject);
begin
  dmSalesInvoice.displayAllOrders := (sender as Tcheckbox).checked;
  dmSalesInvoice.refreshPOdata;
  with dbgPO do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBLUSalesInvoicePOfrm.edtPONumberKeyPress(Sender: TObject;
  var Key: Char);
var
  sTempCode: string;
begin
  if Key = #13 then { if it's an enter key }
  begin
    {Save the original entry}
    sTempCode := edtPONumber.Text;

    {Unselect everything}
    with dbgPO.DataSource.dataset do
      begin
        first ;
        while EOF <> true do
          begin
            dbgPO.SelectedRows.CurrentRowSelected := false ;
            next ;
           end;
        first;
      end;
      
    if dbgPO.Datasource.Dataset.Locate('Purchase_Order;Line',VarArrayOf([sTempCode,'1']), [loPartialKey]) then
      begin
        dbgPO.SelectedRows.CurrentRowSelected := True ;
        btnSelectClick(self)
      end
     else
      ShowMessage('Purchase Order: '+ edtPONumber.Text + ' does not exist in the current selection.');
  end;

end;

procedure TPBLUSalesInvoicePOfrm.btnSelectClick(Sender: TObject);
var
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  icount: integer;
begin
  if dbgPO.SelectedRows.Count = 1 then
    begin
      aInvoice := TSalesInvoice.Create(dmSalesInvoice);
      try
        dmSalesInvoice.PONumber := dbgPO.DataSource.dataset.fieldbyname('Purchase_Order').asfloat;
        dmSalesInvoice.Line := dbgPO.DataSource.dataset.fieldbyname('Line').asinteger;
        if dbgPO.DataSource.dataset.fieldbyname('Ready_to_Invoice').asstring = 'Y' then
          dmSalesInvoice.InvoiceQty := dbgPO.DataSource.dataset.fieldbyname('Quantity').asinteger
        else
          dmSalesInvoice.InvoiceQty := dbgPO.DataSource.dataset.fieldbyname('Qty_to_be_invoiced').asinteger;
        dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);
        aInvoice.LoadFromPO;
        Frm := TPBMaintSalesInvoicefrm.Create(Self);
        try
          Frm.Mode := siRaise;
          Frm.SalesInvoice := aInvoice;
          Frm.ShowModal;
          if Frm.ModalResult = idOK then
            ModalResult := idok;
        finally
          Frm.Free;
        end;
      finally
        aInvoice.Free;
      end;
    end
  else
    begin
      if MessageDlg('Do you want to raise invoices for the selected orders?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgPO.SelectedRows.Count - 1) do
            begin
              dbgPO.datasource.DataSet.GotoBookmark(TBookmark(dbgPO.SelectedRows[iCount])) ;
              aInvoice := TSalesInvoice.Create(dmSalesInvoice);
              try
                dmSalesInvoice.PONumber := dbgPO.DataSource.dataset.fieldbyname('Purchase_Order').asfloat;
                dmSalesInvoice.Line := dbgPO.DataSource.dataset.fieldbyname('Line').asinteger;
                if dbgPO.DataSource.dataset.fieldbyname('Ready_to_Invoice').asstring = 'Y' then
                  dmSalesInvoice.InvoiceQty := dbgPO.DataSource.dataset.fieldbyname('Quantity').asinteger
                else
                  dmSalesInvoice.InvoiceQty := dbgPO.DataSource.dataset.fieldbyname('Qty_to_be_invoiced').asinteger;
                dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);
                aInvoice.LoadFromPO;
                aInvoice.SaveToDB(true);
                ModalResult := idOK;
              finally
                aInvoice.Free;
              end;
            end;
        end;
    end;
end;

procedure TPBLUSalesInvoicePOfrm.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUSalesInvoicePOfrm.SetSalesInvoice(
  const Value: TSalesInvoice);
begin
  FSalesInvoice := Value;
end;

procedure TPBLUSalesInvoicePOfrm.dbgPODrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dbgPO.datasource.dataset.fieldbyname('Invoice_upfront').asstring = 'Y' then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  if  (Column.Title.Caption <> 'Number') and
      (Column.Title.Caption <> 'Qty on Order') and
      (Column.Title.Caption <> 'Qty to Invoice') and
      (Column.Title.Caption <> 'Sell Price') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
  	begin
      WITH Sender AS TDBGrid DO
        BEGIN
          if (Column.Title.Caption <> 'Number') and
             (Column.Title.Caption <> 'Qty on Order') and
             (Column.Title.Caption <> 'Qty to Invoice') and
             (Column.Title.Caption <> 'Sell Price') then
              begin
                Canvas.Brush.Color := Color;
                Canvas.Font.Color  := Font.Color;
                Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, Column.field.asstring);
               end;
        END;
 			{Display the Columns Right justified in the cells}
      if (Column.Title.Caption = 'Sell Price') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

      Column.Alignment := taRightJustify;
    end;
end;

procedure TPBLUSalesInvoicePOfrm.btnSweepClick(Sender: TObject);
begin
  with dbgPO.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgPO.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

end.
