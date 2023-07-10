unit WTRSCustTurn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, ExtCtrls, DateSelV5, PBPOObjects, Printers, CCSPrint,
  ComCtrls, Spin, OleCtnrs;

type
  TPBRSCustTurnFrm = class(TForm)
    GrpBxDts: TGroupBox;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    PrintBitBtn: TBitBtn;
    TotByRadioGroup: TRadioGroup;
    Label3: TLabel;
    cbSort1: TComboBox;
    GetLastIntSelSQL: TQuery;
    DelWorkSQL: TQuery;
    AddWorkSQL: TQuery;
    AddIntSelQuery: TQuery;
    qrySalesByInv: TQuery;
    qrySalesByInvCustomer: TIntegerField;
    qrySalesByInvSales_Invoice: TIntegerField;
    qrySalesByInvGoods_Value: TCurrencyField;
    qrySalesByInvInvoice_or_Credit: TStringField;
    qrySalesByInvSales_Invoice_type: TStringField;
    qrySalesByInvReference: TStringField;
    PreviewReportBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetCostsQuery: TQuery;
    AddCostsQuery: TQuery;
    qryGetPOCosts: TQuery;
    qryGetSOCosts: TQuery;
    qryAddPOCosts: TQuery;
    qryGetJBCosts: TQuery;
    SQLUpdIntSel: TQuery;
    qrySalesByInvBranch_No: TIntegerField;
    NoofCustSpin: TSpinEdit;
    GroupBox1: TGroupBox;
    chkbxExcludeCosts: TCheckBox;
    rgRep: TRadioGroup;
    pnlRep: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    qryCreditLines: TQuery;
    qryGetProdCosts: TQuery;
    qryGetJBCrCosts: TQuery;
    qryGetPOCrCosts: TQuery;
    qryGetSOCrCosts: TQuery;
    qryGetInvAddChrg: TQuery;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    SQLRep: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function GetNextIntSelCode(Sender: TObject): Integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure DateToEditExit(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateFromEditExit(Sender: TObject);
    procedure rgRepClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure Canprint;
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    DateFrom, DateTo: TDateTime;
    SelRepCode: integer;
    SelRepText : string;
    procedure FixQuery(rep: Boolean);
    procedure CallReport(const bPreview : Boolean);
    procedure CreateWrkFile(Sender: TObject);
    procedure AddWork(OpNo, CustNo, BranchNo: Integer; TotSales, TotCst: real);
    procedure UpdWork(OpNo, CustNo, BranchNo: Integer; TotSales, TotCst: real);
    Function GetTotCst(InvNo: Integer): real;
    function BuildQueryString(rep: Boolean): string;

  public
    { Public declarations }
    iIntselcode: Integer;
    bDatesChng: ByteBool;
  end;

var
  PBRSCustTurnFrm: TPBRSCustTurnFrm;

implementation

uses PBDatabase, PBRPCustTurn, PBLURep, CCSCommon, pbMainMenu;

{$R *.DFM}
const
  SQLCore =

  'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, '+
	'Sales_Invoice.Sales_Invoice, '+
	'Sales_Invoice.Goods_Value, '+
	'Sales_Invoice.Invoice_or_Credit, '+
  'Sales_Invoice.Sales_Invoice_type, '+
  'Sales_Invoice.Inv_to_Branch as Branch_No, '+
	'Sales_Invoice.Reference '+
  'FROM (Sales_Invoice '+
	'INNER JOIN Sales_Invoice_Line ON '+
		'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice)';

procedure TPBRSCustTurnFrm.FormCreate(Sender: TObject);
begin
 Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 0;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  NoofCustSpin.Value:= 0;
  bDatesChng := False;
  iIntselcode := GetNextIntSelCode(Self);

  If dmBroker.iAccCtrlMenu = 4 then
    begin
      rgRep.ItemIndex := 2;
      rgRep.Enabled := false;
      pnlRep.Enabled := false;
      selRepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      with sqlRep do
      begin
        close;
        paramByName('Rep').asInteger := selrepcode;
        open;
        if not eof then
          begin
            self.caption := 'Customer Turnover Report (Rep Access) - ' + sqlRep.fieldByName('Name').asString;
            edtRep.Text := sqlRep.fieldByName('Name').asString;
          end;
      end;

     end
  else
    begin
      selRepCode := 0 ;
    end;
end;

procedure TPBRSCustTurnFrm.FormShow(Sender: TObject);
begin
// qrySalesByInv.Active := True;
end;

procedure TPBRSCustTurnFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
{Delete ALL entries on the workfile for the int_sel_code} ;
With DelWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
     ExecSQL ;
     end;
{Add the reserving one back in} ;
If not bTempDelCode then
     begin
     With AddWorkSQL do
          begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := '' ;
          ExecSQL ;
          end;
     end;
end;

function TPBRSCustTurnFrm.GetNextIntSelCode(Sender: TObject): Integer;
Var
iIntSelCode: Integer ;
begin
{Get the next int_sel_code to use} ;
With GetLastIntSelSQL do
     begin
     Close ;
     Open ;
     First;
     iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
     end;
{Reserve it on the int_sel file} ;
With AddWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
     ParamByName('Text100').AsString := ' ' ;
     ExecSQL ;
     end;
Result := iIntSelCode ;
end;

procedure TPBRSCustTurnFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
  bDatesChng := True;
end;

function TPBRSCustTurnFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      begin
        Result := DateSelV5Form.Date;
        bDatesChng := True;
      end;
  finally
    DateSelV5Form.Free;
  end;

end;

procedure TPBRSCustTurnFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSCustTurnFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

function TPBRSCustTurnFrm.BuildQueryString(rep: Boolean): string;
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
  sTemp := SQLCore;
  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';
   if (edtRep.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Rep = ' + IntToStr(SelRepCode) + ' ';
  end;
  Result := sTemp + 'Order By Inv_to_Customer, Inv_to_Branch';
end;

procedure TPBRSCustTurnFrm.CallReport(const bPreview: Boolean);
var
  PBRPCustTurnFrm: TPBRPCustTurnFrm;
  PrinterSettings: TPrinterSettings;
begin
  if bDatesChng then
  begin
    qrySalesByInv.Close;
    DelIntSelCode(iIntSelCode, True);
    fixquery(True);
    if qrySalesByInv.recordcount = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOk], 0);
      CancelBitBtn.SetFocus;
      Exit;
    end;

  CreateWrkFile(Self);
  bDatesChng := False;
  end;
  {add total order by clause to report query}

  PBRPCustTurnfrm := TPBRPCustTurnfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPCustTurnfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPCustTurnfrm.qrlblTitle.caption := PBRPCustTurnfrm.qrlblTitle.caption + DateToStr(Date);
          PBRPCustTurnfrm.qrlblDateRange.caption :=
          PBRPCustTurnfrm.qrlblDateRange.caption + DateFromEdit.Text +
            ' to: ' + DateToEdit.Text+',';
          if (edtRep.Text <> '') then
            PBRPCustTurnfrm.qrlblDateRange.caption :=
            PBRPCustTurnfrm.qrlblDateRange.caption + ' Rep: '+edtRep.Text+',';
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPCustTurnfrm.qrlblDateRange.caption :=
            PBRPCustTurnfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text + ' Ascending'
          else
            PBRPCustTurnfrm.qrlblDateRange.caption :=
            PBRPCustTurnfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text + ' Descending';
          PBRPCustTurnFrm.NoOfCust := noofcustspin.value;
          PBRPCustTurnFrm.orderasc := TotByRadioGroup.ItemIndex = 0;
          PBRPCustTurnFrm.seqbySales := cbsort1.itemindex = 0;
          PBRPCustTurnFrm.seqbyCost := cbsort1.itemindex = 1;
          PBRPCustTurnFrm.seqbyProfit := cbsort1.itemindex = 2;
          PBRPCustTurnFrm.seqbyMargPerc := cbsort1.itemindex = 3;
          PBRPCustTurnFrm.seqbyName := cbsort1.itemindex = 4;
          PBRPCustTurnFrm.iintselcode := iintselcode;

          PBRPCustTurnFrm.bTurnOffCosts := chkbxexcludecosts.checked;

          PBRPCustTurnFrm.GetDetails;
          if bPreview then
            PBRPCustTurnfrm.qckrpSalesByInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPCustTurnfrm.qckrpSalesByInv.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
  end;

