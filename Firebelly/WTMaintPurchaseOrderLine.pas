unit WTMaintPurchaseOrderLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, wtPurchasesDM, CRControls,
  FireDAC.Stan.Param;

type
  TfrmWTMaintPurchaseOrderLine = class(TForm)
    pnlFunctions: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    pnlTop: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnWorktops: TSpeedButton;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    edtDepth: TCREditInt;
    edtLength: TCREditInt;
    dblkpWTThickness: TDBLookupComboBox;
    dblkpWorktop: TDBLookupComboBox;
    dblkpMaterial: TDBLookupComboBox;
    dblkpSlabSize: TDBLookupComboBox;
    Panel1: TPanel;
    OrdqtyLbl: TLabel;
    lblQtyDelivered: TLabel;
    lblQtyInvoiced: TLabel;
    edtOrderQty: TMemo;
    edtDeliveredQty: TMemo;
    edtInvoicedQty: TMemo;
    Label12: TLabel;
    edtUnitCost: TCREditMoney;
    Label3: TLabel;
    edtCostUnit: TMemo;
    Label4: TLabel;
    edtSlabUnitCost: TCREditMoney;
    Label5: TLabel;
    edtSlabTotalCost: TMemo;
    btnContactClear: TSpeedButton;
    pnlNotes: TPanel;
    Label7: TLabel;
    memNotes: TMemo;
    Label13: TLabel;
    edtDiscount: TCREditMoney;
    edtSlabLabel: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSalesOrder: TCREditInt;
    SpeedButton2: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpSlabSizeClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure edtLengthChange(Sender: TObject);
    procedure btnContactClearClick(Sender: TObject);
    procedure edtProductChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    FPOLine: TPOLine;
    FMode: TpolMode;
    FActivated: boolean;
    procedure SetPOLine(const Value: TPOLine);
    procedure SetMode(const Value: TpolMode);
    procedure ShowDetails;
    procedure SetActivated(const Value: boolean);
    procedure RefreshThickness(tmpPOLine: TPOLine);
    procedure RefreshWorktops(tmpPOLine: TPOLine);
    procedure RefreshSlabs(tmpPOLine: TPOLine);
    procedure GetUnitCost;
    procedure GetTotalSlabCost;
    procedure RefreshMaterial;
    procedure ShowNewDetails(PONewLine: TPOLine);
    { Private declarations }
  public
    property Activated: boolean read FActivated write SetActivated;
    property Mode: TpolMode read FMode write SetMode;
    property POLine: TPOLine read FPOLine write SetPOLine;
  end;

var
  frmWTMaintPurchaseOrderLine: TfrmWTMaintPurchaseOrderLine;

implementation

uses wtLUMatType, WTLUPOrderSalesOrderLine, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintPurchaseOrderLine }

procedure TfrmWTMaintPurchaseOrderLine.SetMode(const Value: TpolMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = polDelete);
  pnlDetails.enabled := not (FMode = polDelete);
  pnlTop.enabled := not (FMode = polDelete);
  pnlNotes.enabled := not (FMode = polDelete);
end;

procedure TfrmWTMaintPurchaseOrderLine.SetPOLine(const Value: TPOLine);
begin
  FPOLine := Value;
end;

procedure TfrmWTMaintPurchaseOrderLine.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin

    dblkpMaterial.ListSource := POLine.parent.DataModule.dtsMaterial;
    dblkpWorktop.ListSource := POLine.parent.DataModule.dtsWorktops;
    dblkpWTThickness.ListSource := POLine.parent.DataModule.dtsWTThickness;

(*    RefreshMaterial;

    RefreshWorktops;

    RefreshThickness;

    RefreshSlabs;
*)
    case Mode of
    polAdd     : Caption := 'Add a Purchase Order Line';
    polChange  : Caption := 'Change a Purchase Order line';
    polDelete  : Caption := 'Delete a Purchase Order Line';
    end;  { case }
    if Mode = polAdd then
      sTemp := ' New Purchase Order Line '
    else
      sTemp := ' Purchase Order Line ' + IntToStr(POLine.Parent.DbKey) + ' ';

    ShowDetails;
    pnlDetails.enabled := (Mode <> polView);
    pnlTop.enabled := (Mode <> polView);
    btnOk.visible := (Mode <> polView);

    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmWTMaintPurchaseOrderLine.ShowDetails;
