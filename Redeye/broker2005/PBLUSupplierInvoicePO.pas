unit PBLUSupplierInvoicePO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls,
  ComCtrls, CCSCommon, PBSupplierInvoiceDM, Variants, IniFiles;

type
  TPBLUSupplierInvoicePOFrm = class(TForm)
    SearchTimer: TTimer;
    stBrDetails: TStatusBar;
    Panel3: TPanel;
    Panel1: TPanel;
    CustomerGroupBox: TGroupBox;
    Label1: TLabel;
    edtSupplierName: TEdit;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    dbgdetails: TDBGrid;
    GroupBox1: TGroupBox;
    edtPONumber: TEdit;
    rdgrpOrders: TRadioGroup;
    chkbxIncZeroValue: TCheckBox;
    btnSupplier: TBitBtn;
    btnExcel: TBitBtn;
    bitbtnPriceUnitClear: TBitBtn;
    btnSweep: TBitBtn;
    GroupBox3: TGroupBox;
    edtJBNumber: TEdit;
    btnPO: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DrawField(const Value: string; const Rect: TRect;
      vCanvas: TCanvas; vFont: TFont; vAlignment: TAlignment);
    procedure edtSupplierNameChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure dbgdetailsDblClick(Sender: TObject);
    procedure edtPONumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgdetailsCellClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure chkAllOrdersClick(Sender: TObject);
    procedure rdgrpOrdersClick(Sender: TObject);
    procedure chkbxIncZeroValueClick(Sender: TObject);
    procedure dbgdetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure edtSupplierNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure bitbtnPriceUnitClearClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure edtJBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnPOClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FSuppInvoiceLine: TSuppInvoiceLine;
    FMode: string;
    FSuppInvoiceChg: TSuppInvoiceChg;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetPurchaseOrderEdit(Dataset: TDataset);
    procedure SetSuppInvoiceLine(const Value: TSuppInvoiceLine);
    procedure SetMode(const Value: string);
    procedure AddSuppInvoiceCharges(aInvoice: TSuppInvoice);
    procedure CreateSuppInvoice;
    procedure CreateSuppInvoiceLine;
    procedure SetSuppInvoiceChg(const Value: TSuppInvoiceChg);
    procedure CallMaintPOScreen(sTempFuncMode: Char);
  public
    iSupplier, iBranch: integer;
    sSupplierName, sBranchName: string;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Mode: string read FMode write SetMode;
    property SuppInvoiceChg: TSuppInvoiceChg read FSuppInvoiceChg write SetSuppInvoiceChg;
    property SuppInvoiceLine: TSuppInvoiceLine read FSuppInvoiceLine write SetSuppInvoiceLine;
  end;

var
  PBLUSupplierInvoicePOFrm: TPBLUSupplierInvoicePOFrm;
  iSelection1, iSelection2: Integer;
  rLastOrder: real;

implementation

uses UITypes, PBMaintSuppInvoice, PBLUSupp, pbMainMenu, PBMaintPOrd,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

{$R *.DFM}

procedure TPBLUSupplierInvoicePOFrm.FormShow(Sender: TObject);
begin
//  edtSupplierName.Text := sSupplierName;
  dmSupplierInvoice.SupplierName := edtSupplierName.text;
  dmSupplierInvoice.refreshPOdata;
end;

procedure TPBLUSupplierInvoicePOFrm.DrawField(const Value: string; const Rect: TRect;
  vCanvas: TCanvas; vFont: TFont; vAlignment: TAlignment);
var
  X: Integer;
begin
  X := 0;
  vCanvas.Font := vFont;
  vCanvas.Brush.Color := clhighlight;
  vCanvas.Font.Color := clwhite;
  vCanvas.Font.Style := vCanvas.Font.Style;
  case vAlignment of
    taRightJustify:
      begin
        SetTextAlign(vCanvas.Handle, TA_RIGHT);
        X := Rect.Right - 2;
      end;
    taLeftJustify:
      begin
        SetTextAlign(vCanvas.Handle, TA_LEFT);
        X := Rect.Left + 2;
      end;
    taCenter:
      begin
        SetTextAlign(vCanvas.Handle, TA_CENTER);
        X := (Rect.Right + Rect.Left) div 2;
      end;
  end;
  vCanvas.TextRect(Rect, X, Rect.Top + 2, Value);
  SetTextAlign(vCanvas.Handle, TA_LEFT);
