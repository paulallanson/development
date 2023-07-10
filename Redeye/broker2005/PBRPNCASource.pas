unit PBRPNCASource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, TeEngine, Series, TeeProcs, Chart, DbChart,
  ExtCtrls, QuickRpt, QRCtrls, CCSPrint;

type
  TPBRPNCASourceFrm = class(TForm)
    qrReport: TQuickRep;
    qryNCASource: TQuery;
    dtsNCASource: TDataSource;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlblCount: TQRLabel;
    DBChart1: TDBChart;
    Series1: TPieSeries;
  private
  public
    PrinterSettings: TPrinterSettings;
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime): integer;
  end;

var
  PBRPNCASourceFrm: TPBRPNCASourceFrm;

implementation

uses pbDatabase;

{$R *.dfm}

function TPBRPNCASourceFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime): integer;
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
  qryNCASource.Active := false;

//  qryNCASource.SQL.clear;
//  qryNCASource.SQL.text := qryDummy.SQL.text;

(*  if tmpdateFrom <> 0 then
  begin
    self.qryNCASource.SQL.add('  AND Job_Bag_Non_Conform.date_point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryNCASource.SQL.Add('  AND Job_Bag_Non_Conform.date_point <= '+ qDate(tmpDateTo));
  end;

  if ShowOnlyOut then
    begin
      self.qryNCASource.SQL.Add(' AND (Job_Bag_Non_Conform.Inactive = ''N'') OR (Job_Bag_Non_Conform.Inactive = '''')');
      self.qryNCASource.SQL.Add(' AND (Job_Bag_Non_Conform.Non_Conform.Status < 100) ');
    end;

  if (tmpdateFrom = 0) and (tmpdateTo = 0) then
  begin
    qrlblDateRange.caption := 'Unlimited Date Range';
  end
  else if (tmpdateFrom = 0) then
  begin
    qrlblDateRange.caption := 'Dated upto: ' + dateToStr(tmpdateTo);
  end
  else if (tmpdateTo = 0) then
  begin
    qrlblDateRange.caption := 'Dated from: ' + dateToStr(tmpdateFrom);
  end
  else
  begin
    qrlblDateRange.caption := 'Dated from: ' + dateToStr(tmpdateFrom) +
      ' up to: ' + dateToStr(tmpdateTo);
  end;

  if (Dept <> 0) then
  begin
    self.qryNCASource.SQL.Add('  and (Job_Bag_Non_Conform.Non_Conform_Dept = ' + IntToStr(Dept) + ')');
  end;

  if reason <> 0 then
  begin
    self.qryNCASource.SQL.Add('  and (Job_Bag_Non_Conform.Non_Conform_Type = ' + IntToStr(reason) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryNCASource.SQL.Add(' ORDER BY Non_Conform_Type.Non_Conform_Type_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryNCASource.Non_Conform_Type_Descr';
      QRDBText6.DataField := 'Non_Conform_Type_Descr';
      QRbDataFooter.DataField := 'Non_Conform_Type_Descr';
      qrlblGroupHeader.Caption := 'Reason:';
    end
  else
  if totalby = 1 then
    begin
      self.qryNCASource.SQL.Add(' ORDER BY Non_Conform_Dept.Non_Conform_Dept_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryNCASource.Non_Conform_Dept_Descr';
      QRDBText6.DataField := 'Non_Conform_Dept_Descr';
      QRbDataFooter.DataField := 'Non_Conform_Dept_Descr';
      qrlblGroupHeader.caption:= 'Source Dept:';
    end
  else
  if totalby = 2 then
    begin
      self.qryNCASource.SQL.Add(' ORDER BY Raised_by_Dept.Non_Conform_Dept_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryNCASource.Raised_by_dept_Descr';
      QRDBText6.DataField := 'Raised_by_dept_Descr';
      QRbDataFooter.DataField := 'Raised_by_dept_Descr';
      qrlblGroupHeader.caption:= 'Raising Dept:';
    end
  else
  if totalby = 3 then
    begin
      self.qryNCASource.SQL.Add(' ORDER BY AM.Name, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryNCASource.Account_Manager';
      QRDBText6.DataField := 'Account_Manager';
      QRbDataFooter.DataField := 'Account_Manager';
      qrlblGroupHeader.caption:= 'Acc Manager:';
    end
  else
  if totalby = 4 then
    begin
      self.qryNCASource.SQL.Add(' ORDER BY Rep.Name, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryNCASource.Rep_Name';
      QRDBText6.DataField := 'Rep_Name';
      QRbDataFooter.DataField := 'Rep_Name';
      qrlblGroupHeader.caption:= 'Rep:';
    end
  else
  if totalby = 5 then
    begin
      self.qryNCASource.SQL.Add(' ORDER BY Customer.Name, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryNCASource.Customer_Name';
      QRDBText6.DataField := 'Customer_Name';
      QRbDataFooter.DataField := 'Customer_Name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryNCASource.SQL.Add(' ORDER BY Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QRbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 6);
  qrbndgrpftr.enabled := (totalby < 6);

*)
  self.qryNCASource.Active := true;
  qrlblCount.caption := inttostr(self.qryNCASource.RecordCount);
  Result := (self.qryNCASource.RecordCount);
end;

end.
