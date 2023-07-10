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
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint;

type
  TSTRPLabelsDelivFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    SODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressSRC: TDataSource;
    AdhocSQL: TQuery;
    CustomerSQL: TQuery;
    SODelivSQL: TQuery;
    QRShape3: TQRShape;
    CompNameQRLabel: TQRLabel;
    CompAddrQRLabel: TQRLabel;
    QRShape4: TQRShape;
    CompSQL: TQuery;
    QRLabel7: TQRLabel;
    DescrQRLabel: TQRLabel;
    QRLabel1: TQRLabel;
    FormRefLbl: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    FAOQRLabel: TQRLabel;
    AddressMemo: TQRMemo;
    lblCustomer: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
  public
    Preview: ByteBool;
    iSONumber: integer;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
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

  FormRefLbl.Caption := SODelivSQL.FieldByName('Sales_Order').AsString;
end;

function TSTRPLabelsDelivFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  sTempDelimiter: string;
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

{Get the company address regardless of whether it's the delivery address because} ;
  {it's printed on each PMS format label} ;
          with CompSQL do
          begin
            Close;
            Open;
          end;

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
   {Get the FOA} ;
  if SODelivSQL.FieldByName('Delivery_Customer').AsString <> '' then
  begin
    FAOQRLabel.Caption := SODelivSQL.FieldByName('Contact_Name').AsString ;
  end
  else
  begin
    FAOQRLabel.Caption := '';
    QRLabel3.Caption  := '';
  end;
  {can only get ftao if is deliv to customer} ;


  for irow := 1 to 4 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  {Add the postcode details to the end of the last line} ;
  AddressMemo.Lines[AddressMemo.Lines.Count-1] := trim(AddressMemo.Lines[AddressMemo.Lines.Count-1]) + '  ' +
        AddressSRC.DataSet.FieldByName('PostCode').AsString ;

  Result := SODelivSQL.RecordCount;
  if not UseBrnchNm then
    begin
      lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString;
    end
  else
    begin
      lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
    end;

    {Build the Company Memo field}
  CompNameQRLabel.caption := UpperCase(Trim(CompSQL.fieldbyname('Company_Name').asstring));
  CompAddrQRLabel.caption := '' ;
  {add in all the address details EXCEPT the postcode} ;
  for irow := 1 to 5 do
    begin
    {No comma or space before 1st detail, comma and space after others, just a space} ;
    {before postcode} ;
    Case iRow of
        1:      sTempDelimiter := '' ;
        2..4:   sTempDelimiter := ', ' ;
        5:      sTempDelimiter := ' ' ;
        end;
    if Trim(CompSQL.Fields[irow].AsString) <> '' then
        CompAddrQRLabel.caption := CompAddrQRLabel.caption + sTempDelimiter +
                        Trim(CompSQL.Fields[irow].AsString);
    end;
  {Finally, add the phone number} ;
  {CompQRMemo.Lines.Add('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString))};
  DescrQRLabel.Caption := SODelivSQL.fieldByName('Cust_Order_No').AsString;
  FormRefLbl.Caption := SODelivSQL.FieldByName('Sales_Order').AsString;
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
