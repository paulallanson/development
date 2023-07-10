unit WTLUPOrderSalesOrderLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, ExtCtrls, DBGrids, wtPurchasesDM,
  DB, DBTables;

type
  TfrmWTLUPOrderSalesOrderLine = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    edtCustomerName: TEdit;
    btbtnClose: TBitBtn;
    btnSelect: TBitBtn;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    edtSupplier: TEdit;
    Label3: TLabel;
    dtFitting: TDateTimePicker;
    tmrSearch: TTimer;
    dbgDetails: TDBGrid;
    btnSweep: TBitBtn;
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btbtnCloseClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtFittingChange(Sender: TObject);
  private
    dtmdlPOrder: TdtmdlPurchaseOrder;
    FSupplier: integer;
    FDisableNameChangeEvent: boolean;
    FDateRequired: TDateTime;
    FSalesOrder: integer;
    FPOLine: TPOLine;
    FPOrder: TPOrder;
    FMode: TpolMode;
    FPONewLine: TPOLine;
    procedure SetSupplier(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetSalesOrder(const Value: integer);
    procedure SetPOLine(const Value: TPOLine);
    procedure SetPOrder(const Value: TPOrder);
    procedure SetMode(const Value: TpolMode);
    procedure SetPONewLine(const Value: TPOLine);
    { Private declarations }
  public
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Mode: TpolMode read FMode write SetMode;
    property POLine: TPOLine read FPOLine write SetPOLine;
    property PONewLine: TPOLine read FPONewLine write SetPONewLine;
    property POrder: TPOrder read FPOrder write SetPOrder;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property Supplier: integer read FSupplier write SetSupplier;
  end;

var
  frmWTLUPOrderSalesOrderLine: TfrmWTLUPOrderSalesOrderLine;

implementation

{$R *.dfm}

{ TfrmWTLUPOrderSalesOrderLine }

procedure TfrmWTLUPOrderSalesOrderLine.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
  dtmdlPOrder.Supplier := FSupplier;
end;

procedure TfrmWTLUPOrderSalesOrderLine.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlPOrder.CustomerName := edtCustomerName.text;
  dtmdlPOrder.RefreshSOData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUPOrderSalesOrderLine.FormCreate(Sender: TObject);
begin
  dtmdlPOrder := TdtmdlPurchaseOrder.Create(Self);
  dtmdlPOrder.dtsGetSOLines.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlPOrder.dtsGetSOLines;

end;

procedure TfrmWTLUPOrderSalesOrderLine.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlPOrder do
  begin
    btnSelect.enabled := (qryGetSOLines.recordcount > 0);
    btnSweep.enabled := (qryGetSOLines.recordcount > 0);
    stsBrDetails.panels[0].text := inttostr(qryGetSOLines.recordcount) + ' sales orders listed';
  end;
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUPOrderSalesOrderLine.edtCustomerNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPOrderSalesOrderLine.dbgDetailsDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TfrmWTLUPOrderSalesOrderLine.btbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUPOrderSalesOrderLine.btnSweepClick(Sender: TObject);
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

procedure TfrmWTLUPOrderSalesOrderLine.btnSelectClick(Sender: TObject);
var
  icount: integer;
begin
  if Mode = polChange then
    begin
      PONewLine := TPOLine.Create(POrder);
      try
        POrder.DataModule.SalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
        POrder.DataModule.SalesOrderLineNo := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order_Line_No').asinteger;
        POrder.DataModule.Quote := dbgDetails.DataSource.dataset.fieldbyname('Quote').asinteger;
        POrder.DataModule.QuoteSlabNo := dbgDetails.DataSource.dataset.fieldbyname('Slab_Number').asinteger;

        PONewLine.LoadFromQuoteSlab;
      finally
      end;
    end
  else
    begin
      if dbgDetails.SelectedRows.Count = 1 then
        begin
          POLine := TPOLine.Create(POrder);
          try
            POrder.DataModule.SalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
            POrder.DataModule.SalesOrderLineNo := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order_Line_No').asinteger;
            POrder.DataModule.Quote := dbgDetails.DataSource.dataset.fieldbyname('Quote').asinteger;
            POrder.DataModule.QuoteSlabNo := dbgDetails.DataSource.dataset.fieldbyname('Slab_Number').asinteger;

            POLine.LoadFromQuoteSlab;
            POLine.POLNumber := POLine.Parent.Lines.MaxLineNo + 1;
            POLine.Mode := 'A';
            POLine.Parent.Lines.Add(POLine);
          finally
          end;
        end
      else
        begin
          if MessageDlg('Do you want to raise invoices for the selected orders?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              for iCount := (dbgDetails.SelectedRows.Count - 1) downto 0 do
                begin
                  dbgDetails.datasource.DataSet.GotoBookmark(Pointer(dbgDetails.SelectedRows[iCount])) ;
                  POLIne := TPOLine.Create(POrder);
                  try
                    POrder.DataModule.SalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                    POrder.DataModule.SalesOrderLineNo := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order_Line_No').asinteger;
                    POrder.DataModule.Quote := dbgDetails.DataSource.dataset.fieldbyname('Quote').asinteger;
                    POrder.DataModule.QuoteSlabNo := dbgDetails.DataSource.dataset.fieldbyname('Slab_Number').asinteger;

                    POLine.LoadFromQuoteSlab;
                    POLine.POLNumber := POLine.Parent.Lines.MaxLineNo + 1;
                    POLine.Mode := 'A';
                    POLine.Parent.Lines.Add(POLine);
                  finally
                  end;
                end;
            end;
        end;
    end;
  ModalResult := mrOK;
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetDateRequired(
  const Value: TDateTime);
begin
  FDateRequired := Value;
  dtmdlPOrder.DateRequired := FDateRequired;
end;

procedure TfrmWTLUPOrderSalesOrderLine.FormActivate(Sender: TObject);
begin
  dtFitting.Date := DateRequired + 7;
  self.DateRequired := dtFitting.Date;
  dtmdlPOrder.DateRequired := self.DateRequired;
  dtmdlPOrder.RefreshSOData;
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
  dtmdlPOrder.SalesOrder := FSalesOrder;
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetPOLine(const Value: TPOLine);
begin
  FPOLine := Value;
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetPOrder(const Value: TPOrder);
begin
  FPOrder := Value;
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetMode(const Value: TpolMode);
begin
  FMode := Value;
  if FMode = polChange then
    dbgDetails.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
  else
    dbgDetails.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
end;

procedure TfrmWTLUPOrderSalesOrderLine.SetPONewLine(const Value: TPOLine);
begin
  FPONewLine := Value;
end;

procedure TfrmWTLUPOrderSalesOrderLine.dtFittingChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  self.DateRequired := dtFitting.Date;
  dtmdlPOrder.DateRequired := self.DateRequired;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

end.
