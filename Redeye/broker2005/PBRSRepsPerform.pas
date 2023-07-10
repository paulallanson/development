unit PBRSRepsPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, ExtCtrls, Db, DBTables, ComCtrls;

type
  TPBRSRepsPerformfrm = class(TForm)
    rgRep: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    Label1: TLabel;
    dblkpFY: TDBLookupComboBox;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    qryFY: TQuery;
    dtsFY: TDataSource;
    qryCompany: TQuery;
    qryReport: TQuery;
    AddIntSelQuery: TQuery;
    qryAddPOCosts: TQuery;
    AddCostsQuery: TQuery;
    qryPeriod: TQuery;
    SQLUpdIntSel: TQuery;
    qryGetFYPeriods: TQuery;
    pnlProgress: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lblProgress: TLabel;
    lblRecordCount: TLabel;
    prgrsbrImport: TProgressBar;
    GetCostsQuery: TQuery;
    qryCreditLines: TQuery;
    qryGetProdCosts: TQuery;
    qryGetJBCrCosts: TQuery;
    qryGetSOCrCosts: TQuery;
    qryGetPOCrCosts: TQuery;
    qryGetJBCosts: TQuery;
    qryGetPOCosts: TQuery;
    qryGetSOCosts: TQuery;
    procedure rgRepClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpFYClick(Sender: TObject);
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
    procedure AddWork(OpNO, Rep, Period, Category: Integer; TotSales,
      TotCst: real);
    procedure UpdWork(OpNo, Rep, Period, Category: Integer; TotSales,
      TotCst: real);
    procedure CallCategoryReport(const bPreview: Boolean);
    procedure CallReport(const bPreview: Boolean);
    procedure CreateCategoryWrkFile(Sender: TObject);
    procedure CreateWrkFile(Sender: TObject);
    function BuildQueryString(rep: Boolean): string;
    procedure FixQuery(rep: Boolean);
    function GetTotalCost(InvNo: Integer): real;
    function GetInvoicePeriod(tmpDate: TDateTime): integer;
    procedure SetToAndFromDates;
    function GetTotalSales(InvNo: Integer): real;
  public
    { Public declarations }
  end;

var
  PBRSRepsPerformfrm: TPBRSRepsPerformfrm;

implementation

uses PBLURep, PBDatabase, CCSPrint, CCSCommon, PBRPRepsPerform,
  PBRPRepsCatPerform;

{$R *.DFM}
const
  SQLCore =

  'SELECT DISTINCT Sales_Invoice.Rep, '+
	'Sales_Invoice.Sales_Invoice, '+
	'Sales_Invoice.Sales_Invoice_no, '+
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

procedure TPBRSRepsPerformfrm.rgRepClick(Sender: TObject);
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

procedure TPBRSRepsPerformfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryCompany.Active := false;
      qryCompany.Active := true;

      categoryRpt := (qryCompany.fieldbyname('Performance_target_type').asstring = 'C');

      qryFY.Active := false;
      qryFY.Active := true;

      dblkpFY.keyvalue := qryCompany.fieldbyname('Financial_Year').asinteger;
      FActivated := true;
    end;
  enablePrint(self);
end;

procedure TPBRSRepsPerformfrm.btnRepClick(Sender: TObject);
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

procedure TPBRSRepsPerformfrm.EnablePrint(Sender: TObject);
begin
  if (rgRep.itemindex = 0) and (dblkpFY.keyvalue <> 0) then
    PrintBitBtn.enabled := true
  else
    PrintBitBtn.enabled :=  (edtRep.Text <> '') and
                            (dblkpFY.keyvalue <> 0);

  previewbitbtn.enabled := PrintBitbtn.enabled;
end;

procedure TPBRSRepsPerformfrm.FixQuery(rep: Boolean);
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

procedure TPBRSRepsPerformfrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
(*  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  if (RepCode <> SelRepCode)  and (RepCode <> 0) then
    begin
      FChanged := true;
      RepCode := SelRepCode;
    end;
*)
//  set date from and date to
  SetToAndFromDates;
  qryReport.Close;
  dmBroker.DelIntSelCode(iIntSelCode, True);
  fixquery(True);
  if qryReport.recordcount = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOk], 0);
      CancelBitBtn.SetFocus;
      Exit;
    end;

  if FChanged then
    CreateWrkFile(Self);

  PBRPRepsPerformfrm := TPBRPRepsPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPRepsPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPRepsPerformfrm.qrlblTitle.caption := PBRPRepsPerformfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPRepsPerformfrm.qrlblDateRange.caption :=
        PBRPRepsPerformfrm.qrlblDateRange.caption + dblkpFY.text;

      PBRPRepsPerformfrm.selrepcode := selrepcode;
      PBRPRepsPerformfrm.StartPeriod := StartPeriod;
      PBRPRepsPerformfrm.FinishPeriod := FinishPeriod;
      PBRPRepsPerformfrm.GetDetails(Self);

      if bPreview then
        PBRPRepsPerformfrm.QckRpRpsPrft.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPRepsPerformfrm.QckRpRpsPrft.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSRepsPerformfrm.CallCategoryReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
(*  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  if (RepCode <> SelRepCode) and (RepCode <> 0) then
    begin
      FChanged := true;
      RepCode := SelRepCode;
    end;
*)
  if FChanged then
    begin
// set date from and date to
      SetToAndFromDates;
      qryReport.Close;
      dmBroker.DelIntSelCode(iIntSelCode, True);
      fixquery(True);
      CreateCategoryWrkFile(Self);
    end;

  PBRPRepsCatPerformfrm := TPBRPRepsCatPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPRepsCatPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPRepsCatPerformfrm.qrlblTitle.caption := PBRPRepsCatPerformfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPRepsCatPerformfrm.qrlblDateRange.caption :=
        PBRPRepsCatPerformfrm.qrlblDateRange.caption + ' ' + dblkpFY.text;

      PBRPRepsCatPerformfrm.selrepcode := selrepcode;
      PBRPRepsCatPerformfrm.StartPeriod := StartPeriod;
      PBRPRepsCatPerformfrm.FinishPeriod := FinishPeriod;
      PBRPRepsCatPerformfrm.GetDetails(Self);

      if bPreview then
        PBRPRepsCatPerformfrm.quickreport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPRepsCatPerformfrm.quickreport.Print;
    finally
      PrinterSettings.Free;
      PBRPRepsCatPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSRepsPerformfrm.SetToAndFromDates;
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

procedure TPBRSRepsPerformfrm.CreateWrkFile(Sender: TObject);
var
  TotSales, TotCst : real;
  Rep, InvNo, OpNo, tmpRep, Period, tmpPeriod : integer;
  LineNo: integer;
  SalesInvNo: string;
begin
  LineNo := 0;
  tmpRep := 0;
  tmpPeriod := 0;
  OpNo := iIntselcode;

  lblRecordCount.Caption := 'records read.';
  lblRecordCount.Visible := True;
  lblProgress.Visible := True;
  prgrsbrImport.Max := qryReport.recordcount;

  SalesInvNo := '';
  With qryReport do
  begin
    close;
    Open;
    First;
    while not eof do
    begin
      LineNo := LineNo + 1;

      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

      if SalesInvNo = fieldbyname('sales_invoice_no').AsString then
        begin
          next;
          continue;
        end;

      SalesInvNo := fieldbyname('sales_invoice_no').asstring;

      InvNo := FieldByName('Sales_Invoice').AsInteger;
      TotSales := FieldByName('Goods_Value').Asfloat;
      TotCst := GetTotalCost(InvNO);
      Rep := FieldByName('Rep').AsInteger;
      Period := GetInvoicePeriod(FieldByName('Invoice_Date').AsDateTime);
      if (Rep <> tmpRep) or (period <> tmpPeriod) then
        begin
          AddWork(OpNo, Rep, Period, 0, TotSales, TotCst);
          tmpRep := Rep;
          tmpPeriod := Period;
        end
      else
        UpdWork(OpNo, Rep, Period, 0, TotSales, TotCst);
      next;
    end;
  end;
end;

procedure TPBRSRepsPerformfrm.CreateCategoryWrkFile(Sender: TObject);
var
  TotSales, TotCst : real;
  Rep, InvNo, OpNo, tmpRep, Period, tmpPeriod : integer;
  tmpCategory, Category: integer;
  LineNo: integer;
