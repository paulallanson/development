unit PBDocObjectsDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PBDocObjects,
  Db, DBTables, PBDatabase;

type
  TdmPBDocObjects = class(TDataModule)
    qryDelPOLineDocs: TQuery;
    qryInsPOLineDocs: TQuery;
    qryDelEnqLineDocs: TQuery;
    qryInsEnqLineDoc: TQuery;
    qrySelEnqLineDocs: TQuery;
    qrySelPOLineDocs: TQuery;
    qryCompany: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load(docList: TEnqDocList); overload;
    procedure Load(docList: TPODocList); overload;
    procedure Save(docList: TEnqDocList); overload;
    procedure Save(docList: TPODocList); overload;
  end;

var
  dmPBDocObjects: TdmPBDocObjects;

implementation

{$R *.DFM}

{ TdmPBDocObjects }

procedure TdmPBDocObjects.Load(docList: TEnqDocList);
var
  document: TDocument;
begin
  qrySelEnqLineDocs.Close;
  qrySelEnqLineDocs.ParamByName('enquiry').asInteger := docList.EnqNo;
  qrySelEnqLineDocs.ParamByName('line').asInteger := docList.LineNo;
  qrySelEnqLineDocs.Open;

  while not qrySelEnqLineDocs.Eof do
  begin
    document := TDocument.Create;
    document.title := qrySelEnqLineDocs.FieldByName('Document_Title').asString;
    document.Path := qrySelEnqLineDocs.FieldByName('Document').asString;
    docList.add(document);

    qrySelEnqLineDocs.next;
  end;
end;

procedure TdmPBDocObjects.Load(docList: TPODocList);
var
  document: TDocument;
begin
  self.qrySelPOLineDocs.close;
  self.qrySelPOLineDocs.ParamByName('purchase_order').asFloat := docList.PONum;
  self.qrySelPOLineDocs.ParamByName('line').asFloat := docList.line;
  self.qrySelPOLineDocs.open;

  while not self.qrySelPOLineDocs.eof do
  begin
    document := TDocument.Create;
    document.Title :=
      self.qrySelPOLineDocs.FieldByName('Document_Title').asString;
    document.Path :=
      self.qrySelPOLineDocs.FieldByName('Document').asString;

    docList.add(document);

    self.qrySelPOLineDocs.next;
  end;
end;

procedure TdmPBDocObjects.Save(docList: TEnqDocList);
var
  docInx: integer;
  document: TDocument;
begin
  qryDelEnqLineDocs.ParamByName('enquiry').asInteger := docList.EnqNo;
  qryDelEnqLineDocs.ParamByName('line').asInteger := docList.LineNo;
  qryDelEnqLineDocs.ExecSQL;


  for docInx := 0 to docList.Count - 1 do
  begin
    document := docList[docInx];

    qryInsEnqLineDoc.ParamByName('Enquiry').asInteger := docList.EnqNo;
    qryInsEnqLineDoc.ParamByName('Line').asInteger := docList.LineNo;
    qryInsEnqLineDoc.ParamByName('Document_no').asInteger := docInx + 1;
    qryInsEnqLineDoc.ParamByName('Document_Title').asString := document.Title;
    qryInsEnqLineDoc.ParamByName('Document').asString := document.Path;
    qryInsEnqLineDoc.ExecSQL;
  end;
end;

procedure TdmPBDocObjects.Save(docList: TPODocList);
  var
  docInx: integer;
begin
  qryDelPOLineDocs.ParamByName('purchase_order').asFloat := docList.PONum;
  qryDelPOLineDocs.ParamByName('line').asInteger := docList.Line;
  qryDelPOLineDocs.ExecSQL;

  for docInx := 0 to (docList.Count - 1) do
  begin
    qryInsPOLineDocs.ParamByName('purchase_order').asFloat := docList.PONum;
    qryInsPOLineDocs.ParamByName('line').asInteger := docList.Line;
    qryInsPOLineDocs.ParamByName('Document_no').asInteger := docInx + 1;
    qryInsPOLineDocs.ParamByName('Document_Title').asString :=
      docList[docInx].Title;
    qryInsPOLineDocs.ParamByName('Document').asString :=
      docList[docInx].Path;

    qryInsPOLineDocs.ExecSQL;
  end;
end;

end.
