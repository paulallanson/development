(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Financial Years

*******************************************************************************)
unit PBLUFinanceYear;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUFinanceYearFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    qryCheckSalesProfit: TFDQuery;
    qryGetLastFY: TFDQuery;
    qryCheckRepCatBudgets: TFDQuery;
    qryCompany: TFDQuery;
    qryCheckRepBudgets: TFDQuery;
    btnRepBudget: TBitBtn;
    btnCustBudget: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
    procedure btnRepBudgetClick(Sender: TObject);
    procedure btnCustBudgetClick(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
    function TransactionsExist: boolean;
    function BudgetsExist: boolean;
    function IsThisTheLastYear: boolean;
  public
    SelCode, sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUFinanceYearFrm: TPBLUFinanceYearFrm;

implementation

uses
  System.UITypes,
  PBDatabase, pbMainMenu, PBMaintFinanceYear, PBMaintFYRepBudgets,
  PBMaintRepCatBudgets, PBMaintCustBudgets;

{$R *.DFM}

procedure TPBLUFinanceYearFrm.FormActivate(Sender: TObject);
begin
  qryCompany.close;
  qryCompany.open;

  btnRepBudget.visible := (qryCompany.fieldbyname('Performance_target_type').asstring = 'R');
    
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup Financial Years';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Financial Years';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> '') then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuFinancials',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUFinanceYearFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
//    BudgetBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUFinanceYearFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUFinanceYearFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUFinanceYearFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUFinanceYearFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUFinanceYearFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Financial_Year').AsString;
  SelName := DetsSRC.DataSet.FieldByName('Title').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUFinanceYearFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUFinanceYearFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUFinanceYearFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUFinanceYearFrm.DelBitBtnClick(Sender: TObject);
begin
// check to see if any transactions have already been created for this year
  if not IsThisTheLastYear then
    begin
      MessageDlg('Cannot delete, this is not the last financial year defined, you must delete the later financial years', mtInformation, [mbOk], 0);
      exit;
    end;

// check to see if any transactions have already been created for this year
  if TransactionsExist then
    begin
      MessageDlg('Cannot delete, transactions exist for this financial year.', mtInformation, [mbOk], 0);
      exit;
    end;

