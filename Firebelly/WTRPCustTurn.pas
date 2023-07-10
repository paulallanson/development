unit WTRPCustTurn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects;

type
  TWTRPCustTurnFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    qrbndPageHeader: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    qrlblCost: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    MarginQRLabel: TQRLabel;
    qrlblGPM1: TQRLabel;
    qrlblGPMUp1: TQRLabel;
    qrlblGPMUp2: TQRLabel;
    QryCustTurn: TQuery;
    QryCustTurnName: TStringField;
    QryCustTurnSel1: TFloatField;
    QryCustTurnSel3: TFloatField;
    QryCustTurnSel4: TFloatField;
    QryCustTurnAccount_Code: TStringField;
    QRLblTitle: TQRLabel;
    lblDescription: TQRLabel;
    qrdbtxtAccCode: TQRDBText;
    QRLblTotSell: TQRLabel;
    TotCstQRLbl: TQRLabel;
    MargQRLbl: TQRLabel;
    QryCustTurnMargPerc: TFloatField;
    QRLblMargPerc: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRLblRepSel: TQRLabel;
    QRLblRepCst: TQRLabel;
    QRLblRepMrg: TQRLabel;
    QRLblRepPerc: TQRLabel;
    QRLabel5: TQRLabel;
    qrshpTotalLine: TQRShape;
    qrshpTitleLine: TQRShape;
    QryCustTurnCustomer_Type_Name: TStringField;
    procedure qckrpSalesByInvBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QryCustTurnCalcFields(DataSet: TDataSet);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    fSeqBySales: Boolean;
    fSeqByCost: Boolean;
    FSeqByProfit: Boolean;
    fSeqByMargPerc: Boolean;
    fOrderasc: Boolean;
    fnoofcust: integer;
    FSeqbyName: boolean;
    procedure setSeqByCost(const Value: Boolean);
    procedure setSeqBySales(const Value: Boolean);
    procedure SetSeqByProfit(const Value: Boolean);
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure SetSeqByMargPerc(const Value: Boolean);
    procedure SetOrderasc(const Value: Boolean);
    procedure setNoofCust(const Value: integer);
    procedure SetSeqbyName(const Value: boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    iIntselcode: Integer;
    RepCst, Repsel : real;
    bTurnOffCosts: boolean;
    property SeqBySales : Boolean read fSeqBySales write setSeqBySales;
    property SeqByCost: Boolean read fSeqByCost write setSeqByCost;
    property SeqByProfit: Boolean read FSeqByProfit write SetSeqByProfit;
    property SeqbyMargPerc: Boolean read fSeqByMargPerc write SetSeqByMargPerc;
    property SeqbyName: boolean read FSeqbyName write SetSeqbyName;
    property Orderasc: Boolean read fOrderasc write SetOrderasc;
    property noofcust: integer read fnoofcust write setNoofCust;
    procedure ExportToFile(fileName: string);
    function GetDetails: integer;
  end;

var
  WTRPCustTurnFrm: TWTRPCustTurnFrm;

implementation

uses PBRSCustTurn;

{$R *.DFM}
const

  SQLCore =
    'Customer.Name, '+
    'Customer_Branch.Account_Code, '+
    'Int_Sel.Int_Sel_Code, '+
    'int_Sel.Sel1, '+
    'sum(Int_Sel.Sel3) as Sel3, '+
    'sum(Int_Sel.Sel4) as Sel4, '+
    'sum(Int_Sel.Sel3 - Int_Sel.Sel4) as Sel10, '+
    'sum((((Sel3 - Sel4)*100)/Sel4)) as Sel11, '+
    'Customer_Type.Description as Customer_Type_Name '+
  'FROM Customer_Type '+
	  'INNER JOIN (Customer '+
	  'INNER JOIN (Int_Sel '+
	  'INNER JOIN Customer_Branch  '+
		'  ON (Int_Sel.Sel1 = Customer_Branch.Customer) '+
		'  AND (Int_Sel.Sel2 = Customer_Branch.Branch_no)) '+
		'  ON Customer.Customer = Customer_Branch.Customer) '+
		'  ON Customer_Type.Customer_Type = Customer.Customer_Type '+
  'WHERE (int_sel.Int_Sel_Code = :int_Sel) '+
  'GROUP BY '+
    'Customer.Name, '+
    'Customer_Branch.Account_Code, '+
    'Int_Sel.Int_Sel_Code, '+
    'Int_Sel.Sel1, '+
    'Customer_Type.Description ';

function TWTRPCustTurnFrm.GetDetails: integer;
begin
  fixquery(True);

  with qryCustTurn do
  begin
    close;
    ParamByname('int_sel').AsInteger := iintselcode;
    Open;
    result := recordcount;
  end;
end;

procedure TWTRPCustTurnFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qckrpSalesByInv.PrinterSettings do
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

  repCst := 0.;
  RepSel := 0.;

  qrlblcost.enabled := not bTurnOffCosts;
  qrlblGPM1.enabled := not bTurnOffCosts;
  MarginQRLabel.Enabled := not bTurnOffCosts;
  qrlblGPMUp1.enabled := not bTurnOffCosts;
  qrlblGPMUp2.enabled := not bTurnOffCosts;
  TotCstQRLbl.Enabled := not bTurnOffCosts;
  qrlblrepcst.Enabled := not bTurnOffCosts;
  MargQrlbl.enabled := not bTurnOffCosts;
  Qrlblrepmrg.enabled := not bTurnOffCosts;
  qrlblMargperc.enabled := not bTurnOffCosts;
  qrlblrepperc.enabled := not bTurnOffCosts;

  if bTurnOffCosts then
    begin
      qrshpTotalLine.width := 85;
      qrshpTitleLine.width := 425;
      qrlblTitle.Alignment := taLeftJustify;
      qrlbldaterange.Alignment := taLeftJustify;
    end;
end;

procedure TWTRPCustTurnFrm.setSeqByCost(const Value: Boolean);
begin
  fSeqByCost := Value;
end;

procedure TWTRPCustTurnFrm.setSeqBySales(const Value: Boolean);
begin
  fSeqBySales := Value;
end;

procedure TWTRPCustTurnFrm.SetSeqByProfit(const Value: Boolean);
begin
  FSeqByProfit := Value;
end;

procedure TWTRPCustTurnFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalCost :real;
begin
  QRLblTotSell.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',qryCustTurnSel3.asfloat);
  lblDescription.caption := qryCustTurnName.asstring;
  rTotalCost := qryCustTurnSel4.asFloat;
  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);
  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qryCustTurnSel3.asfloat - qryCustTurnSel4.asfloat);
  QRLblMargPerc.Caption := formatfloat('##0%',qryCustTurnMargPerc.asfloat);
  repCst := RepCst + rTotalCost;
  repSel := RepSel + qryCustTurnSel3.AsFloat;
