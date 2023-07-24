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
    function GetLocation: string;
    procedure SetFileType(const attachmentType: string; var fileType: TPrinterFileType);
    procedure PrintToFile(const Report: TQuickRep; const fileName, attachmentType: string);
  public
    { Public declarations }
    constructor Create;
    class function New: IPrinterToAttachment;
    procedure PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string);
    procedure PrintToFileQuote(const Report: TQuickRep; const ListFiles: TStringList; const ReferenceNo: integer; const attachmentType: string);
    procedure PrintToFileDelivery(const Report: TQuickRep; const ListFiles: TStringList; const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
    procedure PrintToFileLabel(const Report: TQuickRep; const ListFiles: TStringList; const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
  end;

var
  PrinterTools: TPrinterTools;

implementation

uses
  {$IFDEF FIREBELLY}
   AllCommon;
  {$ENDIF}
  {$IFDEF REDEYE}
  CCSCommon;
  {$ENDIF}

  {$IFNDEF REDEYE OR IFNDEF FIREBELLY}
  Define Firebelly or RedEye in project conditional defines
  {$ENDIF}

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

function TPrinterTools.GetLocation: string;
begin
  {$IFDEF FIREBELLY}
  Result := AllCommon.GetWinTempDir;
  {$ENDIF}
  {$IFDEF REDEYE}
  Result := CCSCommon.GetWinTempDir;
  {$ENDIF}
  {$IFNDEF REDEYE OR IFNDEF FIREBELLY}
  Define Firebelly or RedEye in project conditional defines
  {$ENDIF}
end;

procedure TPrinterTools.PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string);
var
  fileType: TPrinterFileType;
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := Location + fileName + '.' + attachmentType;

  PrintToFile(Report, targetFileName, attachmentType);

  FEmailAttachment.Clear;
  FEmailAttachment.Add(targetFileName);
end;

procedure TPrinterTools.PrintToFile(const Report: TQuickRep; const fileName, attachmentType: string);
var
  fileType: TPrinterFileType;
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

  IgtDocumentEngine(gtQRExportInterface1.Engine).FileName := FileName;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.UseImagesAsResources := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ProcessAfterEachPage := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.OpenAfterCreate := False;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ShowSetupDialog := False;
  gtQRExportInterface1.RenderDocument(Report, True);
end;

procedure TPrinterTools.PrintToFileDelivery(const Report: TQuickRep; const ListFiles: TStringList;
  const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
var
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := 'DEL' + FloatToStr(PONo)+ '_' + DelLine.ToString + '.' + attachmentType;

  PrintToFile(Report, targetFileName, attachmentType);
  ListFiles.Add(targetFileName);
end;

procedure TPrinterTools.PrintToFileLabel(const Report: TQuickRep; const ListFiles: TStringList;
  const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
var
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := 'LABEL' + FloatToStr(PONo)+ '_' + DelLine.ToString + '.' + attachmentType;

  PrintToFile(Report, targetFileName, attachmentType);
  ListFiles.Add(targetFileName);
end;

procedure TPrinterTools.PrintToFileQuote(const Report: TQuickRep; const ListFiles: TStringList;
  const ReferenceNo: integer; const attachmentType: string);
var
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := Location + 'Q' + ReferenceNo.ToString + '.' + attachmentType;

  PrintToFile(Report, targetFileName, attachmentType);
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

