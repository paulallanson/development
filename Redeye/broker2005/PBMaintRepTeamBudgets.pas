unit PBMaintRepTeamBudgets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DBCGrids,
  ExtCtrls, Menus, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRepTeamBudgetsFrm = class(TForm)
    qryPeriods: TFDQuery;
    dtsPeriods: TDataSource;
    qryGetRepBudgets: TFDQuery;
    qryFirstPeriod: TFDQuery;
    qryCheckBudget: TFDQuery;
    qryUpdBudget: TFDQuery;
    qryAddBudget: TFDQuery;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lblRepTeamName: TLabel;
    lblFinancialYear: TLabel;
    GroupBox1: TGroupBox;
    lblCustBran: TLabel;
    edtRepTeam: TEdit;
    btnRep: TButton;
    Panel2: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pmnFill: TPopupMenu;
    Filldown1: TMenuItem;
    FillAcrossandDown1: TMenuItem;
    PageControl1: TPageControl;
    tbshtBudgets: TTabSheet;
    grdDetails: TStringGrid;
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
    procedure btnRepClick(Sender: TObject);
    procedure Filldown1Click(Sender: TObject);
    procedure FillAcrossandDown1Click(Sender: TObject);
  private
    bOK: boolean;
    category: array[1..100] of integer;
    Mode: string;
    procedure CreateCopiedRepBudgets(tempRepTeam: integer);
    procedure CreateRepBudgets;
    procedure DisplayBudgets;
    procedure DisplayRepBudgets(tempRepTeam: integer);
    procedure SaveRepTeamBudgets;
    procedure ClearGrid;
    procedure ShowRepTeamDetails(tempRepTeam: integer);
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    { Private declarations }
  public
    iCode: integer;
    iPeriods: integer;
    iRepTeam: integer;
  end;

var
  PBMaintRepTeamBudgetsFrm: TPBMaintRepTeamBudgetsFrm;

implementation

{$R *.DFM}

uses PBLURepTeam;

procedure TPBMaintRepTeamBudgetsFrm.FormActivate(Sender: TObject);
var
  icount: integer;
begin
// clear arrays
  for icount := 1 to 100 do
    category[icount] := 0;

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

  dblkpRepsClick(self);
end;

procedure TPBMaintRepTeamBudgetsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintRepTeamBudgetsFrm.FormCreate(Sender: TObject);
begin
  with grdDetails do
    begin
      cells[0,0] := 'Month';
      cells[1,0] := 'Turnover';
      cells[2,0] := 'Operating GP';
      cells[3,0] := 'Target GP';
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.dblkpRepsClick(Sender: TObject);
begin
//  With this rep, go and find any budget details, if they don't exist then create
//  and display.
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep_Team').asinteger := iRepTeam;
      open;
      if recordcount <> iPeriods then
        CreateRepBudgets;
    end;
  DisplayBudgets;
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintRepTeamBudgetsFrm.CreateRepBudgets;
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
        parambyname('Rep_Team').asinteger := iRepTeam;
        open;
        if recordcount > 0 then
          continue;
      end;

//  Add the new rep budget
    with qryAddBudget do
      begin
        close;
        parambyname('Period').asinteger := iNewPeriod;
        parambyname('Rep_Team').asinteger := iRepTeam;
        parambyname('Turnover_Value').asfloat := 0.00;
        parambyname('Operating_Profit_Value').asfloat := 0.00;
        parambyname('Profit_Value').asfloat := 0.00;
        execsql;
      end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.CreateCopiedRepBudgets(tempRepTeam: integer);
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
        parambyname('Rep_Team').asinteger := tempRepTeam;
        open;
        if recordcount > 0 then
          continue;
      end;

//  Add the new rep budget
    with qryAddBudget do
      begin
        close;
        parambyname('Period').asinteger := iNewPeriod;
        parambyname('Rep_Team').asinteger := tempRepTeam;
        parambyname('Turnover_Value').asfloat := 0.00;
        parambyname('Operating_Profit_Value').asfloat := 0.00;
        parambyname('Profit_Value').asfloat := 0.00;
        execsql;
      end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.DisplayBudgets;
var
  icount: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep_Team').asinteger := iRepTeam;
      open;

      first;
      icount := 1;
      while eof <> true do
        begin
          grdDetails.cells[1,icount] := formatfloat('##0',fieldbyname('Turnover_Value').asfloat);
          grdDetails.cells[2,icount] := formatfloat('##0',fieldbyname('Operating_Profit_Value').asfloat);
          grdDetails.cells[3,icount] := formatfloat('##0',fieldbyname('Profit_Value').asfloat);
          grdDetails.cells[4,icount] := fieldbyname('Period').asstring;
          next;
          inc(icount);
        end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.DisplayRepBudgets(tempRepTeam: integer);
