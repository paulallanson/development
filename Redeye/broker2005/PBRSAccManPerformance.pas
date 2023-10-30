unit PBRSAccManPerformance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSAccManPerformanceFrm = class(TForm)
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    dbgDetails: TDBGrid;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    btnClose: TButton;
    rgAccMan: TRadioGroup;
    pnlAccMan: TPanel;
    lblCustBran: TLabel;
    edtAccMan: TEdit;
    btnAccMan: TButton;
    qryDummy: TFDQuery;
    qryFY: TFDQuery;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgAccManClick(Sender: TObject);
    procedure btnAccManClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    iCurrentYear: integer;
    iCurrentStart, iCurrentEnd: integer;
    iStart0, iEnd0: integer;
    iStart1, iEnd1: integer;
    iStart2, iEnd2: integer;
    iStart3, iEnd3: integer;
    iStart4, iEnd4: integer;
    sYearTitle0, sYearTitle1, sYearTitle2, sYearTitle3, sYearTitle4: string; 
    selAccMan: integer;
    selAccManName: string;
    function BuildQueryString(rep: Boolean): string;
    procedure FixQuery(rep: Boolean);
    procedure ShowColumns;
    procedure ShowYearTitles;
  public
    { Public declarations }
  end;

var
  PBRSAccManPerformanceFrm: TPBRSAccManPerformanceFrm;

implementation

uses pbMainMenu, CCSCommon, PBLUOps, pbDatabase;

{$R *.dfm}

procedure TPBRSAccManPerformanceFrm.FormActivate(Sender: TObject);
begin
  FixQuery(false);
end;

procedure TPBRSAccManPerformanceFrm.FormCreate(Sender: TObject);
var
  iCount: integer;
  iCurrentYear, iYear0, iYear1, iYear2, iYear3, iYear4: integer;
