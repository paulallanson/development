unit STRPStkBalRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, Qrctrls, QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPStkBalRepfrm = class(TForm)
    qrStkBal: TQuickRep;
    qryStkBalRep: TFDQuery;
    QRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    DateQRLabel: TQRLabel;
    qrlblRange: TQRLabel;
    QRbndDtl: TQRBand;
    qrdbtxtPartDesc: TQRDBText;
    qrdbtxtPart: TQRDBText;
    qrdbtxtPack: TQRDBText;
    qrlblBoxCountVal: TQRLabel;
    qrdbtxtStock: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbtxtOnOrder: TQRDBText;
    qrdbtxtMin: TQRDBText;
    qrdbtxtMax: TQRDBText;
    qrPart: TQRLabel;
    QRShape1: TQRShape;
    qrlblDesc: TQRLabel;
    qrlblPack: TQRLabel;
    qrlblBoxCount: TQRLabel;
    qrlblStock: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlblOnOrder: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLblInUse: TQRLabel;
    QRSysData1: TQRSysData;
    QRLblCust: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    GetTopRepSQL: TFDQuery;
    Query1: TFDQuery;
    QRMemoRepName: TQRMemo;
    GetSerNosSQL: TFDQuery;
    QRSubDtlSerNos: TQRSubDetail;
    lblSerialNos: TQRLabel;
    lblSerialNoRange: TQRLabel;
    GetSerNosSQLSerial_item_from: TWideStringField;
    GetSerNosSQLSerial_item_to: TWideStringField;
    ChildBand1: TQRChildBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    function GetDetails(Sender: TObject): Integer;
    procedure qrStkBalBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRbndDtlBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDtlSerNosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    bSerialNos: boolean;
    exporting: boolean;
    exportFile: textFile;
  public
    { Public declarations }
    bexcProd: Bytebool;
    RepNo, CustNo, CustBranchNo: Integer;
    RepName, CustomerName: string;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPStkBalRepfrm: TSTRPStkBalRepfrm;

implementation

uses STRSStkBalRep, CCSCommon;

{$R *.DFM}

{ TSTRPStkBalRepfrm }

function TSTRPStkBalRepfrm.GetDetails(Sender: TObject): Integer;
begin
if RepNo = 0 then
  begin
    qrystkbalrep.sql.Clear;
    qrystkbalrep.sql := query1.SQL;
  end;
  with qryStkBalRep do
  begin
    Close;
    if bExcProd then
      ParamByName('Not_in_Use').AsString :='Y'
    else
      ParamByName('Not_In_Use').Asstring := '';
    ParamByName('Part_From').AsString := STRSStkBalRepFrm.edtPartFrom.Text;
    ParamByName('Part_To').AsString :=  STRSStkBalRepFrm.edtPartTo.Text;
    ParamByName('Customer').AsInteger := CustNo;
//    ParamByName('CustBranch').AsInteger := CustBranchNo;
    if RepNo <> 0 then
      ParamByName('Rep').AsInteger := RepNo;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTRPStkBalRepfrm.qrStkBalBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TitleQRLabel.Caption := 'Stock Balance Report';
  DateQRLabel.Caption := 'Run Date : ' + DateTimeToStr(Now);
  QRLabel7.enabled := not bExcProd;
end;

procedure TSTRPStkBalRepfrm.QRbndDtlBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  loop : integer;
  tempStr: string;
begin
  childband1.enabled := false;
  QrmemoRepName.lines.clear;
   bserialnos := true;
  with qryStkBalRep do
  begin
    qrlblBoxCountVal.Caption := ShowInPacks(FieldByName('Qty_in_Stock').AsInteger, FieldByName('Sell_Pack_Quantity').AsInteger);
  end;

  QRLblInUse.Enabled := qryStkBalRep.fieldByName('Not_In_Use').AsString = 'Y';
  if RepNo <> 0 then
  begin
    QRMemoRepName.Lines.append(qrystkBalRep.FieldByName('Rep_Name').AsString);
  end
  else
  begin
    with GetTopRepSQL do
    begin
      close;
      paramByName('Part').AsString := qryStkBalRep.FieldByname('Part').AsString;
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
    QRBndDtl.height := 18;
    qrmemoRepname.Enabled := false;
  end
  else
  begin
    QRBndDtl.height := 35;
    qrmemoRepname.Enabled := True;
  end;

  with GetSerNosSQl do
  begin
    close;
    paramByName('Part').AsString := qrystkBalRep.fieldByName('Part').AsString;
    open;
  end;

  if self.exporting then
  begin
    //product
    tempStr := '"' + qryStkBalRep.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('part_description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Cust_Name').asString + '"';

    //Rep Name
    if QRMemoRepName.lines.Count > 0 then
      tempStr := tempStr + ',"' + QRMemoRepName.Lines[0] + '"'
    else
      tempStr := tempStr + ',""';

    //Box Size
    tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Sell_Pack_Quantity').asString + '"';

    //Box Count
    if pos(':', qrlblBoxCountVal.caption) = 0 then
      tempStr := tempStr + ',' + qrlblBoxCountVal.caption
    else
      tempStr := tempStr + ',' + StringReplace(qrlblBoxCountVal.caption, ':', ';', [rfReplaceAll]);

    //In Stock
    if qryStkBalRep.fieldByName('Qty_in_Stock').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Qty_in_Stock').asString + '"';

    //Alloc Stock
    if qryStkBalRep.fieldByName('Qty_Allocated').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Qty_Allocated').asString + '"';

    //Free Stock
    if qryStkBalRep.fieldByName('Free_Stock').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Free_Stock').asString + '"';

    //On Production Order
    if qryStkBalRep.fieldByName('Production Order Qty').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Production Order Qty').asString + '"';

    //On Purchase Order
    if qryStkBalRep.fieldByName('Purchase Order Qty').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Purchase Order Qty').asString + '"';

    //Min Stock
    if qryStkBalRep.fieldByName('Minimum_Stock').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Minimum_Stock').asString + '"';

    //Max Stock
    if qryStkBalRep.fieldByName('Maximum_Stock').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + qryStkBalRep.fieldByName('Maximum_Stock').asString + '"';

    writeln(self.exportFile, tempStr);
    STRSStkBalRepfrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPStkBalRepfrm.QRSubDtlSerNosBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  childband1.enabled := true;
  if GetSerNosSQL.fieldbyname('serial_item_from').asstring = '' then
    PrintBand := false;
  lblSerialNos.Enabled := bserialNos;
  lblSerialNoRange.caption := GetSerNosSQL.fieldbyname('serial_item_from').asstring + ' to ' +
                              GetSerNosSQL.fieldbyname('serial_item_to').asstring;
  if printband then
    bserialNos := false;
end;

procedure TSTRPStkBalRepfrm.ExportToFile(fileName: string);
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
    + ',"Box Size"'
    + ',"Box Count"'
    + ',"In Stock"'
    + ',"Allocated Stock"'
    + ',"Free Stock"'
    + ',"On Order (Production)"'
    + ',"On Order (Purchase)"'
    + ',"Min Stock"'
    + ',"Max Stock"';

  writeLn(self.exportFile, tempStr);
  self.qrStkBal.Prepare;
  
  CloseFile(self.exportFile);
end;

end.
