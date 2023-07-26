unit PBRSPEndRepTeamPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, ExtCtrls, Db, ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPEndRepTeamPerformFrm = class(TForm)
    rgRep: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRepTeam: TEdit;
    btnRep: TButton;
    Label1: TLabel;
    dblkpFY: TDBLookupComboBox;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    dtsFY: TDataSource;
    qryFY: TFDQuery;
    qryCompany: TFDQuery;
    qryReport: TFDQuery;
    qryGetFYPeriods: TFDQuery;
    qryRepName: TFDQuery;
    chkbxExcludeJBCosts: TCheckBox;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    ExcelBitBtn: TBitBtn;
    rdgrpBudgetType: TRadioGroup;
    rdgrpReportType: TRadioGroup;
    procedure rgRepClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpFYClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
  private
    FChanged: boolean;
    FinancialYear: integer;
    RepCode: integer;
    RepRadGrpCode: integer;
    FActivated: boolean;
    DateFrom, DateTo: TDateTime;
    StartPeriod, FinishPeriod: integer;
    iIntselcode: Integer;
    selrepcode: integer;
    selrepText: string;
    CategoryRpt: boolean;
    procedure CallReport(const bPreview: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure FixQuery(rep: Boolean);
    procedure SetToAndFromDates;
  public
    { Public declarations }
  end;

var
  PBRSPEndRepTeamPerformFrm: TPBRSPEndRepTeamPerformFrm;

implementation

uses PBLURep, PBDatabase, CCSPrint, CCSCommon, PBRPPEndRepTeamPerform,
  pbMainMenu, PBLURepTeam;

{$R *.DFM}
const
  SQLCore =

  'SELECT DISTINCT Sales_Invoice.Rep, '+
	'Sales_Invoice.Sales_Invoice, '+
	'Sales_Invoice.Invoice_Date, '+
	'Sales_Invoice.Goods_Value, '+
	'Sales_Invoice.Invoice_or_Credit, '+
        'Sales_Invoice.Sales_Invoice_type, '+
	'Sales_Invoice.Reference, '+
	'Sales_Invoice_Line.Invoice_Line_No '+
  'FROM (Sales_Invoice '+
	'INNER JOIN Sales_Invoice_Line ON '+
		'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice)';

  SQLCorebyProd =
  'SELECT 	Sales_Invoice_Line.Sales_Invoice, '+
	' Sales_Invoice_Line.Invoice_Line_No, '+
	' Sales_Invoice_Line.Purchase_Order, '+
	' Sales_Invoice_Line.Line, '+
	' Sales_Invoice_Line.Qty_Invoiced, '+
	' Sales_Invoice_Line.Goods_Value, '+
	' Sales_Invoice_Line.Product_Type, '+
	' Sales_Invoice_Line.Price_Unit, '+
	' Sales_Invoice_Line.sales_Order, '+
	' Sales_Invoice_Line.Sales_Order_Line_no, '+
	' Sales_Invoice_Line.Job_Bag, '+
	' Sales_Invoice_Line.Job_Bag_Line, '+
	' Sales_Invoice_Line.Credit_type, '+
	' Sales_Invoice_Line.cost_price, '+
	' Sales_Invoice.Invoice_Date, '+
	' Sales_Invoice.Sales_Invoice_No, '+
	' Sales_Invoice.Invoice_or_Credit, '+
	' Sales_Invoice.Rep, '+
	' Sales_Invoice.Reference, '+
	' Sales_Invoice.Sales_Invoice_Type, '+
	' Product_Type.Product_Type, '+
	' Product_Type.Category, '+
	' Price_Unit.Price_Unit_Factor, '+
	' (select SUM(Amount) '+
	'   FROM Sales_invoice_add_charge '+
	'   WHERE sales_invoice_add_charge.sales_invoice =  '+
	'	        Sales_invoice.sales_invoice) as Invoice_Add_Charges '+
  ' FROM Price_Unit '+
	' INNER JOIN (Product_Type '+
	' RIGHT JOIN (Sales_Invoice '+
	' INNER JOIN Sales_Invoice_Line ON '+
	' Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
	' Product_Type.Product_Type = Sales_Invoice_Line.Product_Type) ON '+
	' Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit ';

procedure TPBRSPEndRepTeamPerformFrm.rgRepClick(Sender: TObject);
begin
{hide rep selection edit box all rep selected and re-formulate query if anything changes}
  if (rgRep.ItemIndex = 0) then
  begin
    pnlRepSearch.Visible := False;
    EdtRepTeam.Text := '';
  end
  else
  begin
    pnlRepSearch.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSPEndRepTeamPerformFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryCompany.Active := false;
      qryCompany.Active := true;

      qryFY.Active := false;
      qryFY.Active := true;

      dblkpFY.keyvalue := qryCompany.fieldbyname('Financial_Year').asinteger;
      FActivated := true;
    end;
  enablePrint(self);
end;

procedure TPBRSPEndRepTeamPerformFrm.btnRepClick(Sender: TObject);
begin
  PBLURepTeamFrm := TPBLURepTeamFrm.Create(Self);
  try
    PBLURepTeamFrm.bIs_Lookup := True;
    PBLURepTeamFrm.bAllow_Upd := False;
    PBLURepTeamFrm.SelCode := SelRepCode;
    PBLURepTeamFrm.ShowModal;
    if PBLURepTeamFrm.Selected then
    begin
      SelrepCode := PBLURepTeamFrm.SelCode;
      SelrepText := PBLURepTeamFrm.SelName;
    end;
    edtRepTeam.Text := SelRepText;
  finally
    PBLURepTeamFrm.Free;
  end;
  enableprint(self);
end;

procedure TPBRSPEndRepTeamPerformFrm.EnablePrint(Sender: TObject);
begin
  if (rgRep.itemindex = 0) and (dblkpFY.keyvalue <> 0) then
    PrintBitBtn.enabled := true
  else
    PrintBitBtn.enabled :=  (edtRepTeam.Text <> '') and
                            (dblkpFY.keyvalue <> 0);
                            
  previewbitbtn.enabled := PrintBitbtn.enabled;
  Excelbitbtn.enabled := PrintBitbtn.enabled;
end;

procedure TPBRSPEndRepTeamPerformFrm.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(rep);
    qryReport.Open;
  finally
    qryReport.EnableControls;
  end;
end;

procedure TPBRSPEndRepTeamPerformFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  SetToAndFromDates;
  qryReport.Close;

  PBRPPEndRepTeamPerformfrm := TPBRPPEndRepTeamPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndRepTeamPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPEndRepTeamPerformfrm.qrlblTitle.caption := PBRPPEndRepTeamPerformfrm.qrlblTitle.caption + ' - '
                                                + rdgrpBudgetType.Items[rdgrpBudgetType.itemindex] + ' Budget';
      PBRPPEndRepTeamPerformfrm.qrlblDateRange.caption :=
        PBRPPEndRepTeamPerformfrm.qrlblDateRange.caption + ' ' + dblkpFY.text;

      PBRPPEndRepTeamPerformfrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;
      PBRPPEndRepTeamPerformfrm.selrepcode := selrepcode;
      PBRPPEndRepTeamPerformfrm.FinancialYear := dblkpFY.keyvalue;
      PBRPPEndRepTeamPerformfrm.StartPeriod := StartPeriod;
      PBRPPEndRepTeamPerformfrm.FinishPeriod := FinishPeriod;
      PBRPPEndRepTeamPerformfrm.BudgetType := rdgrpBudgetType.itemindex;
      PBRPPEndRepTeamPerformfrm.ReportType := rdgrpReportType.itemindex;

      PBRPPEndRepTeamPerformfrm.GetDetails(Self);

      if bPreview then
        PBRPPEndRepTeamPerformfrm.quickreport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPPEndRepTeamPerformfrm.quickreport.Print;
    finally
      PrinterSettings.Free;
      PBRPPEndRepTeamPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSPEndRepTeamPerformFrm.SetToAndFromDates;
begin
  with qryGetFYPeriods do
    begin
      close;
      parambyname('Financial_Year').asinteger := dblkpFY.keyvalue;
      open;
      first;
      DateFrom := fieldbyname('Last_Period_End_Date').asdatetime+1;
      StartPeriod := fieldbyname('Period').asinteger;
      Last;
      DateTo := fieldbyname('Period_End_Date').asdatetime;
      FinishPeriod := fieldbyname('Period').asinteger;
    end;
end;

procedure TPBRSPEndRepTeamPerformFrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  CallReport(True)
end;

procedure TPBRSPEndRepTeamPerformFrm.PrintBitBtnClick(Sender: TObject);
begin
  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  CallReport(False)
end;

function TPBRSPEndRepTeamPerformFrm.BuildQueryString(rep: Boolean): string;
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
{rebuilds the query string depending on the sort selections}
  if categoryRpt then
    sTemp := SQLCorebyProd
  else
    sTemp := SQLCore;

  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';
   if (edtRepTeam.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Rep = ' + IntToStr(SelRepCode) + ' ';
  end;

  if categoryRpt then
    Result := sTemp + 'Order By Sales_Invoice.Rep, Product_Type.Category, Sales_Invoice.Invoice_Date'
  else
    Result := sTemp + 'Order By Sales_Invoice.Rep, Sales_Invoice.Invoice_Date';
end;


procedure TPBRSPEndRepTeamPerformFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBroker.DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSPEndRepTeamPerformFrm.FormCreate(Sender: TObject);
begin
  FChanged := true;
  FinancialYear := 0;

  If dmBroker.iAccCtrlMenu = 4 then
    begin
      btnRep.enabled := false;
      selRepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      rgRep.ItemIndex := 1;
      rgRep.Enabled := false;
      with qryRepName do
      begin
        close;
        paramByName('Sel_rep').asInteger := selrepcode;
        open;
        if not eof then
          edtRepTeam.Text := qryRepName.fieldByName('Name').asString;
      end;
     end
  else
    begin
      selRepCode := 0 ;
      btnRep.enabled := True;
    end;

end;

procedure TPBRSPEndRepTeamPerformFrm.dblkpFYClick(Sender: TObject);
begin
  EnablePrint(self);
end;

procedure TPBRSPEndRepTeamPerformFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSPEndRepTeamPerformFrm.ExcelBitBtnClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  SetToAndFromDates;

  PBRPPEndRepTeamPerformfrm := TPBRPPEndRepTeamPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndRepTeamPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPEndRepTeamPerformfrm.qrlblDateRange.caption := PBRPPEndRepTeamPerformfrm.qrlblDateRange.caption + ' ' + dblkpFY.text;

      PBRPPEndRepTeamPerformfrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;
      PBRPPEndRepTeamPerformfrm.selrepcode := selrepcode;
      PBRPPEndRepTeamPerformfrm.FinancialYear := dblkpFY.keyvalue;
      PBRPPEndRepTeamPerformfrm.StartPeriod := StartPeriod;
      PBRPPEndRepTeamPerformfrm.FinishPeriod := FinishPeriod;

      reccount := PBRPPEndRepTeamPerformfrm.GetDetails(Self);
      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPEndRepTeamPerformfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
      PBRPPEndRepTeamPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

end.
