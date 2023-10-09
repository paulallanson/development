unit STMaintProductQtyPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintProductQtyPricesFrm = class(TForm)
    pnlBottom: TPanel;
    sgDetails: TStringGrid;
    pnlTop: TPanel;
    Label1: TLabel;
    lblProduct: TLabel;
    Label2: TLabel;
    lblDescription: TLabel;
    qryGetQtyPrices: TFDQuery;
    qryDel: TFDQuery;
    qryAdd: TFDQuery;
    dblkpSuppliers: TDBLookupComboBox;
    qrySuppliers: TFDQuery;
    dtsSupplier: TDataSource;
    qryPriceUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    dblkpSellUnit: TDBLookupComboBox;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    dblkpCostUnit: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure sgDetailsDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure sgDetailsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure dblkpSuppliersClick(Sender: TObject);
    procedure sgDetailsClick(Sender: TObject);
    procedure dblkpSuppliersKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpSellUnitClick(Sender: TObject);
    procedure dblkpSellUnitKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpCostUnitClick(Sender: TObject);
    procedure dblkpCostUnitKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpSuppliersExit(Sender: TObject);
    procedure dblkpSellUnitExit(Sender: TObject);
    procedure dblkpCostUnitExit(Sender: TObject);
  private
    procedure ShowDetails;
    procedure ClearGrid(TempGrid: TStringGrid);
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    { Private declarations }
  public
    selcode, selName: string;
  end;

var
  STMaintProductQtyPricesFrm: TSTMaintProductQtyPricesFrm;

implementation

uses UITypes, 
  System.Types,
  pbMainMenu, ccscommon;

{$R *.dfm}

procedure TSTMaintProductQtyPricesFrm.FormActivate(Sender: TObject);
begin
  with qrySuppliers do
    begin
      close;
      open;
    end;

  with qryPriceUnit do
    begin
      close;
      open;
    end;

  lblProduct.Caption := selcode;
  lblDescription.caption := self.SelName;
  ShowDetails;
end;

procedure TSTMaintProductQtyPricesFrm.ShowDetails;
var
  icount: integer;
begin
  clearGrid(sgDetails);

  with qryGetQtyPrices, sgDetails do
    begin
      close;
      parambyname('Part').asstring := selCode;
      open;

      icount := 0;

      while eof <> true do
        begin
          icount := icount + 1;
          cells[0,icount] := inttostr(icount);
          cells[1,icount] := fieldbyname('Quantity').asstring;
          cells[2,icount] := formatfloat('0.00',fieldbyname('Sell_Price').asfloat);
          cells[3,icount] := fieldbyname('Sell_Price_Unit').asstring;
          cells[4,icount] := formatfloat('0.00',fieldbyname('Cost_Price').asfloat);
          cells[5,icount] := fieldbyname('Cost_Price_Unit').asstring;
          cells[6,icount] := fieldbyname('Supplier_Name').asstring;
          cells[7,icount] := fieldbyname('Sell_unit').asstring;
          cells[8,icount] := fieldbyname('Cost_unit').asstring;
          cells[9,icount] := fieldbyname('Supplier').asstring;
          next;
        end;
    end;
end;

procedure TSTMaintProductQtyPricesFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 0 to pred(colcount) do
          cells[icol,irow] := '';

      for irow := 1 to 100 do
        cells[0,irow] := inttostr(irow);
    end;

end;

procedure TSTMaintProductQtyPricesFrm.FormCreate(Sender: TObject);
var
  icount: integer;
begin
  with sgDetails do
    begin
      cells[1,0] := 'Quantity';
      cells[2,0] := 'Sell Price';
      cells[3,0] := 'Price Unit';
      cells[4,0] := 'Cost Price';
      cells[5,0] := 'Price Unit';
      cells[6,0] := 'Supplier';

    end;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TSTMaintProductQtyPricesFrm.sgDetailsKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;

  case key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace};
  else
    Key := #0;
  end;

end;