begin
  RefreshMaterial;

  RefreshWorktops(POLine);

  RefreshThickness(POLine);

  RefreshSlabs(POline);

  if Mode <> polAdd then
  begin
    edtSalesOrder.Text := inttostr(POLine.SalesOrder);
    edtOrderQty.text := floattostr(POLine.Quantity);
    edtDeliveredQty.text := floattostr(POLine.QtyDelivered);
    edtInvoicedQty.text := floattostr(POLine.QtyInvoiced);
    edtCostUnit.text := floattostr(POLine.CostUnit);
    edtDiscount.Text := formatfloat('0.00',POLine.DiscountPercentage);
    edtSlabUnitCost.Text := formatfloat('0.00',POLine.SlabUnitCost);
    edtSlabTotalCost.Text := formatfloat('0.00',(POLine.SlabUnitCost * POLine.SlabArea));
    edtSlabLabel.Text := POLine.SlabDescription;
    edtUnitCost.Text := formatfloat('0.00',POLine.UnitCost);
    dblkpMaterial.KeyValue := POLine.MaterialType;
    dblkpWorktop.KeyValue := POLine.Worktop;
    dblkpWTThickness.KeyValue := POLine.Thickness;
    edtLength.text := inttostr(POLine.SlabLength);
    edtDepth.text := inttostr(POLine.SlabDepth);
    memNotes.Text := POLine.Notes;

    edtUnitCost.Setfocus;
  end
  else
  begin
    edtOrderQty.text := '1';
    edtDeliveredQty.text := '0';
    edtInvoicedQty.text := '0';
    edtCostUnit.text := '1';
    edtDiscount.Text := formatfloat('0.00',0.00);
    edtUnitCost.Text := formatfloat('0.00',0.00);
    edtSlabUnitCost.Text := formatfloat('0.00',0.00);
    edtSlabTotalCost.Text := formatfloat('0.00',0.00);
    dblkpMaterial.KeyValue := 0;
    dblkpWorktop.KeyValue := 0;
    dblkpWTThickness.KeyValue := 0;
    dblkpSlabSize.KeyValue := 0;
    edtSlabLabel.Text := '';
    edtLength.text := '';
    edtDepth.text := '';
    memNotes.Text := '';
    dblkpMaterial.SetFocus;
  end;
end;

procedure TfrmWTMaintPurchaseOrderLine.ShowNewDetails(PONewLine: TPOLine);
begin
  RefreshMaterial;

  RefreshWorktops(PONewLine);

  RefreshThickness(PONewLine);

  RefreshSlabs(PONewLine);

  edtSalesOrder.Text := inttostr(PONewLine.SalesOrder);
  edtOrderQty.text := floattostr(PONewLine.Quantity);
  edtDeliveredQty.text := floattostr(PONewLine.QtyDelivered);
  edtInvoicedQty.text := floattostr(PONewLine.QtyInvoiced);
  edtCostUnit.text := floattostr(PONewLine.CostUnit);
  edtDiscount.Text := formatfloat('0.00',PONewLine.DiscountPercentage);
  edtSlabUnitCost.Text := formatfloat('0.00',PONewLine.SlabUnitCost);
  edtSlabTotalCost.Text := formatfloat('0.00',(PONewLine.SlabUnitCost * PONewLine.SlabArea));
  edtSlabLabel.Text := PONewLine.SlabDescription;
  edtUnitCost.Text := formatfloat('0.00',PONewLine.UnitCost);
  dblkpMaterial.KeyValue := PONewLine.MaterialType;
  dblkpWorktop.KeyValue := PONewLine.Worktop;
  dblkpWTThickness.KeyValue := PONewLine.Thickness;
  edtLength.text := inttostr(PONewLine.SlabLength);
  edtDepth.text := inttostr(PONewLine.SlabDepth);
  memNotes.Text := PONewLine.Notes;

  edtUnitCost.Setfocus;
end;

procedure TfrmWTMaintPurchaseOrderLine.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  try
    POLine.SalesOrder := strtoint(edtSalesOrder.text);
  except
    POLine.SalesOrder := 0;
  end;

  POLine.UnitCost := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  POLine.SlabUnitCost := StrToFloatDef(edtSlabUnitCost.text, 0, FormatSettings);
  POLine.CostUnit := strtoint(edtCostUnit.text);
  POLine.DiscountPercentage := StrToFloatDef(edtDiscount.text, 0, FormatSettings);
  POLine.Quantity := StrToFloatDef(edtOrderQty.text, 0, FormatSettings);