begin
  iCurrentYear := dmBroker.GetCurrentYear;
  iYear0 := 0;
  iYear1 := 0;
  iYear2 := 0;
  iYear3 := 0;
  iYear4 := 0;

  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  with qryFY do
    begin
      close;
      parambyname('Current_Year').asinteger := iCurrentYear;
      open;

      first;
      iCount := 0;

      while eof <> true do
        begin
          case icount of
            0:  begin
                  iYear0 := fieldbyname('Financial_Year').asinteger;
                  iStart0 := dmBroker.GetCurrentYearStartPeriod(iYear0);
                  iEnd0 := iStart0 + (fieldbyname('No_of_periods').asinteger - 1);
                  sYearTitle0 := fieldbyname('Title').asstring + ' GP';
                end;
            1:  begin
                  iYear1 := fieldbyname('Financial_Year').asinteger;
                  iStart1 := dmBroker.GetCurrentYearStartPeriod(iYear1);
                  iEnd1 := iStart1 + (fieldbyname('No_of_periods').asinteger - 1);
                  sYearTitle1 := fieldbyname('Title').asstring+ ' GP';
                end;
            2:  begin
                  iYear2 := fieldbyname('Financial_Year').asinteger;
                  iStart2 := dmBroker.GetCurrentYearStartPeriod(iYear2);
                  iEnd2 := iStart2 + (fieldbyname('No_of_periods').asinteger - 1);
                  sYearTitle2 := fieldbyname('Title').asstring+ ' GP';
                end;
            3:  begin
                  iYear3 := fieldbyname('Financial_Year').asinteger;
                  iStart3 := dmBroker.GetCurrentYearStartPeriod(iYear3);
                  iEnd3 := iStart3 + (fieldbyname('No_of_periods').asinteger - 1);
                  sYearTitle3 := fieldbyname('Title').asstring+ ' GP';
                end;
            4:  begin
                  iYear4 := fieldbyname('Financial_Year').asinteger;
                  iStart4 := dmBroker.GetCurrentYearStartPeriod(iYear4);
                  iEnd4 := iStart4 + (fieldbyname('No_of_periods').asinteger - 1);
                  sYearTitle4 := fieldbyname('Title').asstring+ ' GP';
                end;
          end;
          iCount := icount + 1;
          next;
        end;
    end;

  CCSCommon.SetDBGridCols('', 'Account Manager Performance Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);

  {Decide which columns to show}
  ShowColumns;
  {Format the Year column titles}
  ShowYearTitles
end;

procedure TPBRSAccManPerformanceFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveDBGridCols('', 'Account Manager Performance Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSAccManPerformanceFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSAccManPerformanceFrm.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clWhite;
      (Sender as TDBGrid).Canvas.Font.Color := clBlack;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if dbgDetails.datasource.dataset.fieldByName('Importance_Color').asinteger <> 0 then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Importance_Color').asinteger;
      (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Importance_Font_Color').asinteger;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if  (pos('Year',Column.Title.Caption) <> 0) or
      (pos('GP',Column.Title.Caption) <> 0) then
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TPBRSAccManPerformanceFrm.rgAccManClick(Sender: TObject);
begin
  pnlAccMan.visible := rgAccMan.itemIndex = 1;
  if pnlAccMan.visible = False then
  begin
    selAccMan := 0;
    edtAccMan.text := '';
  end;

  fixQuery(False);
end;

procedure TPBRSAccManPerformanceFrm.btnAccManClick(Sender: TObject);
begin
  PBLUOpsFRm := TPBLUOpsFRm.Create(Self);
  try
    PBLUOpsFRm.bIs_Lookup := True;
    PBLUOpsFRm.bAllow_Upd := False;
    PBLUOpsFRm.SelCode := SelAccMan;
    PBLUOpsFRm.ShowModal;
    if PBLUOpsFRm.Selected then
    begin
      SelAccMan := PBLUOpsFRm.SelCode;
      SelAccManName := PBLUOpsFRm.SelName;
    end;
    edtAccMan.Text := SelAccManName;
    FixQuery(False);
  finally
    PBLUOpsFRm.Free;
  end;
end;

procedure TPBRSAccManPerformanceFrm.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(rep);
    qryReport.parambyname('Period0_Start').asinteger := iStart0;
    qryReport.parambyname('Period0_End').asinteger := iEnd0;
    qryReport.parambyname('Period1_Start').asinteger := iStart1;
    qryReport.parambyname('Period1_End').asinteger := iEnd1;
    qryReport.parambyname('Period2_Start').asinteger := iStart2;
    qryReport.parambyname('Period2_End').asinteger := iEnd2;
    qryReport.parambyname('Period3_Start').asinteger := iStart3;
    qryReport.parambyname('Period3_End').asinteger := iEnd3;
    qryReport.parambyname('Period4_Start').asinteger := iStart4;
    qryReport.parambyname('Period4_End').asinteger := iEnd4;
    qryReport.Open;
  finally
    btnExcel.Enabled := qryReport.RecordCount > 0;
    qryReport.EnableControls;
  end;
end;

function TPBRSAccManPerformanceFrm.BuildQueryString(rep: Boolean): string;
var
  sTemp : string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }


begin
{rebuilds the query string depending on the sort selections}
  sTemp := qryDummy.SQL.text;
  sTemp := sTemp + ' WHERE ((Customer.Acc_active = ''Y'') AND (Customer.Customer_status = 100)) ';
//  sTemp := sTemp + ' WHERE 1=1 ';

  if (edtAccMan.Text <> '') then
  begin
    sTemp := sTemp + ' AND Customer_Operator.Operator = ' + IntToStr(SelAccMan) + ' ';
  end;

  Result := sTemp + 'ORDER BY  Operator.Name, Level_Of_Importance.Level_Of_Importance, Customer.Name';
end;

procedure TPBRSAccManPerformanceFrm.ShowYearTitles;
var
  icount: integer;
begin
  for icount := 0 to pred(dbgDetails.columns.count) do
    begin
      if pos('Year1', dbgDetails.columns[icount].FieldName) <> 0 then
        dbgDetails.columns[icount].Title.Caption := sYearTitle1
      else
      if pos('Year2', dbgDetails.columns[icount].FieldName) <> 0 then
        dbgDetails.columns[icount].Title.Caption := sYearTitle2
      else
      if pos('Year3', dbgDetails.columns[icount].FieldName) <> 0  then
        dbgDetails.columns[icount].Title.Caption := sYearTitle3
      else
      if pos('Year4', dbgDetails.columns[icount].FieldName) <> 0 then
        dbgDetails.columns[icount].Title.Caption := sYearTitle4;
    end;
end;

procedure TPBRSAccManPerformanceFrm.ShowColumns;
var
  icount: integer;
  sAnalysis1, sAnalysis2, sAnalysis3, sAnalysis4: string;
begin
  {Get Analysis Codes}
  sAnalysis1 := dmBroker.GetAnalysisCode1;
  sAnalysis2 := dmBroker.GetAnalysisCode2;
  sAnalysis3 := dmBroker.GetAnalysisCode3;
  sAnalysis4 := dmBroker.GetAnalysisCode4;

  for icount := 0 to pred(dbgDetails.columns.count) do
    begin
      //dbgDetails.Columns[icount].Visible := true;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 1') then
        begin
          if (sAnalysis1 <> '') then
            dbgDetails.columns[icount].Title.Caption := sAnalysis1
          else
            dbgDetails.columns[icount].Visible := false;
        end;
              
      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 2') then
        begin
          if (sAnalysis2 <> '') then
            dbgDetails.columns[icount].Title.Caption := sAnalysis2
          else
            dbgDetails.columns[icount].Visible := false;
        end;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 3') then
        begin
          if (sAnalysis3 <> '') then
            dbgDetails.columns[icount].Title.Caption := sAnalysis3
          else
            dbgDetails.columns[icount].Visible := false;
        end;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 4') then
        begin
          if (sAnalysis4 <> '') then
            dbgDetails.columns[icount].Title.Caption := sAnalysis4
          else
            dbgDetails.columns[icount].Visible := false;
        end;
    end;
end;

procedure TPBRSAccManPerformanceFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(PBRSAccManPerformanceFrm);
end;

end.
