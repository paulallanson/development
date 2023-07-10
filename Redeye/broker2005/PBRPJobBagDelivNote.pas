unit PBRPJobBagDelivNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, CCSPrint, PBPOObjects,
  gtQrCtrls, gtQrExport;

type
  TPBRPJobBagDelivNoteFrm = class(TForm)
    JBDelivQuickReport: TQuickRep;
    JBDelivSQL: TQuery;
    JBDelivSRC: TDataSource;
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
    DateLbl: TgtQRLabel;
    OrderRefLbl: TgtQRLabel;
    QtyOrderedLbl: TgtQRLabel;
    GetNarrSQL: TQuery;
    CompSQL: TQuery;
    Account: TgtQRDBText;
    CustDetsSQL: TQuery;
    Accountlbl: TgtQRLabel;
    DeliveryDateLbl: TgtQRLabel;
    QRLabel1: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    qrlblDeliveryNote: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    qrlblJobNo: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRBand3: TQRBand;
    QRLabel12: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRLabel15: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    QRShape4: TgtQRShape;
    gtQRFilters1: TgtQRFilters;
    gtQRLabel1: TgtQRLabel;
    qrlblContact: TgtQRDBText;
    lbldelInst: TgtQRLabel;
    DeliveryMemo: TgtQRMemo;
    qrbCourier: TQRChildBand;
    qryCourierService: TQuery;
    qryPackageType: TQuery;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel4: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRLabel7: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRShape4: TgtQRShape;
    gtQRLabel10: TgtQRLabel;
    gtQRShape5: TgtQRShape;
    gtQRLabel11: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRLabel12: TgtQRLabel;
    gtQRLabel13: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    gtQRShape9: TgtQRShape;
    qrlblWeight: TgtQRLabel;
    lblDelNote: TgtQRLabel;
    QRMemoCmpnyNm: TgtQRMemo;
    qrlblVatNo: TgtQRMemo;
    ReportImage: TgtQRImage;
    qryGetFSCClaim: TQuery;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure JBDelivQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrbCourierBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FDeliveryDate: string;
    procedure BuildDeliveryNotes(aQuery : TQuery; const iNarrative : integer);
    procedure SetDeliveryDate(const Value: string);
  public
    bPrintLogo: boolean;
    JobBag: integer;
    DelLine: integer;
    OnlyMine, Preview: ByteBool;
    PrinterSettings : TPrinterSettings;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  end;

var
  PBRPJobBagDelivNoteFrm: TPBRPJobBagDelivNoteFrm;

implementation

uses pbMainMenu, PBPODataMod, CCSCommon, PBImages;

{$R *.DFM}

procedure TPBRPJobBagDelivNoteFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sTemp, sFSCClaim: string;
  UseBrnchNm, UseFAO: boolean;
begin
  DateLbl.Enabled := False;
  YourRefLbl.Enabled := False;
  OrderRefLbl.Enabled := False;
  QtyOrderedLbl.Enabled := False;
  AccountLbl.Enabled := False;
  UseBrnchNm := False;
  UseFAO := false;

  if DeliveryDate = '' then
    DeliveryDateLbl.Caption := JBDelivSQL.FieldByName('Date_Point').AsString
  else
    DeliveryDateLbl.Caption := DeliveryDate;

  if JBDelivSQL.FieldByName('No_of_Boxes').Asinteger = 0 then
    BoxesLbl.Caption := ''
  else
    BoxesLbl.Caption := JBDelivSQL.FieldByName('No_of_Boxes').AsString;

  if JBDelivSQL.FieldByName('Job_Bag').Asinteger <> 0 then
    begin
      PONumberLbl.Caption := JBDelivSQL.FieldByName('Job_Bag').AsString
    end
  else
    begin
      PONumberLbl.Caption := JBDelivSQL.FieldByName('Purchase_Order').AsString;
    end;

  if (JBDelivSQL.FieldByName('Courier').Asinteger <> 0) then
    begin
      qrbcourier.enabled := true;
    end
  else
    begin
      qrbcourier.enabled := false;
    end;

  AddressMemo.Lines.Clear;
  DeliveryMemo.Lines.Clear;

  if JBDelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    if JBDelivSQL.FieldByName('contact_name').asString <> '' then
    begin
      UseFAO := true;
    end;

    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        JBDelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        JBDelivSQL.FieldByName('Branch_no').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
      BuildDeliveryNotes(CustomerSQL, FieldByName('Delivery_Narrative').AsInteger);
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
    if JBDelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      if JBDelivSQL.FieldByName('contact_name').asString <> '' then
      begin
        UseFAO := true;
      end;
        
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          JBDelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        BuildDeliveryNotes(AdHocSQL,
          FieldByName('Delivery_Narrative').AsInteger);
      end;
      AddressSRC.Dataset := AdhocSQL;
    end
    else
      if JBDelivSQL.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            JBDelivSQL.FieldByName('Rep').AsInteger;
          Open;
        end;
        AddressSRC.Dataset := RepSQL;
      end
      else
        if JBDelivSQL.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              JBDelivSQL.FieldByName('Supplier').AsInteger;
            ParamByName('Supplier_Branch_').AsInteger :=
              JBDelivSQL.FieldByName('Supplier_Branch').AsInteger;
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
    sTemp := JBDelivSQL.FieldByName('Delivery_Instructions').AsString
  except
    sTemp := '';  { Ignore missing data }
  end;

  if trim(DeliveryMemo.lines.Text) = '' then
    DeliveryMemo.lines.text := sTemp
  else
    DeliveryMemo.Lines.Text := DeliveryMemo.Lines.Text + cLFCR + sTemp;

  {Build the Address Memo field}
  if UseFAO then
  begin
    AddressMemo.Lines.Add(Trim(JBDelivSQL.FieldByName('contact_Name').AsString));
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

