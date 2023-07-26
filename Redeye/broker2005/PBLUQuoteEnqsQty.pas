unit PBLUQuoteEnqsQty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, DB, pbQuotesDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUQuoteEnqsQtyFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    btnSelect: TButton;
    stsbrDetails: TStatusBar;
    dbgDetails: TDBGrid;
    qryCustEnquiryQtys: TFDQuery;
    tmrSearch: TTimer;
    dtsCustEnquiryQtys: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FQuoteSupply: TQuoteSupply;
    procedure RefreshData;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetQuoteSupply(const Value: TQuoteSupply);
    { Private declarations }
  public
    branch: integer;
    customer: integer;
    customername: string;
    Description: string;
    quoteNo: integer;
    SelCode: integer;
    SelLine: integer;
    Selected: boolean;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property QuoteSupply: TQuoteSupply read FQuoteSupply write SetQuoteSupply;
  end;

var
  PBLUQuoteEnqsQtyFrm: TPBLUQuoteEnqsQtyFrm;

implementation

{$R *.dfm}

procedure TPBLUQuoteEnqsQtyFrm.RefreshData;
begin
  with qryCustEnquiryQtys do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TPBLUQuoteEnqsQtyFrm.FormCreate(Sender: TObject);
begin
  dtsCustEnquiryQtys.OnDataChange := SetButtons;
  dbgDetails.datasource := dtsCustEnquiryQtys;
end;

procedure TPBLUQuoteEnqsQtyFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TPBLUQuoteEnqsQtyFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUQuoteEnqsQtyFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUQuoteEnqsQtyFrm.SetButtons(Sender: TObject; Field: TField);
begin
  btnSelect.Enabled := qryCustEnquiryQtys.recordcount > 0;
  stsBrDetails.panels[0].text := inttostr(qryCustEnquiryQtys.recordcount) + ' records displayed';
end;

procedure TPBLUQuoteEnqsQtyFrm.FormShow(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  refreshdata;
end;

procedure TPBLUQuoteEnqsQtyFrm.btnCloseClick(Sender: TObject);
begin
  selected := false;
  close;
end;

procedure TPBLUQuoteEnqsQtyFrm.btnSelectClick(Sender: TObject);
var
  iStatus: integer;
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iStatus := dbgDetails.datasource.DataSet.FieldByName('enquiry_status').AsInteger;

  QuoteSupply.Enquiry := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  QuoteSupply.EnquiryLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  QuoteSupply.Description := dbgDetails.datasource.DataSet.FieldByName('Form_Description').asstring;
  QuoteSupply.Quantity := dbgDetails.datasource.DataSet.FieldByName('Quantity').asinteger;
  QuoteSupply.UnitSell := dbgDetails.datasource.DataSet.FieldByName('Quotation_Price').asfloat;
  QuoteSupply.PriceUnit := dbgDetails.datasource.DataSet.FieldByName('Price_unit').asinteger;
  QuoteSupply.UnitCost := dbgDetails.datasource.DataSet.FieldByName('Supplier_Price').asfloat;
  QuoteSupply.ProductType := dbgDetails.datasource.DataSet.FieldByName('Product_Type').asinteger;
  QuoteSupply.ProductTypeDesc := dbgDetails.datasource.DataSet.FieldByName('Product_Type_Description').asstring;
  QuoteSupply.PriceUnitDesc := dbgDetails.datasource.DataSet.FieldByName('Price_unit_Description').asstring;
  QuoteSupply.PriceUnitFactor := dbgDetails.datasource.DataSet.FieldByName('Price_unit_Factor').asinteger;
  QuoteSupply.QSupplyNo := QuoteSupply.Parent.Supplies.MaxLineNo + 1;
  QuoteSupply.Parent.Supplies.Add(QuoteSupply);

  Selected := true;
  close;
end;

procedure TPBLUQuoteEnqsQtyFrm.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Enquiry').asstring <> '' then
    btnSelectClick(self);
end;

procedure TPBLUQuoteEnqsQtyFrm.SetQuoteSupply(const Value: TQuoteSupply);
begin
  FQuoteSupply := Value;
end;

end.
