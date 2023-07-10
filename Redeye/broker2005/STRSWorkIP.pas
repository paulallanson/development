unit STRSWorkIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, CCSCommon,
  OleCtnrs, ComCtrls;

type
  TSTRSWorkIPfrm = class(TForm)
    qryReport: TQuery;
    dsReport: TDataSource;
    pnlControl: TPanel;
    pnlDetail: TPanel;
    DBGrid: TDBGrid;
    pnlSelections: TPanel;
    rgRep: TRadioGroup;
    rgCustomer: TRadioGroup;
    RepPanel: TPanel;
    lblSupplier: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    cbSort1: TComboBox;
    Label3: TLabel;
    cbSort2: TComboBox;
    Label4: TLabel;
    cbSort3: TComboBox;
    Label5: TLabel;
    pnlRightControl: TPanel;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    pnlDates: TPanel;
    chkbxPageBreak: TCheckBox;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    TotByRadioGroup: TRadioGroup;
    qryReportSales_Order: TIntegerField;
    qryReportOffice_Contact: TIntegerField;
    qryReportOperator: TIntegerField;
    qryReportDate_Required: TDateTimeField;
    qryReportDate_Ordered: TDateTimeField;
    qryReportCust_Order_No: TStringField;
    qryReportCustomer: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportContact_no: TIntegerField;
    qryReportCost_Centre: TStringField;
    qryReportCustomer0: TIntegerField;
    qryReportOrder_Type: TStringField;
    qryReportSales_order_Head_Status: TIntegerField;
    qryReportNarrative: TIntegerField;
    qryReportPart_Store: TIntegerField;
    qryReportDelivery_Customer: TIntegerField;
    qryReportDelivery_Branch: TIntegerField;
    qryReportDiscount: TFloatField;
    qryReportAd_hoc_Address: TIntegerField;
    qryReportDelivery_Notes: TStringField;
    qryReportReplenish_Source: TIntegerField;
    qryReportSupplier: TIntegerField;
    qryReportBranch_no0: TIntegerField;
    qryReportSupp_order_type: TStringField;
    qryReportName: TStringField;
    qryReportPart: TStringField;
    qryReportSell_Pack_Quantity: TIntegerField;
    qryReportQuantity_Ordered: TIntegerField;
    qryReportQuantity_Delivered: TIntegerField;
    qryReportQty_Outstanding: TIntegerField;
    qryReportPurch_Pack_Quantity: TIntegerField;
    qryReportRep_Name: TStringField;
    qryReportPart_Description: TStringField;
    qryReportPart_Cost: TCurrencyField;
    qryReportPart_Sales_Price: TCurrencyField;
    CancelBitBtn: TBitBtn;
    ExcelBitBtn: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure rgRepClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure chkbxPageBreakClick(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
  private
    FActivated : Boolean;
    DateFrom, DateTo : TDateTime;
    selrepcode, SelCustCode: integer;
    SelCustBranch: integer;
    selreptext, SelCustText: string;
    function BuildQueryString : string;
    function Ordering(aBox : TComboBox) : string;
    procedure CanPrint;
    procedure DispSelection;
    procedure FixQuery;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview : Boolean);
    procedure SomethingChanged;
  public
  end;

var
  STRSWorkIPfrm: TSTRSWorkIPfrm;

implementation

uses DateSelV5, PBLUCust, PBLURep, pbDatabase, STRPWorkIP, CCSPrint;

{$R *.DFM}

const

StartSQL =
'SELECT Sales_Order.*, Customer.Name, Sales_Order_line.Part, '+
'Sales_Order_line.Sell_pack_Quantity, Sales_Order_line.Quantity_Ordered, Sales_order_Line.Purch_Pack_Quantity, '+
'Sales_Order_line.Quantity_Delivered, '+
'(Sales_order_Line.Quantity_Ordered-Sales_Order_Line.Quantity_Delivered) AS Qty_Outstanding, '+
'Rep.Name AS Rep_Name, Part.Part_Description, Sales_Order_line.Part_Cost, '+
'Sales_Order_line.Part_Sales_Price '+
'FROM Part INNER JOIN ((((Sales_Order INNER JOIN Customer_Branch ON '+
'(Sales_Order.Branch_no = Customer_Branch.Branch_no) AND '+
'(Sales_Order.Customer = Customer_Branch.Customer)) INNER JOIN Customer ON '+
'Sales_Order.Customer = Customer.Customer) INNER JOIN Sales_Order_line ON '+
'Sales_Order.Sales_Order = Sales_Order_line.Sales_Order) '+
'LEFT JOIN (Rep RIGHT JOIN Sales_OrderRep ON Rep.Rep = Sales_OrderRep.Rep) ON '+
'Sales_Order.Sales_Order = Sales_OrderRep.Sales_Order) ON '+
'Part.Part = Sales_Order_line.Part '+
'WHERE ((Sales_Order_line.Quantity_Delivered < Sales_Order_Line.Quantity_Ordered) ' +
'and (sales_order.sales_order_head_status < 150))';

