unit PBRPCustCatKPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, DB, QRCtrls, CCSPrint, CCSCommon, printers, qrprntr,
  DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPCustCatKPIFrm = class(TForm)
    qrpdetails: TQuickRep;
    qrbTitle: TQRBand;
    qryReport: TFDQuery;
    qrbCatHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLblSelection: TQRLabel;
    QRSysData2: TQRSysData;
    GrpByQRDBText: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    qrlblApprovalDate: TQRLabel;
    qrlblTotalValue: TQRLabel;
    qrbDetailFooter: TQRBand;
    qrlblJobCount: TQRLabel;
    qrlblJobOnTime: TQRLabel;
    qrlblJobPrior: TQRLabel;
    qrlblJobOverTime: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qryCustCatKPI: TFDQuery;
    qrlblDays: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlblKPIType: TQRLabel;
    qrlblKPIMin: TQRLabel;
    qrlblKPIMax: TQRLabel;
    qrbDetailHeader: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QuantityLbl: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qrbSummaryHeader: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qrbSummaryFooter: TQRBand;
    QRDBText3: TQRDBText;
    qrlblSummJobs: TQRLabel;
    qrlblSummOnTime: TQRLabel;
    qrlblSummPrior: TQRLabel;
    qrlblSummOver: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    qrlblJobIncomplete: TQRLabel;
    QRLabel23: TQRLabel;
    qrlblSummInComplete: TQRLabel;
    QRLabel24: TQRLabel;
    qrbReportEnd: TQRBand;
    QRLabel25: TQRLabel;
    qrlblTotOnTime: TQRLabel;
    qrlblTotInComplete: TQRLabel;
    qrlblTotEarly: TQRLabel;
    qrlblTotLate: TQRLabel;
    qrlblTotJobs: TQRLabel;
    QRShape2: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qrlblPercInComplete: TQRLabel;
    qrlblPercOnTime: TQRLabel;
    qrlblPercEarly: TQRLabel;
    qrlblPercLate: TQRLabel;
    qrlblTotPercInComplete: TQRLabel;
    qrlblTotPercOnTime: TQRLabel;
    qrlblTotPercEarly: TQRLabel;
    qrlblTotPercLate: TQRLabel;
    qrlblDateSelection: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    qrlblTotalCost: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    qrlblMargin: TQRLabel;
    procedure qrpdetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCatHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSummaryFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSummaryFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbReportEndBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbReportEndAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    KPIType: string;
    KPIMin, KPIMax: integer;
  public
    iCust, iCat: integer;
    bSummary: boolean;
    dateFrom, dateTo: TDateTime;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPCustCatKPIFrm: TPBRPCustCatKPIFrm;

implementation

uses PBRSCustCatKPI;

var
  ijobs, iOnTime, iPrior, iOver, iInComplete: integer;
  iTotaljobs, iTotalOnTime, iTotalPrior, iTotalOver, iTotalInComplete: integer;

{$R *.dfm}

function TPBRPCustCatKPIFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Category').asinteger := iCat;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPCustCatKPIFrm.qrpdetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  if bSummary then
    begin
      qrbSummaryHeader.Enabled := true;
      qrbDetailheader.Enabled := false;
      qrbDetailheader.parentband := nil;
      qrbSummaryHeader.parentband := qrbTitle;
      qrbCatHeader.FooterBand := qrbSummaryFooter;
      qrbReportEnd.Enabled := true;
    end
  else
    begin
      qrbDetailheader.Enabled := true;
      qrbSummaryHeader.Enabled := false;
      qrbDetailheader.parentband := qrbTitle;
      qrbSummaryHeader.parentband := nil;
      qrbCatHeader.FooterBand := qrbDetailFooter;
      qrbReportEnd.Enabled := false;
    end;

  iTotalJobs := 0;
  iTotalOnTime := 0;
  iTotalPrior := 0;
  iTotalOver := 0;
  iTotalInComplete := 0;


  iJobs := 0;
  iOnTime := 0;
  iPrior := 0;
  iOver := 0;
  iInComplete := 0;
