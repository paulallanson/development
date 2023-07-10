unit PBRSPEndRepsProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DateSelV5, PBPOObjects, Db, DBTables, Printers, CCSPrint,
  DBCtrls, ExtCtrls, OleCtnrs, ComCtrls;

type
  TPBRSPEndRepsProfitFrm = class(TForm)
    qrySalesProfit: TQuery;
    qryPeriods: TQuery;
    dtsPeriods: TDataSource;
    pnlButtons: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    pnlReportSelect: TPanel;
    rdgrpReportType: TRadioGroup;
    Label2: TLabel;
    dblkpPeriods: TDBLookupComboBox;
    Label3: TLabel;
    dblkpFY: TDBLookupComboBox;
    qryFY: TQuery;
    dtsFY: TDataSource;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    rdgrpSortBy: TRadioGroup;
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure rdgrpReportTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
    function BuildAccTeamString(rep: Boolean): string;
    function BuildQueryString(rep: Boolean): string;
    procedure CallSummaryReport(const bPreview: Boolean);
    procedure CallReport(const bPreview: Boolean);
    procedure FixQuery(rep: Boolean);
    procedure GetPeriods;
    procedure CallCustSummReport(const bPreview: boolean);
    procedure CallExport;
    procedure CallSummaryExport;
  public
    { Public declarations }
  end;

var
  PBRSPEndRepsProfitFrm: TPBRSPEndRepsProfitFrm;

implementation

uses PBLURep, PBRPSalesProfitSumm, PBLUCust, PBRPSalesProfit, PBRPRepProfitSumm,
      PBRPCustProfitSumm, pbDatabase, pbMainMenu, CCSCommon;

{$R *.DFM}

const
  SQLAccTeamSummary =
  'SELECT '+
  '   Sales_profit.Account_Team, '+
  '   Account_Team.Account_Team_Name as Team_Name, '+
	'   sum(Total_Cost_Value) as Cost_Value, '+
	'   sum(Total_Sales_Value) as Sales_Value, '+
	'   Period '+
  'FROM Account_Team RIGHT JOIN Sales_profit ON Account_Team.Account_Team = Sales_profit.Account_Team '+
  'GROUP BY '+
  '   Sales_profit.Account_Team, '+
  '   Account_Team.Account_Team_Name, '+
	'   Period ';

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

  SQLAccTeamCore =
  'SELECT '+
  'Sales_Profit.Period, '+
  'Sales_profit.Account_Team, '+
	'Account_Team.Account_Team_Name, '+
	'Sales_profit.Purchase_order, '+
	'Sales_profit.Line, '+
  'Sales_Profit.Sales_order, '+
	'Customer.Name as Customer_Name, '+
	'Supplier.Name as Supplier_Name, '+
	'sum(Total_Sales_Value) as Sales_Value, '+
	'sum(Total_Cost_Value) as Cost_Value, '+
  'Job_Bag '+
  'FROM Customer '+
	'INNER JOIN (Account_Team '+
	'RIGHT JOIN (Supplier '+
	'INNER JOIN (Supplier_Branch '+
	'INNER JOIN (Customer_Branch '+
	'INNER JOIN (Rep '+
	'INNER JOIN sales_profit '+
	'	ON Rep.Rep = sales_profit.Rep) '+
	'	ON (Customer_Branch.Branch_no = sales_profit.Branch_no0) '+
	'		AND (Customer_Branch.Customer = sales_profit.Customer)) '+
	'	ON (Supplier_Branch.Branch_no = sales_profit.Branch_no) '+
	'		AND (Supplier_Branch.Supplier = sales_profit.Supplier)) '+
	'	ON (sales_profit.Supplier = Supplier.Supplier) '+
	'		AND (Supplier.Supplier = Supplier_Branch.Supplier)) '+
	'	ON Account_Team.Account_Team = sales_profit.Account_Team) '+
	'	ON (sales_profit.Customer = Customer.Customer) '+
	'		AND (Customer.Customer = Customer_Branch.Customer) '+
  'GROUP BY sales_profit.Period, '+
	'   Sales_Profit.Account_Team, '+
	'   Account_Team.Account_Team_Name, '+
	'  sales_profit.Purchase_Order, '+
	'  sales_profit.Line, '+
	' sales_profit.Sales_Order, '+
	' Customer.Name, '+
	' Supplier.Name, '+
	' sales_profit.Job_Bag ';

procedure TPBRSPEndRepsProfitFrm.btnPrintClick(Sender: TObject);
begin
  if rdgrpReportType.itemindex = 0 then
    CallSummaryReport(False)
  else
    if rdgrpReportType.itemindex = 1 then
      CallReport(False);
end;

procedure TPBRSPEndRepsProfitFrm.btnPreviewClick(Sender: TObject);
begin
  if rdgrpReportType.itemindex = 0 then
    CallSummaryReport(True)
  else
    if rdgrpReportType.itemindex = 1 then
      CallReport(True);
end;

