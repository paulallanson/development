unit WTRPSOrderSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPSOrderSchedule = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlblPhone: TQRLabel;
    qrPhoneText: TQRDBText;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblDateRange: TQRLabel;
    qrdbTemplateDate: TQRDBText;
    qrySalesOrdersSales_Order: TIntegerField;
    qrySalesOrdersSales_order_Line_no: TIntegerField;
    qrySalesOrdersNett_Price: TFloatField;
    qrySalesOrdersDiscount_Value: TFloatField;
    qrySalesOrdersInstallation_price: TFloatField;
    qrySalesOrdersSurvey_price: TFloatField;
    qrySalesOrdersDelivery_Price: TFloatField;
    qrySalesOrdersVat: TIntegerField;
    qrySalesOrdersVat_Rate: TFloatField;
    qrySalesOrdersQuote: TIntegerField;
    qrySalesOrdersUnit_price: TFloatField;
    qrySalesOrdersJob: TFloatField;
    qrySalesOrdersDate_Raised: TDateTimeField;
    qrySalesOrdersTemplate_Date: TDateTimeField;
    qrySalesOrdersCustomer_Name: TStringField;
    qrySalesOrdersReference: TStringField;
    qrySalesOrdersTelephone_number: TStringField;
    qrySalesOrdersDescription: TStringField;
    qrySalesOrdersInstall_Address: TIntegerField;
    qrySalesOrdersSales_Order_Status: TIntegerField;
    qrySalesOrdersSales_Order_Status_Desc: TStringField;
    QRSysData2: TQRSysData;
    qrdbDescription: TQRDBText;
    qrlblWeek1: TQRLabel;
    qrlblWeek2: TQRLabel;
    qrlblWeek3: TQRLabel;
    qrlblWeek4: TQRLabel;
    qrlblWeek5: TQRLabel;
    qrlblWeek6: TQRLabel;
    QRLabel11: TQRLabel;
    qrdbFittingDate: TQRDBText;
    qrySalesOrdersDate_Required: TDateTimeField;
    qrySalesOrdersMaterials_Required: TStringField;
    qrlblOverdueDate: TQRLabel;
    qrlblMatDate: TQRLabel;
    qrySalesOrdersMaterials_Reqd_Date: TDateTimeField;
    qrySalesOrdersMaterials_Recd_Date: TDateTimeField;
    qrlblFutureDate: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrySalesOrdersDate_Type: TStringField;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    qrlblMatReceived: TQRLabel;
    QRLabel9: TQRLabel;
    qrySalesOrdersOn_Hold: TStringField;
    qrlblOnHold: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    CustomerTotal, ReportTotal: real;
    WeekDates: array [1..6] of TDateTime;
  public
    SortBy: integer;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails: integer;
  end;

var
  frmwtRPSOrderSchedule: TfrmwtRPSOrderSchedule;

implementation

uses wtDataModule, AllCommon;

{$R *.dfm}

procedure TfrmwtRPSOrderSchedule.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
    1:begin
        qrbGroupHeader.Expression := 'qrySalesOrders.Template_Date';
        qrGroupByText.DataField := 'Template_Date';
        qrlblSortBy.Caption := 'Template Date';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
    2:begin
        qrbGroupHeader.Expression := 'qrySalesOrders.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
        qrlblPhone.Enabled := true;
        qrPhoneText.Enabled := true;
      end;
    3:begin
        qrbGroupHeader.Expression := 'qrySalesOrders.Sales_Order_Status';
        qrGroupByText.DataField := 'Sales_Order_Status_Desc';
        qrlblSortBy.Caption := 'Status';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
  end;

  qrbGroupHeader.Expression := '';
  qrGroupByText.DataField := '';
  qrlblSortBy.Caption := '';
  qrlblPhone.Enabled := false;
  qrPhoneText.Enabled := false;

  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSOrderSchedule.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, QuoteTotal, VATTotal: real;
  icount: integer;
  templbl: TQRLabel;
