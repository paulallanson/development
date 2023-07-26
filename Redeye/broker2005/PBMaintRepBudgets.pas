unit PBMaintRepBudgets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DBCGrids,
  ExtCtrls, Menus, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRepBudgetsFrm = class(TForm)
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
    lblRepName: TLabel;
    lblFinancialYear: TLabel;
    GroupBox1: TGroupBox;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    Panel2: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlBonus: TPanel;
    grpbxBonus: TGroupBox;
    lblBonus: TLabel;
    memBonus: TMemo;
    rdgrpBonus: TRadioGroup;
    rdgrpBonusType: TRadioGroup;
    grpbxCommission: TGroupBox;
    Label1: TLabel;
    memCommission: TMemo;
    rdgrpCommType: TRadioGroup;
    qryAddFinancials: TFDQuery;
    qryDelFinancials: TFDQuery;
    qryCheckExists: TFDQuery;
    qryUpdFinancials: TFDQuery;
    pmnFill: TPopupMenu;
    Filldown1: TMenuItem;
    FillAcrossandDown1: TMenuItem;
    PageControl1: TPageControl;
    tbshtCommission: TTabSheet;
    tbshtBudgets: TTabSheet;
    grdDetails: TStringGrid;
    grdCategory: TStringGrid;
    qryCategory: TFDQuery;
    qryGetRepCategory: TFDQuery;
    qryDelRepCats: TFDQuery;
    qryAddRepCats: TFDQuery;
    cmbxCommissionBasis: TComboBox;
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
    procedure rdgrpCommTypeClick(Sender: TObject);
    procedure rdgrpBonusTypeClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure Filldown1Click(Sender: TObject);
    procedure FillAcrossandDown1Click(Sender: TObject);
    procedure grdCategoryExit(Sender: TObject);
    procedure grdCategorySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cmbxCommissionBasisClick(Sender: TObject);
    procedure grdCategoryClick(Sender: TObject);
  private
    bOK: boolean;
    category: array[1..100] of integer;
    Mode: string;
    procedure CreateCopiedRepBudgets(tempRep: integer);
    procedure CreateRepBudgets;
    procedure DisplayBudgets;
    procedure DisplayRepBudgets(tempRep: integer);
    procedure SaveRepBudgets;
    procedure SaveRepCommission;
    procedure ClearGrid;
    procedure ShowDetails;
    procedure ShowRepDetails(tempRep: integer);
    procedure DisplayCommission;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    { Private declarations }
  public
    iCode: integer;
    iPeriods: integer;
    iRep: integer;
  end;

var
  PBMaintRepBudgetsFrm: TPBMaintRepBudgetsFrm;

implementation

{$R *.DFM}

uses PBLURep;

procedure TPBMaintRepBudgetsFrm.FormActivate(Sender: TObject);
var
  icount: integer;
  icategory: integer;
begin
// clear arrays
  for icount := 1 to 100 do
    category[icount] := 0;

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

  // display the list of categories
  with qryCategory do
    begin
      close;
      open;
      first;
      icategory := 1;
      while eof <> true do
        begin
          grdCategory.Cells[0,icategory] := fieldbyname('Description').asstring;
          category[icategory] := fieldbyname('Category').asinteger;
          next;
          inc(icategory);
        end;
    end;

  grdCategory.rowcount := icategory;

  ShowDetails;
  DisplayCommission;

  dblkpRepsClick(self);
end;

procedure TPBMaintRepBudgetsFrm.ShowDetails;
begin
  if Mode = 'A' then
    begin
      rdgrpCommType.itemindex := 0;
      grdCategory.ColWidths[2] := -1;
      grdCategory.ColWidths[3] := -1;
      grpbxBonus.visible := false;
      memCommission.text := '0.00';
      memBonus.text := '0.00';
    end
  else
    begin
      with qryCheckExists do
        begin
          close;
          parambyname('Rep').asinteger := irep;
          parambyname('Financial_Year').asinteger := iCode;
          open;
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
end;

procedure TPBMaintRepBudgetsFrm.DisplayCommission;
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

procedure TPBMaintRepBudgetsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintRepBudgetsFrm.FormCreate(Sender: TObject);
begin
  with grdCategory do
    begin
      Cells[0,0] := 'Category';
      Cells[1,0] := '% Commission';
      Cells[2,0] := 'Bonus';
      Cells[3,0] := 'Commission Basis';
      Cells[4,0] := 'New Business %';
    end;
    
  with grdDetails do
    begin
      cells[0,0] := 'Month';
      cells[1,0] := 'Turnover';
      cells[2,0] := 'Operating GP';
      cells[3,0] := 'Target GP';
    end;
end;

procedure TPBMaintRepBudgetsFrm.dblkpRepsClick(Sender: TObject);
begin
//  With this rep, go and find any budget details, if they don't exist then create
//  and display.
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := iRep;
      open;
      if recordcount <> iPeriods then
        CreateRepBudgets;
    end;
  DisplayBudgets;
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintRepBudgetsFrm.CreateRepBudgets;
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
        parambyname('Rep').asinteger := iRep;
        open;
        if recordcount > 0 then
          continue;
      end;

//  Add the new rep budget
    with qryAddBudget do
      begin
        close;
        parambyname('Period').asinteger := iNewPeriod;
        parambyname('Rep').asinteger := iRep;
        parambyname('Turnover_Value').asfloat := 0.00;
        parambyname('Operating_Profit_Value').asfloat := 0.00;
        parambyname('Profit_Value').asfloat := 0.00;
        execsql;
      end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.CreateCopiedRepBudgets(tempRep: integer);
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
        parambyname('Rep').asinteger := tempRep;
        open;
        if recordcount > 0 then
          continue;
      end;