end;

procedure TPBLUSupplierInvoicePOFrm.edtSupplierNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSupplierInvoicePOFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSupplierInvoicePOFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSupplierInvoice.SupplierName := edtSupplierName.text;
  dmSupplierInvoice.RefreshPOData;
end;

procedure TPBLUSupplierInvoicePOFrm.dbgdetailsDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSupplierInvoicePOFrm.edtPONumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    dbgDetails.SelectedRows.CurrentRowSelected := false ;
    if dbgDetails.Datasource.Dataset.Locate('Purchase_Order;Line',VarArrayOf([edtPONumber.text,'1']), [loPartialKey]) then
      begin
        dbgDetails.SelectedRows.CurrentRowSelected := True ;
        btnSelectClick(self);
      end
    else
      ShowMessage('Purchase Order: '+ edtPONumber.Text + ' does not exist in the current selection.');
  end;

end;

procedure TPBLUSupplierInvoicePOFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSupplierInvoice do
  begin
    btnSweep.enabled := (dsPOLine.dataset.recordcount > 0);
    btnSelect.enabled := (dsPOLine.dataset.recordcount > 0);
    btnExcel.enabled := (dsPOLine.dataset.recordcount > 0);
    btnPO.enabled := (dsPOLine.dataset.recordcount > 0);
    edtPONumber.Text := dbgDetails.Datasource.dataset.fieldbyname('purchase_order').asstring;
    edtJBNumber.Text := dbgDetails.Datasource.dataset.fieldbyname('Job_Bag').asstring;
    stBrDetails.panels[0].text := inttostr(dsPOLine.dataset.recordcount) + ' purchase orders listed';
  end;
end;

procedure TPBLUSupplierInvoicePOFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  dmSupplierInvoice := TdmSupplierInvoice.Create(Self);

  dbgDetails.Datasource := dmSupplierInvoice.dsPOLine;
  dmSupplierInvoice.dsPOLine.OnDataChange := SetButtons;
  dmSupplierInvoice.qryPOAllLines.AfterScroll := SetPurchaseOrderEdit;
  dmSupplierInvoice.qryPOsSalesInvd.AfterScroll := SetPurchaseOrderEdit;

(*
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
      begin
        iSupplier := ReadInteger('Redeye', 'Purchase Invoice Supplier Code', 0);
        sSupplierName := Readstring('Redeye', 'Purchase Invoice Supplier Name', '');
      end;
  finally
    IniFile.Free;
  end;
*)

  iSupplier := 0;
  iBranch := 0;

  if iSupplier <> 0 then
    dbgDetails.options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect]
  else
    dbgDetails.options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

  CCSCommon.SetDBGridCols('', 'SupplierInvoicePOLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUSupplierInvoicePOFrm.SetPurchaseOrderEdit(Dataset: TDataset);
begin
(*  if (Dataset.recordcount > 0) then
    begin
       dbgDetails.Datasource := dmSupplierInvoice.dsPOLine;
      try
        edtPONumber.Text := floatToStr(Dataset.FieldByName('Purchase_Order').asfloat);
      except
        edtPONumber.Text := '';
      end;
    end
  else
    dbgDetails.Datasource := dmSupplierInvoice.dsDummy;
*)
end;

procedure TPBLUSupplierInvoicePOFrm.btnSelectClick(Sender: TObject);
var
  aInvoice : TSuppInvoice;
  frm: TPBMaintSuppInvoicefrm;
  icount: integer;
begin
  if iSupplier = 0 then
    begin
      if dbgDetails.Datasource.Dataset.Locate('Purchase_order;Line',VarArrayOf([edtPONumber.text,'1']), [loPartialKey]) then
        begin
          if dbgDetails.Datasource.Dataset.fieldbyname('On_Hold').asstring = 'Y' then
            begin
              messagedlg('This purchase order is On Hold, the supplier invoice cannot be added', mtError, [mbOk], 0);
              exit;
            end;
          if dbgDetails.Datasource.Dataset.fieldbyname('Needs_Authorising').asstring = 'Y' then
            begin
              messagedlg('This purchase order has not been authorised, the supplier invoice cannot be added', mtError, [mbOk], 0);
              exit;
            end;
          if MessageDlg('Create a Supplier invoice for the selected order?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes
            then Exit;
          if Mode = 'A' then
            begin
              CreateSuppInvoiceLine;
              AddSuppInvoiceCharges(SuppInvoiceLine.Parent);
              ModalResult := mrok;
            end
          else
            CreateSuppInvoice;
        end
      else
        ShowMessage('Purchase Order: '+ edtPONumber.Text + ' does not exist in the current selection.');
    end
  else
    begin
      aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
      try
        for icount := 0 to (dbgdetails.SelectedRows.Count - 1) do
          begin
            dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgdetails.SelectedRows[iCount])) ;
            if icount = 0 then
              begin
                dmSupplierInvoice.PONumber := dbgdetails.DataSource.dataset.fieldbyname('Purchase_Order').asinteger;
                dmSupplierInvoice.Line := dbgDetails.Datasource.dataset.fieldbyname('Line').asinteger;
                dmSupplierInvoice.InvoiceQty := dbgDetails.Datasource.dataset.fieldbyname('Invoice_Quantity').asinteger;
                aInvoice.LoadFromPO;
              end
            else
              begin
                SuppInvoiceLine := TSuppInvoiceLine.Create(aInvoice);
                try
                  CreateSuppInvoiceLine;
                  dmSupplierInvoice.PONumber := dbgdetails.DataSource.dataset.fieldbyname('Purchase_Order').asinteger;
                  dmSupplierInvoice.Line := dbgDetails.Datasource.dataset.fieldbyname('Line').asinteger;
                finally
                end;

                AddSuppInvoiceCharges(aInvoice);
              end;
          end;
        {Update the Goods and Vat Values}
        aInvoice.GoodsValue := aInvoice.TotalGoods;
        aInvoice.VATValue := aInvoice.TotalVAT;

        {Display the Maintenance screen}
        Frm := TPBMaintSuppInvoicefrm.Create(Self);
        try
          Frm.Mode := piRaise;
          Frm.SupplierInvoice := aInvoice;
          Frm.ShowModal;
          if Frm.ModalResult = idOK then
            ModalResult := idok;
        finally
          Frm.Free;
        end;
      finally
        aInvoice.Free;
      end;
    end;
