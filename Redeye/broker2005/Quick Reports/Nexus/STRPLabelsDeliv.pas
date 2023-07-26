(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Labels Form.

VSS Info:
$Header: /Broker Stock/Quick Reports/Nexus/STRPLabels.pas 4     27/03/:3 14:27 Janiner $
$History: STRPLabels.pas $
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 27/03/:3   Time: 14:27
 * Updated in $/Broker Stock/Quick Reports/Nexus
 * allow for address labels only functionality
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 9/01/:3    Time: 15:21
 * Updated in $/Broker Stock/Quick Reports/Nexus
 * Changed to include the product code on the label
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 8/01/:3    Time: 11:09
 * Updated in $/Broker Stock/Quick Reports/Nexus
 * new broker sop delivery label print
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 8/01/:3    Time: 11:02
 * Updated in $/Broker Stock/Quick Reports/Broker
 * new procedure for getting sales delivery details and calculating number
 * of labels.  also fix bug regarding adhoc addresses.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 26/11/:2   Time: 11:48
 * Created in $/Broker Stock/Quick Reports/Broker
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 26/11/:2   Time: 10:57
 * Created in $/Broker Stock/Quick Reports/Nexus
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:2   Time: 12:13
 * Created in $/Broker Stock
 * delivery label routine
 *
*******************************************************************************)
unit STRPLabelsDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, Grids, DBGrids,
  CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPLabelsDelivFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    PODelivSQL: TFDQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    PONumberLbl: TQRLabel;
    AddressSRC: TDataSource;
    AddressMemo: TQRMemo;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    AddQRLabel: TQRLabel;
    BoxNoQRLbl: TQRLabel;
    BoxQRLbl: TQRLabel;
    AdhocSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    DeliveryDateLbl: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
    FbAddressOnly: boolean;
    FlogoPath: string;
    procedure SetbAddressOnly(const Value: boolean);
    procedure SetCaptions;
    procedure SetlogoPath(const Value: string);
  public
    Preview: ByteBool;
    iSONumber: integer;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    PrintAddress: Boolean;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
    property logoPath: string read FlogoPath write SetlogoPath;
  end;

var
  STRPLabelsDelivFrm: TSTRPLabelsDelivFrm;

implementation

{$R *.DFM}

procedure TSTRPLabelsDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;

  PONumberLbl.Caption := PODelivSQL.FieldByName('Sales_Order').AsString;

//  BoxQRLbl.Caption := PODelivSql.FieldByName('Sel4').AsString+ ' of '+PODelivSql.FieldByName('Text100').AsString;



end;

function TSTRPLabelsDelivFrm.GetDetails(Sender: TObject): Integer;
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
  AddressMemo.Lines.Clear;
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
  for irow := 1 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
     Result := PODelivSQL.RecordCount;
 if not UseBrnchNm then
    lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString
  else
    lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
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

procedure TSTRPLabelsDelivFrm.SetCaptions;
begin
  PONumberLbl.enabled := not bAddressOnly;
  QRLabel4.enabled := not bAddressOnly;
  QRLabel5.enabled := not bAddressOnly;
  QRLabel6.enabled := not bAddressOnly;
  DeliveryDatelbl.Enabled := not bAddressOnly;
  QRDBCustOrderRef.Enabled := not bAddressOnly;
end;

procedure TSTRPLabelsDelivFrm.SetlogoPath(const Value: string);
begin
  FlogoPath := Value;
end;

procedure TSTRPLabelsDelivFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