end;

procedure TPBRPCustCatKPIFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rValue, rCostValue: real;
  rdays: real;
  bNotDelivered, bNotApproved: boolean;
  Approvaldate: TDateTime;
begin
  qrlblApprovalDate.caption := PBDateStr(qryReport.fieldbyname('Date_Approved').asdatetime);
  if qryReport.FieldByName('Price_Unit_Factor').AsInteger = 0 then
    rValue := qryReport.fieldbyname('Selling_Price').asfloat
  else
    begin
      rValue := (qryReport.fieldbyname('Selling_Price').asfloat/qryReport.FieldByName('Price_Unit_Factor').AsInteger)
                * qryReport.fieldbyname('Quantity').asinteger
    end;

  if qryReport.FieldByName('Order_Unit_Factor').AsInteger = 0 then
    rCostValue := qryReport.fieldbyname('Order_Price').asfloat
  else
    begin
      rCostValue := (qryReport.fieldbyname('Order_Price').asfloat/qryReport.FieldByName('Order_Unit_Factor').AsInteger)
                * qryReport.fieldbyname('Quantity').asinteger
    end;

  iJobs := iJobs + 1;

  if qryReport.fieldbyname('Date_Delivered').asstring = '' then
    bNotDelivered := true
  else
    bNotDelivered := false;

  if qryReport.fieldbyname('Date_Approved').asstring = '' then
    bNotApproved := true
  else
    bNotApproved := false;

  if qryReport.fieldbyname('Proof_Required').asstring = 'Y' then
    ApprovalDate := DateOf(qryReport.fieldbyname('Date_Approved').asdatetime)
  else
    begin
      ApprovalDate := DateOf(qryReport.fieldbyname('Goods_Reqd_by_Customer').asdatetime);
      qrlblApprovalDate.Caption := 'NO PROOFS';
      bNotApproved := false;
    end;

  if KPIType = 'A_APP' then
    begin
      rDays := (qryReport.fieldbyname('Date_Delivered').asdatetime - ApprovalDate);
      if bNotDelivered or bNotApproved then
        iInComplete := iInComplete + 1
      else
      if rDays < KPIMin then
        iPrior := iPrior + 1
      else
      if (rDays >= KPIMin) and (rDays <= KPIMax) then
        iOnTime := iOnTime + 1
      else
        iOver := iOver + 1;
    end
  else
    begin
      rDays := (qryReport.fieldbyname('Date_Delivered').asdatetime - qryReport.fieldbyname('Goods_Reqd_by_Customer').asdatetime);
      if bNotDelivered then
        iInComplete := iInComplete + 1
      else
      if rDays < KPIMin then
        iPrior := iPrior + 1
      else
      if (rDays >= KPIMin) and (rDays <= KPIMax) then
        iOnTime := iOnTime + 1
      else
        iOver := iOver + 1;
    end;


(*  if rDays = 0 then
    qrlblDuration.caption := 'On time'
  else
  if rDays < 0 then
    qrlblDuration.caption := 'Early'
  else
  if rDays > 0 then
    qrlblDuration.caption := 'Late';
*)

  if bNotDelivered then
    qrlblDays.caption := ''
  else
    qrlblDays.caption := formatfloat('##0',rDays);

  qrlblTotalValue.caption := formatfloat('#,##0.00',rValue);
  qrlblTotalCost.caption := formatfloat('#,##0.00',rCostValue);
  qrlblMargin.caption := formatfloat('#,##0.00',(rValue - rCostValue));
  printBand := not bSummary;
end;

procedure TPBRPCustCatKPIFrm.qrbCatHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qryCustCatKPI do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Category').asinteger := qryreport.fieldbyname('Category').asinteger;
      open;
      KPIType := fieldbyname('Category_KPI_ID').asstring;
      KPIMin := fieldbyname('KPI_Min_Value').asinteger;
      KPIMax := fieldbyname('KPI_Max_Value').asinteger;
    end;
  PrintBand := not bSummary;
end;

