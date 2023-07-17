unit wtMaintAddChgs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CRControls, Mask, DBCtrls, DB, DBTables, QrCtrls;

type
  TfrmwtMaintAddChgs = class(TForm)
    Label1: TLabel;
    edtmnyCost: TCREditMoney;
    Label4: TLabel;
    Label3: TLabel;
    edtmnySell: TCREditMoney;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    lkpPriceBasis: TQuery;
    dtsPriceBasis: TDataSource;
    chkbxInactive: TCheckBox;
    chkbxDoNotDiscount: TCheckBox;
    edtDescription: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSellPrice: currency;
    FCostPrice: currency;
    FPricePointer: integer;
    FFunctionMode: string;
    procedure SetCostPrice(const Value: currency);
    procedure SetFunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmwtMaintAddChgs: TfrmwtMaintAddChgs;

implementation

uses wtLUAddChgs, wtDataModule, wtMain, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmwtMaintAddChgs.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmwtMaintAddChgs.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmwtMaintAddChgs.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmwtMaintAddChgs.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmwtMaintAddChgs.btnOKClick(Sender: TObject);
begin
  SaveToDB;

(*  if chkbxDoNotDiscount.Checked then
    frmwtLUAddChgs.tblExtras.FieldByName('Do_Not_Discount').asstring := 'Y'
  else
    frmwtLUAddChgs.tblExtras.FieldByName('Do_Not_Discount').asstring := 'N';

  if chkbxInactive.Checked then
    frmwtLUAddChgs.tblExtras.FieldByName('inActive').asstring := 'Y'
  else
    frmwtLUAddChgs.tblExtras.FieldByName('inActive').asstring := 'N';

  if FunctionMode = 'A' then
    begin
      frmwtLUAddChgs.tblExtras.Post;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
	    dtmdlWorktops.qryAddPrice.execSQL;
    end
  else
    begin
      frmwtLUAddChgs.tblExtras.Post;
      if (strtofloat(edtmnySell.text) <> SellPrice) or
         (strtofloat(edtmnyCost.text) <> CostPrice) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmwtMain.Operator;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;
*)
end;

procedure TfrmwtMaintAddChgs.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmwtMaintAddChgs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lkpPriceBasis.active := false;
end;

procedure TfrmwtMaintAddChgs.FormShow(Sender: TObject);
begin
  EnableOK(self);
end;

procedure TfrmwtMaintAddChgs.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      edtDescription.Text := '';
      chkbxDoNotDiscount.Checked := false;
      chkbxInactive.Checked := false;
    end
  else
    begin
      edtDescription.Text := frmwtLUAddChgs.lkpExtras.fieldbyname('Description').asstring;
      chkbxDoNotDiscount.Checked := (frmwtLUAddChgs.lkpExtras.fieldbyname('Do_Not_Discount').asstring = 'Y');
      chkbxInactive.Checked := (frmwtLUAddChgs.lkpExtras.fieldbyname('inActive').asstring = 'Y');
    end;
  EnableOK(self);
end;

procedure TfrmwtMaintAddChgs.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
	    dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	    dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePOinter;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'A';
	    dtmdlWorktops.qryAddPointer.ExecSQl;

      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Extra_Charge').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;

      ParamByName('Allow_Bespoke_Detail').asstring := '';

      if chkbxDoNotDiscount.Checked then
        ParamByName('Do_Not_Discount').asstring := 'Y'
      else
        ParamByName('Do_Not_Discount').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;

    if (strtofloat(edtmnySell.text) <> SellPrice) or
         (strtofloat(edtmnyCost.text) <> CostPrice) or (FunctionMode = 'A') then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmwtMain.Operator;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
  end;
end;

function TfrmwtMaintAddChgs.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
    with qryAdd do
    begin
      ParamByName('Price_Pointer').Asinteger := PricePointer;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Extra_Charge').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmwtMaintAddChgs.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Extra_Charge ' +
            '(Extra_Charge, Description, ' + inttostr(PricePointer) + ', inactive) ' +
            'VALUES(0, ''Dummy'', 1, ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmwtMaintAddChgs.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Extra_Charge Where Extra_Charge = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