procedure TSTMaintProductQtyPricesFrm.sgDetailsDrawCell(Sender: TObject;
  vCol, vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  dblkpSellUnit.width := sgDetails.colwidths[3];
  dblkpCostUnit.width := sgDetails.colwidths[5];
  dblkpSuppliers.width := sgDetails.colwidths[6];

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

  {If Heading Display Left justified in the cells}
  with sgDetails do
  begin
    if (vCol = 0) or (vCol = 3) or (vCol = 5) or (vCol = 6) then
    begin
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;


end;

procedure TSTMaintProductQtyPricesFrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      begin
      with TStringGrid(ActiveControl) do
        begin
          if Col = 6 then
          begin
            if row = pred(rowcount) then
              row := 1
            else
              begin
                row := row + 1;
                col := 1;
              end;
            Exit;
          end
          else
          begin
            col := col + 1;
          end;
        end;
      end;

end;

procedure TSTMaintProductQtyPricesFrm.OKBitBtnClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 1 to sgDetails.rowcount do
    begin
      if (sgDetails.Cells[6,icount] = '') and (sgDetails.Cells[1,icount] <> '') then
        begin
          MessageDlg('A supplier must be selected for each quantity and price', mtError, [mbOk], 0);
          exit;
        end;
    end;

  with qryDel do
    begin
      close;
      parambyname('Part').asstring := selCode;
      execsql;
    end;

  for icount := 1 to sgDetails.rowcount do
    begin
      if sgDetails.cells[1,icount] = '' then
        continue;
      with qryAdd, sgDetails do
        begin
          close;
          parambyname('Part').asstring := SelCode;
          parambyname('Quantity').asinteger := strtoint(cells[1,icount]);
          try
            parambyname('Sell_Price').asfloat := StrToFloatDef(cells[2,icount], 0, FormatSettings);
          except
            parambyname('Sell_Price').asfloat := 0.00;
          end;

          try
            parambyname('Cost_Price').asfloat := StrToFloatDef(cells[4,icount], 0, FormatSettings);
          except
            parambyname('Cost_Price').asfloat := 0.00;
          end;

          try
            parambyname('Sell_Pack_Quantity').asinteger := 1000;
          except
            parambyname('Sell_Pack_Quantity').asinteger := 1000;
          end;

          try
            parambyname('Purch_pack_Quantity').asinteger := 1000;
          except
            parambyname('Purch_pack_Quantity').asinteger := 1000;
          end;

          parambyname('Sell_Unit').asinteger := strtoint(cells[7,icount]);
          parambyname('Cost_Unit').asinteger := strtoint(cells[8,icount]);
          parambyname('Supplier').asinteger := strtoint(cells[9,icount]);
          execsql;
        end;
    end;
  close;
end;

procedure TSTMaintProductQtyPricesFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TSTMaintProductQtyPricesFrm.sgDetailsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  icol, irow: integer;
begin
  with sender as TStringGrid do
    begin
      irow := Row;
      icol := Col;

      if (icol = 2) or (icol = 4) then
        begin
          if (Cells[iCol, iRow] = '') or
            (Cells[iCol, iRow] = '.')
              then Cells[iCol, iRow] := '';
        end;
    end;

end;

procedure TSTMaintProductQtyPricesFrm.sgDetailsSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  icol, irow: integer;
begin
  {Format any numeric values}
  with Sender as TStringGrid do
    begin
      if (Col = 3) or (Col = 5) or (Col = 6) then
        sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
      else
        sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];

      for icol := 2 to 4 do
      begin
        if icol = 3 then continue;
          for irow := 1 to 100 do
            begin
              if cells[icol, irow] = '' then continue;
              cells[icol, irow] := formatfloat('0.00', StrToFloatDef(cells[icol,irow], 0, FormatSettings));
            end;
      end;
    end;
end;

