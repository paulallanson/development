unit PBRSPEndCustPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DateSelV5, PBPOObjects, Db, Printers, CCSPrint,
  DBCtrls, ExtCtrls, OleCtnrs, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPEndCustPerformFrm = class(TForm)
    qrySalesProfit: TFDQuery;
    pnlButtons: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    pnlReportSelect: TPanel;
    Label3: TLabel;
    edtCust: TEdit;
    btnLUCust: TButton;
    Label1: TLabel;
    dblkpFY: TDBLookupComboBox;
    qryFY: TFDQuery;
    dtsFY: TDataSource;
    qryGetFY: TFDQuery;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLUCustClick(Sender: TObject);
    procedure dblkpFYClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    FActivated: Boolean;
    SelRepCode: integer;
    SelRepText : string;
    SelCustCode: integer;
    SelCustText: string;
    StartPeriod: integer;
    function BuildQueryString(rep: Boolean): string;
    procedure FixQuery(rep: Boolean);
    procedure GetPeriods;
    procedure CallCustSummReport(const bPreview: boolean);
    function GetFirstPeriod: integer;
    function GetFirstPeriodName: string;
  public
    { Public declarations }
  end;

var
  PBRSPEndCustPerformFrm: TPBRSPEndCustPerformFrm;

implementation

uses PBLURep, PBRPSalesProfitSumm, PBLUCust, PBRPSalesProfit, PBRPRepProfitSumm,
      PBRPCustProfitSumm, pbDatabase, pbMainMenu, CCSCommon;

{$R *.DFM}

const
  SQLCoreSummary =
  'Select '+
  '   Sales_profit.Rep, '+
  '   Rep.Name as Rep_Name, '+
	'   sum(Total_Cost_Value) as Cost_Value, '+
	'   sum(Total_Sales_Value) as Sales_Value, '+
	'   Period '+
  'FROM sales_profit, rep '+
  'WHERE Sales_Profit.rep = rep.rep '+
  'GROUP BY '+
  '   Sales_profit.Rep, '+
  '   Rep.Name, '+
	'   Period ';

  SQLCore =
  'SELECT '+
  'Sales_Profit.Period, '+
  'Sales_profit.rep, '+
	'rep.Name as Rep_Name, '+
	'Sales_profit.Purchase_order, '+
	'Sales_profit.Line, '+
  'Sales_Profit.Sales_order, '+
	'Customer.Name as Customer_Name, '+
	'Supplier.Name as Supplier_Name, '+
	'sum(Total_Sales_Value) as Sales_Value, '+
	'sum(Total_Cost_Value) as Cost_Value, '+
  'Job_Bag '+
  'from sales_profit, rep, Customer, Supplier '+
  'Where Sales_Profit.rep = rep.rep and '+
  '(Sales_profit.Customer = Customer.Customer) and '+
  '(Sales_profit.Supplier = Supplier.Supplier) '+
  'GROUP BY '+
  'Sales_Profit.Period, '+
	'sales_profit.rep, '+
	'rep.Name, '+
	'Sales_profit.Purchase_order, '+
	'Sales_profit.Line, '+
  'Sales_Profit.Sales_order, '+
	'Customer.Name, '+
	'Supplier.Name, '+
  'Job_Bag ';

procedure TPBRSPEndCustPerformFrm.btnPrintClick(Sender: TObject);
begin
  CallCustSummReport(false);
end;

procedure TPBRSPEndCustPerformFrm.btnPreviewClick(Sender: TObject);
begin
  CallCustSummReport(true);
end;


procedure TPBRSPEndCustPerformFrm.FixQuery(rep: Boolean);
begin
  qrySalesProfit.DisableControls;
  try
    qrySalesProfit.Close;
    qrySalesProfit.SQL.Clear;
    qrySalesProfit.SQL.text := BuildQueryString(rep);
    qrySalesProfit.Open;
  finally
    qrySalesProfit.EnableControls;
  end;
end;

function TPBRSPEndCustPerformFrm.BuildQueryString(rep: Boolean): string;
var
  stemp: string;
