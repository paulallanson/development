unit PBRPWIDespatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, CCSPrint, QRCtrls, DB, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPWIDespatchFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblDateRange: TQRLabel;
    qryReport: TFDQuery;
    qrgrp1: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    qrlblDateRaised: TQRLabel;
    qrdbGroupBy: TQRDBText;
    qrlblWINumber: TQRLabel;
    QRSysData2: TQRSysData;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    function Ordering(sortby: integer): string;
    { Private declarations }
  public
    Courier, Customer, Rep: integer;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    PrinterSettings: TPrinterSettings;
    SortRepBy1, SortRepBy2: integer;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPWIDespatchFrm: TPBRPWIDespatchFrm;

implementation

uses CCSCommon, PBRSWIDespatch;

{$R *.dfm}

function TPBRPWIDespatchFrm.GetDetails: integer;
var
  sTemp: string;
begin
  stemp := 'ORDER BY ';
  if (SortRepBy1 >= 0) or (SortRepBy2 >= 0) then
    begin
      sTemp := sTemp + Ordering(SortRepBy1) + Ordering(SortRepBy2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end;
  with qryReport do
    begin
      close;
      sql.Text := sql.Text + sTemp;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      parambyname('Courier').asinteger := courier;
      parambyname('Customer').asinteger := customer;
      parambyname('Rep').asinteger := Rep;
      open;
      result := recordcount;
    end;
end;

function TPBRPWIDespatchFrm.Ordering(sortby: integer): string;
begin
  case sortBy of
  0:   Result := ' works_order.works_order_number,';
  1:   Result := ' courier.courier_name,';
  2:   Result := ' Customer.Name,';
  3:   Result := ' Rep.Name,';
  4:   Result := ' Operator.Name,';
  5:   Result := ' Works_Order_Delivery.Delivery_Date,';
  else Result := '';
  end;
end;

procedure TPBRPWIDespatchFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempstr: string;
begin
  qrlblDateRaised.caption := pbdatestr(qryReport.fieldbyname('Date_Point').asdatetime);
  qrlblWINumber.caption := FloatToStr(qryReport.fieldbyname('works_order_number').asfloat);

  if self.exporting then
  begin
    //Product
    tempStr := '"' + qryReport.fieldByName('Customer_Name').asString + ' - ' + qrlblWINumber.caption + '"';

    //Courier
    if PBRSWIDespatchFrm.rgCourier.ItemIndex = 0 then
      tempStr := tempStr + ',"' + qryReport.fieldByName('Courier_Name').asString + '"';

    //Job Title
    tempStr := tempStr + ',"' + trim(qryReport.fieldByName('Description').asString) + '"';

    //Service
    tempStr := tempStr + ',"' + qryReport.fieldByName('Service_Code').asString + '"';

    //Pack Size
    tempStr := tempStr + ',"' + qryReport.fieldByName('package_size_Description').asString + '"';

    //Hand Over Date
    if qryReport.fieldByName('Handover_date').asString = '' then
      tempStr := tempStr + ',"' + qryReport.fieldByName('delivery_date').asString + '"'
    else
      tempStr := tempStr + ',"' + qryReport.fieldByName('Handover_date').asString + '"';

    //Mail Date
    tempStr := tempStr + ',"' + qryReport.fieldByName('delivery_date').asString + '"';

    //Delivery Volume
    tempStr := tempStr + ',"' + qryReport.fieldByName('Qty_to_Deliver').asString + '"';

    //Estimated Cages
    try
      tempstr := tempstr + ',"' + formatfloat('#,##0',(ceil((qryReport.fieldByName('Qty_to_Deliver').asinteger/qryReport.fieldByName('Quantity_per_Cage').asinteger)))) + '"';
    except
      tempstr := tempstr + ',"' + 'TBC' + '"';
    end;
    //Weight per item
    tempStr := tempStr + ',"' + qryReport.fieldByName('package_weight_gms').asString + '"';

    //Rep Name
    tempStr := tempStr + ',"' + qryReport.fieldByName('Rep_Name').asString + '"';

    //Account Manager Name
    tempStr := tempStr + ',"' + qryReport.fieldByName('Operator_Name').asString + '"';

    writeln(self.exportFile, tempStr);
    PBRSWIDespatchfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPWIDespatchFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case SortRepBy1 of
    1: begin
          qrgrp1.Expression := 'qryReport.Courier_Name';
          qrdbgroupby.DataField := 'Courier_Name';
       end;
    2: begin
          qrgrp1.Expression := 'qryReport.Customer_Name';
          qrdbgroupby.DataField := 'Customer_Name';
       end;
    3: begin
          qrgrp1.Expression := 'qryReport.Rep_Name';
          qrdbgroupby.DataField := 'Rep_Name';
       end;
    4: begin
          qrgrp1.Expression := 'qryReport.Operator_Name';
          qrdbgroupby.DataField := 'Operator_Name';
       end;
    5: begin
          qrgrp1.Expression := 'qryReport.Delivery_Date';
          qrdbgroupby.DataField := 'Delivery_Date';
       end;
  end;

  qrlblDateRange.caption := qrlblDateRange.caption + pbdatestr(DateFrom) + ' to ' + pbdateStr(DateTo);
end;

procedure TPBRPWIDespatchFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer/Job"';

  if PBRSWIDespatchFrm.rgCourier.ItemIndex = 0 then
    tempStr := tempstr + ',"Courier"';

  tempStr := tempstr + ',"Job Title"'
    + ',"Class"'
    + ',"Size"'
    + ',"Hand Over Date"'
    + ',"Mail Date"'
    + ',"Despatch Volume"'
    + ',"Est. Cages"'
    + ',"Pack Wgt (gsm)"'
    + ',"Rep"'
    + ',"Account Manager"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

end.
