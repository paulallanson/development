unit STRPSlwMvngStkRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, Qrctrls, QrExport;

type
  TSTRPSlwMvngStkRepfrm = class(TForm)
    qrDetails: TQuickRep;
    qrySlwMvngStk: TQuery;
    qrbndDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    qrlblDateSince: TQRLabel;
    qrPart: TQRLabel;
    QRShape1: TQRShape;
    qrlblDesc: TQRLabel;
    qrlblPack: TQRLabel;
    qrlblStock: TQRLabel;
    QRLabel4: TQRLabel;
    qrlblBoxCountVal: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    qrlblTotalStkVal: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRLblInUse: TQRLabel;
    PageQRSysData: TQRSysData;
    QRSysData2: TQRSysData;
    DataSource1: TDataSource;
    qrlblRange: TQRLabel;
    QRLblCust: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    SQLGetSlsDt: TQuery;
    QRLblSlsOrd: TQRLabel;
    QRLblDtReq: TQRLabel;
    qrySlowMvgNoRep: TQuery;
    function GetDetails(Sender: TObject): Integer;
    procedure qrbndDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    RunningTotal: Currency;
  public
    exporting: boolean;
    exportFile: textFile;
    bexcProd: Bytebool;
    bSQLDatabase: boolean;
    OrderDate: TDateTime;
    RepNo, CustNo, CustBranchNo: Integer;
    RepName, CustomerName: string;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPSlwMvngStkRepfrm: TSTRPSlwMvngStkRepfrm;

implementation

uses
  STPacks, STRSSlwMvngStkRep, printers;

{$R *.DFM}

{ TSTRPSlwMvngStkRepfrm }

function TSTRPSlwMvngStkRepfrm.GetDetails(Sender: TObject): Integer;
begin
  QRLabel8.enabled := not bExcProd;

  if RepNo = 0 then
    begin
      qrySlwMvngStk.sql.Clear;
      qrySlwMvngStk.sql := qrySlowMvgNoRep.SQL;
    end;

  with qrySlwMvngStk do
    begin
      Close;
      ParamByName('DateFrom').AsDateTime := Self.OrderDate;
      if bExcProd then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';
      ParamByName('PartFrom').AsString := STRSSlwMvngStkRepFrm.edtPartFrom.Text;
      ParamByName('PartTo').AsString :=  STRSSlwMvngStkRepFrm.edtPartTo.Text;
      ParamByName('Customer').AsInteger := CustNo;
      ParamByName('CustBranch').AsInteger := CustBranchNo;
      if RepNo <> 0 then
        ParamByName('Rep').AsInteger := RepNo;
      Open;
      Result := RecordCount;
    end;
end;

procedure TSTRPSlwMvngStkRepfrm.qrbndDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  with qrySlwMvngStk do
  begin
    qrlblBoxCountVal.Caption := STPacks.ShowInPacks(FieldByName('Stock_Quantity').AsInteger, FieldByName('Pack_Size').AsInteger);
    QRLblInUse.Enabled := fieldByName('Not_In_Use').AsString = 'Y';
    with SQLGetSlsDt do
    begin
      Close;
      ParamByName('Date').AsDateTime := Self.OrderDate;
      ParamByname('Part').Asstring := qryslwMvngStk.FieldByName('Part').AsString;
      Open;
      if recordcount > 0 then
      begin
        QRLblSlsOrd.Caption := FieldByName('Sales_Order').AsString;
        QRLblDtReq.Caption :=  DateToStr(fieldByName('Date_Required').AsDateTime);
      end
      else
      begin
         QRLblSlsOrd.Caption := '';
        QRLblDtReq.Caption := '';
      end;
    end;
  end;

  if self.exporting then
  begin
    //Product
    tempStr := '"' + qryslwMvngStk.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Cust_Name').asString + '"';

    //Rep Name
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Rep_Name').asString + '"';

    //Last Sales Order
    tempStr := tempStr + ',"' + QRLblSlsOrd.Caption + '"';

    //Last Sales order date required
    tempStr := tempStr + ',"' + QRLblDtReq.Caption + '"';

    //Quantity In Stock
    if qryslwMvngStk.fieldByName('Stock_Quantity').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Stock_Quantity').asString + '"';

    //Pack Size
    if qryslwMvngStk.fieldByName('Pack_Size').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Pack_Size').asString + '"';

    //Box Count
    if pos(':', qrlblBoxCountVal.caption) = 0 then
      tempStr := tempStr + ',' + qrlblBoxCountVal.caption
    else
      tempStr := tempStr + ',' + StringReplace(qrlblBoxCountVal.caption, ':', ';', [rfReplaceAll]);

    // Stock Value
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Stock_Value').asString + '"';

    //Warehouse
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('part_Store').asString + '"';

    //Bin Location
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Part_Bin').asString + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Stock_Ref').asString + '"';

    //Product active
    tempStr := tempStr + ',"' + qryslwMvngStk.fieldByName('Not_In_Use').AsString + '"';

    writeln(self.exportFile, tempStr);
    STRSSlwMvngStkRepfrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPSlwMvngStkRepfrm.qrbndDetailAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
RunningTotal := RunningTotal + qrySlwMvngStk.FieldByName('Stock_Value').AsFloat;
end;

procedure TSTRPSlwMvngStkRepfrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalStkVal.Caption := '£' + CurrToStrF(RunningTotal, ffFixed, 2);
end;

procedure TSTRPSlwMvngStkRepfrm.qrDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qrDetails.page.orientation := poLandscape;
end;

procedure TSTRPSlwMvngStkRepfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Rep"'
    + ',"Last Sales Order"'
    + ',"Date Required"'
    + ',"Quantity in Stock"'
    + ',"Pack Size"'
    + ',"Box Count"'
    + ',"Stock Value"'
    + ',"Warehouse"'
    + ',"Bin Location"'
    + ',"Stock Reference"'
    + ',"Product Not In Use"';

  writeLn(self.exportFile, tempStr);
  self.qrDetails.Prepare;

  CloseFile(self.exportFile);
end;

end.
