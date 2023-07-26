unit STRPAgedStkNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, QRCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPAgedStkNoteFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qryReport: TFDQuery;
    qrlblDateSince: TQRLabel;
    qryDummy: TFDQuery;
    qrgStoreStock: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    lblDateReceived: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDays: TQRLabel;
    qrlblValue: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblLastUsageDate: TQRLabel;
    qryLastUsageDate: TFDQuery;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    procedure qrgStoreStockBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    bExcProd, bAtCost: Bytebool;
    iStore: integer;
    BinFrom, BinTo: string;
    RepNo, CustNo, CustBranchNo, NoofDays, MaxRecords: Integer;
    RepName, CustomerName: string;
    RunDate: TDateTime;
    function GetDetails(Sender: TObject): Integer;
  end;

var
  STRPAgedStkNoteFrm: TSTRPAgedStkNoteFrm;

implementation

uses STRSAgedStk, CCSCommon;

{$R *.dfm}

function TSTRPAgedStkNoteFrm.GetDetails(Sender: TObject): Integer;
begin
  if RepNo = 0 then
    begin
      qryReport.sql.Clear;
      qryReport.sql := qryDummy.SQL;
    end;

  with qryReport do
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
    ParamByName('Max_Records').Asinteger := MaxRecords;
    ParamByName('Bin_From').Asstring := BinFrom;
    ParamByName('Bin_To').Asstring := BinTo;

    if RepNo <> 0 then
      ParamByName('Rep').AsInteger := RepNo;
    Open;

    Result := RecordCount;
  end;
end;

procedure TSTRPAgedStkNoteFrm.qrgStoreStockBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblDateReceived.caption := pbdatestr(qryReport.fieldbyname('Date_Received').asdatetime);

  qrlblDays.caption := floattostr(Date - qryReport.FieldByName('Date_Received').asdatetime);

  if bAtCost then
    qrlblValue.Caption := FormatFloat('#######0.00',qryReport.FieldByname('Stock_Value').AsFloat)
  else
    qrlblValue.Caption := FormatFloat('#######0.00',((qryReport.FieldByname('Quantity').AsInteger/qryReport.FieldByName('Sell_Pack_Size').AsInteger)*qryReport.fieldByName('Sales_Value').AsFloat));

  if qryReport.FieldByName('Invoice_upfront').asstring = 'Y' then
    qrlblValue.caption := '0.00';

  with qryLastUsageDate do
  begin
    Close;
    ParamByName('Part').AsString := qryReport.fieldByName('Part').AsString;
    ParamByName('Store').AsInteger := qryReport.FieldByName('Part_Store').AsInteger;
    ParamByName('Bin').AsString := qryReport.FieldByName('Bin').AsString;
    ParamByName('Lot').AsString := qryReport.FieldByName('Lot').AsString;
    Open;
    qrlblLastUsageDate.Caption := PBDateStr(fieldByName('Sales_Dt').Asdatetime);
  end;
end;

end.
