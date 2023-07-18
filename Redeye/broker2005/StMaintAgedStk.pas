unit StMaintAgedStk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, Db, DBTables, Grids, DBGrids, Buttons, ComCtrls,
  StdCtrls, CCSCommon;

type
  TStMaintAgedStkFrm = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    grpbxRange: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    edtNoOfDays: TEdit;
    UpDown1: TUpDown;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label5: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    DetsDBGrid: TDBGrid;
    DataSource1: TDataSource;
    qrySelUnPaidAgedStk: TQuery;
    ppmnGrid: TPopupMenu;
    SetReadyforInvoicng1: TMenuItem;
    qryUpdPOLine: TQuery;
    tmrGridRefresh: TTimer;
    qrySelUnPaidAgedStkPart: TStringField;
    qrySelUnPaidAgedStkDescription: TStringField;
    qrySelUnPaidAgedStkSales_Value: TCurrencyField;
    qrySelUnPaidAgedStkSell_Pack_Size: TIntegerField;
    qrySelUnPaidAgedStkPart_Store_Name: TStringField;
    qrySelUnPaidAgedStkNot_In_Use: TStringField;
    qrySelUnPaidAgedStkCustName: TStringField;
    qrySelUnPaidAgedStkBin: TStringField;
    qrySelUnPaidAgedStkLot: TStringField;
    qrySelUnPaidAgedStkStock_Ref: TStringField;
    qrySelUnPaidAgedStkQuantity: TIntegerField;
    qrySelUnPaidAgedStkPack_Size: TIntegerField;
    qrySelUnPaidAgedStkStock_Value: TCurrencyField;
    qrySelUnPaidAgedStkPart_Store: TIntegerField;
    qrySelUnPaidAgedStkdate_received: TDateTimeField;
    ResetGrid1: TMenuItem;
    chkbxBranch: TCheckBox;
    qrySelPOrd: TQuery;
    qryUpdStoreStock: TQuery;
    qrySelUnPaidAgedStkstore_stock: TIntegerField;
    pnlButtons: TPanel;
    CloseBitBtn: TBitBtn;
    btbtnOKInvoice: TBitBtn;
    procedure edtPartFromChange(Sender: TObject);
    procedure edtPartToChange(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure edtNoOfDaysChange(Sender: TObject);
    procedure edtNoOfDaysKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tmrGridRefreshTimer(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure SetReadyforInvoicng1Click(Sender: TObject);
    procedure ppmnGridPopup(Sender: TObject);
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure chkbxBranchClick(Sender: TObject);
  private
    { Private declarations }
    SelCustomer, SelCustBranch: Integer;
    SelCustName: string;
    dontSaveLayout: boolean;
    procedure RefreshGrid;
    procedure DispCustBranch(Sender: TObject);
  public
    { Public declarations }
  end;

var
  StMaintAgedStkFrm: TStMaintAgedStkFrm;

implementation

uses pbLUCust, STPrtMnt, pbMainMenu;

{$R *.DFM}

procedure TStMaintAgedStkFrm.edtPartFromChange(Sender: TObject);
begin
  self.tmrGridRefresh.Enabled := false;
  if (self.edtPartTo.Text = '') then
    self.edtPartTo.Text := self.edtPartFrom.Text;

  if self.edtPartFrom.Text < self.edtPartTo.Text then
    self.tmrGridRefresh.Enabled := true;
end;

procedure TStMaintAgedStkFrm.RefreshGrid;
begin
  with qrySelUnPaidAgedStk do
  begin
    Close;
    ParamByName('theDate').AsDateTime := Date();
    if edtNoOfDays.Text <> '' then
      ParamByName('noOfDays').AsInteger := StrToInt(edtNoOfDays.Text)
    else
      ParamByName('noOfDays').AsInteger := 0;

    ParamByName('PartFrom').AsString := edtPartFrom.Text;
    ParamByName('PartTo').AsString := edtPartTo.Text;

    if custradiogroup.ItemIndex = 0 then
    begin
      ParamByName('Customer').AsInteger := 0;
      ParamByName('CustBranch').AsInteger := 0;
    end
    else
    begin
      ParamByName('Customer').AsInteger := SelCustomer;
      ParamByName('CustBranch').AsInteger:= SelCustBranch;
    end;     
    Open;

    self.btbtnOKInvoice.Enabled := (recordCount > 0);
  end;
end;

procedure TStMaintAgedStkFrm.edtPartToChange(Sender: TObject);
begin
  self.tmrGridRefresh.Enabled := false;
  if (self.edtPartFrom.Text = '') then
    self.edtPartFrom.Text := self.edtPartTo.Text;

  if self.edtPartFrom.Text < self.edtPartTo.Text then
    self.tmrGridRefresh.Enabled := true;
end;

procedure TStMaintAgedStkFrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
 begin
   CustGrpBox.Visible := False;
   SelCustomer := 0;
   SelCustBranch := 0;
   SelCustName := '';
 end
 else
 begin
   CustGrpBox.Visible := True;
 end;
 self.RefreshGrid;
end;

procedure TStMaintAgedStkFrm.CustLuSpeedButtonClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.ShowModal;
  begin
    SelCustomer := pbLUCustFrm.SelCode;
    if self.chkbxBranch.Checked then
    begin
      SelCustBranch := pbLUCustFrm.SelBranch;
      SelCustName := pbLUCustFrm.SelName+'\'+pbLUCustFrm.SelBranchName;
    end
    else
    begin
      SelCustBranch := -1;
      SelCustName := pbLUCustFrm.SelName;
    end;
    DispCustBranch(Self);
  end;
  pbLUCustFrm.Free;
  
  self.RefreshGrid;
end;

procedure TStMaintAgedStkFrm.edtNoOfDaysChange(Sender: TObject);
begin
  self.tmrGridRefresh.Enabled := false;
  self.tmrGridRefresh.Enabled := true;
end;

procedure TStMaintAgedStkFrm.edtNoOfDaysKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    edtPartFrom.setFocus();
  end;
end;

procedure TStMaintAgedStkFrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TStMaintAgedStkFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not self.dontSaveLayout then
  begin
    CCSCommon.SaveDBGridCols('', 'MaintAgedStockLU Col Order', frmPBMainMenu.AppIniFile, self.DetsDBGrid);
  end;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TStMaintAgedStkFrm.FormCreate(Sender: TObject);
begin
  CCSCommon.SetDBGridCols('', 'MaintAgedStockLU Col Order', frmPBMainMenu.AppIniFile, self.DetsDBGrid);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TStMaintAgedStkFrm.tmrGridRefreshTimer(Sender: TObject);
begin
  self.tmrGridRefresh.Enabled := false;
  self.RefreshGrid;
end;

procedure TStMaintAgedStkFrm.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('MaintAgedStockLU Col Order', frmPBMainMenu.AppIniFile);

  Self.dontSaveLayout := true;
  Self.Close;
end;

procedure TStMaintAgedStkFrm.SetReadyforInvoicng1Click(Sender: TObject);
var
  poNum: double;
  dlgStr: string;
  inx: integer;
begin
  try
    poNum := self.qrySelUnPaidAgedStkStock_Ref.asFloat;
    self.qrySelPOrd.close;
    self.qrySelPOrd.ParamByName('PO').asFloat := poNum;
    self.qrySelPOrd.Open;
    if self.qrySelPOrd.RecordCount = 0 then
    begin
      messageDlg('This stock item is not associated with a specific Purchase Order.', mtInformation, [mbOK], 0);
      self.qrySelPOrd.close;
      exit;
    end;
  except
    messageDlg('This stock item is not associated with a specific Purchase Order.', mtInformation, [mbOK], 0);
    self.qrySelPOrd.close;
    exit;
  end;

  if self.DetsDBGrid.SelectedRows.Count < 2 then
  begin
    dlgStr := 'Production Order  '+FloatToStr(poNum)+' will be flagged to be Invoiced Upfront.'
      +#10#13+'Do you want to continue?'
  end
  else
  begin
    dlgStr := 'The selected Production Orders will be flagged to be Invoiced Upfront.'
      +#10#13+'Do you want to continue?';
  end;

  if messageDlg(dlgStr, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    //loop thru selected orders
    if DetsDBGrid.SelectedRows.Count > 0 then
    with DetsDBGrid.DataSource.DataSet do
      for inx:=0 to DetsDBGrid.SelectedRows.Count-1 do
      begin
        GotoBookmark(TBookmark(DetsDBGrid.SelectedRows.Items[inx]));
        poNum := self.qrySelUnPaidAgedStkStock_Ref.asFloat;

        qryUpdPOLine.ParamByName('PO').asFloat := poNum;
        qryUpdPOLine.ParamByName('Line').asInteger := 1;
        qryUpdPOLine.ExecSQL;

        qryUpdStoreStock.ParamByName('store_stock').asFloat := qrySelUnPaidAgedStkStore_Stock.AsInteger;
        qryUpdStoreStock.ExecSQL;
      end;

    qrySelUnPaidAgedStk.close;
    qrySelUnPaidAgedStk.open;
  end;
end;

procedure TStMaintAgedStkFrm.ppmnGridPopup(Sender: TObject);
begin
  SetReadyforInvoicng1.enabled := (qrySelUnPaidAgedStk.RecordCount > 0);
end;

procedure TStMaintAgedStkFrm.btbtnPartFromClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartFrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TStMaintAgedStkFrm.btbtnPartToClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TStMaintAgedStkFrm.chkbxBranchClick(Sender: TObject);
begin
  if self.chkbxBranch.Checked then
  begin
    if self.SelCustBranch = -1 then
    begin
      self.SelCustBranch := 0;
      CustEdit.Text := custEdit.Text + '\Head Office';
      self.RefreshGrid;
    end
    else
    begin
      self.RefreshGrid;
    end;
  end
  else
  begin
    self.SelCustBranch := -1;
    self.RefreshGrid;
  end;
end;

end.
