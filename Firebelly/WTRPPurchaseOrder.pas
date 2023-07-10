unit WTRPPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmwtRPPurchaseOrder = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TgtQRLabel;
    qrGroupbyText: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    qrlblDateRange: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    qrGroupbyFootText: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRSysData2: TgtQRSysData;
    QRDBText1: TgtQRDBText;
    QRLabel9: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRLabel1: TgtQRLabel;
    qrlblSelection: TgtQRLabel;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    qrlblGoodsTotal: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    SupplierGoods, SupplierVAT, SupplierTotal, ReportGoods, ReportVAT, ReportTotal: real;
  public
    SortBy: integer;
    supplier, operator: integer;
    supplierList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPPurchaseOrder: TfrmwtRPPurchaseOrder;

implementation

uses wtDataModule, WTRSPurchaseOrder;

{$R *.dfm}

procedure TfrmwtRPPurchaseOrder.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupFooter.enabled := false;
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
      end;
    1:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Date_Raised';
        qrGroupByText.DataField := 'Date_Raised';
        qrlblSortBy.Caption := 'Date Raised';
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Supplier_Name';
        qrGroupByText.DataField := 'Supplier_Name';
        qrlblSortBy.Caption := 'Supplier';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Status_Description';
        qrGroupByText.DataField := 'Status_Description';
        qrlblSortBy.Caption := 'Status';
      end;
    4:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Office_Contact_Name';
        qrGroupByText.DataField := 'Office_Contact_Name';
        qrlblSortBy.Caption := 'Office_Contact';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  SupplierGoods := 0.00;
  SupplierVAT := 0.00;
  SupplierTotal := 0.00;

  ReportGoods := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPPurchaseOrder.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblGoodsTotal.Caption := formatfloat('0.00',qryReport.fieldbyname('Total_Value').AsFloat);

  SupplierGoods := SupplierGoods + qryReport.fieldbyname('Goods_Value').asfloat;
  SupplierVAT := SupplierVat + qryReport.fieldbyname('Vat_Value').asfloat;
  SupplierTotal := SupplierTotal + qryReport.fieldbyname('Total_Value').asfloat;

  ReportGoods := ReportGoods +  qryReport.fieldbyname('Goods_Value').asfloat;
  ReportVAT := ReportVAT +  qryReport.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal +  qryReport.fieldbyname('Total_Value').asfloat;
end;

procedure TfrmwtRPPurchaseOrder.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  SupplierGoods := 0.00;
  SupplierVAT := 0.00;
  SupplierTotal := 0.00;
end;

procedure TfrmwtRPPurchaseOrder.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//  qrlblCustGoods.caption := formatfloat('0.00',SupplierGoods);
//  qrlblCustVAT.caption := formatfloat('0.00',SupplierVAT);
  qrlblCustTotal.caption := formatfloat('0.00',SupplierTotal);
end;

function TfrmwtRPPurchaseOrder.GetDetails: integer;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  if SupplierList.Count > 0 then
    begin
      qryReport.SQL.Add(' AND (');
      for icount := 0 to pred(SupplierList.Count) do
        begin
          if iCount = 0 then
            qryReport.SQL.Add('(Purchase_Order.Supplier = ' + SupplierList[iCount] + ')')
          else
            qryReport.SQL.Add(' OR (Purchase_Order.Supplier = ' + SupplierList[iCount] + ')')
        end;
      qryReport.SQL.Add(')');
    end;

  case sortby of
    0:begin
        qryReport.SQL.Add('ORDER BY Purchase_Order.Purchase_Order');
      end;
    1:begin
        qryReport.SQL.Add('ORDER BY Purchase_Order.Date_Raised, Purchase_Order.Purchase_Order');
      end;
    2:begin
        qryReport.SQL.Add('ORDER BY Supplier.Supplier_Name, Purchase_Order.Purchase_Order');
      end;
    3:begin
        qryReport.SQL.Add('ORDER BY Purchase_Order.Purchase_Order_Status, Purchase_Order.Purchase_Order');
      end;
    4:begin
        qryReport.SQL.Add('ORDER BY Office_Contact.Operator, Purchase_Order.Purchase_Order');
      end;
  end;

  qryReport.Close;

//  qryReport.parambyname('Supplier_List').asstring := SupplierList;
//  qryReport.parambyname('Supplier').asinteger := Supplier;
  qryReport.parambyname('Office_Contact').asinteger := Operator;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPPurchaseOrder.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  qrlblReportGoods.caption := formatfloat('0.00',ReportGoods);
//  qrlblReportVAT.caption := formatfloat('0.00',ReportVAT);
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
end;

procedure TfrmwtRPPurchaseOrder.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPPurchaseOrder.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Purchase Order"'
    + ',"Supplier"'
    + ',"Date Raised"'
    + ',"Date Required"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Office Contact"'
    + ',"Operator"'
    + ',"Status"'
    + ',"Total Goods"'
    + ',"On Hold"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPPurchaseOrder.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //PO
    tempStr := '"' + qryReport.fieldbyname('Purchase_Order').asstring + '"';

    //Supplier
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Supplier_Name').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Raised').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Required').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Descriptive_Reference').asstring + '"';

    //Reference
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Reference').asstring + '"';

    //Office Contact
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Office_Contact_Name').asstring + '"';

    //Operator
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Operator_Name').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Status_Description').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Total_Value').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + qryReport.fieldbyname('ON_Hold').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSPurchaseOrder.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPPurchaseOrder.FormCreate(Sender: TObject);
begin
  SupplierList := TStringList.Create;
end;

procedure TfrmwtRPPurchaseOrder.FormDestroy(Sender: TObject);
begin
  SupplierList.Free;
end;

end.
