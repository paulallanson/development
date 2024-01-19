unit WTMaintWTThicknessStockCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Activex, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmWTMaintWTThicknessStockCode = class(TForm)
    Label1: TLabel;
    edtStockCode: TEdit;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryAdd: TFDQuery;
    qryUpdate: TFDQuery;
    qryGetStockItem: TFDQuery;
    qryZero: TFDQuery;
    qryGetLast: TFDQuery;
    qryUpdWT: TFDQuery;
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FWorktop: integer;
    FThickness: integer;
    FStockItem: integer;
    FDescription: string;
    FPricePointer: integer;
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure SetStockItem(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    { Private declarations }
  public
    property Description: string read FDescription write SetDescription;
    property PricePointer: integer read FPricePointer write SetPricePointer;
    property StockItem: integer read FStockItem write SetStockItem;
    property Thickness: integer read FThickness write SetThickness;
    property Worktop: integer read FWorktop write SetWorktop;
  end;

var
  frmWTMaintWTThicknessStockCode: TfrmWTMaintWTThicknessStockCode;

implementation

{$R *.dfm}

{ TfrmWTMaintWTThicknessStockCode }

procedure TfrmWTMaintWTThicknessStockCode.SetStockItem(
  const Value: integer);
begin
  FStockItem := Value;
end;

procedure TfrmWTMaintWTThicknessStockCode.SetThickness(
  const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintWTThicknessStockCode.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintWTThicknessStockCode.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtStockCode.Text <> '');
end;

procedure TfrmWTMaintWTThicknessStockCode.btnOKClick(Sender: TObject);
begin
  if StockItem = 0 then
    StockItem := GetNextKey;

  with qryUpdate do
    begin
      close;
      parambyname('Stock_Item').asinteger := StockItem;
      parambyname('Stock_Code').asstring := edtStockCode.text;
      parambyname('Stock_Description').asstring := Description;
      execsql;
    end;
end;

procedure TfrmWTMaintWTThicknessStockCode.SetDescription(
  const Value: string);
begin
  FDescription := Value;
end;

procedure TfrmWTMaintWTThicknessStockCode.SetPricePointer(
  const Value: integer);
begin
  FPricePointer := Value;
end;

function TfrmWTMaintWTThicknessStockCode.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert stock record
    with qryAdd do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Stock_Item').AsInteger;
      Close;
    end;
    {Update Worktop thickness with stock item}
    with qryUpdWT do
    begin
      close;
      ParamByName('Worktop').Asinteger := Worktop;
      ParamByName('Thickness').Asinteger := Thickness;
      ParamByName('Stock_Item').Asinteger := Result;
      ExecSQL;
    end;

  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintWTThicknessStockCode.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Stock_Item ' +
            '(Stock_Item, Stock_Code, Stock_Description) ' +
            'VALUES (0, ''Dummy'', ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintWTThicknessStockCode.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Stock_Item Where Stock_Item = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintWTThicknessStockCode.FormActivate(Sender: TObject);
begin
  if StockItem = 0 then
    edtStockCode.Text := ''
  else
    begin
      with qryGetStockItem do
        begin
          close;
          parambyname('Stock_Item').asinteger := StockItem;
          open;

          if recordcount > 0 then
            edtStockCode.Text := fieldbyname('Stock_Code').asstring;
        end;
    end;
end;

end.
