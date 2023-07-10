(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Supplier's Additional Charges form.

VSS Info:
$Header: /PBL D5/PBEnqAddChg.pas 1     7/12/99 9:41 Roddym $
$History: PBEnqAddChg.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqAddChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DB, DBTables, DBGrids;

type
  TPBEnqAddChgFrm = class(TForm)
    AddChargesGrid: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    UpdateSQL: TQuery;
    DeleteSQL: TQuery;
    InsertSQL: TQuery;
    DeleteButton: TBitBtn;
    addchargesSQL: TQuery;
    procedure FormShow(Sender: TObject);
    procedure AddChargesGridDrawCell(Sender: TObject; vCol, vRow: Longint;
      Rect: TRect; State: TGridDrawState);
    procedure AddChargesGridKeyPress(Sender: TObject; var Key: Char);
    procedure AddChargesGridSelectCell(Sender: TObject; Col, Row: Longint;
      var CanSelect: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AddChargesGridClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsertAddCharges;
    procedure UpdateAddCharges;
    procedure DeleteAddCharges;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
  public
    { Public declarations }
    iEnquiry, iline, iSupplier, iBranch: Integer;
    sMode: string[1];
    iTotValue: Real;
  end;

var
  PBEnqAddChgFrm: TPBEnqAddChgFrm;

implementation

{$R *.DFM}

procedure TPBEnqAddChgFrm.FormShow(Sender: TObject);
var
  irow: Integer;
begin
  {Allow editing if Adding}
  if smode <> 'a' then
    AddChargesGrid.Options := [goFixedVertLine, goFixedHorzLine, goVertLine,
      goHorzLine, goColSizing]
  else
    AddChargesGrid.Options := [goFixedVertLine, goFixedHorzLine, goVertLine,
      goHorzLine, goColSizing, goEditing];

  AddChargesGrid.Cells[0, 0] := 'Details';
  AddChargesGrid.Cells[1, 0] := 'Cost';
  AddChargesGrid.Cells[2, 0] := 'Price';

  {Get the Additional charges details}
  with addchargesSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := ienquiry;
    ParamByName('Line').AsInteger := iLine;
    ParamByName('Supplier').AsInteger := iSupplier;
    ParamByName('Branch').AsInteger := iBranch;
    Open;

    if RecordCount = 0 then Exit;
    AddChargesGrid.RowCount := RecordCount + 1;
    First;
    irow := 1;
    while (not EOF) do
    begin
      AddChargesGrid.Cells[0, irow] := FieldByName('Details').AsString;
      if FieldByName('Amount').AsString = '' then
        AddChargesGrid.Cells[1, irow] := '0.00'
      else
        AddChargesGrid.Cells[1, irow] := formatfloat('0.00',
          FieldByName('Amount').AsFloat);

      if FieldByName('Quotation_Price').AsString = '' then
        AddChargesGrid.Cells[2, irow] := '0.00'
      else
        AddChargesGrid.Cells[2, irow] := formatfloat('0.00',
          FieldByName('Quotation_Price').AsFloat);

      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBEnqAddChgFrm.AddChargesGridDrawCell(Sender: TObject; vCol,
  vRow: Longint; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if vRow <> 0 then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  with AddChargesGrid do
  begin
    if vCol = 0 then
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

procedure TPBEnqAddChgFrm.AddChargesGridKeyPress(Sender: TObject;
  var Key: Char);
var
  P, L: Byte;
begin
  with Sender as TStringGrid do
  begin
    if Col = 0 then Exit;
    L := Length(Cells[Col, Row]);
    P := Pos('.', Cells[Col, Row]);
  end;

  case key of
    '0'..'9':
      if (P > 0) and (L - P > 1) then Key := #0;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBEnqAddChgFrm.AddChargesGridSelectCell(Sender: TObject; Col,
  Row: Longint; var CanSelect: Boolean);
var
  ifloat: Real;
begin
  with AddChargesGrid do
  begin
    Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
      goColSizing];
    if smode = 'c' then
    begin
      if (Col = 2) then
        Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
          goColSizing, goEditing]
      else
        Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
          goColSizing];
    end
    else
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing, goEditing];

    {Don't display if any of these}
    if Col = 1 then
    begin
      if ((Cells[1, Row] = '') and (Cells[0, Row] = '')) or
        (Row = 0) then Exit;

      if (Cells[1, Row] = '') then
      begin
        Cells[1, Row] := '0.00';
        Exit;
      end;

      ifloat := StrToFloat(Cells[1, Row]);
      Cells[1, Row] := formatfloat('0.00', ifloat);
    end
    else
      if Col = 2 then
      begin
        if ((Cells[2, Row] = '') and (Cells[0, Row] = '')) or
          (Row = 0) then Exit;

        if (Cells[2, Row] = '') then
        begin
          Cells[2, Row] := '0.00';
          Exit;
        end;

        ifloat := StrToFloat(Cells[2, Row]);
        Cells[2, Row] := formatfloat('0.00', ifloat);
      end
  end;

end;

procedure TPBEnqAddChgFrm.BitBtn1Click(Sender: TObject);
begin
  {If Adding or changing Additional Charges then delete and insert}
  if smode = 'a' then
  begin
    DeleteAddCharges;
    InsertAddCharges;
  end
  else
    UpdateAddCharges;
end;

procedure TPBEnqAddChgFrm.DeleteAddCharges;
begin
  {Delete the existing additional charges}
  with DeleteSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := ienquiry;
    ParamByName('Line').AsInteger := iline;
    ParamByName('Supplier').AsInteger := iSupplier;
    ParamByName('Branch').AsInteger := ibranch;
    ExecSQL;
  end;
end;

procedure TPBEnqAddChgFrm.InsertAddCharges;
var
  irow: Integer;
begin
  iTotValue := 0;
  for irow := 1 to AddChargesGrid.RowCount - 1 do
  begin
    with InsertSQL do
    begin
      if AddChargesGrid.Cells[0, irow] = '' then Continue;
      if AddChargesGrid.Cells[1, irow] = '' then
        AddChargesGrid.Cells[1, irow] := '0.00';
      if AddChargesGrid.Cells[2, irow] = '' then
        AddChargesGrid.Cells[2, irow] := '0.00';
      Close;
      ParamByName('Enquiry').AsInteger := ienquiry;
      ParamByName('Line').AsInteger := iline;
      ParamByName('Supplier').AsInteger := iSupplier;
      ParamByName('Branch').AsInteger := ibranch;
      ParamByName('Charges').AsInteger := irow;
      ParamByName('Details').AsString := AddChargesGrid.Cells[0, irow];
      ParamByName('Cost').AsFloat := StrToFloat(AddChargesGrid.Cells[1, irow]);
      ParamByName('Price').AsFloat := StrToFloat(AddChargesGrid.Cells[2, irow]);
      ExecSQL;
    end;
    iTotValue := iTotValue + StrToFloat(AddChargesGrid.Cells[1, irow]);
  end;
end;

procedure TPBEnqAddChgFrm.UpdateAddCharges;
var
  irow: Integer;
begin
  iTotValue := 0;
  for irow := 1 to AddChargesGrid.RowCount - 1 do
  begin
    with UpdateSQL do
    begin
      if AddChargesGrid.Cells[0, irow] = '' then Continue;
      Close;
      ParamByName('Enquiry').AsInteger := ienquiry;
      ParamByName('Line').AsInteger := iline;
      ParamByName('Supplier').AsInteger := iSupplier;
      ParamByName('Branch').AsInteger := ibranch;
      ParamByName('Charges').AsInteger := irow;
      ParamByName('Price').AsFloat := StrToFloat(AddChargesGrid.Cells[2, irow]);
      ExecSQL;
    end;
    iTotValue := iTotValue + StrToFloat(AddChargesGrid.Cells[1, irow]);
  end;
end;

procedure TPBEnqAddChgFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then
    begin
      with TStringGrid(ActiveControl) do
      begin
        if smode = 'a' then
        begin
          if (Row = (RowCount - 1)) and (Col = 2) then { increment the field }
          begin
            RowCount := RowCount + 1;
            Row := RowCount - 1;
            Col := 0;
            Exit;
          end;
        end;

        if Cells[0, Row] = '' then
        begin
          Key := #0; { eat enter key }
          Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
          Exit;
        end;

        if Col < 2 then
        begin
          Col := Col + 1;
          Exit;
        end;

        if Col = 2 then
        begin
          Col := 0;
          Row := Row + 1;
          Exit;
        end;
      end;
    end;
end;

procedure TPBEnqAddChgFrm.AddChargesGridClick(Sender: TObject);
begin
  with AddChargesGrid do
  begin
    if Cells[Col, Row] <> '' then
      DeleteButton.Top := celltop(AddChargesGrid, AddChargesGrid.Row) + 1;
  end;
end;

function TPBEnqAddChgFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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

procedure TPBEnqAddChgFrm.DeleteButtonClick(Sender: TObject);
var
  irow, icol: Integer;
begin
  with AddChargesGrid do
  begin
    for irow := Row to RowCount - 1 do
    begin
      for icol := 0 to 11 do
      begin
        Cells[icol, irow] := Cells[icol, irow + 1];
      end;
    end;
    RowCount := RowCount - 1;
  end;

end;

end.
