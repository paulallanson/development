unit PBRPJobBagLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, Grids, DBGrids,
  CCSPrint, PBPOObjects, qrprntr, printers, QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPJobBagLabelsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    JBDelivSQL: TFDQuery;
    JBDelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    JBNumberLbl: TQRLabel;
    CustomerSQL: TFDQuery;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    AddressSRC: TDataSource;
    CompSQL: TFDQuery;
    BoxQuantityLbl: TQRLabel;
    Memodescription: TQRMemo;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    NumberedLbl: TQRLabel;
    FromLbl: TQRLabel;
    qrmCompany: TQRMemo;
    DeliveryDatelbl: TQRLabel;
    ReportImage: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  private
    FbAddressOnly: boolean;
    procedure SetbAddressOnly(const Value: boolean);
    procedure SetCaptions;
  public
    useCustAddress: ByteBool;
    Preview: ByteBool;
    JobBag: integer;
    iBoxQuantity: Integer;
    iIntSel: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    bStocked: string;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  PBRPJobBagLabelsFrm: TPBRPJobBagLabelsFrm;

implementation

uses
  PBImages, CCSCommon, pbDatabase, Printer.Tools;

{$R *.DFM}

procedure TPBRPJobBagLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo, sFSCClaim: string;
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;

  JBNumberLbl.Caption := JBDelivSQL.FieldByName('Job_Bag').AsString ;


  if iBoxQuantity <= 0 then
    begin
      BoxQuantityLbl.enabled := false;
    end
  else
    begin
      BoxQuantityLbl.enabled := true;
      BoxQuantityLbl.Caption := IntToStr(iBoxQuantity);
    end;

  MemoDescription.lines.clear;
  MemoDescription.lines.add(JBDelivSQL.Fieldbyname('Job_Bag_Descr').asstring);

  if Trim(sNumberFrom) <> '' then
  begin
    sFrom := Trim(sPrefix) + Trim(sNumberFrom);
    sNumberTo := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity) - 1);
    sTo := Trim(sPrefix) + Trim(sNumberTo);
    FromLbl.Caption := sFrom + ' - ' + sTo;
    sNumberFrom := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity));
  end
  else
  begin
    NumberedLbl.Enabled := false;
    FromLbl.Enabled := false;
  end;

end;

function TPBRPJobBagLabelsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  UseBrnchNm: ByteBool;
begin
  {Activate the main report SQL}
  with JBDelivSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;

//  AddressMemo.Lines.Clear;
  UseBrnchNm := False;
  if (self.useCustAddress) then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        JBDelivSQL.FieldByName('iCustomer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        JBDelivSQL.FieldByName('ordBranch').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else if (JBDelivSQL.FieldByName('Customer').AsString <> '') then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        JBDelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        JBDelivSQL.FieldByName('Branch_no').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
    if JBDelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          JBDelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
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
            ParamByName('Branch_no').AsInteger :=
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
          end;
          AddressSRC.Dataset := CompSQL;
        end;

  if not UseBrnchNm then
    lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString
  else
    lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
  Result := JBDelivSQL.RecordCount;
end;

procedure TPBRPJobBagLabelsFrm.PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  irow: integer;
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  PBLabelsQuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  PBLabelsQuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  PBLabelsQuickReport.PrinterSettings.Copies := Copies;   {set the copies }

  ReportImage.enabled := true;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

  {determine whether to show address or not}
  if bstocked = 'Y' then
    begin
      Numberedlbl.Enabled := True;
      fromLbl.Enabled := True;
    end;

  {Build the company address details}
  with CompSQL do
    begin
      qrmCompany.Lines.clear;
      Close;
      Open;
      for irow := 1 to 5 do
      begin
        if Fields[irow].AsString = '' then Continue;
          qrmCompany.Lines.Add(Trim(Fields[irow].AsString));
      end;
      {Finally, add the phone number} ;
      qrmCompany.Lines.Add('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
    end;

end;

procedure TPBRPJobBagLabelsFrm.SetCaptions;
begin
  JBNumberLbl.enabled := not bAddressOnly;
  MemoDescription.enabled := not bAddressOnly;
  BoxQuantityLbl.enabled := not bAddressOnly;
  QRLabel3.enabled := not bAddressOnly;
  QRLabel4.enabled := not bAddressOnly;
  QRLabel5.enabled := not bAddressOnly;
  QRLabel6.enabled := not bAddressOnly;
  QRLabel7.enabled := not bAddressOnly;
  DeliveryDatelbl.Enabled := not bAddressOnly;
  QRDBCustOrderRef.Enabled := not bAddressOnly;
end;

procedure TPBRPJobBagLabelsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

function TPBRPJobBagLabelsFrm.PrintToFile(PONo: real; POLine, DelLine: integer; attachmentType: string): TStringList;
begin
  TPrinterTools.New.PrintToFileLabel(PBLabelsQuickReport, Result, PONo, POLine, DelLine, attachmentType);
end;

(* GDK ToDo: remove after tests
function TPBRPJobBagLabelsFrm.PrintToFile(PONo: real; POLine, DelLine: integer;
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
    self.JobBag := JobBag;

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

    DeliveryDateLbl.caption := PBDateStr(JBDelivSQL.fieldbyname('Date_Point').asdatetime);

    try
      iBoxQuantity := strtoint(JBDelivSQL.fieldbyname('Forms_per_Box').asstring)
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
