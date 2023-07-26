unit PBMaintFinanceYear;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintFinanceYearFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    edtTitle: TEdit;
    edtYear: TEdit;
    Label2: TLabel;
    DetsSRC: TDataSource;
    qryZero: TFDQuery;
    Label3: TLabel;
    cmbMonth: TComboBox;
    Label4: TLabel;
    spnNoOfPeriods: TSpinEdit;
    qryGetLastPeriod: TFDQuery;
    qryChkPeriod: TFDQuery;
    qryAddPeriod: TFDQuery;
    DelPeriodsSQL: TFDQuery;
    qryUpPeriod: TFDQuery;
    DelBudgetsSQL: TFDQuery;
    DelRepCatsSQL: TFDQuery;
    DelRepFinanceSQL: TFDQuery;
    Label19: TLabel;
    cmbBudgetType: TComboBox;
    Label5: TLabel;
    cmbCommission: TComboBox;
    UpdBasicSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure edtYearChange(Sender: TObject);
    procedure edtYearKeyPress(Sender: TObject; var Key: Char);
  private
    ThisYear, ThisMonth, ThisDay: Word;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DeletePeriods;
    procedure UpdatePeriods;
    function setMonthEnd(TempDate: TDateTime): TDateTime;
    procedure GetNextYearDetails;
  public
    YearStarted, BudgetsSet, LastYear: Boolean;
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintFinanceYearFrm: TPBMaintFinanceYearFrm;

implementation

uses PBLUFinanceYear, ComObj, ActiveX, PBDatabase, pbMainMenu, CCSCommon;

{$R *.DFM}

procedure TPBMaintFinanceYearFrm.GetNextYearDetails;
var
  NewDate: TDateTime;
  Month, Year: string;
  Periods: integer;
begin
  PBLUFinanceYearFrm.DetsSRC.DataSet.Last;
  Month := PBLUFinanceYearFrm.DetsSRC.DataSet.fieldbyname('Start_period_no').asstring;
  Year := PBLUFinanceYearFrm.DetsSRC.DataSet.fieldbyname('Start_period_Year').asstring;
  Periods := PBLUFinanceYearFrm.DetsSRC.DataSet.fieldbyname('No_of_periods').asinteger;
  NewDate := PBDateStr('01/'+Month+'/'+Year);
  NewDate := incMonth(NewDate,Periods);
  decodedate(NewDate,ThisYear,ThisMonth,ThisDay);
end;

procedure TPBMaintFinanceYearFrm.FormActivate(Sender: TObject);
begin
//  Find the current month and year
  decodedate(date,ThisYear,ThisMonth,ThisDay);

  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new financial year';
  if sFuncMode = 'C' then
    Caption := 'Change a financial year';
  if sFuncMode = 'D' then
    Caption := 'Delete a financial year';
  if sFuncMode = 'A' then
  begin
//  if this is the first record then allow entry of date etc
//  if not the set the fields based on the previous financial year
    if PBLUFinanceYearFrm.DetsSRC.DataSet.recordcount = 0 then
      begin
        edtTitle.Text := '';
        edtYear.Text := inttostr(ThisYear);
        cmbMonth.itemindex := ThisMonth-1;
        cmbBudgetType.itemindex := 0;
        cmbCommission.itemindex := 0;
      end
    else
      begin
        edtTitle.text := '';
        GetNextYearDetails;
        edtYear.text := inttostr(ThisYear);
        cmbMonth.itemindex := ThisMonth-1;

        cmbBudgetType.itemindex := 0;
        cmbCommission.itemindex := 0;

        edtYear.enabled := false;
        cmbMonth.enabled := False;
      end;
  end
  else
  begin
    with PBLUFinanceYearFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Financial_Year').AsInteger;
      edtTitle.Text := FieldByName('Title').AsString;
      cmbMonth.itemindex := FieldByName('Start_Period_no').Asinteger - 1;
      edtYear.Text := FieldByName('Start_Period_Year').AsString;
      spnNoOfPeriods.value := FieldByName('No_of_Periods').Asinteger;
      if FieldByName('Performance_target_type').asstring = 'C' then
        cmbBudgetType.itemindex := 1
      else
        cmbBudgetType.itemindex := 0;

      if FieldByName('Commission_Basis').asstring = 'C' then
        cmbCommission.itemindex := 1
      else
        cmbCommission.itemindex := 0;
    end;

    edtYear.enabled := false;
    cmbMonth.enabled := False;

    spnNoOfperiods.enabled := LastYear;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D') and
                        (PBLUFinanceYearFrm.DetsSRC.DataSet.fieldbyname('Year_Closed_Off').asstring <> 'Y');

  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuFinancials',frmpBMainMEnu.iOperator,0,0) ;
end;

procedure TPBMaintFinanceYearFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtTitle.Text <> '') and
    (cmbMonth.Text <> '') and
    (edtYear.Text <> '') and
    (cmbBudgetType.Text <> '') and
    (cmbCommission.Text <> '');
end;

procedure TPBMaintFinanceYearFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintFinanceYearFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFinanceYearFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFinanceYearFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    if YearStarted then
      begin
        with UpdBasicSQL do
          begin
            close;
            ParamByName('Financial_Year').AsInteger := iCode;
            ParamByName('Title').AsString := edtTitle.Text + '';

            case cmbBudgetType.itemindex of
              0: Parambyname('Performance_target_type').asString := 'R';
              1: Parambyname('Performance_target_type').asString := 'C';
            end;

            case cmbCommission.itemindex of
              0: Parambyname('Commission_Basis').asString := 'P';
              1: Parambyname('Commission_Basis').asString := 'C';
            end;

            ExecSQL;
          end;
      end
    else
    begin
      with UpdSQL do
      begin
        ParamByName('Financial_Year').AsInteger := iCode;
        ParamByName('Title').AsString := edtTitle.Text + '';
        ParamByName('Start_period_no').Asinteger := cmbMonth.itemindex+1;
        ParamByName('Start_period_year').Asinteger := StrToint(edtYear.text);
        ParamByName('No_of_periods').Asinteger := spnNoOfPeriods.value;

        case cmbBudgetType.itemindex of
          0: Parambyname('Performance_target_type').asString := 'R';
          1: Parambyname('Performance_target_type').asString := 'C';
        end;

        case cmbCommission.itemindex of
          0: Parambyname('Commission_Basis').asString := 'P';
          1: Parambyname('Commission_Basis').asString := 'C';
        end;

        ExecSQL;
      end;
    end;
    if not YearStarted and not BudgetsSet then
      DeletePeriods;
    UpdatePeriods;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
//  delete rep financials
      with DelRepCatsSQL do
      begin
        close;
        parambyname('Financial_Year').asinteger := iCode;
        execsql;
      end;
//  delete rep financials
      with DelRepFinanceSQL do
      begin
        close;
        parambyname('Financial_Year').asinteger := iCode;
        execsql;
      end;
// delete the Rep budgets
      with DelBudgetsSQL do
      begin
        Close;
        ParamByName('Financial_Year').AsInteger := iCode;
        ExecSQL;
      end;

// delete the periods associated with this year
      DeletePeriods;

// delete the financial year
      with DelSQL do
      begin
        Close;
        ParamByName('Financial_Year').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintFinanceYearFrm.DeletePeriods;
begin
//    Delete the periods associated with this year
  with DelPeriodsSQL do
  begin
    close;
    parambyname('Financial_Year').asinteger := icode;
    execsql;
  end;
end;

procedure TPBMaintFinanceYearFrm.UpdatePeriods;
var
  i: integer;
  iperiod: integer;
  okToAdd: boolean;
  NewYear, NewMonth, NewDay: Word;
  TempDate, PeriodEndDate, ThisEndDate, LastEndDate: TDateTime;
begin
  PeriodEndDate := pbDateStr('01/'+inttostr(cmbMonth.itemindex + 1)+'/'+edtYear.text);

//  For the number of periods add to the period table
  for i := 0 to pred(spnNoOfPeriods.value) do
    begin
//  Check whether the period exists
      okToAdd := false;
      with qryChkPeriod do
        begin
          close;
          TempDate := incMonth(PeriodEndDate,i);
          decodedate(TempDate,NewYear,NewMonth,NewDay);
          parambyname('Period_no').asinteger := NewMonth;
          parambyname('Period_year').asinteger := NewYear;
          open;
          if recordcount = 0 then
            okToAdd := true;
        end;
// add new period record
      if okToAdd then
        begin
          with qryGetLastPeriod do
            begin
              close;
              open;
              iperiod := fieldbyname('Last_Period').asinteger+1;
            end;
          with qryAddPeriod do
            begin
              ThisEndDate := setMonthEnd(TempDate);
              LastEndDate := setMonthEnd(incMonth(ThisEndDate,-1));
              close;
              parambyname('Period').asinteger := iPeriod;
              parambyname('Period_no').asinteger := NewMonth;
              parambyname('Period_year').asinteger := NewYear;
              parambyname('Period_End_Date').asdatetime := ThisEndDate;
              parambyname('Description').asstring := FormatDateTime('mmmm yyyy',ThisEndDate);
              parambyname('Last_Period_End_Date').asdatetime := LastEndDate;
              parambyname('Financial_Year').asinteger := iCode;
              execsql;
            end;
        end
      else
// update the period table with the financial year if it exists
        begin
          with qryUpPeriod do
            begin
              close;
              parambyname('Period_no').asinteger := NewMonth;
              parambyname('Period_year').asinteger := NewYear;
              parambyname('Financial_Year').asinteger := iCode;
              execsql;
            end;
        end;
    end;
end;

function TPBMaintFinanceYearFrm.setMonthEnd(TempDate: TDateTime): TDateTime;
var
  Newdate: Tdatetime;
  Year, Month, Day, NewYear, NewMonth, NewDay: Word;
  i: integer;
begin
  NewDate := TempDate;
  DecodeDate(NewDate, Year, Month, Day);
  for i := 1 to 31 do
    begin
      NewDate := NewDate + 1;
      DecodeDate(NewDate, NewYear, NewMonth, NewDay);
      if NewMonth <> Month then
        begin
          NewDate := NewDate - 1;
          break;
        end;
    end;
  result := NewDate
end;

procedure TPBMaintFinanceYearFrm.edtYearChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFinanceYearFrm.edtYearKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintFinanceYearFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Financial_Year ' +
            '(Financial_Year,Start_Period_Year,Start_period_no,No_of_periods,Year_Closed_off,Title) ' +
            'VALUES(''0'',0,0,0,''N'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintFinanceYearFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Financial_Year Where Financial_Year = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintFinanceYearFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Financial_Year').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
