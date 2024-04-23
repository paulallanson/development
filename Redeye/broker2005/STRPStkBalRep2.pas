unit STRPStkBalRep2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPStkBalRep2frm = class(TForm)
    qrStkBal: TQuickRep;
    QRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    DateQRLabel: TQRLabel;
    qrlblRange: TQRLabel;
    qryStkBalRep: TFDQuery;
    QRGroup1: TQRGroup;
    qrPart: TQRLabel;
    qrdbtxtPart: TQRDBText;
    qrlblPartStoreName: TQRLabel;
    qrlblDesc: TQRLabel;
    qrlblPack: TQRLabel;
    qrlblBoxCount: TQRLabel;
    qrlblStock: TQRLabel;
    qrlblOnOrder: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbtxtPartDesc: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRbndDtl: TQRBand;
    qrdbtxtPartStoreName: TQRDBText;
    qrdbtxtPack: TQRDBText;
    qrlblBoxCountVal: TQRLabel;
    qrdbtxtStock: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbtxtOnOrder: TQRDBText;
    qrdbtxtMin: TQRDBText;
    qrdbtxtMax: TQRDBText;
    QRbndFooter: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLblInUse: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblWarehouse: TQRLabel;
    QRLblCust: TQRLabel;
    QRShape2: TQRShape;
    qrsdtlNumbers: TQRSubDetail;
    lblSerialNos: TQRLabel;
    lblSerialNoRange: TQRLabel;
    GetSerNosSQL: TFDQuery;
    GetSerNosSQLSerial_item_from: TWideStringField;
    GetSerNosSQLSerial_item_to: TWideStringField;
    ChildBand1: TQRChildBand;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    function GetDetails(Sender: TObject): Integer;
    procedure qrStkBalBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRbndDtlBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdtlNumbersBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     bSerialNos: boolean;
    { Private declarations }
  public
     bexcProd: Bytebool;
    RepNo, CustNo, CustBranchNo: Integer;
    RepName, CustomerName: string;
    { Public declarations }
  end;

var
  STRPStkBalRep2frm: TSTRPStkBalRep2frm;

implementation

uses STPacks, STRSStkBalRep;

{$R *.DFM}

{ TSTRPStkBalRep2frm }

function TSTRPStkBalRep2frm.GetDetails(Sender: TObject): Integer;
begin
  with qryStkBalRep do
  begin
    Close;
    if bExcProd then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';
    ParamByName('Part_From').AsString := STRSStkBalRepFrm.edtPartFrom.Text;
    ParamByName('Part_To').AsString :=  STRSStkBalRepFrm.edtPartTo.Text;
    ParamByName('Rep').AsInteger := RepNo;
    ParamByName('Customer').AsInteger := CustNo;
    ParamByName('CustBranch').AsInteger := CustBranchNo;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTRPStkBalRep2frm.qrStkBalBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TitleQRLabel.Caption := 'Stock Balance Report';
  DateQRLabel.Caption := 'Run Date : ' + DateTimeToStr(Now);
  QRLabel7.enabled := not bExcProd;
end;

procedure TSTRPStkBalRep2frm.QRbndDtlBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
bserialnos := true;
childband1.enabled := false;
  with qryStkBalRep do
  begin
    if FieldByName('part_store_name').asString = '' then
    begin
      qrlblWarehouse.Caption := 'Out of Stock.';
      qrlblWarehouse.Enabled := true;
      qrlblWarehouse.BringToFront;
    end
    else
    begin
      qrlblWarehouse.Enabled := false;
    end;
    qrlblBoxCountVal.Caption := STPacks.ShowInPacks(FieldByName('Qty_in_Stock').AsInteger, FieldByName('Sell_Pack_Quantity').AsInteger);
  end;
QRLblInUse.Enabled := qryStkBalRep.fieldByName('Not_In_Use').AsString = 'Y';
  with GetSerNosSQl do
  begin
    close;
    paramByName('Part').AsString := qrystkBalRep.fieldByName('Part').AsString;
    open;
  end;
end;

procedure TSTRPStkBalRep2frm.qrsdtlNumbersBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
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

procedure TSTRPStkBalRep2frm.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
childband1.enabled := false;
end;

end.