procedure TPBRPCustCatKPIFrm.qrbDetailFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblKPIType.caption := qryCustCatKPI.fieldbyname('Category_KPI_Description').asstring;
  qrlblKPIMin.caption := qryCustCatKPI.fieldbyname('KPI_Min_Value').asstring;
  qrlblKPIMax.caption := qryCustCatKPI.fieldbyname('KPI_Max_Value').asstring;

  qrlblJobIncomplete.caption := inttostr(iInComplete);
  qrlblJobCount.caption := inttostr(iJobs);
  qrlblJobOnTime.caption := inttostr(iOnTime);
  qrlblJobPrior.caption := inttostr(iPrior);
  qrlblJobOverTime.caption := inttostr(iOver);
end;

procedure TPBRPCustCatKPIFrm.qrbDetailFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  iTotalJobs := iTotalJobs + iJobs;
  iTotalOnTime := iTotalOnTime + iOnTime;
  iTotalPrior := iTotalPrior + iPrior;
  iTotalOver := iTotalOver + iOver;
  iTotalIncomplete := iTotalIncomplete + iIncomplete;


  iJobs := 0;
  iOnTime := 0;
  iPrior := 0;
  iOver := 0;
  iIncomplete := 0;
end;

procedure TPBRPCustCatKPIFrm.qrbSummaryFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblSummInComplete.caption := inttostr(iInComplete);
  qrlblSummJobs.caption := inttostr(iJobs);
  qrlblSummOnTime.caption := inttostr(iOnTime);
  qrlblSummPrior.caption := inttostr(iPrior);
  qrlblSummOver.caption := inttostr(iOver);

  qrlblPercInComplete.caption := formatfloat('##0.00',((iInComplete/iJobs)*100));
  qrlblPercOnTime.caption := formatfloat('##0.00',((iOnTime/iJobs)*100));
  qrlblPercEarly.caption := formatfloat('##0.00',((iPrior/iJobs)*100));
  qrlblPercLate.caption := formatfloat('##0.00',((iOver/iJobs)*100));
end;

procedure TPBRPCustCatKPIFrm.qrbSummaryFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  iTotalJobs := iTotalJobs + iJobs;
  iTotalOnTime := iTotalOnTime + iOnTime;
  iTotalPrior := iTotalPrior + iPrior;
  iTotalOver := iTotalOver + iOver;
  iTotalIncomplete := iTotalIncomplete + iIncomplete;

  iJobs := 0;
  iOnTime := 0;
  iPrior := 0;
  iOver := 0;
  iInComplete := 0;

  if self.exporting then
  begin
    //Category
    tempStr := '"' + qryReport.fieldByName('Category_Description').asString + '"';

    //No. incomplete
    tempStr := tempStr + ',"' + qrlblSummIncomplete.caption + '"';

    //Perc Incomplete
    tempStr := tempStr + ',"' + qrlblPercIncomplete.caption + '"';

    //No. On Time
    tempStr := tempStr + ',"' + qrlblSummOnTime.caption + '"';

    //Perc Ontime
    tempStr := tempStr + ',"' + qrlblPercOnTime.caption + '"';

    //No. Prior
    tempStr := tempStr + ',"' + qrlblSummPrior.caption + '"';

    //Perc prior
    tempStr := tempStr + ',"' + qrlblPercEarly.caption + '"';

    //No. Over
    tempStr := tempStr + ',"' + qrlblSummOver.Caption + '"';

    //Perc Over
    tempStr := tempStr + ',"' + qrlblPercLate.caption + '"';

    //Total Jobs
    tempStr := tempStr + ',"' + qrlblSummJobs.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSCustCatKPIFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPCustCatKPIFrm.qrbReportEndBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotInComplete.caption := inttostr(iTotalInComplete);
  qrlblTotJobs.caption := inttostr(iTotalJobs);
  qrlblTotOnTime.caption := inttostr(iTotalOnTime);
  qrlblTotEarly.caption := inttostr(iTotalPrior);
  qrlblTotLate.caption := inttostr(iTotalOver);

  qrlblTotPercInComplete.caption := formatfloat('##0.00',((iTotalInComplete/iTotalJobs)*100));
  qrlblTotPercOnTime.caption := formatfloat('##0.00',((iTotalOnTime/iTotalJobs)*100));
  qrlblTotPercEarly.caption := formatfloat('##0.00',((iTotalPrior/iTotalJobs)*100));
  qrlblTotPercLate.caption := formatfloat('##0.00',((iTotalOver/iTotalJobs)*100));
