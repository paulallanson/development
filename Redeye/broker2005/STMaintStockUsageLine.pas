unit STMaintStockUsageLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintStockUsageLineFrm = class(TForm)
    Label1: TLabel;
    edtProduct: TEdit;
    lblDescription: TLabel;
    btnOK: TBitBtn;
    btbtnClose: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    memInStock: TMemo;
    memNewStock: TMemo;
    memAdj: TMemo;
    btnPart: TBitBtn;
    qryGetPart: TFDQuery;
    procedure memNewStockExit(Sender: TObject);
    procedure memNewStockEnter(Sender: TObject);
    procedure memNewStockChange(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPartClick(Sender: TObject);
    procedure edtProductKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductExit(Sender: TObject);
  private
    sOldValue: string;
    FDiffValue: integer;
    FMode: string;
    procedure SetDiffValue(const Value: integer);
    procedure SetMode(const Value: string);
    function GetPartDetails: boolean;
  public
    bOK: boolean;
    property DiffValue: integer read FDiffValue write SetDiffValue;
    property Mode: string read FMode write SetMode;
  end;

var
  STMaintStockUsageLineFrm: TSTMaintStockUsageLineFrm;

implementation

uses UITypes, CCSCommon, STPrtMnt;

{$R *.dfm}

procedure TSTMaintStockUsageLineFrm.memNewStockExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TSTMaintStockUsageLineFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memNewStock.text <> '') and
                   (edtProduct.Text <> '');
end;

procedure TSTMaintStockUsageLineFrm.memNewStockEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintStockUsageLineFrm.memNewStockChange(Sender: TObject);
var
  iNew, iOld, idiff: integer;
begin
  iOld := 0;
  try
    iNew := strtoint(memNewStock.Text);
    iOld := strtoint(memInStock.text);

    idiff := iNew - iOld;
  except
    iDiff := iOld;
  end;
  memAdj.Text := inttostr(iDiff);

  enableOK(self);
end;

procedure TSTMaintStockUsageLineFrm.btnOKClick(Sender: TObject);
begin
  DiffValue := strtoint(memAdj.text);
  bOK := true;
  close;
end;

procedure TSTMaintStockUsageLineFrm.SetDiffValue(const Value: integer);
begin
  FDiffValue := Value;
end;

procedure TSTMaintStockUsageLineFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
end;

procedure TSTMaintStockUsageLineFrm.SetMode(const Value: string);
begin
  FMode := Value;
  if FMode = 'A' then
    begin
      edtProduct.Enabled := true;
      btnPart.enabled := true;
      lblDescription.Caption := '';
      memInStock.Text := '0';
      memNewStock.Text := '0';
    end
  else
    begin
      edtProduct.Enabled := false;
      btnPart.enabled := false;
    end;
end;

procedure TSTMaintStockUsageLineFrm.btnPartClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtProduct.Text ;
    STPrtMntFrm.bShowAll := false;
    STPrtMntFrm.bStocked := true;
    STPrtMntFrm.ShowModal ;
    if STPrtMntFrm.bOK = True then
      begin
        edtProduct.text := STPrtMntFrm.sCode;
        lblDescription.Caption := STPrtMntFrm.SCodeDescr;
      end;
  finally
    STPrtMntFrm.free;
  end;
end;

procedure TSTMaintStockUsageLineFrm.edtProductKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if not GetPartDetails then
        edtProduct.SetFocus;
    end;
end;

function TSTMaintStockUsageLineFrm.GetPartDetails: boolean;
begin
  With qryGetPart do
    begin
      Close;
      ParamByName('Part').AsString := edtProduct.text ;
      Open;

      if recordcount = 0 then
        begin
          MessageDlg('Product does not exist.', mterror,[mbOk], 0);
          Result := false;
          exit;
        end;
      lblDescription.caption := fieldbyname('Part_Description').asstring;
      memNewStock.SetFocus;
    end;
end;

procedure TSTMaintStockUsageLineFrm.edtProductExit(Sender: TObject);
begin
  if edtproduct.Text <> '' then
    begin
      if not GetPartDetails then
        edtProduct.SetFocus;
    end;
end;

end.
