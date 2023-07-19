unit WTRPRemedialType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPRemedialType = class(TForm)
    qryReport: TFDQuery;
    qrReport: TQuickRep;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRShape4: TQRShape;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qryDummy: TFDQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    qrlblJobBag: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    qrlblRepTotalClient: TQRLabel;
    qrlblGrandTotalClient: TQRLabel;
    qrlblCategories: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    qrlblNotes: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    qrbChildDetails: TQRChildBand;
    qrlblOfficeNotes: TQRLabel;
    QRLabel15: TQRLabel;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbReasonsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    iInvoice: integer;
    function ShowNotes(TempNotes: integer): string;
  public
    Totalby: integer;
    ShowCompleted: integer;
    bSummary: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; Dept, reason, category: integer): integer;
  end;

var
  frmWTRPRemedialType: TfrmWTRPRemedialType;

implementation

uses wtDataModule, wtNotesDM, AllCommon;

{$R *.DFM}

var
  repCost: double;
  repTotalCost, repTotalClient: double;
  grandTotalCost, grandTotalClient: double;

function TfrmWTRPRemedialType.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; Dept, reason, category: integer): integer;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  self.qryReport.Active := false;

  qryReport.SQL.clear;
  qryReport.SQL.text := qryDummy.SQL.text;
  if tmpdateFrom <> 0 then
  begin
    self.qryReport.SQL.add('  AND Job_Remedial.date_raised >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Job_Remedial.date_raised <= '+ qDate(tmpDateTo));
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
    self.qryReport.SQL.Add('  and (Job_Remedial.Remedial_Dept = ' + IntToStr(Dept) + ')');
  end;

  if reason <> 0 then
  begin
      self.qryReport.SQL.Add('  and (Job_Remedial.Remedial_Type = ' + IntToStr(reason) + ')');
  end;

  if category <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Job_Remedial.Remedial_Category = ' + IntToStr(category) + ')');
  end;

  case ShowCompleted of
    1: self.qryReport.SQL.Add('  and (Job_Remedial.Completed = ''Y'')');
    2: self.qryReport.SQL.Add('  and (Job_Remedial.Completed = ''N'')');
  end;


  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Remedial_Category.Remedial_Category_Descr, Job_Remedial.Date_Raised');
      qrbndgrphdr.expression := 'qryReport.Remedial_Category_Descr';
      QRDBText6.DataField := 'Remedial_Category_Descr';
      QRbDataFooter.DataField := 'Remedial_Category_Descr';
      qrlblGroupHeader.Caption := 'Reported By:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Remedial_Type.Remedial_Type_Descr, Job_Remedial.Date_Raised');
      qrbndgrphdr.expression := 'qryReport.Remedial_Type_Descr';
      QRDBText6.DataField := 'Remedial_Type_Descr';
      QRbDataFooter.DataField := 'Remedial_Type_Descr';
      qrlblGroupHeader.Caption := 'Reason Type:';
    end
  else
  if totalby = 2 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Remedial_Dept.Remedial_Dept_Descr, Job_Remedial.Date_Raised');
      qrbndgrphdr.expression := 'qryReport.Remedial_Dept_Descr';
      QRDBText6.DataField := 'Remedial_Dept_Descr';
      QRbDataFooter.DataField := 'Remedial_Dept_Descr';
      qrlblGroupHeader.caption:= 'Caused By:';
    end
  else
  if totalby = 3 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer_Name, Job_Remedial.Date_Raised');
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_Name';
      QRbDataFooter.DataField := 'Customer_Name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Job_Remedial.Date_Raised');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QRbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 4);
  qrbndgrpftr.enabled := (totalby < 4);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TfrmWTRPRemedialType.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  iInvoice := 0;

  repCost := 0.00;

  repTotalCost := 0.00;
  repTotalClient := 0.00;

  grandTotalCost := 0.00;
  grandTotalClient := 0.00;
end;

procedure TfrmWTRPRemedialType.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repTotalCost := 0.00;
  repTotalClient := 0.00;
end;

procedure TfrmWTRPRemedialType.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;
end;

procedure TfrmWTRPRemedialType.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Order"'
        + ',"Date Raised"'
        + ',"Job"'
        + ',"Customer"'
        + ',"Reported By"'
        + ',"Type"'
        + ',"Caused By"'
        + ',"Notes"'
        + ',"Original Templater"'
        + ',"Original Fitter"'
        + ',"Original Fitting Date"'
        + ',"Cost"'
        + ',"Completed"'
        + ',"Remedial Fitting Date"';

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TfrmWTRPRemedialType.qrbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblNotes.caption := ShowNotes(qryReport.fieldbyname('Notes').asinteger);
  qrlblOfficeNotes.caption := ShowNotes(qryReport.fieldbyname('Office_Notes').asinteger);
  repTotalCost := repTotalCost + qryReport.fieldbyname('Installation_Price').asfloat;

  grandTotalCost := grandTotalCost + qryReport.fieldbyname('Installation_Price').asfloat;

  qrbChildDetails.Enabled := qrlblOfficeNotes.caption <> '';
end;

procedure TfrmWTRPRemedialType.qrbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempStr := '"' + qryReport.fieldbyname('Sales_Order').asstring + '"';
      tempStr := tempStr + ',"' + paDateStr(qryReport.fieldbyname('Date_Raised').asdatetime) + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Remedial_Category_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Remedial_Type_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Remedial_Dept_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qrlblNotes.Caption + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Original_Templater_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Original_Fitter_Name').asstring + '"';
      tempStr := tempStr + ',"' + paDatestr(qryReport.fieldbyname('Fitting_Date').asdatetime) + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Installation_Price').asfloat) + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Completed').asstring + '"';
      tempStr := tempStr + ',"' + paDatestr(qryReport.fieldbyname('Remedial_Fitting_Date').asdatetime) + '"';
      writeln(self.exportFile, tempStr);
    end;
end;

procedure TfrmWTRPRemedialType.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblRepTotalClient.caption := FloatToStrF(repTotalClient, ffCurrency, 15, 2);
end;

procedure TfrmWTRPRemedialType.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblGrandTotalClient.caption := FloatToStrF(grandTotalClient, ffCurrency, 15, 2);
end;

function TfrmWTRPRemedialType.ShowNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.Data;
  finally
    Notes.free;
  end;
end;


end.
