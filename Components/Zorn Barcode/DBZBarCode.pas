unit DBZBarCode;

{************************************************************************

Generic Data aware Barcode Component for Delphi
© 1996-2000 Zorn Software, Amsterdam, The Netherlands
No part of this code may be copied or used in other programs.

*************************************************************************}

interface

uses
  classes, DB, DBCtrls, ZBarcode;

type
  TDBZBarCode = class(TZBarCode)
  private
    FDataLink: TFieldDataLink;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    procedure SetDataField (const Value: string);
    procedure SetDataSource (Value: TDataSource);
    procedure DataChange (Sender: TObject);
  protected
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Zorn Software', [TDBZBarCode]);
end;

constructor TDBZBarcode.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DataChange;
end;

destructor TDBZBarcode.Destroy;
begin
  FDataLink.OnDataChange := nil;
  FDataLink.Free;
  inherited Destroy;
end;

procedure TDBZBarcode.DataChange (Sender: TObject);
begin
  if FDataLink.Field = nil then
    Text := ''
  else
    Text := FDataLink.Field.AsString;
end;

function TDBZBarcode.GetDataField: string;
begin
  Result := FDataLink.Fieldname;
end;

function TDBZBarcode.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBZBarcode.SetDataField (const Value: string);
begin
  FDataLink.Fieldname := Value;
end;

procedure TDBZBarcode.SetDataSource (Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;


end.
