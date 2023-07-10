unit PBRPCreditNoteReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint;

type
  TPBRPCreditNoteReasonFrm = class(TForm)
    qryReport: TQuery;
    qrReport: TQuickRep;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrlblRepTotalPart: TQRLabel;
    qrlblRepTotalFull: TQRLabel;
    qrlblRepTotalVAT: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    qrlblGrandTotalPart: TQRLabel;
    qrlblGrandTotalFull: TQRLabel;
    qrlblGrandTotalVAT: TQRLabel;
    QRShape3: TQRShape;
    qryDummy: TQuery;
    qrlblRepTotal: TQRLabel;
    qrlblGrandTotal: TQRLabel;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    qrbReasons: TQRGroup;
    qrbndReasFtr: TQRBand;
    QRDBText7: TQRDBText;
    qrlblTotalFull: TQRLabel;
    qrlblTotalPart: TQRLabel;
    qrlblTotalVAT: TQRLabel;
    qrlblTotal: TQRLabel;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    qrChildSummary: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrChildDetail: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    qrlblFullCredit: TQRLabel;
    qrlblPartCredit: TQRLabel;
    qrlblVATCredit: TQRLabel;
    QRDBText4: TQRDBText;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbReasonsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndReasFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndReasFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    iInvoice: integer;
  public
    PrinterSettings: TPrinterSettings;
    Totalby: integer;
    bSummary: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer): integer;
  end;

var
  PBRPCreditNoteReasonFrm: TPBRPCreditNoteReasonFrm;

implementation

uses PBDatabase, CCSCommon, PBRSCreditNoteReason;

{$R *.DFM}

var
  repFull, repPart, repVAT: double;
  repTotalFull, repTotalPart, repTotalVAT: double;
  grandTotalFull, grandTotalPart, grandTotalVAT: double;

function TPBRPCreditNoteReasonFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer): integer;
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
  self.qryReport.Active := false;

  qryReport.SQL.clear;
  qryReport.SQL.text := qryDummy.SQL.text;
  if tmpdateFrom <> 0 then
  begin
    self.qryReport.SQL.add('  AND sales_invoice.Invoice_date >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND sales_invoice.Invoice_date <= '+ qDate(tmpDateTo));
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

  if customer <> 0 then
  begin
    self.qryReport.SQL.Add('  and ((sales_invoice.inv_to_customer = ' + IntToStr(Customer) + ')' +
      '  and (sales_invoice.inv_to_branch = ' +IntToStr(branch) + '))');
  end;

  if rep <> 0 then
  begin
    self.qryReport.SQL.Add('  and (sales_invoice.rep = ' + IntToStr(rep) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Rep.Name, Credit_Note_Reason_Descr, sales_invoice.sales_invoice_no');
      qrbndgrphdr.expression := 'qryReport.rep_Name';
      QRDBText6.DataField := 'qryReport.rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer.Name, Credit_Note_Reason_Descr, sales_invoice.sales_invoice_no');
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'qryReport.Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
  if totalby = 2 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Office_Contact_Name, Credit_Note_Reason_Descr, sales_invoice.sales_invoice_no');
      qrbndgrphdr.expression := 'qryReport.Office_Contact_Name';
      QRDBText6.DataField := 'qryReport.Office_Contact_Name';
      qrlblGroupHeader.caption:= 'Account Manager:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Credit_Note_Reason_Descr, sales_invoice.sales_invoice_no');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 3);
  qrbndgrpftr.enabled := (totalby < 3);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPCreditNoteReasonFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qrReport.PrinterSettings do
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

  if totalby = 0 then
    begin
      qrbndgrphdr.expression := 'qryReport.rep_Name';
      QRDBText6.DataField := 'rep_name';
      QRbDataFooter.DataField := 'rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_name';
      QrbDataFooter.DataField := 'Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
  if totalby = 2 then
    begin
      qrbndgrphdr.expression := 'qryReport.Office_Contact_Name';
      QRDBText6.DataField := 'Office_Contact_Name';
      QrbDataFooter.DataField := 'Office_Contact_Name';
      qrlblGroupHeader.caption:= 'Account Manager:';
    end
  else
    begin
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QrbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  if bSummary then
    begin
      qrChildSummary.ParentBand := qrbndPageHeader;
      qrChildDetail.ParentBand := nil;
    end
  else
    begin
      qrChildSummary.ParentBand := nil;
      qrChildDetail.ParentBand := qrbndPageHeader;
    end;

  iInvoice := 0;

  repFull := 0.00;
  repPart := 0.00;
  repVAT := 0.00;

  repTotalFull := 0.00;
  repTotalPart := 0.00;
  repTotalVAT := 0.00;

  grandTotalFull := 0.00;
  grandTotalPart := 0.00;
  grandTotalVAT := 0.00;
