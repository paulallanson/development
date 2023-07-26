unit PBRPLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint, PBPOObjects, qrprntr, printers, QrExport;

type
  TPBRPLabelsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    PODelivSQL: TQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    PONumberLbl: TQRLabel;
    AddressMemo: TQRMemo;
    QRDBCustOrderRef: TQRDBText;
    CustomerSQL: TQuery;
    AdhocSQL: TQuery;
    RepSQL: TQuery;
    SupplierSQL: TQuery;
    AddressSRC: TDataSource;
    YourRefLbl: TQRLabel;
    FormRefLbl: TQRLabel;
    DescLbl: TQRLabel;
    CompSQL: TQuery;
    lblDeliveryNo: TQRLabel;
    DeliveryName: TQRLabel;
    shape1: TQRShape;
    FromLbl: TQRLabel;
    BoxNo: TQRDBText;
    lblBoxNo: TQRLabel;
    NumberedLbl: TQRLabel;
    BoxQtyCaptionlbl: TQRLabel;
    BoxQuantityLbl: TQRLabel;
    Memodescription: TQRMemo;
    FormRefDescLbl: TQRLabel;
    lblDate: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    lblCustOrderRef: TQRLabel;
    lblDeliverTo: TQRLabel;
    imgLogo: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  private
    FbAddressOnly: boolean;
    procedure SetbAddressOnly(const Value: boolean);
    procedure SetCaptions;
  public
    useCustAddress: ByteBool;
    Preview: ByteBool;
    rPONumber: real;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    LogoPath: string;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    bStocked: string;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  PBRPLabelsFrm: TPBRPLabelsFrm;

implementation

uses
  CCSCommon, pbDatabase, Printer.Tools;

{$R *.DFM}

procedure TPBRPLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo: string;
begin
  if (blineup) then Exit;
  YourRefLbl.Enabled := False;
  DescLbl.Enabled := False;

  SetCaptions;
  if bAddressOnly then exit;

  PONumberLbl.Caption := PODelivSQL.FieldByName('Purchase_Order').AsString + '/'
    + PODelivSQL.FieldByName('Line').AsString;

  FormRefLbl.Caption := PODelivSQL.FieldByName('Form_Reference_id').AsString;
  FormRefDescLbl.Caption := PODelivSQL.FieldByName('Form_Reference_Descr').AsString;

  if iBoxQuantity <= 0 then
    begin
      BoxQtyCaptionLbl.enabled := false;
      BoxQuantityLbl.enabled := false;
    end
  else
    begin
      BoxQtyCaptionLbl.enabled := true;
      BoxQuantityLbl.enabled := true;
      BoxQuantityLbl.Caption := IntToStr(iBoxQuantity);
    end;

  MemoDescription.lines.clear;
  MemoDescription.lines.add(PODelivSQL.Fieldbyname('Customers_Desc').asstring);

  if Trim(sNumberFrom) <> '' then
  begin
    NumberedLbl.Enabled := true;
    FromLbl.Enabled := true;
    sFrom := Trim(sPrefix) + Trim(sNumberFrom);
    sNumberTo := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity*iSets) - 1);
    sTo := Trim(sPrefix) + Trim(sNumberTo);
    FromLbl.Caption := sFrom + ' - ' + sTo;
    sNumberFrom := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity*isets));
  end
  else
  begin
    NumberedLbl.Enabled := false;
    FromLbl.Enabled := false;
  end

end;

function TPBRPLabelsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: Integer;
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
          with CompSQL do
          begin
            Close;
            Open;
          end;
          AddressSRC.Dataset := CompSQL;
        end;

  {Build the Address Memo field}
  if not UseBrnchNm then
    DeliveryName.Caption := AddressSRC.dataset.Fields[0].AsString
  else
    DeliveryName.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
  for irow := 1 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  Result := PODelivSQL.RecordCount;
end;

procedure TPBRPLabelsFrm.SetCaptions;
begin
  lblCustOrderRef.enabled := not bAddressOnly;
  QRDBCustOrderRef.enabled := not bAddressOnly;
  lblDeliveryNo.enabled := not bAddressOnly;
  PONumberLbl.enabled := not bAddressOnly;
  Shape1.enabled := not bAddressOnly;
  MemoDescription.enabled := not bAddressOnly;
  FormReflbl.enabled := not bAddressOnly;
  FormRefDescLbl.enabled := not bAddressOnly;
  Numberedlbl.enabled := not bAddressOnly;
  FromLbl.enabled := not bAddressOnly;
  lblBoxNo.enabled := not bAddressOnly;
  BoxNo.enabled := not bAddressOnly;
  BoxQtyCaptionLbl.enabled := not bAddressOnly;
  BoxQuantityLbl.enabled := not bAddressOnly;
end;

procedure TPBRPLabelsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

procedure TPBRPLabelsFrm.PBLabelsQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  irow: integer;
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
(*  with PBLabelsQuickReport.PrinterSettings do
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
*)
  PBLabelsQuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  PBLabelsQuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  PBLabelsQuickReport.PrinterSettings.Copies := Copies;   {set the copies }

  try
    imgLogo.Picture.LoadFromFile(LogoPath);
  except
    imgLogo.Picture.LoadFromFile('');
  end;

end;

function TPBRPLabelsFrm.PrintToFile(PONo: real; POLine, DelLine: integer; attachmentType: string): TStringList;
begin
  PrinterTools.New.PrintToFileLabel(PBLabelsQuickReport, Result, PONo, POLine, DelLine, attachmentType);
end;

(* GDK ToDo: remove after tests
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
    for icount := 1 to 1 do
      dmBroker.AddWithKey(iIntSel, iCount, PONo, POLine, DelLine, '', '');

    Result := TStringList.Create;
    self.rPONumber := PONo;
    self.iLine := POLine;

    self.bLineup := false;
    self.Preview := false;
    if self.GetDetails(self) = 0 then
      exit;

    self.useCustAddress := false;
    with PBLabelsQuickReport.page do
      begin
       PaperSize := Custom;
       length := 105;
       width := 148.5;
       columns := 1;
     end;

    DeliveryDateLbl.caption := PBDateStr(PODelivSQL.fieldbyname('Date_Point').asdatetime);

    try
      iBoxQuantity := strtoint(PODelivSQL.fieldbyname('Forms_per_Box').asstring)
    except
      iBoxQuantity := 0
    end;

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
*)

end.
