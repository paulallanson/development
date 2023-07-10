unit PBMaintJobBagRecStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, StdCtrls, ExtCtrls, Buttons;

type
  TfrmPBMaintJobBagRecStock = class(TForm)
    Panel4: TPanel;
    Label1: TLabel;
    lblJobBag: TLabel;
    Label3: TLabel;
    lblDescription: TLabel;
    Label6: TLabel;
    lblCustomerName: TLabel;
    Panel3: TPanel;
    btnReconcile: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    sgLines: TStringGrid;
    qryJBStock: TQuery;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryGetJBSalesOrders: TQuery;
    qryGetJBReturns: TQuery;
    qryUpdSO: TQuery;
    qryUpdJBReturn: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgLinesDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgLinesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgLinesKeyPress(Sender: TObject; var Key: Char);
    procedure sgLinesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
  private
    FActivated: boolean;
    FJobBag: integer;
    FDescription: string;
    FCustomerName: string;
    FCustomer: integer;
    procedure ShowDetails;
    procedure ShowLineDetails;
    procedure SetJobBag(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetLineHeaders;
    procedure SetCustomer(const Value: integer);
    procedure UpdateSalesOrderLines(tempPart: string; tempQty: integer);
    procedure UpdateReturns(tempPart: string; tempQty: integer);
    procedure UpdateSalesOrder(tempSO, tempLine, tempQty: integer);
    procedure UpdateJBReturns(tempCode, tempQty: integer);
  public
    property JobBag: integer read FJobBag write SetJobBag;
    property Description: string read FDescription write SetDescription;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
  end;

var
  frmPBMaintJobBagRecStock: TfrmPBMaintJobBagRecStock;

implementation

{$R *.dfm}

procedure TfrmPBMaintJobBagRecStock.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    showdetails;
    showlinedetails;
    FActivated := true;
  end;
end;

procedure TfrmPBMaintJobBagRecStock.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TfrmPBMaintJobBagRecStock.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TfrmPBMaintJobBagRecStock.SetJobBag(const Value: integer);
begin
  FJobBag := Value;
end;

procedure TfrmPBMaintJobBagRecStock.ShowDetails;
begin
  lblJobBag.Caption := inttostr(JobBag);
  lblDescription.caption := description;
  lblCustomerName.caption := CustomerName;
end;

procedure TfrmPBMaintJobBagRecStock.ShowLineDetails;
var
  icount: integer;
begin
  with qryJBStock, sgLines do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag;
      open;

      icount := 0;
      while eof <> true do
        begin
          icount := icount + 1;
          cells[0,icount] := inttostr(icount);
          cells[1,icount] := fieldbyname('Part').asstring;
          cells[2,icount] := fieldbyname('Part_Description').asstring;
          cells[3,icount] := fieldbyname('Qty_Ordered').asstring;
          cells[4,icount] := inttostr(fieldbyname('Qty_Despatched').asinteger);
          cells[5,icount] := fieldbyname('Qty_Overs').asstring;

          {these two are used for calculation purposes}
          cells[6,icount] := inttostr(fieldbyname('Qty_Despatched').asinteger + fieldbyname('Qty_Overs').asinteger);
          cells[7,icount] := inttostr(fieldbyname('Qty_Overs').asinteger);
          next;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;

      btnReconcile.Enabled := recordcount > 0;
      btnOK.enabled := recordcount > 0;
    end;
end;

procedure TfrmPBMaintJobBagRecStock.FormCreate(Sender: TObject);
begin
  SetLineHeaders;
end;

procedure TfrmPBMaintJobBagRecStock.SetLineHeaders;
begin
  {Invoice Line header}
  sgLines.cells[0,0] := 'Line';
  sgLines.cells[1,0] := 'Product';
  sgLines.cells[2,0] := 'Description';
  sgLines.cells[3,0] := 'Qty Requested';
  sgLines.cells[4,0] := 'Qty Produced';
  sgLines.cells[5,0] := 'Qty Overs';
  sgLines.ColWidths[6] := 0;
end;

procedure TfrmPBMaintJobBagRecStock.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmPBMaintJobBagRecStock.sgLinesDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (vRow <> 0) and (vCol <> 0) then
      begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
      end;
  end;

  if qryJBStock.RecordCount > 0 then
  begin
    if (vCol <= 2) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

    end
    else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;
end;

procedure TfrmPBMaintJobBagRecStock.sgLinesSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
	if (aCol = 5) then
    sgLines.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    sgLines.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TfrmPBMaintJobBagRecStock.sgLinesKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TfrmPBMaintJobBagRecStock.sgLinesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  irow: integer;
  iQtyProduced: integer;
begin
  with sgLines do
  begin
    irow := Row;

    iQtyProduced := strtoint(cells[6,irow]);

    try
      cells[4,irow] := inttostr(iQtyProduced - strtoint(cells[5,irow]));
    except
      cells[4,irow] := inttostr(iQtyProduced);
    end;
  end;
end;

procedure TfrmPBMaintJobBagRecStock.btnOKClick(Sender: TObject);
var
  icount: integer;
  iOverstoAdd: integer;
begin
  for icount := 1 to pred(sgLines.rowcount) do
    begin
      iOverstoAdd := strtoint(sgLines.Cells[7,icount]) - strtoint(sgLines.Cells[5,icount]);

      UpdateSalesOrderLines(sgLines.Cells[1,icount],iOversToAdd);
      UpdateReturns(sgLines.Cells[1,icount],iOversToAdd)
    end;
end;

procedure TfrmPBMaintJobBagRecStock.UpdateSalesOrderLines(tempPart: string; tempQty: integer);
var
  iQtyOvers: integer;
  iQty: integer;
begin
  if tempQty = 0 then exit;

  iQtyOvers := tempQty;

  with qryGetJBSalesOrders do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag;
      parambyname('Part').asstring := tempPart;
      open;
      first;

      UpdateSalesOrder(fieldbyname('Sales_order').asinteger,fieldbyname('Sales_order_line_no').asinteger,iQtyOvers);
    end;
end;

procedure TfrmPBMaintJobBagRecStock.UpdateReturns(tempPart: string; tempQty: integer);
var
  iQtyOvers: integer;
  iQty: integer;
begin
  if tempQty = 0 then exit;

  iQtyOvers := tempQty;

  with qryGetJBReturns do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag;
      parambyname('Part').asstring := tempPart;
      open;

      while eof <> true do
        begin
          iQty := fieldbyname('Quantity').asinteger;
          if iQty >= iQtyOvers then
            UpdateJBReturns(fieldbyname('Job_bag_Return').asinteger, iQtyOvers)
          else
            begin
              iQtyOvers := iQtyOvers - iQty;
              UpdateJBreturns(fieldbyname('Job_bag_Return').asinteger, iQtyOvers);
              /// Update the store stock record here;
            end;
          next;
        end;
    end;
end;

procedure TfrmPBMaintJobBagRecStock.UpdateSalesOrder(tempSO, tempLine: integer; tempQty: integer);
begin
  with qryUpdSO do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSO;
      parambyname('Sales_order_line_no').asinteger := tempLine;
      parambyname('Quantity_Delivered').asinteger := tempQty;
      execsql;
    end;
end;

procedure TfrmPBMaintJobBagRecStock.UpdateJBReturns(tempCode: integer; tempQty: integer);
begin
  with qryUpdJBReturn do
    begin
      close;
      parambyname('Job_Bag_Return').asinteger := tempCode;
      parambyname('Quantity').asinteger := tempQty;
      execsql;
    end;
end;

end.
