unit WTLUSalesInvoiceSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wtSalesInvoiceDM, AllCommon, ExtCtrls, Grids,
  DBGrids, ComCtrls, DB, QrCtrls;

type
  TfrmWTLUSalesInvoiceSO = class(TForm)
    stbrDetails: TStatusBar;
    dbgDetails: TDBGrid;
    Panel2: TPanel;
    btnSelect: TBitBtn;
    edtSONumber: TEdit;
    Label1: TLabel;
    tmrSearch: TTimer;
    btnClose: TBitBtn;
    chkbxShow: TCheckBox;
    CustomerGroupBox: TGroupBox;
    Label2: TLabel;
    edtCustomerName: TEdit;
    btnSweep: TBitBtn;
    chkbxShowFutureOrders: TCheckBox;
    btnExcel: TBitBtn;
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure edtSONumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure chkbxShowClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FInvoiceDate: string;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetInvoiceDate(const Value: string);
    procedure SetSalesOrderEdit(Dataset: TDataset);
    { Private declarations }
  public
   property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
   property InvoiceDate: string read FInvoiceDate write SetInvoiceDate;
  end;

var
  frmWTLUSalesInvoiceSO: TfrmWTLUSalesInvoiceSO;

implementation

uses
  System.UITypes,
  WTMaintSalesInvoice, wtMain;

{$R *.dfm}

procedure TfrmWTLUSalesInvoiceSO.btnSelectClick(Sender: TObject);
var
  frm : TfrmWTMaintSalesInvoice;
  aInvoice : TSalesInvoice;
  icount: integer;
begin
  if dbgDetails.SelectedRows.Count = 1 then
    begin
      aInvoice := TSalesInvoice.Create(dtmdlSalesInvoice);
      try
        dtmdlSalesInvoice.SONumber := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
        dtmdlSalesInvoice.InvoiceDate := paDateStr(InvoiceDate);
        aInvoice.LoadFromSO;
        Frm := TfrmWTMaintSalesInvoice.Create(Self);
        try
          Frm.Mode := siRaise;
          Frm.SalesInvoice := aInvoice;
          Frm.ShowModal;
          if Frm.ModalResult = idOK then
            ModalResult := idok;
        finally
          Frm.Free;
        end;
      finally
        aInvoice.Free;
      end;
    end
  else
    begin
      if MessageDlg('Do you want to raise invoices for the selected orders?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := (dbgDetails.SelectedRows.Count - 1) downto 0 do
            begin
              dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
              aInvoice := TSalesInvoice.Create(dtmdlSalesInvoice);
              try
                dtmdlSalesInvoice.SONumber := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                dtmdlSalesInvoice.InvoiceDate := paDateStr(InvoiceDate);
                aInvoice.LoadFromSO;
                aInvoice.SaveToDB(true);
                ModalResult := idOK;
              finally
                aInvoice.Free;
              end;
            end;
        end;
    end;
end;

procedure TfrmWTLUSalesInvoiceSO.FormShow(Sender: TObject);
begin
  dtmdlSalesInvoice.refreshSOdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtSONumber.setfocus;
end;

procedure TfrmWTLUSalesInvoiceSO.FormCreate(Sender: TObject);
begin
  dtmdlSalesInvoice := TdtmdlSalesInvoice.Create(Self);
  dtmdlSalesInvoice.dsSOAll.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlSalesInvoice.dsSOAll;
  dtmdlSalesInvoice.qrySOAll.AfterScroll := SetSalesOrderEdit;
end;

procedure TfrmWTLUSalesInvoiceSO.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlSalesInvoice do
  begin
    btnSelect.enabled := (qrySOAll.recordcount > 0);
    btnSweep.enabled := (qrySOAll.recordcount > 0);
    btnExcel.enabled := (qrySOAll.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qrySOAll.recordcount) + ' sales orders listed';
  end;
end;

procedure TfrmWTLUSalesInvoiceSO.SetSalesOrderEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgdetails.datasource := dtmdlSalesInvoice.dsSOAll;
      try
        edtSONumber.Text := floatToStr(Dataset.FieldByName('Sales_Order').asinteger);
      except
        edtSONumber.Text := '';
      end;
    end
  else
    dbgdetails.datasource := dtmdlSalesInvoice.dsDummy;
end;

procedure TfrmWTLUSalesInvoiceSO.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUSalesInvoiceSO.SetInvoiceDate(const Value: string);
begin
  FInvoiceDate := Value;
end;

procedure TfrmWTLUSalesInvoiceSO.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlSalesInvoice.DisplayUnfitted := chkbxShow.Checked;
  dtmdlSalesInvoice.DisplayFuture := chkbxShowFutureOrders.Checked;
  dtmdlSalesInvoice.CustomerName := edtCustomerName.text;
  dtmdlSalesInvoice.RefreshSOData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSalesInvoiceSO.edtCustomerNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSalesInvoiceSO.edtSONumberKeyPress(Sender: TObject;
  var Key: Char);
var
  sTempCode: string;
begin
  if Key = #13 then { if it's an enter key }
  begin
    {Save the original entry}
    sTempCode := edtSONumber.Text;

    {Unselect everything}
    with dbgDetails.DataSource.dataset do
      begin
        first ;
        while EOF <> true do
          begin
            dbgDetails.SelectedRows.CurrentRowSelected := false ;
            next ;
           end;
        first;
      end;
      
    if dbgDetails.Datasource.Dataset.Locate('Sales_Order',Variant(sTempCode), [loPartialKey]) then
      begin
        dbgDetails.SelectedRows.CurrentRowSelected := true ;
        btnSelectClick(self)
      end
    else
      ShowMessage('Sales Order: '+ edtSONumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmWTLUSalesInvoiceSO.dbgDetailsDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TfrmWTLUSalesInvoiceSO.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesInvoiceSO.chkbxShowClick(Sender: TObject);
begin
  dtmdlSalesInvoice.DisplayUnFitted := chkbxShow.checked;
  dtmdlSalesInvoice.DisplayFuture:= chkbxShowFutureOrders.checked;
  dtmdlSalesInvoice.RefreshSOData;
end;

procedure TfrmWTLUSalesInvoiceSO.btnSweepClick(Sender: TObject);
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

procedure TfrmWTLUSalesInvoiceSO.btnExcelClick(Sender: TObject);
begin
  frmwtMain.ExportToExcel(frmWTLUSalesInvoiceSO);
end;

end.
