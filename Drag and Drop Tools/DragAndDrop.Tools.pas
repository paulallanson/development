unit DragAndDrop.Tools;

interface

uses
  Vcl.Dialogs, Winapi.Windows, DragAndDrop.Interfaces;

type
  TDragAndDropTools = class(TInterfacedObject, IHandleDragAndDrop)
  private
    procedure MakeACopy(const Source, TargetPath: string);
  public
    class function New: IHandleDragAndDrop;
  end;

implementation

uses
  System.Classes, System.SysUtils, System.UITypes;

{ TDragAndDropTools }

procedure TDragAndDropTools.MakeACopy(const Source, TargetPath: string);
var
  SourceStream,
  TargetStream: TFileStream;
  FileName,
  TargetFile: string;
begin
  FileName := ExtractFileName(Source);
  TargetFile := TargetPath + '\' + FileName;

  if FileExists(TargetFile) then
  if MessageDlg('The file already exists in the target directory. Overwrite?', mtwarning, [mbYes, mbNo], 0) <> ID_Yes then
    Exit;

  SourceStream := TFileStream.Create(Source, fmOpenRead);
  try
    TargetStream := TFileStream.Create(TargetFile, fmCreate);
    try
      TargetStream.CopyFrom(SourceStream, SourceStream.Size);
    finally
      TargetStream.Free;
    end;
  finally
    SourceStream.Free;
  end;
end;

class function TDragAndDropTools.New: IHandleDragAndDrop;
begin
  Result := Self.Create;
end;

end.
