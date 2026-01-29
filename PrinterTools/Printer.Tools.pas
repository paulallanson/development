unit Printer.Tools;

interface

uses
  System.SysUtils, System.Classes, QuickRpt, qrpdffilt, QRWebFilt, QRXLSXFilt, QRExport,
  Printer.Interfaces, Printer.Enums;

type
  TPrinterTools = class(TInterfacedObject, IPrinterToAttachment)
  private
    { Private declarations }
    function GetLocation: string;
    procedure SetFileType(const attachmentType: string; var fileType: TPrinterFileType);
    procedure PrintToFile(const Report: TQuickRep; var fileName: string; const attachmentType: string; FEmailAttachment: TStringList;
      const ClearFilesList: Boolean);
    procedure FindAndAttachAllFiles(const fileName, Extension: string; const FEmailAttachment: TStringList;
      const ClearFilesList: Boolean);
    procedure PrintToHTML(const Report: TQuickRep; const fileName: string);
    procedure PrintToPDF(const Report: TQuickRep; const fileName: string);
    procedure PrintToRTF(const Report: TQuickRep; const fileName: string);
    procedure PrintToXLS(const Report: TQuickRep; const fileName: string);
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    class function New: IPrinterToAttachment;
    procedure PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string; const ClearFilesList: Boolean = true);
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
end;

class function TPrinterTools.New: IPrinterToAttachment;
begin
  Result := Self.Create;
end;

destructor TPrinterTools.Destroy;
begin
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

procedure TPrinterTools.PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName,
  attachmentType: string; const ClearFilesList: Boolean = true);
var
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := Location + fileName;
  PrintToFile(Report, targetFileName, attachmentType, FEmailAttachment, ClearFilesList);
end;

procedure TPrinterTools.PrintToFile(const Report: TQuickRep; var fileName: string; const attachmentType: string; FEmailAttachment: TStringList;
  const ClearFilesList: Boolean);
var
  fileType: TPrinterFileType;
begin
  SetFileType(attachmentType.ToUpper, fileType);

  case fileType of
    pftHTML : PrintToHTML(Report, fileName);
    pftPDF  : PrintToPDF(Report, fileName);
    pftRTF  : PrintToRTF(Report, fileName);
    pftXLS  : PrintToXLS(Report, fileName);
    else raise Exception.Create('Invalid file type: ' + attachmentType + '.');
  end;

  if Assigned(FEmailAttachment) then
    FindAndAttachAllFiles(fileName, attachmentType.ToUpper, FEmailAttachment, ClearFilesList);
end;

procedure TPrinterTools.FindAndAttachAllFiles(const fileName, Extension: string; const FEmailAttachment: TStringList;
  const ClearFilesList: Boolean);
var
  SearchRec: TSearchRec;
  Path: string;
begin
  if ClearFilesList then
    FEmailAttachment.Clear;

  Path := ExtractFilePath(fileName);

  if FindFirst(fileName + '*' + '.' + Extension, faAnyFile, SearchRec) = 0 then
    FEmailAttachment.Add(Path + SearchRec.Name);

  while FindNext(SearchRec) = 0 do
    FEmailAttachment.Add(Path + SearchRec.Name);

  FindClose(SearchRec);
end;

procedure TPrinterTools.PrintToFileDelivery(const Report: TQuickRep; const ListFiles: TStringList;
  const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
var
  Location,
  targetFileName: string;
begin
  Location := GetLocation;
  targetFileName := 'DEL' + FloatToStr(PONo)+ '_' + DelLine.ToString + '.' + attachmentType;

  PrintToFile(Report, targetFileName, attachmentType, nil, True);
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

  PrintToFile(Report, targetFileName, attachmentType, nil, True);
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

  PrintToFile(Report, targetFileName, attachmentType, nil, True);
  ListFiles.Add(targetFileName);
end;

procedure TPrinterTools.PrintToHTML(const Report: TQuickRep; const fileName: string);
var
  HTML: TQRGHTMLDocumentFilter;
begin
  HTML := TQRGHTMLDocumentFilter.Create(fileName + '.HTML');
  try
    Report.ExportToFilter(HTML);
  finally
    HTML.Free;
  end;
end;

procedure TPrinterTools.PrintToPDF(const Report: TQuickRep; const fileName: string);
var
  PDF: TQRPDFDocumentFilter;
begin
  PDF := TQRPDFDocumentFilter.Create(fileName + '.PDF');
  PDF.CompressionOn := false;
  try
    Report.ExportToFilter(PDF);
  finally
    PDF.Free;
  end;
end;

procedure TPrinterTools.PrintToRTF(const Report: TQuickRep; const fileName: string);
var
  RTF: TQRRTFExportFilter;
begin
  RTF := TQRRTFExportFilter.Create(fileName + '.RTF');
  try
    Report.ExportToFilter(RTF);
  finally
    RTF.Free;
  end;
end;

procedure TPrinterTools.PrintToXLS(const Report: TQuickRep; const fileName: string);
var
  XLS: TQRXLSFilter;
begin
  XLS := TQRXLSFilter.Create(fileName + '.XLS');
  try
    Report.ExportToFilter(XLS);
  finally
    XLS.Free;
  end;
end;

procedure TPrinterTools.SetFileType(const attachmentType: string; var fileType: TPrinterFileType);
begin
  if attachmentType = 'HTML' then
    fileType := pftHTML else
  if attachmentType = 'PDF' then
    fileType := pftPDF else
  if attachmentType = 'RTF' then
    fileType := pftRTF else
  if attachmentType = 'XLS' then
    fileType := pftXLS else
    fileType := pftNone;
end;

end.