end;

procedure TPBRPCreditNoteReasonFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblRepTotalFull.caption := FloatToStrF(repTotalFull, ffCurrency, 15, 2);
  self.qrlblRepTotalPart.caption := FloatToStrF(repTotalPart, ffCurrency, 15, 2);
  self.qrlblRepTotalVat.caption := FloatToStrF(repTotalVAT, ffCurrency, 15, 2);
  self.qrlblRepTotal.caption := FloatToStrF((repTotalFull+repTotalPart+repTotalVAT), ffCurrency, 15, 2);
end;

procedure TPBRPCreditNoteReasonFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repTotalFull := 0.00;
  repTotalPart := 0.00;
  repTotalVAT := 0.00;
end;

procedure TPBRPCreditNoteReasonFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblGrandTotalFull.caption := FloatToStrF(grandTotalFull, ffCurrency, 15, 2);
  self.qrlblGrandTotalPart.caption := FloatToStrF(grandTotalPart, ffCurrency, 15, 2);
  self.qrlblGrandTotalVAT.caption := FloatToStrF(grandTotalVAT, ffCurrency, 15, 2);
  self.qrlblGrandTotal.caption := FloatToStrF((grandTotalFull+grandTotalPart+grandTotalVAT), ffCurrency, 15, 2);
end;

procedure TPBRPCreditNoteReasonFrm.qrbDetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rValue: real;
begin
  self.qrlblFullCredit.caption := FloatToStrF(0.00, ffCurrency, 15, 2);
  self.qrlblPartCredit.caption := FloatToStrF(0.00, ffCurrency, 15, 2);
  self.qrlblVATCredit.caption := FloatToStrF(0.00, ffCurrency, 15, 2);

  rValue := CalcTotalValue((qryReport.fieldbyname('Qty_Invoiced').asinteger*-1),
                           qryReport.fieldbyname('Price_Unit_Factor').asinteger,
                           (qryReport.fieldbyname('Goods_Value').asfloat*-1));

  if iInvoice <> qryReport.fieldbyname('Sales_Invoice').asinteger then
    rValue := rValue + (qryReport.fieldbyname('Extra_Charges').asfloat*-1);

  if qryReport.FieldByName('Credit_Type').asstring = 'Q' then
    begin
      repFull := repFull + rValue;
      self.qrlblFullCredit.caption := FloatToStrF(rValue, ffCurrency, 15, 2);
    end
  else
  if qryReport.FieldByName('Credit_Type').asstring = 'P' then
    begin
      repPart := repPart + rValue;
      self.qrlblPartCredit.caption := FloatToStrF(rValue, ffCurrency, 15, 2);
    end
  else
    begin
      repVat := repVat + (qryReport.FieldByName('Vat_Value').asfloat*-1);
      self.qrlblVATCredit.caption := FloatToStrF((qryReport.FieldByName('Vat_Value').asfloat*-1), ffCurrency, 15, 2);
    end;

  iInvoice := qryReport.fieldbyname('Sales_Invoice').asinteger;

  PrintBand := not bSummary;
end;

procedure TPBRPCreditNoteReasonFrm.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;
end;

