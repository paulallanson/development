unit PBMaintJobBagRC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBCtrls, ExtCtrls, PBJobBagDM, Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagRCFrm = class(TForm)
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
    GetVATSQL: TFDQuery;
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
    procedure ValidateMoney3DP(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    function FormatQty(TempQty: string): string;
    procedure DescrEditChange(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure btnProdTypeClick(Sender: TObject);
  private
    FActivated : Boolean;
    FMode: TJBLMode;
    FJobBagLine: TJobBagLine;
    FOldValue : string;
    ProductType: integer;
    procedure LoadData;
    procedure SetJobBagLine(const Value: TJobBagLine);
    procedure SetMode(const Value: TJBLMode);
  public
    MakeInactive: boolean;
    property JobBagLine : TJobBagLine read FJobBagLine write SetJobBagLine;
    property Mode : TJBLMode read FMode write SetMode;
  end;

implementation

uses PBLUSupp, PBLUPrdTyp, CCSCommon;

{$R *.DFM}

procedure TPBMaintJobBagRCFrm.SelSupBtnClick(Sender: TObject);
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

procedure TPBMaintJobBagRCFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (Trim(DescrEdit.Text) <> '') and
    (Trim(SellValMemo.Text) <> '') and
    (Trim(CostValMemo.Text) <> '') and
    (VATDBLCB.KeyValue <> null) and
    (JobBagLine.Supplier <> 0);

  if Mode = jblDelete then
    OKbitBtn.Enabled := true;
end;

procedure TPBMaintJobBagRCFrm.FormActivate(Sender: TObject);
var
  sJobBag : string;
begin
  if not FActivated then
  begin
    sJobBag := IntToStr(JobBagLine.Parent.DbKey);
    if Mode = jblAdd then
      Caption := 'Add A New Revenue/Cost To Job Bag: ' + sJobBag;
    if Mode = jblChange then
      Caption := 'Change A Revenue/Cost In Job Bag: ' + sJobBag;
    if Mode = jblDelete then
      Caption := 'Delete A Revenue/Cost From Job Bag: ' + sJobBag;
    GetVATSQL.Close;
    GetVATSQL.Open;
    LoadData;
    DetsGroupBox.Enabled := (Mode <> jblDelete) and (Mode <> jblView);
    DelLabel.Visible := (Mode = jblDelete);
    OKBitBtn.Visible := not(Mode = jblView);
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagRCFrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
  JobBagLine.JBLineDescr := Trim(DescrEdit.Text);
  JobBagLine.JBQuantity := 1;
  JobBagLine.JBLineCost := StrToFloatDef(CostValMemo.Text, 0, FormatSettings);
  JobBagLine.JBLineSell := StrToFloatDef(SellValMemo.Text, 0, FormatSettings);
  if JobBagLine.JBLineSell - JobBagLine.JBLineCost >= 0 then
    JobBagLine.JBLineType := 'R'
  else
    JobBagLine.JBLineType := 'C';

  if VarIsEmpty(VATDBLCB.KeyValue) or VarIsNull(VATDBLCB.KeyValue) then
    JobBagLine.VatCode := -1
  else
    JobBagLine.VatCode := VATDBLCB.KeyValue;
  JobBagLine.CurrencyCode := 0;
  JobBagLine.ProductType := self.ProductType;
  JobBagLine.SupplierName := JobBagLine.parent.DataModule.GetSupplierName(JobBagLine.Supplier);
  JobBagLine.JBLineStatusText :=JobBagLine.parent.DataModule.GetSundryStatus(JobBagLine.parent.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);

  if Mode = jblAdd then
  begin
    JobBagLine.JBLine := JobBagLine.Parent.Lines.MaxLineNo + 1;
    JobBagLine.JBLineMode := 'N';
    JobBagLine.JBLineInvoiced := 'N';
    JobBagLine.Sequence := JobBagLine.Parent.Lines.Count + 1;
    JobBagLine.Parent.Lines.Add(JobBagLine);
  end
  else
  if Mode = jblDelete then
  begin
    inx := JobBagLine.Parent.Lines.IndexOf(JobBagLine.JBLine);
    try
      JobBagLine.DeletefromDB;
      JobBagLine.Parent.Lines.Delete(inx);
      MakeInactive := false;
    except
      messagedlg('This line has been invoiced previously, therefore the line will be flagged as deleted!', mtInformation, [mbOk], 0);
      JobBagLine.JBLineInactive := true;
      JobBagLine.JBLineStatusText := '*Deleted*';
      MakeInactive := true;
    end;
  end;

  ModalResult := mrOK;
end;

procedure TPBMaintJobBagRCFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagRCFrm.ValidateMoney(Sender: TObject);
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

procedure TPBMaintJobBagRCFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagRCFrm.QtyMemoExit(Sender: TObject);
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

function TPBMaintJobBagRCFrm.FormatQty(TempQty: string): string;
begin
  if Trim(TempQty) = '' then
    Result := ''
  else
  try
    begin
      Result := FormatFloat('######0', StrToFloatDef(TempQty, 0, FormatSettings));
      if StrToFloatDef(Result, 0, FormatSettings) < 0 then
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

procedure TPBMaintJobBagRCFrm.DescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintJobBagRCFrm.VATDBLCBClick(Sender: TObject);
begin
  JobBagLine.VatCode := VATDBLCB.KeyValue;
  CheckOK(Self);
end;

procedure TPBMaintJobBagRCFrm.SetJobBagLine(const Value: TJobBagLine);
begin
  FJobBagLine := Value;
end;

procedure TPBMaintJobBagRCFrm.SetMode(const Value: TJBLMode);
begin
  FMode := Value;
  SellValMemo.enabled := FMode <> jblRestrict;
  Vatdblcb.enabled := FMode <> jblRestrict;
end;

procedure TPBMaintJobBagRCFrm.LoadData;
begin
  if Mode <> jblAdd then
  begin
    DescrEdit.Text := JobBagLine.JBLineDescr;
    edtProductType.Text := JobBagLine.ProductTypeDesc;
    SupplierEdit.Text := JobBagLine.SupplierName;
    BranchEdit.Text := JobBagLine.BranchName;
    CostValMemo.Text := FormatMoneyto3DP(FloatToStr(JobBagLine.JBLineCost));
    SellValMemo.Text := FormatMoneyto3DP(FloatToStr(JobBagLine.JBLineSell));
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

procedure TPBMaintJobBagRCFrm.btnProdTypeClick(Sender: TObject);
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

end.
