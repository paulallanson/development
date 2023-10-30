unit PBMaintRepFinancials;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DBCGrids,
  ExtCtrls, ComCtrls, Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRepFinancialsFrm = class(TForm)
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
    pnlBonus: TPanel;
    pgBudgets: TPageControl;
    tbshtCategory: TTabSheet;
    tbshtBudgets: TTabSheet;
    Panel5: TPanel;
    Label3: TLabel;
    ScrollBox1: TScrollBox;
    grdDetails: TStringGrid;
    grpbxBonus: TGroupBox;
    lblBonus: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    lblRepName: TLabel;
    lblFinancialYear: TLabel;
    grdCategory: TStringGrid;
    memBonus: TMemo;
    StringGrid1: TStringGrid;
    qryFY: TFDQuery;
    qryCheckExists: TFDQuery;
    qryAddRepCats: TFDQuery;
    qryDelRepCats: TFDQuery;
    qryGetRepCategory: TFDQuery;
    qryAddFinancials: TFDQuery;
    qryUpdFinancials: TFDQuery;
    rdgrpBonus: TRadioGroup;
    rdgrpBonusType: TRadioGroup;
    grpbxCommission: TGroupBox;
    Label4: TLabel;
    memCommission: TMemo;
    rdgrpCommType: TRadioGroup;
    GroupBox1: TGroupBox;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    pmuBudgets: TPopupMenu;
    ApplyTurnovertofutureperiods1: TMenuItem;
    ApplyProfitbudgettofutureperiods1: TMenuItem;
    ApplyTurnoveandBudgettofutureperiods1: TMenuItem;
    cmbxCommissionBasis: TComboBox;
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
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure rdgrpCommTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdCategoryExit(Sender: TObject);
    procedure grdCategorySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure rdgrpBonusTypeClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure grdCategoryClick(Sender: TObject);
    procedure cmbxCommissionBasisClick(Sender: TObject);
  private
    category: array[1..100] of integer;
    periods: array[1..100] of integer;
    procedure CreateRepBudgets;
    procedure DisplayBudgets;
    procedure SaveRepBudgets;
    procedure ClearGrid;
    procedure ShowDetails;
    procedure SaveRepCategories;
    procedure DisplayCommission;
    procedure ShowRepDetails(tempRep: integer);
    procedure DisplayRepBudgets(tempRep: integer);
    procedure DisplayRepCommission(tempRep: integer);
    procedure CreateCopiedRepBudgets(tempRep: integer);
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    { Private declarations }
  public
    bOK: boolean;
    FOldValue : string;
    iCode: integer;
    iPeriods: integer;
    iRep: integer;
    Mode: string;
  end;

var
  PBMaintRepFinancialsFrm: TPBMaintRepFinancialsFrm;

implementation

uses
  System.UITypes,
  CCSCommon, pbDatabase, PBLURep, pbMainMenu;

{$R *.DFM}

procedure TPBMaintRepFinancialsFrm.FormActivate(Sender: TObject);
var
  icategory, imonth, iposition: integer;
  icount, icol: integer;
begin
// clear arrays
  for icount := 1 to 100 do
    category[icount] := 0;

  for icount := 1 to 100 do
    periods[icount] := 0;

// check whether details for this rep exist
  with qryCheckExists do
    begin
      close;
      parambyname('Rep').asinteger := irep;
      parambyname('Financial_Year').asinteger := iCode;
      open;
      if recordcount > 0 then
        Mode := 'C'
      else
        Mode := 'A';
    end;

// display Financial Year details
  with qryFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := iCode;
      open;
      lblFinancialYear.Caption := fieldbyname('Title').asstring;
      iPeriods := fieldbyname('no_of_periods').asinteger;
    end;

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
          grdCategory.Cells[0,icategory] := fieldbyname('Description').asstring;
          category[icategory] := fieldbyname('Category').asinteger;
          next;
          inc(icategory);
        end;
    end;

  grdDetails.rowcount := icategory;
  grdCategory.rowcount := icategory;

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

  ShowDetails;
end;

