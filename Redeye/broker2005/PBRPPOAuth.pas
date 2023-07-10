unit PBRPPOAuth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint;

type
  TPBRPPOAuthFrm = class(TForm)
    qryReport: TQuery;
    qrReport: TQuickRep;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrlblRepTotalSell: TQRLabel;
    qrlblRepTotalCost: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    qrlblGrandTotalSell: TQRLabel;
    qrlblGrandTotalCost: TQRLabel;
    QRShape3: TQRShape;
    qryDummy: TQuery;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrChildSummary: TQRChildBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    qrlblAuthorised: TQRLabel;
    qdbAuthorised: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    qrlblSellPrice: TQRLabel;
    qrlblOrderPrice: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbReasonsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    iInvoice: integer;
  public
    PrinterSettings: TPrinterSettings;
    Totalby: integer;
    ShowOnlyOut: boolean;
    bSummary: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, operator: integer): integer;
  end;

var
  PBRPPOAuthFrm: TPBRPPOAuthFrm;

implementation

uses PBDatabase, CCSCommon, PBRSPOAuth;

{$R *.DFM}

var
  repCost, repSell: double;
  repTotalCost, repTotalSell: double;
  grandTotalCost, grandTotalSell: double;

function TPBRPPOAuthFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, operator: integer): integer;
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
    self.qryReport.SQL.add('  AND Purchase_Order.date_point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Purchase_Order.date_point <= '+ qDate(tmpDateTo));
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
    self.qryReport.SQL.Add('  and ((Purchase_OrderLine.customer = ' + IntToStr(Customer) + ')' +
      '  and (Purchase_OrderLine.Branch_no = ' +IntToStr(branch) + '))');
  end;

  if operator <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Purchase_Order.Operator = ' + IntToStr(operator) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Operator.Name, Purchase_OrderLine.Purchase_Order');
      qrbndgrphdr.expression := 'qryReport.Operator_Name';
      QRDBText6.DataField := 'qryReport.Operator_name';
      qrlblGroupHeader.Caption := 'Operator:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY (Select OP.Name FROM Operator OP WHERE OP.Operator = Purchase_Order.Authorised_by), Purchase_OrderLine.Purchase_Order');
      qrbndgrphdr.expression := 'qryReport.Authorised_Name';
      QRDBText6.DataField := 'qryReport.Authorised_name';
      qrlblGroupHeader.Caption := 'Authorised By:';
    end
  else
  if totalby = 2 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer.Name, Purchase_OrderLine.Purchase_Order');
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'qryReport.Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Purchase_OrderLine.Purchase_Order');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 3);
  qrbndgrpftr.enabled := (totalby < 3);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPPOAuthFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
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
      qrbndgrphdr.expression := 'qryReport.Operator_Name';
      QRDBText6.DataField := 'operator_name';
      QRbDataFooter.DataField := 'operator_name';
      qrlblGroupHeader.Caption := 'Operator:';

      qrlblAuthorised.Caption := 'Authorised By';
      qdbAuthorised.DataField := 'Authorised_name';
    end
  else
  if totalby = 1 then
    begin
      qrbndgrphdr.expression := 'qryReport.Authorised_Name';
      QRDBText6.DataField := 'Authorised_name';
      QRbDataFooter.DataField := 'Authorised_name';
      qrlblGroupHeader.Caption := 'Authorised By:';

      qrlblAuthorised.Caption := 'Operator';
      qdbAuthorised.DataField := 'operator_name';
    end
  else
  if totalby = 2 then
    begin
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_name';
      QrbDataFooter.DataField := 'Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';

      qrlblAuthorised.Caption := 'Authorised By';
      qdbAuthorised.DataField := 'Authorised_name';
    end
  else
    begin
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QrbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';

      qrlblAuthorised.Caption := 'Authorised By';
      qdbAuthorised.DataField := 'Authorised_name';
    end;

  iInvoice := 0;

  repCost := 0.00;
  repSell := 0.00;

  repTotalCost := 0.00;
  repTotalSell := 0.00;

  grandTotalCost := 0.00;
  grandTotalSell := 0.00;
end;

procedure TPBRPPOAuthFrm.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;
end;

procedure TPBRPPOAuthFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Purchase order"'
        + ',"Date"'
        + ',"Customer"'
        + ',"Rep"'
        + ',"Description"'
        + ',"Authorised By"'
        + ',"Job Bag"'
        + ',"Quantity"'
        + ',"Total Cost"'
        + ',"Total Sell"'
        + ',"Status"'
        + ',"Operator"';

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPPOAuthFrm.qrbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
 if exporting then
    begin
      tempStr := '"' + qryReport.fieldbyname('Purchase_Order').asstring + '"';
      tempStr := tempStr + ',"' + PBDateStr(qryReport.fieldbyname('Date_Point').asdatetime) + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customers_Desc').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Authorised_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Quantity').asstring + '"';
      tempStr := tempStr + ',"' + qrlblOrderPrice.caption + '"';
      tempStr := tempStr + ',"' + qrlblSellPrice.caption + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Status_Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Operator_Name').asstring  + '"';
      writeln(self.exportFile, tempStr);
      PBRSPOAuthFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPPOAuthFrm.qrbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rCost, rSell: real;
begin
// Total Cost
  rCost := CalcTotalValue(qryReport.fieldbyname('Quantity').asinteger,
                           qryReport.fieldbyname('Order_Unit_Factor').asinteger,
                           qryReport.fieldbyname('Order_Price').asfloat);
  repCost := repCost + rCost;
  qrlblOrderPrice.caption := FloatToStrF(rCost, ffCurrency, 15, 2);

// Total Sell Price
  rSell := CalcTotalValue(qryReport.fieldbyname('Quantity').asinteger,
                           qryReport.fieldbyname('Sell_Unit_Factor').asinteger,
                           qryReport.fieldbyname('Selling_Price').asfloat);

  repSell := repSell + rSell;
  qrlblSellPrice.caption := FloatToStrF(rSell, ffCurrency, 15, 2);

  grandTotalCost := grandTotalCost + rCost;
  grandTotalSell := grandTotalSell + rSell;
end;

procedure TPBRPPOAuthFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblRepTotalCost.caption := formatfloat('£#,##0.00',repCost);
  qrlblRepTotalSell.caption := formatfloat('£#,##0.00',repSell);
end;

procedure TPBRPPOAuthFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblGrandTotalCost.caption := formatfloat('£#,##0.00',grandTotalCost);
  qrlblGrandTotalSell.caption := formatfloat('£#,##0.00',grandTotalSell);
end;

procedure TPBRPPOAuthFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repcost := 0.00;
  repsell := 0.00;
end;

end.
