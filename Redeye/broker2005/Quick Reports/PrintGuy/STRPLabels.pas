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
unit STRPLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint;

type
  TSTRPLabelsFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    PODelivSQL: TQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressSRC: TDataSource;
    BoxQuantityLbl: TQRLabel;
    QRDBCustOrderRef: TQRDBText;
    QRLabel2: TQRLabel;
    DescripLbl: TQRLabel;
    DescLbl: TQRLabel;
    BoxQRLbl: TQRLabel;
    AdhocSQL: TQuery;
    CustomerSQL: TQuery;
    QRLabel7: TQRLabel;
    qrdbPart: TQRDBText;
    lblCustOrderRef: TQRLabel;
    lblDate: TQRLabel;
    lblDeliveryNo: TQRLabel;
    lblBoxNo: TQRLabel;
    BoxQtyCaptionlbl: TQRLabel;
    QRLabel5: TQRLabel;
    qryGetFSCClaim: TQuery;
    DeliveryDateLbl: TQRLabel;
    ReportImage: TQRImage;
    qrmCompany: TQRMemo;
    CompSQL: TQuery;
    lblCustomer: TQRLabel;
    AddressMemo: TQRMemo;
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
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  STRPLabelsFrm: TSTRPLabelsFrm;

implementation

uses PBImages;

{$R *.DFM}

procedure TSTRPLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFSCClaim: string;
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;

  LblDeliveryNo.Caption := PODelivSQL.FieldByName('Sales_Order').AsString;

  BoxQuantityLbl.Caption := IntToStr(PODelivSql.FieldByname('Sell_Pack_Quantity').AsInteger);
  DescLbl.Caption := PODelivSQL.FieldByName('Part_Description').AsString;
 // FromQRLbl.Caption := PODelivSql.FieldByName('Sel4').AsString+ ' of '+PODelivSql.FieldByName('Text100').AsString;
  BoxQRLbl.Caption := PODelivSql.FieldByName('Sel4').AsString;

(*  {Display FSC Claim}
  gtlblFSCClaim.Enabled := false;
  gtlblFSCClaim.Caption := '';
  if PODelivSQl.fieldbyname('FSC_Material_Claim').asinteger <> 0 then
    begin
      with qryGetFSCClaim do
        begin
          close;
          parambyname('FSC_Material_Claim').asinteger := PODelivSQl.fieldbyname('FSC_Material_Claim').asinteger;
          open;
          if recordcount > 0 then
            begin
              gtlblFSCClaim.Enabled := true;
              if fieldbyname('Mixed_Claim').asstring = 'Y' then
                sFSCClaim := stringreplace(fieldbyname('Short_Description').asstring,'X',formatfloat('0',PODelivSQl.fieldbyname('FSC_Mixed_Percentage').asfloat),[])
              else
                sFSCClaim := fieldbyname('Short_Description').asstring;

              if trim(fieldbyname('Claim_Type').asstring) = 'FSC' then
                gtlblFSCClaim.Caption := 'FSC Claim: ' + sFSCClaim
              else
                gtlblFSCClaim.Caption := 'PEFC Declaration: ' + sFSCClaim
            end
          else
            begin
              gtlblFSCClaim.Enabled := false;
              gtlblFSCClaim.Caption := '';
            end;
        end;
    end;
*)
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
  Result := PODelivSQL.RecordCount;
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