procedure TPBMaintRepFinancialsFrm.ShowDetails;
begin
  if Mode = 'A' then
    begin
      rdgrpCommType.itemindex := 0;
      grdCategory.ColWidths[2] := -1;
      grdCategory.ColWidths[3] := -1;
      grpbxBonus.visible := false;
      memCommission.text := '0.00';
      memBonus.text := '0.00';
      pgBudgets.Pages[0].TabVisible := true;
    end
  else
    begin
      with qryCheckExists do
        begin
          if fieldbyname('Commission_Type').asstring = 'C' then
            begin
              rdgrpCommType.itemindex := 0;
              grdCategory.ColWidths[2] := -1;
              grdCategory.ColWidths[3] := -1;
              rdgrpBonus.Enabled := false;
              rdgrpBonusType.Enabled := false;
            end
          else
          if fieldbyname('Commission_Type').asstring = 'B' then
            begin
              rdgrpCommType.itemindex := 1;
              grdCategory.ColWidths[2] := 90;
              grdCategory.ColWidths[3] := -1;
              rdgrpBonus.Enabled := true;
              rdgrpBonusType.Enabled := true;
            end
          else
            begin
              rdgrpCommType.itemindex := 2;
              grdCategory.ColWidths[2] := 90;
              grdCategory.ColWidths[3] := 120;
              rdgrpBonus.Enabled := true;
              rdgrpBonusType.Enabled := true;
            end;

          if fieldbyname('Bonus_Type').asstring = 'P' then
            rdgrpBonusType.ItemIndex := 0
          else
            rdgrpBonusType.ItemIndex := 1;

          if fieldbyname('Bonus_Period').Asstring = 'M' then
            rdgrpBonus.ItemIndex := 0
          else
          if fieldbyname('Bonus_Period').Asstring = 'Q' then
            rdgrpBonus.ItemIndex := 1
          else
          if fieldbyname('Bonus_Period').Asstring = 'H' then
            rdgrpBonus.ItemIndex := 2;

          memCommission.text := formatfloat('#0.00',fieldbyname('Commission_Rate').asfloat);
          memBonus.text := formatfloat('#0.00',fieldbyname('Bonus_Rate').asfloat);
        end;
    end;
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := iRep;
      open;
      CreateRepBudgets;
    end;

  DisplayCommission;
  DisplayBudgets;
  OKBitBtn.Enabled := true;
  OkBitBtn.setfocus;
end;

procedure TPBMaintRepFinancialsFrm.ShowRepDetails(tempRep: integer);
begin
  with qryCheckExists do
    begin
      close;
      parambyname('Rep').asinteger := tempRep;
      parambyname('Financial_Year').asinteger := iCode;
      open;
      if recordcount = 0 then
        begin
          MessageDlg('Commission and Budget details do not exist for this rep', mterror, [mbOk], 0);
          exit;
        end;

      if fieldbyname('Commission_Type').asstring = 'C' then
        begin
          rdgrpCommType.itemindex := 0;
          grdCategory.ColWidths[2] := -1;
          grdCategory.ColWidths[3] := -1;
          rdgrpBonus.Enabled := false;
          rdgrpBonusType.Enabled := false;
        end
      else
      if fieldbyname('Commission_Type').asstring = 'B' then
        begin
          rdgrpCommType.itemindex := 1;
          grdCategory.ColWidths[2] := 90;
          grdCategory.ColWidths[3] := -1;
          rdgrpBonus.Enabled := true;
          rdgrpBonusType.Enabled := true;
        end
      else
        begin
          rdgrpCommType.itemindex := 2;
          grdCategory.ColWidths[2] := 90;
          grdCategory.ColWidths[3] := 120;
          rdgrpBonus.Enabled := true;
          rdgrpBonusType.Enabled := true;
        end;

      if fieldbyname('Bonus_Type').asstring = 'P' then
        rdgrpBonusType.ItemIndex := 0
      else
        rdgrpBonusType.ItemIndex := 1;

      if fieldbyname('Bonus_Period').Asstring = 'M' then
        rdgrpBonus.ItemIndex := 0
      else
      if fieldbyname('Bonus_Period').Asstring = 'Q' then
        rdgrpBonus.ItemIndex := 1
      else
      if fieldbyname('Bonus_Period').Asstring = 'H' then
        rdgrpBonus.ItemIndex := 2;

      memCommission.text := formatfloat('#0.00',fieldbyname('Commission_Rate').asfloat);
      memBonus.text := formatfloat('#0.00',fieldbyname('Bonus_Rate').asfloat);
    end;

  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := tempRep;
      open;
      CreateCopiedRepBudgets(tempRep);
    end;

  DisplayRepCommission(tempRep);
  DisplayRepBudgets(tempRep);
  OKBitBtn.Enabled := true;
  OkBitBtn.setfocus;
