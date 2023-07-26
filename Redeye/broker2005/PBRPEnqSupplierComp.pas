unit PBRPEnqSupplierComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPEnqSupplierCompFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    RunDateQRLabel: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblSelectedSupplier: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    qrDetail: TQRSubDetail;
    qryDetails: TFDQuery;
    qryQuantities: TFDQuery;
    qrgrpEnquiry: TQRGroup;
    grpheadSupplier: TQRGroup;
    QRDBText6: TQRDBText;
    grpFooterSupplier: TQRBand;
    QRDBText7: TQRDBText;
    qrlblCost1: TQRLabel;
    qrlblCost2: TQRLabel;
    qrlblCost3: TQRLabel;
    qrlblCost4: TQRLabel;
    qrlblCost5: TQRLabel;
    qrlblCost6: TQRLabel;
    qrshpCost1: TQRShape;
    qrshpCost2: TQRShape;
    qrshpCost3: TQRShape;
    qrshpCost4: TQRShape;
    qrshpCost5: TQRShape;
    qrshpCost6: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    qrdbSortName: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrlblQuantity1: TQRLabel;
    qrlblQuantity2: TQRLabel;
    qrlblQuantity3: TQRLabel;
    qrlblQuantity4: TQRLabel;
    qrlblQuantity5: TQRLabel;
    qrlblQuantity6: TQRLabel;
    QRDBText4: TQRDBText;
    function GetDetails(Sender: TObject): Integer;
    procedure qrgrpEnquiryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grpheadSupplierBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grpFooterSupplierBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grpheadSupplierAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure grpFooterSupplierAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportfile: textfile;
  public
    DateFrom, DateTo: TDateTime;
    iSupplier, iBranch: integer;
    iQtyCount: integer;
    sSupplierName: string;
    Preview, Inactive: ByteBool;
    PrinterSettings : TPrinterSettings;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPEnqSupplierCompFrm: TPBRPEnqSupplierCompFrm;
  CostArray: array[1..6, 1..2] of real;

implementation

uses PBRSEnqSuppComp;

{$R *.dfm}

function TPBRPEnqSupplierCompFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with qryDetails do
  begin
    Close;
    ParamByName('Supplier').AsInteger := iSupplier;
    ParamByName('DateFrom').AsDateTime := DateFrom;
    ParamByName('DateTo').AsDateTime := DateTo;
    if not Inactive then
        ParamByName('Enq_inactive').AsString :='Y'
      else
        ParamByName('Enq_Inactive').Asstring := '';
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPEnqSupplierCompFrm.qrgrpEnquiryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := false;
end;

procedure TPBRPEnqSupplierCompFrm.grpheadSupplierBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: integer;
  myLabel: TQRLabel;
begin
  for icount := 1 to 6 do
    begin
      myLabel := self.findcomponent('qrlblQuantity'+inttostr(icount)) as TQRLabel;

      try
        myLabel.caption := '';
      except
      end;
    end;

  with qryQuantities do
    begin
      close;
      parambyname('Enquiry').asinteger := qryDetails.fieldbyname('Enquiry').asinteger;
      parambyname('Line').asinteger := qryDetails.fieldbyname('Line').asinteger;
      open;

      icount := 1 ;
      while eof <> true do
        begin
          if icount > 6 then
            exit;
          myLabel := self.findcomponent('qrlblQuantity'+inttostr(icount)) as TQRLabel;

          try
            myLabel.caption := fieldbyname('Quantity').asstring;
          except
          end;

          icount := icount + 1;
          next;
        end;

    end;
end;

procedure TPBRPEnqSupplierCompFrm.qrDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rTotalCost: real;
  sSelected: string;
begin
  iQtyCount := iQtyCount + 1;
  if qryDetails.fieldbyname('Price_Unit_Factor').asinteger = 0 then
    rTotalCost := qryDetails.fieldbyname('Supplier_price').asfloat
  else
    rTotalCost := (qryDetails.fieldbyname('Quantity').asfloat/qryDetails.fieldbyname('Price_Unit_Factor').asinteger) * qryDetails.fieldbyname('Supplier_Price').asfloat;

  CostArray[iQtyCount, 1] := rTotalCost;

  sSelected := qryDetails.fieldbyname('Price_Selected').asstring;
  if sSelected = 'Y' then
    CostArray[iQtyCount, 2] := 1
  else
    CostArray[iQtyCount, 2] := 0;

  PrintBand := false;