procedure TPBRSPEndRepsProfitFrm.CallSummaryReport(const bPreview: Boolean);
var
  PBRPSalesProfitSummFrm: TPBRPSalesProfitSummFrm;
  PrinterSettings: TPrinterSettings;
begin
  qrySalesProfit.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPSalesProfitSummfrm := TPBRPSalesProfitSummfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesProfitSummfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPSalesProfitSummfrm.qrySalesProfit.SQL.Clear;

          case rdgrpSortby.itemindex of
            0:  begin
                  PBRPSalesProfitSummfrm.TotalByRep := True;
                  PBRPSalesProfitSummfrm.TotalByAccTeam := false;
                  PBRPSalesProfitSummfrm.qrlblTitle.caption := 'Reps '+ PBRPSalesProfitSummfrm.qrlblTitle.caption;
                end;
            1:  begin
                  PBRPSalesProfitSummfrm.TotalByRep := false;
                  PBRPSalesProfitSummfrm.TotalByAccTeam := True;
                  PBRPSalesProfitSummfrm.qrlblTitle.caption := 'Account Teams '+PBRPSalesProfitSummfrm.qrlblTitle.caption;
                end;
          end;

          PBRPSalesProfitSummfrm.qrySalesProfit.SQL.Text := qrySalesProfit.Text;
          PBRPSalesProfitSummfrm.qrlblDateRange.caption :=
            PBRPSalesProfitSummfrm.qrlblDateRange.caption + dblkpperiods.text;
          if bPreview then
            PBRPSalesProfitSummfrm.qrpDetails.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSalesProfitSummfrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesProfit.Open;
  end;

end;

procedure TPBRSPEndRepsProfitFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesProfitFrm: TPBRPSalesProfitFrm;
  PrinterSettings: TPrinterSettings;
begin
  qrySalesProfit.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPSalesProfitfrm := TPBRPSalesProfitfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesProfitfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPSalesProfitfrm.qrySalesProfit.SQL.Clear;

          case rdgrpSortby.itemindex of
            0:  begin
                  PBRPSalesProfitfrm.TotalByRep := True;
                  PBRPSalesProfitfrm.TotalByAccTeam := false;
                  PBRPSalesProfitfrm.qrlblTitle.caption := 'Reps '+ PBRPSalesProfitfrm.qrlblTitle.caption;
                end;
            1:  begin
                  PBRPSalesProfitfrm.TotalByRep := false;
                  PBRPSalesProfitfrm.TotalByAccTeam := True;
                  PBRPSalesProfitfrm.qrlblTitle.caption := 'Account Teams '+PBRPSalesProfitfrm.qrlblTitle.caption;
                end;
          end;

          PBRPSalesProfitfrm.qrySalesProfit.SQL.Text := qrySalesProfit.Text;
          PBRPSalesProfitfrm.qrlblTitle.caption := PBRPSalesProfitfrm.qrlblTitle.caption + DateToStr(Date);
          PBRPSalesProfitfrm.qrlblDateRange.caption :=
            PBRPSalesProfitfrm.qrlblDateRange.caption + dblkpperiods.text;
          if bPreview then
            PBRPSalesProfitfrm.qrpDetails.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSalesProfitfrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesProfit.Open;
  end;

end;

procedure TPBRSPEndRepsProfitFrm.FixQuery(rep: Boolean);
begin
  qrySalesProfit.DisableControls;
  try
    qrySalesProfit.Close;
    qrySalesProfit.SQL.Clear;
    case rdgrpSortBy.itemindex of
      0: qrySalesProfit.SQL.text := BuildQueryString(rep);
      1: qrySalesProfit.SQL.Text := BuildAccTeamString(rep);
    end;
    qrySalesProfit.Open;
  finally
    qrySalesProfit.EnableControls;
  end;
end;

function TPBRSPEndRepsProfitFrm.BuildQueryString(rep: Boolean): string;
var
  stemp: string;
begin
  {rebuilds the query string depending on the sort selections}
  if rdgrpReportType.itemindex = 0 then
    sTemp := SQLCoreSummary
  else
    sTemp := SQLCore;

  sTemp := sTemp + 'HAVING Sales_Profit.Period = ' + inttostr(dblkpPeriods.keyvalue) + ' ';
  sTemp := sTemp + 'ORDER BY Rep.Name ';

  Result := sTemp;
end;

function TPBRSPEndRepsProfitFrm.BuildAccTeamString(rep: Boolean): string;
var
  stemp: string;
begin
  {rebuilds the query string depending on the sort selections}
  if rdgrpReportType.itemindex = 0 then
    sTemp := SQLAccTeamSummary
  else
    sTemp := SQLAccTeamCore;

  sTemp := sTemp + 'HAVING Sales_Profit.Period = ' + inttostr(dblkpPeriods.keyvalue) + ' ';
  sTemp := sTemp + 'ORDER BY Account_Team_Name ';

  Result := sTemp;
end;

procedure TPBRSPEndRepsProfitFrm.GetPeriods;
begin
  with qryPeriods do
    begin
      close;
      open;
    end;
  dblkpPeriods.KeyValue := dmBroker.GetCurrentPeriod - 1;
