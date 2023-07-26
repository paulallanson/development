unit PBRSPEndRepsCommission;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, ExtCtrls, Db, ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPEndRepsCommissionFrm = class(TForm)
    rgRep: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    lblYear: TLabel;
    dblkpFY: TDBLookupComboBox;
    dtsFY: TDataSource;
    qryFY: TFDQuery;
    qryCompany: TFDQuery;
    qryGetFYPeriods: TFDQuery;
    Label2: TLabel;
    dblkpPeriods: TDBLookupComboBox;
    rdgrpReportType: TRadioGroup;
    qryPeriods: TFDQuery;
    dtsPeriods: TDataSource;
    qrySalesComm: TFDQuery;
    ChkBxNewPgRep: TCheckBox;
    qryGetFY: TFDQuery;
    qryRepName: TFDQuery;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    ExcelBitBtn: TBitBtn;
    chkbxExcludeJBCosts: TCheckBox;
    rdgrpBudgetType: TRadioGroup;
    rdgrpRepType: TRadioGroup;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpTotalBy: TRadioGroup;
    procedure rgRepClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpFYClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure rdgrpReportTypeClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
  private
    FChanged: boolean;
    FinancialYear: integer;
    RepCode: integer;
    RepRadGrpCode: integer;
    FActivated: boolean;
    DateFrom, DateTo: TDateTime;
    iIntselcode: Integer;
    selrepcode: integer;
    selrepText: string;
    CategoryRpt: boolean;
    RepsCommOnPaidInvs: boolean;
    procedure CallCatReport(const bPreview: Boolean);
    procedure CallExcel(const bPreview: Boolean);
    procedure CallReport(const bPreview: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure FixQuery(rep: Boolean);
    procedure SetToAndFromDates;
    procedure GetPeriods;
    function GetFirstPeriod: integer;
  public
    { Public declarations }
  end;

var
  PBRSPEndRepsCommissionFrm: TPBRSPEndRepsCommissionFrm;

implementation

uses PBLURep, PBDatabase, CCSPrint, CCSCommon, PBRPPEndRepsCatComm,
  pbMainMenu, PBRPPEndSalesComm;

{$R *.DFM}
const
  SQLCoreSummary =
  'SELECT 	Sales_profit.Rep, '+
	' Rep.Name,                 '+
	'  Sales_Profit.Period,     '+
	'  Sales_profit.Category,   '+
	'  Category.Description,    '+
	'  Sales_Invoice.Invoice_or_Credit, '+
	'  Period.Financial_Year,           '+
	'  sum(Total_sales_Value) as Total_Sales, '+
	'  sum(Total_Cost_Value) as Total_Cost,   '+
	'  count(Sales_Profit.sales_invoice) as invoice_count '+
  'FROM Job_Bag_Line_Dets '+
	'	RIGHT JOIN (Category '+
	'	RIGHT JOIN (Sales_Invoice '+
	'	INNER JOIN (Rep '+
	'	INNER JOIN (Period '+
	'	INNER JOIN Sales_profit '+
	'		ON Period.Period = Sales_profit.Period) '+
	'		ON Rep.Rep = Sales_profit.Rep) '+
	'		ON Sales_Invoice.Sales_Invoice = Sales_profit.Sales_Invoice) '+
	'		ON Category.Category = Sales_profit.Category) '+
	'		ON (Job_Bag_Line_Dets.Job_Bag_Line = Sales_profit.Job_Bag_line) AND (Job_Bag_Line_Dets.Job_Bag = Sales_profit.Job_Bag) ';

  SQLCoreSummarySubRep =
  'SELECT 	Sales_profit.Sub_Rep as Rep, '+
	' Rep.Name,                 '+
	'  Sales_Profit.Period,     '+
	'  Sales_profit.Category,   '+
	'  Category.Description,    '+
	'  Sales_Invoice.Invoice_or_Credit, '+
	'  Period.Financial_Year,           '+
	'  sum(Total_sales_Value) as Total_Sales, '+
	'  sum(Total_Cost_Value) as Total_Cost,   '+
	'  count(Sales_Profit.sales_invoice) as invoice_count '+
  'FROM Job_Bag_Line_Dets '+
	'	RIGHT JOIN (Category '+
	'	RIGHT JOIN (Sales_Invoice '+
	'	INNER JOIN (Rep '+
	'	INNER JOIN (Period '+
	'	INNER JOIN Sales_profit '+
	'		ON Period.Period = Sales_profit.Period) '+
	'		ON Rep.Rep = Sales_profit.Sub_Rep) '+
	'		ON Sales_Invoice.Sales_Invoice = Sales_profit.Sales_Invoice) '+
	'		ON Category.Category = Sales_profit.Category) '+
	'		ON (Job_Bag_Line_Dets.Job_Bag_Line = Sales_profit.Job_Bag_line) AND (Job_Bag_Line_Dets.Job_Bag = Sales_profit.Job_Bag) ';

  SQLCoreDetail =
  'SELECT 	Sales_profit.Rep, '+
	'  Rep.Name as Rep_Name,    '+
	'  Sales_Profit.Customer,   '+
	'  Sales_Profit.Branch_no,  '+
	'  Sales_profit.Category,   '+
	'  Sales_profit.Period,   '+
	'  Category.Description,    '+
	'  Sales_Invoice.Sales_Invoice_No,  '+
	'  Sales_Invoice.Invoice_or_Credit, '+
	'  Sales_Invoice.Invoice_Date,      '+
	'  Sales_Invoice.Paid_Date,         '+
	'  Sales_Invoice.Paid_Amount,       '+
	'  Sales_Invoice.Paid_Status,       '+
	'  Sales_Invoice.Reference,         '+
	'  Sales_Invoice.Invoice_Description,  '+
	'  Period.Financial_Year,              '+
	'  Customer_Branch.Account_Code,       '+
	'  Customer.Name,                      '+
	'  Total_Sales_Value,                  '+
	'  Total_Cost_Value,                    '+
  ' (SELECT Reps_Branches.Percentage '+
  '   FROM Reps_Branches '+
  ' WHERE Reps_Branches.customer = sales_invoice.customer and '+
  '       Reps_Branches.branch_no = sales_invoice.branch_no and '+
  '       Reps_Branches.rep = sales_invoice.rep) AS Rep_Responsibility '+
  'FROM Job_Bag_Line_Dets '+
	'	RIGHT JOIN (Category '+
	'	RIGHT JOIN (Customer '+
	'	INNER JOIN (Sales_Invoice '+
	'	RIGHT JOIN (Rep '+
	'	INNER JOIN (Period '+
	'	INNER JOIN (Customer_Branch '+
	'	INNER JOIN Sales_profit '+
	'		ON (Customer_Branch.Branch_no = Sales_profit.Branch_no0) '+
	'							AND (Customer_Branch.Customer = Sales_profit.Customer)) '+
	'		ON Period.Period = Sales_profit.Period) '+
	'		ON Rep.Rep = Sales_profit.Rep) '+
	'		ON Sales_Invoice.Sales_Invoice = Sales_profit.Sales_Invoice) '+
	'		ON Customer.Customer = Customer_Branch.Customer) '+
	'		ON Category.Category = Sales_profit.Category) '+
	'		ON (Job_Bag_Line_Dets.Job_Bag_Line = Sales_profit.Job_Bag_line) '+
	'							AND (Job_Bag_Line_Dets.Job_Bag = Sales_profit.Job_Bag) ';

  SQLCoreDetailSubRep =
  'SELECT 	Sales_profit.Sub_Rep as Rep, '+
	'  Rep.Name as Rep_Name,    '+
	'  Sales_Profit.Customer,   '+
	'  Sales_Profit.Branch_no,  '+
	'  Sales_profit.Category,   '+
	'  Sales_profit.Period,   '+
	'  Category.Description,    '+
	'  Sales_Invoice.Sales_Invoice_No,  '+
	'  Sales_Invoice.Invoice_or_Credit, '+
	'  Sales_Invoice.Invoice_Date,      '+
	'  Sales_Invoice.Paid_Date,         '+
	'  Sales_Invoice.Paid_Amount,       '+
	'  Sales_Invoice.Paid_Status,       '+
	'  Sales_Invoice.Reference,         '+
	'  Sales_Invoice.Invoice_Description,  '+
	'  Period.Financial_Year,              '+
	'  Customer_Branch.Account_Code,       '+
	'  Customer.Name,                      '+
	'  Total_Sales_Value,                  '+
	'  Total_Cost_Value,                    '+
  ' (SELECT Reps_Branches.Percentage '+
  '   FROM Reps_Branches '+
  ' WHERE Reps_Branches.customer = sales_invoice.customer and '+
  '       Reps_Branches.branch_no = sales_invoice.branch_no and '+
  '       Reps_Branches.rep = sales_invoice.Sub_rep) AS Rep_Responsibility '+
  'FROM Job_Bag_Line_Dets '+
	'	RIGHT JOIN (Category '+
	'	RIGHT JOIN (Customer '+
	'	INNER JOIN (Sales_Invoice '+
	'	RIGHT JOIN (Rep '+
	'	INNER JOIN (Period '+
	'	INNER JOIN (Customer_Branch '+
	'	INNER JOIN Sales_profit '+
	'		ON (Customer_Branch.Branch_no = Sales_profit.Branch_no0) '+
	'							AND (Customer_Branch.Customer = Sales_profit.Customer)) '+
	'		ON Period.Period = Sales_profit.Period) '+
	'		ON Rep.Rep = Sales_profit.Sub_Rep) '+
	'		ON Sales_Invoice.Sales_Invoice = Sales_profit.Sales_Invoice) '+
	'		ON Customer.Customer = Customer_Branch.Customer) '+
	'		ON Category.Category = Sales_profit.Category) '+
	'		ON (Job_Bag_Line_Dets.Job_Bag_Line = Sales_profit.Job_Bag_line) '+
	'							AND (Job_Bag_Line_Dets.Job_Bag = Sales_profit.Job_Bag) ';

procedure TPBRSPEndRepsCommissionFrm.rgRepClick(Sender: TObject);
begin
{hide rep selection edit box all rep selected and re-formulate query if anything changes}
  if (rgRep.ItemIndex = 0) then
  begin
    pnlRepSearch.Visible := False;
    EdtRep.Text := '';
  end
  else
  begin
    pnlRepSearch.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSPEndRepsCommissionFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryFY.Active := false;
      qryFY.Active := true;

      dblkpFY.keyvalue := dmBroker.GetCurrentYear;

      GetPeriods;
      FActivated := true;
    end;
  enablePrint(self);
end;

procedure TPBRSPEndRepsCommissionFrm.btnRepClick(Sender: TObject);
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
  enableprint(self);
end;

procedure TPBRSPEndRepsCommissionFrm.EnablePrint(Sender: TObject);
begin
  if (rgRep.itemindex = 0) and (dblkpFY.keyvalue <> 0) then
    PrintBitBtn.enabled := true
  else
    PrintBitBtn.enabled :=  (edtRep.Text <> '') and
                            (dblkpFY.keyvalue <> 0);

  previewbitbtn.enabled := PrintBitbtn.enabled;
  Excelbitbtn.enabled := PrintBitbtn.enabled;
end;

procedure TPBRSPEndRepsCommissionFrm.FixQuery(rep: Boolean);
begin
  qrySalesComm.DisableControls;
  try
    qrySalesComm.Close;
    qrySalesComm.SQL.Clear;
    qrySalesComm.SQL.text := BuildQueryString(rep);
  finally
    qrySalesComm.EnableControls;
  end;
end;

function TPBRSPEndRepsCommissionFrm.GetFirstPeriod: integer;
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

procedure TPBRSPEndRepsCommissionFrm.CallCatReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;

  fixquery(True);

  PBRPPEndRepsCatCommFrm := TPBRPPEndRepsCatCommFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndRepsCatCommFrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPPEndRepsCatCommFrm.qrySalesComm.SQL.Clear;
          PBRPPEndRepsCatCommFrm.TotalByRep := True;
          PBRPPEndRepsCatCommFrm.FinancialYear := dblkpFY.keyvalue;
          PBRPPEndRepsCatCommFrm.commbyCat := true;
          PBRPPEndRepsCatCommFrm.isSummary := RdGrpReportType.ItemIndex = 0;
          PBRPPEndRepsCatCommFrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
          if (ChkBxNewPgRep.checked) and (chkBxNewPgRep.visible) then
            PBRPPEndRepsCatCommFrm.RepPgBrk := true   ;
         if RdGrpReportType.ItemIndex = 1 then
            PBRPPEndRepsCatCommFrm.qrlblTitle.caption := PBRPPEndRepsCatCommFrm.qrlblTitle.caption +' - Summary by Category - Run Date '+ DateToStr(Date)
          else
            PBRPPEndRepsCatCommFrm.qrlblTitle.caption := PBRPPEndRepsCatCommFrm.qrlblTitle.caption +' - Detailed by Category - Run Date '+ DateToStr(Date);

          PBRPPEndRepsCatCommFrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;
          if self.RepsCommOnPaidInvs then
          begin
            PBRPPEndRepsCatCommFrm.qrlblDateRange.caption :=
              PBRPPEndRepsCatCommFrm.qrlblDateRange.caption + dblkpPeriods.text;
          end
          else
          begin
            PBRPPEndRepsCatCommFrm.qrlblDateRange.caption :=
              'For Invoices Dated : ' + dblkpPeriods.text;
          end;

          if bPreview then
            PBRPPEndRepsCatCommFrm.qckrpSalesByInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPPEndRepsCatCommFrm.qckrpSalesByInv.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;
end;

procedure TPBRSPEndRepsCommissionFrm.SetToAndFromDates;
begin
end;

procedure TPBRSPEndRepsCommissionFrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  CallReport(True)
end;

procedure TPBRSPEndRepsCommissionFrm.PrintBitBtnClick(Sender: TObject);
begin
  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  CallReport(False)
end;

function TPBRSPEndRepsCommissionFrm.BuildQueryString(rep: Boolean): string;
var
  sTemp : string;
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
  if rdgrpRepType.ItemIndex = 0 then
    sTemp := SQLCoreDetail
  else
    sTemp := SQLCoreDetailSubRep;

  sTemp := sTemp + ' WHERE Sales_Profit.Period >= '+ inttostr(dblkpPeriods.KeyValue);
  sTemp := sTemp + ' AND Sales_Profit.Period <= ' + inttostr(dblkpPeriods.KeyValue);

  if (edtRep.Text <> '') then
  begin
    if rdgrpRepType.ItemIndex = 0 then
      sTemp := sTemp + ' AND Sales_Profit.Rep = ' + IntToStr(SelRepCode) + ' '
    else
      sTemp := sTemp + ' AND Sales_Profit.Sub_Rep = ' + IntToStr(SelRepCode) + ' ';
  end;

  {decide whether to exclude job bag costs}
  if chkbxExcludeJBCosts.checked then
    sTemp := sTemp + ' AND ((Job_Bag_Line_Dets.Line_Is_Internal_Cost = ''N'') OR (Job_Bag_Line_Dets.Line_Is_Internal_Cost IS NULL)) ';

  if rdgrpReportType.itemindex = 0 then
    sTemp := sTemp + ' ORDER BY Rep.Name, Category.Description '
  else
    begin
      if rdgrpTotalBy.itemindex = 0 then
        sTemp := sTemp + ' ORDER BY Rep.Name, Customer.Name, Sales_invoice.Sales_Invoice_no '
      else
      if rdgrpTotalBy.itemindex = 1 then
        sTemp := sTemp + ' ORDER BY Rep.Name, Category.Description, Sales_invoice.Sales_Invoice_no '
      else
        sTemp := sTemp + ' ORDER BY Rep.Name, Sales_invoice.Sales_Invoice_no ';
    end;

  Result := sTemp;
end;


procedure TPBRSPEndRepsCommissionFrm.FormCreate(Sender: TObject);
begin
  RepsCommOnPaidInvs := false;
  FChanged := true;
  FinancialYear := 0;

  If dmBroker.iAccCtrlMenu = 4 then
    begin
      btnRep.enabled := false;
      selRepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      rgRep.ItemIndex := 1;
      rgRep.Enabled := false;
      chkbxNewpgRep.Enabled := false;
      with qryRepName do
      begin
        close;
        paramByName('Sel_rep').asInteger := selrepcode;
        open;
        if not eof then
          edtRep.Text := qryRepName.fieldByName('Name').asString;
      end;
     end
  else
    begin
      selRepCode := 0 ;
      btnRep.enabled := True;
    end;

end;

procedure TPBRSPEndRepsCommissionFrm.dblkpFYClick(Sender: TObject);
begin
  GetPeriods;
  EnablePrint(self);
end;

procedure TPBRSPEndRepsCommissionFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSPEndRepsCommissionFrm.GetPeriods;
begin
  with qryPeriods do
    begin
      close;
      open;
    end;
  dblkpPeriods.KeyValue := dmBroker.GetCurrentPeriod - 1;  
end;

procedure TPBRSPEndRepsCommissionFrm.rdgrpReportTypeClick(Sender: TObject);
begin
  enableprint(self);
end;

procedure TPBRSPEndRepsCommissionFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;

  fixquery(True);

  if dmBroker.GetFYCommissionType(dblkpFY.keyvalue) = 'C' then
  begin
    CallCatReport(bPreview);
    exit;
  end;

  PBRPPEndSalesCommFrm := TPBRPPEndSalesCommFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndSalesCommFrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPPEndSalesCommFrm.qrySalesComm.SQL.Clear;
          PBRPPEndSalesCommFrm.TotalByRep := True;

          case rdgrpTotalBy.itemindex of
            0: PBRPPEndSalesCommFrm.TotalByCust := true;
            1: PBRPPEndSalesCommFrm.TotalByCategory := true;
          else
            begin
              PBRPPEndSalesCommFrm.TotalByCust := false;
              PBRPPEndSalesCommFrm.TotalByCategory := false;
            end;
          end;
          
          PBRPPEndSalesCommFrm.FinancialYear := dblkpFY.keyvalue;
//          PBRPPEndSalesCommFrm.commbyCat := rdgrpCommType.ItemIndex = 1;
          PBRPPEndSalesCommFrm.isSummary := RdGrpReportType.ItemIndex = 0;
          PBRPPEndSalesCommFrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;
          PBRPPEndSalesCommFrm.BudgetType := rdgrpBudgetType.itemindex;
          PBRPPEndSalesCommFrm.RepType := rdgrpRepType.itemindex;
          PBRPPEndSalesCommFrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
          if (ChkBxNewPgRep.checked) and (chkBxNewPgRep.visible) then
            PBRPPEndSalesCommFrm.RepPgBrk := true   ;
          if RdGrpReportType.ItemIndex = 1 then
            PBRPPEndSalesCommFrm.qrlblTitle.caption := PBRPPEndSalesCommFrm.qrlblTitle.caption
          else
            PBRPPEndSalesCommFrm.qrlblTitle.caption := PBRPPEndSalesCommFrm.qrlblTitle.caption +' - Summary';

          PBRPPEndSalesCommFrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;
          if self.RepsCommOnPaidInvs then
          begin
            PBRPPEndSalesCommFrm.qrlblDateRange.caption :=
              PBRPPEndSalesCommFrm.qrlblDateRange.caption + dblkpPeriods.text;
          end
          else
          begin
            PBRPPEndSalesCommFrm.qrlblDateRange.caption :=
              'For Invoices Dated from: ' + dblkpPeriods.text;;
          end;

          if bPreview then
            PBRPPEndSalesCommFrm.qckrpSalesByInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPPEndSalesCommFrm.qckrpSalesByInv.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;


end;

procedure TPBRSPEndRepsCommissionFrm.ExcelBitBtnClick(Sender: TObject);
begin
  qrySalesComm.Close;

  fixquery(True);

  if dmBroker.GetFYCommissionType(dblkpFY.keyvalue) = 'C' then
    begin
      CallCatReport(false);
      exit;
    end
  else
    CallExcel(false);
end;

procedure TPBRSPEndRepsCommissionFrm.CallExcel(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  PBRPPEndSalesCommFrm := TPBRPPEndSalesCommFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndSalesCommFrm.PrinterSettings := PrinterSettings;
      PBRPPEndSalesCommFrm.qrySalesComm.SQL.Clear;
      PBRPPEndSalesCommFrm.TotalByRep := True;

      case rdgrpTotalBy.itemindex of
        0: PBRPPEndSalesCommFrm.TotalByCust := true;
        1: PBRPPEndSalesCommFrm.TotalByCategory := true;
      else
        begin
          PBRPPEndSalesCommFrm.TotalByCust := false;
          PBRPPEndSalesCommFrm.TotalByCategory := false;
        end;
      end;

      PBRPPEndSalesCommFrm.FinancialYear := dblkpFY.keyvalue;
      PBRPPEndSalesCommFrm.isSummary := RdGrpReportType.ItemIndex = 0;
      PBRPPEndSalesCommFrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;
      PBRPPEndSalesCommFrm.BudgetType := rdgrpBudgetType.itemindex;
      PBRPPEndSalesCommFrm.RepType := rdgrpRepType.itemindex;
      PBRPPEndSalesCommFrm.qrySalesComm.SQL.Text := qrySalesComm.Text;

      PBRPPEndSalesCommFrm.RepsCommOnPaidInvs := RepsCommOnPaidInvs;

      tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      PBRPPEndSalesCommFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;

      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    finally
      PrinterSettings.Free;
      PBRPPEndSalesCommFrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

end.
