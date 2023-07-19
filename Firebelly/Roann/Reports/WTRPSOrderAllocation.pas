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
    memAddress: TgtQRMemo;
    qrsdFitterDateTimes: TQRSubDetail;
    qrgFitter: TQRGroup;
    qrlblSOCaption: TgtQRLabel;
    gtQRShape3: TgtQRShape;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRLabel1: TgtQRLabel;
    qrlblFitDateLabel: TgtQRLabel;
    qrlblTemplateDateLabel: TgtQRLabel;
    QRShape1: TgtQRShape;
    qrmAddress: TgtQRMemo;
    gtQRShape2: TgtQRShape;
    qrmSiteAddress: TgtQRMemo;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    qrlblTemplateDate: TgtQRLabel;
    qrlblDateRequired: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    qryReport: TFDQuery;
    dtsAddress: TDataSource;
    gtQRDBText2: TgtQRDBText;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    qryCompanyAddress: TFDQuery;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    grpDate: TQRGroup;
    gtQRShape11: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    gtQRShape14: TgtQRShape;
    qrlblJobType: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    gtQRLabel5: TgtQRLabel;
    gtQRDBText5: TgtQRDBText;
    gtQRShape7: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    QRBand1: TQRBand;
    gtQRShape8: TgtQRShape;
    gtQRMemo1: TgtQRMemo;
    gtQRSysData1: TgtQRSysData;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    qriHeadLogo: TgtQRImage;
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

  memAddress.lines.clear;
  with qryCompanyAddress do
    begin
      close;
      open;
      for iCount := 0 to 4 do
        begin
          if qryCompanyAddress.Fields[iCount].asstring = '' then
            continue
          else
            memAddress.Lines.Append(Trim(qryCompanyAddress.Fields[iCount].asstring)) ;
        end;

      {Finally, add the phone number} ;
      memAddress.Lines.Append('Tel: ' + Trim(qryCompanyAddress.fieldbyname('Telephone_number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring) <> '' then
        memAddress.Lines.Append('Fax: ' + Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring));
    end;
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
