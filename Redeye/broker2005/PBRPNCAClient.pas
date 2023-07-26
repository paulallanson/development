unit PBRPNCAClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls, CCSPrint, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPNCAClientfrm = class(TForm)
    quickreport: TQuickRep;
    QRBand1: TQRBand;
    qrgReps: TQRGroup;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    qryCustomers: TFDQuery;
    QRSubDetail1: TQRSubDetail;
    qryNCAType: TFDQuery;
    qryReport: TFDQuery;
    qrbGrpRepFooter: TQRBand;
    qrDbRepTotalBy: TQRDBText;
    qrlblMonth1: TQRLabel;
    QRLabel30: TQRLabel;
    qrlblRepCount1: TQRLabel;
    qrlblRepCount2: TQRLabel;
    qrlblMonth2: TQRLabel;
    qrlblMonth3: TQRLabel;
    qrlblMonth4: TQRLabel;
    qrlblMonth5: TQRLabel;
    qrlblMonth6: TQRLabel;
    qrlblMonth7: TQRLabel;
    qrlblMonth8: TQRLabel;
    qrlblMonth9: TQRLabel;
    qrlblMonth10: TQRLabel;
    qrlblMonth11: TQRLabel;
    qrlblMonth12: TQRLabel;
    qrlblRepCount3: TQRLabel;
    qrlblRepCount4: TQRLabel;
    qrlblRepCount5: TQRLabel;
    qrlblRepCount6: TQRLabel;
    qrlblRepCount7: TQRLabel;
    qrlblRepCount8: TQRLabel;
    qrlblRepCount9: TQRLabel;
    qrlblRepCount10: TQRLabel;
    qrlblRepCount11: TQRLabel;
    qrlblRepCount12: TQRLabel;
    qrlblRepCountTotal: TQRLabel;
    qryPeriods: TFDQuery;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    qrlblTotalCount1: TQRLabel;
    qrlblTotalCount2: TQRLabel;
    qrlblTotalCount3: TQRLabel;
    qrlblTotalCount4: TQRLabel;
    qrlblTotalCount5: TQRLabel;
    qrlblTotalCount6: TQRLabel;
    qrlblTotalCount7: TQRLabel;
    qrlblTotalCount8: TQRLabel;
    qrlblTotalCount9: TQRLabel;
    qrlblTotalCount10: TQRLabel;
    qrlblTotalCount11: TQRLabel;
    qrlblTotalCount12: TQRLabel;
    qrlblTotalCount: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrDbRepSortBy: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRChildBand1: TQRChildBand;
    qrlblReceived: TQRLabel;
    qrlblReceived1: TQRLabel;
    qrlblReceived2: TQRLabel;
    qrlblReceived3: TQRLabel;
    qrlblReceived4: TQRLabel;
    qrlblReceived5: TQRLabel;
    qrlblReceived6: TQRLabel;
    qrlblReceived7: TQRLabel;
    qrlblReceived8: TQRLabel;
    qrlblReceived9: TQRLabel;
    qrlblReceived10: TQRLabel;
    qrlblReceived11: TQRLabel;
    qrlblReceived12: TQRLabel;
    qrlblTotalReceived: TQRLabel;
    qrlblSignedOff: TQRLabel;
    qrlblSigned1: TQRLabel;
    qrlblSigned2: TQRLabel;
    qrlblSigned3: TQRLabel;
    qrlblSigned4: TQRLabel;
    qrlblSigned5: TQRLabel;
    qrlblSigned6: TQRLabel;
    qrlblSigned7: TQRLabel;
    qrlblSigned8: TQRLabel;
    qrlblSigned9: TQRLabel;
    qrlblSigned10: TQRLabel;
    qrlblSigned11: TQRLabel;
    qrlblSigned12: TQRLabel;
    qrlblTotalSigned: TQRLabel;
    qrlblOutstanding: TQRLabel;
    qrlblOut1: TQRLabel;
    qrlblOut2: TQRLabel;
    qrlblOut3: TQRLabel;
    qrlblOut4: TQRLabel;
    qrlblOut5: TQRLabel;
    qrlblOut6: TQRLabel;
    qrlblOut7: TQRLabel;
    qrlblOut8: TQRLabel;
    qrlblOut9: TQRLabel;
    qrlblOut10: TQRLabel;
    qrlblOut11: TQRLabel;
    qrlblOut12: TQRLabel;
    qrlblTotalOut: TQRLabel;
    qrlblCosts: TQRLabel;
    qrlblCost1: TQRLabel;
    qrlblCost2: TQRLabel;
    qrlblCost3: TQRLabel;
    qrlblCost4: TQRLabel;
    qrlblCost5: TQRLabel;
    qrlblCost6: TQRLabel;
    qrlblCost7: TQRLabel;
    qrlblCost8: TQRLabel;
    qrlblCost9: TQRLabel;
    qrlblCost10: TQRLabel;
    qrlblCost11: TQRLabel;
    qrlblCost12: TQRLabel;
    qrlblTotalCost: TQRLabel;
    qryCustomersOld: TFDQuery;
    procedure quickreportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGrpCatFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGrpCatFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrgRepsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    TotalCount: array [1..24] of integer;
    RepCount: array [1..24] of integer;
    RepCost: array [1..24] of real;
    SignedOff: array [1..24] of integer;
    PeriodHeaders: array [1..24] of string;
    Periods: array [1..24] of integer;
  public
    totbyType, TotbyCust: boolean;
    exporting: boolean;
    exportFile: textFile;
    PrinterSettings: TPrinterSettings;
    SelRepCode: integer;
    StartPeriod, FinishPeriod: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails(Sender: TObject): integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPNCAClientfrm: TPBRPNCAClientfrm;

