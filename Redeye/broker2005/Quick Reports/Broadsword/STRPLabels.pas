(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Labels Form.

VSS Info:
$Header: /Broker Stock/Quick Reports/Broadsword/STRPLabels.pas 3     27/03/:3 12:41 Janiner $
$History: STRPLabels.pas $
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 27/03/:3   Time: 12:41
 * Updated in $/Broker Stock/Quick Reports/Broadsword
 * allow address only labels
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 29/01/:3   Time: 9:36
 * Updated in $/Broker Stock/Quick Reports/Broadsword
 * Format label print to broadsword layout.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 28/01/:3   Time: 10:42
 * Created in $/Broker Stock/Quick Reports/Broadsword
 * Initial takeon of Broadsword specific reports
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
    PONumberLbl: TQRLabel;
    AddressSRC: TDataSource;
    BoxQuantityLbl: TQRLabel;
    AddressMemo: TQRMemo;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    DescLbl: TQRLabel;
    AddQRLabel: TQRLabel;
    BoxQRLbl: TQRLabel;
    AdhocSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    qrdbPart: TQRDBText;
    lblCustOrderRef: TQRLabel;
    lblDate: TQRLabel;
    lblDeliveryNo: TQRLabel;
    lblDeliverTo: TQRLabel;
    QRLabel1: TQRLabel;
    FromQRLbl: TQRLabel;
    lblBoxNo: TQRLabel;
    BoxQtyCaptionlbl: TQRLabel;
    Shape1: TQRShape;
    imgLogo: TQRImage;
    DeliveryDateLbl: TQRLabel;
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
    bLineup: boolean;
    LogoPath: string;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  STRPLabelsFrm: TSTRPLabelsFrm;

implementation

{$R *.DFM}

procedure TSTRPLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  iNumber: integer;
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;

  PONumberLbl.Caption := PODelivSQL.FieldByName('Sales_Order').AsString;

  BoxQuantityLbl.Caption := IntToStr(PODelivSql.FieldByname('Sell_Pack_Quantity').AsInteger);
  DescLbl.Caption := PODelivSQL.FieldByName('Part_Description').AsString;
  BoxQRLbl.Caption := PODelivSql.FieldByName('Sel4').AsString + ' of '+PODelivSql.FieldByName('Text100').AsString;

  if (PODelivSql.FieldByName('Numbered').AsString = 'Y') and (PODelivSql.FieldByName('Sel5').AsInteger <> 0) then
    begin
      try
        iNumber := strtoint(PODelivSql.FieldByName('Sel5').AsString) + PODelivSql.FieldByname('Sell_Pack_Quantity').AsInteger - 1;
        FromQRLbl.Caption := PODelivSql.FieldByName('Sel5').AsString+ ' to ' + inttostr(iNumber);
        FromQRLbl.enabled := true;
      except
        FromQRLbl.enabled := false;
      end;
    end
  else
    begin
      FromQRLbl.enabled := false;
    end



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

  try
    imgLogo.Picture.LoadFromFile(LogoPath);
  except
    imgLogo.Picture.LoadFromFile('');
  end;
end;

procedure TSTRPLabelsFrm.SetCaptions;
begin
  QRDBPart.Enabled := not bAddressOnly;
  DescLbl.Enabled := not bAddressOnly;
  LblBoxNo.Enabled := not bAddressOnly;
  BoxQtyCaptionLbl.enabled := not bAddressOnly;
  BoxQrLbl.Enabled := not bAddressOnly;
  PONumberLbl.enabled := not bAddressOnly;
  BoxQuantityLbl.enabled := not bAddressOnly;
  QRLabel1.enabled := not bAddressOnly;
//  QRLabel4.enabled := not bAddressOnly;
//  QRLabel5.enabled := not bAddressOnly;
//  QRLabel6.enabled := not bAddressOnly;
// DeliveryDatelbl.Enabled := not bAddressOnly;
  QRDBCustOrderRef.Enabled := not bAddressOnly;
  lblCustOrderRef.enabled := not bAddressOnly;
  LblDeliveryNo.Enabled := not bAddressOnly;
  Shape1.enabled := not bAddressOnly;
end;

procedure TSTRPLabelsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
