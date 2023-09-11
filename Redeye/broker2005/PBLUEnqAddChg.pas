(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Supplier's Invoice Additional Charges.

VSS Info:
$Header: /PBL D5/PBLUEnqAddChg.pas 10    20/06/03 9:52 Andrewh $
$History: PBLUEnqAddChg.pas $
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 7  *****************
 * User: Davidn       Date: 16/09/02   Time: 15:27
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 13/09/02   Time: 12:42
 * Updated in $/PBL D5
 * Extra charges in new enquiry modules.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 12/09/02   Time: 11:56
 * Updated in $/PBL D5
 * Added button (imaginatively named Button1) that calls the Additional
 * Charge look up screen and allows multiple selection of said charges.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 28/09/:0   Time: 10:55
 * Created in $/PBL D5
 * Initial takeon of Enquiry Additional charges maintenance and lookup
 * units
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 19/09/:0   Time: 16:26
 * Created in $/PBL D5
 * Initial takeon of Invoice Additional Charges lookup form
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 15/09/:0   Time: 17:08
 * Updated in $/PBL D5
 * Maintaining Supplier Invoice Additional charges
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:43
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUEnqAddChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DB, DBGrids;

type
  TPBLUEnqAddChgFrm = class(TForm)
    AddChargesGrid: TStringGrid;
    OKBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure AddChargesGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure AddChargesGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AddChargesGridClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure AddChargesGridDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FFunctionMode: string;
    FTotalValue: real;
    { Private declarations }
//    procedure InsertAddCharges;
//    procedure UpdateAddCharges;
//    procedure DeleteAddCharges;
//    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure ChangeCharges(sFunction: string);
    function GetNewLine: integer;
    procedure EnableBtns;
    procedure SetFunctionMode(const Value: string);
    procedure SetTotalValue(const Value: real);
  public
    { Public declarations }
    iEnquiry, iline, iSupplier, iBranch: Integer;
    iTotValue: Real;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property TotalValue: real read FTotalValue write SetTotalValue;
  end;

var
  PBLUEnqAddChgFrm: TPBLUEnqAddChgFrm;

implementation

uses PBLUAddCharges, PBMaintEnqAddChgs;

{$R *.DFM}

procedure TPBLUEnqAddChgFrm.FormShow(Sender: TObject);
begin
//  AddChargesGrid.Options := [goFixedVertLine, goFixedHorzLine, goVertLine,
//    goHorzLine, goColSizing, goEditing];

  AddChargesGrid.Cells[0, 0] := 'Details';
  AddChargesGrid.Cells[1, 0] := 'Cost';
  AddChargesGrid.Cells[2, 0] := 'Price';
  AddChargesGrid.Cells[3, 0] := 'Nominal';
  EnableBtns;
end;

procedure TPBLUEnqAddChgFrm.AddChargesGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {If Heading Display Left justified in the cells}
  with AddChargesGrid do
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if ACol = 0 then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := AddChargesGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      if gdFixed in State then
        Canvas.Brush.Color := AddChargesGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end;
  end;
end;

procedure TPBLUEnqAddChgFrm.AddChargesGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
//var
//  ifloat: Real;
begin
  EnableBtns;
(*  with AddChargesGrid do
  begin
    Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
      goColSizing, goEditing];

    {Don't display if any of these}
    if ACol = 1 then
    begin
      if ((Cells[1, ARow] = '') and (Cells[0, ARow] = '')) or
        (Row = 0) then Exit;

      if (Cells[1, ARow] = '') then
      begin
        Cells[1, ARow] := '0.00';
        Exit;
      end;

      ifloat := StrToFloatDef(Cells[1, ARow], 0, FormatSettings);
      Cells[1, ARow] := formatfloat('0.00', ifloat);
    end
    else
      if ACol = 2 then
      begin
        if ((Cells[2, ARow] = '') and (Cells[0, ARow] = '')) or
          (ARow = 0) then Exit;

        if (Cells[2, ARow] = '') then
        begin
          Cells[2, ARow] := '0.00';
          Exit;
        end;

        ifloat := StrToFloatDef(Cells[2, ARow], 0, FormatSettings);
        Cells[2, ARow] := formatfloat('0.00', ifloat);
      end
  end;

*)
end;

procedure TPBLUEnqAddChgFrm.EnableBtns;
var
  icount: integer;
begin
  DelBitBtn.enabled := false;
  ChgBitBtn.enabled := false;
  for icount := 1 to AddChargesGrid.rowcount -1 do
    begin
      if AddChargesGrid.cells[0,icount] = '' then
        exit;
    end;
  DelBitBtn.enabled := true;
  ChgBitBtn.enabled := true;
end;

procedure TPBLUEnqAddChgFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
(*  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then
    begin
      with TStringGrid(ActiveControl) do
      begin
        if (Row = (RowCount - 1)) and (Col = 2) then { increment the field }
        begin
          RowCount := RowCount + 1;
          Row := RowCount - 1;
          Col := 0;
          Exit;
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
*)
end;

procedure TPBLUEnqAddChgFrm.AddChargesGridClick(Sender: TObject);
begin
(*  with AddChargesGrid do
  begin
    if Cells[Col, Row] <> '' then
      DeleteButton.Top := celltop(AddChargesGrid, AddChargesGrid.Row) + 1;
  end;
*)
end;

(*
function TPBSupInvAddChgFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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
*)

procedure TPBLUEnqAddChgFrm.DeleteButtonClick(Sender: TObject);
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

procedure TPBLUEnqAddChgFrm.OKBitBtnClick(Sender: TObject);
var
  irow, iActualRows: Integer;
begin
  iActualRows := 0;
  with AddChargesGrid do
  begin
    for irow := 1 to RowCount - 1 do
    begin
      if Cells[0, irow] = '' then Continue;
      if Cells[1, irow] = '' then Cells[1, irow] := '0.00';
      if Cells[2, irow] = '' then Cells[2, irow] := '0.00';
      inc(iActualRows);
    end;
    RowCount := iActualRows + 1;
  end;
end;

procedure TPBLUEnqAddChgFrm.AddBitBtnClick(Sender: TObject);
begin
  ChangeCharges('A');
end;

procedure TPBLUEnqAddChgFrm.ChangeCharges(sFunction: string);
var
  iLine: integer;
begin

  iLine := AddChargesGrid.row;

  PBMaintEnqAddChgsFrm := TPBMaintEnqAddChgsFrm.create(self);
  try
    if sFunction = 'C' then
      begin
        PBMaintEnqAddChgsFrm.DescriptionEdit.text := AddChargesGrid.cells[0,iline];
        PBMaintEnqAddChgsFrm.CostMemo.text := AddChargesGrid.cells[1,iline];
        PBMaintEnqAddChgsFrm.PriceMemo.text := AddChargesGrid.cells[2,iline];
      end;
    PBMaintEnqAddChgsFrm.FunctionMode := sFunction;
    PBMaintEnqAddChgsFrm.showmodal;
    if PBMaintEnqAddChgsFrm.modalresult = idok then
      begin
        if sFunction = 'A' then
          iLine := GetNewLine;

        AddChargesGrid.cells[0,iline] := PBMaintEnqAddChgsFrm.DescriptionEdit.text;
        AddChargesGrid.cells[1,iline] := formatfloat('0.00',StrToFloatDef(PBMaintEnqAddChgsFrm.CostMemo.Lines[0], 0, FormatSettings));
        AddChargesGrid.cells[2,iline] := formatfloat('0.00',StrToFloatDef(PBMaintEnqAddChgsFrm.PriceMemo.Lines[0], 0, FormatSettings));

      end;
  finally
    PBMaintEnqAddChgsFrm.free;
  end;
end;

function TPBLUEnqAddChgFrm.GetNewLine: integer;
begin
  if  (AddChargesGrid.rowcount = 2) and
      (AddChargesGrid.cells[0,1] = '') then
    result := 1
  else
    begin
      AddChargesGrid.rowcount := AddChargesGrid.rowcount + 1;
      result := AddChargesGrid.rowcount-1;
    end;
end;

procedure TPBLUEnqAddChgFrm.ChgBitBtnClick(Sender: TObject);
begin
  ChangeCharges('C');
end;

procedure TPBLUEnqAddChgFrm.DelBitBtnClick(Sender: TObject);
var
  irow, icol: integer;
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

    if Rowcount > 2 then
      RowCount := RowCount - 1;
  end;
  EnableBtns;
end;

procedure TPBLUEnqAddChgFrm.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  if FunctionMode = 'v' then
    begin
      AddChargesGrid.Enabled := false;
      OKBitBtn.enabled := false;
      CloseBitBtn.BringToFront;
    end;
end;

procedure TPBLUEnqAddChgFrm.AddChargesGridDblClick(Sender: TObject);
begin
  with AddChargesGrid do
    begin
      if cells[0,row] = '' then exit;
    end;
  ChgBitBtnClick(self);
end;

procedure TPBLUEnqAddChgFrm.SetTotalValue(const Value: real);
begin
  FTotalValue := Value;
end;

procedure TPBLUEnqAddChgFrm.Button1Click(Sender: TObject);
var
  x: integer;
  bTempOK: Boolean;
begin
  PBLUAddChrgFrm := TPBLUAddChrgFrm.Create(Self);
  try
    PBLUAddChrgFrm.bIs_Lookup := True;
    PBLUAddChrgFrm.bAllow_Upd := False;
    PBLUAddChrgFrm.ShowModal;

    if bTempOK then
    begin
      with PBLUAddChrgFrm.dbgrdDets.datasource.dataset do
      begin
        for x:=0 to pred(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Count) do
        begin
          GotoBookmark(TBookmark(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Items[x]));
          with AddChargesGrid do
          begin
            if Cells[0, 1] <> '' then
            begin
              RowCount := RowCount + 1;
            end;
            Cells[0, RowCount - 1] := FieldByName('Details').asString;
            Cells[1, RowCount - 1] := FloatToStrF(FieldByName('Amount').asFloat, ffFixed, 15, 2);
            Cells[2, RowCount - 1] := FloatToStrF(FieldByName('Quotation_price').asFloat, ffFixed, 15, 2);
          end;
        end;
      end;
    end;

  finally
    PBLUAddChrgFrm.Free;
  end;
end;

end.
