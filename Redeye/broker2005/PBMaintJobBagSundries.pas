unit PBMaintJobBagSundries;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBTables, DBCtrls, ExtCtrls, PBJobBagDM, Variants;

type
  TPBMaintJobBagSundriesfrm = class(TForm)
    DetsGroupBox: TGroupBox;
    lblDescription: TLabel;
    DescrEdit: TEdit;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SupplierEdit: TEdit;
    BranchEdit: TEdit;
    SelSupBtn: TButton;
    lblSupplier: TLabel;
    lblBranch: TLabel;
    lblCost: TLabel;
    lblSell: TLabel;
    CostValMemo: TMemo;
    SellValMemo: TMemo;
    GetVATSQL: TQuery;
    VATSRC: TDataSource;
    VATDBLCB: TDBLookupComboBox;
    lblVatRate: TLabel;
    Label1: TLabel;
    edtProductType: TEdit;
    btnProdType: TButton;
    procedure SelSupBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    function FormatMoney(TempQty: string): string;
    function FormatQty(TempQty: string): string;
    procedure DescrEditChange(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure btnProdTypeClick(Sender: TObject);
  private
    FActivated : Boolean;
    FMode: TJBMode;
    FJobBagLine: TJobBagLine;
    FOldValue : string;
    ProductType: integer;
    procedure LoadData;
    procedure SetJobBagLine(const Value: TJobBagLine);
    procedure SetMode(const Value: TJBMode);
  public
    property JobBagLine : TJobBagLine read FJobBagLine write SetJobBagLine;
    property Mode : TJBMode read FMode write SetMode;
  end;

implementation

uses PBLUSupp, PBLUPrdTyp;

{$R *.DFM}

procedure TPBMaintJobBagSundriesfrm.SelSupBtnClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.SelCode := JobBagLine.Supplier;
    PBLUSuppFrm.SelBranch := JobBagLine.BranchNo;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      JobBagLine.Supplier := PBLUSuppFrm.SelCode;
      JobBagLine.SupplierName := PBLUSuppFrm.SelName;
      SupplierEdit.Text := PBLUSuppFrm.SelName;
      JobBagLine.BranchNo := PBLUSuppFrm.SelBranch;
      JobBagLine.BranchName := PBLUSuppFrm.SelBranchName;
      BranchEdit.Text := PBLUSuppFrm.SelBranchName;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintJobBagSundriesfrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (Trim(DescrEdit.Text) <> '') and
    (Trim(SellValMemo.Text) <> '') and
    (Trim(CostValMemo.Text) <> '') and
    (VATDBLCB.KeyValue <> null) and
    (JobBagLine.Supplier <> 0);
end;

procedure TPBMaintJobBagSundriesfrm.FormActivate(Sender: TObject);
var
  sJobBag : string;
begin
  if not FActivated then
  begin
    sJobBag := IntToStr(JobBagLine.Parent.DbKey);
    if Mode = jbAdd then
      Caption := 'Add A New Revenue/Cost To Job Bag: ' + sJobBag;
    if Mode = jbChange then
      Caption := 'Change A Revenue/Cost In Job Bag: ' + sJobBag;
    if Mode = jbDelete then
      Caption := 'Delete A Revenue/Cost From Job Bag: ' + sJobBag;
    GetVATSQL.Close;
    GetVATSQL.Open;
    LoadData;
    DetsGroupBox.Enabled := (Mode <> jbDelete) and (Mode <> jbView);
    DelLabel.Visible := (Mode = jbDelete);
    OKBitBtn.Visible := not(Mode = jbView);
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagSundriesfrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
  JobBagLine.JBLineDescr := Trim(DescrEdit.Text);
  JobBagLine.JBQuantity := 1;
  JobBagLine.JBLineCost := StrToFloat(CostValMemo.Text);
  JobBagLine.JBLineSell := StrToFloat(SellValMemo.Text);
  if JobBagLine.JBLineSell - JobBagLine.JBLineCost >= 0 then
    JobBagLine.JBLineType := 'R'
  else
    JobBagLine.JBLineType := 'C';
  JobBagLine.JBLineInvoiced := 'N';
  if VarIsEmpty(VATDBLCB.KeyValue) or VarIsNull(VATDBLCB.KeyValue) then
    JobBagLine.VatCode := -1
  else
    JobBagLine.VatCode := VATDBLCB.KeyValue;
  JobBagLine.CurrencyCode := 0;
  JobBagLine.ProductType := self.ProductType;
  if Mode = jbAdd then
  begin
//    JobBagLine.JBLine := JobBagLine.Parent.Lines.Count + 1;
    JobBagLine.JBLine := JobBagLine.Parent.Lines.MaxLineNo + 1;
    JobBagLine.Parent.Lines.Add(JobBagLine);
    JobBagLine.JBLineMode := 'N';
  end
  else
  if Mode = jbDelete then
  begin
    inx := JobBagLine.Parent.Lines.IndexOf(JobBagLine.JBLine);
    JobBagLine.DeletefromDB;
    JobBagLine.Parent.Lines.Delete(inx);
  end;
  JobBagLine.Parent.SaveToDB(false);
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagSundriesfrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagSundriesfrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagSundriesfrm.QtyMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

function TPBMaintJobBagSundriesfrm.FormatMoney(TempQty: string): string;
begin
  if Trim(TempQty) = '' then
    Result := ''
  else
  try
    begin
      Result := FormatFloat('######0.00', StrToFloat(TempQty));
      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    MessageDlg('Invalid financial value - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function TPBMaintJobBagSundriesfrm.FormatQty(TempQty: string): string;
begin
  if Trim(TempQty) = '' then
    Result := ''
  else
  try
    begin
      Result := FormatFloat('######0', StrToFloat(TempQty));
      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    MessageDlg('Invalid quantity - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

procedure TPBMaintJobBagSundriesfrm.DescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintJobBagSundriesfrm.VATDBLCBClick(Sender: TObject);
begin
  JobBagLine.VatCode := VATDBLCB.KeyValue;
  CheckOK(Self);
end;

procedure TPBMaintJobBagSundriesfrm.SetJobBagLine(const Value: TJobBagLine);
begin
  FJobBagLine := Value;
end;

procedure TPBMaintJobBagSundriesfrm.SetMode(const Value: TJBMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagSundriesfrm.LoadData;
begin
  if Mode <> jbAdd then
  begin
    DescrEdit.Text := JobBagLine.JBLineDescr;
    edtProductType.Text := JobBagLine.ProductTypeDesc;
    SupplierEdit.Text := JobBagLine.SupplierName;
    BranchEdit.Text := JobBagLine.BranchName;
    CostValMemo.Text := FormatMoney(FloatToStr(JobBagLine.JBLineCost));
    SellValMemo.Text := FormatMoney(FloatToStr(JobBagLine.JBLineSell));
    VATDBLCB.KeyValue := JobBagLine.VatCode;
    self.ProductType := JobBagLine.ProductType;
  end
  else
  begin
    DescrEdit.Text := '';
    SupplierEdit.Text := '';
    BranchEdit.Text := '';
    edtProductType.Text := '';
    CostValMemo.Text := '';
    SellValMemo.Text := '';
    VATDBLCB.KeyValue := Null;
    self.ProductType := 0;
  end;
end;

procedure TPBMaintJobBagSundriesfrm.btnProdTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := self.ProductType;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      Self.ProductType := PBLUPrdTypFrm.SelCode;
      edtProductType.Text := PBLUPrdTypFrm.SelName + '/' + PBLUPrdTypFrm.CatName;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(self);
end;

function GetProductType(tempCode: integer): string;
begin
end;

end.
