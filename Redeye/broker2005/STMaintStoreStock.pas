unit STMaintStoreStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintStoreStockfrm = class(TForm)
    qryStoreStock: TFDQuery;
    pnlproduct: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    PartEdit: TEdit;
    DescriptionEdit: TEdit;
    Panel1: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    memInStock: TEdit;
    memAllocated: TEdit;
    pnlFunctions: TPanel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label14: TLabel;
    WarehouseEdit: TEdit;
    Label15: TLabel;
    BinLocationEdit: TEdit;
    chkbxPaidFor: TCheckBox;
    qryUpStoreStock: TFDQuery;
    qryDelStoreStock: TFDQuery;
    qryGetPartStoreAlloc: TFDQuery;
    lblMessage: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    FStoreStock: integer;
    procedure ShowDetails;
    procedure SetStoreStock(const Value: integer);
    procedure CheckStoreAllocation;
    { Private declarations }
  public
    property StoreStock: integer read FStoreStock write SetStoreStock;
  end;

var
  STMaintStoreStockfrm: TSTMaintStoreStockfrm;

implementation

{$R *.dfm}

procedure TSTMaintStoreStockfrm.FormActivate(Sender: TObject);
begin
  with qryStoreStock do
    begin
      close;
      parambyname('Store_Stock').asinteger := StoreStock;
      open;
    end;
  ShowDetails;
  CheckStoreAllocation;
end;

procedure TSTMaintStoreStockfrm.SetStoreStock(const Value: integer);
begin
  FStoreStock := Value;
end;

procedure TSTMaintStoreStockfrm.ShowDetails;
begin
  PartEdit.Text := qryStoreStock.fieldbyname('Part').asstring;
  DescriptionEdit.Text := qryStoreStock.fieldbyname('Part_Description').asstring;

  WarehouseEdit.Text := qryStoreStock.fieldbyname('Part_Store_Name').asstring;
  BinLocationEdit.Text := qryStoreStock.fieldbyname('Part_Bin').asstring;

  memInStock.Text := inttostr(qryStoreStock.fieldbyname('Store_Quantity').asinteger);
  memAllocated.Text := inttostr(qryStoreStock.fieldbyname('Quantity_Allocated').asinteger);

  chkbxPaidFor.Checked := (qryStoreStock.fieldbyname('Invoice_upfront').asstring = 'Y');
end;

procedure TSTMaintStoreStockfrm.CheckStoreAllocation;
begin
  with qryGetPartStoreAlloc do
    begin
      close;
      parambyname('Store_Stock').asinteger := StoreStock;
      open;
      
      memAllocated.enabled := (recordcount = 0);
      memInStock.enabled := (recordcount = 0);
      lblMessage.Visible := (recordcount > 0);
    end;
end;

procedure TSTMaintStoreStockfrm.OKBtnClick(Sender: TObject);
begin
  with qryUpStoreStock do
    begin
      close;
      parambyname('Store_Stock').asinteger := StoreStock;
      parambyname('Store_Quantity').asinteger := strtoint(memInStock.text);
      parambyname('Quantity_Allocated').asinteger := strtoint(memAllocated.text);
      if chkbxPaidFor.checked then
        parambyname('Invoice_upfront').asstring := 'Y'
      else
        parambyname('Invoice_upfront').asstring := 'N';
      execsql
    end;

  {Delete the store stock record if Store Quantity is zero and allcoated stock is zero}
  with qrydelStoreStock do
    begin
      close;
      parambyname('Store_Stock').asinteger := StoreStock;
      execsql;
    end;
    
  Close;
end;

procedure TSTMaintStoreStockfrm.CancelBtnClick(Sender: TObject);
begin
  close;
end;

end.
