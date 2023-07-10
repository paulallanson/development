unit PBRPLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint, PBPOObjects, qrprntr, printers, gtQRExport, gtQrCtrls;

type
  TPBRPLabelsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    PODelivSQL: TQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    CustomerSQL: TQuery;
    AdhocSQL: TQuery;
    RepSQL: TQuery;
    SupplierSQL: TQuery;
    AddressSRC: TDataSource;
    CompSQL: TQuery;
    FormRefLbl: TQRLabel;
    QRLabel1: TQRLabel;
    AddressMemo: TQRMemo;
    lblCustomer: TQRLabel;
    CustSQL: TQuery;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    CompNameQRLabel: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    DeliveryDateLbl: TQRLabel;
    GetFAOSQL: TQuery;
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
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  public
    Preview: ByteBool;
    rPONumber: real;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    UseCustAddress: boolean; 
    bLineup: boolean;
    bStocked: string;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  PBRPLabelsFrm: TPBRPLabelsFrm;

implementation

uses PBImages, CCSCommon, pbDatabase;

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

  if PODelivSQL.FieldByName('Customer').AsString <> '' then
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

function TPBRPLabelsFrm.PrintToFile(PONo: real; POLine, DelLine: integer;
  attachmentType: string): TStringList;
var
  fileName, fileLocation: string;
  AFilters: TGtQRFilters;
  RTFFilter: TGtQRRTFFilter;
  HTMLFilter: TGtQRHTMLFilter;
  PDFFilter: TGtQRPDFFilter;
  BMPFilter: TGtQRBMPFilter;
  GIFFilter: TGtQRGIFFilter;
  JPEGFilter: TGtQRJPEGFilter;
  icount: integer;
begin
  iIntSel := dmBroker.GetNextIntSelCode(self);
  try
    for icount := 1 to 8 do
      dmBroker.AddWithKey(iIntSel, iCount, PONo, POLine, DelLine, '', '');

    Result := TStringList.Create;
    self.rPONumber := PONo;
    self.iLine := POLine;

    self.bLineup := false;
    self.Preview := false;
    if self.GetDetails(self) = 0 then
      exit;

    self.useCustAddress := false;
    PBLabelsQuickReport.Prepare;

    fileLocation := GetWinTempDir;
    fileName := fileLocation + 'LABEL' + FloatToStr(PONo)+ '_' + IntToStr(DelLine) + '.' + attachmentType;

    AFilters := TGtQRFilters.Create(self);
    try
      if AnsiLowerCase(attachmentType) = 'pdf' then
      begin
        PDFFilter := TGtQRPDFFilter.Create(fileName);
        try
          PBLabelsQuickReport.ExportToFilter(PDFFilter);
          Result.add(fileName);
        finally
          PBLabelsQuickReport.QRPrinter.Free;
          PBLabelsQuickReport.QRPrinter := nil;
          PDFFilter.Free;
        end;
      end
      else if AnsiLowerCase(attachmentType) = 'rtf' then
      begin
        RTFFilter := TGtQRRTFFilter.Create(fileName);
        try
          PBLabelsQuickReport.ExportToFilter(RTFFilter);
          Result.add(fileName);
        finally
          PBLabelsQuickReport.QRPrinter.Free;
          PBLabelsQuickReport.QRPrinter := nil;
          RTFFilter.Free;
        end;
      end
      else if AnsiLowerCase(attachmentType) = 'gif' then
      begin
        GIFFilter := TGtQRGIFFilter.Create(fileName);
        try
          PBLabelsQuickReport.Prepare;
          PBLabelsQuickReport.ExportToFilter(GIFFilter);

          //Assign all the Filenames to the Attachment list
          for icount := 0 to pred(AFilters.RepFileCount) do
            Result.add(fileLocation + AFilters.RepFileNames[icount]);
        finally
          PBLabelsQuickReport.QRPrinter.Free;
          PBLabelsQuickReport.QRPrinter := nil;
          GIFFilter.Free;
        end;
      end
      else if AnsiLowerCase(attachmentType) = 'bmp' then
      begin
        BMPFilter := TGtQRBMPFilter.Create(fileName);
        try
          PBLabelsQuickReport.Prepare;
          PBLabelsQuickReport.ExportToFilter(BMPFilter);

          //Assign all the Filenames to the Attachment list
          for icount := 0 to pred(AFilters.RepFileCount) do
            Result.add(fileLocation + AFilters.RepFileNames[icount]);
        finally
          PBLabelsQuickReport.QRPrinter.Free;
          PBLabelsQuickReport.QRPrinter := nil;
          BMPFilter.Free;
        end;
      end
      else if AnsiLowerCase(attachmentType) = 'html' then
      begin
        HTMLFilter := TGtQRHTMLFilter.Create(fileName);
        try
          PBLabelsQuickReport.Prepare;
          PBLabelsQuickReport.ExportToFilter(HTMLFilter);

          //Assign all the Filenames to the Attachment list
          for icount := 0 to pred(AFilters.RepFileCount) do
            Result.add(fileLocation + AFilters.RepFileNames[icount]);
        finally
          PBLabelsQuickReport.QRPrinter.Free;
          PBLabelsQuickReport.QRPrinter := nil;
          HTMLFilter.Free;
        end;
      end
      else if AnsiLowerCase(attachmentType) = 'jpeg' then
      begin
        JPEGFilter := TGtQRJPEGFilter.Create(fileName);
        try
          PBLabelsQuickReport.Prepare;
          PBLabelsQuickReport.ExportToFilter(JPEGFilter);

          //Assign all the Filenames to the Attachment list
          for icount := 0 to pred(AFilters.RepFileCount) do
            Result.add(fileLocation + AFilters.RepFileNames[icount]);
        finally
          PBLabelsQuickReport.QRPrinter.Free;
          PBLabelsQuickReport.QRPrinter := nil;
          JPEGFilter.Free;
        end;
      end;
    finally
      AFilters.free;
    end;
  finally
    dmBroker.DeleteRecord(iIntSel);
  end;
end;

end.
