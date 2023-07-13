unit WTMaintSalesOrderJobLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtSalesOrderDM, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TfrmWTMaintSalesOrderJobLine = class(TForm)
    pnlFunctions: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    Label1: TLabel;
    edtQuote: TEdit;
    Label3: TLabel;
    memPrice: TMemo;
    edtDescription: TEdit;
    Label2: TLabel;
    edtPackSize: TEdit;
    edtQtyPacks: TEdit;
    OrdqtyLbl: TLabel;
    Label5: TLabel;
    dblkpVAT: TDBLookupComboBox;
    Button1: TButton;
    Label6: TLabel;
    lblJob: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    memFixing: TMemo;
    memTemplate: TMemo;
    memDelivery: TMemo;
    Supply: TLabel;
    memSupply: TMemo;
    Bevel1: TBevel;
    Label10: TLabel;
    memDiscount: TMemo;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure UpdateOrderLine(Sender: TObject);
  private
    sOldValue: string;
    FActivated: boolean;
    FSOLine: TSOLine;
    FMode: TsolMode;
    procedure SetSOLine(const Value: TSOLine);
    procedure SetMode(const Value: TsolMode);
    procedure ShowDetails;
    { Private declarations }
  public
    property Mode: TsolMode read FMode write SetMode;
    property SOLine: TSOLine read FSOLine write SetSOLine;
  end;

var
  frmWTMaintSalesOrderJobLine: TfrmWTMaintSalesOrderJobLine;

implementation

uses wtStockDM, wtLUProducts, AllCommon, wtLUVat;

{$R *.dfm}

{ TfrmWTMaintSalesOrderLine }

procedure TfrmWTMaintSalesOrderJobLine.SetMode(const Value: TsolMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = solDelete);
  pnlDetails.enabled := not (FMode = solDelete);
end;

procedure TfrmWTMaintSalesOrderJobLine.SetSOLine(const Value: TSOLine);
begin
  FSOLine := Value;
end;

procedure TfrmWTMaintSalesOrderJobLine.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    dblkpVat.ListSource := SOLine.Parent.DataModule.dtsVAT;

    SOLine.Parent.DataModule.qryVAT.Close;
    SOLine.Parent.DataModule.qryVAT.open;

    case Mode of
    solAdd     : Caption := 'Add a Sales Order Line';
    solChange  : Caption := 'Change a Sales Order line';
    solDelete  : Caption := 'Delete a Sales Order Line';
    end;  { case }
    if Mode = solAdd then
      sTemp := ' New Sales Invoice '
    else
      sTemp := ' Sales Invoice ' + IntToStr(SOLine.Parent.DbKey) + ' ';

    ShowDetails;
    pnlDetails.enabled := (Mode <> solView);
    btnOk.visible := (Mode <> solView);
    
    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmWTMaintSalesOrderJobLine.ShowDetails;
begin
  lblJob.caption := '';
  if Mode <> solAdd then
  begin
    edtQuote.text := floattostr(SOLine.Quote);
    edtDescription.text := SOLine.Description;
    edtQtyPacks.text := floattostr(SOLine.Quantity);
    edtPackSize.text := floattostr(SOLine.SellUnit);
    memTemplate.Text := formatfloat('0.00',SOLine.SurveyPrice);
    memFixing.Text := formatfloat('0.00',SOLine.InstallPrice);
    memDelivery.Text := formatfloat('0.00',SOLine.DeliveryPrice);
    memSupply.Text := formatfloat('0.00',(SOLine.NettPrice));
    memDiscount.Text := formatfloat('0.00',SOLine.DiscountValue);
    memPrice.Text := formatfloat('0.00',SOLine.TotalGoods);
//    memSellPrice.Text := formatfloat('0.00',SOLine.UnitPrice);
    dblkpVat.KeyValue := SOLine.Vat;
    if SOLine.Job <> 0 then
      lblJob.caption := floattostr(SOLine.Job);
  end
  else
  begin
    edtQuote.text := '';
    edtDescription.text := '';
    edtQtyPacks.text := '';
    edtPackSize.text := '';
    memPrice.Text := formatfloat('0.00',0.00);
//    memSellPrice.Text := formatfloat('0.00',0.00);
    dblkpVat.KeyValue := 0;
  end;
end;

procedure TfrmWTMaintSalesOrderJobLine.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtQtyPacks.text <> '') and
                    (memFixing.text <> '') and
                    (memTemplate.text <> '') and
                    (memDelivery.text <> '') and
                    (memDiscount.text <> '') and
                    (memSupply.text <> '');
end;
procedure TfrmWTMaintSalesOrderJobLine.FormCreate(Sender: TObject);
begin
  dtmdlStock := TdtmdlStock.Create(self);
end;

procedure TfrmWTMaintSalesOrderJobLine.FormDestroy(Sender: TObject);
begin
  dtmdlStock.Free;
end;

procedure TfrmWTMaintSalesOrderJobLine.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SOLine.InstallPrice := strtofloat(memFixing.text);
  SOLine.SurveyPrice := strtofloat(memTemplate.text);
  SOLine.DeliveryPrice := strtofloat(memDelivery.text);
  SOLine.NettPrice := strtofloat(memSupply.text);
  SOLine.DiscountValue := strtofloat(memDiscount.text);
  SOLine.UnitPrice := SOLine.TotalGoods;
  SOLine.SellUnit := strtoint(edtPackSize.text);
  SOLine.Quantity := strtoint(edtQtyPacks.text) * SOLine.SellUnit;
  SOLine.Description := edtDescription.Text;
  SOLine.VAT := dblkpVat.keyvalue;
  SOLine.VATRate := strtofloat(dblkpVat.text);

  if Mode = solAdd then
  begin
    SOLine.SOLNumber := SOLine.Parent.Lines.Count + 1;
    SOLine.Parent.Lines.Add(SOLine);
  end
  else
  if Mode = solDelete then
  begin
    inx := SOLine.Parent.Lines.IndexOf(SOLine.SOLNumber);
    SOLine.UpdateQuote(SOLine.Quote, 20);
    SOLine.DeletefromDB;
    SOLine.Parent.Lines.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintSalesOrderJobLine.ValidateQty(Sender: TObject);
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

procedure TfrmWTMaintSalesOrderJobLine.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmWTMaintSalesOrderJobLine.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintSalesOrderJobLine.Button1Click(Sender: TObject);
begin
  frmWTLUVat := TfrmWTLUVat.create(self);
  try
    frmWTLUVat.showmodal;
  finally
    frmWTLUVat.free;
  end;

  dtmdlSalesOrder.dtsVAT.DataSet.close;
  dtmdlSalesOrder.dtsVAT.DataSet.open;

end;

procedure TfrmWTMaintSalesOrderJobLine.UpdateOrderLine(Sender: TObject);
begin
  if not FActivated then exit;
  try
    SOLine.InstallPrice := strtofloat(memFixing.text);
  except
    SOLine.InstallPrice := 0;
  end;
  try
    SOLine.SurveyPrice := strtofloat(memTemplate.text);
  except
    SOLine.SurveyPrice := 0;
  end;
  try
  SOLine.DeliveryPrice := strtofloat(memDelivery.text);
  except
    SOLine.DeliveryPrice := 0;
  end;
  try
  SOLine.NettPrice := strtofloat(memSupply.text);
  except
    SOLine.NettPrice := 0;
  end;
  try
  SOLine.DiscountValue := strtofloat(memDiscount.text);
  except
    SOLine.DiscountValue := 0;
  end;
  memPrice.text := formatfloat('0.00',SOLine.TotalGoods);
end;
end.