procedure TSTRSWorkIPfrm.rgRepClick(Sender: TObject);
begin
  RepPanel.Visible := rgRep.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TSTRSWorkIPfrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled := (qryReport.RecordCount > 0) and
    (
    ((rgRep.ItemIndex = 0) and (rgCustomer.ItemIndex = 0)) or
    ((rgRep.ItemIndex = 1) and (edtRep.Text <> '')) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
  ExcelBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TSTRSWorkIPfrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  if DateFromEdit.Text = '' then
    DateFrom := Date;
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  if DateToedit.Text = '' then
    DateTo := Date;
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.DispSelection;
begin
  {Display selection}
  if selrepcode <> 0 then
    edtRep.Text := selreptext
  else
    edtRep.Text := '';
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
end;

function TSTRSWorkIPfrm.InputDate(TempDate: TDateTime): TDateTime;
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
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTRSWorkIPfrm.btnCustomerClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  try
    pbLUCustFrm.bIs_Lookup := True;
    pbLUCustFrm.bAllow_Upd := False;
    pbLUCustFrm.SelCode := SelCustCode;
    pbLUCustFrm.SelBranch := SelCustBranch;
    pbLUCustFrm.bSel_Branch := True;
    pbLUCustFrm.ShowModal;
    if pbLUCustFrm.Selected then
    begin
      SelCustCode := pbLUCustFrm.SelCode;
      SelCustBranch := pbLUCustFrm.SelBranch;
      SelCustText := pbLUCustFrm.SelName + ' / ' + pbLUCustFrm.SelBranchName;
      SomethingChanged;
    end;
  finally
    pbLUCustFrm.Free;
  end;
end;

procedure TSTRSWorkIPfrm.btnRepClick(Sender: TObject);
begin
  pbLURepFrm := TpbLURepFrm.Create(Self);
  try
    pbLURepFrm.SelCode := selrepcode;
    pbLURepFrm.bIs_Lookup := True;
    pbLURepFrm.ShowModal;
    if pbLURepFrm.Selected then
    begin
      selrepcode := pbLURepFrm.SelCode;
//      selrepbranch := pbLURepFrm.SelBranch;
      selreptext := pbLURepFrm.SelName;
      SomethingChanged;
    end;
  finally
    pbLURepFrm.Free;
  end;
end;

procedure TSTRSWorkIPfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgRep.itemindex := 0;
    rgCustomer.ItemIndex := 0;
    rgRepClick(nil);
    rgCustomerClick(nil);
    cbSort1.ItemIndex := 0;
    cbSort2.ItemIndex := 1;
    cbSort3.ItemIndex := 2;
    SomethingChanged;
    FActivated := true;
  end;
end;

procedure TSTRSWorkIPfrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

function TSTRSWorkIPfrm.BuildQueryString: string;
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
  Result := StartSQL;
  if DateFromEdit.Text <> '' then
    Result := Result + ' AND Sales_Order.Date_Ordered >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    Result := Result + ' AND Sales_Order.Date_Required <= ' + qDate(DateTo);
  if (rgRep.ItemIndex = 1) and (selrepcode <> 0) then
  begin
    Result := Result + ' AND Sales_OrderRep.Rep = ' +
      IntToStr(selrepcode);
  end;
  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Customer_Branch.Customer = ' +
      IntToStr(SelCustCode) + ' AND Customer_Branch.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;

  if (totByRadioGroup.ItemIndex >= 0 ) and (totByRadioGroup.ItemIndex < 2)then
    begin
      if TotByRadioGroup.ItemIndex = 0 then
        sTemp := sTemp + 'ORDER BY Customer.Name,'
      else
      if TotByRadioGroup.ItemIndex = 1 then
        sTemp := sTemp + 'ORDER BY Rep.Name,';

      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2) +
            Ordering(cbSort3);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end
  else
    begin
      if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0)
      or (cbSort3.ItemIndex >= 0) then
        begin
          sTemp := ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) +
            Ordering(cbSort3);
          if sTemp[Length(sTemp)] = ',' then
            sTemp[Length(sTemp)] := ' ';
        end
      else
        sTemp := '';
    end;
  Result := Result + sTemp;
end;

procedure TSTRSWorkIPfrm.FixQuery;
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.Text := BuildQueryString;
    qryReport.Open;
  finally
    qryReport.EnableControls;
  end;
end;