end;


procedure TPBLUSupplierInvoicePOFrm.AddSuppInvoiceCharges(aInvoice: TSuppInvoice);
begin
  with dmSupplierInvoice.qryPOLineChgs do
    begin
      Close;
      ParamByName('Purchase_Order').Asfloat := dmSupplierInvoice.PONumber;
      ParamByName('Line').Asinteger := dmSupplierInvoice.Line;
      Open;
      while not(EOF) do
        begin
          SuppInvoiceChg := TSuppInvoiceChg.Create(aInvoice);
          SuppInvoiceChg.SICharge := SuppInvoiceChg.Parent.Charges.Count + 1;
          SuppInvoiceChg.Details := fieldbyname('Details').asstring;
          SuppInvoiceChg.Amount := fieldbyname('Amount').asfloat;
          SuppInvoiceChg.Nominal := dmSupplierInvoice.GetDefPurchNominal;
          SuppInvoiceChg.VATCode := fieldbyname('Vat_Code').asinteger;
          SuppInvoiceChg.VATRate := fieldbyname('Vat_Rate').asfloat;
          SuppInvoiceChg.PONumber := fieldbyname('Purchase_Order').asfloat;
          SuppInvoiceChg.POLine := fieldbyname('Line').asinteger;
          SuppInvoiceChg.Parent.Charges.Add(SuppInvoiceChg);
         Next;
        end;
      Close;
    end;
end;

procedure TPBLUSupplierInvoicePOFrm.CreateSuppInvoiceLine;
var
  defnom : String;
begin
  with SuppInvoiceLine, dbgDetails.Datasource.dataset do
    begin
      SILine := Parent.Lines.Count + 1;
      Description := fieldbyname('Suppliers_Desc').asstring;
      PONumber := FieldByName('Purchase_order').Asfloat;
      POLine := FieldByName('Line').Asinteger;
      Quantity := fieldbyname('Invoice_Quantity').asfloat;
      OriginalQty := 0;
      GoodsValue := FieldByName('Order_Price').Asfloat;
      PriceUnit := FieldByName('Order_Unit').Asinteger;
      PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      VatCode := FieldByName('Supplier_VAT_Code').Asinteger;
      VatRate := FieldByName('VAT_Rate').Asfloat;
      DefNom := dmSupplierInvoice.GetDefNominalLevel;
      If DefNom = 'PRODTYPE' then
        Nominal := dmSupplierInvoice.GetDefProdTypNom(FieldByName('Product_Type').AsInteger)
      else
        Nominal := dmSupplierInvoice.GetDefPurchNominal;
      TotalOrderValue := parent.datamodule.GetTotalOrderValue(PONumber,POLine);
      PackQty := 1;
      JBNumber := 0;
      JBLine := 0;
      PurchNumber := 0;
      PurchLine := 0;
      SuppInvoiceLine.Parent.Lines.Add(SuppInvoiceLine);
    end;
