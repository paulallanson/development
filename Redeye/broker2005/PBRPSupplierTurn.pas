unit PBRPSupplierTurn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CCSPrint, QRCtrls, QuickRpt, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSupplierTurnFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbndPageHeader: TQRBand;
    QRLblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    qrlblCost: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSysData2: TQRSysData;
    qrshpTitleLine: TQRShape;
    QRSubDetail1: TQRSubDetail;
    lblDescription: TQRLabel;
    qrdbtxtAccCode: TQRDBText;
    TotCstQRLbl: TQRLabel;
    QRBand1: TQRBand;
    QRLblRepCst: TQRLabel;
    QRLabel5: TQRLabel;
    qrshpTotalLine: TQRShape;
    qryReport: TFDQuery;
    qryReportName: TWideStringField;
    qryReportSel1: TFloatField;
    qryReportSel2: TFloatField;
    qryReportSel3: TFloatField;
    qryReportSel4: TFloatField;
    qryReportTag: TWideStringField;
    qryReportText100: TWideStringField;
    qryReportAccount_code: TWideStringField;
    qryReportMargPerc: TFloatField;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qryReportCalcFields(DataSet: TDataSet);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportfile: textfile;
    repSell, repCost: real;
    function BuildQueryString(rep: Boolean): string;
    procedure FixQuery(rep: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    NoofRecords: integer;
    OrderAsc: boolean;
    SeqByCost, SeqbySales, SeqbyProfit, SeqbyMargPerc, TurnOffCosts: boolean;
    intselcode: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSupplierTurnFrm: TPBRPSupplierTurnFrm;

implementation

uses PBRSSupplierTurn;

{$R *.dfm}

const
  SQLCore =
  'Supplier.Name, '+
  'Supplier_Branch.Account_Code, '+
  'Int_Sel.Int_Sel_Code, Int_Sel.Sel1, '+
  'Int_Sel.Sel2, Int_Sel.Sel3, '+
  'Int_Sel.Sel4, Int_Sel.Tag, '+
  'Int_Sel.Text100 '+
  'FROM Int_Sel INNER JOIN '+
  ' (Supplier INNER JOIN Supplier_Branch ON '+
  'Supplier.Supplier = Supplier_Branch.Supplier) ON '+
  '(Int_Sel.Sel2 = Supplier_Branch.Branch_no) AND '+
  '(Int_Sel.Sel1 = Supplier_Branch.Supplier) '+
  'WHERE (int_sel.Int_Sel_Code = :int_sel)';

procedure TPBRPSupplierTurnFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qrpDetails.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    Outputbin := PrinterSettings.OutputBin;
  end;
  fixquery(True);
  with qryReport do
  begin
    close;
    ParamByname('int_sel').AsInteger := intselcode;
    Open;
  end;

  repSell := 0.00;
  repCost := 0.00;
  
  qrlblcost.enabled := not TurnOffCosts;
//  qrlblGPM1.enabled := not TurnOffCosts;
//  MarginQRLabel.Enabled := not TurnOffCosts;
//  qrlblGPMUp1.enabled := not TurnOffCosts;
//  qrlblGPMUp2.enabled := not TurnOffCosts;
  TotCstQRLbl.Enabled := not TurnOffCosts;
  qrlblrepcst.Enabled := not TurnOffCosts;
//  MargQrlbl.enabled := not TurnOffCosts;
//  Qrlblrepmrg.enabled := not TurnOffCosts;
//  qrlblMargperc.enabled := not TurnOffCosts;
//  qrlblrepperc.enabled := not TurnOffCosts;

  if TurnOffCosts then
    begin
      qrshpTotalLine.width := 85;
      qrshpTitleLine.width := 425;
      qrlblTitle.Alignment := taLeftJustify;
      qrlbldaterange.Alignment := taLeftJustify;
    end;
end;

procedure TPBRPSupplierTurnFrm.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(rep);
    qryReport.ParamByName('int_sel').AsInteger := intSelCode;
    qryReport.Open;
  finally
    qryReport.EnableControls;
  end;
end;

function TPBRPSupplierTurnFrm.BuildQueryString(rep: Boolean): string;
var
stemp : string;
begin
{rebuilds the query string depending on the sort selections}
  sTemp := 'Select ';
  if noofrecords > 0 then
    sTemp := sTemp + 'Top '+intToStr(noofrecords)+' ';
  sTemp := sTemp + SQLCore;
  if SeqBySales then
    sTemp := sTemp + 'Order by Sel3';
  if SeqByCost then
    sTemp := sTemp + 'Order by Sel4';
  if SeqByProfit then
    sTemp := stemp + 'Order By (Sel3 - Sel4)';
  if seqByMargPerc then
    sTemp := sTemp +'Order by (((Sel3 - Sel4)*100)/Sel4)';
  if Orderasc then
    sTemp := stemp + ' asc'
  else
    sTemp := sTemp + ' Desc';
    Result := sTemp ;
end;

procedure TPBRPSupplierTurnFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rTotalCost :real;
begin
//  QRLblTotSell.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',qryReport.fieldbyname('sel3').asfloat);
  lblDescription.caption := qryReport.fieldbyname('Name').asstring;
  rTotalCost := qryReport.fieldbyname('Sel4').asFloat;
  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);
//  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qryReport.fieldbyname('Sel3').asfloat - qryReport.fieldbyname('Sel4').asfloat);
//  QRLblMargPerc.Caption := formatfloat('##0%',qryReport.fieldbyname('MargPerc').asfloat);
  repCost := RepCost + rTotalCost;
  repSell := RepSell + qryReport.fieldbyname('Sel3').AsFloat;
end;

procedure TPBRPSupplierTurnFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  RepMrgPerc : real;
begin
//  QRLblRepSel.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepSell);
  QrLblRepCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepCost);
//  QRLblRepMrg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepSell - RepCost);
  if RepCost = 0 then
    RepMrgPerc := 100
  else
    RepMrgPerc := (((RepSell - RepCost)*100)/RepCost);

//  QRLblRepPerc.Caption := formatfloat('##0%',RepMrgPerc);
end;

procedure TPBRPSupplierTurnFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  RepCost := 0.;
  RepSell := 0.;
end;

procedure TPBRPSupplierTurnFrm.qryReportCalcFields(DataSet: TDataSet);
begin
  if (0.01 > qryReport.fieldbyname('Sel4').asfloat) and (qryReport.fieldbyname('Sel4').asfloat > -0.01) then
    qryReport.fieldbyname('MargPerc').Asfloat := 100
  else
    qryReport.fieldbyname('MargPerc').Asfloat := (((qryReport.fieldbyname('Sel3').asfloat - qryReport.fieldbyname('Sel4').asfloat)*100)/qryReport.fieldbyname('Sel4').asfloat);

end;

procedure TPBRPSupplierTurnFrm.ExportToFile(fileName: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Supplier"'
    + ',"Account Code"'
    + ',"Total Purchases"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;
  
  CloseFile(self.exportFile);
end;

procedure TPBRPSupplierTurnFrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Supplier
    tempStr := '"' + lblDescription.caption + '"';
    //Account Code
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Code').asstring + '"';
    //Purchase Values
    tempStr := tempStr + ',"' + TotCstQRLbl.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSSupplierTurnFrm.prgbrExport.StepIt;
  end;
end;

end.
