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
  private
    { Private declarations }
    gtQRExportInterface1: TgtQRExportInterface;
    gtHTMLEngine1: TgtHTMLEngine;
    gtPDFEngine1: TgtPDFEngine;
    gtBMPEngine1: TgtBMPEngine;
    gtRTFEngine1: TgtRTFEngine;
    gtGIFEngine1: TgtGIFEngine;
    gtJPEGEngine1: TgtJPEGEngine;
    function GetLocation: string;
    procedure SetFileType(const attachmentType: string; var fileType: TPrinterFileType);
    procedure PrintToFile(const Report: TQuickRep; var fileName: string; const attachmentType: string);
    constructor Create;
    destructor Destroy; override;
  public
    { Public declarations }
    class function New: IPrinterToAttachment;
    procedure PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string);
    procedure PrintToFileQuote(const Report: TQuickRep; const ListFiles: TStringList; const ReferenceNo: integer; const attachmentType: string);
    procedure PrintToFileDelivery(const Report: TQuickRep; const ListFiles: TStringList; const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
    procedure PrintToFileLabel(const Report: TQuickRep; const ListFiles: TStringList; const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
  end;

implementation

uses
  {$IFDEF FIREBELLY}
  AllCommon;
  {$ENDIF}
  {$IFDEF REDEYE}
  CCSCommon;
  {$ENDIF}
  {$IF NOT DEFINED(REDEYE) AND NOT DEFINED(FIREBELLY)}
  Define FIREBELLY or REDEYE in project conditional defines
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

destructor TPrinterTools.Destroy;
begin
  if Assigned(gtQRExportInterface1) then gtQRExportInterface1.Free;
  if Assigned(gtHTMLEngine1) then gtHTMLEngine1.Free;
  if Assigned(gtPDFEngine1) then gtPDFEngine1.Free;
  if Assigned(gtBMPEngine1) then gtBMPEngine1.Free;
  if Assigned(gtRTFEngine1) then gtRTFEngine1.Free;
  if Assigned(gtGIFEngine1) then gtGIFEngine1.Free;
  if Assigned(gtJPEGEngine1) then gtJPEGEngine1.Free;

  inherited Destroy;
end;

function TPrinterTools.GetLocation: string;
begin
  {$IFDEF FIREBELLY}
  Result := AllCommon.GetWinTempDir;
  {$ENDIF}
  {$IFDEF REDEYE}
  Result := CCSCommon.GetWinTempDir;
  {$ENDIF}
  {$IF NOT DEFINED(REDEYE) AND NOT DEFINED(FIREBELLY)}
  Define FIREBELLY or REDEYE in project conditional defines
  {$ENDIF}
end;

procedure TPrinterTools.PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string);
var
  fileType: TPrinterFileType;
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := Location + fileName;

  PrintToFile(Report, targetFileName, attachmentType);

  FEmailAttachment.Clear;
  FEmailAttachment.Add(targetFileName);
end;

procedure TPrinterTools.PrintToFile(const Report: TQuickRep; var fileName: string; const attachmentType: string);
var
  fileType: TPrinterFileType;
begin
  SetFileType(attachmentType.ToUpper, fileType);

  case fileType of
    pftHTML : gtQRExportInterface1.Engine := gtHTMLEngine1;
    pftPDF : gtQRExportInterface1.Engine := gtPDFEngine1;
    pftBMP : gtQRExportInterface1.Engine := gtBMPEngine1;
    pftRTF : gtQRExportInterface1.Engine := gtRTFEngine1;
    pftGIF : gtQRExportInterface1.Engine := gtGIFEngine1;
    pftJPEG : gtQRExportInterface1.Engine := gtJPEGEngine1;
    else raise Exception.Create('Invalid file type.');
  end;

  IgtDocumentEngine(gtQRExportInterface1.Engine).FileName := fileName;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.UseImagesAsResources := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ProcessAfterEachPage := True;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.OpenAfterCreate := False;
  IgtDocumentEngine(gtQRExportInterface1.Engine).Preferences.ShowSetupDialog := False;

  gtQRExportInterface1.Engine.FileExtension := attachmentType;
  gtQRExportInterface1.RenderDocument(Report, False);

  fileName := fileName + '.' + gtQRExportInterface1.Engine.FileExtension;
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