end;

procedure TPBRPCustCatKPIFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if bSummary then
    tempstr := '"Category"'
      + ',"Incomplete"'
      + ',"Incomplete %"'
      + ',"On Time"'
      + ',"On Time %"'
      + ',"Before Due Date"'
      + ',"efore Due Date %"'
      + ',"After Due Date"'
      + ',"After Due Date %"'
      + ',"Total Orders"'
  else
    tempStr := '"Category"'
      + ',"Order"'
      + ',"Order Date"'
      + ',"Description"'
      + ',"Order Reference"'
      + ',"Quantity"'
      + ',"Order Value"'
      + ',"Date Required"'
      + ',"Proof Approval Date"'
      + ',"Date Delivered"'
      + ',"Days Over/Under"';

  writeLn(self.exportFile, tempStr);
  qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPCustCatKPIFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and not bSummary then
  begin
    //Category
    tempStr := '"' + qryReport.fieldByName('Category_Description').asString + '"';

    //Order
    tempStr := tempStr + ',"' + qryReport.fieldByName('Purchase_Order').asString + '"';

    //Order Date
    tempStr := tempStr + ',"' + pbDateStr(qryReport.fieldByName('Date_Point').asdatetime) + '"';

    //Desc
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customers_Desc').asString + '"';

    //Customers Order No
    tempStr := tempStr + ',"' + qryReport.fieldByName('Cust_Order_no').asString + '"';

    //Qty
    tempStr := tempStr + ',"' + qryReport.fieldByName('Quantity').asString + '"';

    //Value
    tempStr := tempStr + ',"' + qrlblTotalValue.caption + '"';

    //Date Required
    tempStr := tempStr + ',"' + pbDateStr(qryReport.fieldByName('Goods_Reqd_by_Customer').asdatetime) + '"';

    //Approval Date
    tempStr := tempStr + ',"' + qrlblApprovalDate.caption + '"';

    //Date Delivered
    tempStr := tempStr + ',"' + pbDateStr(qryReport.fieldByName('Date_Delivered').asdatetime) + '"';

    //No of Days
    tempStr := tempStr + ',"' + qrlblDays.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSCustCatKPIFrm.prgbrExport.StepIt;
  end;

end;

procedure TPBRPCustCatKPIFrm.qrbReportEndAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting  and bSummary then
  begin
    //Write away a blank line
    tempstr := '';
    writeln(self.exportFile, tempStr);

    //Category
    tempStr := '"' + 'Totals' + '"';

    //No. incomplete
    tempStr := tempStr + ',"' + qrlblTotIncomplete.caption + '"';

    //Perc Incomplete
    tempStr := tempStr + ',"' + qrlblTotPercIncomplete.caption + '"';

    //No. On Time
    tempStr := tempStr + ',"' + qrlblTotOnTime.caption + '"';

    //Perc Ontime
    tempStr := tempStr + ',"' + qrlblTotPercOnTime.caption + '"';

    //No. Prior
    tempStr := tempStr + ',"' + qrlblTotEarly.caption + '"';

    //Perc prior
    tempStr := tempStr + ',"' + qrlblTotPercEarly.caption + '"';

    //No. Over
    tempStr := tempStr + ',"' + qrlblTotLate.Caption + '"';

    //Perc Over
    tempStr := tempStr + ',"' + qrlblTotPercLate.caption + '"';

    //Total Jobs
    tempStr := tempStr + ',"' + qrlblTotJobs.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSCustCatKPIFrm.prgbrExport.StepIt;
  end;

end;

end.
