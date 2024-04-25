unit Shared.DragDrop.Helper;

interface

uses
  DropComboTarget,
  System.Classes,
  System.SysUtils,
  DragDropFormats,
  DragDropFile,
  System.Generics.Collections;

type
  TDropComboTargetHelper = class helper for TDropComboTarget
    procedure SaveDroppedFiles(const TargetPath: string; const OnAfterSave: TProc);
  end;

  TDropComboStreamSaver = class
  private
    FStreams: TStreamList;
    FFiles: TUnicodeStrings;
    FOnAfterSave: TProc;
    FTargetPath: string;
    FProcessedFilesList: TList<string>;

    procedure ProcessFilesFromList;
    procedure ProcessFilesFromData;

    function SaveStreamToTempFile(const Index: Integer): string;
    function GetFile(const Index: Integer): string;
  public
    constructor Create(const TargetPath: string; const OnAfterSave: TProc);
    destructor Destroy; override;
    procedure Save(const Files: TUnicodeStrings; const Streams: TStreamList);
  end;

implementation

uses
  {$IFDEF REDEYE}
    CCSCommon,
  {$ELSE}
    AllCommon,
  {$ENDIF}
  System.IOUtils;

{ TDropComboTargetHelper }

procedure TDropComboTargetHelper.SaveDroppedFiles(const TargetPath: string; const OnAfterSave: TProc);
begin
  var Saver := TDropComboStreamSaver.Create(TargetPath, OnAfterSave);
  try
    Saver.Save(Files, Data);
  finally
    Saver.Free;
  end;
end;

{ TDropComboStreamSaver }

constructor TDropComboStreamSaver.Create(const TargetPath: string; const OnAfterSave: TProc);
begin
  inherited Create;
  FTargetPath := TargetPath;
  FOnAfterSave := OnAfterSave;
  FProcessedFilesList := TList<string>.Create;
end;

procedure TDropComboStreamSaver.Save(const Files: TUnicodeStrings; const Streams: TStreamList);
begin
  FFiles := Files;
  FStreams := Streams;
  FProcessedFilesList.Clear;

  var HasFilesFromList := (FFiles.Count > 0);
  var HasFilesFromData := (FStreams.Count > 0);

  if HasFilesFromList then
    ProcessFilesFromList;

  if HasFilesFromData then
    ProcessFilesFromData;

end;

destructor TDropComboStreamSaver.Destroy;
begin
  FProcessedFilesList.Free;
  inherited;
end;

function TDropComboStreamSaver.GetFile(const Index: Integer): string;
begin
  Result := FFiles[Index];
end;

procedure TDropComboStreamSaver.ProcessFilesFromData;
begin
  var FilePath: string;
  var FileName: string;

  for var i := 0 to Pred(FStreams.Count) do
  begin
    FilePath := SaveStreamToTempFile(i);
    FileName := TPath.GetFileName(FilePath);

    if not FProcessedFilesList.Contains(FileName) then
      ProcessDroppedFile(FilePath, FTargetPath, FOnAfterSave);
  end;
end;

procedure TDropComboStreamSaver.ProcessFilesFromList;
begin
  var FilePath: string;
  var FileName: string;

  for var i := 0 to Pred(FFiles.Count) do
  begin
    FilePath := GetFile(i);
    FileName := TPath.GetFileName(FilePath);

    ProcessDroppedFile(FilePath, FTargetPath, FOnAfterSave);
    FProcessedFilesList.Add(FileName);
  end;
end;

function TDropComboStreamSaver.SaveStreamToTempFile(const Index: Integer): string;
begin
  var FileName := FStreams.Names[Index];
  var IsMemoryStream := (FStreams.Streams[Index] is TMemoryStream);

  if not IsMemoryStream then
    raise ENotSupportedException.CreateFmt('Dropped file "%s" is not a memory stream.', [FileName]);

  var Stream := FStreams.Streams[Index] as TMemoryStream;

  var TempFilePath := TPath.Combine(TPath.GetTempPath, FileName);

  if TFile.Exists(TempFilePath) then
    TFile.Delete(TempFilePath);

  Stream.SaveToFile(TempFilePath);

  Result := TempFilePath;
end;

end.
