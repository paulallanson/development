unit WTRPSOrderAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, gtQrCtrls, QuickRpt, ExtCtrls, DB, gtQrExport, qrprntr, printers, AllCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPSOrderAllocation = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrsdFitterDateTimes: TQRSubDetail;
    qrgFitter: TQRGroup;
    qrlblSOCaption: TQRLabel;
    gtQRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    qrlblFitDateLabel: TQRLabel;
    qrlblTemplateDateLabel: TQRLabel;
    QRShape1: TQRShape;
    qrmAddress: TQRMemo;
    gtQRShape2: TQRShape;
    qrmSiteAddress: TQRMemo;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    qrlblTemplateDate: TQRLabel;
    qrlblDateRequired: TQRLabel;
    gtQRShape1: TQRShape;
    qryReport: TFDQuery;
    dtsAddress: TDataSource;
    gtQRDBText2: TQRDBText;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    qryCompanyAddress: TFDQuery;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    grpDate: TQRGroup;
    gtQRShape11: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    qrlblJobType: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRLabel5: TQRLabel;
    gtQRDBText5: TQRDBText;
    gtQRShape7: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    QRBand1: TQRBand;
    gtQRShape8: TQRShape;
    gtQRMemo1: TQRMemo;
    gtQRSysData1: TQRSysData;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRLabel6: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRShape15: TQRShape;
    gtQRLabel7: TQRLabel;
    gtQRDBText6: TQRDBText;
    gtQRShape16: TQRShape;
    memAddress: TQRRichText;
    qriHeadLogo: TQRImage;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsdFitterDateTimesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure grpDateBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    { Public declarations }
    bEndUser: boolean;
    DateFrom, DateTo: TDateTime;
    Fitter: integer;
    SortBy: integer;
    function GetDetails: integer;
  end;

var
  frmWTRPSOrderAllocation: TfrmWTRPSOrderAllocation;

implementation

uses wtDataModule;

{$R *.dfm}

function TfrmWTRPSOrderAllocation.GetDetails: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  with qryReport do
    begin
      close;
      parambyname('Fitter').asinteger := self.Fitter;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;
      result := recordcount;
    end;
end;

procedure TfrmWTRPSOrderAllocation.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  icount: integer;
  TempAddress: string;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpDetails.PrinterSettings.PaperSize := Size;   {set the number of copies }

  qriHeadLogo.enabled := true;
  memAddress.enabled := true;

  with qryCompany do
    begin
      close;
      open;
    end;

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  memAddress.Lines.clear;
  
  for icount := 0 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

//  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + ' Tel: ' + qryCompanyAddress.Fields[5].AsString;
  tempAddress := tempAddress + '  Fax: ' + qryCompanyAddress.Fields[6].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));
  memAddress.lines.add(tempAddress);
end;

procedure TfrmWTRPSOrderAllocation.qrsdFitterDateTimesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
begin
  {Set the Template and Fitting Dates}
  if qryReport.fieldbyname('template_Date').asdatetime = 0 then
    qrlblTemplateDate.caption := 'TBC'
  else
    qrlblTemplateDate.caption := paDateStr(qryReport.fieldbyname('template_Date').asdatetime);

  if qryReport.fieldbyname('Date_Required').asdatetime = 0 then
    qrlblDateRequired.caption := 'TBC'
  else
    qrlblDateRequired.caption := paDateStr(qryReport.fieldbyname('Date_Required').asdatetime);

  qrmAddress.Lines.Clear;

  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
//    read customer details first to get vat rate
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;

      qryAddress.close;
      qryAddress.parambyname('Address').asinteger := qryReport.FieldByName('Address').AsInteger;
      qryAddress.open;
      dtsAddress.dataset := qryAddress;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;
    end;

  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
    qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);

  for i := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;

  if trim(dtsAddress.DataSet.FieldByName('Telephone_Number').AsString) <> '' then
    qrmAddress.Lines.Add('Telephone: ' + dtsAddress.DataSet.FieldByName('Telephone_Number').AsString);
  if trim(dtsAddress.DataSet.FieldByName('Email_Address').AsString) <> '' then
    qrmAddress.Lines.Add('Email: ' + dtsAddress.DataSet.FieldByName('Email_Address').AsString);

  qrmSiteAddress.Lines.clear;

  if trim(qryReport.fieldbyname('Install_name').asstring) <> '' then
    qrmSiteAddress.lines.add(qryReport.fieldbyname('Install_name').asstring);

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  if trim(qryReport.fieldbyname('Install_Phone').asstring) <> '' then
    qrmSiteAddress.lines.add('Telephone: ' + qryReport.fieldbyname('Install_Phone').asstring);
end;

function TfrmWTRPSOrderAllocation.BuildNotes(const iNotes: integer): string;
var
  aStr: string;
begin
  if iNotes > 0 then
    begin
      qryGetNotes.parambyname('Notes_Code').asinteger := iNotes;
      qryGetNotes.open;
      aStr := '';
      while (not qryGetNotes.eof) do
        Begin
          astr := aStr + qryGetNotes.fieldbyname('Notes_text').asstring;
          if Length(qryGetNotes.fieldbyname('Notes_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;

procedure TfrmWTRPSOrderAllocation.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile(LocalDir+'wtFootLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

procedure TfrmWTRPSOrderAllocation.grpDateBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qryReport.FieldByName('Job_Type').asstring = 'Template' then
    qrlblJobType.caption := 'Templater:'
  else
  if qryReport.FieldByName('Job_Type').asstring = 'Fitting' then
    qrlblJobType.caption := 'Fitter:'
  else
    qrlblJobType.caption := 'Supplied by:'
end;

end.
