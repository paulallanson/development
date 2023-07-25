unit STRPAgedStk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, DBTables, ExtCtrls, QrExport;

type
  TSTRPAgedStkFrm = class(TForm)
    qrAgedStk: TQuickRep;
    qryAgedStk: TQuery;
    QRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    qrlblDateSince: TQRLabel;
    qrPart: TQRLabel;
    QRShape1: TQRShape;
    qrlblDesc: TQRLabel;
    qrlblStock: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrbndDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    qrlblBoxCountVal: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    qrlblTotalStkVal: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDays: TQRLabel;
    QRLblPckSz: TQRLabel;
    QRLblVal: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    GetSalesDtQry: TQuery;
    qrlblLastSalesDate: TQRLabel;
    QRLblCust: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRLblInUse: TQRLabel;
    QRLabel17: TQRLabel;
    qrlblRange: TQRLabel;
    DateQRLabel: TQRLabel;
    QRSysData1: TQRSysData;
    Query1: TQuery;
    QRMemoRepName: TQRMemo;
    GetTopRepSQL: TQuery;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    qryGetPOs: TQuery;
    qryGetPurchOrds: TQuery;
    qryAccMgr: TQuery;
    qrlblLastJobUsedDate: TQRLabel;
    function GetDetails(Sender: TObject): Integer;
    procedure qrbndDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrAgedStkBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    RunningTotal: Currency;
    function GetPOHistory(tempPart: string): string;
    function GetAccountManager(tempCode: integer): string;
  public
    exporting: boolean;
    exportFile: textFile;
    bAtCost: ByteBool;
    bexcProd: Bytebool;
    iStore: integer;
    BinFrom, BinTo: string;
    RepNo, CustNo, CustBranchNo: Integer;
    RepName, CustomerName: string;
    RunDate: TDateTime;
    NoofDays: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPAgedStkFrm: TSTRPAgedStkFrm;

implementation

uses
  STPacks, STRSAgedStk;

{$R *.DFM}

{ TSTRPAgedStkFrm }

function TSTRPAgedStkFrm.GetDetails(Sender: TObject): Integer;
begin
  if RepNo = 0 then
    begin
      qryAgedStk.sql.Clear;
      qryAgedStk.sql := query1.SQL;
    end;

  with qryAgedStk do
  begin
    Close;
    if bExcProd then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';
    ParamByName('Customer').AsInteger := CustNo;
    ParamByName('CustBranch').AsInteger := CustBranchNo;
    ParamByName('PartFrom').AsString := STRSAgedStkFrm.edtPartFrom.Text;
    ParamByName('PartTo').AsString := STRSAgedStkFrm.edtPartTo.text;
    ParamByName('TheDate').Asdatetime := RunDate;
    ParamByName('NoOfDays').Asinteger := self.noofdays;
    ParamByName('Part_Store').Asinteger := iStore;
    ParamByName('Bin_From').Asstring := BinFrom;
    ParamByName('Bin_To').Asstring := BinTo;

    if RepNo <> 0 then
      ParamByName('Rep').AsInteger := RepNo;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTRPAgedStkFrm.qrbndDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  loop : integer;
  tempStr: string;