end;

function TPBRPJobBagDelivNoteFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with JBDelivSQL do
  begin
    Close;
    ParamByName('Job_Bag').asinteger := JobBag;
    ParamByName('Delivery_no').asinteger := DelLine;
    Open;
    Result := RecordCount;
    if Result > 0 then
      CustDetsSQL.Open;

    if fieldbyname('Courier').asinteger <> 0 then
      begin
      with qryCourierService do
        begin
          close;
          parambyname('Courier').asinteger := JBDelivSQL.FieldByName('Courier').Asinteger;
          parambyname('Service_no').asinteger := JBDelivSQL.FieldByName('Service_no').Asinteger;
          open;
        end;

      with qryPackageType do
        begin
          close;
          parambyname('Package_Type').asinteger := JBDelivSQL.FieldByName('Package_Type').Asinteger;
          open;
        end;
      end;
  end;
end;

procedure TPBRPJobBagDelivNoteFrm.JBDelivQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with JBDelivQuickReport.PrinterSettings do
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

  if bPrintLogo then
  begin
    ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
    ReportImage.Enabled := true;
    qrMemoCmpnyNm.Enabled := true;
    qrlblVatNo.Enabled := true;
  end
  else
  begin
    ReportImage.Enabled := false;
    qrMemoCmpnyNm.Enabled := false;
    qrlblVatNo.Enabled := false;
  end
end;

procedure TPBRPJobBagDelivNoteFrm.BuildDeliveryNotes(aQuery: TQuery;
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

procedure TPBRPJobBagDelivNoteFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
end;

procedure TPBRPJobBagDelivNoteFrm.FormCreate(Sender: TObject);
var
  irow: integer;
  sAddress: string;
begin
  CompSQL.close;
  CompSQL.open;
  with QRMemoCmpnyNm do
  begin
    sAddress := '';
    Lines.Clear;
    for irow := 1 to 5 do
      begin
        if Trim(CompSQL.Fields[irow].AsString) <> '' then
          sAddress := sAddress + Trim(CompSQL.Fields[irow].AsString) + ' ';
      end;
    Lines.Append(Trim(sAddress)) ;
    {Finally, add the phone number} ;
    Lines.Append('T ' + Trim(CompSQL.FieldByName('Phone').AsString) + ' F ' + Trim(CompSQL.FieldByName('Fax_Number').AsString));
    Lines.Append('www.latchamdirect.co.uk');
  end;
end;

function TPBRPJobBagDelivNoteFrm.PrintToFile(PONo: real; POLine, DelLine: integer;
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
  self.JobBag:= JobBag;
  self.DelLine := DelLine;

  self.Preview := false;
  if self.GetDetails(self) = 0 then
    exit;

  JBDelivQuickReport.Prepare;

  fileLocation := GetWinTempDir;
  fileName := fileLocation + 'DEL' + FloatToStr(PONo)+ '_' + IntToStr(DelLine) + '.' + attachmentType;

  AFilters := TgtQRFilters.Create(self);
  if AnsiLowerCase(attachmentType) = 'pdf' then
  begin
    PDFFilter := TgtQRPDFFilter.Create(fileName);
    try
      JBDelivQuickReport.ExportToFilter(PDFFilter);
      Result.add(fileName);
    finally
      JBDelivQuickReport.QRPrinter.Free;
      JBDelivQuickReport.QRPrinter := nil;
      PDFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'rtf' then
  begin
    RTFFilter := TgtQRRTFFilter.Create(fileName);
    try
      JBDelivQuickReport.ExportToFilter(RTFFilter);
      Result.add(fileName);
    finally
      JBDelivQuickReport.QRPrinter.Free;
      JBDelivQuickReport.QRPrinter := nil;
      RTFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'gif' then
  begin
    GIFFilter := TgtQRGIFFilter.Create(fileName);
    try
      JBDelivQuickReport.Prepare;
      JBDelivQuickReport.ExportToFilter(GIFFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      JBDelivQuickReport.QRPrinter.Free;
      JBDelivQuickReport.QRPrinter := nil;
      GIFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'bmp' then
  begin
    BMPFilter := TgtQRBMPFilter.Create(fileName);
    try
      JBDelivQuickReport.Prepare;
      JBDelivQuickReport.ExportToFilter(BMPFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      JBDelivQuickReport.QRPrinter.Free;
      JBDelivQuickReport.QRPrinter := nil;
      BMPFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'html' then
  begin
    HTMLFilter := TgtQRHTMLFilter.Create(fileName);
    try
      JBDelivQuickReport.Prepare;
      JBDelivQuickReport.ExportToFilter(HTMLFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      JBDelivQuickReport.QRPrinter.Free;
      JBDelivQuickReport.QRPrinter := nil;
      HTMLFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'jpeg' then
  begin
    JPEGFilter := TgtQRJPEGFilter.Create(fileName);
    try
      JBDelivQuickReport.Prepare;
      JBDelivQuickReport.ExportToFilter(JPEGFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      JBDelivQuickReport.QRPrinter.Free;
      JBDelivQuickReport.QRPrinter := nil;
      JPEGFilter.Free;
    end;
  end;

  AFilters.free;
end;

procedure TPBRPJobBagDelivNoteFrm.qrbCourierBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblWeight.Caption := formatfloat('#,##0.000',(JBDelivSQL.fieldbyname('Delivery_Weight_Kilos').asinteger/1000));
end;

end.
