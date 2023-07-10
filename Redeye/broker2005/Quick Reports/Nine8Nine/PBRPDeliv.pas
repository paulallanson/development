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
    DateLbl: TgtQRLabel;
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
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    qrlblDeliveryNote: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    qrlblJobNo: TgtQRLabel;
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
    GetPickCallOffSQL: TQuery;
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
    gtlblFSCClaim: TgtQRLabel;
    qryGetFSCClaim: TQuery;
    ReportImage: TgtQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure GetPickLocations(Sender: TObject);
    procedure PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCourierBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FDeliveryDate: string;
    procedure BuildDeliveryNotes(aQuery : TQuery; const iNarrative : integer);
    procedure SetDeliveryDate(const Value: string);
  public
    bPrintLogo: boolean;
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

uses pbMainMenu, PBPODataMod, CCSCommon, PBImages;

{$R *.DFM}

procedure TPBRPDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sTemp, sFSCClaim: string;
  UseBrnchNm, UseFAO: boolean;
begin
  if blineup then Exit;
  DateLbl.Enabled := False;
  YourRefLbl.Enabled := False;
  OrderRefLbl.Enabled := False;
  QtyOrderedLbl.Enabled := False;
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

  if PODelivSQL.FieldByName('Job_Bag').Asinteger <> 0 then
    begin
      PONumberLbl.Caption := PODelivSQL.FieldByName('Job_Bag').AsString
    end
  else
    begin
      PONumberLbl.Caption := PODelivSQL.FieldByName('Purchase_Order').AsString;
    end;

  if (PODelivSQL.FieldByName('Courier').Asinteger <> 0) then
    begin
      qrbcourier.enabled := true;
      lbldelNote.caption := 'Transport Requisition';
      qrlblDeliveryNote.Caption := 'Purchase Order';
    end
  else
    begin
      qrbcourier.enabled := false;
      lblDelNote.caption := 'Delivery Note';
      qrlblDeliveryNote.Caption := 'Delivery Note No.';
    end;

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

  {Display FSC Claim}
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
              gtlblFSCClaim.Caption := '';
            end;
        end;
    end;

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

    if fieldbyname('Courier').asinteger <> 0 then
      begin
      with qryCourierService do
        begin
          close;
          parambyname('Courier').asinteger := PODelivSQL.FieldByName('Courier').Asinteger;
          parambyname('Service_no').asinteger := PODelivSQL.FieldByName('Service_no').Asinteger;
          open;
        end;

      with qryPackageType do
        begin
          close;
          parambyname('Package_Type').asinteger := PODelivSQL.FieldByName('Package_Type').Asinteger;
          open;
        end;
      end;
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
    Lines.Append('www.nine8nine.co.uk');
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

procedure TPBRPDelivFrm.qrbCourierBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblWeight.Caption := formatfloat('#,##0.000',(PODelivSQL.fieldbyname('Delivery_Weight_Kilos').asinteger/1000));
end;

end.
