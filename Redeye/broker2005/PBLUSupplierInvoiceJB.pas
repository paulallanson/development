(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Selection.

VSS Info:
$Header: /PBL D5/PBLUSupplierInvoiceJB.pas 9     25/06/:3 16:38 Paul $
$History: PBLUSupplierInvoiceJB.pas $
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 25/06/:3   Time: 16:38
 * Updated in $/PBL D5
 * Corrected problem when adding Job Bag lines to existing Purchase
 * Invoice, wasn't getting the Vat details
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 12/05/:3   Time: 9:47
 * Updated in $/PBL D5
 * Resolved problem when adding another Production order or job bag, when
 * modifiying the price, it was showing zero.
 * 
 * *****************  Version 4  *****************
 * User: Pahome       Date: 16/02/:3   Time: 23:23
 * Updated in $/PBL D5
 * More work on Supplier invoicing
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 14/02/:3   Time: 17:05
 * Updated in $/PBL D5
 * Further development of new Supplier invoicing
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 11/02/:3   Time: 17:21
 * Updated in $/PBL D5
 * Added functionality to update orders and job bags
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
unit PBLUSupplierInvoiceJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls,
  ComCtrls, CCSCommon, PBSupplierInvoiceDM, Variants;

type
  TPBLUSupplierInvoiceJBFrm = class(TForm)
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
    dbgJB: TDBGrid;
    GroupBox1: TGroupBox;
    edtJBNumber: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtJBLNumber: TEdit;
    procedure FormShow(Sender: TObject);
    procedure DrawField(const Value: string; const Rect: TRect;
      vCanvas: TCanvas; vFont: TFont; vAlignment: TAlignment);
    procedure edtSupplierNameChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure dbgJBDblClick(Sender: TObject);
    procedure edtJBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgJBCellClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FMode: string;
    FSuppInvoiceLine: TSuppInvoiceLine;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetJobBagEdit(Dataset: TDataset);
    procedure SetMode(const Value: string);
    procedure SetSuppInvoiceLine(const Value: TSuppInvoiceLine);
    procedure CreateSuppInvoice;
    procedure CreateSuppInvoiceLine;
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Mode: string read FMode write SetMode;
    property SuppInvoiceLine: TSuppInvoiceLine read FSuppInvoiceLine write SetSuppInvoiceLine;
  end;

var
  PBLUSupplierInvoiceJBFrm: TPBLUSupplierInvoiceJBFrm;
  iSelection1, iSelection2: Integer;
  rLastOrder: real;

implementation

uses UITypes, PBMaintSuppInvoice;

{$R *.DFM}

procedure TPBLUSupplierInvoiceJBFrm.FormShow(Sender: TObject);
begin
  dmSupplierInvoice.SupplierName := edtSupplierName.text;
  dmSupplierInvoice.refreshJBdata;
  edtJBNumber.setfocus;
end;

procedure TPBLUSupplierInvoiceJBFrm.DrawField(const Value: string; const Rect: TRect;
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

procedure TPBLUSupplierInvoiceJBFrm.edtSupplierNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSupplierInvoiceJBFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSupplierInvoiceJBFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSupplierInvoice.SupplierName := edtSupplierName.text;
  dmSupplierInvoice.RefreshJBData;
end;

procedure TPBLUSupplierInvoiceJBFrm.dbgJBDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSupplierInvoiceJBFrm.edtJBNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgJB.Datasource.Dataset.Locate('Job_Bag;Job_Bag_Line',VarArrayOf([edtJBNumber.text,edtJBLNumber.text]), [loPartialKey]) then
      btnSelectClick(self)
    else
      ShowMessage('Job Bag line: '+ edtJBNumber.Text+'/'+edtJBLNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TPBLUSupplierInvoiceJBFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSupplierInvoice do
  begin
    btnSelect.enabled := (qryJBAllLines.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qryJBAllLines.recordcount) + ' job bag lines listed';
  end;
end;

procedure TPBLUSupplierInvoiceJBFrm.FormCreate(Sender: TObject);
begin
  stbrDetails.Top := Screen.Height - stbrDetails.Height;

  dmSupplierInvoice := TdmSupplierInvoice.Create(Self);
  dmSupplierInvoice.dsJBLine.OnDataChange := SetButtons;
  dmSupplierInvoice.qryJBAllLines.AfterScroll := SetJobBagEdit;
end;

procedure TPBLUSupplierInvoiceJBFrm.SetJobBagEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgJB.datasource := dmSupplierInvoice.dsJBLine;
      try
        edtJBNumber.Text := intToStr(Dataset.FieldByName('Job_Bag').asinteger);
        edtJBLNumber.Text := intToStr(Dataset.FieldByName('Job_Bag_Line').asinteger);
      except
        edtJBNumber.Text := '';
        edtJBLNumber.Text := '';
      end;
    end
  else
    dbgJB.datasource := dmSupplierInvoice.dsDummy;
end;

procedure TPBLUSupplierInvoiceJBFrm.btnSelectClick(Sender: TObject);
begin
  if dbgJB.Datasource.Dataset.Locate('Job_Bag;Job_Bag_Line',VarArrayOf([edtJBNumber.text,edtJBLNumber.text]), [loPartialKey]) then
    begin
      if Mode = 'A' then
        CreateSuppInvoiceLine
      else
        CreateSuppInvoice;
    end
  else
    ShowMessage('Job Bag/Line: '+ edtJBNumber.Text + '/' + edtJBLNumber.text + ' does not exist in the current selection.');

end;

procedure TPBLUSupplierInvoiceJBFrm.CreateSuppInvoiceLine;
begin
  with SuppInvoiceLine, dbgJB.Datasource.dataset do
    begin
      SILine := Parent.Lines.Count + 1;
      Description := fieldbyname('Job_Bag_Line_Descr').asstring;
      PONumber := 0;
      POLine := 0;
      Quantity := fieldbyname('Job_Bag_Quantity').asinteger;
      OriginalQty := 0;
      GoodsValue := FieldByName('Job_Bag_Line_Cost').Asfloat;
      VatCode := FieldByName('VAT_Code').Asinteger;
      VatRate := FieldByName('VAT_Rate').Asfloat;
      PriceUnit := dmSupplierInvoice.GetDefPriceUnit;
      PriceUnitDescr := dmSupplierInvoice.GetPUnitDescription(PriceUnit);
      PriceUnitFactor := dmSupplierInvoice.GetPUnitFactor(PriceUnit);
      Nominal := dmSupplierInvoice.GetDefPurchNominal;
      JBNumber := FieldByName('Job_Bag').Asinteger;
      JBLine := Fieldbyname('Job_Bag_Line').asinteger;
      TotalOrderValue := parent.datamodule.GetTotalJBLineValue(JBNumber,JBLine);
      PackQty := 1;
      PurchNumber := 0;
      PurchLine := 0;
      SuppInvoiceLine.Parent.Lines.Add(SuppInvoiceLine);
    end;
  ModalResult := mrok;
end;

procedure TPBLUSupplierInvoiceJBFrm.CreateSuppInvoice;
var
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
begin
  try
    aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
    try
      dmSupplierInvoice.JBNumber := dbgJB.DataSource.dataset.fieldbyname('Job_Bag').asinteger;
      dmSupplierInvoice.Line := dbgJB.DataSource.dataset.fieldbyname('Job_Bag_Line').asinteger;

      aInvoice.LoadFromJB;
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

procedure TPBLUSupplierInvoiceJBFrm.dbgJBCellClick(Column: TColumn);
begin
  with dbgJB do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

procedure TPBLUSupplierInvoiceJBFrm.FormDestroy(Sender: TObject);
begin
  dmSupplierInvoice.free;
end;

procedure TPBLUSupplierInvoiceJBFrm.SetMode(const Value: string);
begin
  FMode := Value;
  if FMode = 'A' then
    begin
      edtSupplierName.readonly := true;
      edtSupplierName.text := SuppInvoiceLine.parent.SupplierName;
    end;
end;

procedure TPBLUSupplierInvoiceJBFrm.SetSuppInvoiceLine(
  const Value: TSuppInvoiceLine);
begin
  FSuppInvoiceLine := Value;
end;

end.
