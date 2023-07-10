unit PBDocObjects;

interface

uses
  Classes, contnrs;

type
  TDocument = class
  private
    FTitle: string;
    FPath: string;
    procedure SetPath(const Value: string);
    procedure SetTitle(const Value: string);
  public
    property Title: string read FTitle write SetTitle;
    property Path: string read FPath write SetPath;
    procedure New(location, fileType: string);
  end;

  TDocumentList = class(TObjectList)
  private
    function GetDocument(index: integer): TDocument;
    procedure SetDocument(index: integer; const Value: TDocument);
  public
    property Items[index: integer]: TDocument read GetDocument write SetDocument; default;
    function add(document: TDocument): integer;
  end;

  TPODocList = class(TDocumentList)
  private
    FLine: integer;
    FPONum: real;
    procedure SetLine(const Value: integer);
    procedure SetPONum(const Value: real);
  public
    property PONum: real read FPONum write SetPONum;
    property Line: integer read FLine write SetLine;
    procedure Load;
    procedure Save;
  end;

  TEnqDocList = class(TDocumentList)
  private
    FLineNo: integer;
    FEnqNo: integer;
    procedure SetEnqNo(const Value: integer);
    procedure SetLineNo(const Value: integer);
  public
    property EnqNo: integer read FEnqNo write SetEnqNo;
    property LineNo: integer read FLineNo write SetLineNo;
    procedure Load;
    procedure Save;
  end;

implementation

uses
  sysutils, PBDocObjectsDM;

{ TDocument }

procedure TDocument.New(location, fileType: string);
var
  tempFileName, tempStr: string;
  inx: integer;
begin
  //create the new document
  inx := 1;

  tempStr :=  copy(location, length(location), 1);
  if tempStr <> '\' then
    location := location + '\';

  if fileType = '.doc' then
  begin
    tempStr := 'New Microsoft Word Document';
  end
  else
  if fileType = '.xls' then
  begin
    tempStr := 'New Microsoft Excel Worksheet';
  end
  else
  if fileType = '.msg' then
  begin
    tempStr := 'New Microsoft Outlook Email';
  end;

  tempFileName := Format(tempStr + '(%d)' + fileType, [inx]);
  while FileExists(location+tempFileName) do
  begin
    inc(inx);
    tempFileName := Format(tempStr + '(%d)' + fileType, [inx]);
  end;

  self.Path := tempFileName;
  self.Title := tempFileName;
end;

procedure TDocument.SetPath(const Value: string);
begin
  FPath := Value;
end;

procedure TDocument.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

{ TDocumentList }

function TDocumentList.add(document: TDocument): integer;
begin
  Result := inherited add(document);
end;

function TDocumentList.GetDocument(index: integer): TDocument;
begin
  Result := inherited Items[index] as TDocument;
end;

procedure TDocumentList.SetDocument(index: integer;
  const Value: TDocument);
begin
  inherited Items[index] := Value;
end;

{ TPODocList }

procedure TPODocList.Load;
begin
  dmPBDocObjects.Load(self);
end;

procedure TPODocList.Save;
begin
  dmPBDocObjects.Save(self);
end;

procedure TPODocList.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TPODocList.SetPONum(const Value: real);
begin
  FPONum := Value;
end;

{ TEnqDocList }

procedure TEnqDocList.Load;
begin
  dmPBDocObjects.Load(self);
end;

procedure TEnqDocList.Save;
begin
  dmPBDocObjects.Save(self);
end;

procedure TEnqDocList.SetEnqNo(const Value: integer);
begin
  FEnqNo := Value;
end;

procedure TEnqDocList.SetLineNo(const Value: integer);
begin
  FLineNo := Value;
end;

end.