procedure TSTRSWorkIPfrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TSTRSWorkIPfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSWorkIPfrm.CallReport(const bPreview: Boolean);
var
  STRPWorkIPfrm: TSTRPWorkIPfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryReport.Close;
  STRPWorkIPfrm := TSTRPWorkIPfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
          STRPWorkIPfrm.PrinterSettings := PrinterSettings;
          STRPWorkIPfrm.qryReport.SQL.Clear;
          if TotByRadioGroup.itemIndex >= 0 then
            begin
            if TotByRadioGroup.ItemIndex = 0 then
              STRPWorkIPfrm.TotalByCust := True
            else
            if TotByRadioGroup.ItemIndex = 1 then
              STRPWorkIPfrm.TotalByRep := True
            else
              begin
                STRPWorkIPfrm.TotalByCust := False;
                STRPWorkIPfrm.TotalBySupp := False;
                STRPWorkIPfrm.TotalByRep := False;
              end;
            end;
    {      if chkPageBreak.checked then
              STRPWorkIPfrm.BreakOnRep := true
          else
            STRPWorkIPFrm.BreakOnRep := false;   }
          STRPWorkIPfrm.QRlblDt.Caption :='';

          if DateFromEdit.Text <> '' then
            STRPWorkIPfrm.QRlblDt.Caption :='Ordered Since ' + DateFromEdit.Text+ ' ';
          if DateToEdit.Text <> '' then
            STRPWorkIPfrm.QRlblDt.Caption :='Delivery Due Before '+ DateToEdit.Text;
          If (cbsort1.text = '') and (cbsort2.text = '') and (cbsort3.Text = '') then
            STRPWorkIPFrm.QRLblSeqBy.Caption := ''
          else
            begin
             STRPWorkIPFrm.QRLblSeqBy.Caption := 'Sequenced by ';
             If Cbsort1.Text <> '' then
              STRPWorkIPFrm.QRLblSeqBy.Caption := STRPWorkIPFrm.QRLblSeqBy.Caption + CbSort1.Text;
             If Cbsort2.Text <> '' then
              STRPWorkIPFrm.QRLblSeqBy.Caption := STRPWorkIPFrm.QRLblSeqBy.Caption + ', '+CbSort2.Text;
             If Cbsort3.Text <> '' then
              STRPWorkIPFrm.QRLblSeqBy.Caption := STRPWorkIPFrm.QRLblSeqBy.Caption + ', '+CbSort3.Text;
           end;
          STRPWorkIPfrm.ShowSalesValue := True;
          STRPWorkIPFrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
          STRPWorkIPFrm.qryReport.SQL.Text := qryReport.SQL.Text;
          if bPreview then
            STRPWorkIPfrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              STRPWorkIPfrm.QuickReport.Print;
          STRPWorkIPfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryReport.Open;
  end;
end;

procedure TSTRSWorkIPfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

function TSTRSWorkIPfrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:    begin
         if TotByRadioGroup.itemindex = 0 then
          Result := ''
         else
          Result := ' Customer.Name,'
        end;
  1:   Result := ' Sales_Order_Line.Sales_Order, Sales_order_line.Sales_Order_Line_No,';
  2:   Result := ' Sales_Order.Date_Ordered,';
  3:   Result := ' Sales_Order.Date_Required,';
  4:    begin
         if TotByRadioGroup.itemindex = 1 then
          Result := ''
         else
          Result := ' Rep.Name,';
        end
  else Result := '';
  end;
end;

procedure TSTRSWorkIPfrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort1.ItemIndex then
      cbSort3.ItemIndex := -1;
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;      
  end
  else
  if cbSort2.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort3.ItemIndex >= 0) and (cbSort2.ItemIndex < 0) then
  begin
    cbSort2.ItemIndex := cbSort3.ItemIndex;
    cbSort3.ItemIndex := -1;
  end;
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateFromEdit.Text <> '' then
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
  end;
  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text <> '' then
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
  end;
  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.chkbxPageBreakClick(Sender: TObject);
begin
  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := TotByRadioGroup.itemindex <> 2;
  if TotByRadioGroup.itemindex = 2 then
    chkbxPageBreak.checked := false;

  SomethingChanged;
end;

procedure TSTRSWorkIPfrm.ExcelBitBtnClick(Sender: TObject);
var
  tempFileName: string;
  STRPWorkIPfrm: TSTRPWorkIPfrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPWorkIPfrm := TSTRPWorkIPfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPWorkIPfrm.PrinterSettings := PrinterSettings;
      STRPWorkIPfrm.qryReport.SQL.Clear;
      if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            STRPWorkIPfrm.TotalByCust := True
          else
          if TotByRadioGroup.ItemIndex = 1 then
            STRPWorkIPfrm.TotalByRep := True
          else
            begin
              STRPWorkIPfrm.TotalByCust := False;
              STRPWorkIPfrm.TotalBySupp := False;
              STRPWorkIPfrm.TotalByRep := False;
            end;
        end;

      STRPWorkIPFrm.qryReport.SQL.Text := qryReport.SQL.Text;
      STRPWorkIPfrm.ShowSalesValue := True;
      self.prgbrExport.Max := qryReport.RecordCount;
      tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      STRPWorkIPFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;

      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryReport.Open;
  end;
end;

end.
