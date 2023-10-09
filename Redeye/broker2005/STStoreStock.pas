unit STStoreStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, STStoreStockObj, ExtCtrls, Buttons;

type
  TSTStoreStockFrm = class(TForm)
    pnlHeader: TPanel;
    lblDetailLine1: TLabel;
    lblDetailLine2: TLabel;
    pnlMain: TPanel;
    chkbxPaidFor: TCheckBox;
    edtCost: TEdit;
    lblCost: TLabel;
    Label1: TLabel;
    edtStockRef: TEdit;
    edtPackSize: TEdit;
    lblPackSize: TLabel;
    pnlButtons: TPanel;
    btbtnOK: TBitBtn;
    btbtnCancel: TBitBtn;
    edtSetsPerPad: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtStockRefChange(Sender: TObject);
    procedure edtPackSizeChange(Sender: TObject);
    procedure edtCostChange(Sender: TObject);
    procedure chkbxPaidForClick(Sender: TObject);
    procedure btbtnOKClick(Sender: TObject);
    procedure edtCostKeyPress(Sender: TObject; var Key: Char);
    procedure edtPackSizeKeyPress(Sender: TObject; var Key: Char);
    procedure edtPackSizeExit(Sender: TObject);
    procedure edtSetsPerPadKeyPress(Sender: TObject; var Key: Char);
    procedure edtSetsPerPadChange(Sender: TObject);
  private
    FstoreStock: TStoreStock;
    procedure SetstoreStock(const Value: TStoreStock);
    { Private declarations }
  public
    property storeStock: TStoreStock read FstoreStock write SetstoreStock;
    procedure Display;
  end;

var
  STStoreStockFrm: TSTStoreStockFrm;

implementation

uses UITypes;

{$R *.DFM}

{ TSTStoreStockFrm }

procedure TSTStoreStockFrm.Display;
begin
  lblDetailLine1.caption := 'Part: ' + storeStock.part + '         ' +
                        'Quantity: ' + intToStr(storeStock.storeQuantity) + '         ' +
                        'Date Received: ' + dateToStr(storeStock.dateReceived)+ '         ';

  lblDetailLine2.caption := 'Store: ' + storeStock.partStore.partStoreName + '         ' +
                            'Bin: ' + storeStock.partBin + '         ' +
                            'Lot: ' + storeStock.partStoreLot;
                            
  edtStockRef.text := storeStock.storeStockDescription;
  edtPackSize.text := intToStr(storeStock.stockPackQuantity);
  edtSetsPerPad.text := intToStr(storeStock.setsperpad);
  edtCost.text := floatToStrF(storeStock.storeCost, ffFixed, 15, 2);
  chkbxPaidFor.checked := storeStock.invoiceUpfront;

  if storeStock.readOnly then
  begin
    edtStockRef.readOnly := true;
    edtPackSize.readOnly := true;
    edtCost.readOnly := true;
    chkbxPaidFor.enabled := false;
  end;
end;

procedure TSTStoreStockFrm.SetstoreStock(const Value: TStoreStock);
begin
  FstoreStock := Value;
end;

procedure TSTStoreStockFrm.FormShow(Sender: TObject);
begin
  Display;
  storeStock.modified := false;
end;

procedure TSTStoreStockFrm.edtStockRefChange(Sender: TObject);
begin
  storeStock.storeStockDescription := edtStockRef.text;
  storeStock.modified := true;
end;

procedure TSTStoreStockFrm.edtPackSizeChange(Sender: TObject);
begin
  try
    storeStock.stockPackQuantity := strToInt(edtPackSize.text);
    storeStock.modified := true;
  except

  end;
end;

procedure TSTStoreStockFrm.edtCostChange(Sender: TObject);
begin
  storeStock.storeCost := StrToFloatDef(edtCost.text, 0, FormatSettings);
  storeStock.modified := true;
end;

procedure TSTStoreStockFrm.chkbxPaidForClick(Sender: TObject);
begin
  storeStock.invoiceUpfront := chkbxPaidFor.checked;
  storeStock.modified := true;
end;

procedure TSTStoreStockFrm.btbtnOKClick(Sender: TObject);
begin
  if storeStock.modified then
  begin
    storeStock.save;
  end;
end;

procedure TSTStoreStockFrm.edtCostKeyPress(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TSTStoreStockFrm.edtPackSizeKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

procedure TSTStoreStockFrm.edtPackSizeExit(Sender: TObject);
begin
  try
    strToInt(edtPackSize.text);
  except
    messageDlg('Pack Size must be a positive whole number!', mtWarning, [mbOK],0);
    edtpackSize.SetFocus;
  end;
end;

procedure TSTStoreStockFrm.edtSetsPerPadKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

procedure TSTStoreStockFrm.edtSetsPerPadChange(Sender: TObject);
begin
  try
    storeStock.setsperpad := strToInt(edtSetsPerPad.text);
    storeStock.modified := true;
  except

  end;
end;

end.