begin
  QrmemoRepName.lines.clear;
  if RepNo <> 0 then
  begin
    QRMemoRepName.Lines.append(qryAgedStk.FieldByName('Rep_Name').AsString);
  end
  else
  begin
    with GetTopRepSQL do
    begin
      close;
      paramByName('Part').AsString := qryAgedStk.FieldByname('Part').AsString;
      open;
      first;
      for loop := 0 to pred(recordcount) do
      begin
        QRMemoRepName.Lines.append(GetTopRepSQL.FieldByName('Rep_Name').AsString);
        next;
      end;
    end;
  end;

  if qrMemoRepname.lines.Count = 0 then
  begin
    QRBndDetail.height := 18;
    qrmemoRepname.Enabled := false;
  end
  else
  begin
    QRBndDetail.height := 35;
    qrmemoRepname.Enabled := True;
  end;

  with qryAgedStk do
  begin
    if bAtCost then
      begin
        qrlblBoxCountVal.Caption := STPacks.ShowInPacks(FieldByName('Quantity').AsInteger, FieldByName('Pack_Size').AsInteger);
        qrlblVal.Caption := FormatFloat('#######0.00',FieldByname('Stock_Value').AsFloat);
        qrlblPcksz.Caption := FieldByName('Pack_Size').AsString;
        end
    else
      begin
        qrlblBoxCountVal.Caption := STPacks.ShowInPacks(FieldByName('Quantity').AsInteger, FieldByName('Sell_Pack_Size').AsInteger);
        qrlblVal.Caption := FormatFloat('#######0.00',((FieldByname('Quantity').AsInteger/FieldByName('Sell_Pack_Size').AsInteger)*fieldByName('Sales_Value').AsFloat));
        qrlblPcksz.Caption := FieldByName('Sell_Pack_Size').AsString;
      end;

  if qryAgedStk.FieldByName('Invoice_upfront').asstring = 'Y' then
    qrlblVal.caption := '0.00';

  qrlblDays.caption := floattostr(Date - FieldByName('Date_Received').asdatetime);
  end;
  with GetSalesDtQry do
  begin
    Close;
    ParamByName('Part').AsString := QryAgedStk.fieldByName('Part').AsString;
    ParamByName('Store').AsInteger := QryAgedStk.FieldByName('Part_Store').AsInteger;
    ParamByName('Bin').AsString := QryAgedStk.FieldByName('Bin').AsString;
    ParamByName('Lot').AsString := QryAgedStk.FieldByName('Lot').AsString;
    ParamByName('Part_Movement_Type').AsString := 'D';
    Open;
    qrlblLastSalesDate.Caption := fieldByName('Sales_Dt').AsString;
    // for some reason if this was a qrdbtext field it wouldn't work, so had to load into a label !!!!!!!;
  end;
  with GetSalesDtQry do
  begin
    Close;
    ParamByName('Part').AsString := QryAgedStk.fieldByName('Part').AsString;
    ParamByName('Store').AsInteger := QryAgedStk.FieldByName('Part_Store').AsInteger;
    ParamByName('Bin').AsString := QryAgedStk.FieldByName('Bin').AsString;
    ParamByName('Lot').AsString := QryAgedStk.FieldByName('Lot').AsString;
    ParamByName('Part_Movement_Type').AsString := 'J';
    Open;
    qrlblLastJobUsedDate.Caption := fieldByName('Sales_Dt').AsString;
    // for some reason if this was a qrdbtext field it wouldn't work, so had to load into a label !!!!!!!;
  end;
   QRLblInUse.Enabled := qryAgedStk.fieldByName('Not_In_Use').AsString = 'Y';

  if self.exporting then
  begin
    //Product
    tempStr := '"' + qryAgedStk.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('description').asString + '"';

    //Form Reference
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Form_Reference_ID').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('CustName').asString + '"';

    //Rep Name
    if QRMemoRepName.lines.Count > 0 then
      tempStr := tempStr + ',"' + QRMemoRepName.Lines[0] + '"'
    else
      tempStr := tempStr + ',""';

    //Account Manager
    tempStr := tempStr + ',"' + GetAccountManager(qryAgedStk.fieldByName('Customer').asinteger) + '"';

    //Date Received
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Date_Received').asString + '"';

    //Last Sales date
    tempStr := tempStr + ',"' + qrlblLastSalesDate.Caption + '"';

    //Last Job Used date
    tempStr := tempStr + ',"' + qrlblLastJobUsedDate.Caption + '"';

    //Number of days in stock
    tempStr := tempStr + ',"' + qrlblDays.caption + '"';

    //Warehouse
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('part_Store_Name').asString + '"';

    //Bin Location
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Bin').asString + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Stock_Ref').asString + '"';

    //In Stock
    if qryAgedStk.fieldByName('Quantity').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Quantity').asString + '"';

    //Pack Size
    if qryAgedStk.fieldByName('Pack_Size').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Pack_Size').asString + '"';

    //Box Count
    if pos(':', qrlblBoxCountVal.caption) = 0 then
      tempStr := tempStr + ',' + qrlblBoxCountVal.caption
    else
      tempStr := tempStr + ',' + StringReplace(qrlblBoxCountVal.caption, ':', ';', [rfReplaceAll]);

    // Stock Value
    tempStr := tempStr + ',"' + qrlblVal.Caption + '"';

    // Paid/Unpaid
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Invoice_upfront').asString + '"';

    // Do we buy for this client
    tempStr := tempStr + ',"' + GetPOHistory(qryAgedStk.fieldByName('Part').asString) + '"';

    //Product active
    tempStr := tempStr + ',"' + qryAgedStk.fieldByName('Not_In_Use').AsString + '"';

    writeln(self.exportFile, tempStr);
    STRSAgedStkfrm.prgbrExport.StepIt;
  end;

end;

procedure TSTRPAgedStkFrm.qrbndDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
    RunningTotal := RunningTotal + StrToFloat(qrlblVal.Caption);
end;

procedure TSTRPAgedStkFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalStkVal.Caption := '£' + CurrToStrF(RunningTotal, ffFixed, 2);
end;

procedure TSTRPAgedStkFrm.qrAgedStkBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  DateQRLabel.Caption := 'Run Date : ' + DateTimeToStr(Now);
end;

procedure TSTRPAgedStkFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Form Reference"'
    + ',"Customer"'
    + ',"Rep"'
    + ',"Account Manager"'
    + ',"Date Received"'
    + ',"Last Sales Date"'
    + ',"Last Used on Job"'
    + ',"Days in Stock"'
    + ',"Warehouse"'
    + ',"Bin Location"'
    + ',"Stock Reference"'
    + ',"Quantity in Stock"'
    + ',"Pack Size"'
    + ',"Box Count"'
    + ',"Stock Value"'
    + ',"Paid Stock"'
    + ',"We Buy"'
    + ',"Product Not In Use"';

  writeLn(self.exportFile, tempStr);
  self.qrAgedStk.Prepare;
  
  CloseFile(self.exportFile);
end;

function TSTRPAgedStkFrm.GetPOHistory(tempPart: string): string;
begin
  with qryGetPOs do
    begin
      close;
      parambyname('Stock_Reference').asstring := tempPart;
      open;
      if recordcount > 0 then
        begin
          result := 'Y';
          exit;
        end;
    end;

  with qryGetPurchOrds do
    begin
      close;
      parambyname('Part').asstring := tempPart;
      open;
      if recordcount > 0 then
        begin
          result := 'Y';
          exit;
        end;
    end;
  result := 'N';
end;

function TSTRPAgedStkFrm.GetAccountManager(tempCode: integer): string;
begin
  with qryAccMgr do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;
      result := fieldbyname('Account_Manager_Name').asstring
    end;
end;
end.
