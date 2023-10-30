unit PBRSJBMargin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, CCSCommon,
  OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSJBMarginfrm = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    Panel2: TPanel;
    rgCustomer: TRadioGroup;
    dbgJobBag: TDBGrid;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    rgSupplier: TRadioGroup;
    SupplierPanel: TPanel;
    lblSupplier: TLabel;
    edtSupplier: TEdit;
    btnSupplier: TButton;
    Panel3: TPanel;
    qryReport: TFDQuery;
    dsReport: TDataSource;
    qryReportJob_Bag: TIntegerField;
    qryReportJob_Bag_Line: TIntegerField;
    qryReportJob_Bag_Line_Descr: TStringField;
    qryReportCustomer_Name: TStringField;
    qryReportSupplier_Name: TStringField;
    qryReportJob_Bag_Line_Cost: TCurrencyField;
    qryReportJob_Bag_Line_Sell: TCurrencyField;
    qryReportJob_Bag_Quantity: TIntegerField;
    qryReportVAT_Code: TIntegerField;
    qryReportJob_Bag_Line_Type: TStringField;
    qryReportCust_Order_No: TStringField;
    qryReportRep: TIntegerField;
    qryReportRep_Name: TStringField;
    qryReportVat_Rate: TFloatField;
    qryReportDate_Point: TDateTimeField;
    qryReportCustomer: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportCustomer_Branch_Name: TStringField;
    qryReportSupplier: TIntegerField;
    qryReportSupplier_Branch_no: TIntegerField;
    qryReportSupplier_Branch_Name: TStringField;
    oldqryReport: TFDQuery;
    qryReportPurchase_Order: TFloatField;
    qryReportInactive: TStringField;
    qryReportJob_Bag_Descr: TStringField;
    chkbxPageBreak: TCheckBox;
    RdGrpRepType: TRadioGroup;
    lblDateFrom: TLabel;
    edtDateFrom: TEdit;
    btnDatefrom: TSpeedButton;
    lblDateto: TLabel;
    edtDateTo: TEdit;
    btnDateTo: TSpeedButton;
    TotByRadioGroup: TRadioGroup;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    chkbxInvoicedValues: TCheckBox;
    qryReportAnalysis_Code_1: TStringField;
    qryReportAnalysis_Code_2: TStringField;
    procedure btnDatefromClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure rgSupplierClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    FActivated : Boolean;
    DateFrom, DateTo : TDateTime;
    SelSuppCode, SelCustCode: integer;
    SelSuppBranch, SelCustBranch: integer;
    SelSuppText, SelCustText: string;
    procedure SomethingChanged;
    procedure FixQuery;
    function BuildQueryString: string;
    procedure DispSelection;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure Canprint;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aGroup: TRadioGroup): string;
  public
    { Public declarations }
  end;

var
  PBRSJBMarginfrm: TPBRSJBMarginfrm;

implementation

uses UITypes, PBLUSupp, PBLUCust, PBDatabase, DateSelV5, PBRPJBMargin, CCSPrint, Printers;

{$R *.DFM}