end;

procedure TWTRPCustTurnFrm.QryCustTurnCalcFields(DataSet: TDataSet);
begin
if (0.01 > qryCustTurnSel4.asfloat) and (qryCustTurnSel4.asfloat > -0.01) then
  QryCustTurnMargPerc.Asfloat := 100
else
  QryCustTurnMargPerc.Asfloat := (((QryCustTurnSel3.asfloat - QryCustTurnSel4.asfloat)*100)/qryCustTurnSel4.asfloat);
end;

procedure TWTRPCustTurnFrm.FixQuery(rep: Boolean);
begin
  qryCustTurn.DisableControls;
  try
    qryCustTurn.Close;
    qryCustTurn.SQL.Clear;
    qryCustTurn.SQL.text := BuildQueryString(rep);
    qryCustTurn.ParamByName('int_sel').AsInteger := iintSelCode;
    qryCustTurn.Open;
  finally
    qryCustTurn.EnableControls;
  end;
end;

function TWTRPCustTurnFrm.BuildQueryString(rep: Boolean): string;
var
stemp : string;
begin
{rebuilds the query string depending on the sort selections}
  sTemp := 'Select ';
  if noofcust > 0 then
    sTemp := sTemp + 'Top '+intToStr(noofcust)+' ';
  sTemp := sTemp + SQLCore;
  if SeqBySales then
    sTemp := sTemp + 'Order by Sel3';
  if SeqByCost then
    sTemp := sTemp + 'Order by Sel4';
  if SeqByProfit then
    sTemp := stemp + 'Order By Sel10';
  if seqByMargPerc then
    sTemp := sTemp +'Order by Sel11';
  if seqByName then
    sTemp := sTemp +'Order by Customer.Name';
  if Orderasc then
    sTemp := stemp + ' asc'
  else
    sTemp := sTemp + ' Desc';
    Result := sTemp ;
end;

procedure TWTRPCustTurnFrm.SetSeqByMargPerc(const Value: Boolean);
begin
  fSeqByMargPerc := Value;
end;

procedure TWTRPCustTurnFrm.SetOrderasc(const Value: Boolean);
begin
  fOrderasc := Value;
end;

procedure TWTRPCustTurnFrm.setNoofCust(const Value: integer);
begin
  fnoofcust := Value;
end;

procedure TWTRPCustTurnFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
RepMrgPerc : real;
begin
  QRLblRepSel.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepSel);
  QrLblRepCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepCst);
  QRLblRepMrg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepSel - RepCst);
  if RepCst = 0 then
  RepMrgPerc := 100
else
  RepMrgPerc := (((RepSel - RepCst)*100)/RepCst);

  QRLblRepPerc.Caption := formatfloat('##0%',RepMrgPerc);
end;

procedure TWTRPCustTurnFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
RepCst := 0.;
RepSel := 0.;
end;

procedure TWTRPCustTurnFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
        + ',"Account Code"'
        + ',"Customer Type"'
        + ',"Sales"'
        + ',"Cost"'
        + ',"Margin"'
        + ',"Margin %"';

  writeLn(self.exportFile, tempStr);

  qckrpSalesByInv.Prepare;

  CloseFile(self.exportFile);
end;

procedure TWTRPCustTurnFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  if exporting then
    begin
      tempStr := '"' + lblDescription.caption + '"';
      tempStr := tempStr + ',"' + qryCustTurn.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + qryCustTurn.fieldbyname('Customer_Type_Name').asstring + '"';
      tempStr := tempStr + ',"' + qrlblTotSell.caption + '"';
      tempStr := tempStr + ',"' + totCstQRLbl.caption + '"';
      tempStr := tempStr + ',"' + MargQRlbl.caption + '"';
      tempStr := tempStr + ',"' + QRLblMargPerc.caption + '"';
      writeln(self.exportFile, tempStr);
      PBRSCustTurnFrm.prgbrExport.StepIt;
    end;
end;

procedure TWTRPCustTurnFrm.SetSeqbyName(const Value: boolean);
begin
  FSeqbyName := Value;
end;

end.
