(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Delivery Form.

VSS Info:
$Header: /PBL D5/Quick Reports/Formpro/PBRPDeliv.pas 2     3/06/:3 16:48 Paul $
$History: PBRPDeliv.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 3/06/:3    Time: 16:48
 * Updated in $/PBL D5/Quick Reports/Formpro
 * Changed to Formpro layout
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 28/02/:3   Time: 14:45
 * Updated in $/PBL D5/Quick Reports/Nexus
 * sets PrinterSettings.outputbin to user selected details 
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 24/01/:2   Time: 15:27
 * Updated in $/PBL D5/Quick Reports/Nexus
 * New routine to print out picking details on call off orders
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 8/01/:2    Time: 11:49
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Changes made to Nexus format
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 12/11/:1   Time: 16:32
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Changed to only print selected delivery note
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 30/10/:1   Time: 15:00
 * Created in $/PBL D5/Quick Reports/Nexus
 * Initial takeon of Nexus forms
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:00
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 19/03/:1   Time: 11:56
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed so that the Form Reference Description label is not displayed
 * if there is no description.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 6/12/:0    Time: 15:59
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to display the details in the Lucida Sans MT font, point 11
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 29/11/:0   Time: 17:13
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed delivery notes to print Form Reference
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 31/10/:0   Time: 12:12
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to pick up the Customer Branch delivery details and to print
 * the Supplier Address details.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 7/07/:0    Time: 14:28
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Now prints the Numbering details in nothing in the Delivery
 * Instructions
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 14/03/:0   Time: 16:54
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * New field Delivery_Instructions in Delivery_Detail.
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
 * *****************  Version 4  *****************
 * User: Roddym       Date: 20/01/:0   Time: 14:47
 * Updated in $/PBL D5
 * Fix bug, was only printing delivery notes for customer, now prints them
 * for customer and ad-hoc address (Rep, Supplier and Company do not have
 * Delivery_Narrative field).
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
unit PBRPDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, CCSPrint, PBPOObjects,
  gtQrCtrls, gtQrExport;

type
  TPBRPDelivFrm = class(TForm)
    PBDelivQuickReport: TQuickRep;
    PODelivSQL: TQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    PONumberLbl: TgtQRLabel;
    AddressMemo: TgtQRMemo;
    BoxesLbl: TgtQRLabel;
    CustomerSQL: TQuery;
    AdhocSQL: TQuery;
    RepSQL: TQuery;
    AddressSRC: TDataSource;
    SupplierSQL: TQuery;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    YourRefLbl: TgtQRLabel;
    DescLbl: TgtQRLabel;
    DateLbl: TgtQRLabel;
    QuantityLbl: TgtQRLabel;
    OrderRefLbl: TgtQRLabel;
    QtyOrderedLbl: TgtQRLabel;
    GetNarrSQL: TQuery;
    CompSQL: TQuery;
    Account: TgtQRDBText;
    CustDetsSQL: TQuery;
    Accountlbl: TgtQRLabel;
    DelInstructMemo: TgtQRMemo;
    FormRefLbl: TgtQRLabel;
    FormRefDescLbl: TgtQRLabel;
    DeliveryDateLbl: TgtQRLabel;
    QRLabel1: TgtQRLabel;
    lblDelNote: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRBand2: TQRSubDetail;
    QRLabel2: TgtQRLabel;
    QRShape1: TgtQRShape;
    GetPickDataSource: TDataSource;
    GetPickSQL: TQuery;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRBand3: TQRBand;
    QRLabel12: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRLabel15: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    QRShape4: TgtQRShape;
    QRMemoCmpnyNm: TgtQRMemo;
    lbldelInst: TgtQRLabel;
    DeliveryMemo: TgtQRMemo;
    GetPickCallOffSQL: TQuery;
    PsQRFilters1: TgtQRFilters;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure GetPickLocations(Sender: TObject);
    procedure PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FDeliveryDate: string;
    procedure BuildDeliveryNotes(aQuery : TQuery; const iNarrative : integer);
    procedure SetDeliveryDate(const Value: string);
  public
    PONo: real;
    POLine, DelLine: integer;
    OnlyMine, Preview: ByteBool;
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  end;

var
  PBRPDelivFrm: TPBRPDelivFrm;

implementation

uses pbMainMenu, PBPODataMod, CCSCommon;

{$R *.DFM}

procedure TPBRPDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sTemp : string;
  UseBrnchNm, UseFAO: boolean;
begin
  if blineup then Exit;
  DateLbl.Enabled := False;
  YourRefLbl.Enabled := False;
  OrderRefLbl.Enabled := False;
  QtyOrderedLbl.Enabled := False;
  QuantityLbl.Enabled := False;
  DescLbl.Enabled := False;
  AccountLbl.Enabled := False;
  UseBrnchNm := False;
  UseFAO := false;

  if DeliveryDate = '' then
    DeliveryDateLbl.Caption := PODelivSQL.FieldByName('Date_Point').AsString
  else
    DeliveryDateLbl.Caption := DeliveryDate;

  if PODelivSQL.FieldByName('No_of_Boxes').Asinteger = 0 then
    BoxesLbl.Caption := ''
  else
    BoxesLbl.Caption := PODelivSQL.FieldByName('No_of_Boxes').AsString;

  PONumberLbl.Caption := PODelivSQL.FieldByName('Purchase_Order').AsString + '/' +
    PODelivSQL.FieldByName('Line').AsString;

  AddressMemo.Lines.Clear;
  DeliveryMemo.Lines.Clear;

  if PODelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    if PODelivSQL.FieldByName('contact_name').asString <> '' then
    begin
      UseFAO := true;
    end;

    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        PODelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        PODelivSQL.FieldByName('Branch_no0').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
      BuildDeliveryNotes(CustomerSQL, FieldByName('Delivery_Narrative').AsInteger);
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
    if PODelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      if PODelivSQL.FieldByName('contact_name').asString <> '' then
      begin
        UseFAO := true;
      end;
        
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          PODelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        BuildDeliveryNotes(AdHocSQL,
          FieldByName('Delivery_Narrative').AsInteger);
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
          with CompSQL do
          begin
            Close;
            Open;
            BuildDeliveryNotes(CompSQL,
              FieldByName('Delivery_Narrative').AsInteger);
          end;
          AddressSRC.Dataset := CompSQL;
        end;
  { This may be a database not upgraded so take the exception }
  try
    sTemp := PODelivSQL.FieldByName('Delivery_Instructions').AsString
  except
    sTemp := '';  { Ignore missing data }
  end;

  if trim(DeliveryMemo.lines.Text) = '' then
    DeliveryMemo.lines.text := sTemp
  else
    DeliveryMemo.Lines.Text := DeliveryMemo.Lines.Text + cLFCR + sTemp;

  sTemp := PODelivSQl.FieldbyName('Number_Instructions').asstring;
    
  DelInstructMemo.Lines.Text := sTemp;

  {Build the Address Memo field}
  if UseFAO then
  begin
    AddressMemo.Lines.Add(Trim(PODelivSQL.FieldByName('contact_Name').AsString));
  end;

  if UseBrnchNm then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      AddressMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for irow := (0 + integer(UseBrnchNm)) to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;

  if trim(Deliverymemo.lines.text) = '' then
    lblDelInst.Enabled := false;

  {Display Form Reference}
  if trim(PODelivSQl.FieldbyName('Form_Reference_ID').asstring) <> '' then
    begin
      FormRefLbl.Caption := 'Form Ref: ' + PODelivSQl.FieldbyName('Form_Reference_ID').asstring;
      FormRefDescLbl.Caption := 'Description: ' + PODelivSQl.FieldbyName('Form_Reference_Descr').asstring;

      FormRefLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_ID').asstring <> '';
      FormRefDescLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_Descr').asstring <> '';
    end
  else
    begin
      FormRefLbl.Caption := '';
      FormRefDescLbl.Caption := '';
    end;
    GetPickLocations(Self);
  end;

function TPBRPDelivFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with PODelivSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PONo;
(*    if OnlyMine then
      ParamByName('Operator').AsInteger := PBMenuMainFrm.iOperator
    else
      ParamByName('Operator').AsInteger := 0;
*)
    ParamByName('Line').asinteger := POLine;
    ParamByName('Delivery_no').asinteger := DelLine;
    Open;
    Result := RecordCount;
    if Result > 0 then
      CustDetsSQL.Open;
  end;
end;

procedure TPBRPDelivFrm.PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with PBDelivQuickReport.PrinterSettings do
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

procedure TPBRPDelivFrm.BuildDeliveryNotes(aQuery: TQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    DeliveryMemo.Lines.Clear;
    DeliveryMemo.Lines.Text := aStr;
  end;
end;

procedure TPBRPDelivFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
end;

procedure TPBRPDelivFrm.GetPickLocations(Sender: TObject);
begin
  with GetPickCallOffSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat :=PODelivSQL.FieldByName('Original_Order').Asfloat;
      parambyname('Line').asinteger := PODelivSQL.FieldByName('Original_OrderLine').AsInteger;
      ParamByName('Delivery_no').Asinteger := PODelivSQL.FieldByName('Delivery_No').AsInteger;
      ParamByName('Calloff_order').Asfloat := PODelivSQL.FieldByName('Purchase_Order').Asfloat;
      ParamByName('Calloff_Line').Asinteger := PODelivSQL.FieldByName('Line').AsInteger;
      open;
      if recordcount > 0 then
        begin
          QRBand2.enabled := True;
          QRLabel2.Caption := 'Picking information for '+GetPickCallOffSQL.FieldByName('Stock_Location_Desc').AsString;
        end
      else
        begin
          QRBand2.enabled := False;
          QRLabel2.Caption := '';
        end;
        end;
end;

procedure TPBRPDelivFrm.FormCreate(Sender: TObject);
var
icount: integer;
begin
  CompSQL.close;
  CompSQL.open;
  with QRMemoCmpnyNm do
  begin
    Lines.Clear;
    for icount := 1 to 5 do
    begin
      if Trim(CompSQL.Fields[icount].AsString) <> '' then
      Lines.Append(Trim(CompSQL.Fields[icount].AsString)) ;
    end;
  {Finally, add the phone number} ;
    Lines.Append(' ');
   Lines.Append('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
    Lines.Append('Fax: ' + Trim(CompSQL.FieldByName('Fax_Number').AsString));
    Lines.Append('Email: ' + Trim(CompSQL.FieldByName('Email').AsString));
    end;
end;

procedure TPBRPDelivFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel13.Caption := GetPickCallOffSQL.FieldByName('Description').AsString;
QRLabel14.Caption := formatfloat('####',GetPickCallOffSql.fieldByName('quantity_Picked').asfloat);
end;

function TPBRPDelivFrm.PrintToFile(PONo: real; POLine, DelLine: integer;
  attachmentType: string): TStringList;
var
  fileName, fileLocation: string;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
  i: integer;
begin
  Result := TStringList.Create;
  self.PONo := PONo;
  self.POLine := POLine;
  self.DelLine := DelLine;

  self.bLineup := false;
  self.Preview := false;
  if self.GetDetails(self) = 0 then
    exit;
    
  PBDelivQuickReport.Prepare;

  fileLocation := GetWinTempDir;
  fileName := fileLocation + 'DEL' + FloatToStr(PONo)+ '_' + IntToStr(DelLine) + '.' + attachmentType;

  AFilters := TgtQRFilters.Create(self);
  if AnsiLowerCase(attachmentType) = 'pdf' then
  begin
    PDFFilter := TgtQRPDFFilter.Create(fileName);
    try
      PBDelivQuickReport.ExportToFilter(PDFFilter);
      Result.add(fileName);
    finally
      PBDelivQuickReport.QRPrinter.Free;
      PBDelivQuickReport.QRPrinter := nil;
      PDFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'rtf' then
  begin
    RTFFilter := TgtQRRTFFilter.Create(fileName);
    try
      PBDelivQuickReport.ExportToFilter(RTFFilter);
      Result.add(fileName);
    finally
      PBDelivQuickReport.QRPrinter.Free;
      PBDelivQuickReport.QRPrinter := nil;
      RTFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'gif' then
  begin
    GIFFilter := TgtQRGIFFilter.Create(fileName);
    try
      PBDelivQuickReport.Prepare;
      PBDelivQuickReport.ExportToFilter(GIFFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      PBDelivQuickReport.QRPrinter.Free;
      PBDelivQuickReport.QRPrinter := nil;
      GIFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'bmp' then
  begin
    BMPFilter := TgtQRBMPFilter.Create(fileName);
    try
      PBDelivQuickReport.Prepare;
      PBDelivQuickReport.ExportToFilter(BMPFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      PBDelivQuickReport.QRPrinter.Free;
      PBDelivQuickReport.QRPrinter := nil;
      BMPFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'html' then
  begin
    HTMLFilter := TgtQRHTMLFilter.Create(fileName);
    try
      PBDelivQuickReport.Prepare;
      PBDelivQuickReport.ExportToFilter(HTMLFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      PBDelivQuickReport.QRPrinter.Free;
      PBDelivQuickReport.QRPrinter := nil;
      HTMLFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'jpeg' then
  begin
    JPEGFilter := TgtQRJPEGFilter.Create(fileName);
    try
      PBDelivQuickReport.Prepare;
      PBDelivQuickReport.ExportToFilter(JPEGFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      PBDelivQuickReport.QRPrinter.Free;
      PBDelivQuickReport.QRPrinter := nil;
      JPEGFilter.Free;
    end;
  end;

  AFilters.free;
end;

end.
