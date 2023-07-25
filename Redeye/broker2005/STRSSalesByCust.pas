unit STRSSalesByCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, OleCtnrs, ComCtrls, Data.DB;

type
  TSTRSSalesByCustFrm = class(TForm)
    DetsDBGrid: TDBGrid;
    pnlCustProd: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    DateFromEdit: TEdit;
    DateFromBitBtn: TBitBtn;
    grpbxCust: TGroupBox;
    rdgrpCustAllorOne: TRadioGroup;
    CustNameEdit: TEdit;
    CustBitBtn: TBitBtn;
    grpbxProduct: TGroupBox;
    rdgrpPartsAllorOne: TRadioGroup;
    edtPart: TEdit;
    btbtnPart: TBitBtn;
    Label1: TLabel;
    DateToEdit: TEdit;
    DateTobtbtn: TBitBtn;
    btbtnFax: TBitBtn;
    btbtnEmail: TBitBtn;
    chkbxsortbydelivery: TCheckBox;
    chkbxShowGoodsValue: TCheckBox;
    chkbxPageBreak: TCheckBox;
    grpbxRep: TGroupBox;
    rdgrpRepAllorOne: TRadioGroup;
    edtRepName: TEdit;
    btbtnRep: TBitBtn;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    chkbxShowListPrices: TCheckBox;
    chkbxShowClientCodes: TCheckBox;
    procedure CustBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnPartClick(Sender: TObject);
    procedure DateFromBitBtnClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgrpCustAllorOneClick(Sender: TObject);
    procedure rdgrpPartsAllorOneClick(Sender: TObject);
    procedure DateTobtbtnClick(Sender: TObject);
    procedure btbtnEmailClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure chkbxsortbydeliveryClick(Sender: TObject);
    procedure rdgrpRepAllorOneClick(Sender: TObject);
    procedure btbtnRepClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    part: string;
    partDesc: string;
    cust: integer;
    branch: integer;
    rep: integer;
    procedure refresh;
  public
    { Public declarations }
  end;

var
  STRSSalesByCustFrm: TSTRSSalesByCustFrm;

implementation

uses STLUSordDM, DateSelV5, PBLUCust, STLUPrtByCustOrder, STRPSalesByCust, CCSemailHandler, PBSendFax,
      PBLURep, CCSCommon;

{$R *.DFM}

procedure TSTRSSalesByCustFrm.CustBitBtnClick(Sender: TObject);
var
  PBLUCustFrm: TPBLUCustFrm;
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := True ;
    PBLUCustFrm.bSel_Branch := True ;
    PBLUCustFrm.SelCode := self.cust;
    PBLUCustFrm.SelBranch := self.branch;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
    begin
      self.cust := PBLUCustFrm.SelCode;
      self.CustNameEdit.Text :=
        PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      self.branch := PBLUCustFrm.SelBranch;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  if cust <> -1 then
    Self.btbtnPart.Enabled := true;

  self.refresh;
end;

procedure TSTRSSalesByCustFrm.FormCreate(Sender: TObject);
begin
  cust := -1;
  branch :=  -1;
  part := '';
  partDesc := '';


  self.DateFromEdit.Text := DateToStr(IncMonth(Date(), -1));
  self.DateToEdit.Text := DateToStr(Date());

  dmLookupSord := TdmLookupSord.Create(Self);

  dmLookupSord.dtsDetails.DataSet := dmLookupSord.qryProdSalesbyCust;
end;

procedure TSTRSSalesByCustFrm.FormDestroy(Sender: TObject);
begin
  dmLookupSord.Free;
end;

procedure TSTRSSalesByCustFrm.btbtnPartClick(Sender: TObject);
var
  PartLUFrm: TSTLUPrtByCustOrderFrm;
