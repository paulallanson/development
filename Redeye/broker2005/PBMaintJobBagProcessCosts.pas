unit PBMaintJobBagProcessCosts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, pbJobBagdm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagProcessCostsFrm = class(TForm)
    pnlBottom: TPanel;
    sgDetails: TStringGrid;
    qryDel: TFDQuery;
    qryAdd: TFDQuery;
    qryCostUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    dblkpPriceUnit: TDBLookupComboBox;
    dblkpProcess: TDBLookupComboBox;
    Panel1: TPanel;
    qryProcess: TFDQuery;
    dtsProcess: TDataSource;
    dblkpVAT: TDBLookupComboBox;
    qryVAT: TFDQuery;
    dtsVAT: TDataSource;
    dblkpOperation: TDBLookupComboBox;
    qryOperation: TFDQuery;
    dtsOperation: TDataSource;
    dblkpCategory: TDBLookupComboBox;
    qryCategory: TFDQuery;
    dtsCategory: TDataSource;
    dblkpSubCategory: TDBLookupComboBox;
    qrySubCategory: TFDQuery;
    dtsSubCategory: TDataSource;
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
    procedure sgDetailsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpPriceUnitClick(Sender: TObject);
    procedure dblkpPriceUnitKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpPriceUnitExit(Sender: TObject);
    procedure dblkpProcessClick(Sender: TObject);
    procedure dblkpProcessExit(Sender: TObject);
    procedure dblkpProcessKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpOperationClick(Sender: TObject);
    procedure dblkpOperationExit(Sender: TObject);
    procedure dblkpOperationKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpCategoryClick(Sender: TObject);
    procedure dblkpCategoryExit(Sender: TObject);
    procedure dblkpCategoryKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpSubCategoryClick(Sender: TObject);
    procedure dblkpSubCategoryExit(Sender: TObject);
    procedure dblkpSubCategoryKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpVATClick(Sender: TObject);
    procedure dblkpVATExit(Sender: TObject);
    procedure dblkpVATKeyPress(Sender: TObject; var Key: Char);
  private
    FJobBag: TJobBag;
    procedure ShowDetails;
    procedure ClearGrid(TempGrid: TStringGrid);
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure GetOperations;
    procedure GetCategory;
    procedure GetSubCategory;
    procedure SetJobBag(const Value: TJobBag);
    procedure ShowDescription;
    { Private declarations }
  public
    selcode, selName: string;
    property JobBag: TJobBag read FJobBag write SetJobBag;
  end;

var
  PBMaintJobBagProcessCostsFrm: TPBMaintJobBagProcessCostsFrm;

implementation

uses pbMainMenu, ccscommon;

{$R *.dfm}

procedure TPBMaintJobBagProcessCostsFrm.FormActivate(Sender: TObject);
begin
  with qryProcess do
    begin
      close;
      open;
    end;

  with qrycostUnit do
    begin
      close;
      open;
    end;

  with qryVat do
    begin
      close;
      open;
    end;

  ShowDetails;
end;

procedure TPBMaintJobBagProcessCostsFrm.ShowDetails;
var
  icount: integer;
begin
  clearGrid(sgDetails);

