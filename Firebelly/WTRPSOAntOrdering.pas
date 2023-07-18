unit WTRPSOAntOrdering;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables;

type
  TfrmWTRPSOAntOrdering = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TQuery;
    qrbGroupHeader: TQRGroup;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel7: TQRLabel;
    qrGroupbyFootText: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    qrlblCustGoods: TQRLabel;
    qrlblCustVAT: TQRLabel;
    qrlblReportVAT: TQRLabel;
    qrlblReportGoods: TQRLabel;
    QRLabel1: TQRLabel;
    qrlblSelection: TQRLabel;
    gtQRLabel1: TQRLabel;
    qrsbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    qrlblTemplateDate: TQRLabel;
    qrlblFittingDate: TQRLabel;
    qrlblDescription: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    qrlblSlabDescription: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel4: TQRLabel;
    gtQRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    qrlblGoodsValue: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrlblMaterialCost: TQRLabel;
    qrlblCustCost: TQRLabel;
    qrlblReportCost: TQRLabel;
    qrlblWorktopMaterial: TQRLabel;
    qryWTElement: TQuery;
    OLDqrySalesOrders: TQuery;
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
    CustomerGoods, CustomerVAT, CustomerTotal, CustomerCost, ReportGoods, ReportVAT, ReportTotal, ReportCost: real;
    FCustomerCategory: integer;
    FSelectBy: integer;
    procedure SetCustomerCategory(const Value: integer);
    procedure SetSelectBy(const Value: integer);
  public
    bShowOnlyScheduled: boolean;
    bIncludeInvoiced: boolean;
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    property SelectBy: integer read FSelectBy write SetSelectBy;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPSOAntOrdering: TfrmWTRPSOAntOrdering;

implementation

uses wtDataModule, WTRSSOAntOrdering, AllCommon;

{$R *.dfm}

procedure TfrmWTRPSOAntOrdering.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
        qrbGroupFooter.enabled := false;
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
(*
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Date_Required';
        qrGroupByText.DataField := 'Date_Required';
        qrlblSortBy.Caption := 'Fitting Date';
*)
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
  CustomerCost := 0.00;

  ReportGoods := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
  ReportCost := 0.00;
end;

procedure TfrmWTRPSOAntOrdering.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iCount: integer;
begin
  {Reset the colour to white}
  qrsbDetails.color := clWhite;
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount] is TQRDBText then
        begin
          TQRDBText(Components[iCount]).color := clWhite;
          TQRDBText(Components[iCount]).font.Style := [];
        end;
      if Components[iCount] is TQRLabel then
        begin
          TQRLabel(Components[iCount]).color := clWhite;
          TQRLabel(Components[iCount]).font.Style := [];
        end;
      if Components[iCount] is TQRRichText then
        begin
          TQRRichText(Components[iCount]).color := clWhite;
          TQRRichText(Components[iCount]).font.Style := [];
        end;
    end;

  if qrySalesOrders.fieldbyname('IsFittingInOutlook').asstring = 'Y' then
    begin
      qrsbDetails.color := clMoneyGreen;
      for iCount := 0 to pred(componentcount) do
        begin
          if Components[iCount].Tag = 1 then
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).color := clMoneyGreen;
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).color := clMoneyGreen;
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).color := clMoneyGreen;
            end
          else
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).color := clWhite;
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).color := clWhite;
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).color := clWhite;
            end;

        end;
    end;

  if qrySalesOrders.fieldbyname('Sales_Order_Status').asinteger >= 90 then
    begin
//      qrsbDetails.Font.Style := [fsitalic, fsbold];
      for iCount := 0 to pred(componentcount) do
        begin
          if Components[iCount].Tag = 1 then
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).font.Style := [fsitalic, fsbold];
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).font.Style := [fsitalic, fsbold];
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).font.Style := [fsitalic, fsbold];
            end
          else
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).font.Style := [];
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).font.Style := [];
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).font.Style := [];
            end;

        end;
    end;

  qrlblTemplateDate.caption := paDateStr(qrySalesOrders.fieldbyname('Template_Date').asdatetime);
  qrlblFittingDate.caption := paDateStr(qrySalesOrders.fieldbyname('Date_Required').asdatetime);
  qrlblDescription.caption := qrySalesOrders.fieldbyname('Thickness_mm').asstring + ' ' + qrySalesOrders.fieldbyname('Worktop_Description').asstring + ' ' + qrySalesOrders.fieldbyname('Material_Description').asstring;
  qrlblSlabDescription.caption := qrySalesOrders.FieldByName('Slab_Length').Asstring + ' x ' + qrySalesOrders.FieldByName('Slab_Depth').Asstring;

