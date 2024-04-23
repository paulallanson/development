unit Shared.DragDrop.Helper;

interface

uses
  DropComboTarget,
  System.Classes,
  System.SysUtils,
  DragDropFormats;

type
  TDropComboTargetHelper = class helper for TDropComboTarget
    procedure SaveDroppedFiles(const TargetPath: string; const OnAfterSave: TProc);
  end;

  TDropComboStreamSaver = class
  private
    FStreams: TStreamList;
    FOnAfterSave: TProc;
    FTargetPath: string;

    function SaveStreamToTempFile(const Index: Integer): string;
  public
    constructor Create(const TargetPath: string; const OnAfterSave: TProc);
    procedure Save(const Streams: TStreamList);
  end;

implementation

uses
  System.IOUtils,
  AllCommon;

{ TDropComboTargetHelper }

procedure TDropComboTargetHelper.SaveDroppedFiles(const TargetPath: string; const OnAfterSave: TProc);
begin
  var Saver := TDropComboStreamSaver.Create(TargetPath, OnAfterSave);
  try
    Saver.Save(Data);
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
end;

procedure TDropComboStreamSaver.Save(const Streams: TStreamList);
begin
  FStreams := Streams;
  var HasFilesDropped := (FStreams.Count > 0);

  if not HasFilesDropped then
    Exit;

  for var i := 0 to Pred(FStreams.Count) do
  begin
    var FilePath := SaveStreamToTempFile(i);
    ProcessDroppedFile(FilePath, FTargetPath, FOnAfterSave);
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
