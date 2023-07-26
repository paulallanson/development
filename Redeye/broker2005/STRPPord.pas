unit STRPPord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, QuickRpt, CCSPrint, Qrctrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPPordfrm = class(TForm)
    QuickReport: TQuickRep;
    qryReport: TFDQuery;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblselection: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRlblDesc: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    qrpCustFooter: TQRBand;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    qrlblTotalCustValue: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblDateSelection: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLblDt: TQRLabel;
    QRLabel10: TQRLabel;
    qryExtraCharges: TFDQuery;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    OldQryRptSumm: TFDQuery;
    OldQryRptDet: TFDQuery;
    QRBndDtl: TQRBand;
    QRChldDtl: TQRChildBand;
    QRChldSumm: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLblExtChrgs2: TQRLabel;
    QRLblExtChrgs: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBTxtOrdNo: TQRDBText;
    QRBOrdHead: TQRGroup;
    QROrdFoot: TQRBand;
    QRLabel2: TQRLabel;
    QRLblTotDlvrd: TQRLabel;
    QRShape2: TQRShape;
    QRLblPartSelection: TQRLabel;
    QryRptSummBypart: TFDQuery;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLblRepTot: TQRLabel;
    QRShape3: TQRShape;
    QRLblRepTotExtChrg: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRLblTotExt: TQRLabel;
    QRLblGrpBy: TQRLabel;
    QRLblOrdRepTot: TQRLabel;
    QRShape7: TQRShape;
    QRLblGrpOrdTot: TQRLabel;
    QRShape8: TQRShape;
    QRLblOrdTot: TQRLabel;
    QRShape9: TQRShape;
    QryRptDet: TFDQuery;
    QryRptSumm: TFDQuery;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    DelAddmemo: TQRMemo;
    QRLabel13: TQRLabel;
    qryCust: TFDQuery;
    AddressSRC: TDataSource;
    qryAdhoc: TFDQuery;
    GetNarrSQL: TFDQuery;
    QRLabel14: TQRLabel;
    qrlblRetail: TQRLabel;
    function Getdetails(Sender: TObject): integer;
    procedure qrpCustFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpCustFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldDtlAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldSummAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QROrdFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QROrdFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbCustHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChldDtlBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldSummBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure GetAddDetails(delCust, delBranch: integer);
    procedure GetAdhocDetails(delCust: integer);
    function BuildSpecialNotes(iNarrative: integer): string;
    { Private declarations }
  public
    Printersettings: TPrintersettings;
    DelName, DelBuilding, DelStreet, DelLocale, DelCity, DelPostcode: string;
    exporting: boolean;
    exportFile: textFile;
    supplier: integer;
    customer: integer;
    iOrder: integer;
    NotInUse: boolean;
    PartFrom: string;
    PartTo: string;
    DateFrom: TDateTime;
    DateTo: TDateTime;
    ByProduct: boolean;
    BySupplier: boolean;
    ByCustomer: boolean;
    bIsSummary: boolean;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPPordfrm: TSTRPPordfrm;

implementation

uses STRSPord;

var
  rSuppTotal: real;
  rOrdTotal: real;
  rSuppExtTotal: real;
  rOrdExtTotal: real;
  rRepTotal: real;
  rRepExtTotal: real;
  rRepOrdTotal: real;
  AddressArray: array[0..5] of string;
  NotesArray: array[0..100] of string;

{$R *.DFM}