end;

procedure TPBRSPEndRepsProfitFrm.EnableOK(Sender: TObject);
begin
  btnPreview.enabled := (dblkpFY.text <> '') and
                        (dblkpPeriods.keyvalue <> 0);
  btnPrint.enabled := btnPreview.enabled;
  btnExcel.enabled := btnPreview.enabled;
end;

procedure TPBRSPEndRepsProfitFrm.rdgrpReportTypeClick(Sender: TObject);
begin
  EnableOK(self);
end;

procedure TPBRSPEndRepsProfitFrm.FormCreate(Sender: TObject);
begin
selrepcode := 0;
dblkpPeriods.keyvalue := 0;
end;

procedure TPBRSPEndRepsProfitFrm.CallCustSummReport(const bPreview: boolean);
begin
end;

procedure TPBRSPEndRepsProfitFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryFY.Active := false;
      qryFY.Active := true;

      dblkpFY.keyvalue := dmBroker.GetCurrentYear;

      GetPeriods;
      rdgrpReportTypeClick(self);

      FActivated := true;
    end;
end;

procedure TPBRSPEndRepsProfitFrm.dblkpFYClick(Sender: TObject);
begin
  GetPeriods;
end;

procedure TPBRSPEndRepsProfitFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSPEndRepsProfitFrm.btnExcelClick(Sender: TObject);
begin
  if rdgrpReportType.itemindex = 0 then
    CallSummaryExport
  else
    if rdgrpReportType.itemindex = 1 then
      CallExport;
end;

procedure TPBRSPEndRepsProfitFrm.CallExport;
var
  PBRPSalesProfitFrm: TPBRPSalesProfitFrm;
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  fixquery(True);

  PBRPSalesProfitfrm := TPBRPSalesProfitfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesProfitfrm.PrinterSettings := PrinterSettings;

      {this part copies the query and values from the report selection form to the report print form}
      PBRPSalesProfitfrm.qrySalesProfit.SQL.Clear;

      case rdgrpSortby.itemindex of
        0:
          begin
            PBRPSalesProfitfrm.TotalByRep := True;
            PBRPSalesProfitfrm.TotalByAccTeam := false;
            PBRPSalesProfitfrm.qrlblTitle.caption := 'Reps '+ PBRPSalesProfitfrm.qrlblTitle.caption;
          end;
        1:
          begin
            PBRPSalesProfitfrm.TotalByRep := false;
            PBRPSalesProfitfrm.TotalByAccTeam := True;
            PBRPSalesProfitfrm.qrlblTitle.caption := 'Account Teams '+PBRPSalesProfitfrm.qrlblTitle.caption;
          end;
      end;

      PBRPSalesProfitfrm.qrySalesProfit.SQL.Text := qrySalesProfit.Text;
      PBRPSalesProfitfrm.qrlblDateRange.caption :=
        PBRPSalesProfitfrm.qrlblDateRange.caption + dblkpperiods.text;
      PBRPSalesProfitfrm.PeriodName := dblkpPeriods.Text;

      reccount := PBRPSalesProfitfrm.GetDetails;

      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.Caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPSalesProfitfrm.ExportToFile(tempFileName);
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

procedure TPBRSPEndRepsProfitFrm.CallSummaryExport;
var
  PBRPSalesProfitSummFrm: TPBRPSalesProfitSummFrm;
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  fixquery(True);
  {add total order by clause to report query}

  PBRPSalesProfitSummfrm := TPBRPSalesProfitSummfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesProfitSummfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPSalesProfitSummfrm.qrySalesProfit.SQL.Clear;

      case rdgrpSortby.itemindex of
        0:  begin
              PBRPSalesProfitSummfrm.TotalByRep := True;
              PBRPSalesProfitSummfrm.TotalByAccTeam := false;
              PBRPSalesProfitSummfrm.qrlblTitle.caption := 'Reps '+ PBRPSalesProfitSummfrm.qrlblTitle.caption;
            end;
        1:  begin
              PBRPSalesProfitSummfrm.TotalByRep := false;
              PBRPSalesProfitSummfrm.TotalByAccTeam := True;
              PBRPSalesProfitSummfrm.qrlblTitle.caption := 'Account Teams '+PBRPSalesProfitSummfrm.qrlblTitle.caption;
            end;
      end;

      PBRPSalesProfitSummfrm.qrySalesProfit.SQL.Text := qrySalesProfit.Text;
      PBRPSalesProfitSummfrm.qrlblTitle.caption := PBRPSalesProfitSummfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPSalesProfitSummfrm.qrlblDateRange.caption :=
            PBRPSalesProfitSummfrm.qrlblDateRange.caption + dblkpperiods.text;
      PBRPSalesProfitSummfrm.PeriodName := dblkpPeriods.Text;

      reccount := PBRPSalesProfitSummfrm.GetDetails;

      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.Caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPSalesProfitSummfrm.ExportToFile(tempFileName);
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