(*  POLine.QtyDelivered := StrToFloatDef(edtDeliveredQty.text, 0, FormatSettings) * POLine.CostUnit;
  POLine.QtyInvoiced := StrToFloatDef(edtInvoicedQty.text, 0, FormatSettings) * POLine.CostUnit;
*)

  POLine.QtyDelivered := StrToFloatDef(edtDeliveredQty.text, 0, FormatSettings);
  POLine.QtyInvoiced := StrToFloatDef(edtInvoicedQty.text, 0, FormatSettings);
  
  POLine.Notes := memNotes.Text;

  POLine.Description := dblkpWTThickness.Text + ' ' + dblkpWorktop.Text + ' ' + dblkpMaterial.Text;
  POLine.SlabDescription := edtSlabLabel.Text;

  POLine.Worktop := dblkpWorktop.KeyValue;
  POLine.Thickness := dblkpWTThickness.KeyValue;

  POLine.SlabDepth := strtoint(edtDepth.text);
  POLine.SlabLength := strtoint(edtLength.text);

  if Mode = polAdd then
  begin
    POLine.POLNumber := POLine.Parent.Lines.MaxLineNo + 1;
    POLine.Mode := 'A';
    POLine.Parent.Lines.Add(POLine);
  end
  else
  if Mode = polDelete then
  begin
    inx := POLine.Parent.Lines.IndexOf(POLine.POLNumber);
    POLine.DeletefromDB;
    POLine.Parent.Lines.Delete(inx);
  end;

  ModalResult := mrOK;
end;

procedure TfrmWTMaintPurchaseOrderLine.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=
                    (dblkpMaterial.KeyValue <> 0) and
                    (dblkpWorktop.KeyValue <> 0) and
                    (dblkpWTThickness.KeyValue <> 0) and
                    (edtLength.text <> '') and
                    (edtDepth.text <> '') and
                    (edtSlabUnitCost.text <> '') and
                    (edtUnitCost.text <> '') and
                    (edtCostUnit.text <> '') and
                    (edtOrderQty.text <> '') and
                    (edtDeliveredQty.text <> '') and
                    (edtInvoicedQty.text <> '');
end;

procedure TfrmWTMaintPurchaseOrderLine.SetActivated(const Value: boolean);
begin
  FActivated := Value;
end;

procedure TfrmWTMaintPurchaseOrderLine.dblkpMaterialClick(Sender: TObject);
begin
  POLine.MaterialType := dblkpMaterial.KeyValue;
  RefreshWorktops(POLine);
  RefreshSlabs(POLine);
end;

procedure TfrmWTMaintPurchaseOrderLine.dblkpWorktopClick(Sender: TObject);
begin
  POLine.Worktop := dblkpWorktop.keyvalue;
  RefreshThickness(POLine);
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.RefreshMaterial;
begin
  with POLine.Parent.DataModule.qryMaterial do
    begin
      close;
      open;
    end;
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.RefreshWorktops(tmpPOLine: TPOLine);
begin
  with tmpPOLine.Parent.DataModule.qryWorktops do
    begin
      close;
      parambyname('Material_Type').asinteger := tmpPOLine.MaterialType;
      parambyname('Worktop').asinteger := tmpPOLine.worktop;
      open;
    end;
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.RefreshThickness(tmpPOLine: TPOLine);
begin
  with POLine.Parent.DataModule.qryWTThickness do
    begin
      close;
      parambyname('Worktop').asinteger := tmpPOLine.worktop;
      open;
    end;
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.RefreshSlabs(tmpPOLine: TPOLine);
var
  sText: string;
