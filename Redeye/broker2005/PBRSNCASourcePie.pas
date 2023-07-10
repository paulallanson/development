unit PBRSNCASourcePie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, DbChart, Buttons, CCSPrint;

type
  TPBRSNCASourcePieFrm = class(TForm)
    qryGraph1: TQuery;
    dbchart1: TDBChart;
    Series1: TPieSeries;
    DBChart2: TDBChart;
    PieSeries1: TPieSeries;
    DBChart4: TDBChart;
    PieSeries3: TPieSeries;
    Panel2: TPanel;
    DBChart3: TDBChart;
    Series2: TPieSeries;
    qryGraph2: TQuery;
    qryGraph3: TQuery;
    qryGraph4: TQuery;
    Panel1: TPanel;
    btnPrint: TBitBtn;
    btnClose: TButton;
    procedure btnPrintClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PrepareGraph1(DateFrom, DateTo: TDateTime; sTitle: string);
    procedure PrepareGraph2(DateFrom, DateTo: TDateTime; sTitle: string);
    procedure PrepareGraph3(DateFrom, DateTo: TDateTime; sTitle: string);
    procedure PrepareGraph4(DateFrom, DateTo: TDateTime; sTitle: string);
  end;

var
  PBRSNCASourcePieFrm: TPBRSNCASourcePieFrm;

implementation

Uses Printers; 

{$R *.dfm}

procedure TPBRSNCASourcePieFrm.PrepareGraph1(DateFrom, DateTo: TDateTime; sTitle: string);
begin
  with qryGraph1 do
    begin
      close;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;
    end;
  dbChart1.Title.Text.add(sTitle);
end;

procedure TPBRSNCASourcePieFrm.PrepareGraph2(DateFrom, DateTo: TDateTime; sTitle: string);
begin
  with qryGraph2 do
    begin
      close;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;
    end;
  dbChart2.Title.Text.add(sTitle);
end;

procedure TPBRSNCASourcePieFrm.PrepareGraph3(DateFrom, DateTo: TDateTime; sTitle: string);
begin
  with qryGraph3 do
    begin
      close;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;
    end;
  dbChart3.Title.Text.add(sTitle);
end;

procedure TPBRSNCASourcePieFrm.PrepareGraph4(DateFrom, DateTo: TDateTime; sTitle: string);
begin
  with qryGraph4 do
    begin
      close;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;
    end;
  dbChart4.Title.Text.add(sTitle);
end;

procedure TPBRSNCASourcePieFrm.btnPrintClick(Sender: TObject);
Var tmpH,tmpW,tmpWMargin,tmpHMargin:Longint; { margins }
    OldOrientation:TPrinterOrientation;
    PrinterSettings: TPrinterSettings;
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
      Printer.Title:='Non Conformance Source Allocation';

      dbchart1.PrintResolution:= 0;
      dbChart2.PrintResolution:= 0;
      dbChart3.PrintResolution:= 0;
      dbChart4.PrintResolution:= 0;
(*      Case RadioGroup1.ItemIndex of
        0: Begin { screen proportional }
             dbchart1.PrintResolution:= 0;
             Chart2.PrintResolution:= 0;
             Chart3.PrintResolution:= 0;
             Chart4.PrintResolution:= 0;
           End;
        1: Begin { thin lines and small fonts }
             dbchart1.PrintResolution:= -100;
             Chart2.PrintResolution:= -100;
             Chart3.PrintResolution:= -100;
             Chart4.PrintResolution:= -100;
           End;
      end;
*)

      { Print the four charts, each one at a different paper position }

      { CALCULATE HORIZONTAL MARGIN }
      tmpW:=Printer.PageWidth;
      tmpWMargin:=Round(2.0*tmpW/100.0); { <-- 5% margins }
      tmpW:=tmpW-2*tmpWMargin;  { <-- left and right margins }
      tmpW:=tmpW div 2; { half height for left and right charts }

      { CALCULATE VERTICAL MARGIN }
      tmpH:=Printer.PageHeight;
      tmpHMargin:=Round(2.0*tmpH/100.0);  { <-- 5% margins }
      tmpH:=tmpH-2*tmpHMargin;  { <-- bottom and top margins }
      tmpH:=tmpH div 2; { half height for top and bottom charts }

      { left / top chart }
      dbchart1.PrintPartial( Rect( tmpWMargin,tmpHMargin,
                                 tmpWMargin+tmpW,tmpHMargin+tmpH ) );

      { right / top chart }
      dbChart2.PrintPartial( Rect( tmpWMargin+tmpW,tmpHMargin,
                                 tmpWMargin+2*tmpW,tmpHMargin+tmpH ) );

      { left / bottom chart }
      dbChart3.PrintPartial( Rect( tmpWMargin,tmpHMargin+tmpH,
                                 tmpWMargin+tmpW,tmpHMargin+2*tmpH ) );

      { right / bottom chart }
      dbChart4.PrintPartial( Rect( tmpWMargin+tmpW,tmpHMargin+tmpH,
                                 tmpWMargin+2*tmpW,tmpHMargin+2*tmpH ) );

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
    printersettings.free;
  end;

end;

procedure TPBRSNCASourcePieFrm.FormResize(Sender: TObject);
var
  w,h:Longint;
begin
(*  { Top and bottom Panel positioning }
  w:=ClientWidth-4-Panel1.Width;
  Panel2.Width:=w-4;
  Panel1.Height:=ClientHeight-Panel2.Height-4;
  h:=Panel1.Height;
  { Top Left Chart }
  dbChart1.SetBounds(Panel1.Width,Panel2.Height,w div 2,h div 2);
  { Bottom Left Chart }
  dbChart2.SetBounds(Panel1.Width,Panel2.Height+dbChart1.Height,w div 2,h div 2);
  { Top Right Chart }
  dbChart3.SetBounds(Panel1.Width+dbChart1.Width+1,dbChart1.Top,w div 2,h div 2);
  { Bottom Right Chart }
  dbChart4.SetBounds(dbChart3.Left,dbChart2.Top,w div 2,h div 2);
*)
 { Top and bottom Panel positioning }
  w:=ClientWidth-4;
  Panel2.Width:=w-4;
  h:=ClientHeight-Panel2.Height-4;
  { Top Left Chart }
//  dbChart1.SetBounds(1,Panel2.Height,w div 2,h div 2);
  dbChart1.SetBounds(1,1,w div 2,h div 2);
  { Top Right Chart }
  dbChart2.SetBounds(1+dbChart1.Width+1,dbChart1.Top,w div 2,h div 2);
  { Bottom Left Chart }
//  dbChart3.SetBounds(1,Panel2.Height+dbChart1.Height,w div 2,h div 2);
  dbChart3.SetBounds(1,1+dbChart1.Height,w div 2,h div 2);
  { Bottom Right Chart }
  dbChart4.SetBounds(dbChart2.Left,dbChart3.Top,w div 2,h div 2);
end;

procedure TPBRSNCASourcePieFrm.FormShow(Sender: TObject);
begin
  formresize(self);
end;

procedure TPBRSNCASourcePieFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.
