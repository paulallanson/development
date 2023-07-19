unit wtLUSalesOrderQuotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB, wtSalesOrderDM;

type
  TfrmWTLUSalesOrderQuotes = class(TForm)
    stbrDetails: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnSelect: TBitBtn;
    edtNumber: TEdit;
    edtCustomerName: TEdit;
    BitBtn1: TBitBtn;
    dbgDetails: TDBGrid;
    Label3: TLabel;
    edtReference: TEdit;
    tmrRefresh: TTimer;
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtReferenceChange(Sender: TObject);
  private
    procedure SetQuoteEdit(Dataset: TDataset);
    procedure LoadFromQuote;
    procedure SetButtons(Sender: TObject; Field: TField);
    { Private declarations }
  public
    Customer: integer;
    SOLine: TSOLine;
  end;

var
  frmWTLUSalesOrderQuotes: TfrmWTLUSalesOrderQuotes;

implementation

uses UITypes;
{$R *.dfm}

procedure TfrmWTLUSalesOrderQuotes.SetQuoteEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgdetails.datasource := dtmdlSalesOrder.dsCustQuotes;
      try
        edtNumber.Text := floatToStr(Dataset.FieldByName('Quote').asinteger);
      except
        edtNumber.Text := '';
      end;
    end
  else
    dbgdetails.datasource := dtmdlSalesOrder.dsDummy;
end;

procedure TfrmWTLUSalesOrderQuotes.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgDetails.Datasource.Dataset.Locate('Quote',Variant(edtNumber.text), [loPartialKey]) then
      btnSelectClick(self)
    else
      ShowMessage('Quote: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmWTLUSalesOrderQuotes.FormCreate(Sender: TObject);
begin
  dtmdlSalesOrder := TdtmdlSalesOrder.Create(Application);
  dbgDetails.DataSource := dtmdlSalesOrder.dsCustQuotes;
  dtmdlSalesOrder.dsCustQuotes.OnDataChange := SetButtons;
  dtmdlSalesOrder.qryCustQuotes.AfterScroll := SetQuoteEdit;
end;

procedure TfrmWTLUSalesOrderQuotes.FormShow(Sender: TObject);
begin
  dtmdlSalesOrder.customer := customer;
  dtmdlSalesOrder.refreshQuotedata;
  edtNumber.setfocus;
end;

procedure TfrmWTLUSalesOrderQuotes.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Do you want to add this quote to the sales order?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      LoadfromQuote;
      ModalResult := mrOK;
    end;
end;

procedure TfrmWTLUSalesOrderQuotes.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlSalesOrder do
  begin
    btnSelect.enabled := (qryCustQuotes.recordcount > 0);
  end;
end;

procedure TfrmWTLUSalesOrderQuotes.LoadFromQuote;
begin
  with SOLine, dbgDetails.Datasource.dataset do
    begin
//      SOLNumber := Parent.Lines.Count + 1;
      SOLNumber := Parent.Lines.MaxLineNo + 1;
      Quantity := 1;
      CostUnit := 1;
      MarkupValue := FieldByName('Markup_Value').asfloat;
      DeliveryPrice := FieldByName('Delivery_Price').asfloat;
      Description := FieldByName('Description').asstring;
      DiscountValue := FieldByName('Discount_Value').asfloat;
      InstallPrice := FieldByName('Installation_Price').asfloat;
      WasteValue := FieldByName('Waste_Value').asfloat;
      Quote := FieldByName('Quote').asinteger;
      Job := parent.DataModule.getQuoteJob(Quote);
      NettPrice := fieldbyname('Nett_Price').asfloat;
      QtyAllocated := 0;
      QtyDelivered := 0;
      QtyInvoiced := 0;
      SellUnit := 1;
      Product := 0;
      StockDescription := '';
      StockCode := '';
      SurveyPrice := FieldByName('Survey_Price').asfloat;
      UnitPrice := NettPrice + DeliveryPrice + InstallPrice + SurveyPrice - DiscountValue + MarkupValue + WasteValue;
      UnitCost := 0;
      Vat := FieldByName('Vat').asinteger;
      VatDescription := parent.datamodule.getVatDescription(Vat);
      VatRate := parent.datamodule.getVatRate(Vat);
      SOLine.Parent.Lines.Add(SOLine);
    end;
end;

procedure TfrmWTLUSalesOrderQuotes.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesOrderQuotes.FormDestroy(Sender: TObject);
begin
  dtmdlSalesOrder.Free;
end;

procedure TfrmWTLUSalesOrderQuotes.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.recordcount > 0 then
    btnSelectClick(self);
end;

procedure TfrmWTLUSalesOrderQuotes.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  dtmdlSalesOrder.refreshQuotedata;
end;

procedure TfrmWTLUSalesOrderQuotes.edtReferenceChange(Sender: TObject);
begin
  dtmdlSalesOrder.Reference := edtReference.Text;

  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