//  Add the new rep budget
    with qryAddBudget do
      begin
        close;
        parambyname('Period').asinteger := iNewPeriod;
        parambyname('Rep').asinteger := tempRep;
        parambyname('Turnover_Value').asfloat := 0.00;
        parambyname('Operating_Profit_Value').asfloat := 0.00;
        parambyname('Profit_Value').asfloat := 0.00;
        execsql;
      end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.DisplayBudgets;
var
  icount: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := iRep;
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

procedure TPBMaintRepBudgetsFrm.DisplayRepBudgets(tempRep: integer);
var
  icount: integer;
begin
  with qryGetRepBudgets do
    begin
      close;
      parambyname('Financial_Year').asinteger := icode;
      parambyname('Rep').asinteger := tempRep;
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

procedure TPBMaintRepBudgetsFrm.grdDetailsDrawCell(Sender: TObject; vCol,
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

procedure TPBMaintRepBudgetsFrm.grdDetailsExit(Sender: TObject);
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
                cells[icol, irow] := formatfloat('0',(strtofloat(cells[icol,irow])*1000))
              else
                cells[icol, irow] := formatfloat('0',strtofloat(cells[icol,irow]));
          end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.ClearGrid;
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

procedure TPBMaintRepBudgetsFrm.grdDetailsKeyPress(Sender: TObject;
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

procedure TPBMaintRepBudgetsFrm.FormKeyPress(Sender: TObject;
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

procedure TPBMaintRepBudgetsFrm.grdDetailsSelectCell(Sender: TObject; ACol,
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
                cells[icol, irow] := formatfloat('0',(strtofloat(cells[icol,irow])*1000))
              else
                cells[icol, irow] := formatfloat('0',strtofloat(cells[icol,irow]));
          end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.OKBitBtnClick(Sender: TObject);
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
          parambyname('Commission_Rate').asfloat := strtofloat(memCommission.text);
          parambyname('Bonus_Rate').asfloat := strtofloat(memBonus.text);
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
          parambyname('Commission_Rate').asfloat := strtofloat(memCommission.text);
          parambyname('Bonus_Rate').asfloat := strtofloat(memBonus.text);
          execsql;
        end;
    end;

  SaveRepBudgets;
  SaveRepCommission;

  ClearGrid;
  bOK := true;
end;

procedure TPBMaintRepBudgetsFrm.SaveRepBudgets;
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
              parambyname('Rep').asinteger := iRep;
              parambyname('Turnover_Value').asfloat := strtofloat(cells[1,icount]);
              parambyname('Operating_Profit_Value').asfloat := strtofloat(cells[2,icount]);
              parambyname('Profit_Value').asfloat := strtofloat(cells[3,icount]);
              execsql;
            end;
        end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.SaveRepCommission;
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
            parambyname('Commission_Rate').asfloat := strtofloat(cells[1,icategory]);
            parambyname('Bonus_Rate').asfloat := strtofloat(cells[2,icategory]);
            parambyname('Commission_Basis').asstring := copy(cells[3,icategory],1,1);
            parambyname('New_Business_Rate').asfloat := strtofloat(cells[4,icategory]);
            execsql;
          end;
        end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.FormClose(Sender: TObject;
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

procedure TPBMaintRepBudgetsFrm.rdgrpCommTypeClick(Sender: TObject);
begin
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

procedure TPBMaintRepBudgetsFrm.rdgrpBonusTypeClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).itemindex of
    0:  lblBonus.caption := 'Bonus %';
    1:  lblBonus.caption := 'Bonus Amount';
  end;
end;

procedure TPBMaintRepBudgetsFrm.btnRepClick(Sender: TObject);
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

procedure TPBMaintRepBudgetsFrm.ShowRepDetails(tempRep: integer);
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
          rdgrpBonus.Enabled := false;
          rdgrpBonusType.Enabled := false;
        end
      else
      if fieldbyname('Commission_Type').asstring = 'B' then
        begin
          rdgrpCommType.itemindex := 1;
          rdgrpBonus.Enabled := true;
          rdgrpBonusType.Enabled := true;
        end
      else
        begin
          rdgrpCommType.itemindex := 2;
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
      if recordcount <> iPeriods then
        CreateCopiedRepBudgets(tempRep);
    end;
  DisplayRepBudgets(tempRep);
  OKBitBtn.Enabled := true;
end;

procedure TPBMaintRepBudgetsFrm.Filldown1Click(Sender: TObject);
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

procedure TPBMaintRepBudgetsFrm.FillAcrossandDown1Click(Sender: TObject);
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

procedure TPBMaintRepBudgetsFrm.grdCategoryExit(Sender: TObject);
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
                  cells[icol, irow] := formatfloat('#0.00',strtofloat(cells[icol,irow]));
              end;
          end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.grdCategorySelectCell(Sender: TObject;
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
                  cells[icol, irow] := formatfloat('#0.00',strtofloat(cells[icol,irow]));
              end;
          end;
    end;
end;

procedure TPBMaintRepBudgetsFrm.cmbxCommissionBasisClick(Sender: TObject);
begin
  with grdCategory do
  begin
    cells[3,row] := cmbxCommissionBasis.text;
  end;

end;

procedure TPBMaintRepBudgetsFrm.grdCategoryClick(Sender: TObject);
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

function TPBMaintRepBudgetsFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBMaintRepBudgetsFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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
