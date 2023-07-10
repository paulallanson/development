unit STRPLabelsDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint;

type
  TSTRPLabelsDelivFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    oldSODelivSQL: TQuery;
    SODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressSRC: TDataSource;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    BoxQRLbl: TQRLabel;
    AdhocSQL: TQuery;
    CustomerSQL: TQuery;
    lblCustOrderRef: TQRLabel;
    lblDate: TQRLabel;
    lblDeliveryNo: TQRLabel;
    lblBoxNo: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblDelivery: TQRLabel;
    lblDeliveryTo: TQRLabel;
    QRLabel3: TQRLabel;
    SODelivSQL: TQuery;
    QRDBText1: TQRDBText;
    DeliveryDateLbl: TQRLabel;
    AddressMemo: TQRMemo;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
  public
    Preview: ByteBool;
    PrintAddress: ByteBool;
    iSONumber: integer;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    LogoPath: string;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
  end;

var
  STRPLabelsDelivFrm: TSTRPLabelsDelivFrm;

implementation

{$R *.DFM}

procedure TSTRPLabelsDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  if (blineup) then Exit;

  lblDeliveryNo.Caption := SODelivSQL.FieldByName('Sales_Order').AsString;
  BoxQRLbl.Caption := SODelivSql.FieldByName('Sel4').AsString + ' of ' + SODelivSql.FieldByName('Text100').AsString;
end;

function TSTRPLabelsDelivFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  UseBrnchNm: ByteBool;
begin
  {Activate the main report SQL}
  with SODelivSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;

  AddressMemo.Lines.Clear;
  UseBrnchNm := False;
  if SODelivSQL.FieldByName('Delivery_Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := SODelivSQL.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger := SODelivSQL.FieldByName('Delivery_Branch').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end;
  if SODelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      UseBrnchNm := true;
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          SODelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
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
  Result := SODelivSQL.RecordCount;
  if not UseBrnchNm then
    begin
      lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString;
      lblDeliveryTo.caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
    end
  else
    begin
      lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
      lblDeliveryTo.enabled := false;
      qrlblDelivery.enabled := false;
    end;
  if printAddress then
  begin
    Addressmemo.enabled := true;
    AddressMemo.lines.Add(SODelivSql.fieldByName('Contact_name').AsString);
    AddressMemo.Lines.Add(lblCustomer.Caption);
    for irow := 1 to 5 do
    begin
      if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
      AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
    end;
    QRDbText1.enabled := false;
    lblcustomer.enabled := false;
    QRLabel3.enabled := false;
    QRLblDelivery.enabled := false;
    lbldeliveryto.enabled := false;
  end;

end;

procedure TSTRPLabelsDelivFrm.STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
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

end.