end;

procedure TPBMaintRepFinancialsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintRepFinancialsFrm.dblkpRepsClick(Sender: TObject);
begin
//  With this rep, go and find any budget details, if they don't exist then create
//  and display.
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := iRep;
      open;
      CreateRepBudgets;
    end;
  DisplayBudgets;
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintRepFinancialsFrm.CreateRepBudgets;
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
              parambyname('Rep').asinteger := iRep;
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
                  parambyname('Rep').asinteger := iRep;
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

procedure TPBMaintRepFinancialsFrm.CreateCopiedRepBudgets(tempRep: integer);
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
              parambyname('Rep').asinteger := tempRep;
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
                  parambyname('Rep').asinteger := tempRep;
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

procedure TPBMaintRepFinancialsFrm.DisplayCommission;
var
  icol, irow: integer;
  icount: integer;
begin
  for irow := 1 to pred(grdCategory.rowcount) do
    begin
      grdCategory.cells[1,irow] := '0.00';
      grdCategory.cells[2,irow] := '0.00';
      grdCategory.cells[3,irow] := '';
    end;

  icount := 1;
  while category[icount] <> 0 do
    begin
      with qryGetRepCategory do
        begin
          close;
          parambyname('Financial_Year').asinteger := icode;
          parambyname('Rep').asinteger := iRep;
          parambyname('Category').asinteger := category[icount];
          open;
          first;

          grdCategory.cells[1,icount] := formatfloat('#0.00',fieldbyname('Commission_Rate').asfloat);
          grdCategory.cells[2,icount] := formatfloat('#0.00',fieldbyname('Bonus_Rate').asfloat);
          if fieldbyname('Commission_Basis').asstring = 'T' then
            grdCategory.cells[3,icount] := 'Turnover'
          else
            grdCategory.cells[3,icount] := 'Gross Profit';
          grdCategory.cells[4,icount] := formatfloat('#0.00',fieldbyname('New_Business_Rate').asfloat);
        end;
      inc(icount);
    end;
end;

procedure TPBMaintRepFinancialsFrm.DisplayRepCommission(tempRep: integer);
var
  icol, irow: integer;
  icount: integer;
begin
  for irow := 1 to pred(grdCategory.rowcount) do
    begin
      grdCategory.cells[1,irow] := '0.00';
      grdCategory.cells[2,irow] := '0.00';
      grdCategory.cells[4,irow] := '0.00';
    end;

  icount := 1;
  while category[icount] <> 0 do
    begin
      with qryGetRepCategory do
        begin
          close;
          parambyname('Financial_Year').asinteger := icode;
          parambyname('Rep').asinteger := tempRep;
          parambyname('Category').asinteger := category[icount];
          open;
          first;

          grdCategory.cells[1,icount] := formatfloat('#0.00',fieldbyname('Commission_Rate').asfloat);
          grdCategory.cells[2,icount] := formatfloat('#0.00',fieldbyname('Bonus_Rate').asfloat);
          grdCategory.cells[3,icount] := formatfloat('#0.00',fieldbyname('New_Business_Rate').asfloat);
        end;
      inc(icount);
    end;
end;

procedure TPBMaintRepFinancialsFrm.DisplayBudgets;
var
  irow, icol, icount: integer;
  tmpCategory: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := iRep;
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

procedure TPBMaintRepFinancialsFrm.DisplayRepBudgets(tempRep: integer);
var
  irow, icol, icount: integer;
  tmpCategory: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := tempRep;
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

procedure TPBMaintRepFinancialsFrm.grdDetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  cmbxcommissionBasis.width := (Sender as TStringGrid).colwidths[ACol];
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,  Cells[ACol, ARow]);
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

procedure TPBMaintRepFinancialsFrm.grdDetailsExit(Sender: TObject);
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

procedure TPBMaintRepFinancialsFrm.ClearGrid;
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