function TSTRPPordfrm.Getdetails(Sender: TObject): integer;
begin
  if bIsSummary then
    begin
      QryReport.SQl.text := QryRptSumm.sql.text;
      if BySupplier then
        begin
          QryReport.sql.text := qryRptSumm.sql.text;
          QryReport.SQL.Append('Order by Supplier.name, Purch_Ord.Purch_Ord_No');
        end
      else
      if ByCustomer then
        begin
          QryReport.sql.text := qryRptSumm.sql.text;
          QryReport.SQL.Append('Order by Customer_name, Purch_Ord.Purch_Ord_No');
        end
      else
        begin
          qryReport.sql.Text := qryRptSummbyPart.sql.text;
          QryReport.SQL.Append('Order by Part.Part, Purch_Ord.Purch_Ord_No');
        end;
      QRChldDtl.ParentBand := nil;
      QRLblDt.Caption := 'Order Date';
      QRLabel12.Caption := 'Total Order Value';
      QRLabel7.Caption := 'Total Delivered Value';
      QRLblDt.height := 16;
      QRLblDt.top := 102;
      QRLblDesc.Caption := '        Description';
      QRLabel1.Caption := '';
      QRLabel5.Caption := '';
      QRlabel3.Caption := '';
      QRGroup1.enabled := false;
      QROrdFoot.Enabled := false;
    end
  else
    begin
      QryReport.Sql.text := QryRptDet.sql.text;
      if BySupplier then
        QryReport.Sql.append('Order by Supplier.name, Purch_Ord.Purch_Ord_No, Purch_Ord_Line.Purch_Ord_Line_No')
      else
      if ByCustomer then
        QryReport.Sql.append('Order by Customer_name, Purch_Ord.Purch_Ord_No, Purch_Ord_Line.Purch_Ord_Line_No')
      else
        QryReport.Sql.append('Order by Part.Part, Purch_Ord.Purch_Ord_No, Purch_Ord_Line.Purch_Ord_Line_No');
      QRChldSumm.ParentBand := nil;
    end;
  QRChldDtl.enabled := bIsSummary = false;
  QRChldSumm.enabled := bIsSummary = True;
  If QRChldSumm.Enabled then
    begin
      QRLblOrdTot.enabled := true;
      QRLblGrpOrdTot.Enabled := true;
      QRLblOrdRepTot.Enabled := true;
      QRShape7.enabled := true;
      QRShape8.enabled := true;
      QRShape9.enabled := true;
    end;
  with qryReport do
  begin
    parambyname('supplier').asinteger := supplier;
    parambyname('Customer').asinteger := customer;
    parambyname('Part_From').asstring := PartFrom;
    parambyname('Part_To').asstring := PartTo;
    parambyname('Date_From').asdatetime := DateFrom;
    parambyname('Date_To').asdatetime := DateTo;
    open;
    result := recordcount;
  end;
end;

procedure TSTRPPordfrm.qrpCustFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblTotalCustValue.caption := formatfloat('£###,###,##0.00',rSuppTotal);
  QRLabel6.Caption := formatfloat('£###,###,##0.00',rSuppExtTotal);
  qrlblGrpOrdTot.caption := formatfloat('£###,###,##0.00',rOrdTotal);
end;

procedure TSTRPPordfrm.qrpCustFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rRepTotal := rRepTotal + rSuppTotal;
  rRepExtTotal := rRepExtTotal + rSuppExtTotal;
  rRepOrdTotal := rRepOrdTotal + rOrdTotal;
  rSuppTotal := 0.00;
  rSuppExtTotal := 0.00;
  rOrdTotal :=0.00;
end;

procedure TSTRPPordfrm.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  iOrder := 0;
  rSuppTotal := 0.00;
  rOrdTotal := 0.00;
  rSuppExtTotal := 0.00;
  rOrdExtTotal := 0.00;
  rRepTotal := 0.00;
  rRepextTotal := 0.00;
  rRepOrdTotal := 0.00;
  qrbCustHeader.enabled := true;
  qrBCustHeader.ForceNewPage := STRSPordfrm.Checkbox1.checked;
//  (qrlblSelection.caption = '')
  if ByProduct then
    begin
      QRBOrdHead.Expression := 'QryReport.Part';
      QrbCustHeader.Expression := 'QryReport.Part';
      QRLabel11.Caption := 'Supplier';
      qrlblextchrgs.Alignment := taLeftjustify;
      qrOrdFoot.enabled := false;
      QRShape6.enabled := false;
      QRShape5.enabled := false;
      QRShape4.enabled := false;
      QRLblTotext.enabled := false;
      QRLblRepTotExtChrg.enabled := false;
      QRLabel6.enabled := false;
    end;
  if ByCustomer then
    begin
      QRBOrdHead.Expression := 'QryReport.Customer_Name';
      QrbCustHeader.Expression := 'QryReport.Customer_Name';
    end;
  if BySupplier then
    begin
      QRBOrdHead.Expression := 'QryReport.Name';
      QrbCustHeader.Expression := 'QryReport.Name';
    end;
  if qrlblSelection.caption = '' then
    qrlblDateSelection.top := qrlblSelection.top;
end;

procedure TSTRPPordfrm.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if bySupplier or byCustomer then
    begin
      with qryExtraCharges do
      begin
        close;
        parambyname('ordno').AsInteger := qryReport.fieldByName('Purch_Ord').AsInteger;
        open;
        if bIsSummary then
          QRLblExtChrgs2.caption := formatfloat('£###,##0.00',FieldByName('TotalVal').AsFloat)
        else
          QRLblExtChrgs.caption := formatfloat('£###,##0.00',FieldByName('TotalVal').AsFloat);
        rSuppExtTotal := rSuppExtTotal + FieldByName('TotalVal').AsFloat;
        rOrdExtTotal := rOrdExtTotal + FieldByName('TotalVal').AsFloat;
      end;
    end;
   QRDBTxtOrdNo.enabled := True;
   QRDBText1.enabled := true;
   QRDBText5.enabled := True;
   QRDBText6.enabled := True;
   QRLblExtChrgs.Enabled := True;
end;