implementation

{$R *.DFM}

uses PBRSNCAClient;

function TPBRPNCAClientfrm.GetDetails(Sender: TObject): integer;
begin
  if TotbyCust then
    begin
      with qryReport do
        begin
          close;
          sql.Clear;
          sql.Text := qryCustomers.SQL.Text;
          parambyname('Start_Date').asdatetime := DateFrom;
          parambyname('Finish_Date').asdatetime := DateTo;
          parambyname('Customer').asinteger := SelRepCode;
          open;
          result := recordcount;
        end;
    end
  else
    begin
      with qryReport do
        begin
          close;
          sql.Clear;
          sql.Text := qryNCAType.SQL.Text;
          parambyname('Start_Date').asdatetime := DateFrom;
          parambyname('Finish_Date').asdatetime := DateTo;
          parambyname('Non_Conform_Type').asinteger := SelRepCode;
          open;
          result := recordcount;
        end;
    end
end;

procedure TPBRPNCAClientfrm.quickreportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  i: integer;
begin
   with quickreport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;

// Build the list of periods for this year;
  with qryPeriods do
    begin
      close;
      parambyname('Start_Period').asinteger := StartPeriod;
      parambyname('Finish_Period').asinteger := FinishPeriod;
      open;
      first;
      while eof <> true do
        begin
          i := (fieldbyname('Period').asinteger - startPeriod) + 1;
          PeriodHeaders[i] := formatdatetime('mmm"-"yy',fieldbyname('Period_End_Date').asdatetime);
          Periods[i] := fieldbyname('Period_no').asinteger;
          next;
        end;
    end;

  for i := 1 to 24 do
    begin
      RepCount[i] := 0;
      TotalCount[i] := 0;
      SignedOff[i] := 0;
    end;

  if totbyCust then
    begin
      qrgReps.Expression := 'Customer_name';
      qrdbRepSortBy.DataField := 'Customer_name';
      qrdbRepTotalBy.DataField := 'Customer_name';
    end
  else
    begin
      qrgReps.Expression := 'Non_Conform_type_Descr';
      qrdbRepSortBy.DataField := 'Non_Conform_type_Descr';
      qrdbRepTotalBy.DataField := 'Non_Conform_type_Descr';
    end;
end;

procedure TPBRPNCAClientfrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: integer;
  iMonth: word;
begin
  iMonth := monthof(qryReport.fieldbyname('Date_point').asdatetime);
  for icount := 1 to 24 do
    begin
      if iMonth = Periods[icount] then
        begin
          RepCount[icount] := RepCount[icount] + 1;

          {total the Signed off records}
          if qryReport.fieldbyname('Non_Conform_Status').asinteger >= 50 then
            SignedOff[icount] := SignedOff[icount] + 1;

          {Total the costs}
          RepCost[icount] := RepCost[icount] + qryReport.fieldbyname('Total_Cost').asfloat;
        end;
    end;
  Printband := false;
end;

procedure TPBRPNCAClientfrm.qrbGrpCatFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i, iTotal: integer;
  templbl: TQRLabel;
begin
  iTotal := 0;
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblRepCount' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',RepCount[i]);
        iTotal := iTotal + RepCount[i];
        TotalCount[i] := TotalCount[i] + RepCount[i];
      except
      end;
    end;
  qrlblRepCountTotal.Caption := formatfloat('#,##0',iTotal);
end;

procedure TPBRPNCAClientfrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
begin
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblMonth' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := PeriodHeaders[i];
      except
      end;
    end;

end;

procedure TPBRPNCAClientfrm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i, iTotal: integer;
  templbl: TQRLabel;