procedure TPBMaintRepFinancialsFrm.grdDetailsKeyPress(Sender: TObject;
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

procedure TPBMaintRepFinancialsFrm.FormKeyPress(Sender: TObject;
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
         if row < pred(rowcount) then
          begin
            row := row + 1;
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
            row := 1;
            col := col + 1;
          end;
      end;
end;

procedure TPBMaintRepFinancialsFrm.grdDetailsSelectCell(Sender: TObject; ACol,
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

procedure TPBMaintRepFinancialsFrm.OKBitBtnClick(Sender: TObject);
begin
  if Mode = 'A' then
    begin
      with qryAddFinancials do
        begin
          close;
          parambyname('Rep').asinteger := iRep;
          parambyname('Financial_Year').asinteger := iCode;
          case rdgrpCommType.itemindex of
            0:  parambyname('Commission_type').asstring := 'C';
            1:  parambyname('Commission_type').asstring := 'B';
            2:  parambyname('Commission_type').asstring := 'V';
          end;
          case rdgrpBonus.itemindex of
            0:  parambyname('Bonus_Period').asstring := 'M';
            1:  parambyname('Bonus_Period').asstring := 'Q';
            2:  parambyname('Bonus_Period').asstring := 'H';
          end;
          case rdgrpBonusType.itemindex of
            0:  parambyname('Bonus_Type').asstring := 'P';
            1:  parambyname('Bonus_Type').asstring := 'A';
          end;
          parambyname('Commission_Rate').asfloat := StrToFloatDef(memCommission.text, 0, FormatSettings);
          parambyname('Bonus_Rate').asfloat := StrToFloatDef(memBonus.text, 0, FormatSettings);
          execsql;
        end;
    end
  else
    begin
      with qryUpdFinancials do
        begin
          close;
          parambyname('Rep').asinteger := iRep;
          parambyname('Financial_Year').asinteger := iCode;
          case rdgrpCommType.itemindex of
            0:  parambyname('Commission_type').asstring := 'C';
            1:  parambyname('Commission_type').asstring := 'B';
            2:  parambyname('Commission_type').asstring := 'V';
          end;
          case rdgrpBonus.itemindex of
            0:  parambyname('Bonus_Period').asstring := 'M';
            1:  parambyname('Bonus_Period').asstring := 'Q';
            2:  parambyname('Bonus_Period').asstring := 'H';
          end;
          case rdgrpBonusType.itemindex of
            0:  parambyname('Bonus_Type').asstring := 'P';
            1:  parambyname('Bonus_Type').asstring := 'A';
          end;
          parambyname('Commission_Rate').asfloat := StrToFloatDef(memCommission.text, 0, FormatSettings);
          parambyname('Bonus_Rate').asfloat := StrToFloatDef(memBonus.text, 0, FormatSettings);
          execsql;
        end;
    end;
  SaveRepBudgets;
  SaveRepCategories;
  bOK := true;
end;

procedure TPBMaintRepFinancialsFrm.SaveRepBudgets;
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
                parambyname('Rep').asinteger := iRep;
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

procedure TPBMaintRepFinancialsFrm.SaveRepCategories;
var
  icategory, iperiod: integer;
  icount: integer;
begin
  {delete old commission rates}
  with qryDelRepCats do
    begin
      close;
      parambyname('Financial_Year').asinteger := iCode;
      parambyname('Rep').asinteger := iRep;
      execsql;
    end;

  {Add the new commission rates}
  with grdCategory do
    begin
      for icategory := 1 to pred(rowcount) do
        begin
        with qryAddRepCats do
          begin
            close;
            parambyname('Financial_Year').asinteger := iCode;
            parambyname('Rep').asinteger := iRep;
            parambyname('Category').asinteger := category[icategory];
            parambyname('Commission_Rate').asfloat := StrToFloatDef(cells[1,icategory], 0, FormatSettings);
            parambyname('Bonus_Rate').asfloat := StrToFloatDef(cells[2,icategory], 0, FormatSettings);
            parambyname('Commission_Basis').asstring := copy(cells[3,icategory],1,1);
            parambyname('New_Business_Rate').asfloat := StrToFloatDef(cells[4,icategory], 0, FormatSettings);
            execsql;
          end;
        end;
    end;
end;

procedure TPBMaintRepFinancialsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);

  if bOK then exit;
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

procedure TPBMaintRepFinancialsFrm.grdPeriodsDrawCell(Sender: TObject;
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

    const Gap = 4;
    if gdFixed in State then
      Canvas.Brush.Color := grdDetails.FixedColor else
      if gdSelected in State then
        Canvas.Brush.Color := $00FFF0E1 else
        Canvas.Brush.Color := clWindow;
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
  end;
end;

procedure TPBMaintRepFinancialsFrm.grdDetailsTopLeftChanged(
  Sender: TObject);
begin
//  grdPeriods.LeftCol := grdDetails.LeftCol;
  scrollbox1.horzscrollbar.position := (grdDetails.LeftCol - 1) * 71;
end;

procedure TPBMaintRepFinancialsFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintRepFinancialsFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintRepFinancialsFrm.rdgrpCommTypeClick(Sender: TObject);
begin
//  grpbxBonus.Visible := ((sender as TRadioGroup).itemindex = 1);
  case (sender as TRadioGroup).itemindex of
    0:  begin
          grdCategory.ColWidths[2] := -1;
          grdCategory.ColWidths[3] := -1;
          rdgrpBonus.Enabled := false;
          rdgrpBonusType.Enabled := false;
        end;
    1:  begin
          grdCategory.ColWidths[2] := 90;
          grdCategory.ColWidths[3] := -1;
          rdgrpBonus.Enabled := true;
          rdgrpBonusType.Enabled := true;
        end;
    2:  begin
          grdCategory.ColWidths[2] := 90;
          grdCategory.ColWidths[3] := 120;
          rdgrpBonus.Enabled := true;
          rdgrpBonusType.Enabled := true;
        end;
  end;
end;

procedure TPBMaintRepFinancialsFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  grdCategory.Cells[1,0] := '% Commission';
  grdCategory.Cells[2,0] := 'Bonus';
  grdCategory.Cells[3,0] := 'Commission Basis';
  grdCategory.Cells[4,0] := 'New Business %';
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintRepFinancialsFrm.grdCategoryExit(Sender: TObject);
var
  irow, icol: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 1 to pred(colcount) do
          begin
            if (icol < 3) or (icol = 4) then
              begin
                if cells[icol, irow] = '' then continue;
                  cells[icol, irow] := formatfloat('#0.00',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
              end;
          end;
    end;
end;

procedure TPBMaintRepFinancialsFrm.grdCategorySelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
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
            if (icol < 3) or (icol = 4) then
              begin
                if cells[icol, irow] = '' then continue;
                  cells[icol, irow] := formatfloat('#0.00',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
              end;
          end;
    end;
end;

procedure TPBMaintRepFinancialsFrm.rdgrpBonusTypeClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).itemindex of
    0:  lblBonus.caption := 'Bonus %';
    1:  lblBonus.caption := 'Bonus Amount';
  end;
end;

procedure TPBMaintRepFinancialsFrm.btnRepClick(Sender: TObject);
var
  pbluRepBudget: TPBLURepFrm;
begin
  pbluRepBudget := TPBLURepFrm.Create(Self);
  try
    pbluRepBudget.bIs_Lookup := True;
    pbluRepBudget.bAllow_Upd := False;
    pbluRepBudget.ShowModal;
    if pbluRepBudget.Selected then
    begin
      edtRep.Text := pbluRepBudget.SelName;
      ShowRepDetails(pbluRepBudget.selcode);
    end;
  finally
    pbluRepBudget.Free;
  end;

end;

procedure TPBMaintRepFinancialsFrm.grdCategoryClick(Sender: TObject);
begin
  with grdCategory do
  begin
    if Col = 3 then
    begin
      cmbxCommissionBasis.Top := celltop(grdCategory, Row);
      cmbxCommissionBasis.Left := cellleft(grdCategory, Col);
      cmbxCommissionBasis.width := colwidths[3];

      if cells[3,row] <> '' then
        begin
          cmbxCommissionBasis.text := cells[3,row];
          cmbxCommissionBasis.itemindex := cmbxCommissionBasis.items.indexof(cells[3,row]);
        end;
      cmbxCommissionBasis.bringtofront;
      cmbxCommissionBasis.Visible := True;
      cmbxCommissionBasis.SetFocus;
    end
    else
    begin
      cmbxCommissionBasis.sendtoback;
      cmbxCommissionBasis.Visible := False;
    end
  end;

end;

function TPBMaintRepFinancialsFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBMaintRepFinancialsFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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

procedure TPBMaintRepFinancialsFrm.cmbxCommissionBasisClick(
  Sender: TObject);
begin
  with grdCategory do
  begin
    cells[3,row] := cmbxCommissionBasis.text;
  end;

end;

end.