const
  StartSQL =
    'SELECT 	Job_Bag_Line_Dets.Job_Bag, '+
	  '  Job_Bag_Line_Dets.Job_Bag_Line, '+
	  '  Job_Bag_Line_Dets.Job_Bag_Line_Descr, '+
	  '  Customer.Name AS Customer_Name, '+
	  '  Supplier.Name AS Supplier_Name, '+
	  '  Job_Bag_Line_Dets.Job_Bag_Line_Cost, '+
	  '  Job_Bag_Line_Dets.Job_Bag_Line_Sell, '+
	  '  Job_Bag_Line_Dets.Job_Bag_Quantity, '+
	  '  Job_Bag_Line_Dets.VAT_Code, '+
	  '  Job_Bag_Line_Dets.Job_Bag_Line_Type, '+
	  '  Job_Bag_Line_Dets.Purchase_Order, '+
	  '  Job_Bag_Line_Dets.Line, '+
	  '  Job_Bag.Cust_Order_No, '+
	  '  Rep.Rep, '+
	  '  Rep.Name AS Rep_Name, '+
	  '  Vat_Code.Vat_Rate, '+
	  '  Job_Bag.Date_Point, '+
	  '  Job_Bag.Date_Start, '+
	  '  Job_Bag.Quantity, '+
	  '  Job_Bag.Customer, '+
	  '  Job_Bag.Branch_No, '+
	  '  Customer_Branch.Name AS Customer_Branch_Name, '+
    '  Customer.Analysis_Code_1, '+
    '  Customer.Analysis_Code_2, '+
    '  (SELECT CB.Account_Code '+
    '   FROM Customer_Branch CB '+
    '   WHERE CB.Customer = Customer_Branch.Inv_To_Customer AND '+
    '         CB.Branch_No = Customer_Branch.Inv_To_Branch) AS Account_Code, '+
	  '  Job_Bag_Line_Dets.Supplier, '+
	  '  Job_Bag_Line_Dets.Branch_No AS Supplier_Branch_no, '+
	  '  Supplier_Branch.Name AS Supplier_Branch_Name, '+
	  '  Purchase_OrderLine.Inactive, '+
    '  Job_Bag.Job_Bag_Descr, '+
    '  Job_Bag.Office_Contact, '+
    '  Operator.Name as Account_Manager, '+
    '  Job_Bag.Goods_Required, '+
    '  Job_Bag.Ready_for_Invoicing, '+
    '  Job_Bag_Line_Dets.Product_Type '+
    'FROM Purchase_OrderLine '+
	  '  RIGHT JOIN (Vat_Code '+
	  '  INNER JOIN ((Supplier '+
	  '  INNER JOIN Supplier_Branch ON '+
		'    Supplier.Supplier = Supplier_Branch.Supplier) '+
	  '  INNER JOIN (Customer '+
    '  INNER JOIN ((Rep '+
	  '  INNER JOIN (Customer_Branch '+
	  '  INNER JOIN Job_Bag ON '+
		'    (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND '+
		'    (Customer_Branch.Customer = Job_Bag.Customer)) ON '+
		'    Rep.Rep = Job_Bag.Rep) '+
	  '  INNER JOIN Job_Bag_Line_Dets ON '+
		'    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON '+
		'    Customer.Customer = Customer_Branch.Customer) ON '+
		'    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AND '+
		'    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON '+
    '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON '+
		'    (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND '+
		'    (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchase_Order) '+
    '  INNER JOIN Operator ON Job_Bag.Office_Contact = Operator.Operator '+
    'WHERE ((Purchase_orderLine.InActive <> ''Y'') or '+
    '       (Purchase_orderLine.Inactive is NULL)) AND '+
    '      ((Job_Bag_Line_Dets.InActive = ''N'') or '+
    '       (Job_Bag_Line_Dets.Inactive is NULL)) AND ' +
    '      ((Job_Bag.InActive = ''N'') or '+
    '       (Job_Bag.Inactive is NULL)) ';

procedure TPBRSJBMarginfrm.btnDatefromClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  SomethingChanged;
end;

procedure TPBRSJBMarginfrm.btnDateToClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
  SomethingChanged;
end;

