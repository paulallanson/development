unit PBLUSalesInvoiceSO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, Mask, DBCtrls,
  ComCtrls, PBSalesInvoiceDM, CCSCommon;

type
  TPBLUSalesInvoiceSOfrm = class(TForm)
    dbgSO: TDBGrid;
    SearchTimer: TTimer;
    stbrDetails: TStatusBar;
    Panel1: TPanel;
    CustomerGroupBox: TGroupBox;
    Label1: TLabel;
    edtCustomerName: TEdit;
    GroupBox1: TGroupBox;
    edtSONumber: TEdit;
    GroupBox2: TGroupBox;
    btnSelect: TBitBtn;
    btnClose: TBitBtn;
    CheckBox1: TCheckBox;
    btnSweep: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgSOCellClick(Column: TColumn);
    procedure SearchTimerTimer(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure edtSONumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSODblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FInvoiceDate: string;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetSalesOrderEdit(Dataset: TDataset);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetInvoiceDate(const Value: string);
  public
   property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
   property InvoiceDate: string read FInvoiceDate write SetInvoiceDate;
  end;

var
  PBLUSalesInvoiceSOfrm: TPBLUSalesInvoiceSOfrm;

implementation

uses UITypes, 
  PBMaintSalesInvoice;

{$R *.DFM}

procedure TPBLUSalesInvoiceSOfrm.FormShow(Sender: TObject);
begin
  dmSalesInvoice.refreshSOdata;
  with dbgSO do
    begin
      try
        if Assigned(datasource.dataset) then
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
 edtSONumber.setfocus;
end;

procedure TPBLUSalesInvoiceSOfrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  dbgSO.DataSource := dmSalesInvoice.dsSOAll;
  dmSalesInvoice.dsSOAll.OnDataChange := SetButtons;
  dmSalesInvoice.qrySOAll.AfterScroll := SetSalesOrderEdit;
end;

procedure TPBLUSalesInvoiceSOfrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnSelect.enabled := (qrySOAll.recordcount > 0);
    btnSweep.enabled := (qrySOAll.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qrySOAll.recordcount) + ' sales orders listed';
  end;
end;

procedure TPBLUSalesInvoiceSOfrm.SetSalesOrderEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgSO.datasource := dmSalesInvoice.dsSOAll;
      try
        edtSONumber.Text := floatToStr(Dataset.FieldByName('Sales_Order').asinteger);
      except
        edtSONumber.Text := '';
      end;
    end
  else
    dbgSO.datasource := dmSalesInvoice.dsDummy;
end;

procedure TPBLUSalesInvoiceSOfrm.dbgSOCellClick(Column: TColumn);
begin
  with dbgSO do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

procedure TPBLUSalesInvoiceSOfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSalesInvoice.CustomerName := edtCustomerName.text;
  dmSalesInvoice.RefreshSOData;
  with dbgSO do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBLUSalesInvoiceSOfrm.edtCustomerNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSalesInvoiceSOfrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSalesInvoiceSOfrm.SetInvoiceDate(const Value: string);
begin
  FInvoiceDate := Value;
end;

procedure TPBLUSalesInvoiceSOfrm.btnSelectClick(Sender: TObject);
var
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  icount: integer;
begin
  if dbgSO.SelectedRows.Count = 1 then
    begin
      aInvoice := TSalesInvoice.Create(dmSalesInvoice);
      try
        dmSalesInvoice.SONumber := dbgSO.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
        dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);
        aInvoice.LoadFromSO;
        Frm := TPBMaintSalesInvoicefrm.Create(Self);
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
          for iCount := 0 to (dbgSO.SelectedRows.Count - 1) do
            begin
              dbgSO.datasource.DataSet.GotoBookmark(TBookmark(dbgSO.SelectedRows[iCount])) ;
              aInvoice := TSalesInvoice.Create(dmSalesInvoice);
              try
                dmSalesInvoice.SONumber := dbgSO.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);
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

procedure TPBLUSalesInvoiceSOfrm.edtSONumberKeyPress(Sender: TObject;
  var Key: Char);
var
  sTempCode: string;
begin
  if Key = #13 then { if it's an enter key }
  begin
    {Save the original entry}
    sTempCode := edtSONumber.Text;

    {Unselect everything}
    with dbgSO.DataSource.dataset do
      begin
        first ;
        while EOF <> true do
          begin
            dbgSO.SelectedRows.CurrentRowSelected := false ;
            next ;
           end;
        first;
      end;
      
    if dbgSO.Datasource.Dataset.Locate('Sales_Order',Variant(sTempCode), [loPartialKey]) then
      begin
        dbgSo.SelectedRows.CurrentRowSelected := True ;
        btnSelectClick(self)
      end
    else
      ShowMessage('Sales Order: '+ edtSONumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TPBLUSalesInvoiceSOfrm.dbgSODblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSalesInvoiceSOfrm.CheckBox1Click(Sender: TObject);
begin
  dmSalesInvoice.bShowUninvoicedSO := (sender as TCheckbox).checked;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSalesInvoiceSOfrm.btnSweepClick(Sender: TObject);
begin
  with dbgSO.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgSO.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

end.