begin
  PartLUFrm := TSTLUPrtByCustOrderFrm.Create(Self) ;
  try
    PartLUFrm.qryPartsOnSOs.Close;
    PartLUFrm.qryPartsOnSOs.ParamByName('cust').asInteger := self.cust;
    PartLUFrm.qryPartsOnSOs.ParamByName('dateFrom').asDateTime :=
      StrToDate(self.DateFromEdit.Text);
    PartLUFrm.qryPartsOnSOs.Open;

    PartLUFrm.ShowModal ;
    If PartLUFrm.bOK = True then
      begin
        self.part := PartLUFrm.sCode;
        self.partDesc := PartLUFrm.sCode + ': ' +PartLUFrm.sCodeDescr;
        edtPart.Text := self.partDesc;
      end;
  finally
    PartLUFrm.Free ;
  end;
  self.refresh;
end;

procedure TSTRSSalesByCustFrm.refresh;
begin
  with dmLookupSord.qryProdSalesbyCust do
  begin
    sql.clear;
    sql.text := dmLookupSord.dummySalesbyCust.sql.text;
    close;
    if rdgrpRepAllorOne.ItemIndex = 0 then
    begin
      paramByName('rep').asInteger := -99;
    end
    else
    begin
      paramByName('rep').asInteger := self.rep;
    end;

    if rdgrpCustAllorOne.ItemIndex = 0 then
    begin
      paramByName('cust').asInteger := -99;
    end
    else
    begin
      paramByName('cust').asInteger := self.cust;
    end;

    if rdgrpPartsAllorOne.ItemIndex = 0 then
    begin
      paramByName('part').asString := 'ALL';
    end
    else
    begin
      paramByName('part').asString := self.part;
    end;

    paramByName('dateFrom').asDateTime := StrToDate(self.DateFromEdit.Text);
    paramByName('dateTo').asDateTime := StrToDate(self.DateToEdit.Text);
    if not chkbxsortbydelivery.checked then
      sql.Add(' ORDER BY rep.name, Customer.Name, Sales_order.sales_order, sales_order_line.sales_order_line_no')
    else
      sql.Add(' ORDER BY rep.name, DeliveryBranchName, Sales_order.sales_order, sales_order_line.sales_order_line_no');
    open;
  end;

  btbtnFax.Enabled := (rdgrpCustAllorOne.ItemIndex = 1) and
                      (dmLookupSord.dtsDetails.dataset.RecordCount > 0);
  btbtnEmail.Enabled := (rdgrpCustAllorOne.ItemIndex = 1) and
                      (dmLookupSord.dtsDetails.dataset.RecordCount > 0);

  if dmLookupSord.dtsDetails.dataset.RecordCount > 0 then
  begin
    PreviewBitBtn.Enabled := true;
    PrintBitBtn.Enabled := true;
    btnExcel.enabled := true
  end;
end;

procedure TSTRSSalesByCustFrm.DateFromBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateFromEdit.Text);
    DateSelV5Form.ShowModal;
    DateFromEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  self.refresh;
end;

procedure TSTRSSalesByCustFrm.PreviewBitBtnClick(Sender: TObject);
var
  STRPSalesByCustFrm: TSTRPSalesByCustFrm;
begin
  STRPSalesByCustFrm := TSTRPSalesByCustFrm.Create(Self);


  try
    if chkbxsortbyDelivery.checked then
    begin
      STRPSalesByCustFrm.TotalbyDelivery := true;
    end
    else
    begin
      STRPSalesByCustFrm.TotalbyOrder := true;
    end;

    STRPSalesByCustFrm.qrlblTitle.Caption :=
       STRPSalesByCustFrm.qrlblTitle.Caption + DateToStr(Date());
    STRPSalesByCustFrm.qrlblDateRange.caption :=
       STRPSalesByCustFrm.qrlblDateRange.caption + self.DateFromEdit.Text +
       ' To: '+ self.DateToEdit.Text;

    STRPSalesByCustFrm.ShowGoodsValue := chkbxShowGoodsValue.checked;
    STRPSalesByCustFrm.pagePerCust := chkbxPageBreak.checked;

    DmLookupSOrd.qrySalesSerialNos.close;
    DmLookupSOrd.qrySalesSerialNos.Open;
    STRPSalesByCustFrm.qckrpSalesByProd.Preview;
  finally
    STRPSalesByCustFrm.Free;
  end;
end;