begin
  LineNo := 0;
  tmpRep := 0;
  tmpPeriod := 0;
  tmpCategory := 0;
  OpNo := iIntselcode;

  lblRecordCount.Caption := 'records read.';
  lblRecordCount.Visible := True;
  lblProgress.Visible := True;
  prgrsbrImport.Max := qryReport.recordcount;

  With qryReport do
  begin
    First;
    while not eof do
    begin
      LineNo := LineNo + 1;

      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

      InvNo := FieldByName('Sales_Invoice').AsInteger;
      TotSales := GetTotalSales(InvNo);
      TotCst := GetTotalCost(InvNO);
      Rep := FieldByName('Rep').AsInteger;
      Period := GetInvoicePeriod(FieldByName('Invoice_Date').AsDateTime) ;
      Category := FieldbyName('Category').asinteger;
      if (Rep <> tmpRep) or (period <> tmpPeriod) or (Category <> tmpCategory) then
        begin
          AddWork(OpNo, Rep, Period, category, TotSales, TotCst);
          tmpRep := Rep;
          tmpPeriod := Period;
          tmpCategory := Category
        end
      else
        UpdWork(OpNo, Rep, Period, category, TotSales, TotCst);

      next;
    end;
  end;
end;

procedure TPBRSRepsPerformfrm.AddWork(OpNO, Rep, Period, Category: Integer; TotSales,
  TotCst: real);
begin
  with AddIntSelQuery do
  begin
    close;
    ParamByName('Int_Sel_Code').AsInteger := Opno;
    ParamByName('Sel1').AsFloat := Rep;
    ParamByName('Sel2').AsFloat := Period;
    ParamByName('Sel3').Asfloat := Category;
    ParamByName('Sel4').AsFloat := TotSales;
    if TotCst = 0 then
      ParamByName('Sel5').AsFloat := 0.001
    else
      ParamByName('Sel5').AsFloat := TotCst;
    execSQL;
  end;
end;

procedure TPBRSRepsPerformfrm.UpdWork(OpNo, Rep, Period, Category: Integer; TotSales,
  TotCst: real);
begin
  with SQLUpdIntSel do
  begin
    close;
    ParamByName('Int_Sel_Code').AsInteger := Opno;
    ParamByName('Sel1').AsFloat := Rep;
    ParamByName('Sel2').AsFloat := Period;
    ParamByName('Sel3').Asfloat := Category;
    ParamByName('Sel4').AsFloat := TotSales;
    ParamByName('Sel5').AsFloat := TotCst;
    execSQL;
  end;
end;

procedure TPBRSRepsPerformfrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  FChanged := (FinancialYear <> dblkpFY.Keyvalue) or
              (RepCode <> selrepcode);

  if categoryRpt then
    CallCategoryReport(True)
  else
    CallReport(True);
  RepRadGrpCode := rgRep.itemindex;
  FinancialYear := dblkpFY.KeyValue;
  RepCode := selrepcode;
  FChanged := false;
end;

procedure TPBRSRepsPerformfrm.PrintBitBtnClick(Sender: TObject);
begin
  if rgRep.itemindex = 0 then
    SelrepCode := 0;

  FChanged := (FinancialYear <> dblkpFY.Keyvalue) or
              (RepCode <> selrepcode);

  if categoryRpt then
    CallCategoryReport(False)
  else
    CallReport(False);
  RepRadGrpCode := rgRep.itemindex;
  FinancialYear := dblkpFY.KeyValue;
  RepCode := selrepcode;
  FChanged := false;
end;