begin
  iTotal := 0;
  for i := 1 to 12 do
    begin
      templbl := ((FindComponent('qrlblTotalCount' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalCount[i]);
        iTotal := iTotal + TotalCount[i];
      except
      end;
    end;
  qrlblTotalCount.caption := formatfloat('#,##0',iTotal);
end;

procedure TPBRPNCAClientfrm.ExportToFile(fileName: string);
var
  tempStr: string;
  i: integer;
  tmpLabel: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

// Build the list of periods for this year;
  with qryPeriods do
    begin
      close;
      parambyname('Start_Period').asinteger := StartPeriod;
      parambyname('Finish_Period').asinteger := FinishPeriod;
      open;
      first;
      while eof <> true do
        begin
          i := (fieldbyname('Period').asinteger - startPeriod) + 1;
          PeriodHeaders[i] := fieldbyname('Description').asstring;
          next;
        end;
    end;

  tempstr := '';
  if TotbyType then
    tmpLabel := 'Reason Type'
  else
    tmpLabel := 'Customer';

  tempStr := '"' + tmpLabel + '"';

  for i := 1 to 12 do
    begin
      tempStr := tempstr + ',"' + PeriodHeaders[i] + '"';
    end;

  tempstr := tempstr + ',"Grand Total"';
  writeLn(self.exportFile, tempStr);
  quickreport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPNCAClientfrm.qrbGrpCatFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  templbl: TQRLabel;
  i: integer;
begin
  if self.exporting then
  begin
    //Revenue Centre
    if TotbyCust then
      tempStr := '"' + qryReport.fieldbyname('Customer_Name').asstring + '"'
    else
      tempStr := '"' + qryReport.fieldbyname('Non_Conform_Type_Descr').asstring + '"';

    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblRepCount' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',RepCount[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

      end;

    tempStr := tempStr + ',"' + qrlblRepCountTotal.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSNCAClientfrm.prgbrExport.StepIt;
  end;
  for i := 1 to 24 do
    begin
      repcount[i] := 0;
    end;
end;

procedure TPBRPNCAClientfrm.FormCreate(Sender: TObject);
begin
  TotbyCust := false;
  Totbytype := false;
end;

procedure TPBRPNCAClientfrm.qrgRepsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := false;
end;

procedure TPBRPNCAClientfrm.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iTotal, i: integer;
  rTotal: real;
  templbl: TQRLabel;
begin
  {Total Received}
  iTotal := 0;
  for i := 1 to 12 do
    begin
      templbl := ((FindComponent('qrlblReceived' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalCount[i]);
        iTotal := iTotal + TotalCount[i];
      except
      end;
    end;
  qrlblTotalReceived.caption := formatfloat('#,##0',iTotal);

  {Total Signed}
  iTotal := 0;
  for i := 1 to 12 do
    begin
      templbl := ((FindComponent('qrlblSigned' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',SignedOff[i]);
        iTotal := iTotal + SignedOff[i];
      except
      end;
    end;
  qrlblTotalSigned.caption := formatfloat('#,##0',iTotal);

  {Total Outstanding}
  iTotal := 0;
  for i := 1 to 12 do
    begin
      templbl := ((FindComponent('qrlblOut' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',(TotalCount[i]-SignedOff[i]));
        iTotal := iTotal + (TotalCount[i]-SignedOff[i]);
      except
      end;
    end;
  qrlblTotalOut.caption := formatfloat('#,##0',iTotal);

  {Total Costs}
  rTotal := 0;
  for i := 1 to 12 do
    begin
      templbl := ((FindComponent('qrlblCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('£#,###,##0',RepCost[i]);
        rTotal := rTotal + RepCost[i];
      except
      end;
    end;
  qrlblTotalCost.caption := formatfloat('£#,###,##0',rTotal);

end;

procedure TPBRPNCAClientfrm.QRChildBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
  i, icount: integer;
  templbl: TQRLabel;
begin
  if self.exporting then
  begin
    tempStr := '"' + '' + '"';
    writeln(self.exportFile, tempStr);

    {export total recievd}
    tempStr := '"' + qrlblReceived.caption + '"';
    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblReceived' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',TotalCount[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

      end;

    tempStr := tempStr + ',"' + qrlblTotalReceived.caption + '"';

    writeln(self.exportFile, tempStr);

    {export total signed off}
    tempStr := '"' + qrlblSignedOff.caption + '"';
    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblSigned' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',SignedOff[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

      end;

    tempStr := tempStr + ',"' + qrlblTotalSigned.caption + '"';

    writeln(self.exportFile, tempStr);

    {export total outstanding}
    tempStr := '"' + qrlblOutstanding.caption + '"';
    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblOut' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',(totalCount[i]-SignedOff[i]));
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

      end;

    tempStr := tempStr + ',"' + qrlblTotalOut.caption + '"';

    writeln(self.exportFile, tempStr);

    {export total Costs}
    tempStr := '"' + qrlblCosts.caption + '"';
    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblCost' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',RepCost[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

      end;

    tempStr := tempStr + ',"' + qrlblTotalCost.caption + '"';

    writeln(self.exportFile, tempStr);

    PBRSNCAClientfrm.prgbrExport.StepIt;
  end;
end;

end.
