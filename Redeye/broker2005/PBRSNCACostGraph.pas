unit PBRSNCACostGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs,
  VclTee.Chart, VclTee.DbChart, StdCtrls, CheckLst, ExtCtrls, ComCtrls,
  DBCtrls, Buttons, CCSPrint, VclTee.TeeGDIPlus;

type
  TPBRSNCACostGraphFrm = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    dbChart1: TDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    dbChart2: TDBChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    qryYear1Chart1: TQuery;
    qryYear2Chart1: TQuery;
    qryYear3Chart1: TQuery;
    qryYear1Chart2: TQuery;
    qryYears: TQuery;
    dtsYears: TDataSource;
    Button1: TButton;
    lstbxYears: TListBox;
    qryYear2Chart2: TQuery;
    qryYear3Chart2: TQuery;
    qryGetYearPeriods: TQuery;
    btnPrint: TBitBtn;
    btnClose: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    procedure DisplayGraph(iSeries: integer; sYear: string);
    procedure CloseQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBRSNCACostGraphFrm: TPBRSNCACostGraphFrm;

implementation

uses CCSCommon, Printers;

{$R *.dfm}

procedure TPBRSNCACostGraphFrm.FormActivate(Sender: TObject);
begin
  with qryYears do
    begin
      close;
      open;

      lstbxYears.Clear;
      
      while eof <> true do
        begin
          lstbxYears.Items.Add(fieldbyname('Period_Year').asstring);
          next;
        end;
    end;

end;

procedure TPBRSNCACostGraphFrm.Button1Click(Sender: TObject);
var
  icount, iselected: integer;
begin
  CloseQueries;
  iSelected := 0;
  for icount := 0 to pred(lstbxYears.items.count) do
    begin
      if lstbxYears.selected[icount] then
        begin
          iselected := iselected + 1;
          DisplayGraph(iselected,lstbxYears.items[icount]);
          if iSelected = 3 then
            break;
        end;
    end;
end;

procedure TPBRSNCACostGraphFrm.CloseQueries;
var
  i: integer;
begin
 qryYear1Chart1.Active := false;
 qryYear1Chart2.Active := false;
 qryYear2Chart1.Active := false;
 qryYear2Chart2.Active := false;
 qryYear3Chart1.Active := false;
 qryYear3Chart2.Active := false;

 for i := 0 to pred(dbChart1.serieslist.count) do
  dbChart1.Series[i].Title := '';

 for i := 0 to pred(dbChart2.serieslist.count) do
  dbChart2.Series[i].Title := '';
end;

procedure TPBRSNCACostGraphFrm.DisplayGraph(iSeries: integer; sYear: string);
var
  iFirst, iLast: integer;
  sStartDate, sEndDate: string;
begin
  sStartDate := '01/01/'+sYear;
  sEndDate := '31/12/'+sYear;

  with qryGetYearPeriods do
    begin
      close;
      parambyname('Period_Year').asinteger := strtoint(sYear);
      open;
      iFirst := fieldbyname('first_period').asinteger;
      iLast := fieldbyname('Last_Period').asinteger;
    end;

  case iSeries of
    1:
      begin
        with qryYear1Chart1 do
          begin
            close;
            parambyname('First_Period').asinteger := ifirst;
            parambyname('Last_Period').asinteger := iLast;
            parambyname('First_Date').asdatetime := pbdatestr(sStartDate);
            parambyname('Last_Date').asdatetime := pbdatestr(sEndDate);
            open;
          end;

        with qryYear1Chart2 do
          begin
            close;
            parambyname('First_Period').asinteger := ifirst;
            parambyname('Last_Period').asinteger := iLast;
            parambyname('First_Date').asdatetime := pbdatestr(sStartDate);
            parambyname('Last_Date').asdatetime := pbdatestr(sEndDate);
            open;
          end;
        dbChart1.Series[0].Title := syear;
        dbChart2.Series[0].Title := syear;
      end;
    2:
      begin
        with qryYear2Chart1 do
          begin
            close;
            parambyname('First_Period').asinteger := ifirst;
            parambyname('Last_Period').asinteger := iLast;
            parambyname('First_Date').asdatetime := pbdatestr(sStartDate);
            parambyname('Last_Date').asdatetime := pbdatestr(sEndDate);
            open;
          end;

        with qryYear2Chart2 do
          begin
            close;
            parambyname('First_Period').asinteger := ifirst;
            parambyname('Last_Period').asinteger := iLast;
            parambyname('First_Date').asdatetime := pbdatestr(sStartDate);
            parambyname('Last_Date').asdatetime := pbdatestr(sEndDate);
            open;
          end;
        dbChart1.Series[1].Title := syear;
        dbChart2.Series[1].Title := syear;
      end;
  else
    begin
        with qryYear3Chart1 do
          begin
            close;
            parambyname('First_Period').asinteger := ifirst;
            parambyname('Last_Period').asinteger := iLast;
            parambyname('First_Date').asdatetime := pbdatestr(sStartDate);
            parambyname('Last_Date').asdatetime := pbdatestr(sEndDate);
            open;
          end;

        with qryYear3Chart2 do
          begin
            close;
            parambyname('First_Period').asinteger := ifirst;
            parambyname('Last_Period').asinteger := iLast;
            parambyname('First_Date').asdatetime := pbdatestr(sStartDate);
            parambyname('Last_Date').asdatetime := pbdatestr(sEndDate);
            open;
          end;
        dbChart1.Series[2].Title := syear;
        dbChart2.Series[2].Title := syear;
    end;
  end;