procedure TSTRPPordfrm.QRChldDtlAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   QRDBTxtOrdNo.enabled := False;
   QRDBText1.enabled := False;
   QRDBText5.enabled := False;
   QRDBText6.enabled := False;
   QRLblExtChrgs.Enabled := False;
   rSuppTotal := rSuppTotal + QRExpr1.value.dblResult;
   rOrdTotal := rOrdTotal + QRExpr1.value.dblResult;
end;

procedure TSTRPPordfrm.QRChldSummAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//if not BySupplier then
  rSuppTotal := rSuppTotal + QRYReport.fieldByName('Tot_Del').asFloat;
  rOrdTotal := rOrdTotal + QRYReport.fieldByName('Tot_Val').asfloat;
end;

procedure TSTRPPordfrm.QROrdFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLblTotDlvrd.Caption := formatfloat('£###,###,##0.00',rOrdTotal);
QRLblTotExt.Caption := formatfloat('£###,###,##0.00',rOrdExtTotal);
QRLblOrdTot.caption := formatfloat('£###,###,##0.00',rSuppTotal);
end;

procedure TSTRPPordfrm.QROrdFootAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
    if not bIsSummary then
    begin
      rOrdTotal := 0;
      rOrdExtTotal := 0;
    end;
end;

procedure TSTRPPordfrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 QRDBTxtOrdNo.enabled := True;
   QRDBText1.enabled := True;
   QRDBText5.enabled := True;
   QRDBText6.enabled := True;
   QRLblExtChrgs.Enabled := True;
end;

procedure TSTRPPordfrm.qrbCustHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if BySupplier then
    QRLblGrpBy.Caption := qryReport.fieldbyName('Name').AsString
  else
  if ByCustomer then
    QRLblGrpBy.Caption := qryReport.fieldbyName('Customer_Name').AsString
  else
    QRLblGrpBy.Caption := qryReport.FieldByName('Part').AsString + ' - ' + qryReport.FieldByName('Part_Description').AsString;
end;

procedure TSTRPPordfrm.GetAddDetails(delCust, delBranch: integer);
begin
  with qryCust do
    begin
      Close;
      ParamByName('Customer').AsInteger := DelCust;
      ParamByName('Branch_no').AsInteger := DelBranch;
      Open;
    end;
    AddressSRC.Dataset := qryCust;
end;

procedure TSTRPPordfrm.GetAdhocDetails(delCust: integer);
begin
  with qryAdHoc do
    begin
      Close;
      ParamByName('Ad_hoc_Address').AsInteger := DelCust;
      Open;
    end;
    AddressSRC.Dataset := qryAdhoc;
end;

procedure TSTRPPordfrm.QRChldDtlBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rRetailTotal: real;
  tempstr: string;
  notesStr: string;
  icount: integer;
  UseBranchName: boolean;
begin
  if byProduct then
    qrlblExtChrgs.Caption := qryReport.fieldByName('Name').AsString;

  rRetailTotal := qryReport.fieldbyname('Unit_Retail_Price').asfloat * qryReport.fieldbyname('Quantity_Ordered').asinteger;
  qrlblRetail.caption := formatfloat('£###,###,##0.00',rRetailTotal);

  if iOrder <> qryReport.fieldByName('OrdNum').asinteger then
    begin
      {Clear down the address array}
      for icount := 0 to 5 do
        begin
          AddressArray[icount] := '';
        end;

      {Clear down the delivery address}
      DelAddMemo.Lines.Clear;
      
      {Get the Delivery address details}
      if qryReport.FieldByName('Delivery_Customer').AsInteger <> 0 then
        begin
          GetAddDetails(qryReport.FieldByName('Delivery_Customer').AsInteger,
                    qryReport.FieldByName('Delivery_Branch').AsInteger);
        end
      else
        GetAdhocDetails(qryReport.FieldByName('Ad_hoc_Address').AsInteger);

      UseBranchName := AddressSRC.dataset.FieldByName('Use_Branch_Name').AsString = 'Y';

      if UseBranchName then
      begin
        if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
          begin
            DelAddMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
            AddressArray[0] := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
          end;
      end;

      for icount := (0 + integer(UseBranchName)) to 5 do
      begin
        AddressArray[icount] := AddressSRC.dataset.Fields[icount].AsString;
        if AddressSRC.dataset.Fields[icount].AsString = '' then
          Continue;
        DelAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
      end;
      iOrder := qryReport.fieldByName('OrdNum').asinteger;
    end;

  if self.exporting then
  begin
    //Order Number
    tempStr := '"' + qryReport.fieldByName('OrdNum').asString + '"';

    //Order Date
    tempStr := tempStr + ',"' + qryReport.fieldByName('Purch_Ord_Date').asString + '"';

    //Order Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('Purch_Ord_Descr').asString + '"';

    //Supplier
    tempStr := tempStr + ',"' + qryReport.fieldByName('Name').asString + '"';

    //Product
    tempStr := tempStr + ',"' + qryReport.fieldByName('Part').asString + '"';

    //Product Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('Part_Description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Customer Reference
    tempStr := tempStr + ',"' + qryReport.fieldByName('Cust_Order_no').asString + '"';

    //Pack Size
    tempStr := tempStr + ',"' + qryReport.fieldByName('Purch_Pack_Quantity').asString + '"';

    //Pack Price
    tempStr := tempStr + ',"' + qryReport.fieldByName('Cost_Price').asString + '"';

    //Order Quantity
    tempStr := tempStr + ',"' + qryReport.fieldByName('Quantity_Ordered').asstring + '"';

    //Delivered Quantity
    tempStr := tempStr + ',"' + qryReport.fieldByName('Quantity_Received').asString + '"';

    //Total Value
    tempStr := tempStr + ',"' + formatfloat('#00.00',((qryReport.fieldbyname('Quantity_Received').asfloat
                                                      * qryReport.fieldbyname('Purchase_Price').asfloat) / qryReport.fieldbyname('Purch_Pack_Quantity').asfloat)) + '"';

    //Extra Charges
    if QRLblExtChrgs.Enabled then
      tempStr := tempStr + ',"' + QRLblExtChrgs.Caption + '"'
    else
      tempStr := tempStr + ',"' + '0.00' + '"';

    //Total Retail Value
    tempStr := tempStr + ',"' + qrlblRetail.caption + '"';

    for icount := 0 to 5 do
      begin
        tempStr := tempStr + ',"' + AddressArray[icount] + '"';
      end;

    {Get any special notes}
    if qryReport.fieldbyname('Narrative').asinteger > 0 then
      tempStr := tempStr + ',"' + BuildSpecialNotes(qryReport.fieldbyname('Narrative').asinteger) + '"';

    writeln(self.exportFile, tempStr);
    STRSPordfrm.prgbrExport.StepIt;
  end;