procedure TSTRSSalesByCustFrm.PrintBitBtnClick(Sender: TObject);
var
  STRPSalesByCustFrm: TSTRPSalesByCustFrm;
begin
  STRPSalesByCustFrm := TSTRPSalesByCustFrm.Create(Self);
  try
    if chkbxsortbyDelivery.checked then
      STRPSalesByCustFrm.TotalbyDelivery := true
    else
      STRPSalesByCustFrm.TotalbyOrder := true;

    STRPSalesByCustFrm.qrlblTitle.Caption :=
       STRPSalesByCustFrm.qrlblTitle.Caption + DateToStr(Date());
    STRPSalesByCustFrm.qrlblDateRange.caption :=
       STRPSalesByCustFrm.qrlblDateRange.caption + self.DateFromEdit.Text +
       ' To: '+ self.DateToEdit.Text;

    STRPSalesByCustFrm.ShowGoodsValue := chkbxShowGoodsValue.checked;
    STRPSalesByCustFrm.pagePerCust := chkbxPageBreak.checked;

    DmLookupSOrd.qrySalesSerialNos.close;
    DmLookupSOrd.qrySalesSerialNos.Open;

    STRPSalesByCustFrm.qckrpSalesByProd.PrinterSetup;
    STRPSalesByCustFrm.qckrpSalesByProd.Print;
  finally
    STRPSalesByCustFrm.Free;
  end;
end;

procedure TSTRSSalesByCustFrm.FormShow(Sender: TObject);
begin
  btbtnPart.Enabled := false;
  PreviewBitBtn.Enabled := false;
  PrintBitBtn.Enabled := false;
  btnExcel.Enabled := false;
  self.refresh;
end;

procedure TSTRSSalesByCustFrm.rdgrpCustAllorOneClick(Sender: TObject);
begin
  if rdgrpCustAllorOne.ItemIndex = 0 then
  begin
    CustNameEdit.visible := false;
    CustBitBtn.visible := false;
    DetsDBGrid.Columns[0].visible := true;
    chkbxsortbydelivery.visible := false;
    chkbxsortbydelivery.checked := false;
    self.refresh;
  end
  else
  begin
    CustNameEdit.visible := true;
    CustBitBtn.visible := true;
    chkbxsortbydelivery.visible := true;
    if CustNameEdit.text = '' then
    begin
      CustBitBtnClick(CustBitBtn);
    end
    else
    begin
      self.refresh;
    end;
    DetsDBGrid.Columns[0].visible := false;
  end;
end;

procedure TSTRSSalesByCustFrm.rdgrpPartsAllorOneClick(Sender: TObject);
begin
  if rdgrpPartsAllorOne.ItemIndex = 0 then
  begin
    edtPart.visible := false;
    btbtnPart.visible := false;
    DetsDBGrid.Columns[1].visible := true;
    DetsDBGrid.Columns[2].visible := true;
    self.refresh;
  end
  else
  begin
    edtPart.visible := true;
    btbtnPart.visible := true;
    if edtPart.text = '' then
    begin
      btbtnPartClick(edtPart);
    end
    else
    begin
      self.refresh;
    end;
    DetsDBGrid.Columns[1].visible := false;
    DetsDBGrid.Columns[2].visible := false;
  end;
end;

procedure TSTRSSalesByCustFrm.DateTobtbtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateToEdit.Text);
    DateSelV5Form.ShowModal;
    DateToEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  self.refresh;
end;

procedure TSTRSSalesByCustFrm.btbtnEmailClick(Sender: TObject);
var
  STRPSalesByCustFrm: TSTRPSalesByCustFrm;
  emailHandler: TemailHandler;
