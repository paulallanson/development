(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Selection.

VSS Info:
$Header: /PBL D5/PBLUSupplierInvoicePurch.pas 5     20/06/03 9:53 Andrewh $
$History: PBLUSupplierInvoicePurch.pas $
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 28/02/:3   Time: 17:02
 * Updated in $/PBL D5
 * Added functionality to process Stock/SOP purchase invoices
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 11/02/:3   Time: 12:31
 * Created in $/PBL D5
 * Initial take on of Supplier invoicing lookups
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 23/12/:2   Time: 16:41
 * Created in $/PBL D5
 * Initail takeon of unit
 *
*******************************************************************************)
unit PBLUSupplierInvoicePurch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls, Mask, DBCtrls,
  ComCtrls, CCSCommon, PBSupplierInvoiceDM;

type
  TPBLUSupplierInvoicePurchFrm = class(TForm)
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
    dbgPurch: TDBGrid;
    GroupBox1: TGroupBox;
    edtPONumber: TEdit;
    btnSweep: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DrawField(const Value: string; const Rect: TRect;
      vCanvas: TCanvas; vFont: TFont; vAlignment: TAlignment);
    procedure edtSupplierNameChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure dbgPurchDblClick(Sender: TObject);
    procedure edtPONumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgPurchCellClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FMode: string;
    FSupplierInvoice: TSuppInvoice;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetPurchaseOrderEdit(Dataset: TDataset);
    procedure SetMode(const Value: string);
    procedure CreateSuppInvoice;
    procedure CreateSuppInvoiceLines;
    procedure SetSupplierInvoice(const Value: TSuppInvoice);
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Mode: string read FMode write SetMode;
    property SupplierInvoice: TSuppInvoice read FSupplierInvoice write SetSupplierInvoice;
  end;

var
  PBLUSupplierInvoicePurchFrm: TPBLUSupplierInvoicePurchFrm;
  iSelection1, iSelection2: Integer;
  rLastOrder: real;

implementation

uses PBMaintSuppInvoice;

{$R *.DFM}

procedure TPBLUSupplierInvoicePurchFrm.FormShow(Sender: TObject);
begin
  dmSupplierInvoice.refreshPurchdata;
  edtPONumber.setfocus;
end;

