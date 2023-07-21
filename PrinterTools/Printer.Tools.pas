unit Printer.Tools;

interface

uses
  System.SysUtils, System.Classes, gtJPEGEng, gtGIFEng, gtRTFEng,
  gtCstGfxEng, gtBMPEng, gtCstPDFEng, gtExPDFEng, gtPDFEng, gtCstDocEng,
  gtCstPlnEng, gtCstHTMLEng, gtExHTMLEng, gtHTMLEng, gtClasses3,
  gtXportIntf, gtQRXportIntf, QuickRpt,
  Printer.Interfaces, Printer.Enums;

type
  TPrinterTools = class(TInterfacedObject, IPrinterToAttachment)
    gtQRExportInterface1: TgtQRExportInterface;
    gtHTMLEngine1: TgtHTMLEngine;
    gtPDFEngine1: TgtPDFEngine;
    gtBMPEngine1: TgtBMPEngine;
    gtRTFEngine1: TgtRTFEngine;
    gtGIFEngine1: TgtGIFEngine;
    gtJPEGEngine1: TgtJPEGEngine;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create;
    class function New: IPrinterToAttachment;
    procedure PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string);
    procedure QuotePrintToFile(const Report: TQuickRep; const ListFiles: TStringList; const ReferenceNo: integer; const attachmentType: string);
    procedure SetFileType(const attachmentType: string; var fileType: TPrinterFileType);
  end;

var
  PrinterTools: TPrinterTools;

implementation

uses
  AllCommon;

{ TPrinterTools }

constructor TPrinterTools.Create;
begin
  gtQRExportInterface1 := TgtQRExportInterface.Create(nil);
  gtHTMLEngine1 := TgtHTMLEngine.Create(nil);
  gtPDFEngine1 := TgtPDFEngine.Create(nil);
  gtBMPEngine1 := TgtBMPEngine.Create(nil);
  gtRTFEngine1 := TgtRTFEngine.Create(nil);
  gtGIFEngine1 := TgtGIFEngine.Create(nil);
  gtJPEGEngine1 := TgtJPEGEngine.Create(nil);
end;

class function TPrinterTools.New: IPrinterToAttachment;
begin
  Result := Self.Create;
end;

procedure TPrinterTools.PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string);
var
  fileType: TPrinterFileType;
  Location,
  targetFileName: string;
begin
  SetFileType(attachmentType.ToUpper, fileType);

  case fileType of
    pftHTML : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftPDF : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftBMP : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftRTF : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftGIF : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftJPEG : gtQRExportInterface1.Engine := gtHTMLEngine1;
    else raise Exception.Create('Invalid file type.');
  end;

  Location := AllCommon.GetWinTempDir;
  targetFileName := Location + fileName + '.' + attachmentType;

  IgtDocumentEngine(gtQRExportInterface1.Engine).FileName := targetFileName;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.UseImagesAsResources := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ProcessAfterEachPage := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.OpenAfterCreate := False;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ShowSetupDialog := False;
  gtQRExportInterface1.RenderDocument(Report, True);

  FEmailAttachment.Clear;
  FEmailAttachment.Add(targetFileName);
end;

procedure TPrinterTools.QuotePrintToFile(const Report: TQuickRep; const ListFiles: TStringList; const ReferenceNo: integer; const attachmentType: string);
var
  fileType: TPrinterFileType;
  Location,
  targetFileName: string;
begin
  SetFileType(attachmentType.ToUpper, fileType);

  case fileType of
    pftHTML : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftPDF : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftBMP : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftRTF : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftGIF : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftJPEG : gtQRExportInterface1.Engine := gtHTMLEngine1;
    else raise Exception.Create('Invalid file type.');
  end;

  Location := AllCommon.GetWinTempDir;
  targetFileName := Location + 'Q' + ReferenceNo.ToString + '.' + attachmentType;

  IgtDocumentEngine(gtQRExportInterface1.Engine).FileName := targetFileName;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.UseImagesAsResources := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ProcessAfterEachPage := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.OpenAfterCreate := False;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ShowSetupDialog := False;
  gtQRExportInterface1.RenderDocument(Report, True);

  ListFiles.Add(targetFileName);
end;


procedure TPrinterTools.SetFileType(const attachmentType: string; var fileType: TPrinterFileType);
begin
  if attachmentType = 'BMP' then
    fileType := pftBMP else
  if attachmentType = 'GIF' then
    fileType := pftGIF else
  if attachmentType = 'HTML' then
    fileType := pftHTML else
  if attachmentType = 'JPG' then
    fileType := pftJPEG else
  if attachmentType = 'PDF' then
    fileType := pftPDF else
  if attachmentType = 'RTF' then
    fileType := pftRTF else
    fileType := pftNone;
end;

end.

