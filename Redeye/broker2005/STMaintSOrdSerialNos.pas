unit STMaintSOrdSerialNos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, ExtCtrls, DBCtrls, STSOObjects;

type
  TSTMaintSOrdSerialNosFrm = class(TForm)
    Panel1: TPanel;
    label3: TLabel;
    lblProductCode: TLabel;
    Label4: TLabel;
    lblQuantity: TLabel;
    qrySerialNos: TQuery;
    srcSerialNos: TDataSource;
    Label5: TLabel;
    lblSerialItems: TLabel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    lstbxSOLSerialNos: TListBox;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    lstbxSerialNos: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    TempOrderLine: TOrderLine;
    FMode: string;
    Fproduct: string;
    Factivated: boolean;
    FQuantity: real;
    FSerialNumbers: TSerialNumbers;
    FOrderLine: TOrderLine;
    procedure ShowDetails;
    procedure SetMode(const Value: string);
    procedure LoadSerialNumbers;
    procedure Setproduct(const Value: string);
    procedure SetQuantity(const Value: real);
    procedure SetSerialNumbers(const Value: TSerialNumbers);
    procedure CallMaintScreen(aMode: string);
    procedure SetOrderLine(const Value: TOrderLine);
    procedure BuildSOLSerialNos;
    procedure LoadTempOrderLine;
    procedure EnableOK;
    { Private declarations }
  public
    SONumber: integer;
    property Mode: string read FMode write SetMode;
    property OrderLine: TOrderLine read FOrderLine write SetOrderLine;
    property product: string read Fproduct write Setproduct;
    property Quantity: real read FQuantity write SetQuantity;
    property SerialNumbers: TSerialNumbers read FSerialNumbers write SetSerialNumbers;
  end;

var
  STMaintSOrdSerialNosFrm: TSTMaintSOrdSerialNosFrm;

implementation

uses STSelSOrdSerialNos;

{$R *.DFM}

procedure TSTMaintSOrdSerialNosFrm.FormActivate(Sender: TObject);
begin
  if not Factivated then
    begin
      LoadTempOrderLine;
      ShowDetails;
      FActivated := true;
    end;
end;

procedure TSTMaintSOrdSerialNosFrm.ShowDetails;
begin
  if Mode = 'A' then
    begin
      lstbxSOLSerialNos.clear;
    end
  else
    begin
      BuildSOLSerialNos;
    end;
  {Get the existing serial numbers}
  LoadSerialNumbers;
end;

procedure TSTMaintSOrdSerialNosFrm.LoadTempOrderLine;
var
  i: integer;
  SerialNumber: TSerialNumber;
  StockSerialNo: TStockSerialNo;
begin
  TempOrderLine := TOrderLine.create;
  TempOrderLine.Line := OrderLine.Line;
  for i := 0 to pred(OrderLine.serialnumbers.count) do
    begin
      SerialNumber := TSerialNumber.create;
      SerialNumber.Line := OrderLine.Line;
      SerialNumber.SerialNo := i + 1;
      SerialNumber.SerialItemFrom := OrderLine.serialNumbers[i].SerialItemFrom;
      SerialNumber.SerialItemTo := OrderLine.serialNumbers[i].SerialItemTo;
      SerialNumber.SetsPerPad := OrderLine.serialNumbers[i].SetsPerPad;
      TempOrderLine.SerialNumbers.Add(SerialNumber);
    end;

  for i := 0 to pred(OrderLine.StockSerialNos.count) do
    begin
      StockSerialNo := TStockSerialNo.create;
      StockSerialNo.Line := OrderLine.Line;
      StockSerialNo.SerialNo := i + 1;
      StockSerialNo.SerialItemFrom := OrderLine.StockSerialNos[i].SerialItemFrom;
      StockSerialNo.SerialItemTo := OrderLine.StockSerialNos[i].SerialItemTo;
      StockSerialNo.SetsPerPad := OrderLine.StockSerialNos[i].SetsPerPad;
      TempOrderLine.StockSerialNos.Add(StockSerialNo);
    end;
end;

procedure TSTMaintSOrdSerialNosFrm.LoadSerialNumbers;
var
  StockSerialNo: TStockSerialNo;
  inx: integer;
  i: integer;
