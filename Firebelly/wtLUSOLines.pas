unit wtLUSOLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmWTLUSOLines = class(TForm)
    Panel1: TPanel;
    dbgDetails: TDBGrid;
    btnSelect: TButton;
    btnCancel: TButton;
    qrySOLines: TQuery;
    dtsSOLines: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    edtSalesOrder: TEdit;
    Label2: TLabel;
    edtCustomerName: TEdit;
    qrySOLinesSales_order_Line_no: TIntegerField;
    qrySOLinesSales_Order: TIntegerField;
    qrySOLinesJob: TFloatField;
    qrySOLinesUnit_price: TFloatField;
    qrySOLinesQuantity: TIntegerField;
    qrySOLinesUnit_cost: TFloatField;
    qrySOLinesQuantity_Allocated: TIntegerField;
    qrySOLinesQuantity_Delivered: TIntegerField;
    qrySOLinesQuantity_Invoiced: TIntegerField;
    qrySOLinesSell_Unit: TIntegerField;
    qrySOLinesCost_Unit: TIntegerField;
    qrySOLinesNett_Price: TFloatField;
    qrySOLinesDiscount_Value: TFloatField;
    qrySOLinesInstallation_price: TFloatField;
    qrySOLinesSurvey_price: TFloatField;
    qrySOLinesDelivery_Price: TFloatField;
    qrySOLinesVat: TIntegerField;
    qrySOLinesDescription: TStringField;
    qrySOLinesProduct: TIntegerField;
    qrySOLinesQuote: TIntegerField;
    qrySOLinesMarkup_Value: TFloatField;
    qrySOLinesWaste_Value: TFloatField;
    qrySOLinesSupply_Price: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    FSalesOrder: integer;
    FCustomerName: string;
    FQuoteNumber: integer;
    procedure SetCustomerName(const Value: string);
    procedure SetSalesOrder(const Value: integer);
    procedure SetQuoteNumber(const Value: integer);
    { Private declarations }
  public
    property CustomerName: string read FCustomerName write SetCustomerName;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property QuoteNumber: integer read FQuoteNumber write SetQuoteNumber;
  end;

var
  frmWTLUSOLines: TfrmWTLUSOLines;

implementation

{$R *.dfm}

{ TfrmWTLUSOLines }

procedure TfrmWTLUSOLines.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  edtCustomerName.text := FCustomerName;
end;

procedure TfrmWTLUSOLines.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
  edtSalesOrder.text := inttostr(FSalesOrder);
end;

procedure TfrmWTLUSOLines.FormActivate(Sender: TObject);
begin
  with qrySOLines do
    begin
      close;
      parambyname('sales_order').asinteger := SalesOrder;
      open;

      btnselect.Enabled := (recordcount > 0);
    end;
end;

procedure TfrmWTLUSOLines.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSOLines.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Do you want to convert quote ' + dbgDetails.DataSource.DataSet.fieldbyname('Quote').asstring + ', to a new job?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  QuoteNumber := dbgDetails.DataSource.DataSet.fieldbyname('Quote').asinteger;
  modalresult := idOK;
end;

procedure TfrmWTLUSOLines.SetQuoteNumber(const Value: integer);
begin
  FQuoteNumber := Value;
end;

end.
