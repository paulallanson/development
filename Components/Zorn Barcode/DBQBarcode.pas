unit DBQBarcode;

{************************************************************************

Data aware QuickReport Barcode Component for Delphi
© 1996-2000 Zorn Software, Amsterdam, The Netherlands
No part of this code may be copied or used in other programs.

*************************************************************************}

interface

uses
  QBarcode, classes, db;

type
  TDBBarCode = class(TBarCode)
  private
    FField: TField;
    FDataSet: TDataSet;
    FDataField: string;
    procedure SetDataField (const Value: string);
    procedure SetDataSet (Value: TDataSet);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    procedure Print (X, Y: integer); override;
    procedure Prepare; override;
    procedure Unprepare; override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DataField: string read FDataField write SetDataField;
    property DataSet: TDataSet read FDataSet write SetDataSet;
  end;

procedure Register;

implementation

procedure TDBBarcode.Paint;
begin
  if FField <> nil then Text := FField.AsString;
  inherited Paint;
end;

procedure TDBBarcode.Print (X, Y: integer);
begin
  if FField <> nil then Text := FField.AsString;
  inherited Print (X, Y);
end;

procedure TDBBarcode.Unprepare;
begin
  FField := nil;
  inherited Unprepare;
end;

procedure TDBBarcode.Prepare;
begin
  inherited Prepare;
  if assigned(FDataSet) then
  begin
    FField := DataSet.FindField(FDataField);
  end else
    FField := nil;
end;

procedure TDBBarcode.SetDataSet(Value: TDataSet);
begin
  FDataSet := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

constructor TDBBarCode.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
end;

destructor TDBBarCode.Destroy;
begin
  inherited Destroy;
end;

procedure TDBBarCode.SetDataField (const Value: string);
begin
  FDataField := Value;
end;

procedure TDBBarCode.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DataSet) then
    DataSet := nil;
end;

procedure Register;
begin
  RegisterComponents('Zorn Software', [TDBBarCode]);
end;

end.