function TPBRSRepsPerformfrm.BuildQueryString(rep: Boolean): string;
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
   if (edtRep.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Rep = ' + IntToStr(SelRepCode) + ' ';
  end;

  if categoryRpt then
    Result := sTemp + 'Order By Sales_Invoice.Rep, Product_Type.Category, Sales_Invoice.Invoice_Date'
  else
    Result := sTemp + 'Order By Sales_Invoice.Rep, Sales_Invoice.Sales_Invoice, Sales_Invoice.Invoice_Date';
end;

function TPBRSRepsPerformfrm.GetTotalSales(InvNo: Integer): real;
var
  rTotalSales: real;
begin
  if qryReport.fieldByname('Price_Unit_Factor').AsInteger = 0 then
    rTotalSales := qryReport.fieldByName('Goods_Value').AsFloat
  else
    rTotalSales := (abs(qryReport.fieldByname('Qty_Invoiced').AsFloat) /
     (qryReport.fieldByname('Price_Unit_Factor').AsInteger))
      * qryReport.fieldByName('Goods_Value').AsFloat;

  if qryReport.fieldByname('Invoice_line_no').AsInteger = 1 then
    rTotalSales := rTotalSales + qryReport.fieldByname('Invoice_add_charges').Asfloat;

  Result := rTotalSales;
end;

function TPBRSRepsPerformfrm.GetTotalCost(InvNo: Integer): real;
var
  rTotalCost :real;
  iQty: integer;
  raddcost: real;
begin
  rTotalCost := 0;
  {only get the costs if invoice}
  if (qryReport.fieldbyname('Invoice_or_Credit').asstring = 'I') or
     (qryReport.fieldbyname('Invoice_or_Credit').asstring = '') then
    begin
    if qryReport.fieldbyname('Sales_Invoice_type').asstring = '' then
      begin
      with getCostsQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger := InvNo;
          ParamByName('Line_No').AsInteger := qryReport.fieldbyname('Invoice_Line_no').asinteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Invoiced').asinteger;

            if FieldByName('Order_Unit_Factor').asfloat <> 0 then
              rTotalCost := rTotalCost + (iQty / FieldByName('Order_Unit_Factor').asinteger)
                      * FieldByName('Order_Price').asfloat
            else
              try
                rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
              except
                rTotalCost := rTotalCost + 0;
              end;
            next;
            end;
        end;
      with AddCostsQuery do
        begin
          Close;
          ParamByName('PurchOrder').AsFloat := qryReport.fieldbyname('Reference').AsFloat;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
        end;
      rTotalCost := rTotalCost + rAddcost;
      end
    else
    if qryReport.fieldbyname('Sales_Invoice_type').asstring = 'S' then
      begin
      with qryGetPOCosts do
        begin
        Close;
        ParamByName('Sales_Invoice').AsInteger := InvNo;
        ParamByName('Line_No').AsInteger := qryReport.fieldbyname('Invoice_Line_No').asinteger;
        Open;
        {either no Purchase Order exists for the stationery order or this is a Stock
        Call Off order}
        if recordcount = 0 then
          begin
            with qryGetSOCosts do
              begin
              Close;
              ParamByName('Sales_order').AsInteger := qryReport.fieldbyname('Reference').asInteger;
              ParamByName('Sales_invoice').AsInteger := qryReport.fieldbyname('Sales_Invoice').asInteger;
              ParamByName('Line_No').AsInteger := qryReport.fieldbyname('Invoice_Line_No').asinteger;
              Open;
              First;
              rTotalCost := fieldbyname('Total_Cost').asfloat;
              end;
          end
        else
          begin
            qryGetPOCosts.First;
            rTotalCost := qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
            with qryAddPOCosts do
              begin
              Close;
              ParamByName('Purch_Ord').AsInteger := qryGetPOCosts.fieldbyname('Purch_ord').asInteger;
              Open;
              First;
              rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
              end;
          end;
        end;
      end
    else
    if qryReport.fieldbyname('Sales_Invoice_type').asstring = 'J' then
      begin
      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger :=InvNo;
          ParamByName('Line_No').AsInteger := qryReport.fieldbyname('Invoice_Line_No').asinteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Purchase_order').asstring = '' then
              rTotalCost := rTotalCost + FieldByName('Job_Bag_Line_Cost').asfloat
            else
              begin
              if FieldByName('Qty_Invoiced').asfloat < 0 then
                 iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
              else
                 iQty := FieldByName('Qty_Invoiced').asinteger;

              if FieldByName('Price_Unit_Factor').asfloat <> 0 then
                 rTotalCost := rTotalCost + (iQty / FieldByName('Price_Unit_Factor').asinteger)
                       * FieldByName('Order_Price').asfloat
              else
                begin
                  try
                    rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                  except
                    rTotalCost := rTotalCost + 0;
                  end;
                end;

              rTotalCost := rTotalCost + FieldByName('Extra_Cost').asfloat;
              end;
            next;
            end;
        end;
      end;
    end
  else
    {Credit Note costs}
    begin
    with qryCreditLines do
      begin
        close;
        parambyname('Invoice_No').asinteger := qryReport.fieldbyname('Sales_Invoice').asInteger;
        ParamByName('Line_No').AsInteger := qryReport.fieldbyname('Invoice_Line_No').asinteger;
        open;

        first;
        while eof <> true do
          begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Invoiced').asinteger;

            if FieldbyName('Cost_Price').asfloat <> 0 then
              begin
                if FieldByName('Invoice_Unit_Factor').asfloat <> 0 then
                  rTotalCost := rTotalCost + (iQty / FieldByName('Invoice_Unit_Factor').asinteger)
                      * FieldByName('Cost_Price').asfloat
                else
                  rTotalCost := rTotalCost + FieldByName('Cost_Price').asfloat;
              end
            else
            if fieldbyname('Purchase_order').asfloat <> 0 then
              begin
                qryGetProdCosts.close;
                qryGetProdCosts.parambyname('Purchase_order').asfloat := fieldbyname('Purchase_order').asfloat;
                qryGetProdCosts.parambyname('Line').asinteger := fieldbyname('Line').asinteger;
                qryGetProdCosts.open;

                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  begin
                    if qryGetProdCosts.FieldByName('Order_Unit_Factor').asfloat <> 0 then
                      rTotalCost := rTotalCost + ((iQty / qryGetProdCosts.FieldByName('Order_Unit_Factor').asinteger)
                        * qryGetProdCosts.FieldByName('Order_Price').asfloat)*-1
                    else
                      try
                        rTotalCost := rTotalCost + (((qryGetProdCosts.FieldByName('Order_Price').asfloat / qryGetProdCosts.FieldByName('Quantity').asfloat)*iqty)*-1) ;
                      except
                        rTotalCost := rTotalCost + 0
                      end;
                  end
                else
                  rTotalCost := rTotalCost + 0;
              end
            else
            if fieldbyname('Job_Bag').asinteger <> 0 then
              begin
                qryGetJBCrCosts.close;
                qryGetJBCrCosts.parambyname('Job_Bag').asinteger := fieldbyname('Job_Bag').asinteger;
                qryGetJBCrCosts.parambyname('Job_bag_line').asinteger := fieldbyname('Job_Bag_Line').asinteger;
                qryGetJBCrCosts.open;

                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  rTotalCost := rTotalCost + (qryGetJBCrCosts.FieldByName('Job_Bag_Line_Cost').asfloat*-1)
                else
                  rTotalCost := rTotalCost + 0;
              end
            else
            if fieldbyname('Sales_Order').asinteger <> 0 then
              begin
                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  begin
                    qryGetPOCrCosts.Close;
                    qryGetPOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetPOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetPOCrCosts.Open;

                    if qryGetPOCrCosts.recordcount = 0 then
                      begin
                        qryGetSOCrCosts.close;
                        qryGetSOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                        qryGetSOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                        qryGetSOCrCosts.Open;

                        rTotalCost := rTotalCost + ((iQty / qryGetSOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                          * qryGetSOCrCosts.FieldByName('Part_Cost').asfloat)*-1;
                      end
                    else
                      rTotalCost := rTotalCost + (((iQty / qryGetPOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                          * qryGetPOCrCosts.FieldByName('Purchase_Price').asfloat))*-1;
                  end
                else
                  rTotalCost := rTotalCost + 0.00;
              end;
            next;
          end;
      end;
    end;

  Result := rTotalCost;
end;

function TPBRSRepsPerformfrm.GetInvoicePeriod(tmpDate: TDateTime): integer;
begin
  with qryperiod do
    begin
      close;
      parambyname('Invoice_Date').asdatetime := tmpDate;
      open;
      result := fieldbyname('Period').asinteger;
    end;
end;

procedure TPBRSRepsPerformfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBroker.DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSRepsPerformfrm.FormCreate(Sender: TObject);
begin
  FChanged := true;
  FinancialYear := 0;
end;

procedure TPBRSRepsPerformfrm.dblkpFYClick(Sender: TObject);
begin
  EnablePrint(self);
end;

end.