(*  with sgDetails do
    begin
      for icount := 0 to pred(JobBag.lines.count) do
        begin
          if JobBag.Lines[icount].Process = 0 then
            continue;
          cells[0,icount] := inttostr(JobBag.Lines[icount].JBline);
          cells[1,icount] := JobBag.Lines[icount].ProcessDescription;
          cells[101,icount] := inttostr(JobBag.Lines[icount].Process);
          cells[2,icount] := JobBag.Lines[icount].OperationDescription;
          cells[102,icount] := inttostr(JobBag.Lines[icount].Operation);
          cells[3,icount] := JobBag.Lines[icount].CategoryDescription;
          cells[103,icount] := inttostr(JobBag.Lines[icount].Category);
          cells[4,icount] := JobBag.Lines[icount].SubCategoryDescription;
          cells[104,icount] := inttostr(JobBag.Lines[icount].SubCategory);
          cells[5,icount] := JobBag.Lines[icount].JBLineDescr;
          cells[6,icount] := inttostr(JobBag.Lines[icount].JBQuantity);
          cells[7,icount] := formatfloat('0.000',JobBag.Lines[icount].UnitCost);
          cells[8,icount] := formatfloat('0.000',JobBag.Lines[icount].SellingPrice);
          cells[9,icount] := JobBag.Lines[icount].PriceUnitDescription;
          cells[109,icount] := inttotstr(JobBag.Lines[icount].PriceUnit;
          cells[10,icount] := JobBag.Lines[icount].VATDescription;
          cells[110,icount] := inttostr(JobBag.Lines[icount].VATCode);
        end;
    end;
*)
end;

procedure TPBMaintJobBagProcessCostsFrm.ClearGrid(TempGrid: TStringGrid);
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

procedure TPBMaintJobBagProcessCostsFrm.FormCreate(Sender: TObject);
var
  icount: integer;
begin
  with sgDetails do
    begin
      cells[1,0] := 'Process';
      cells[2,0] := 'Operation';
      cells[3,0] := 'Category';
      cells[4,0] := 'Sub Category';
      cells[5,0] := 'Description';
      cells[6,0] := 'Quantity';
      cells[7,0] := 'Cost Price';
      cells[8,0] := 'Sell Price';
      cells[9,0] := 'Price Unit';
      cells[10,0] := 'Vat';
    end;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagProcessCostsFrm.sgDetailsKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if sgDetails.col <> 5 then
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
end;

procedure TPBMaintJobBagProcessCostsFrm.sgDetailsDrawCell(Sender: TObject;
  vCol, vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  dblkpProcess.width := sgDetails.colwidths[1]+2;
  dblkpOperation.width := sgDetails.colwidths[2]+2;
  dblkpCategory.width := sgDetails.colwidths[3]+2;
  dblkpSubCategory.width := sgDetails.colwidths[4]+2;
  dblkpPriceUnit.width := sgDetails.colwidths[9]+2;
  dblkpVat.width := sgDetails.colwidths[10]+2;

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
    if (vCol <> 6) and (vCol <> 7) and (vCol <> 8) then
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

procedure TPBMaintJobBagProcessCostsFrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      begin
      with TStringGrid(ActiveControl) do
        begin
          if Col = 10 then
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

procedure TPBMaintJobBagProcessCostsFrm.OKBitBtnClick(Sender: TObject);
var
  icount: integer;
begin
(*  for icount := 1 to sgDetails.rowcount do
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
            parambyname('Sell_Price').asfloat := strtofloat(cells[2,icount]);
          except
            parambyname('Sell_Price').asfloat := 0.00;
          end;

          try
            parambyname('Cost_Price').asfloat := strtofloat(cells[4,icount]);
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

*)
end;

procedure TPBMaintJobBagProcessCostsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintJobBagProcessCostsFrm.sgDetailsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  icol, irow: integer;
begin
  with sender as TStringGrid do
    begin
      irow := Row;
      icol := Col;

      if (icol = 7) or (icol = 8) then
        begin
          if (Cells[iCol, iRow] = '') or
            (Cells[iCol, iRow] = '.')
              then Cells[iCol, iRow] := '';
        end;
    end;

end;

procedure TPBMaintJobBagProcessCostsFrm.sgDetailsSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  icol, irow: integer;
begin
  {Format any numeric values}
  with Sender as TStringGrid do
    begin
      if (Col < 5) or (Col = 9) or (Col = 10) then
        sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
      else
        sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];

      for icol := 7 to 8 do
      begin
//        if icol = 9 then continue;
          for irow := 1 to 100 do
            begin
              if cells[icol, irow] = '' then continue;
              cells[icol, irow] := formatfloat('0.000', strtofloat(cells[icol,irow]));
            end;
      end;
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.sgDetailsClick(Sender: TObject);
begin
  sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
  with sgDetails do
  begin
    if Col = 1 then
    begin
      dblkpProcess.Top := celltop(sgDetails, Row);
      dblkpProcess.Left := cellleft(sgDetails, Col);
      dblkpProcess.width := colwidths[1];

      if cells[1,row] <> '' then
        dblkpProcess.KeyValue := cells[101,row];
      dblkpProcess.bringtofront;
      dblkpProcess.Visible := True;
      dblkpProcess.SetFocus;
    end
    else
    if Col = 2 then
    begin
      dblkpOperation.Top := celltop(sgDetails, Row);
      dblkpOperation.Left := cellleft(sgDetails, Col);
      dblkpOperation.width := colwidths[2];

      if cells[2,row] <> '' then
        dblkpOperation.KeyValue := cells[102,row];
      dblkpOperation.bringtofront;
      dblkpOperation.Visible := True;
      dblkpOperation.SetFocus;
    end
    else
    if Col = 3 then
    begin
      dblkpCategory.Top := celltop(sgDetails, Row);
      dblkpCategory.Left := cellleft(sgDetails, Col);
      dblkpCategory.width := colwidths[3];

      if cells[3,row] <> '' then
        dblkpCategory.KeyValue := cells[103,row];
      dblkpCategory.bringtofront;
      dblkpCategory.Visible := True;
      dblkpCategory.SetFocus;
    end
    else
    if Col = 4 then
    begin
      dblkpSubCategory.Top := celltop(sgDetails, Row);
      dblkpSubCategory.Left := cellleft(sgDetails, Col);
      dblkpSubCategory.width := colwidths[4];

      if cells[4,row] <> '' then
        dblkpSubCategory.KeyValue := cells[104,row];
      dblkpSubCategory.bringtofront;
      dblkpSubCategory.Visible := True;
      dblkpSubCategory.SetFocus;
    end
    else
    if Col = 9 then
    begin
      dblkpPriceUnit.Top := celltop(sgDetails, Row);
      dblkpPriceUnit.Left := cellleft(sgDetails, Col);
      dblkpPriceUnit.width := colwidths[9];

      if cells[9,row] <> '' then
        dblkpPriceUnit.KeyValue := cells[109,row];
      dblkpPriceUnit.bringtofront;
      dblkpPriceUnit.Visible := True;
      dblkpPriceUnit.SetFocus;
    end
    else
    if Col = 10 then
    begin
      dblkpVat.Top := celltop(sgDetails, Row);
      dblkpVat.Left := cellleft(sgDetails, Col);
      dblkpVat.width := colwidths[10];

      if cells[10,row] <> '' then
        dblkpVat.KeyValue := cells[110,row];
      dblkpVat.bringtofront;
      dblkpVat.Visible := True;
      dblkpVat.SetFocus;
    end
    else
    begin
      dblkpProcess.sendtoback;
      dblkpProcess.Visible := False;

      dblkpCategory.sendtoback;
      dblkpCategory.Visible := False;

      dblkpSubCategory.sendtoback;
      dblkpSubCategory.Visible := False;

      dblkpPriceUnit.sendtoback;
      dblkpPriceUnit.Visible := False;

      dblkpVat.sendtoback;
      dblkpVat.Visible := False;
    end
  end;

end;

function TPBMaintJobBagProcessCostsFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1  do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t + + grid.colwidths[0];
end;

function TPBMaintJobBagProcessCostsFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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

procedure TPBMaintJobBagProcessCostsFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpPriceUnitClick(Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[9,row] := dblkpPriceUnit.text;
      cells[109,row] := inttostr(dblkpPriceUnit.keyvalue);
    except
      cells[9,row] := '';
      cells[109,row] := '0';
    end;
  end;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpPriceUnitKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpPriceUnitClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      dblkpVat.setfocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;

end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpPriceUnitExit(Sender: TObject);
begin
  dblkpPriceunit.Visible := false;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpProcessClick(Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[1,row] := dblkpProcess.text;
      cells[101,row] := inttostr(dblkpProcess.keyvalue);
    except
      cells[1,row] := '';
      cells[101,row] := '0';
    end;
  end;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpProcessExit(Sender: TObject);
begin
  dblkpProcess.Visible := false;
  with sgDetails do
    begin
      if (cells[1,row] <> '') and (cells[7,row] = '') then
        begin
          cells[6,row] := '1';
          cells[7,row] := '0.000';
          cells[8,row] := '0.000';
        end;
    end;

  GetOperations;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpProcessKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpProcessClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      dblkpOperation.SetFocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;

end;

procedure TPBMaintJobBagProcessCostsFrm.GetOperations;
begin
  with qryOperation, sgDetails do
    begin
      close;
      parambyname('Customer').asinteger := 0;
      try
        parambyname('Process').asinteger := strtoint(cells[101,row]);
      except
        parambyname('Process').asinteger := 0;
      end;
      open;
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.GetCategory;
begin
  with qryCategory, sgDetails do
    begin
      close;
      parambyname('Customer').asinteger := 0;
      try
        parambyname('Process').asinteger := strtoint(cells[101,row]);
        parambyname('Cost_Number').asinteger := strtoint(cells[102,row]);
      except
        parambyname('Process').asinteger := 0;
        parambyname('Cost_Number').asinteger := 0;
      end;
      open;
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.GetSubCategory;
begin
  with qrySubCategory, sgDetails do
    begin
      close;
      parambyname('Customer').asinteger := 0;
      try
        parambyname('Process').asinteger := strtoint(cells[101,row]);
        parambyname('Cost_Number').asinteger := strtoint(cells[102,row]);
        parambyname('Category_Number').asinteger := strtoint(cells[103,row]);
      except
        parambyname('Process').asinteger := 0;
        parambyname('Cost_Number').asinteger := 0;
        parambyname('Category_Number').asinteger := 0;
      end;
      open;
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpOperationClick(
  Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[2,row] := dblkpOperation.text;
      cells[102,row] := inttostr(dblkpOperation.keyvalue);
    except
      cells[2,row] := '';
      cells[102,row] := '0';
    end;
  end;

end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpOperationExit(
  Sender: TObject);
begin
  dblkpOperation.Visible := false;
  ShowDescription;
  GetCategory;
end;

procedure TPBMaintJobBagProcessCostsFrm.ShowDescription;
var
  sSubtext, sCatText, sText: string;
begin
  // dont construct the description 
  exit;
  sSubtext := '';
  sCattext := '';
  stext := '';

  {Construct the selected description}
  if dblkpSubCategory.text <> '' then
    sSubtext := ', '+ dblkpSubCategory.text;

  if dblkpCategory.text <> '' then
    sCattext := ', '+ dblkpCategory.text;

  if dblkpOperation.text <> '' then
    sText := dblkpOperation.text;

  with sgDetails do
    Cells[5,row] := stext + sCatText + sSubtext;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpOperationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpOperationClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      dblkpCategory.SetFocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpCategoryClick(
  Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[3,row] := dblkpCategory.text;
      cells[103,row] := inttostr(dblkpCategory.keyvalue);
    except
      cells[3,row] := '';
      cells[103,row] := '0';
    end;
  end;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpCategoryExit(Sender: TObject);
begin
  dblkpCategory.Visible := false;
  ShowDescription;
  GetSubCategory;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpCategoryKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpCategoryClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      dblkpSubCategory.SetFocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;

end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpSubCategoryClick(
  Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[4,row] := dblkpSubCategory.text;
      cells[104,row] := inttostr(dblkpSubCategory.keyvalue);
    except
      cells[4,row] := '';
      cells[104,row] := '0';
    end;
  end;

end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpSubCategoryExit(
  Sender: TObject);
begin
  dblkpCategory.Visible := false;
  ShowDescription;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpSubCategoryKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpSubCategoryClick(Self);
      with sgDetails do
      begin
        Col := Col + 1;
      end;
      sgDetails.SetFocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpVATClick(Sender: TObject);
begin
  with sgDetails do
  begin
    try
      cells[10,row] := dblkpVat.text;
      cells[110,row] := inttostr(dblkpVat.keyvalue);
    except
      cells[10,row] := '';
      cells[110,row] := '0';
    end;
  end;

end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpVATExit(Sender: TObject);
begin
  dblkpVat.Visible := false;
end;

procedure TPBMaintJobBagProcessCostsFrm.dblkpVATKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TDBLookupComboBox) then
    begin
      dblkpVatClick(Self);
      with sgDetails do
      begin
        Row := row + 1;
        Col := 1;
      end;
      dblkpProcess.setfocus;
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing];
    end;
end;

procedure TPBMaintJobBagProcessCostsFrm.SetJobBag(const Value: TJobBag);
begin
  FJobBag := Value;
end;

end.
