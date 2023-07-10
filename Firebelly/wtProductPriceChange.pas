unit wtProductPriceChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Mask, ComCtrls, StdCtrls, CRControls, ExtCtrls, DBCtrls,
  DB, DBTables, DateUtils;

type
  TfrmWTProductPriceChange = class(TForm)
    rdGrpProducts: TRadioGroup;
    lstbxProductsCode: TListBox;
    grpbxProducts: TGroupBox;
    Label1: TLabel;
    btnProducts: TButton;
    lstbxProducts: TListBox;
    BasisGroup: TRadioGroup;
    lblPriceChange: TLabel;
    edtChange: TCREditFloat;
    Label2: TLabel;
    dtpckEffective: TDateTimePicker;
    Label5: TLabel;
    edtTime: TMaskEdit;
    BitBtn2: TBitBtn;
    btnOK: TBitBtn;
    Label4: TLabel;
    dblkpProductGroup: TDBLookupComboBox;
    qryProductGroup: TQuery;
    dtsProductGroup: TDataSource;
    qryProducts: TQuery;
    qryPrice: TQuery;
    procedure EnableOK(sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
    procedure rdGrpProductsClick(Sender: TObject);
    procedure BasisGroupClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    Product: integer;
    procedure PerformUpdate(iPricepointer: integer);
    procedure RunProducts;
  public
    { Public declarations }
  end;

var
  frmWTProductPriceChange: TfrmWTProductPriceChange;

implementation

uses wtLUProducts, wtDataModule, wtMain;

{$R *.dfm}

procedure TfrmWTProductPriceChange.EnableOK(sender: TObject);
begin
	btnOK.enabled := (edtChange.text <> '');
end;

procedure TfrmWTProductPriceChange.FormActivate(Sender: TObject);
begin
  dtpckEffective.Date := date;

  with qryProductGroup do
    begin
      close;
      open;
    end;

  dblkpProductGroup.keyvalue := 0;
end;

procedure TfrmWTProductPriceChange.btnProductsClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtLUProducts := TfrmwtLUProducts.create(self);
  try
    frmwtLUProducts.Product := Product;
    frmwtLUProducts.showmodal;
    if frmwtLUProducts.modalresult = idOK then
      begin
        for iCount := (frmwtLUProducts.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtLUProducts.dbgDetails.datasource.DataSet.GotoBookmark(Pointer(frmwtLUProducts.dbgDetails.SelectedRows[iCount])) ;
            lstbxProductsCode.Items.Add(frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product').asstring);
            lstbxProducts.Items.Add(frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product_Code').asstring);
          end;
      end;
  finally
    frmwtLUProducts.free;
  end;

  enableOK(self);
end;

procedure TfrmWTProductPriceChange.rdGrpProductsClick(Sender: TObject);
begin
  case rdgrpProducts.itemindex of
  0:  begin
        Product := 0;
        lstbxProducts.clear;
        lstbxProducts.items.Add('All Products');
        lstbxProductsCode.Clear;
        grpbxProducts.enabled := false;
      end;
  1:  begin
        lstbxProducts.clear;
        grpbxProducts.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTProductPriceChange.BasisGroupClick(Sender: TObject);
begin
  case BasisGroup.ItemIndex of
  0,1: lblPriceChange.caption := 'Price Change %';
  2:    lblPriceChange.caption := 'New Price'
  end;
end;

procedure TfrmWTProductPriceChange.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Confirm that you wish to make these price changes?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  try
    RunProducts;
    MessageDlg('Product price change has completed successfully', mtInformation,[mbOk], 0);
    close;
  except
    MessageDlg('Product price change has encountered an error', mterror,[mbOk], 0);
  end;

end;

procedure TfrmWTProductPriceChange.RunProducts;
var
  iCount: integer;
begin
	with qryProducts do
  	begin
     	close;
      if lstbxProductsCode.items.Count > 0 then
        begin
          SQL.Add(' AND (');
          for icount := 0 to pred(lstbxProductsCode.items.Count) do
            begin
              if iCount = 0 then
                SQL.Add('(Product = ' + lstbxProductsCode.items[iCount] + ')')
              else
                SQL.Add(' OR (Product = ' + lstbxProductsCode.items[iCount] + ')')
            end;
          SQL.Add(')');
        end;

      if dblkpProductGroup.text = '' then
        parambyname('Product_Group').AsInteger := 0
      else
        parambyname('Product_Group').AsInteger := dblkpProductGroup.KeyValue;
      open;

      iCount := recordcount;
      
      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTProductPriceChange.PerformUpdate(iPricepointer: integer);
var
  sText: string;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
	with qryPrice do
  	begin
     	close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Price_pointer').asinteger := iPricepointer;
      open;
      first;
      if recordcount = 0 then exit;
    end;

  DecodeTime(now, Hour, Min, Sec, MSec);

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := incSecond(strtodatetime(datetostr(dtpckEffective.date)+ ' ' + timetostr(strtoTime(edtTime.text))), Sec);

  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := qryPrice.fieldbyname('Price_Basis').asstring;
  if BasisGroup.itemindex = 0 then
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := qryPrice.fieldbyname('Unit_Price').asfloat * (1+(strtofloat(edtChange.Text)/100))
  else
  if BasisGroup.itemindex = 1 then
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := qryPrice.fieldbyname('Unit_Price').asfloat * (1-(strtofloat(edtChange.Text)/100))
  else
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := strtofloat(edtChange.Text);
    
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := qryPrice.fieldbyname('Unit_Cost').asfloat;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := qryPrice.fieldbyname('Price_Unit').asinteger;
	dtmdlWorktops.qryAddPrice.execSQL;
end;

end.
