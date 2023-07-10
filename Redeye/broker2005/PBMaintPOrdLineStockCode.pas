unit PBMaintPOrdLineStockCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, Spin, ExtCtrls,
  PBPOObjects, contnrs;

type
  TPBMaintPOrdLineStockCodeFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    POrdLabel: TLabel;
    Label9: TLabel;
    memQuantity: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    memDelivered: TMemo;
    edtFormReferenceID: TEdit;
    edtStockReference: TEdit;
    Label3: TLabel;
    edtDescription: TEdit;
    Label4: TLabel;
    FormRefButton: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure FormRefButtonClick(Sender: TObject);
  private
    FFuncMode: Char;
    sOldValue: string;
    sDescName: string;
    FStockCode: TStockCode;
    FSelectedLine: TOrderLine;
    FMode: TPOSCMode;
    procedure SetStockCode(const Value: TStockCode);
    procedure SetSelectedLine(const Value: TOrderLine);
    procedure SetMode(const Value: TPOSCMode);
  public
    bOK: Boolean;
    ChargeList: TObjectList;
    property Mode: TPOSCMode read FMode write SetMode;
    property StockCode: TStockCode read FStockCode write SetStockCode;
    property SelectedLine: TOrderLine read FSelectedLine write SetSelectedLine;
  end;

var
  PBMaintPOrdLineStockCodeFrm: TPBMaintPOrdLineStockCodeFrm;

implementation

uses
  PBPODataMod, PBLUCustFormRef;

{$R *.DFM}

procedure TPBMaintPOrdLineStockCodeFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  if FFuncMode = poAdd then
    Caption := 'Add a new stock version'
  else
    if FFuncMode = poChange then
      Caption := 'Change a stock version'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete a version'
      else
        if FFuncMode = poView then
          Caption := 'View a version';
  if FFuncMode = poAdd then
  begin
    {Empty details}
    edtFormReferenceID.Text := '';
    edtStockReference.Text := '';
    edtdescription.Text := '';
    memQuantity.Text := '0';
    memDelivered.Text := '0.00';
  end
  else
    with StockCode do
    begin
      {Get the apppropriate detail and display it}
      edtFormReferenceID.Text := FormReferenceID;
      edtStockReference.Text := StockReference;
      edtDescription.Text := Description;
      memQuantity.Text := FormatAnyQty(QtyOrdered);
      memDelivered.Text := FormatAnyQty(QtyDelivered);
    end;
  POrdLabel.Caption := sDescName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not (FFuncMode in [poDelete, poView]);
  DelLabel.Visible := (FFuncMode = poDelete);
  OKBitBtn.Visible := (FFuncMode <> poView);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineStockCodeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled :=
    (edtFormReferenceID.Text <> '') and
    (edtStockReference.Text <> '') and
    (edtDescription.Text <> '') and
    (memQuantity.Text <> '') and
    (memDelivered.Text <> '');
end;

procedure TPBMaintPOrdLineStockCodeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPOrdLineStockCodeFrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
  if (memQuantity.text = '0') then
    begin
      MessageDlg('The quantity must be a value greater than zero', mtError,
        [mbAbort], 0);
      memQuantity.setfocus;
      exit;
    end;
  with stockCode do
    begin
      FormReferenceID := edtFormReferenceID.Text;
      StockReference := edtStockReference.Text;
      Description := edtDescription.Text;
      QtyOrdered := PBFloatStr(memQuantity.Text);
      QtyDelivered := PBFloatStr(memDelivered.Text);

      if Mode = poscAdd then
        begin
         CodeNo := selectedline.StockCodes.Count + 1;
         SelectedLine.StockCodes.Add(StockCode);
        end
      else
      if Mode = poscChange then
        begin
        end
      else
      if Mode = poscDelete then
        begin
          inx := SelectedLine.StockCodes.Indexof(CodeNo);
          SelectedLine.StockCodes.Delete(inx);
        end;
    end;
  ModalResult := mrOK;
end;

procedure TPBMaintPOrdLineStockCodeFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdLineStockCodeFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineStockCodeFrm.SetStockCode(
  const Value: TStockCode);
begin
  FStockCode := Value;
end;


procedure TPBMaintPOrdLineStockCodeFrm.SetSelectedLine(
  const Value: TOrderLine);
begin
  FSelectedLine := Value;
end;

procedure TPBMaintPOrdLineStockCodeFrm.SetMode(const Value: TPOSCMode);
begin
  FMode := Value;
end;

procedure TPBMaintPOrdLineStockCodeFrm.FormRefButtonClick(Sender: TObject);
begin
  PBLUCustFormRefFrm := TPBLUCustFormRefFrm.Create(Self);
  try
    PBLUCustFormRefFrm.bIs_Lookup := True;
    PBLUCustFormRefFrm.bAllow_Upd := True;
    PBLUCustFormRefFrm.iCust := SelectedLine.Customer;
    PBLUCustFormRefFrm.sCustName := PBPODM.GetCustName(SelectedLine.Customer);
    PBLUCustFormRefFrm.iBranch := SelectedLine.BranchNo;
    PBLUCustFormRefFrm.sBranchName := PBPODM.GetCustBranchName(SelectedLine.Customer,SelectedLine.BranchNo);
    PBLUCustFormRefFrm.SelCode := StockCode.FormReference;
    PBLUCustFormRefFrm.ShowModal;
    if PBLUCustFormRefFrm.bSelected then
    begin
      if PBPODM.StockCodeInactive(PBLUCustFormRefFrm.StockCode) then
        begin
          messagedlg('The stock reference/form reference selected is inactive, orders cannot be processed for inactive products.', mtError, [mbOK], 0);
          exit;
        end;
      StockCode.FormReference := PBLUCustFormRefFrm.SelCode;
      edtFormReferenceID.text := PBLUCustFormRefFrm.SelName;
      edtStockReference.text := PBLUCustFormRefFrm.StockCode;
      edtDescription.text := PBLUCustFormRefFrm.SelDescr;
    end;
  finally
    PBLUCustFormRefFrm.Free;
  end;
  CheckOK(Self);
end;

end.
