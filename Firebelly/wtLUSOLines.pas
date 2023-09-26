unit wtLUSOLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUSOLines = class(TForm)
    Panel1: TPanel;
    dbgDetails: TDBGrid;
    btnSelect: TButton;
    btnCancel: TButton;
    qrySOLines: TFDQuery;
    dtsSOLines: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    edtSalesOrder: TEdit;
    Label2: TLabel;
    edtCustomerName: TEdit;
    qrySOLinesSales_order_Line_no: TIntegerField;
    qrySOLinesSales_Order: TIntegerField;
    qrySOLinesJob: TFloatField;
    qrySOLinesUnit_price: TCurrencyField;
    qrySOLinesQuantity: TIntegerField;
    qrySOLinesUnit_cost: TCurrencyField;
    qrySOLinesQuantity_Allocated: TIntegerField;
    qrySOLinesQuantity_Delivered: TIntegerField;
    qrySOLinesQuantity_Invoiced: TIntegerField;
    qrySOLinesSell_Unit: TIntegerField;
    qrySOLinesCost_Unit: TIntegerField;
    qrySOLinesNett_Price: TCurrencyField;
    qrySOLinesDiscount_Value: TCurrencyField;
    qrySOLinesInstallation_price: TCurrencyField;
    qrySOLinesSurvey_price: TCurrencyField;
    qrySOLinesDelivery_Price: TCurrencyField;
    qrySOLinesVat: TIntegerField;
    qrySOLinesDescription: TWideStringField;
    qrySOLinesProduct: TIntegerField;
    qrySOLinesQuote: TIntegerField;
    qrySOLinesMarkup_Value: TFloatField;
    qrySOLinesWaste_Value: TFloatField;
    qrySOLinesSSMA_TimeStamp: TBytesField;
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

uses UITypes;
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