//  qrlblGoodsValue.caption := formatfloat('£#,##0.00',qrySalesOrders.FieldByName('Goods_Value').Asfloat);
  qrlblGoodsValue.caption := formatfloat('£#,##0.00',qrySalesOrders.FieldByName('Unit_Price').Asfloat);
  qrlblMaterialCost.caption := formatfloat('£#,##0.00',qrySalesOrders.FieldByName('Total_Slab_Cost').Asfloat);

  CustomerGoods := CustomerGoods + qrySalesOrders.fieldbyname('Unit_Price').asfloat;
  ReportGoods := ReportGoods +  qrySalesOrders.fieldbyname('Unit_Price').asfloat;
  CustomerCost := CustomerCost + qrySalesOrders.fieldbyname('Total_Slab_Cost').asfloat;
  ReportCost := ReportCost + qrySalesOrders.fieldbyname('Total_Slab_Cost').asfloat;

  with qryWTElement do
    begin
      close;
      parambyname('Quote').asinteger := qrySalesOrders.fieldbyname('Quote').asinteger;
      open;
      qrlblWorktopMaterial.caption := fieldbyname('Worktop_Material').asstring;
    end;

(*
  CustomerVAT := CustomerVat + qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qrySalesOrders.fieldbyname('Total_Value').asfloat;

  ReportVAT := ReportVAT +  qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal +  qrySalesOrders.fieldbyname('Total_Value').asfloat;
*)
end;

procedure TfrmWTRPSOAntOrdering.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
  CustomerCost := 0.00;
end;

procedure TfrmWTRPSOAntOrdering.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustGoods.caption := formatfloat('£#,##0.00',CustomerGoods);
  qrlblCustVAT.caption := formatfloat('£#,##0.00',CustomerVAT);
  qrlblCustTotal.caption := formatfloat('£#,##0.00',CustomerTotal);
  qrlblCustCost.caption := formatfloat('£#,##0.00',CustomerCost);
end;