begin
  {position the template date details}
  for icount := 1 to 6 do
    begin
      if (qrySalesOrders.fieldbyname('Template_Date').asdatetime >= weekdates[icount]) and
         (qrySalesOrders.fieldbyname('Template_Date').asdatetime < (weekdates[icount]+7)) then
        begin
          templbl := ((FindComponent('qrlblWeek' + IntToStr(icount))) as TQRLabel);
          try
            templbl.Caption := padateStr(WeekDates[icount]);
          except
          end;
          qrdbTemplateDate.Left := templbl.Left;
          break;
        end;
    end;

  if qrySalesOrders.fieldbyname('Template_Date').asdatetime < weekdates[1] then
    qrdbTemplateDate.Left := qrlblOverdueDate.Left;

  if (qrySalesOrders.fieldbyname('Template_Date').asdatetime > (weekdates[6]+6)) then
    qrdbTemplateDate.Left := qrlblFutureDate.Left;
  {end position of template date}


  {position the Fitting date details}
  for icount := 1 to 6 do
    begin
      if (qrySalesOrders.fieldbyname('Date_Required').asdatetime >= weekdates[icount]) and
         (qrySalesOrders.fieldbyname('Date_Required').asdatetime < (weekdates[icount]+7)) then
        begin
          templbl := ((FindComponent('qrlblWeek' + IntToStr(icount))) as TQRLabel);
          try
            templbl.Caption := padateStr(WeekDates[icount]);
          except
          end;
          qrdbFittingDate.Left := templbl.Left;
          break;
        end;
    end;

  if qrySalesOrders.fieldbyname('Date_Required').asdatetime < weekdates[1] then
    qrdbFittingDate.Left := qrlblOverdueDate.Left;

  if (qrySalesOrders.fieldbyname('Date_Required').asdatetime > (weekdates[6]+6)) then
    qrdbFittingDate.Left := qrlblFutureDate.Left;

  if qrdbFittingDate.Left = qrdbTemplateDate.Left then
    qrdbFittingDate.top := qrdbDescription.Top
  else
    qrdbFittingDate.top := qrdbTemplateDate.Top;
  {end position of Fitting date}

  if qrySalesOrders.fieldbyname('Date_Type').asstring = 'P' then
    begin
      qrdbTemplateDate.font.Style := [fsItalic];
      qrdbTemplateDate.Font.Color := clSilver;
      qrdbTemplateDate.Frame.DrawTop := false;
      qrdbTemplateDate.Frame.DrawBottom := false;
      qrdbTemplateDate.Frame.Drawleft := false;
      qrdbTemplateDate.Frame.Drawright := false;
      qrdbFittingDate.font.Style := [fsItalic];
      qrdbFittingDate.Font.Color := clSilver;
      qrdbFittingDate.Frame.DrawTop := false;
      qrdbFittingDate.Frame.DrawBottom := false;
      qrdbFittingDate.Frame.Drawleft := false;
      qrdbFittingDate.Frame.Drawright := false;
    end
  else
    begin
      qrdbTemplateDate.font.Style := [];
      qrdbTemplateDate.Font.Color := clWhite;
      qrdbTemplateDate.Frame.DrawTop := true;
      qrdbTemplateDate.Frame.DrawBottom := true;
      qrdbTemplateDate.Frame.Drawleft := true;
      qrdbTemplateDate.Frame.Drawright := true;
      qrdbTemplateDate.Frame.width := 1;
      qrdbFittingDate.font.Style := [];
      qrdbFittingDate.Font.Color := clWhite;
      qrdbFittingDate.Frame.DrawTop := true;
      qrdbFittingDate.Frame.DrawBottom := true;
      qrdbFittingDate.Frame.Drawleft := true;
      qrdbFittingDate.Frame.Drawright := true;
      qrdbFittingDate.Frame.width := 1;
    end;

  if qrySalesOrders.fieldbyname('Materials_Required').asstring = 'Y' then
    begin
      qrlblMatDate.Enabled := true;
      qrlblMatDate.caption := paDateStr(qrySalesOrders.fieldbyname('Materials_Reqd_Date').asdatetime);
      qrlblMatReceived.Enabled := true;
      qrlblMatReceived.caption := paDateStr(qrySalesOrders.fieldbyname('Materials_Recd_Date').asdatetime);
    end
  else
    begin
      qrlblMatDate.Enabled := false;
      qrlblMatReceived.Enabled := false;
    end;

  if qrySalesOrders.fieldbyname('On_Hold').asstring = 'Y' then
    begin
      qrlblOnHold.Enabled := true;
      qrlblMatDate.Enabled := false;
      qrlblMatReceived.Enabled := false;
      qrdbTemplateDate.enabled := false;
      qrdbFittingDate.enabled := false;
    end
  else
    begin
      qrlblOnHold.Enabled := false;
      qrdbTemplateDate.enabled := true;
      qrdbFittingDate.enabled := true;
    end;

  CompleteTotal := qrySalesOrders.fieldbyname('Nett_Price').asfloat -
                      qrySalesOrders.fieldbyname('Discount_Value').asfloat;


  QuoteTotal := CompleteTotal +
                      qrySalesOrders.fieldbyname('Installation_Price').asfloat +
                      qrySalesOrders.fieldbyname('Survey_Price').asfloat +
                      qrySalesOrders.fieldbyname('Delivery_Price').asfloat;

  VATTotal := QuoteTotal * (qrySalesOrders.fieldbyname('VAT_Rate').asfloat/100);

  CustomerTotal := CustomerTotal + QuoteTotal+VATTotal;
  ReportTotal := ReportTotal + QuoteTotal+VATTotal;

end;

procedure TfrmwtRPSOrderSchedule.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
end;

function TfrmwtRPSOrderSchedule.GetDetails: integer;
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
  case sortby of
    0:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order');
      end;
    1:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Template_Date, Sales_Order.Sales_Order');
      end;
    2:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Customer_Name, Sales_Order.Sales_Order');
      end;
    3:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order_Status, Sales_Order.Sales_Order');
      end;
  end;

  qrySalesOrders.Close;
  qrySalesOrders.parambyname('Customer').asinteger := customer;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom;
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo;
  qrySalesOrders.Open;
  result := qrySalesOrders.recordcount;
end;

procedure TfrmwtRPSOrderSchedule.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSOrderSchedule.FormCreate(Sender: TObject);
var
  icount: integer;
  weekstart: TDatetime;
begin
  weekstart := startoftheweek(date);
  for icount := 1 to 6 do
    WeekDates[icount] := weekstart + ((icount-1)*7)

end;

procedure TfrmwtRPSOrderSchedule.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
begin
  for i := 1 to 6 do
    begin
      templbl := ((FindComponent('qrlblWeek' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := padateStr(WeekDates[i]);
      except
      end;
    end;
end;

end.