end;

function TSTRPPordfrm.BuildSpecialNotes(iNarrative : integer): string;
var
  aStr : string;
begin
  GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
  GetNarrSQL.Open;
  aStr := '';
  while (not GetNarrSQL.EOF) do
    begin
      aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
      if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
      GetNarrSQL.Next;
    end;
  GetNarrSQL.Close;
  result := aStr;
end;

procedure TSTRPPordfrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLblRepTot.caption := formatfloat('£###,###,##0.00',rRepTotal);
  QRLblRepTotExtChrg.caption := formatfloat('£###,###,##0.00',rRepExtTotal);
  QRLblOrdRepTot.caption := formatfloat('£###,###,##0.00',rRepOrdTotal);
end;

procedure TSTRPPordfrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rRepTotal := 0.;
  rRepExtTotal := 0.;
  rRepOrdTotal := 0.;
end;

procedure TSTRPPordfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if bIsSummary then
    begin
      tempStr := '"Order No"'
        + ',"Order Date"'
        + ',"Order Description"'
        + ',"Supplier"'
        + ',"Customer"'
        + ',"Order Value"'
        + ',"Value Delivered"'
        + ',"Extra Charges"';
    end
  else
    begin
      tempStr := '"Order No"'
        + ',"Order Date"'
        + ',"Order Description"'
        + ',"Supplier"'
        + ',"Product"'
        + ',"Description"'
        + ',"Customer"'
        + ',"Customer Ref"'
        + ',"Pack Size"'
        + ',"Pack Cost"'
        + ',"Order Qty"'
        + ',"Delivered Qty"'
        + ',"Total Value"'
        + ',"Extra Charges"'
        + ',"Total Retail"'
        + ',"Delivery Name"'
        + ',"Address 1"'
        + ',"Address 2"'
        + ',"Address 3"'
        + ',"Town/City"'
        + ',"Postcode"'
        + ',"Delivery Note"';
    end;

  writeLn(self.exportFile, tempStr);
  self.quickReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPPordfrm.QRChldSummBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Order Number
    tempStr := '"' + qryReport.fieldByName('OrdNum').asString + '"';

    //Order Date
    tempStr := tempStr + ',"' + qryReport.fieldByName('Purch_Ord_Date').asString + '"';

    //Order Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('Purch_Ord_Descr').asString + '"';

    //Supplier
    tempStr := tempStr + ',"' + qryReport.fieldByName('Name').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Total Value
    tempStr := tempStr + ',"' +  qryReport.fieldByName('tot_val').asString + '"';

    //Value Delivered
    tempStr := tempStr + ',"' +  qryReport.fieldByName('tot_del').asString + '"';

    //Extra Charges
    tempStr := tempStr + ',"' + QRLblExtChrgs2.Caption + '"';


    writeln(self.exportFile, tempStr);
    STRSPordfrm.prgbrExport.StepIt;
  end;


end;

end.