begin
  OrderLine.StockSerialNos.clear;

  lstbxSerialNos.clear;

  with qrySerialnos do
    begin
      close;
      parambyname('Part').asstring := Product;
      open;
      inx := 0;
      while eof <> true do
        begin
          if (fieldbyname('Sales_order').asinteger = 0) or
             (fieldbyname('Sales_order').asinteger = SONumber) then
            begin
            inx := inx+1;
            StockSerialNo := TStockSerialNo.create;
            StockSerialNo.Line := OrderLine.Line;
            StockSerialNo.SalesOrder := fieldbyname('Sales_order').asinteger;
            StockSerialNo.SalesOrderLine := fieldbyname('Sales_Order_Line_no').asinteger;
            StockSerialNo.SerialNo := inx;
            StockSerialNo.SerialItemFrom := trim(fieldbyname('serial_item_from').asstring);
            StockSerialNo.SerialItemTo := trim(fieldbyname('serial_item_to').asstring);
            StockSerialNo.SerialItemNo := fieldbyname('Serial_item_no').asinteger;
            StockSerialNo.StoreStock := fieldbyname('Store_stock').asinteger;
            if fieldbyname('Sets_per_pad').asinteger = 0 then
              StockSerialNo.SetsPerPad := 1
            else
              StockSerialNo.SetsPerPad := fieldbyname('Sets_per_pad').asinteger;
            OrderLine.StockSerialNos.Add(StockSerialNo);

            lstbxSerialNos.Items.add(StockSerialNo.SerialRange + ' (' + formatfloat('#,##0',StockSerialNo.RangeCount) + ' items)');
            end;
          next;
        end;
    end;

  TempOrderLine.StockserialNos.clear;
  for i := 0 to pred(OrderLine.StockSerialNos.count) do
    begin
      StockSerialNo := TStockSerialNo.Create;
      StockSerialNo.Line := OrderLine.Line;
      StockSerialNo.SalesOrder := OrderLine.StockSerialNos[i].SalesOrder;
      StockSerialNo.SalesOrderLine := OrderLine.StockSerialNos[i].SalesOrderLine;
      StockSerialNo.SerialNo := OrderLine.StockSerialNos[i].SerialNo;
      StockSerialNo.StoreStock := OrderLine.StockSerialNos[i].StoreStock;
      StockSerialNo.SerialItemNo := OrderLine.StockSerialNos[i].SerialItemNo;
      StockSerialNo.SerialItemFrom := OrderLine.StockSerialNos[i].SerialItemFrom;
      StockSerialNo.SerialItemTo := OrderLine.StockSerialNos[i].SerialItemTo;
      StockSerialNo.SetsPerPad := OrderLine.StockSerialNos[i].SetsPerPad;
      TempOrderLine.StockSerialNos.Add(StockSerialNo);
    end;

  with lstbxSerialNos do
    begin
      if items.count > 0 then
        Itemindex := 0
      else
        Itemindex := -1;
      btnAdd.enabled := (Items.count > 0);
    end;
end;

procedure TSTMaintSOrdSerialNosFrm.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TSTMaintSOrdSerialNosFrm.Setproduct(const Value: string);
begin
  Fproduct := Value;
end;

procedure TSTMaintSOrdSerialNosFrm.SetQuantity(const Value: real);
begin
  FQuantity := Value;
  lblQuantity.caption := formatfloat('#,##0',FQuantity);
end;

procedure TSTMaintSOrdSerialNosFrm.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TSTMaintSOrdSerialNosFrm.CallMaintScreen(aMode: string);
var
  SerialNumber: TSerialNumber;
  StockSerialNo: TStockSerialNo;
  inx: integer;
  i: integer;
