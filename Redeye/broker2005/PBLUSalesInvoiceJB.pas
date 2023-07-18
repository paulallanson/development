unit PBLUSalesInvoiceJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls, Mask, DBCtrls,
  ComCtrls, PBSalesInvoiceDM, CCSCommon;

type
  TPBLUSalesInvoiceJBfrm = class(TForm)
    dbgJB: TDBGrid;
    SearchTimer: TTimer;
    stbrDetails: TStatusBar;
    Panel1: TPanel;
    CustomerGroupBox: TGroupBox;
    Label1: TLabel;
    edtCustomerName: TEdit;
    GroupBox1: TGroupBox;
    edtJBNumber: TEdit;
    GroupBox2: TGroupBox;
    btnSelect: TBitBtn;
    btnClose: TBitBtn;
    btnSweep: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgJBCellClick(Column: TColumn);
    procedure SearchTimerTimer(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure edtJBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbgJBDblClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FInvoiceDate: string;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetJobBagEdit(Dataset: TDataset);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetInvoiceDate(const Value: string);
  public
   property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
   property InvoiceDate: string read FInvoiceDate write SetInvoiceDate;
  end;

var
  PBLUSalesInvoiceJBfrm: TPBLUSalesInvoiceJBfrm;

implementation

uses PBMaintSalesInvoice, pbDatabase, pbMainMenu, PBAuditDM;

{$R *.DFM}

procedure TPBLUSalesInvoiceJBfrm.FormShow(Sender: TObject);
begin
  dmSalesInvoice.refreshJBdata;
  with dbgJB do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtJBNumber.setfocus;
end;

procedure TPBLUSalesInvoiceJBfrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  dmSalesInvoice.dsJBAll.OnDataChange := SetButtons;
  dmSalesInvoice.qryJBAll.AfterScroll := SetJobBagEdit;
end;

procedure TPBLUSalesInvoiceJBfrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnSelect.enabled := (qryJBAll.recordcount > 0);
    btnSweep.Enabled := (qryJBAll.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qryJBAll.recordcount) + ' Job Bags listed';
  end;
end;

procedure TPBLUSalesInvoiceJBfrm.SetJobBagEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgJB.datasource := dmSalesInvoice.dsJBAll;
      try
        edtJBNumber.Text := floatToStr(Dataset.FieldByName('Job_Bag').asinteger);
      except
        edtJBNumber.Text := '';
      end;
    end
  else
    dbgJB.datasource := dmSalesInvoice.dsDummy;
end;

procedure TPBLUSalesInvoiceJBfrm.dbgJBCellClick(Column: TColumn);
begin
  with dbgJB do
   if SelectedRows.count > 0 then
      btnSelect.enabled := true;
end;

procedure TPBLUSalesInvoiceJBfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSalesInvoice.CustomerName := edtCustomerName.text;
  dmSalesInvoice.RefreshJBData;
  with dbgJB do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBLUSalesInvoiceJBfrm.edtCustomerNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSalesInvoiceJBfrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSalesInvoiceJBfrm.SetInvoiceDate(const Value: string);
begin
  FInvoiceDate := Value;
end;

procedure TPBLUSalesInvoiceJBfrm.btnSelectClick(Sender: TObject);
var
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  icount: integer;
begin
  if dbgjb.SelectedRows.Count = 1 then
    begin
      try
        aInvoice := TSalesInvoice.Create(dmSalesInvoice);

        dmSalesInvoice.JBNumber := dbgJB.DataSource.dataset.fieldbyname('Job_Bag').asinteger;
        dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);
        aInvoice.LoadFromJB;
        Frm := TPBMaintSalesInvoicefrm.Create(Self);
        try
          Frm.Mode := siRaise;
          Frm.SalesInvoice := aInvoice;

          // Check if this job bag number is locked
          case dmBroker.LockRecord(inttostr(dmSalesInvoice.JBNumber),'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation, false) of
            0:;
            1: exit;
            2: exit
          end;

          Frm.ShowModal;
          if Frm.ModalResult = idOK then
            ModalResult := idok;
        finally
          Frm.Free;
        end;
      finally
        dmBroker.UnlockRecord(inttostr(dmSalesInvoice.JBNumber),'','','','','Job Bag',frmPBMainMenu.Workstation);
        aInvoice.Free;
      end;
    end
  else
    begin
      if MessageDlg('Do you want to raise invoices for the selected job bags?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgjb.SelectedRows.Count - 1) do
            begin
              dbgjb.datasource.DataSet.GotoBookmark(TBookmark(dbgjb.SelectedRows[iCount])) ;
              aInvoice := TSalesInvoice.Create(dmSalesInvoice);
              try
                dmSalesInvoice.JBNumber := dbgJB.DataSource.dataset.fieldbyname('Job_Bag').asinteger;
                dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);

                // Check if this job bag number is locked
                case dmBroker.LockRecord(inttostr(dmSalesInvoice.JBNumber),'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation, false) of
                  0:;
                  1: exit;
                  2: exit
                end;

                aInvoice.LoadFromJB;
                aInvoice.SaveToDB(true);

                {Write ADD sales invoice number to audit trail} ;
                PBAuditDataMod.WriteAudit(1300, aInvoice.dbkey, 0, 0, 0, inttostr(aInvoice.dbkey)) ;

                ModalResult := idOK;
              finally
                dmBroker.UnlockRecord(inttostr(dmSalesInvoice.JBNumber),'','','','','Job Bag',frmPBMainMenu.Workstation);
                aInvoice.Free;
              end;
            end;
        end;
    end;
end;

procedure TPBLUSalesInvoiceJBfrm.edtJBNumberKeyPress(Sender: TObject;
  var Key: Char);
var
  sTempCode: string;
begin
  if Key = #13 then { if it's an enter key }
  begin
    {Save the original entry}
    sTempCode := edtJBNumber.Text;

    {Unselect everything}
    with dbgJB.DataSource.dataset do
      begin
        first ;
        while EOF <> true do
          begin
            dbgJB.SelectedRows.CurrentRowSelected := false ;
            next ;
           end;
        first;
      end;
      
    if dbgJB.Datasource.Dataset.Locate('Job_Bag',Variant(sTempCode), [loPartialKey]) then
      begin
        dbgJB.SelectedRows.CurrentRowSelected := True ;
        btnSelectClick(self)
      end
    else
      ShowMessage('Job Bag: '+ edtJBNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TPBLUSalesInvoiceJBfrm.dbgJBDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSalesInvoiceJBfrm.btnSweepClick(Sender: TObject);
begin
  with dbgJB.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgJB.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

end.