begin
  STRPSalesByCustFrm := TSTRPSalesByCustFrm.Create(Self);
  emailHandler := TemailHandler.Create(self);

  try
    if chkbxsortbyDelivery.checked then
      STRPSalesByCustFrm.TotalbyDelivery := true
    else
      STRPSalesByCustFrm.TotalbyOrder := true;

    STRPSalesByCustFrm.qrlblTitle.Caption :=
       STRPSalesByCustFrm.qrlblTitle.Caption + DateToStr(Date());
    STRPSalesByCustFrm.qrlblDateRange.caption :=
       STRPSalesByCustFrm.qrlblDateRange.caption + self.DateFromEdit.Text +
       ' To: '+ self.DateToEdit.Text;

    DmLookupSOrd.qrySalesSerialNos.close;
    DmLookupSOrd.qrySalesSerialNos.Open;
    emailHandler.email(STRPSalesByCustFrm.qckrpSalesByProd, self.cust, self.branch, 'SalesReport');
  finally
    STRPSalesByCustFrm.Free;
    emailHandler.Free;
  end;
end;

procedure TSTRSSalesByCustFrm.DateFromEditExit(Sender: TObject);
begin
  try
    StrToDate(dateFromEdit.text);
  except
    MessageDlg('Invalid Date', mtError, [mbOk], 0);
    DateFromEdit.SetFocus;
    exit;
  end;

  self.refresh;
end;

procedure TSTRSSalesByCustFrm.DateToEditExit(Sender: TObject);
begin
  try
    StrToDate(dateToEdit.text);
  except
    MessageDlg('Invalid Date', mtError, [mbOk], 0);
    DateFromEdit.SetFocus;
    exit;
  end;

  self.refresh;
end;

procedure TSTRSSalesByCustFrm.chkbxsortbydeliveryClick(Sender: TObject);
begin
  self.refresh;
end;

procedure TSTRSSalesByCustFrm.rdgrpRepAllorOneClick(Sender: TObject);
begin
  if rdgrpRepAllorOne.ItemIndex = 0 then
  begin
    edtRepName.visible := false;
    btbtnRep.visible := false;
//    DetsDBGrid.Columns[0].visible := true;
    self.refresh;
  end
  else
  begin
    edtRepName.visible := true;
    btbtnRep.visible := true;
    if edtRepName.text = '' then
    begin
      btbtnRepClick(btbtnRep);
    end
    else
    begin
      self.refresh;
    end;
//    DetsDBGrid.Columns[0].visible := false;
  end;
end;

procedure TSTRSSalesByCustFrm.btbtnRepClick(Sender: TObject);
var
  PBLURepFrm: TPBLURepFrm;
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_LookUp := True ;
    PBLURepFrm.bAllow_Upd := True ;
    PBLURepFrm.SelCode := self.rep;
    PBLURepFrm.ShowModal;
    If PBLURepFrm.Selected then
    begin
      self.rep := PBLURepFrm.SelCode;
      self.edtRepName.Text := PBLURepFrm.SelName;
    end;
  finally
    PBLURepFrm.Free;
  end;

  self.refresh;
end;

procedure TSTRSSalesByCustFrm.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
  STRPSalesByCustFrm: TSTRPSalesByCustFrm;
begin
  STRPSalesByCustFrm := TSTRPSalesByCustFrm.Create(Self);
  try
    if chkbxsortbyDelivery.checked then
      STRPSalesByCustFrm.TotalbyDelivery := true
    else
      STRPSalesByCustFrm.TotalbyOrder := true;

    STRPSalesByCustFrm.qrlblTitle.Caption :=
       STRPSalesByCustFrm.qrlblTitle.Caption + DateToStr(Date());
    STRPSalesByCustFrm.qrlblDateRange.caption :=
       STRPSalesByCustFrm.qrlblDateRange.caption + self.DateFromEdit.Text +
       ' To: '+ self.DateToEdit.Text;

    DmLookupSOrd.qrySalesSerialNos.close;
    DmLookupSOrd.qrySalesSerialNos.Open;

    STRPSalesByCustFrm.ShowGoodsValue := chkbxShowGoodsValue.checked;
    STRPSalesByCustFrm.ShowListPrices := chkbxShowListPrices.checked;
    STRPSalesByCustFrm.ShowClientCodes := chkbxShowClientCodes.checked;

    self.prgbrExport.Max := DmLookupSOrd.dtsDetails.DataSet.RecordCount;
    tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.BringToFront;
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    STRPSalesByCustFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;
    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    STRPSalesByCustFrm.Free;
  end;
end;

end.