var
  icount: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep_Team').asinteger := tempRepTeam;
      open;

      first;
      icount := 1;
      while eof <> true do
        begin
          grdDetails.cells[1,icount] := formatfloat('##0',fieldbyname('Turnover_Value').asfloat);
          grdDetails.cells[2,icount] := formatfloat('##0',fieldbyname('Operating_Profit_Value').asfloat);
          grdDetails.cells[3,icount] := formatfloat('##0',fieldbyname('Profit_Value').asfloat);
          grdDetails.cells[4,icount] := fieldbyname('Period').asstring;
          next;
          inc(icount);
        end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.grdDetailsDrawCell(Sender: TObject; vCol,
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

procedure TPBMaintRepTeamBudgetsFrm.grdDetailsExit(Sender: TObject);
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
              if pos('.',cells[icol, irow]) > 0 then
                cells[icol, irow] := formatfloat('0',(StrToFloatDef(cells[icol,irow], 0, FormatSettings) * 1000))
              else
                cells[icol, irow] := formatfloat('0',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
          end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.ClearGrid;
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

procedure TPBMaintRepTeamBudgetsFrm.grdDetailsKeyPress(Sender: TObject;
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

procedure TPBMaintRepTeamBudgetsFrm.FormKeyPress(Sender: TObject;
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
         if Col < 3 then
          begin
            Col := Col + 1;
            Exit;
          end
         else
         if (Col = 3) and (Row = Rowcount - 1) then
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

procedure TPBMaintRepTeamBudgetsFrm.grdDetailsSelectCell(Sender: TObject; ACol,
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
              if pos('.',cells[icol, irow]) > 0 then
                cells[icol, irow] := formatfloat('0',(StrToFloatDef(cells[icol,irow], 0, FormatSettings) * 1000))
              else
                cells[icol, irow] := formatfloat('0',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
          end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.OKBitBtnClick(Sender: TObject);
begin

  SaveRepTeamBudgets;

  ClearGrid;
  bOK := true;
end;

procedure TPBMaintRepTeamBudgetsFrm.SaveRepTeamBudgets;
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
              parambyname('Period').asinteger := strtoint(cells[4,icount]);
              parambyname('Rep_Team').asinteger := iRepTeam;
              parambyname('Turnover_Value').asfloat := StrToFloatDef(cells[1,icount], 0, FormatSettings);
              parambyname('Operating_Profit_Value').asfloat := StrToFloatDef(cells[2,icount], 0, FormatSettings);
              parambyname('Profit_Value').asfloat := StrToFloatDef(cells[3,icount], 0, FormatSettings);
              execsql;
            end;
        end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if not(OKBitBtn.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these budget values for this rep team?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    OKBitBtnClick(self);
end;

procedure TPBMaintRepTeamBudgetsFrm.btnRepClick(Sender: TObject);
var
  pbluRepTeamBudget: TPBLURepTeamFrm;
begin
  pbluRepTeamBudget := TPBLURepTeamFrm.Create(Self);
  try
    pbluRepTeamBudget.bIs_Lookup := True;
    pbluRepTeamBudget.bAllow_Upd := False;
    pbluRepTeamBudget.ShowModal;
    if pbluRepTeamBudget.Selected then
    begin
      edtRepTeam.Text := pbluRepTeamBudget.SelName;
      ShowRepTeamDetails(pbluRepTeamBudget.selcode);
    end;
  finally
    pbluRepTeamBudget.Free;
  end;
end;

procedure TPBMaintRepTeamBudgetsFrm.ShowRepTeamDetails(tempRepTeam: integer);
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep_Team').asinteger := tempRepTeam;
      open;
      if recordcount <> iPeriods then
        CreateCopiedRepBudgets(tempRepTeam);
    end;

  DisplayRepBudgets(tempRepTeam);
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintRepTeamBudgetsFrm.Filldown1Click(Sender: TObject);
var
  irow, icol, icount: integer;
begin
  irow := grdDetails.row;
  icol := grdDetails.col;

  with grdDetails do
    begin
      for icount := (irow+1) to pred(grdDetails.rowcount) do
        begin
          cells[icol,icount] := cells[icol,irow];
        end;
    end;
end;

procedure TPBMaintRepTeamBudgetsFrm.FillAcrossandDown1Click(Sender: TObject);
var
  irow, icol, irowcount, icolcount: integer;
begin
  irow := grdDetails.row;
  icol := grdDetails.col;

  with grdDetails do
    begin
    for icolcount := 1 to pred(grdDetails.colcount) do
      for irowcount := (irow+1) to pred(grdDetails.rowcount) do
        begin
          cells[icolcount,irowcount] := cells[icolcount,irow];
        end;
    end;
end;

function TPBMaintRepTeamBudgetsFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBMaintRepTeamBudgetsFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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

end.
