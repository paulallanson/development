unit PBMaintFYRepBudgets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DBCGrids;

type
  TPBMaintFYRepBudgetsFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dblkpReps: TDBLookupComboBox;
    edtFY: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryPeriods: TQuery;
    dtsPeriods: TDataSource;
    qryReps: TQuery;
    dtsReps: TDataSource;
    grdDetails: TStringGrid;
    qryGetRepBudgets: TQuery;
    qryFirstPeriod: TQuery;
    qryCheckBudget: TQuery;
    qryUpdBudget: TQuery;
    qryAddBudget: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpRepsClick(Sender: TObject);
    procedure grdDetailsDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grdDetailsExit(Sender: TObject);
    procedure grdDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
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
  PBMaintFYRepBudgetsFrm: TPBMaintFYRepBudgetsFrm;

implementation

{$R *.DFM}

procedure TPBMaintFYRepBudgetsFrm.FormActivate(Sender: TObject);
var
  icount: integer;
begin
  grdDetails.rowcount := iPeriods + 1;
  with qryPeriods do
    begin
      close;
      parambyname('Financial_year').asinteger := icode;
      open;

      first;
      icount := 1;
      while eof <> true do
        begin
          grdDetails.cells[0,icount] := fieldbyname('Description').asstring;
          grdDetails.cells[1,icount] := '';
          grdDetails.cells[2,icount] := '';
          next;
          inc(icount);
        end;
    end;

  with qryReps do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintFYRepBudgetsFrm.FormCreate(Sender: TObject);
begin
  with grdDetails do
    begin
      cells[0,0] := 'Month';
      cells[1,0] := 'Turnover';
      cells[2,0] := 'Profit';
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.dblkpRepsClick(Sender: TObject);
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
      if recordcount <> iPeriods then
        CreateRepBudgets;
    end;
  DisplayBudgets;
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintFYRepBudgetsFrm.CreateRepBudgets;
var
  iFirstperiod, iNewPeriod: integer;
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
//  Check whether the rep and period already exist
    with qryCheckBudget do
      begin
        close;
        parambyname('Period').asinteger := iNewPeriod;
        parambyname('Rep').asinteger := dblkpReps.keyvalue;
        open;
        if recordcount > 0 then
          continue;
      end;

//  Add the new rep budget
    with qryAddBudget do
      begin
        close;
        parambyname('Period').asinteger := iNewPeriod;
        parambyname('Rep').asinteger := dblkpReps.keyvalue;
        parambyname('Turnover_Value').asfloat := 0.00;
        parambyname('Profit_Value').asfloat := 0.00;
        execsql;
      end;
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.DisplayBudgets;
var
  icount: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := dblkpReps.keyvalue;
      open;

      first;
      icount := 1;
      while eof <> true do
        begin
          grdDetails.cells[1,icount] := formatfloat('0.00',fieldbyname('Turnover_Value').asfloat);
          grdDetails.cells[2,icount] := formatfloat('0.00',fieldbyname('Profit_Value').asfloat);
          grdDetails.cells[3,icount] := fieldbyname('Period').asstring;
          next;
          inc(icount);
        end;
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.grdDetailsDrawCell(Sender: TObject; vCol,
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
  {If Heading Display Left justified in the cells}
  with Sender as TStringGrid do
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

procedure TPBMaintFYRepBudgetsFrm.grdDetailsExit(Sender: TObject);
var
  irow: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[1, irow] = '' then continue;
          cells[1, irow] := formatfloat('0.00',strtofloat(cells[1,irow]));
        end;
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.ClearGrid;
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

procedure TPBMaintFYRepBudgetsFrm.grdDetailsKeyPress(Sender: TObject;
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

procedure TPBMaintFYRepBudgetsFrm.FormKeyPress(Sender: TObject;
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
         if Col < 2 then
          begin
            Col := Col + 1;
            Exit;
          end
         else
         if (Col = 2) and (Row = Rowcount - 1) then
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

procedure TPBMaintFYRepBudgetsFrm.grdDetailsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
//  ifloat: Real;
  irow: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[1, irow] = '' then continue;
            cells[1, irow] := formatfloat('0.00',strtofloat(cells[1,irow]));
          if cells[2, irow] = '' then continue;
            cells[2, irow] := formatfloat('0.00',strtofloat(cells[2,irow]));
        end;
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.OKBitBtnClick(Sender: TObject);
begin
  SaveRepBudgets;
  dblkpReps.keyvalue := 0;
  ClearGrid;
end;

procedure TPBMaintFYRepBudgetsFrm.SaveRepBudgets;
var
  icount: integer;
begin
  with grdDetails do
    begin
      for icount := 1 to pred(rowcount) do
        begin
          with qryUpdBudget do
            begin
              close;
              parambyname('Period').asinteger := strtoint(cells[3,icount]);
              parambyname('Rep').asinteger := dblkpReps.keyvalue;
              parambyname('Turnover_Value').asfloat := strtofloat(cells[1,icount]);
              parambyname('Profit_Value').asfloat := strtofloat(cells[2,icount]);
              execsql;
            end;
        end;
    end;
end;

procedure TPBMaintFYRepBudgetsFrm.FormClose(Sender: TObject;
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

end.