end;

procedure TPBRSCustTurnFrm.CreateWrkFile(Sender: TObject);
var
TotSales, TotCst : real;
CustNo, InvNo, OpNo, SavCustNo, BranchNo, SavBranchNo : integer;
begin
SavCustNo := 0;
SavBranchNo := 0;
OpNo := iIntselcode;
With qrySalesByInv do
begin
  close;
  Open;
  First;
  while not eof do
  begin
    InvNo := FieldByName('Sales_Invoice').AsInteger;
    TotSales := FieldByName('Goods_Value').Asfloat;
    CustNo := FieldByName('Customer').AsInteger;
    TotCst := GetTotCst(InvNO);
    BranchNo := FieldByName('Branch_No').AsInteger;
    if (CustNo <> SavCustNo) or (BranchNo <>SavBranchNo) then
      AddWork(OpNo, CustNo, BranchNo, TotSales, TotCst)
    else
      UpdWork(OpNo, CustNo, BranchNo, TotSales, TotCst);
    SavCustNo := FieldByName('Customer').AsInteger;
    SavBranchNo := FieldByName('Branch_No').AsInteger;
  next;
 end;
end;
end;

procedure TPBRSCustTurnFrm.AddWork(OpNO, CustNo, BranchNo: Integer; TotSales,
  TotCst: real);