// check if rep budgets have been created for this year
  if BudgetsExist then
    if MessageDlg('Rep budgets have been set for this year, do you want to continue and delete the budgets?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    else
      exit;
  {Delete a Financial year}
  CallMaintScreen('D');
end;

function TPBLUFinanceYearFrm.TransactionsExist: boolean;
begin
//  check for transactions in this year
  with qryCheckSalesProfit do
    begin
      close;
      parambyname('Financial_Year').asinteger := detsdbgrid.datasource.dataset.fieldbyname('Financial_Year').asinteger;
      open;
      result := (recordcount > 0);
    end;
end;

function TPBLUFinanceYearFrm.BudgetsExist: boolean;
begin
//  check for transactions in this year
  if qryCompany.fieldbyname('Performance_target_type').asstring = 'C' then
  begin
    with qryCheckRepCatBudgets do
      begin
        close;
        parambyname('Financial_Year').asinteger := detsdbgrid.datasource.dataset.fieldbyname('Financial_Year').asinteger;
        open;
        result := (recordcount > 0);
      end;
  end
  else
  begin
    with qryCheckRepBudgets do
      begin
        close;
        parambyname('Financial_Year').asinteger := detsdbgrid.datasource.dataset.fieldbyname('Financial_Year').asinteger;
        open;
        result := (recordcount > 0);
      end;
  end;
end;

function TPBLUFinanceYearFrm.IsThisTheLastYear: boolean;
var
  iTemp: integer;
begin
  result := true;
  with qryGetLastFY do
    begin
      close;
      open;
      iTemp := fieldbyname('Last_FY').asinteger;
    end;
  if detsdbgrid.datasource.dataset.fieldbyname('Financial_Year').asinteger <> iTemp then
    result := false;
end;

procedure TPBLUFinanceYearFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  PBMaintFinanceYearFrm := TPBMaintFinanceYearFrm.Create(Self);
  try
// check to see if any transactions have already been created for this year
    if sTempFuncMode = 'C' then
      begin
        if TransactionsExist then
          if MessageDlg('Transactions exist for this financial year, you cannot change the period settings. Continue?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              PBMaintFinanceYearFrm.YearStarted := true
        else
          exit;

        PBMaintFinanceYearFrm.BudgetsSet := BudgetsExist;
        PBMaintFinanceYearFrm.LastYear := IsThisTheLastYear;
      end;

    PBMaintFinanceYearFrm.sFuncMode := sTempFuncMode;
    PBMaintFinanceYearFrm.ShowModal;
    bTempOK := (PBMaintFinanceYearFrm.ModalResult = mrOK);
    sTempSel := IntToStr(PBMaintFinanceYearFrm.iCode);
  finally
    PBMaintFinanceYearFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(sTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
    NameEdit.SetFocus;
  end;
end;

procedure TPBLUFinanceYearFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Financial_Year').AsString <> sTempSel) do
      Next;
  end;
end;

procedure TPBLUFinanceYearFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBLUFinanceYearFrm.btnRepBudgetClick(Sender: TObject);
begin
(*  if qryCompany.fieldbyname('Performance_target_type').asstring = 'C' then
    begin
      PBMaintRepCatBudgetsFrm := TPBMaintRepCatBudgetsFrm.create(self);
      try
        PBMaintRepCatBudgetsFrm.iCode := detsdbGrid.datasource.dataset.fieldbyname('Financial_Year').asinteger;
        PBMaintRepCatBudgetsFrm.iPeriods := detsdbGrid.datasource.dataset.fieldbyname('no_of_periods').asinteger;
        PBMaintRepCatBudgetsFrm.edtFY.text := detsdbGrid.datasource.dataset.fieldbyname('Title').asstring;
        PBMaintRepCatBudgetsFrm.showmodal;
      finally
        PBMaintRepCatBudgetsFrm.free;
      end;
    end
  else
    begin
*)
      PBMaintFYRepBudgetsFrm := TPBMaintFYRepBudgetsFrm.create(self);
      try
        PBMaintFYRepBudgetsFrm.iCode := detsdbGrid.datasource.dataset.fieldbyname('Financial_Year').asinteger;
        PBMaintFYRepBudgetsFrm.iPeriods := detsdbGrid.datasource.dataset.fieldbyname('no_of_periods').asinteger;
        PBMaintFYRepBudgetsFrm.edtFY.text := detsdbGrid.datasource.dataset.fieldbyname('Title').asstring;
        PBMaintFYRepBudgetsFrm.showmodal;
      finally
        PBMaintFYRepBudgetsFrm.free;
      end;
(*    end;
*)
end;

procedure TPBLUFinanceYearFrm.btnCustBudgetClick(Sender: TObject);
begin
  PBMaintCustBudgetsFrm := TPBMaintCustBudgetsFrm.create(self);
  try
    PBMaintCustBudgetsFrm.iStartPeriod := detsdbGrid.datasource.dataset.fieldbyname('First_Period_no').asinteger;
    PBMaintCustBudgetsFrm.iCode := detsdbGrid.datasource.dataset.fieldbyname('Financial_Year').asinteger;
    PBMaintCustBudgetsFrm.iPeriods := detsdbGrid.datasource.dataset.fieldbyname('no_of_periods').asinteger;
    PBMaintCustBudgetsFrm.edtFY.text := detsdbGrid.datasource.dataset.fieldbyname('Title').asstring;
    PBMaintCustBudgetsFrm.showmodal;
  finally
    PBMaintCustBudgetsFrm.free;
  end;
end;

end.