procedure TPBLUSupplierInvoicePurchFrm.DrawField(const Value: string; const Rect: TRect;
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

procedure TPBLUSupplierInvoicePurchFrm.edtSupplierNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSupplierInvoicePurchFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSupplierInvoicePurchFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSupplierInvoice.SupplierName := edtSupplierName.text;
  dmSupplierInvoice.RefreshPurchData;
end;

procedure TPBLUSupplierInvoicePurchFrm.dbgPurchDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSupplierInvoicePurchFrm.edtPONumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgPurch.Datasource.Dataset.Locate('Purch_Ord_No', Variant(edtPONumber.Text), [loPartialKey]) then
      btnSelectClick(self)
    else
      ShowMessage('Purchase Order: '+ edtPONumber.Text + ' does not exist in the current selection.');
  end;

end;

procedure TPBLUSupplierInvoicePurchFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSupplierInvoice do
  begin
    btnSweep.enabled := (qryPurchAll.recordcount > 0);
    btnSelect.enabled := (qryPurchAll.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qryPurchAll.recordcount) + ' purchase orders listed';
  end;
end;

procedure TPBLUSupplierInvoicePurchFrm.FormCreate(Sender: TObject);
begin
  dmSupplierInvoice := TdmSupplierInvoice.Create(Self);
  dmSupplierInvoice.dsPurchOrd.OnDataChange := SetButtons;
  dmSupplierInvoice.qryPurchAll.AfterScroll := SetPurchaseOrderEdit;
end;

procedure TPBLUSupplierInvoicePurchFrm.SetPurchaseOrderEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgPurch.datasource := dmSupplierInvoice.dsPurchOrd;
      try
        edtPONumber.Text := Dataset.FieldByName('Purch_Ord_no').asstring;
      except
        edtPONumber.Text := '';
      end;
    end
  else
    dbgPurch.datasource := dmSupplierInvoice.dsDummy;
end;

procedure TPBLUSupplierInvoicePurchFrm.btnSelectClick(Sender: TObject);
var
  icount: integer;
  aInvoice : TSuppInvoice;
begin
  if (dbgPurch.SelectedRows.Count = 1) or (Mode <> 'A') then
    begin
      if dbgPurch.Datasource.Dataset.Locate('Purch_ord_no',Variant(edtPONumber.text), [loPartialKey]) then
        begin
          if Mode = 'A' then
            CreateSuppInvoiceLines
          else
            CreateSuppInvoice;
        end
      else
        ShowMessage('Purchase Order: '+ edtPONumber.Text + ' does not exist in the current selection.');
    end
  else
    begin
      for iCount := 0 to (dbgPurch.SelectedRows.Count - 1) do
        begin
          dbgPurch.datasource.DataSet.GotoBookmark(TBookmark(dbgPurch.SelectedRows[iCount]));
          CreateSuppInvoiceLines;
        end;
    end;

end;

procedure TPBLUSupplierInvoicePurchFrm.CreateSuppInvoice;
var
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
begin
  try
    aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
    try
      dmSupplierInvoice.PurchNumber := dbgPurch.DataSource.dataset.fieldbyname('Purch_Ord').asinteger;
      aInvoice.LoadFromPurch;
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

procedure TPBLUSupplierInvoicePurchFrm.CreateSuppInvoiceLines;
var
  TempQry: TQuery;
  sTemp: string;
  aLine: TSuppInvoiceLine;
begin
  TempQry := SupplierInvoice.datamodule.qryPurchLines;
  with TempQry do
  begin
    Close;
    ParamByName('Purch_Ord').Asinteger :=
                  dbgPurch.Datasource.dataset.fieldbyname('Purch_Ord').asinteger;
    Open;
    first;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceLine.Create(SupplierInvoice);
      aLine.SILine := SupplierInvoice.Lines.Count + 1;
      aLine.Description := fieldbyname('Part').asstring + ' - ' + fieldbyname('Part_Description').asstring;
      aLine.PONumber := 0;
      aLine.POLine := 0;
      aLine.Quantity := fieldbyname('Qty_To_Invoice').asinteger;
      aLine.OriginalQty := 0;
      aLine.PackQty := fieldbyname('Purch_Pack_Quantity').asinteger;
      aLine.GoodsValue := (FieldByName('Purchase_Price').Asfloat/aLine.PackQty);
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.PriceUnit := dmSupplierInvoice.GetDefPriceUnit;
      aLine.PriceUnitDescr := dmSupplierInvoice.GetPUnitDescription(aLine.PriceUnit);
      aLine.PriceUnitFactor := dmSupplierInvoice.GetPUnitFactor(aLine.PriceUnit);
      If fieldByName('Purchase_Nominal').AsString = '' then
        aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal
      else
        aLine.Nominal := FieldByName('Purchase_Nominal').AsString;
      aLine.JBNumber := 0;
      aLine.JBLine := 0;
      aLine.CreditType := '';
      aLine.PurchNumber := fieldbyname('Purch_Ord').asinteger;
      aLine.PurchLine := fieldbyname('Purch_Ord_line_no').asinteger;
//      TotalOrderValue := parent.datamodule.GetTotalPurchLineValue(PurchNumber,PurchLine);
      SupplierInvoice.Lines.Add(aLine);
      next;
    end;
  end;
  ModalResult := mrok;
end;

procedure TPBLUSupplierInvoicePurchFrm.dbgPurchCellClick(Column: TColumn);
begin
  with dbgPurch do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

procedure TPBLUSupplierInvoicePurchFrm.FormDestroy(Sender: TObject);
begin
  dmSupplierInvoice.free;
end;

procedure TPBLUSupplierInvoicePurchFrm.SetMode(const Value: string);
begin
  FMode := Value;
  if FMode = 'A' then
    begin
      dbgPurch.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
      btnSweep.Visible := true;
    end
  else
    begin
      dbgPurch.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      btnSweep.Visible := false;
    end;
end;

procedure TPBLUSupplierInvoicePurchFrm.SetSupplierInvoice(
  const Value: TSuppInvoice);
begin
  FSupplierInvoice := Value;
end;

procedure TPBLUSupplierInvoicePurchFrm.btnSweepClick(Sender: TObject);
begin
  with dbgPurch.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgPurch.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

end.