end;

procedure TPBLUSupplierInvoicePOFrm.CreateSuppInvoice;
var
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
begin
  try
    aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
    try
      dmSupplierInvoice.PONumber := dbgDetails.Datasource.dataset.fieldbyname('Purchase_Order').asfloat;
      dmSupplierInvoice.Line := dbgDetails.Datasource.dataset.fieldbyname('Line').asinteger;
      dmSupplierInvoice.InvoiceQty := dbgDetails.Datasource.dataset.fieldbyname('Invoice_Quantity').asinteger;

      aInvoice.LoadFromPO;
      Frm := TPBMaintSuppInvoicefrm.Create(Self);
      try
        Frm.Mode := piRaise;
        Frm.SupplierInvoice := aInvoice;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          ModalResult := idok;
      finally
        Frm.Free;
      end;
    finally
      aInvoice.Free;
    end;
  finally
  end;
end;

procedure TPBLUSupplierInvoicePOFrm.dbgdetailsCellClick(Column: TColumn);
begin
  with dbgDetails do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

procedure TPBLUSupplierInvoicePOFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    WriteString('Redeye', 'Purchase Invoice Supplier Code', inttostr(iSupplier));
    WriteString('Redeye', 'Purchase Invoice Supplier Name', sSupplierName);
  finally
    IniFile.Free;
  end;

  dmSupplierInvoice.free;
  CCSCommon.SaveDBGridCols('', 'SupplierInvoicePOLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBLUSupplierInvoicePOFrm.SetSuppInvoiceLine(
  const Value: TSuppInvoiceLine);
begin
  FSuppInvoiceLine := Value;
end;

procedure TPBLUSupplierInvoicePOFrm.SetMode(const Value: string);
begin
  FMode := Value;
  if FMode = 'A' then
    begin
      edtSupplierName.readonly := true;
      edtSupplierName.text := SuppInvoiceLine.parent.SupplierName;
    end;
end;

procedure TPBLUSupplierInvoicePOFrm.chkAllOrdersClick(Sender: TObject);
begin
(*  (dmSupplierInvoice.dsPOLine.DataSet as TFDQuery).active := false;
  if self.chkAllOrders.Checked then
  begin
    dmSupplierInvoice.dsPOLine.DataSet := dmSupplierInvoice.qryPOAllLines;
  end
  else
  begin
    dmSupplierInvoice.dsPOLine.DataSet := dmSupplierInvoice.qryPOsSalesInvd;
  end;
  dmSupplierInvoice.RefreshPOData;
*)
end;

procedure TPBLUSupplierInvoicePOFrm.rdgrpOrdersClick(Sender: TObject);
begin
  (dmSupplierInvoice.dsPOLine.DataSet as TFDQuery).active := false;
  case rdgrpOrders.itemindex of
    0:  begin
          dmSupplierInvoice.dsPOLine.DataSet := dmSupplierInvoice.qryPOsDeliv;
        end;
    1:  begin
          dmSupplierInvoice.dsPOLine.DataSet := dmSupplierInvoice.qryPOsSalesInvd;
        end;
    2:  begin
          dmSupplierInvoice.dsPOLine.DataSet := dmSupplierInvoice.qryPOAllLines;
        end;
  end;
  dmSupplierInvoice.RefreshPOData;
end;

procedure TPBLUSupplierInvoicePOFrm.chkbxIncZeroValueClick(
  Sender: TObject);
begin
  dmSupplierInvoice.IncludeZeroValuePO := chkbxIncZeroValue.checked;
  dmSupplierInvoice.RefreshPOData;
end;

procedure TPBLUSupplierInvoicePOFrm.dbgdetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clLime;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Authorised_By').AsInteger <> 0) then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsBold];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if (Column.Title.Caption <> 'Order') and
     (Column.Title.Caption <> 'Order Price') and
     (Column.Title.Caption <> 'Order Unit') and
     (Column.Title.Caption <> 'Quantity') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TPBLUSupplierInvoicePOFrm.FormActivate(Sender: TObject);