begin
  {rebuilds the query string depending on the sort selections}
  sTemp := SQLCore;

  sTemp := sTemp + 'HAVING Sales_Profit.Period = ' + inttostr(StartPeriod) + ' ';
  sTemp := sTemp + 'ORDER BY Rep.Name ';

  Result := sTemp;
end;

procedure TPBRSPEndCustPerformFrm.GetPeriods;
begin
(*  with qryPeriods do
    begin
      close;
      open;
    end;
  dblkpPeriods.KeyValue := dmBroker.GetCurrentPeriod - 1;
*)
end;

procedure TPBRSPEndCustPerformFrm.EnableOK(Sender: TObject);
begin
  btnPreview.enabled := (dblkpFY.text <> '') and
                        (edtCust.text <> '');
  btnPrint.enabled := btnPreview.enabled;
  btnExcel.enabled := btnPreview.enabled;
end;

procedure TPBRSPEndCustPerformFrm.FormCreate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryFY.Active := false;
      qryFY.Active := true;

      dblkpFY.keyvalue := dmBroker.GetCurrentYear;

      GetPeriods;

      FActivated := true;
    end;
end;

procedure TPBRSPEndCustPerformFrm.CallCustSummReport(const bPreview: boolean);
var
  PBRPCustProfitSummfrm: TPBRPCustProfitSummfrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPCustProfitSummfrm := TPBRPCustProfitSummfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPCustProfitSummfrm.PrinterSettings := PrinterSettings;
      PBRPCustProfitSummfrm.Cust := selCustcode;
      PBRPCustProfitSummfrm.selperiod := GetFirstPeriod;
      PBRPCustProfitSummfrm.GetDetails;
      PBRPCustProfitSummfrm.qrlblCustomer.Caption :=
        'Customer: ' + edtCust.Text;
      PBRPCustProfitSummfrm.qrlblTitle.caption := PBRPCustProfitSummfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPCustProfitSummfrm.qrlblDateRange.caption :=
        PBRPCustProfitSummfrm.qrlblDateRange.caption + GetFirstPeriodName;
      if bPreview then
        PBRPCustProfitSummfrm.qrpDetails.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          PBRPCustProfitSummfrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
  end;
end;

function TPBRSPEndCustPerformFrm.GetFirstPeriod: integer;
begin
  with qryGetFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := dblkpFY.keyvalue;
      open;
      first;
      result := fieldbyname('Period').asinteger;
    end;
end;

function TPBRSPEndCustPerformFrm.GetFirstPeriodName: string;
begin
  with qryGetFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := dblkpFY.keyvalue;
      open;
      first;
      result := fieldbyname('Description').asstring;
    end;
end;

procedure TPBRSPEndCustPerformFrm.btnLUCustClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustText := PBLUCustFrm.SelName;
    end;
    edtCust.Text := SelCustText;
  finally
    PBLUCustFrm.Free;
  end;
  enableok(self);
end;

procedure TPBRSPEndCustPerformFrm.dblkpFYClick(Sender: TObject);
begin
  GetPeriods;
end;

procedure TPBRSPEndCustPerformFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSPEndCustPerformFrm.btnExcelClick(Sender: TObject);
var
  PBRPCustProfitSummfrm: TPBRPCustProfitSummfrm;
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  PBRPCustProfitSummfrm := TPBRPCustProfitSummfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPCustProfitSummfrm.PrinterSettings := PrinterSettings;
      PBRPCustProfitSummfrm.Cust := selCustcode;
      PBRPCustProfitSummfrm.selperiod := GetFirstPeriod;
//      PBRPCustProfitSummfrm.GetDetails;
      PBRPCustProfitSummfrm.CustomerName := edtCust.Text;
      PBRPCustProfitSummfrm.qrlblCustomer.Caption :=
        'Customer: ' + edtCust.Text;
      PBRPCustProfitSummfrm.qrlblTitle.caption := PBRPCustProfitSummfrm.qrlblTitle.caption + PBDateStr(Date);
      PBRPCustProfitSummfrm.qrlblDateRange.caption :=
        PBRPCustProfitSummfrm.qrlblDateRange.caption + GetFirstPeriodName;

      reccount := PBRPCustProfitSummfrm.GetDetails;

      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.Caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPCustProfitSummfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
  end;

end;

end.