end;

procedure TPBRPEnqSupplierCompFrm.grpFooterSupplierBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: integer;
  myLabel: TQRLabel;
  myShape: TQRShape;
begin
  for icount := 1 to 6 do
    begin
      myLabel := self.findcomponent('qrlblCost'+inttostr(icount)) as TQRLabel;

      try
        if CostArray[icount,1] = 0 then
          myLabel.caption := ''
        else
          myLabel.caption := formatfloat('£###0.00',CostArray[icount,1]);

        myLabel.font.style := []
      except
      end;
    end;

  for icount := 1 to 6 do
    begin
      myShape := self.findcomponent('qrshpCost'+inttostr(icount)) as TQRShape;

      try
        if CostArray[icount,2] = 0 then
          begin
            myShape.height := 0
          end
        else
          begin
            myShape.height := 20;

            myLabel := self.findcomponent('qrlblCost'+inttostr(icount)) as TQRLabel;
            myLabel.font.style := [fsItalic,fsbold]
          end;
      except
      end;

    end;

  {If this supplier is the one we've selected then highlight it}
  if qryDetails.fieldbyname('Quoting_Supplier').asinteger = iSupplier then
    begin
      Sender.Frame.DrawBottom := true;
      Sender.Frame.DrawLeft := true;
      Sender.Frame.DrawTop := true;
      Sender.Frame.DrawRight := true;
    end
  else
    begin
      Sender.Frame.DrawBottom := false;
      Sender.Frame.DrawLeft := false;
      Sender.Frame.DrawTop := false;
      Sender.Frame.DrawRight := false;
    end

end;

procedure TPBRPEnqSupplierCompFrm.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount, iRow: integer;
begin
  for icount := 1 to 6 do
    for iRow := 1 to 2 do
      CostArray[icount, iRow] := 0;

  iQtyCount := 0;
  PrintBand := false;
end;

procedure TPBRPEnqSupplierCompFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"Enquiry No"'
              + ',"Line No"'
              + ',"Enquiry Date"'
              + ',"Customer"'
              + ',"Job Description"'
              + ',"Supplier"'
              + ',"Quantity 1"'
              + ',"Quantity 2"'
              + ',"Quantity 3"'
              + ',"Quantity 4"'
              + ',"Quantity 5"'
              + ',"Quantity 6"'
              + ',"Status"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPEnqSupplierCompFrm.grpheadSupplierAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  icount: integer;
  myLabel: TQRLabel;
  tempstr: string;
begin
  if exporting then
  begin
    //Enquiry
    tempStr := '"' + qryDetails.fieldbyname('Enquiry').asstring + '"';

    //enquiry line
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Line').asstring + '"';

    //enquiry date
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Date_Point').asstring + '"';

    //customer
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Customer_Name').asstring + '"';

    //description
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Form_Description').asstring + '"';

    //Supplier
    tempStr := tempStr + ',""';

    //quantities
    for icount := 1 to 6 do
      begin
        myLabel := self.findcomponent('qrlblQuantity'+inttostr(icount)) as TQRLabel;

        try
          tempStr := tempStr + ',"' + myLabel.caption + '"';
        except
        end;
      end;

    //status
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Status_Description').asstring + '"';

    writeln(self.exportFile, tempStr);

    PBRSEnqSuppCompfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPEnqSupplierCompFrm.grpFooterSupplierAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
  icount: integer;
  myLabel: TQRLabel;
begin
  if exporting then
  begin
    tempStr := '""' + ',""'+ ',""'+ ',""'+ ',""';

    //Supplier
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Supplier_Name').asstring + '"';

    //quantities
    for icount := 1 to 6 do
      begin
        myLabel := self.findcomponent('qrlblCost'+inttostr(icount)) as TQRLabel;

        try
          tempStr := tempStr + ',"' + myLabel.caption + '"';
        except
        end;
      end;

    writeln(self.exportFile, tempStr);

    PBRSEnqSuppCompfrm.prgbrExport.StepIt;
  end;
end;

end.
