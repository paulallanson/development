(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------                                                                          
  Labels Form.

VSS Info:
$Header: /PBL D5/Quick Reports/PMS/PBRPLabels.pas 7     28/02/:3 14:45 Paul $
$History: PBRPLabels.pas $
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 28/02/:3   Time: 14:45
 * Updated in $/PBL D5/Quick Reports/PMS
 * sets PrinterSettings.outputbin to user selected details 
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 23/01/:3   Time: 13:18
 * Updated in $/PBL D5/Quick Reports/PMS
 * Name was taken from customer not always correct due to ad hoc etc, only
 * match ftao to customers, move format slightly to allow for 4 lines of
 * address to be printed .
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 30/09/02   Time: 11:33
 * Updated in $/PBL D5/Quick Reports/PMS
 * Another complete re-format of labels for PMS.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 23/09/02   Time: 16:13
 * Updated in $/PBL D5/Quick Reports/PMS
 * Revise layout again for PMS.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 23/09/02   Time: 11:27
 * Updated in $/PBL D5/Quick Reports/PMS
 * Revised Labels Layouts for PMS.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 11/09/02   Time: 16:33
 * Updated in $/PBL D5/Quick Reports/PMS
 * Change layout to suit PMS.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 18/07/:2   Time: 15:01
 * Created in $/PBL D5/Quick Reports/PMS
 * Initial takeon of Print Management Systems documents
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 24/01/:2   Time: 15:27
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Amend Delivery labels as requested.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 17/01/:2   Time: 11:11
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Corrected problem of not printing multiple labels
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 9/01/:2    Time: 13:09
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Added new variable bStocked to allow different types of labels to be
 * printed
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 8/01/:2    Time: 11:50
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Changes made to Nexus format
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 30/10/:1   Time: 15:01
 * Created in $/PBL D5/Quick Reports/Nexus
 * Initial takeon of Nexus forms
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 26/07/:1   Time: 10:55
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Added property to allow the printing of Address labels only 
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 19/03/:1   Time: 11:56
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Added date to the label
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 29/11/:0   Time: 17:13
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Increased size of Label from 203mm to 204mm
 *                                                                              
 * *****************  Version 7  *****************
 * User: Paul         Date: 20/11/:0   Time: 17:04
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to clear the Form Description Memo before printing each line
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:22
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to ommit printing the Branch Name in the description
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 14/11/:0   Time: 16:23
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to include the Branch Name in all address details
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 13/11/:0   Time: 15:38
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed label print to display the Box Quantity
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 11/07/:0   Time: 14:24
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed format of labels to include Numbering from and To and the Box
 * Number
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 10/03/:0   Time: 11:27
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Change back to using QuickReports, customised for BroadSword.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:02
 * Created in $/PBL D5/QuickReports/BroadSword
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:01
 * Created in $/PBL D5/QuickReports/Forms Technology
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:30
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRPLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, Grids, DBGrids,
  CCSPrint, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPLabelsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    PODelivSQL: TFDQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    CustomerSQL: TFDQuery;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    AddressSRC: TDataSource;
    CompSQL: TFDQuery;
    FormRefLbl: TQRLabel;
    QRLabel1: TQRLabel;
    AddressMemo: TQRMemo;
    lblCustomer: TQRLabel;
    CustSQL: TFDQuery;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    CompNameQRLabel: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    DeliveryDateLbl: TQRLabel;
    GetFAOSQL: TFDQuery;
    FAOQRLabel: TQRLabel;
    DescrQRLabel: TQRLabel;
    QRLabel4: TQRLabel;
    CompAddrQRLabel: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    function GetCustomerName(iCust: integer): string;
    procedure PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
    FbAddressOnly: boolean;
    procedure SetbAddressOnly(const Value: boolean);
    procedure SetCaptions;
  public
    Preview: ByteBool;
    rPONumber: real;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    bStocked: string;
    useCustAddress: boolean;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  PBRPLabelsFrm: TPBRPLabelsFrm;

implementation

uses PBMenuMain;

{$R *.DFM}

procedure TPBRPLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo: string;
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;
  FormRefLbl.Caption := PODelivSQL.FieldByName('Form_Reference_id').AsString;
  DescrQRLabel.Caption := PODelivSQL.Fieldbyname('Customers_Desc').asstring;

  if Trim(sNumberFrom) <> '' then
  begin
    sFrom := Trim(sPrefix) + Trim(sNumberFrom);
    sNumberTo := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity*iSets) - 1);
    sTo := Trim(sPrefix) + Trim(sNumberTo);
    sNumberFrom := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity*isets));
  end;
end;

function TPBRPLabelsFrm.GetCustomerName(iCust: integer): string;
begin
  with CustSQL do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TPBRPLabelsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  sTempDelimiter: String;
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
  {Get the company address regardless of whether it's the delivery address because} ;
  {it's printed on each PMS format label} ;
          with CompSQL do
          begin
            Close;
            Open;
          end;

  AddressMemo.Lines.Clear;
  UseBrnchNm := False;

  if (self.useCustAddress) then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        PODelivSQL.FieldByName('iCustomer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        PODelivSQL.FieldByName('Branch_No').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else if PODelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        PODelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        PODelivSQL.FieldByName('Branch_no0').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
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
    end
  else
    if PODelivSQL.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            PODelivSQL.FieldByName('Rep').AsInteger;
          Open;
        end;
        AddressSRC.Dataset := RepSQL;
      end
    else
      if PODelivSQL.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              PODelivSQL.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              PODelivSQL.FieldByName('Branch_no').AsInteger;
            Open;
          end;
          AddressSRC.Dataset := SupplierSQL;
        end
        else
        begin
          AddressSRC.Dataset := CompSQL;
        end;
  {Build the Address Memo field EXCEPT the postcode} ;
  for irow := 1 to 4 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  {Add the postcode details to the end of the last line} ;
  AddressMemo.Lines[AddressMemo.Lines.Count-1] := trim(AddressMemo.Lines[AddressMemo.Lines.Count-1]) + '  ' +
        AddressSRC.DataSet.FieldByName('PostCode').AsString ;

  Result := PODelivSQL.RecordCount;
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
  Result := PODelivSQL.RecordCount;
  if not UseBrnchNm then
    lblCustomer.Caption := AddressSRC.dataset.Fields[0].AsString
  else
     lblCustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
//  lblCustomer.caption := AddressSRC.dataset.Fields[0].AsString;
  {Get the FOA} ;
  if PODelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    With GetFAOSQL do
        begin
        Close ;
        ParamByName('Customer').AsInteger := PODelivSQL.FieldByName('iCustomer').AsInteger ;
        ParamByName('Branch_No').AsInteger := PODelivSQL.FieldByName('Branch_No').AsInteger ;
        ParamByName('Contact_No').AsInteger := PODelivSQL.FieldByName('Contact_No').AsInteger ;
        Open ;
        First ;
        FAOQRLabel.Caption := FieldByName('Name').AsString ;
        end;
    end
  else
      begin
        FAOQRLabel.Caption := '';
        QRLabel3.Caption  := '';
    end;
  {can only get ftao if is deliv to customer} ;
end;

procedure TPBRPLabelsFrm.PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with PBLabelsQuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;
end;

procedure TPBRPLabelsFrm.SetCaptions;
begin
  DescrQRLabel.enabled := not bAddressOnly;
  QRLabel3.enabled := not bAddressOnly;
  QRLabel5.enabled := not bAddressOnly;
  QRLabel7.enabled := not bAddressOnly;
end;

procedure TPBRPLabelsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
