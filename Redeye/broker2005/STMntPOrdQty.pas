unit STMntPOrdQty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, ExtCtrls, ComCtrls;

type
  TSTMntPOrdQtyFrm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    PackSizeEdit: TEdit;
    QtyLabel: TLabel;
    QtyEdit: TEdit;
    CostLabel: TLabel;
    CostPriceEdit: TEdit;
    DiscLbl: TLabel;
    EdtDiscount: TEdit;
    memNotes: TMemo;
    Panel2: TPanel;
    lblPartLabel: TLabel;
    Label2: TLabel;
    lblPart: TLabel;
    lblPartDesc: TLabel;
    Panel3: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    chkbxSample: TCheckBox;
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CostPriceEditExit(Sender: TObject);
    procedure ValueEditEnter(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure QtyEditExit(Sender: TObject);
    procedure CostPriceEditChange(Sender: TObject);
    procedure CalcDiscount;
    procedure QtyEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    sOldValue: String ;
  public
    { Public declarations }
    bOK, bAllow_Cost, bGoodsRecvd, bStore_Ord, bAllow_Disc, bGoodsInvd: ByteBool ;
    fCost_Price, fOrig_Cost: Real ;
    sStoreName, sPart, sPartDesc: String ;
    iPurchOrdLine, iTransType, iAllocPFJ, iStore, iPurchOrd: Integer ;
  end;

var
  STMntPOrdQtyFrm: TSTMntPOrdQtyFrm;

implementation

uses UITypes, CCSCommon, pbMainMenu;

{$R *.DFM}

procedure TSTMntPOrdQtyFrm.OKBitBtnClick(Sender: TObject);
begin
fCost_Price := StrToFloatDef(CostPriceEdit.Text, 0, FormatSettings) ;
bOK := True ;
Close ;
end;

procedure TSTMntPOrdQtyFrm.FormActivate(Sender: TObject);
begin
  CostLabel.Visible := bAllow_Cost ;
  CostPriceEdit.Visible := bAllow_Cost ;
  CostPriceEdit.Text := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(fCost_Price)) ;
// fSell_Price := (fCost_Price*100)/(100 - (StrToFloatDef(EdtDiscount.text)), 0, FormatSettings);
  bOK := False ;

  PackSizeEdit.Enabled := not self.bGoodsRecvd;
  QtyEdit.Enabled := not self.bGoodsRecvd;
  EdtDiscount.Enabled := not self.bGoodsRecvd;
  CostPriceEdit.Enabled := not self.bGoodsInvd;

  lblPart.Caption := self.sPart;
  lblPartDesc.Caption := self.sPartDesc;
end;

procedure TSTMntPOrdQtyFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TSTMntPOrdQtyFrm.CostPriceEditExit(Sender: TObject);
var
  TempVal: string[10];
begin
If Trim(CostPriceEdit.Text) = '' then
        exit ;
  TempVal := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,CostPriceEdit.Text);
  if TempVal = 'X' then
    CostPriceEdit.Text := sOldValue
  else
    CostPriceEdit.Text := TempVal;
end;

procedure TSTMntPOrdQtyFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := (Trim(PackSizeEdit.Text) <> '') and
                    (Trim(QtyEdit.Text) <> '') and
                    (Trim(CostPriceEdit.Text) <> '') ;
end;

procedure TSTMntPOrdQtyFrm.ValueEditEnter(Sender: TObject);
begin
sOldValue := (Sender as TEdit).Text;
end;

procedure TSTMntPOrdQtyFrm.QtyEditExit(Sender: TObject);
var
  eTempSender: TEdit;
begin
  eTempSender := Sender as TEdit ;
  If Trim(eTempSender.Text) = '' then
        exit ;
  try
    if (eTempSender.Text = '0') or (eTempSender.Text = '0:0') then
      begin
        MessageDlg('Quantity must be > 0',mtError,[mbOK],0) ;
        eTempSender.Text := sOldValue
      end;
  except
    MessageDlg('Invalid Quantity',mtError,[mbOK],0) ;
    eTempSender.Text := sOldValue
  end;
end;

procedure TSTMntPOrdQtyFrm.CostPriceEditChange(Sender: TObject);
begin
CalcDiscount;
end;

procedure TSTMntPOrdQtyFrm.CalcDiscount;
var
  rListValue: real;
  rSellPrice, rPurchPrice: real;
begin
  if not bAllow_Disc then
    exit;
  if (trim(CostPriceEdit.text) = '') or
     (trim(EdtDiscount.text) = '') or
     (trim(sOldValue) = '') then
     exit;

  rSellPrice := StrToFloatDef(CostPriceEdit.text, 0, FormatSettings);
  rPurchPrice := fOrig_Cost;

  if (rSellPrice > fOrig_Cost) or (rSellPrice = 0) then
    EDTDiscount.Text := '0.00'
  else
    begin
      rListValue := (((rSellPrice) - (rPurchPrice))
                    /(rPurchPrice)) * 100.;
      if rListValue < 0 then
       rListValue := rlistValue * -1;
      EdtDiscount.text := formatfloat('0.00',rListValue);
    end;

end;

procedure TSTMntPOrdQtyFrm.QtyEditKeyPress(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos(':', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos(':', Text)
    else { wot is the Sender ? }
      Exit;

  case Key of
    '0'..'9': ;
    ':':
      if P > 0 then Key := #0;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

end.
