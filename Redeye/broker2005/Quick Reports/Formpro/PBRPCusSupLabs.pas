(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------                                                                          
  Labels Form.

VSS Info:
$Header: /PBL D5/Quick Reports/Formpro/PBRPCusSupLabs.pas 3     16/09/03 16:20 Paul $
$History: PBRPCusSupLabs.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 16/09/03   Time: 16:20
 * Updated in $/PBL D5/Quick Reports/Formpro
 * Changed to print company telephone numbers
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 10/06/:3   Time: 13:56
 * Updated in $/PBL D5/Quick Reports/Formpro
 * Make site specific
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 10/06/:3   Time: 12:34
 * Created in $/PBL D5/Quick Reports/Formpro
 * Customer supplier labels
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 20/05/:3   Time: 11:08
 * Created in $/PBL D5/Quick Reports/BroadSword
 * Make labels site specific.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 19/05/:3   Time: 12:03
 * Updated in $/PBL D5
 * Changed to recognise the Output Bin
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 26/03/:3   Time: 11:29
 * Updated in $/PBL D5
 * Make supp and cust sql's compatable with access sites.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 9/01/03    Time: 10:27
 * Updated in $/PBL D5
 * Not printing last line of address and postcode. Now fixed.
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 8/01/03    Time: 12:02
 * Created in $/PBL D5
 * New Customer / Supplier labels print.
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
unit PBRPCusSupLabs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint, PBPOObjects;

type
  TPBRPCusSupLabsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    GetDetsSQL: TQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    CustomerSQL: TQuery;
    AddressSRC: TDataSource;
    CompSQL: TQuery;
    AddressMemo: TQRMemo;
    lblCustomer: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    FAOQRLabel: TQRLabel;
    SupplierSQL: TQuery;
    qrmCompany: TQRMemo;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure SetbAddressOnly(const Value: boolean);
  private
    FbAddressOnly: boolean;
  public
    Preview, bCustomer: ByteBool;
    iIntSel: Integer;
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPCusSupLabsFrm: TPBRPCusSupLabsFrm;

implementation

{$R *.DFM}

procedure TPBRPCusSupLabsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo: string;
begin
  if (blineup) then Exit;

  lblCustomer.caption := AddressSRC.Dataset.fieldbyname('Name').AsString;
end;

function TPBRPCusSupLabsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  sTempDelimiter: String;
begin
  {Activate the main report SQL} ;
  {Note that all this SQL does is provide a number of records depending on the number} ;
  {of copies of the label required} ;
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;
  {Get the company address regardless of whether it's the delivery address because} ;
  {it's printed on each PMS format label} ;
          with CompSQL do
          begin
            Close;
            Open;
          end;

  AddressMemo.Lines.Clear;
  If bCustomer then
    begin
    {Printing CUSTOMERS} ;
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := GetDetsSQL.FieldByName('Sel2').AsInteger;
      ParamByName('Branch_no').AsInteger := GetDetsSQL.FieldByName('Sel3').AsInteger;
      ParamByName('Contact_no').AsInteger := GetDetsSQL.FieldByName('Sel4').AsInteger;
      Open;
    end;
    AddressSRC.Dataset := CustomerSQL;
    end
  else
    begin
    {Printing SUPPLIERS} ;
    with SupplierSQl do
    begin
      Close;
      ParamByName('Supplier').AsInteger := GetDetsSQL.FieldByName('Sel2').AsInteger;
      ParamByName('Branch_no').AsInteger := GetDetsSQL.FieldByName('Sel3').AsInteger;
      ParamByName('Contact_no').AsInteger := GetDetsSQL.FieldByName('Sel4').AsInteger;
      Open;
    end;
    AddressSRC.Dataset := SupplierSQl;
    end;
  {Build the Address Memo field EXCEPT the postcode} ;
  for irow := 1 to 4 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  {Add the postcode details to the end of the last line} ;
  AddressMemo.Lines[AddressMemo.Lines.Count-1] := AddressMemo.Lines[AddressMemo.Lines.Count-1] + '  ' +
        AddressSRC.DataSet.FieldByName('PostCode').AsString ;
  
  Result := GetDetsSQL.RecordCount;
  {Build the Company Memo field}
 // CompNameQRLabel.caption := UpperCase(Trim(CompSQL.fieldbyname('Company_Name').asstring));
 // CompAddrQRLabel.caption := '' ;
  {add in all the address details EXCEPT the postcode} ;
  qrmCompany.lines.Clear;
  for irow := 1 to 5 do
    begin
    {No comma or space before 1st detail, comma and space after others, just a space} ;
    {before postcode} ;
//    Case iRow of
//        1:      sTempDelimiter := '' ;
//        2..4:   sTempDelimiter := ', ' ;
//        5:      sTempDelimiter := ' ' ;
//        end;
    if Trim(CompSQL.Fields[irow].AsString) = '' then continue;
    qrmCompany.Lines.Add(Trim(CompSQL.Fields[irow].AsString));
    end;
  {Finally, add the phone number} ;
  qrmCompany.Lines.Add('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
// Result := GetDetsSQL.RecordCount;
  {Get the FOA} ;
   if GetDetsSQL.FieldByName('Sel4').AsInteger = 0 then
    FAOQRLabel.Caption := ''
   else
    FAOQRLabel.Caption := AddressSRC.Dataset.FieldByName('Contact_Name').AsString ;
//  FAOCapQRLabel.Enabled := (Trim(FAOQRLabel.Caption) <> '') ;
end;

procedure TPBRPCusSupLabsFrm.PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
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

procedure TPBRPCusSupLabsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