begin
  with AddIntSelQuery do
  begin
    close;
    ParamByName('Int_Sel_Code').AsInteger := Opno;
    ParamByName('Sel1').AsFloat := CustNo;
    ParamByName('Sel2').AsFloat := BranchNo;
    ParamByName('Sel3').AsFloat := TotSales;
    if TotCst = 0 then
      ParamByName('Sel4').AsFloat := 0.001
    else
      ParamByName('Sel4').AsFloat := TotCst;
    ParamByName('Text100').AsString := ' ';
    execSQL;
  end;
end;

function TPBRSCustTurnFrm.GetTotCst(InvNo: Integer): real;
var
  rTotalCost :real;
  iQty: integer;
  raddcost: real;
begin
  rTotalCost := 0;
  {only get the costs if invoice}
  if (qrySalesByInvInvoice_or_Credit.asstring = 'I') or
     (qrySalesByInvInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesByInvSales_Invoice_type.asstring = '' then
      begin
      with getCostsQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger := InvNo;
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
      //        rTotalCost := rTotalCost + FieldByName('Order_Price').asfloat ;
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
          ParamByName('PurchOrder').AsFloat := qrySalesByInvReference.AsFloat;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
        end;
      rTotalCost := rTotalCost + rAddcost;
      end
    else
    if qrySalesByInvSales_Invoice_type.asstring = 'S' then
      begin
      with qryGetPOCosts do
        begin
        Close;
        ParamByName('Sales_Invoice').AsInteger := InvNo;
        Open;
        {either no Purchase Order exists for the stationery order or this is a Stock
        Call Off order}
        if recordcount = 0 then
          begin
            with qryGetSOCosts do
              begin
              Close;
              ParamByName('Sales_order').AsInteger := qrySalesByInvReference.asInteger;
              ParamByName('Sales_invoice').AsInteger := qrySalesByInvSales_Invoice.asInteger;
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
    if qrySalesByInvSales_Invoice_type.asstring = 'J' then
      begin
      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger :=InvNo;
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
    begin
      //calculate credit costs if quantity credit.
      with qryCreditLines do
      begin
        close;
        parambyname('Sales_invoice').asinteger := qrySalesByInvSales_Invoice.asInteger;
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
          else if fieldbyname('Purchase_order').asfloat <> 0 then
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
          else if fieldbyname('Job_Bag').asinteger <> 0 then
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
          else if fieldbyname('Sales_Order').asinteger <> 0 then
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

  with qryGetInvAddChrg do
  begin
    close;
    ParamByName('sales_invoice').asInteger := qrySalesByInvSales_Invoice.asInteger;
    open;

    while not eof do
    begin
      rTotalCost := rTotalCost + FieldByName('cost_price').asFloat;
      next;
    end;
    close;
  end;

  Result := rTotalCost;
end;

procedure TPBRSCustTurnFrm.FixQuery(rep: Boolean);
begin
  qrySalesByInv.DisableControls;
  try
    qrySalesByInv.Close;
    qrySalesByInv.SQL.Clear;
    qrySalesByInv.SQL.text := BuildQueryString(rep);
    qrySalesByInv.Open;
  finally
    qrySalesByInv.EnableControls;
  end;
end;

procedure TPBRSCustTurnFrm.PrintBitBtnClick(Sender: TObject);
begin
 CallReport(False);
end;

procedure TPBRSCustTurnFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
 CallReport(True);
end;

procedure TPBRSCustTurnFrm.UpdWork(OpNo, CustNo, BranchNo: Integer; TotSales,
  TotCst: real);
begin
  with SQLUpdIntSel do
  begin
    close;
    ParamByName('Int_Sel_Code').AsInteger := Opno;
    ParamByName('Sel1').AsFloat := CustNo;
    ParamByName('Sel2').AsFloat := BranchNo;
    ParamByName('Sel3').AsFloat := TotSales;
    ParamByName('Sel4').AsFloat := TotCst;
    execSQL;
  end;
end;

procedure TPBRSCustTurnFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSCustTurnFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
  bDatesChng := True;
end;

procedure TPBRSCustTurnFrm.rgRepClick(Sender: TObject);
begin
pnlRep.visible := rgRep.itemIndex = 1;
if pnlRep.visible = False then
  begin
    selrepcode := 0;
    edtRep.text := '';
  end;
fixQuery(False);
canprint;
bDateschng := True;
end;

procedure TPBRSCustTurnFrm.btnRepClick(Sender: TObject);
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
    FixQuery(False);
  finally
    PBLURepFrm.Free;
  end;
  canprint;
  bDateschng := True;
end;

procedure TPBRSCustTurnFrm.Canprint;
begin
 {Check if can print}
  PrintBitBtn.Enabled :=
    ((rgRep.ItemIndex = 0) or
    ((rgRep.ItemIndex = 1) and (edtRep.Text <> '')) and
    (dateFromEdit.text <> '')
    );
  PreviewReportBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRSCustTurnFrm.btnExcelClick(Sender: TObject);
var
  PBRPCustTurnFrm: TPBRPCustTurnFrm;
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempFileName: string;
begin
  if bDatesChng then
  begin
    qrySalesByInv.Close;
    DelIntSelCode(iIntSelCode, True);
    fixquery(True);
    if qrySalesByInv.recordcount = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOk], 0);
      CancelBitBtn.SetFocus;
      Exit;
    end;

  CreateWrkFile(Self);
  bDatesChng := False;
  end;
  {add total order by clause to report query}

  PBRPCustTurnfrm := TPBRPCustTurnfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPCustTurnfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPCustTurnFrm.NoOfCust := noofcustspin.value;
      PBRPCustTurnFrm.orderasc := TotByRadioGroup.ItemIndex = 0;
      PBRPCustTurnFrm.seqbySales := cbsort1.itemindex = 0;
      PBRPCustTurnFrm.seqbyCost := cbsort1.itemindex = 1;
      PBRPCustTurnFrm.seqbyProfit := cbsort1.itemindex = 2;
      PBRPCustTurnFrm.seqbyMargPerc := cbsort1.itemindex = 3;
      PBRPCustTurnFrm.seqbyName := cbsort1.itemindex = 4;
      PBRPCustTurnFrm.iintselcode := iintselcode;

      PBRPCustTurnFrm.bTurnOffCosts := chkbxexcludecosts.checked;
      reccount := PBRPCustTurnFrm.GetDetails;
      if reccount > 0 then
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          PBRPCustTurnFrm.ExportToFile(tempFileName);
          self.pnlExportPrgrss.visible := false;
          self.Repaint;
          self.prgbrExport.Position := 0;

          self.OleContainer1.CreateLinkToFile(tempFileName, false);
          self.OleContainer1.DoVerb(0);
        end
      else
        begin
          messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
  end;
end;

end.