begin
  edtPONumber.SetFocus;
end;

procedure TPBLUSupplierInvoicePOFrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppfrm := TPBLUSuppfrm.Create(self);
  try
    PBLUSuppfrm.bIs_Lookup := true;
    PBLUSuppfrm.bSel_Branch := false;
    PBLUSuppfrm.bAllow_Upd := false;

    PBLUSuppfrm.Selcode := iSupplier;
    PBLUSuppfrm.SelBranch := iBranch;

    PBLUSuppfrm.SelName := sSupplierName;
    PBLUSuppfrm.SelBranchName := sBranchName;

    PBLUSuppfrm.ShowModal;
    if PBLUSuppfrm.selected then
    begin
      iSupplier := PBLUSuppfrm.Selcode;
      sSupplierName := PBLUSuppfrm.SelName;
      iBranch := PBLUSuppfrm.SelBranch;
      sBranchName := PBLUSuppfrm.SelBranchName;
      edtSupplierName.Text := PBLUSuppfrm.SelName;
      dbgDetails.options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect]
    end;
  finally
    PBLUSuppfrm.Free;
  end;
end;

procedure TPBLUSupplierInvoicePOFrm.edtSupplierNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  iSupplier := 0;
  iBranch := 0;
  sSupplierName := '';
  sBranchName := '';
  dbgDetails.options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
end;

procedure TPBLUSupplierInvoicePOFrm.SetSuppInvoiceChg(
  const Value: TSuppInvoiceChg);
begin
  FSuppInvoiceChg := Value;
end;

procedure TPBLUSupplierInvoicePOFrm.btnExcelClick(Sender: TObject);
begin
  frmPBMainMenu.ExportToExcel(PBLUSupplierInvoicePOFrm);
end;

procedure TPBLUSupplierInvoicePOFrm.bitbtnPriceUnitClearClick(
  Sender: TObject);
begin
  iSupplier := 0;
  iBranch := 0;
  sSupplierName := '';
  sBranchName := '';
  dbgDetails.options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
  edtSupplierName.Text := '';
end;

procedure TPBLUSupplierInvoicePOFrm.btnSweepClick(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TPBLUSupplierInvoicePOFrm.edtJBNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    dbgDetails.SelectedRows.CurrentRowSelected := false ;
    if dbgDetails.Datasource.Dataset.Locate('Job_Bag',Variant(edtJBNumber.text), [loPartialKey]) then
      begin
        dbgDetails.SelectedRows.CurrentRowSelected := True ;
        btnSelectClick(self);
      end
    else
      ShowMessage('Job Bag: '+ edtJBNumber.Text + ' does not exist in the current selection.');
  end;

end;

procedure TPBLUSupplierInvoicePOFrm.CallMaintPOScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  iPOrdHeadStatus: integer;
  Key: real;
begin
  Key := dbgDetails.DataSource.DataSet.FieldByName('Purchase_order').Asfloat;
  iPordHeadStatus := dbgDetails.DataSource.DataSet.FieldByName('Purch_ord_line_Status').Asinteger;
  if (iPordHeadStatus > 10) and (sTempFuncMode = 'C') then
  begin
    if MessageDlg('This order has been ' + dbgDetails.DataSource.DataSet.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;
  {Call NEW Purchase Order Maintenance}
  PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
  try
    PBMaintPOrdfrm.FuncMode := sTempFuncMode;
    PBMaintPOrdfrm.PurchaseOrderNo := key;
    PBMaintPOrdfrm.SetupDetails(Self);
    PBMaintPOrdfrm.ShowModal;
    bTempOK := PBMaintPOrdfrm.bOK;
  finally
    PBMaintPOrdfrm.Free;
  end;
  if bTempOK then
    begin
      dmSupplierInvoice.RefreshPOData;
      dbgDetails.DataSource.DataSet.Locate('Purchase_Order', Variant(floattostr(Key)),[lopartialKey]) ;
      dbgDetails.SelectedRows.CurrentRowSelected := True ;
    end;
end;

procedure TPBLUSupplierInvoicePOFrm.btnPOClick(Sender: TObject);
begin
  CallMaintPOScreen('C');
end;

end.