function TfrmWTRPSOAntOrdering.GetDetails: integer;
var
  sDateTo: string;
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
  case SelectBy of
    1: begin
        qrySalesOrders.SQL.Add(' AND ((Sales_Order.Date_Type = ''C'')) ');
       end;
    2: begin
        qrySalesOrders.SQL.Add(' AND ((Sales_Order.Date_Type = ''P'')) ');
       end;
  end;

  if customerList.Count > 0 then
    begin
      qrySalesOrders.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qrySalesOrders.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qrySalesOrders.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qrySalesOrders.SQL.Add(')');
    end;

  qrySalesOrders.SQL.Add(
      'GROUP BY ' +
      ' Sales_Order.Sales_Order, ' +
      ' Sales_Order_Line.Quote, ' +
      ' Sales_Order.Date_Raised, ' +
      ' Sales_Order.Sales_Order_Status, ' +
      ' Sales_Order.Template_Date, ' +
      ' Sales_Order.Date_Required, ' +
      ' Sales_Order.Customer_Name, ' +
      ' Sales_Order.Reference, ' +
      ' Sales_Order.IsFittingInOutlook, ' +
      ' Customer.Is_Retail_Customer, ' +
      ' Customer.Is_Commercial_Customer, ' +
      ' Sales_Order.Rep, ' +
      ' Rep.Rep_Name, ' +
      ' Worktop.Description, ' +
      ' Material_Type.Description, ' +
      ' Thickness.Thickness_mm, ' +
      ' Quote_Slab.Length, ' +
      ' Quote_Slab.Depth, ' +
      ' Sales_Order_Status.Sales_Order_Status_Desc, '+
      ' Sales_Order.Goods_Value, '+
      ' Sales_Order.VAT_Value, '+
      ' Sales_Order_Line.Unit_Price');

  case sortby of
    0:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order');
      end;
    1:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Date_Required, Sales_Order.Sales_Order');
      end;
    2:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Customer_Name, Sales_Order.Sales_Order');
      end;
    3:begin
        qrySalesOrders.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Order.Sales_Order');
      end;
  end;

  qrySalesOrders.Close;

  case CustomerCategory of
        0:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'A';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qrySalesOrders.ParambyName('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;
  if bShowOnlyScheduled then
    qrySalesOrders.parambyname('IsFittingInOutlook').asstring := 'Y'
  else
    qrySalesOrders.parambyname('IsFittingInOutlook').asstring := 'N';
    
  if self.bIncludeInvoiced then
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 110
  else
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 55;

  sDateTo := padatestr(DateTo);
  qrySalesOrders.parambyname('Rep').asinteger := rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom + StrToTime('00:00:00');
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo + StrToTime('23:59:59');
  qrySalesOrders.Open;
  result := qrySalesOrders.recordcount;
end;

procedure TfrmWTRPSOAntOrdering.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportGoods.caption := formatfloat('£#,##0.00',ReportGoods);
  qrlblReportVAT.caption := formatfloat('£#,##0.00',ReportVAT);
  qrlblReportTotal.caption := formatfloat('£#,##0.00',ReportTotal);
  qrlblReportCost.caption := formatfloat('£#,##0.00',ReportCost);
end;

procedure TfrmWTRPSOAntOrdering.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmWTRPSOAntOrdering.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Sales Order"'
    + ',"Order Date"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Template Date"'
    + ',"Fitting Date"'
    + ',"Reference"'
    + ',"Rep"'
    + ',"Slab Thickness"'
    + ',"Slab Colour"'
    + ',"Slab Material"'
    + ',"Slab Size"'
    + ',"No of Slabs"'
    + ',"Goods Value"'
    + ',"Material Cost"'
    + ',"Worktop Thickness"'
    + ',"Worktop Colour"'
    + ',"Worktop Material"'
    + ',"Status"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPSOAntOrdering.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Order
    tempStr := '"' + qrySalesOrders.fieldbyname('Sales_Order').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Raised').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Customer_Name').asstring + '"';

    //Category
    if qrySalesOrders.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
    if qrySalesOrders.fieldbyname('Is_Commercial_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Commercial' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';

    //Template Date
    tempStr := tempStr + ',"' + paDateStr(qrySalesOrders.fieldbyname('Template_Date').asdatetime) + '"';

    //Fittimng Date
    tempStr := tempStr + ',"' + paDateStr(qrySalesOrders.fieldbyname('Date_Required').asdatetime) + '"';

    //Reference
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Rep_Name').asstring + '"';

    //Thickness
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Thickness_mm').asstring + '"';

    //Colour
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Worktop_Description').asstring + '"';

    //Material Brand
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Material_Description').asstring + '"';

    //Slab Size
    tempStr := tempStr + ',"' + qrlblSlabDescription.caption + '"';

    //Slab Quantity
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Slab_Quantity').asstring + '"';

    //Sales Value
    tempStr := tempStr + ',"' + qrlblGoodsValue.caption + '"';

    //Material Cost
    tempStr := tempStr + ',"' + qrlblMaterialCost.caption + '"';

    //Worktop Thickness
    tempStr := tempStr + ',"' + qryWTElement.fieldbyname('Thickness_mm').asstring + '"';

    //Worktop Colour
    tempStr := tempStr + ',"' + qryWTElement.fieldbyname('Worktop_Description').asstring + '"';

    //Worktop Material Brand
    tempStr := tempStr + ',"' + qryWTElement.fieldbyname('Material_Description').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Sales_Order_Status_Desc').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOAntOrdering.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSOAntOrdering.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPSOAntOrdering.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmWTRPSOAntOrdering.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

procedure TfrmWTRPSOAntOrdering.SetSelectBy(const Value: integer);
begin
  FSelectBy := Value;
end;

end.
