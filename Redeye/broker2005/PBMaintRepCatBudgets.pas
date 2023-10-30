unit PBMaintRepCatBudgets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DBCGrids,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRepCatBudgetsFrm = class(TForm)
    qryPeriods: TFDQuery;
    qryReps: TFDQuery;
    dtsReps: TDataSource;
    qryGetRepBudgets: TFDQuery;
    qryFirstPeriod: TFDQuery;
    qryCheckBudget: TFDQuery;
    qryUpdBudget: TFDQuery;
    qryAddBudget: TFDQuery;
    qryCategory: TFDQuery;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edtFY: TEdit;
    dblkpReps: TDBLookupComboBox;
    Label2: TLabel;
    grdDetails: TStringGrid;
    Panel5: TPanel;
    ScrollBox1: TScrollBox;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure dblkpRepsClick(Sender: TObject);
    procedure grdDetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grdDetailsExit(Sender: TObject);
    procedure grdDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdPeriodsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grdDetailsTopLeftChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    category: array[1..100] of integer;
    periods: array[1..100] of integer;
    procedure CreateRepBudgets;
    procedure DisplayBudgets;
    procedure SaveRepBudgets;
    procedure ClearGrid;
    { Private declarations }
  public
    iCode: integer;
    iPeriods: integer;
    iRep: integer;
  end;

var
  PBMaintRepCatBudgetsFrm: TPBMaintRepCatBudgetsFrm;

implementation

{$R *.DFM}

uses
  System.UITypes;

procedure TPBMaintRepCatBudgetsFrm.FormActivate(Sender: TObject);
var
  icategory, imonth, iposition: integer;
  icount, icol: integer;
begin
// clear arrays
  for icount := 1 to 100 do
    category[icount] := 0;

  for icount := 1 to 100 do
    periods[icount] := 0;

// display the list of categories
  with qryCategory do
    begin
      close;
      open;
      first;
      icategory := 1;
      while eof <> true do
        begin
          grdDetails.cells[0,icategory] := fieldbyname('Description').asstring;
          category[icategory] := fieldbyname('Category').asinteger;
          next;
          inc(icategory);
        end;
    end;

  grdDetails.rowcount := icategory;

// Now display all the periods for this financial year
// *  grdPeriods.colcount := (iperiods*2)+1;
  stringgrid1.colcount := (iperiods);

  with qryPeriods do
    begin
      close;
      parambyname('Financial_year').asinteger := icode;
      open;

      first;
      imonth := 1;
      icol := 1;
      while eof <> true do
        begin
// *          grdPeriods.cells[icol,0] := fieldbyname('Description').asstring;
          stringgrid1.cells[(imonth-1),0] := fieldbyname('Description').asstring;
          periods[imonth] := fieldbyname('period').asinteger;
          next;
          inc(imonth);
          icol := icol + 2;;
        end;
    end;
// *  grdPeriods.cells[0,0] := 'Category';
  stringGrid1.width := ((stringGrid1.colcount) * 141) + 100;

//  grdDetails.colcount := grdPeriods.colcount;
  grdDetails.colcount := (iPeriods * 2) + 1;

// display the relevant headings
  with grdDetails do
    begin
      iposition := 1;
// *      for imonth := 1 to pred(grdPeriods.colcount) do
      for imonth := 1 to iperiods do
        begin
          cells[iposition,0] := 'Turnover';
          inc(iposition);
          cells[iposition,0] := 'Profit';
          inc(iposition);
        end;
    end;

  with qryReps do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintRepCatBudgetsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintRepCatBudgetsFrm.dblkpRepsClick(Sender: TObject);
begin
  iRep := dblkpReps.keyvalue;
//  With this rep, go and find any budget details, if they don't exist then create
//  and display.
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := dblkpReps.keyvalue;
      open;
      CreateRepBudgets;
    end;
  DisplayBudgets;
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintRepCatBudgetsFrm.CreateRepBudgets;
var
  iFirstperiod, iNewPeriod: integer;
  iCategory: integer;
  bAddRecord: boolean;
begin
  with qryFirstPeriod do
    begin
      close;
      parambyname('Financial_Year').asinteger := iCode;
      open;
      iFirstPeriod := fieldbyname('Period').asinteger;
    end;

// Add the Rep Budget details to the table from the first period
  for iNewPeriod := iFirstPeriod to pred(iFirstPeriod+iPeriods) do
    begin
      qryCategory.first;
      while qryCategory.eof <> true do
        begin
          bAddRecord := true;
          iCategory := qryCategory.fieldbyname('Category').asinteger;
//  Check whether the rep, period and category already exist
          with qryCheckBudget do
            begin
              close;
              parambyname('Period').asinteger := iNewPeriod;
              parambyname('Rep').asinteger := dblkpReps.keyvalue;
              parambyname('Category').asinteger := iCategory;
              open;
              if recordcount > 0 then
                bAddRecord := false;
            end;

//  Add the new rep budget
          if bAddRecord then
            begin
              with qryAddBudget do
                begin
                  close;
                  parambyname('Period').asinteger := iNewPeriod;
                  parambyname('Rep').asinteger := dblkpReps.keyvalue;
                  parambyname('Category').asinteger := iCategory;
                  parambyname('Turnover_Value').asfloat := 0.00;
                  parambyname('Profit_Value').asfloat := 0.00;
                  execsql;
                end;
            end;
          qryCategory.Next;
        end;
    end;