begin
  with tmpPOLine.Parent.DataModule.qryMaterialSlab do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'CSTR(', 'CONVERT(nvarchar(10), ', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := tmpPOLine.MaterialType;
      open;
    end;
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.dblkpSlabSizeClick(Sender: TObject);
begin
  if (Sender as TDBLookupComboBox).text <> '' then
    begin
      edtLength.readonly := true;
      edtdepth.readonly := true;
      edtSlabLabel.readonly := true;

      edtLength.Text := inttostr(POLine.Parent.DataModule.qryMaterialSlab.fieldbyname('Length').asinteger);
      edtdepth.Text := inttostr(POLine.Parent.DataModule.qryMaterialSlab.fieldbyname('Depth').asInteger);
      edtSlabLabel.Text := POLine.Parent.DataModule.qryMaterialSlab.fieldbyname('Slab_Size_Description').asstring;
    end
  else
    begin
      edtLength.readonly := false;
      edtdepth.readonly := false;
      edtSlabLabel.readonly := false;
    end;
end;

procedure TfrmWTMaintPurchaseOrderLine.dblkpWTThicknessClick(
  Sender: TObject);
begin
  GetUnitCost;
end;

procedure TfrmWTMaintPurchaseOrderLine.GetUnitCost;
var
  sText: string;
begin
  with POLine.Parent.DataModule.qryOneWTThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyName('supplier').asinteger := POLine.Parent.supplier;
      parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
      parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
      open;

      edtSlabUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);

      POLine.CostUnit := fieldbyname('Price_Unit').asinteger;
      POLine.SlabUnitCost := fieldbyname('Unit_Cost').asfloat;
    end;
end;

procedure TfrmWTMaintPurchaseOrderLine.GetTotalSlabCost;
var
  rUnitCost, rTotal: real;
  idepth,iLength: integer;
begin
  if FActivated then
    begin
      try
        iDepth := strtoint(edtDepth.text);
      except
        iDepth := 0
      end;

      try
        iLength := strtoint(edtLength.text);
      except
        iLength := 0;
      end;

      try
        rUnitCost := StrToFloatDef(edtSlabUnitCost.text, 0, FormatSettings);
      except
        rUnitCost := 0.00;
      end;

      rTotal := ((idepth * iLength)/1000000)*rUnitCost;
      edtSlabTotalCost.text := formatfloat('0.00',rTotal);
      edtUnitCost.text := formatfloat('0.00',rTotal);
      CheckOK(self);
    end;
end;

procedure TfrmWTMaintPurchaseOrderLine.edtLengthChange(Sender: TObject);
begin
  GetTotalSlabCost;
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.btnContactClearClick(
  Sender: TObject);
begin
  dblkpSlabSize.KeyValue := 0;

  edtLength.Text := '';
  edtDepth.Text := '';
  edtSlabLabel.Text := '';

  POLine.SlabLength := 0;
  POLine.SlabDepth := 0;
  POLine.SlabDescription := '';

  edtLength.readonly := false;
  edtDepth.ReadOnly := false;
  edtSlabLabel.ReadOnly := false;
end;

procedure TfrmWTMaintPurchaseOrderLine.edtProductChange(Sender: TObject);
begin
  pnlDetails.Enabled := ((Sender as TEdit).Text = '');
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrderLine.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUMatType := TfrmWTLUMatType.create(self);
  try
    frmWTLUMatType.showmodal;
  finally
    frmWTLUMatType.free;
  end;
  RefreshMaterial;
end;

procedure TfrmWTMaintPurchaseOrderLine.SpeedButton2Click(Sender: TObject);
begin
  frmWTLUPOrderSalesOrderLine := TfrmWTLUPOrderSalesOrderLine.create(self);
  try
    frmWTLUPOrderSalesOrderLine.POrder := POLine.parent;
    frmWTLUPOrderSalesOrderLine.PONewLine := POLine;
    frmWTLUPOrderSalesOrderLine.Mode := polChange;
    frmWTLUPOrderSalesOrderLine.SalesOrder := POLine.SalesOrder;
    frmWTLUPOrderSalesOrderLine.supplier := POLine.parent.Supplier;
    frmWTLUPOrderSalesOrderLine.edtsupplier.text := POLine.parent.SupplierName;
    frmWTLUPOrderSalesOrderLine.DateRequired := POLine.parent.DateRequired;
    frmWTLUPOrderSalesOrderLine.showmodal;
    if frmWTLUPOrderSalesOrderLine.ModalResult = mrOK then
      begin
        ShowNewDetails(frmWTLUPOrderSalesOrderLine.PONewLine);
        CheckOK(Self);
      end;
  finally
    frmWTLUPOrderSalesOrderLine.free;
  end;
end;

end.
