unit WTMaintWorktopThicknessSlab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, CRControls, DB, DBTables, ActiveX,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmWTMaintWorktopThicknessSlab = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    edtLength: TCREditInt;
    edtDepth: TCREditInt;
    edtSlabSizeDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    Label6: TLabel;
    edtStockCode: TEdit;
    qryAddStock: TFDQuery;
    qryUpdStock: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    Label7: TLabel;
    edtStockDescription: TEdit;
    Label8: TLabel;
    lblWorktopDescription: TLabel;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLengthChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtStockCodeChange(Sender: TObject);
  private
    FMaterialType: integer;
    FFunctionMode: string;
    FStockItem: integer;
    FWorktop: integer;
    FThickness: integer;
    FSlabSize: integer;
    FDescription: string;
    procedure SetFunctionMode(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SetDescription(const Value: string);
    procedure SetSlabSize(const Value: integer);
    procedure SetStockItem(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property Description: string read FDescription write SetDescription;
    property SlabSize: integer read FSlabSize write SetSlabSize;
    property StockItem: integer read FStockItem write SetStockItem;
    property Thickness: integer read FThickness write SetThickness;
    property Worktop: integer read FWorktop write SetWorktop;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property MaterialType: integer read FMaterialType write SetMaterialType;
  end;

var
  frmWTMaintWorktopThicknessSlab: TfrmWTMaintWorktopThicknessSlab;

implementation

uses wtMaintMatType;

{$R *.dfm}

{ TfrmWTMaintMatTypeSlabs }

procedure TfrmWTMaintWorktopThicknessSlab.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      edtLength.SetFocus;
    end;

  EnableOK(self);
end;

procedure TfrmWTMaintWorktopThicknessSlab.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtLength.text <> '') and
                    (edtDepth.text <> '') and
                    (edtSlabSizeDescription.Text <> '');
end;

procedure TfrmWTMaintWorktopThicknessSlab.edtLengthChange(Sender: TObject);
begin
  enableok(self);
end;

procedure TfrmWTMaintWorktopThicknessSlab.btnOKClick(Sender: TObject);
begin
  {Add stock code if there is one}
  if StockItem = 0 then
    begin
      if edtStockCode.Text <> '' then
        StockItem := GetNextKey;
    end;

  with qryUpdStock do
    begin
      close;
      parambyname('Stock_Item').asinteger := StockItem;
      parambyname('Stock_Code').asstring := edtStockCode.text;
      parambyname('Stock_Description').asstring := edtStockDescription.Text;
      execsql;
    end;


  if FunctionMode = 'A' then
    begin
      with qryAdd do
      begin
        Close;
        parambyname('Slab_Size_Description').asstring := edtSlabSizeDescription.text;
        parambyname('Length').asinteger := strtoint(edtLength.text);
        parambyname('Depth').asinteger := strtoint(edtDepth.text);
        parambyname('Worktop').asinteger := self.worktop;
        parambyname('Thickness').asinteger := self.thickness;
        if self.stockitem = 0 then
          parambyname('Stock_Item').clear
        else
          parambyname('Stock_Item').asinteger := self.StockItem;
        execsql;
      end;
    end
  else
    begin
      with qryUpdate do
      begin
        Close;
        parambyname('Slab_Size_Id').asinteger := self.SlabSize;
        parambyname('Slab_Size_Description').asstring := edtSlabSizeDescription.text;
        parambyname('Length').asinteger := strtoint(edtLength.text);
        parambyname('Depth').asinteger := strtoint(edtDepth.text);
        if self.stockitem = 0 then
          parambyname('Stock_Item').clear
        else
          parambyname('Stock_Item').asinteger := self.StockItem;
        execsql;
      end;
    end;
end;

function TfrmWTMaintWorktopThicknessSlab.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert stock record
    with qryAddStock do
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

  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintWorktopThicknessSlab.AddZero;
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

procedure TfrmWTMaintWorktopThicknessSlab.DeleteZero;
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

procedure TfrmWTMaintWorktopThicknessSlab.SetDescription(
  const Value: string);
begin
  FDescription := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.SetSlabSize(
  const Value: integer);
begin
  FSlabSize := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.SetStockItem(
  const Value: integer);
begin
  FStockItem := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.SetThickness(
  const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintWorktopThicknessSlab.edtStockCodeChange(
  Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    edtStockDescription.Text := self.Description;
end;

end.