end;


procedure TPBRSNCACostGraphFrm.btnPrintClick(Sender: TObject);
Var tmpTop, tmpBot, tmpH,tmpW,tmpWMargin,tmpHMargin:Longint; { margins }
    OldOrientation:TPrinterOrientation;
    PrinterSettings : TPrinterSettings;
begin
  PrinterSettings := TPrinterSettings.Create;

  try

  if SetUpPrinter(PrinterSettings) then
  begin
  Screen.Cursor  := crHourGlass;
  OldOrientation := Printer.Orientation;  { <-- save paper orientation }
  Printer.Orientation:=poLandscape; { <-- Force Horizontal paper }
  try
    Printer.BeginDoc;       { <-- start printer job }
    try
      Printer.Title:='Cost of Non Conformance and Customer Complaints';

      dbchart1.PrintResolution:= 0;
      dbChart2.PrintResolution:= 0;
      { Print the two charts, each one at a different paper position }

      { CALCULATE HORIZONTAL MARGIN }
      tmpW:=Printer.PageWidth;
      tmpWMargin:=Round(5.0*tmpW/100.0); { <-- 5% margins }
      tmpW:=tmpW-2*tmpWMargin;  { <-- left and right margins }
//      tmpW:=tmpW div 2; { half height for left and right charts }

      { CALCULATE VERTICAL MARGIN }
      tmpH:=Printer.PageHeight;
      tmpHMargin:=Round(5.0*tmpH/100.0);  { <-- 5% margins }
      tmpH:=tmpH-2*tmpHMargin;  { <-- bottom and top margins }
      tmptop:=(tmpH div 3)*2; { two thirds height for top charts }
      tmpbot:=(tmpH div 3); { one third height for bottom charts }

      { left / top chart }
      dbchart1.PrintPartial( Rect( tmpWMargin,tmpHMargin,
                                 tmpWMargin+tmpW,tmpHMargin+tmpTop ) );

(*      { right / top chart }
      dbChart2.PrintPartial( Rect( tmpWMargin+tmpW,tmpHMargin,
                                 tmpWMargin+2*tmpW,tmpHMargin+tmpH ) );

*)      { left / bottom chart }
      dbChart2.PrintPartial( Rect( tmpWMargin,tmpHMargin+tmpH,
                                 tmpWMargin+tmpW,tmpHMargin+2*tmpBot ) );

(*      { right / bottom chart }
      dbChart4.PrintPartial( Rect( tmpWMargin+tmpW,tmpHMargin+tmpH,
                                 tmpWMargin+2*tmpW,tmpHMargin+2*tmpH ) );
*)

      Printer.EndDoc; { <-- end job and print !! }
    except
      on Exception do  { just in case an error happens... }
      Begin
        Printer.Abort;
        Printer.EndDoc;
        Raise;
      end;
    end;
  finally
    Printer.Orientation:=OldOrientation;  { <-- restore paper orientation }
    Screen.Cursor:=crDefault; { <-- restore cursor }
  end;
  end;
  finally
  PrinterSettings.Free;
  end;
end;

procedure TPBRSNCACostGraphFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.
