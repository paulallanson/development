unit STRPLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, Grids, DBGrids,
  CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPLabelsFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    PODelivSQL: TFDQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressSRC: TDataSource;
    BoxQuantityLbl: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    DescripLbl: TQRLabel;
    DescLbl: TQRLabel;
    BoxQRLbl: TQRLabel;
    AdhocSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    QRLabel7: TQRLabel;
    qrdbPart: TQRDBText;
    lblCustOrderRef: TQRLabel;
    lblDate: TQRLabel;
    lblDeliveryNo: TQRLabel;
    QRLabel1: TQRLabel;
    FromQRLbl: TQRLabel;
    lblBoxNo: TQRLabel;
    BoxQtyCaptionlbl: TQRLabel;
    QRLabel5: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
    FbAddressOnly: boolean;
    procedure SetbAddressOnly(const Value: boolean);
    procedure SetCaptions;
  public
    Preview: ByteBool;
    iSONumber: integer;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    LogoPath: string;
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  STRPLabelsFrm: TSTRPLabelsFrm;

implementation

{$R *.DFM}

procedure TSTRPLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;

  LblDeliveryNo.Caption := PODelivSQL.FieldByName('Sales_Order').AsString;

  BoxQuantityLbl.Caption := IntToStr(PODelivSql.FieldByname('Sell_Pack_Quantity').AsInteger);
  DescLbl.Caption := PODelivSQL.FieldByName('Part_Description').AsString;
 // FromQRLbl.Caption := PODelivSql.FieldByName('Sel4').AsString+ ' of '+PODelivSql.FieldByName('Text100').AsString;
  BoxQRLbl.Caption := PODelivSql.FieldByName('Sel4').AsString;



end;

function TSTRPLabelsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  UseBrnchNm: ByteBool;
begin
  {Activate the main report SQL}
  with PODelivSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    {     	ParamByName('Purchase_Order').asfloat := rPONumber ;
            parambyname('Line').asinteger := iLine;
         } Open;
  end;
//  AddressMemo.Lines.Clear;
  UseBrnchNm := False;
  if PODelivSQL.FieldByName('Delivery_Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        PODelivSQL.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        PODelivSQL.FieldByName('Delivery_Branch').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end;
  if PODelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          PODelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := AdhocSQL;
    end ;
  {Build the Address Memo field}
//  DeliveryName.Caption := AddressSRC.dataset.Fields[0].AsString;
(*  for irow := 1 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
*)
  Result := PODelivSQL.RecordCount;
  if not UseBrnchNm then
    lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString
  else
    lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
end;

procedure TSTRPLabelsFrm.STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with STLabelsQuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;
end;

procedure TSTRPLabelsFrm.SetCaptions;
begin
  QRLabel7.enabled := not bAddressOnly;
  QRDBPart.Enabled := not bAddressOnly;
  DescLbl.Enabled := not bAddressOnly;
  DescripLbl.Enabled := not bAddressOnly;
  LblBoxNo.Enabled := not bAddressOnly;
  BoxQtyCaptionLbl.enabled := not bAddressOnly;
  BoxQrLbl.Enabled := not bAddressOnly;
  LblDeliveryNo.enabled := not bAddressOnly;
  BoxQuantityLbl.enabled := not bAddressOnly;
//  QRLabel1.enabled := not bAddressOnly;
//  QRLabel4.enabled := not bAddressOnly;
//  QRLabel5.enabled := not bAddressOnly;
//  QRLabel6.enabled := not bAddressOnly;
// DeliveryDatelbl.Enabled := not bAddressOnly;
  QRDBCustOrderRef.Enabled := not bAddressOnly;
  lblCustOrderRef.enabled := not bAddressOnly;
  LblDeliveryNo.Enabled := not bAddressOnly;
end;

procedure TSTRPLabelsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
