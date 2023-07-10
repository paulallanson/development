(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Print Broker Purchase Order Objects.

VSS Info:
*******************************************************************************)

unit PBEnqObjects;

interface

uses
  Classes, Forms, contnrs, PBPOObjects, PBDocObjects;

type

  TEnquiryLine = class
  private
    FDocumentList: TEnqDocList;
    FJobType: integer;
    procedure SetDocumentList(const Value: TEnqDocList);
    procedure SetJobType(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    property DocumentList: TEnqDocList read FDocumentList write SetDocumentList;
    property JobType: integer read FJobType write SetJobType;
  end;

  TEnquiryLines = class(TObjectList)
  private
    procedure SetEnquiryLine(index: integer; const Value: TEnquiryLine);
    function GetEnquiryLine(index: integer): TEnquiryLine;
  public
    property Items[index: integer]: TEnquiryLine read GetEnquiryLine write SetEnquiryLine; default;
  end;

  TEnquiry = class
  private
    FLines: TEnquiryLines;
    FEnquiryNo: integer;
    procedure SetLines(const Value: TEnquiryLines);
    procedure SetEnquiryNo(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    property EnquiryNo: integer read FEnquiryNo write SetEnquiryNo;
    property Lines: TEnquiryLines read FLines write SetLines;
  end;

implementation

{ TEnquiryLine }

constructor TEnquiryLine.Create;
begin
  self.FDocumentList := TEnqDocList.Create;
end;

destructor TEnquiryLine.Destroy;
begin
  self.FDocumentList.Free;
  inherited;
end;

procedure TEnquiryLine.SetDocumentList(const Value: TEnqDocList);
begin
  FDocumentList := Value;
end;

procedure TEnquiryLine.SetJobType(const Value: integer);
begin
  FJobType := Value;
end;

{ TEnquiry }

constructor TEnquiry.Create;
begin
  self.FLines := TEnquiryLines.Create;
end;

destructor TEnquiry.Destroy;
begin
  self.FLines.Free;
  inherited;
end;

procedure TEnquiry.SetEnquiryNo(const Value: integer);
begin
  FEnquiryNo := Value;
end;

procedure TEnquiry.SetLines(const Value: TEnquiryLines);
begin
  FLines := Value;
end;

{ TEnquiryLines }

procedure TEnquiryLines.SetEnquiryLine(index: integer;
  const Value: TEnquiryLine);
begin
  inherited Items[index] := Value;
end;

function TEnquiryLines.GetEnquiryLine(index: integer): TEnquiryLine;
begin
  Result := inherited Items[index] as TEnquiryLine;
end;

end.
