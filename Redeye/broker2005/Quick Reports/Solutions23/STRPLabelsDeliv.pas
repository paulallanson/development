(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Labels Form.

VSS Info:
$Header: /Broker Stock/Quick Reports/Formpro/STRPLabels.pas 5     19/09/03 9:31 Paul $
$History: STRPLabels.pas $
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 19/09/03   Time: 9:31
 * Updated in $/Broker Stock/Quick Reports/Formpro
 * Changed layout to work with new labels
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 3/09/03    Time: 15:59
 * Updated in $/Broker Stock/Quick Reports/Formpro
 * Changed format to fit in with printer layout
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 9/07/:3    Time: 11:15
 * Updated in $/Broker Stock/Quick Reports/Formpro
 * Make label format similar to standard broker format.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 3/07/03    Time: 15:14
 * Updated in $/Broker Stock/Quick Reports/Formpro
 * Changed to lnscape and set label height to width etc, etc, etc
 * ............
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 27/05/03   Time: 12:44
 * Created in $/Broker Stock/Quick Reports/Formpro
 * Initial takeon of Formpro documents
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
    oldSODelivSQL: TFDQuery;
    SODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressSRC: TDataSource;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    BoxQRLbl: TQRLabel;
    AdhocSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    lblCustOrderRef: TQRLabel;
    lblDate: TQRLabel;
    lblDeliveryNo: TQRLabel;
    lblBoxNo: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblDelivery: TQRLabel;
    lblDeliveryTo: TQRLabel;
    QRLabel3: TQRLabel;
    SODelivSQL: TFDQuery;
    QRDBText1: TQRDBText;
    DeliveryDateLbl: TQRLabel;
    AddressMemo: TQRMemo;
    qrmCompany: TQRMemo;
    CompSQL: TFDQuery;
    ReportImage: TQRImage;
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

uses PBImages;

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
  for irow := 1 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  if not UseBrnchNm then
    lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString
  else
    lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
  Result := SODelivSQL.RecordCount;
(*  if not UseBrnchNm then
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
*)
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

  ReportImage.enabled := true;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

  {Build the company address details}
  with CompSQL do
    begin
      qrmCompany.Lines.clear;
      Close;
      Open;
      qrmCompany.Lines.Append(Trim(CompSQL.Fields[1].AsString) + ', ' + Trim(CompSQL.Fields[2].AsString) + ', ' + Trim(CompSQL.Fields[3].AsString) + ', ' + Trim(CompSQL.Fields[4].AsString) + '. ' + Trim(CompSQL.Fields[5].AsString)) ;

        {Finally, add the phone number} ;
      qrmCompany.Lines.Append('Telephone: ' + Trim(CompSQL.FieldByName('Phone').AsString) + ' Email: ' + Trim(CompSQL.FieldByName('Email').AsString));
    end;
end;

end.