procedure TPBRSJBMarginfrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateFrom.Text <> '' then
  begin
    try
      NewDate := StrToDate(edtDateFrom.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateFrom.SetFocus;
        Exit;
      end;
    end;
    edtDateFrom.Text := PBDatestr(NewDate);
    DateFrom := NewDate;
  end;
  SomethingChanged;
end;

procedure TPBRSJBMarginfrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateTo.Text <> '' then
  begin
  try
    NewDate := StrToDate(edtDateTo.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateTo.SetFocus;
        Exit;
      end;
    end;
    edtDateTo.Text := PBDatestr(NewDate);
    DateTo := NewDate;
  end;
  SomethingChanged;
end;

procedure TPBRSJBMarginfrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSJBMarginfrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSJBMarginfrm.Canprint;
begin
  {Check if can print}
  btnPrint.Enabled := (qryReport.RecordCount > 0) and
    (
    ((rgSupplier.ItemIndex = 0) and (rgCustomer.ItemIndex = 0)) or
    ((rgSupplier.ItemIndex = 1) and (edtSupplier.Text <> '')) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  btnPreview.Enabled := btnPrint.Enabled;
end;

procedure TPBRSJBMarginfrm.FixQuery;
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

procedure TPBRSJBMarginfrm.DispSelection;
begin
  {Display selection}
  if SelSuppCode <> 0 then
    edtSupplier.Text := SelSuppText
  else
    edtSupplier.Text := '';
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
end;

procedure TPBRSJBMarginfrm.rgSupplierClick(Sender: TObject);
begin
  SupplierPanel.Visible := rgSupplier.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSJBMarginfrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.SelCode := SelSuppCode;
    PBLUSuppFrm.SelBranch := SelSuppBranch;
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSuppCode := PBLUSuppFrm.SelCode;
      SelSuppBranch := PBLUSuppFrm.SelBranch;
      SelSuppText := PBLUSuppFrm.SelName + ' / ' + PBLUSuppFrm.SelBranchName;
      SomethingChanged;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
end;

procedure TPBRSJBMarginfrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.SelBranch := SelCustBranch;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustText := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
      SomethingChanged;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

function TPBRSJBMarginfrm.BuildQueryString: string;
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
  if dmBroker.UseProduction then
    begin
      if edtDatefrom.Text <> '' then
        Result := Result + ' AND Job_Bag.Goods_Required >= ' + qDate(DateFrom);
      if edtDateTo.Text <> '' then
        Result := Result + ' AND Job_Bag.Goods_Required <= ' + qDate(DateTo);
    end
  else
    begin
      if edtDatefrom.Text <> '' then
        Result := Result + ' AND Job_Bag.Date_Point >= ' + qDate(DateFrom);
      if edtDateTo.Text <> '' then
        Result := Result + ' AND Job_Bag.Date_Point <= ' + qDate(DateTo);
    end;

  if (rgSupplier.ItemIndex = 1) and (SelSuppCode <> 0) then
  begin
    Result := Result + ' AND Job_Bag_Line_Dets.Supplier = ' +
      IntToStr(SelSuppCode) + ' AND Job_Bag_Line_Dets.Branch_No = ' +
      IntToStr(SelSuppBranch);
  end;
  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Job_bag.Customer = ' +
      IntToStr(SelCustCode) + ' AND Job_Bag.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;

  if TotByRadioGroup.itemIndex <= 4 then
    begin
      sTemp := ' ORDER BY ' + Ordering(TotByRadioGroup) ;
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end
  else
    sTemp := '';

  Result := Result + sTemp;
end;

function TPBRSJBMarginfrm.InputDate(TempDate: TDateTime): TDateTime;
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

function TPBRSJBMarginfrm.Ordering(aGroup: TRadioGroup): string;
begin
  case aGroup.ItemIndex of
  0:    Result := ' Customer.Name, Job_Bag.Job_Bag,';
  1:    Result := ' Supplier.Name, Job_Bag.Job_Bag,';
  2:    Result := ' Rep.Name, Job_Bag.Job_Bag,';
  3:    Result := ' Operator.Name, Job_Bag.Job_Bag,';
  4:    Result := ' Job_Bag.Job_Bag,';
  else Result := '';
  end;
end;

procedure TPBRSJBMarginfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    DateFrom := Date();
    edtDateFrom.Text := DateToStr(DateFrom);
    DateTo := Date();
    edtDateTo.Text := DateToStr(DateTo);
    rgSupplier.itemindex := 0;
    rgCustomer.ItemIndex := 0;
    rgSupplierClick(nil);
    rgCustomerClick(nil);
    SomethingChanged;
    FActivated := true;
  end;
end;

procedure TPBRSJBMarginfrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
  SomethingChanged;
end;
procedure TPBRSJBMarginfrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSJBMarginfrm.btnPreviewClick(Sender: TObject);
begin
 CallReport(true);
end;

procedure TPBRSJBMarginfrm.CallReport(const bPreview: Boolean);
var
  PBRPJBMarginfrm: TPBRPJBMarginfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryReport.Close;
  PBRPJBMarginfrm := TPBRPJBMarginfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
//          PBRPJBMarginfrm.PrinterSettings := PrinterSettings;
          PBRPJBMarginfrm.qryReport.SQL.Clear;
          If EdtDateFrom.Text = '' then
            PBRPJBMarginFrm.QRLblTotBy.caption :='Dated From: First '
          else
            PBRPJBMarginFrm.QRLblTotBy.caption :=
              'Dated From: '+ EdtDateFrom.Text ;
          If EdtDateTo.Text = '' then
            PBRPJBMarginFrm.QRLblTotBy.caption := PBRPJBMarginFrm.QRLblTotBy.caption +'- Last'
          else
           PBRPJBMarginFrm.QRLblTotBy.caption := PBRPJBMarginFrm.QRLblTotBy.caption + '- ' + EdtDateTo.Text;
          if TotByRadioGroup.itemIndex >= 0 then
            begin
            if TotByRadioGroup.ItemIndex = 0 then
              begin
                PBRPJBMarginfrm.TotalByCust := True;
                PBRPJBMarginFrm.QRLblTotBy.caption := PBRPJBMarginFrm.QRLblTotBy.caption +' Totalled By Customer';
              end
            else
            if TotByRadioGroup.ItemIndex = 1 then
              begin
                PBRPJBMarginfrm.TotalBySupp := True;
                PBRPJBMarginFrm.QRLblTotBy.caption := PBRPJBMarginFrm.QRLblTotBy.caption +' Totalled By Supplier';
              end
            else
            if TotByRadioGroup.ItemIndex = 2 then
              begin
                PBRPJBMarginfrm.TotalByRep := True;
                PBRPJBMarginFrm.QRLblTotBy.caption := PBRPJBMarginFrm.QRLblTotBy.caption+ ' Totalled By Rep';
              end
            else
            if TotByRadioGroup.ItemIndex = 3 then
              begin
                PBRPJBMarginfrm.TotalByAccManager := True;
                PBRPJBMarginFrm.QRLblTotBy.caption := PBRPJBMarginFrm.QRLblTotBy.caption + ' Totalled By Account Manager';
              end
            else
              begin
                PBRPJBMarginfrm.TotalByCust := False;
                PBRPJBMarginfrm.TotalBySupp := False;
                PBRPJBMarginfrm.TotalByRep := False;
 //               PBRPJBMarginfrm.QRLblTotBy.enabled := False;
              end;
            end;
          PBRPJBMarginfrm.bInvoicedValues := (chkbxInvoicedValues.checked);
          PBRPJBMarginfrm.bSummary := (rdgrpRepType.itemindex = 0);
          PBRPJBMarginFrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
          PBRPJBMarginFrm.qryReport.SQL.Text := qryReport.SQL.Text;
          if bPreview then
            PBRPJBMarginfrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPJBMarginfrm.QuickReport.Print;
          PBRPJBMarginfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryReport.Open;
  end;
end;

procedure TPBRSJBMarginfrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  if dmBroker.UseProduction then
    begin
      lblDatefrom.caption := 'Req '+ lblDatefrom.caption;
      lblDateTo.caption := 'Req '+ lblDateTo.caption;
    end;

  DateFrom := (Date);
  DateTo := (Date);
end;

procedure TPBRSJBMarginfrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := TotByRadioGroup.itemindex <> 4;
  if TotByRadioGroup.itemindex = 4 then
    begin
      chkbxPageBreak.checked := false;
      chkbxPageBreak.caption := 'Page break by total';
    end
  else
    chkbxPageBreak.caption := 'Page break ' + TotByRadioGroup.items[TotByRadioGroup.itemindex];

  cbSortChange(self);
end;

procedure TPBRSJBMarginfrm.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
  PBRPJBMarginfrm: TPBRPJBMarginfrm;
begin
  PBRPJBMarginfrm := TPBRPJBMarginfrm.Create(Self);
  try
    PBRPJBMarginfrm.qryReport.SQL.Clear;
    if TotByRadioGroup.ItemIndex = 0 then
      PBRPJBMarginfrm.TotalByCust := True
    else
    if TotByRadioGroup.ItemIndex = 1 then
      PBRPJBMarginfrm.TotalBySupp := True
    else
    if TotByRadioGroup.ItemIndex = 2 then
      PBRPJBMarginfrm.TotalByRep := True
    else
    if TotByRadioGroup.ItemIndex = 3 then
      PBRPJBMarginfrm.TotalByAccManager := True
    else
      begin
        PBRPJBMarginfrm.TotalByCust := False;
        PBRPJBMarginfrm.TotalBySupp := False;
        PBRPJBMarginfrm.TotalByRep := False;
      end;

    PBRPJBMarginfrm.bInvoicedValues := (chkbxInvoicedValues.checked);
    PBRPJBMarginfrm.bSummary := (rdgrpRepType.itemindex = 0);
    PBRPJBMarginFrm.qryReport.SQL.Text := qryReport.SQL.Text;
    self.prgbrExport.Max := qryReport.RecordCount;
    tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPJBMarginfrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    PBRPJBMarginfrm.Free;
    Application.ProcessMessages;
  end;
end;

end.
