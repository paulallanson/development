unit WTLUSalesInvoiceSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wtSalesInvoiceDM, AllCommon, ExtCtrls, Grids,
  DBGrids, ComCtrls, DB, QrCtrls, DBCtrls, Inifiles;

type
  TfrmWTLUSalesInvoiceSO = class(TForm)
    stbrDetails: TStatusBar;
    dbgDetails: TDBGrid;
    pnlControls: TPanel;
    tmrSearch: TTimer;
    chkbxShow: TCheckBox;
    chkbxShowFutureOrders: TCheckBox;
    pnlFooter: TPanel;
    CustomerGroupBox: TGroupBox;
    Label2: TLabel;
    edtCustomerName: TEdit;
    btnSweep: TBitBtn;
    btnExcel: TBitBtn;
    Label1: TLabel;
    edtSONumber: TEdit;
    btnSelect: TBitBtn;
    btnClose: TBitBtn;
    pnlRevenueCentre: TPanel;
    rdgrpRevenueCentre: TRadioGroup;
    grpbxRevCentre: TGroupBox;
    Label3: TLabel;
    dblkpRevCentre: TDBLookupComboBox;
    pnlBody: TPanel;
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
    procedure rdgrpRevenueCentreClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpRevCentreClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  UITypes, WTMaintSalesInvoice, wtMain, wtDataModule;

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
  if Assigned(dbgDetails.datasource.dataset) and not dbgDetails.datasource.dataset.IsEmpty then
    dbgDetails.SelectedRows.CurrentRowSelected := True;

  edtSONumber.setfocus;
end;

procedure TfrmWTLUSalesInvoiceSO.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  IniFileName: string;
  iRevenueCentre: integer;
begin
  pnlRevenueCentre.Visible := dtmdlWorktops.UseRevenueCentres;
  dtmdlSalesInvoice := TdtmdlSalesInvoice.Create(Self);
  dtmdlSalesInvoice.dsSOAll.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlSalesInvoice.dsSOAll;
  dtmdlSalesInvoice.qrySOAll.AfterScroll := SetSalesOrderEdit;
  IniFileName := TfrmWTMain.AppIniFile;
  AllCommon.SetDBGridCols('', 'SalesInvoicesSO Col Order', IniFileName, self.dbgDetails);

  IniFile := TIniFile.Create(IniFileName);

  try
    with IniFile do
      begin
        chkbxShowFutureOrders.Checked := (ReadString('Raise Sales Invoice', 'Show Future Orders', 'N') = 'Y');
        chkbxShow.Checked := (ReadString('Raise Sales Invoice', 'Show Orders Not Fitted', 'N') = 'Y');
        try
          rdgrpRevenueCentre.itemindex := strtoint(ReadString('Raise Sales Invoice', 'Revenue Centre Option', ''));
        except
          rdgrpRevenueCentre.itemindex := 0;
        end;
        try
          iRevenueCentre := strtoint(ReadString('Raise Sales Invoice', 'Revenue Centre', '-1'));
        except
          iRevenueCentre := -1;
        end;
      end;
  finally
    IniFile.Free;
  end;

  {Set the revenue centre details}
  if dtmdlWorktops.UseRevenueCentres then
    dtmdlSalesInvoice.RevenueCentre := iRevenueCentre
  else
    dtmdlSalesInvoice.RevenueCentre := -1;

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

procedure TfrmWTLUSalesInvoiceSO.rdgrpRevenueCentreClick(Sender: TObject);
begin
  grpbxRevCentre.Visible := false;
  case (Sender as TRadioGroup).ItemIndex of
      0:  begin
            dtmdlSalesInvoice.RevenueCentre := -1;
            dtmdlSalesInvoice.RefreshSOData;
          end;
      1:  begin
            dtmdlSalesInvoice.RevenueCentre := 0;
            dtmdlSalesInvoice.RefreshSOData;
          end;
  else
    begin
      grpbxRevCentre.Visible := true;
      if dblkpRevCentre.text <> '' then
        begin
          dtmdlSalesInvoice.RevenueCentre := dblkpRevCentre.keyvalue;
          dtmdlSalesInvoice.RefreshSOData;
        end;
    end;
  end;

end;

procedure TfrmWTLUSalesInvoiceSO.FormActivate(Sender: TObject);
begin
  dblkpRevCentre.ListSource := dtmdlSalesInvoice.dtsRevenueCentre;

  with dtmdlSalesInvoice.qryRevenueCentre do
    begin
      close;
      open;
    end;

  if dtmdlSalesInvoice.RevenueCentre > 0 then
    dblkpRevCentre.KeyValue := dtmdlSalesInvoice.RevenueCentre;
end;

procedure TfrmWTLUSalesInvoiceSO.dblkpRevCentreClick(Sender: TObject);
begin
  dtmdlSalesInvoice.RevenueCentre := dblkpRevCentre.KeyValue;
  dtmdlSalesInvoice.RefreshSOData;
end;

procedure TfrmWTLUSalesInvoiceSO.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  with IniFile do
    begin
      WriteString('Raise Sales Invoice', 'Revenue Centre Option', inttostr(rdgrpRevenueCentre.itemindex));
(*      if dblkpRevCentre.text <> '' then
        WriteString('Raise Sales Invoice', 'Revenue Centre', inttostr(dblkpRevCentre.keyvalue))
      else
        WriteString('Raise Sales Invoice', 'Revenue Centre', inttostr(9999));
*)
      if chkbxShowFutureOrders.checked then
        WriteString('Raise Sales Invoice', 'Show Future Orders', 'Y')
      else
        WriteString('Raise Sales Invoice', 'Show Future Orders', 'N');

      if chkbxShow.checked then
        WriteString('Raise Sales Invoice', 'Show Orders Not Fitted', 'Y')
      else
        WriteString('Raise Sales Invoice', 'Show Orders Not Fitted', 'N');
      WriteString('Raise Sales Invoice', 'Revenue Centre', inttostr(dtmdlSalesInvoice.RevenueCentre));
    end;
end;

procedure TfrmWTLUSalesInvoiceSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'SalesInvoicesSO Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);

end;

end.
