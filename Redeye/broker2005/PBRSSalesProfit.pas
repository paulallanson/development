unit PBRSSalesProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DateSelV5, PBPOObjects, Db, Printers, CCSPrint,
  DBCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesProfitfrm = class(TForm)
    qrySalesProfit: TFDQuery;
    qryPeriods: TFDQuery;
    dtsPeriods: TDataSource;
    pnlButtons: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    pnlReportSelect: TPanel;
    rdgrpReportType: TRadioGroup;
    Label1: TLabel;
    cmbYear: TComboBox;
    Label2: TLabel;
    dblkpPeriods: TDBLookupComboBox;
    pnlRep: TPanel;
    rdgrpReps: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    pnlCust: TPanel;
    Label3: TLabel;
    edtCust: TEdit;
    btnLUCust: TButton;
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure cmbYearChange(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure cmbYearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure rdgrpRepsClick(Sender: TObject);
    procedure rdgrpReportTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLUCustClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    SelRepCode: integer;
    SelRepText : string;
    SelCustCode: integer;
    SelCustText: string;
    function BuildQueryString(rep: Boolean): string;
    procedure CallSummaryReport(const bPreview: Boolean);
    procedure CallReport(const bPreview: Boolean);
    procedure CallRepSummreport(const bPreview: Boolean);
    procedure FixQuery(rep: Boolean);
    procedure GetPeriods(tempYear: string);
    procedure LoadYearCombo;
    procedure CallCustSummReport(const bPreview: boolean);
  public
    { Public declarations }
  end;

var
  PBRSSalesProfitfrm: TPBRSSalesProfitfrm;

implementation

uses PBLURep, PBRPSalesProfitSumm, PBLUCust, PBRPSalesProfit, PBRPRepProfitSumm,
      PBRPCustProfitSumm, pbDatabase, pbMainMenu;

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

procedure TPBRSSalesProfitfrm.btnPrintClick(Sender: TObject);
begin
  if rdgrpReportType.itemindex = 0 then
    CallSummaryReport(False)
  else
    if rdgrpReportType.itemindex = 1 then
      CallReport(False)
    else
      if rdgrpReportType.itemindex = 2 then
        CallRepSummReport(False)
      else
        CallCustSummReport(false);
end;

procedure TPBRSSalesProfitfrm.btnPreviewClick(Sender: TObject);
begin
  if rdgrpReportType.itemindex = 0 then
    CallSummaryReport(True)
  else
  if rdgrpReportType.itemindex = 1 then
    CallReport(True)
  else
  if rdgrpReportType.itemindex = 2 then
    CallRepSummReport(True)
  else
    CallCustSummReport(true);
end;

procedure TPBRSSalesProfitfrm.CallSummaryReport(const bPreview: Boolean);
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

          PBRPSalesProfitSummfrm.TotalByRep := True;

          PBRPSalesProfitSummfrm.qrySalesProfit.SQL.Text := qrySalesProfit.Text;
          PBRPSalesProfitSummfrm.qrlblTitle.caption := PBRPSalesProfitSummfrm.qrlblTitle.caption + DateToStr(Date);
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
     PBRPSalesProfitSummfrm.Free;
  end;

end;

procedure TPBRSSalesProfitfrm.CallReport(const bPreview: Boolean);
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

          PBRPSalesProfitfrm.TotalByRep := True;

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
     PBRPSalesProfitfrm.Free;
     qrySalesProfit.Open;
  end;

end;

procedure TPBRSSalesProfitfrm.FixQuery(rep: Boolean);
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

function TPBRSSalesProfitfrm.BuildQueryString(rep: Boolean): string;
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

procedure TPBRSSalesProfitfrm.LoadYearCombo;
var
  Year, Month, Day: Word;
  i: integer;
begin
  decodedate(date,Year,Month,Day);
  for i := year+5 downto year-5 do
    begin
      cmbYear.items.add(inttostr(i));
      cmbYear.itemindex := cmbYear.items.indexof(inttostr(Year));
    end;
end;

procedure TPBRSSalesProfitfrm.GetPeriods(tempYear: string);
begin
  with qryPeriods do
    begin
      close;
      parambyname('Period_Year').asinteger := strtoint(TempYear);
      open;
    end;
end;

procedure TPBRSSalesProfitfrm.cmbYearChange(Sender: TObject);
begin
  enableok(self);
end;

procedure TPBRSSalesProfitfrm.EnableOK(Sender: TObject);
begin
  case rdgrpReportType.itemindex of
  0,1: btnPreview.enabled := (cmbYear.text <> '') and
                        (dblkpPeriods.keyvalue <> 0);
  2: begin
      if rdgrpreps.itemindex = 0 then
        btnPreview.enabled := (cmbYear.text <> '') and
                        (dblkpPeriods.keyvalue <> 0)
      else
        btnPreview.enabled := (cmbYear.text <> '') and
                        (dblkpPeriods.keyvalue <> 0) and
                        (edtRep.text <> '');
     end;
  3: begin
      btnPreview.enabled := (cmbYear.text <> '') and
                        (dblkpPeriods.keyvalue <> 0) and
                        (edtCust.text <> '');
     end;
  end;
  btnPrint.enabled := btnPreview.enabled;
end;

procedure TPBRSSalesProfitfrm.cmbYearClick(Sender: TObject);
begin
  GetPeriods(cmbYear.items[cmbYear.itemindex]);
end;

procedure TPBRSSalesProfitfrm.FormShow(Sender: TObject);
begin
  LoadYearCombo;
  cmbYearClick(self);
end;

procedure TPBRSSalesProfitfrm.CallRepSummreport(const bPreview: Boolean);
var
  PBRPRepProfitSummfrm: TPBRPRepProfitSummfrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPRepProfitSummfrm := TPBRPRepProfitSummfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPRepProfitSummfrm.PrinterSettings := PrinterSettings;
      PBRPRepProfitSummfrm.selrepcode := selrepcode;
      PBRPRepProfitSummfrm.selperiod := dblkpperiods.keyvalue;
      PBRPRepProfitSummFrm.GetDetails(Self);
      PBRPRepProfitSummfrm.qrlblTitle.caption := PBRPRepProfitSummfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPRepProfitSummfrm.qrlblDateRange.caption :=
      PBRPRepProfitSummfrm.qrlblDateRange.caption + dblkpperiods.text;
      if bPreview then
        PBRPRepProfitSummfrm.qckrpRpsPrft.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          PBRPRepProfitSummfrm.qckrpRpsPrft.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPRepProfitSummfrm.Free;
  end;
end;

procedure TPBRSSalesProfitfrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
  finally
    PBLURepFrm.Free;
  end;
  rdgrpRepsclick(self);
  enableok(self);
end;

procedure TPBRSSalesProfitfrm.rdgrpRepsClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpReps.itemIndex = 1;
  if PnlRepSearch.visible = False then
    begin
      selrepcode := 0;
      edtRep.text := '';
    end
  else
    begin
      btnpreview.enabled := edtrep.text <> '';
      btnprint.enabled := btnpreview.enabled;
    end;
  EnableOK(self);
end;

procedure TPBRSSalesProfitfrm.rdgrpReportTypeClick(Sender: TObject);
begin
 rdgrpReps.visible := rdgrpReportType.itemindex = 2;
 pnlRepSearch.visible := rdgrpReportType.itemindex = 2;
 if rdgrpReportType.itemindex >= 2 then
 begin
   width := 568;
   if rdgrpReportType.itemindex = 2 then
   begin
     self.pnlRep.BringToFront;
     rdgrpRepsClick(self);
   end
   else
   begin
     self.pnlCust.BringToFront;
   end;
 end
 else
 begin
   width := 296;
 end;


  if rdgrpReportType.itemindex >= 2 then
    label2.caption := 'Begin'
  else
    label2.caption := 'Period';
    
  EnableOK(self);
end;

procedure TPBRSSalesProfitfrm.FormCreate(Sender: TObject);
begin
selrepcode := 0;
dblkpPeriods.keyvalue := 0;
end;

procedure TPBRSSalesProfitfrm.CallCustSummReport(const bPreview: boolean);
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
      PBRPCustProfitSummfrm.selperiod := dblkpperiods.keyvalue;
      PBRPCustProfitSummfrm.GetDetails;
      PBRPCustProfitSummfrm.qrlblCustomer.Caption :=
        'Customer: ' + edtCust.Text;
      PBRPCustProfitSummfrm.qrlblTitle.caption := PBRPCustProfitSummfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPCustProfitSummfrm.qrlblDateRange.caption :=
        PBRPCustProfitSummfrm.qrlblDateRange.caption + dblkpperiods.text;
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
     PBRPCustProfitSummfrm.Free;
  end;
end;

procedure TPBRSSalesProfitfrm.btnLUCustClick(Sender: TObject);
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
  rdgrpRepsclick(self);
  enableok(self);
end;

procedure TPBRSSalesProfitfrm.FormActivate(Sender: TObject);
begin
  dmBroker.ScreenAccessControl(Self,'mnuPeriodEnd',frmPBMainMenu.iOperator,0,0) ;
  rdgrpReportTypeClick(self);
end;

end.