procedure TSTMaintProductQtyPricesFrm.dblkpSuppliersClick(Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[6,row] := dblkpSuppliers.text;
      cells[9,row] := inttostr(dblkpSuppliers.keyvalue);
    except
      cells[6,row] := '';
      cells[9,row] := '0';
    end;
  end;

end;

procedure TSTMaintProductQtyPricesFrm.sgDetailsClick(Sender: TObject);
begin
  sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
  with sgDetails do
  begin
    if Col = 3 then
    begin
      dblkpSellUnit.Top := celltop(sgDetails, Row);
      dblkpSellUnit.Left := cellleft(sgDetails, Col);
      dblkpSellUnit.width := colwidths[3];

      if cells[3,row] <> '' then
        dblkpSellUnit.KeyValue := cells[7,row];
      dblkpSellUnit.bringtofront;
      dblkpSellUnit.Visible := True;
      dblkpSellUnit.SetFocus;
    end
    else
    if Col = 5 then
    begin
      dblkpCostUnit.Top := celltop(sgDetails, Row);
      dblkpCostUnit.Left := cellleft(sgDetails, Col);
      dblkpCostUnit.width := colwidths[5];

      if cells[5,row] <> '' then
        dblkpCostUnit.KeyValue := cells[8,row];
      dblkpCostUnit.bringtofront;
      dblkpCostUnit.Visible := True;
      dblkpCostUnit.SetFocus;
    end
    else
    if Col = 6 then
    begin
      dblkpSuppliers.Top := celltop(sgDetails, Row);
      dblkpSuppliers.Left := cellleft(sgDetails, Col);
      dblkpSuppliers.width := colwidths[6];

      if cells[6,row] <> '' then
        dblkpSuppliers.KeyValue := cells[9,row];
      dblkpSuppliers.bringtofront;
      dblkpSuppliers.Visible := True;
      dblkpSuppliers.SetFocus;
    end
    else
    begin
      dblkpSellUnit.sendtoback;
      dblkpSellUnit.Visible := False;

      dblkpCostUnit.sendtoback;
      dblkpCostUnit.Visible := False;

      dblkpSuppliers.sendtoback;
      dblkpSuppliers.Visible := False;
    end
  end;

end;

function TSTMaintProductQtyPricesFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1  do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t + + grid.colwidths[0];
end;

function TSTMaintProductQtyPricesFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;

end;

procedure TSTMaintProductQtyPricesFrm.dblkpSuppliersKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpSuppliersClick(Self);
      with sgDetails do
      begin
        Row := Row + 1;
        Col := 1;
      end;
      sgDetails.SetFocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;
end;

procedure TSTMaintProductQtyPricesFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TSTMaintProductQtyPricesFrm.dblkpSellUnitClick(Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[3,row] := dblkpSellUnit.text;
      cells[7,row] := inttostr(dblkpSellUnit.keyvalue);
    except
      cells[3,row] := '';
      cells[7,row] := '0';
    end;
  end;

end;

procedure TSTMaintProductQtyPricesFrm.dblkpSellUnitKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpSellUnitClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
      sgDetails.SetFocus;
    end;
end;

procedure TSTMaintProductQtyPricesFrm.dblkpCostUnitClick(Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[5,row] := dblkpCostUnit.text;
      cells[8,row] := inttostr(dblkpCostUnit.keyvalue);
    except
      cells[5,row] := '';
      cells[8,row] := '0';
    end;
  end;
end;

procedure TSTMaintProductQtyPricesFrm.dblkpCostUnitKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpCostUnitClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
      dblkpSuppliers.SetFocus;
    end;

end;

procedure TSTMaintProductQtyPricesFrm.dblkpSuppliersExit(Sender: TObject);
begin
  dblkpSuppliers.Visible := false;
end;

procedure TSTMaintProductQtyPricesFrm.dblkpSellUnitExit(Sender: TObject);
begin
  dblkpSellunit.Visible := false;
end;

procedure TSTMaintProductQtyPricesFrm.dblkpCostUnitExit(Sender: TObject);
begin
  dblkpCostunit.Visible := false;
end;

end.