procedure TPBRPCreditNoteReasonFrm.qrbndReasFtrBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  self.qrlblTotalFull.caption := FloatToStrF(repFull, ffCurrency, 15, 2);
  self.qrlblTotalPart.caption := FloatToStrF(repPart, ffCurrency, 15, 2);
  self.qrlblTotalVAT.caption := FloatToStrF(repVAT, ffCurrency, 15, 2);
  self.qrlblTotal.caption := FloatToStrF((repFull+repPart+repVAT), ffCurrency, 15, 2);

  repTotalFull := repTotalFull + repFull;
  repTotalPart := repTotalPart + repPart;
  repTotalVAT := repTotalVAT + repVAT;

  grandTotalFull := grandTotalFull + repFull;
  grandTotalPart := grandTotalPart + repPart;
  grandTotalVAT := grandTotalVAT + repVAT;
end;

procedure TPBRPCreditNoteReasonFrm.qrbndReasFtrAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  repFull := 0.00;
  repPart := 0.00;
  repVAT := 0.00;

  if not bSummary then exit;
  tempstr := '';

  if exporting then
    begin
      if totalby < 3 then
        begin
          tempStr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Office_Contact_Name').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Credit_Note_Reason_Descr').asstring + '"';
          tempStr := tempStr + ',"' + qrlblTotalFull.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalPart.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalVAT.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotal.caption + '"';
        end
      else
        begin
          tempStr := '"' + qryReport.fieldbyname('Credit_Note_Reason_Descr').asstring + '"';
          tempStr := tempStr + ',"' + qrlblTotalFull.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalPart.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalVAT.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotal.caption + '"';
        end;
      writeln(self.exportFile, tempStr);
      PBRSCreditNoteReasonFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPCreditNoteReasonFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if bSummary then
    begin
      if totalby < 3 then
        begin
          tempStr := '"Rep"'
            + ',"Customer"'
            + ',"Account Manager"'
            + ',"Reason"'
            + ',"Full Credit"'
            + ',"Part Credit"'
            + ',"VAT credit"'
            + ',"Total"';
        end
      else
        begin
          tempStr := '"Reason"'
            + ',"Full Credit"'
            + ',"Part Credit"'
            + ',"VAT credit"'
            + ',"Total"';
        end;
    end
  else
    begin
      tempStr := '"Rep"'
            + ',"Customer"'
            + ',"Account Manager"'
            + ',"Reason"'
            + ',"Credit Note"'
            + ',"Credit Date"'
            + ',"Job Bag"'
            + ',"Purchase Order"'
            + ',"Job Description"'
            + ',"Supplier"'
            + ',"Full Credit"'
            + ',"Part Credit"'
            + ',"VAT credit"'
            + ',"Total"';
    end;

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPCreditNoteReasonFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempstr := '';
      writeln(self.exportFile, tempStr);
      if bSummary then
        begin
          if totalby < 3 then
            begin
              tempStr := '"' + 'Report Totals' + '"';
              tempStr := tempStr + ',"' + '' + '"';
              tempStr := tempStr + ',"' + '' + '"';
              tempStr := tempStr + ',"' + '' + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotalFull.caption + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotalPart.caption + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotalVAT.caption + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotal.caption + '"';
            end
          else
            begin
              tempStr := '"' + 'Report Totals' + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotalFull.caption + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotalPart.caption + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotalVAT.caption + '"';
              tempStr := tempStr + ',"' + qrlblGrandTotal.caption + '"';
            end;
        end
      else
        begin
          tempStr := '"' + 'Report Totals' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalFull.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalPart.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalVAT.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotal.caption + '"';
        end;
        
      writeln(self.exportFile, tempStr);
    end;

end;

procedure TPBRPCreditNoteReasonFrm.qrbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if bSummary then exit;

  tempstr := '';

  if exporting then
    begin
      tempStr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Office_Contact_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Credit_Note_Reason_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Sales_Invoice_No').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Invoice_Date').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Purchase_Order').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Supplier_Name').asstring + '"';
      tempStr := tempStr + ',"' + qrlblFullCredit.caption + '"';
      tempStr := tempStr + ',"' + qrlblPartCredit.caption + '"';
      tempStr := tempStr + ',"' + qrlblVATCredit.caption + '"';
      writeln(self.exportFile, tempStr);
      PBRSCreditNoteReasonFrm.prgbrExport.StepIt;
    end;

end;

end.