end;

procedure TPBMaintRepCatBudgetsFrm.DisplayBudgets;
var
  irow, icol, icount: integer;
  tmpCategory: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := dblkpReps.keyvalue;
      open;

      first;
      tmpCategory := fieldbyname('Category').asinteger;

      irow := 1;
      icol := 1;
      icount := 0;
      while eof <> true do
        begin
          if (icount <> 0) and (tmpCategory <> fieldbyname('Category').asinteger) then
            begin
              inc(irow);
              icol := 1;
              tmpCategory := fieldbyname('Category').asinteger;
            end;
          grdDetails.cells[icol,irow] := formatfloat('0',fieldbyname('Turnover_Value').asfloat);
          inc(icol);
          grdDetails.cells[icol,irow] := formatfloat('0',fieldbyname('Profit_Value').asfloat);
          inc(icol);
          next;
          inc(icount);
        end;
    end;
end;

procedure TPBMaintRepCatBudgetsFrm.grdDetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
    end;

    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    {If Heading Display Left justified in the cells}
    if ACol = 0 then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := grdDetails.FixedColor else
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
        Canvas.Brush.Color := grdDetails.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintRepCatBudgetsFrm.grdDetailsExit(Sender: TObject);
var
  irow, icol: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 1 to pred(colcount) do
          begin
            if cells[icol, irow] = '' then continue;
              cells[icol, irow] := formatfloat('0', StrToFloatDef(cells[icol,irow], 0, FormatSettings));
          end;
    end;
end;

procedure TPBMaintRepCatBudgetsFrm.ClearGrid;
var
  irow, icol: integer;
begin
  {Set the numeric values}
  with grdDetails do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 1 to pred(colcount) do
          cells[icol, irow] := '';
    end;
  OKbitBtn.Enabled := false;
end;

procedure TPBMaintRepCatBudgetsFrm.grdDetailsKeyPress(Sender: TObject;
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
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintRepCatBudgetsFrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
      begin
        if Cells[1, Row] = '' then
        begin
          Key := #0; { eat enter key }
          Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
          Exit;
        end
        else
         if Col < pred(colcount) then
          begin
            Col := Col + 1;
            Exit;
          end
         else
         if (Col = pred(colcount)) and (Row = pred(rowcount)) then
          begin
            col := 1;
            row := 1;
            exit;
          end
         else
          begin
            Col := 1;
            row := row + 1;
          end;
      end;
end;

procedure TPBMaintRepCatBudgetsFrm.grdDetailsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
//  ifloat: Real;
  irow, icol: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 1 to pred(colcount) do
          begin
            if cells[icol, irow] = '' then continue;
              cells[icol, irow] := formatfloat('0', StrToFloatDef(cells[icol,irow], 0, FormatSettings));
(*            if cells[2, irow] = '' then continue;
              cells[2, irow] := formatfloat('0.00',StrToFloatDef(cells[2,irow], 0, FormatSettings));
*)        end;
    end;
end;

procedure TPBMaintRepCatBudgetsFrm.OKBitBtnClick(Sender: TObject);
begin
  SaveRepBudgets;
  dblkpReps.keyvalue := 0;
  ClearGrid;
end;

procedure TPBMaintRepCatBudgetsFrm.SaveRepBudgets;
var
  icategory, iperiod: integer;
  icount: integer;
begin
  with grdDetails do
    begin
      for icategory := 1 to pred(rowcount) do
        begin
        icount := 1;
        for iperiod := 1 to iPeriods do
          begin
            with qryUpdBudget do
              begin
                close;
                parambyname('Period').asinteger := periods[iperiod];
                parambyname('Rep').asinteger := dblkpReps.keyvalue;
                parambyname('Category').asinteger := category[icategory];
                parambyname('Turnover_Value').asfloat := StrToFloatDef(cells[icount,icategory], 0, FormatSettings);
                inc(icount);
                parambyname('Profit_Value').asfloat := StrToFloatDef(cells[icount,icategory], 0, FormatSettings);
                inc(icount);
                execsql;
              end;
          end;
        end;
    end;
end;

procedure TPBMaintRepCatBudgetsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if not(OKBitBtn.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these budget values for this rep?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    OKBitBtnClick(self);
end;

procedure TPBMaintRepCatBudgetsFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
end;

procedure TPBMaintRepCatBudgetsFrm.grdPeriodsDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ACol > 100) then
    begin
      Canvas.Brush.Color := color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  const Gap = 4;
  if gdFixed in State then
    Canvas.Brush.Color := grdDetails.FixedColor else
    if gdSelected in State then
      Canvas.Brush.Color := $00FFF0E1 else
      Canvas.Brush.Color := clWindow;
  Canvas.FillRect(Rect);
  Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
end;

procedure TPBMaintRepCatBudgetsFrm.grdDetailsTopLeftChanged(
  Sender: TObject);
begin
//  grdPeriods.LeftCol := grdDetails.LeftCol;
  scrollbox1.horzscrollbar.position := (grdDetails.LeftCol - 1) * 71;
end;

end.