begin
  inx := lstBxSOLSerialNos.itemindex+1;
  i := lstBxSerialNos.itemindex+1;

  try
  STSelSOrdSerialNosFrm := TSTSelSOrdSerialNosFrm.create(self);
  try
    if aMode = 'A' then
      begin
        i := TempOrderLine.StockSerialNos.IndexFromSerialNo(i);
        StockSerialNo := TempOrderLine.StockSerialNos[i];
        STSelSOrdSerialNosFrm.SetsPerPad := StockSerialNo.SetsPerPad;
        STSelSOrdSerialNosFrm.edtNumberFrom.text := StockSerialNo.SerialItemFrom;
        STSelSOrdSerialNosFrm.edtNumberTo.text := StockSerialNo.SerialItemTo;
        SerialNumber := TSerialNumber.Create;
      end
    else
      begin
        inx := TempOrderLine.SerialNumbers.IndexFromSerialNo(inx);
        SerialNumber := TempOrderLine.SerialNumbers[inx];
        STSelSOrdSerialNosFrm.SetsPerPad := SerialNumber.SetsPerPad;
        STSelSOrdSerialNosFrm.edtNumberFrom.text := SerialNumber.SerialItemFrom;
        STSelSOrdSerialNosFrm.edtNumberTo.text := SerialNumber.SerialItemTo;
      end;

    STSelSOrdSerialNosFrm.OrderLine := OrderLine;
    STSelSOrdSerialNosFrm.TempOrderLine := TempOrderLine;
    STSelSOrdSerialNosFrm.iSerialNo := inx;
    STSelSOrdSerialNosFrm.iLength := length(STSelSOrdSerialNosFrm.edtNumberFrom.text);
    STSelSOrdSerialNosFrm.Mode := aMode;
    STSelSOrdSerialNosFrm.showmodal;
    if StSelSOrdSerialNosFrm.modalresult = idok then
      begin
        if (aMode = 'A') and (StSelSOrdSerialNosFrm.modalresult <> idOK) then
          SerialNumber.free
        else
        if aMode = 'A' then
          begin
            SerialNumber.Line := TempOrderLine.Line;
            SerialNumber.SerialNo := TempOrderLine.Serialnumbers.Count + 1;
            SerialNumber.SerialItemFrom := StSelSOrdSerialNosFrm.edtNumberfrom.text;
            SerialNumber.SerialItemTo := StSelSOrdSerialNosFrm.edtNumberTo.text;
            SerialNumber.SetsPerPad := StSelSOrdSerialNosFrm.SetsPerPad;
            TempOrderLine.SerialNumbers.Add(SerialNumber);
          end
        else
        if aMode = 'C' then
          begin
            SerialNumber.SerialItemFrom := StSelSOrdSerialNosFrm.edtNumberfrom.text;
            SerialNumber.SerialItemTo := StSelSOrdSerialNosFrm.edtNumberTo.text;
          end
        else
          begin
            TempOrderLine.SerialNumbers.Delete(inx);
            TempOrderLine.SerialNumbers.renumber;
          end;
        {Now re-display the Serial numbers allocated to this Sales order}
        BuildSOLSerialNos;
      end;
  finally
    STSelSOrdSerialNosFrm.free;
  end;
  finally
    if aMode = 'A' then
      begin
        inx := pred(TempOrderLine.SerialNumbers.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = 'D' then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    lstbxSOLSerialNos.itemindex := inx+1;
  end;
end;

procedure TSTMaintSORdSerialNosfrm.BuildSOLSerialNos;
var
  i: integer;
begin
  {Now re-display the Serial numbers allocated to this Sales order}
  lstbxSOLSerialNos.clear;
  for i := 0 to pred(TempOrderLine.SerialNumbers.count) do
    begin
      lstbxSOLSerialNos.items.add(TempOrderLine.SerialNumbers[i].serialrange + ' (' +
                                  formatfloat('#,##0',TempOrderLine.SerialNumbers[i].RangeCount) + ' items)');
    end;
  lblSerialItems.caption := formatfloat('#,##0',TempOrderLine.TotalSerialNos);

  if lstbxSOLSerialNos.Items.count > 0 then
    lstbxSOLSerialNos.ItemIndex := 0;
  btnChange.enabled := (lstbxSOLSerialNos.items.count > 0);
  btnDelete.enabled := (lstbxSOLSerialNos.items.count > 0);
  EnableOK;
end;

procedure TSTMaintSOrdSerialNosFrm.SetSerialNumbers(
  const Value: TSerialNumbers);
begin
  FSerialNumbers := Value;
end;

procedure TSTMaintSOrdSerialNosFrm.SetOrderLine(const Value: TOrderLine);
begin
  FOrderLine := Value;
end;

procedure TSTMaintSOrdSerialNosFrm.FormDestroy(Sender: TObject);
begin
  TempOrderLine.free;
end;

procedure TSTMaintSOrdSerialNosFrm.btnOKClick(Sender: TObject);
var
  i: integer;
  SerialNumber: TSerialNumber;
begin
  OrderLine.serialNumbers.clear;
  for i := 0 to pred(tempOrderLine.serialNumbers.count) do
    begin
      SerialNumber := TSerialNumber.Create;
      SerialNumber.Line := TempOrderLine.Line;
      SerialNumber.SerialNo := i + 1;
      SerialNumber.SerialItemFrom := tempOrderLine.SerialNumbers[i].SerialItemFrom;
      SerialNumber.SerialItemTo := tempOrderLine.SerialNumbers[i].SerialItemTo;
      SerialNumber.SetsPerPad := tempOrderLine.SerialNumbers[i].SetsPerPad;
      OrderLine.SerialNumbers.Add(SerialNumber);
    end;
end;

procedure TSTMaintSOrdSerialNosFrm.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TSTMaintSOrdSerialNosFrm.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TSTMaintSOrdSerialNosFrm.EnableOK;
begin
  btnOK.enabled := (TempOrderLine.TotalSerialNos = Quantity);
end;

end.
