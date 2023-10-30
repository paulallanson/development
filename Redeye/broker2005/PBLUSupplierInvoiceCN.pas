unit PBLUSupplierInvoiceCN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBGrids, Db, Menus, Buttons, PBSupplierInvoiceDM;

type
  TPBLUSupplierInvoiceCNFrm = class(TForm)
    Panel1: TPanel;
    stBrDetails: TStatusBar;
    GroupBox1: TGroupBox;
    edtSupplierName: TEdit;
    SearchTimer: TTimer;
    GroupBox2: TGroupBox;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    dbgSupplierInvoice: TDBGrid;
    procedure SearchTimerTimer(Sender: TObject);
    procedure edtSupplierNameChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgSupplierInvoiceDblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgSupplierInvoiceCellClick(Column: TColumn);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CreateSupplierCredit;
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  PBLUSupplierInvoiceCNFrm: TPBLUSupplierInvoiceCNFrm;

implementation

uses UITypes, 
  PBMaintSuppInvoice;

{$R *.DFM}

procedure TPBLUSupplierInvoiceCNFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSupplierInvoice do
  begin
    btnSelect.enabled := (qrySIHeaderGrid.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qrySIHeaderGrid.recordcount) + ' supplier invoices listed';
  end;
end;

procedure TPBLUSupplierInvoiceCNFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSupplierInvoice.refreshdata;
end;

procedure TPBLUSupplierInvoiceCNFrm.edtSupplierNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dmSupplierInvoice.Supplier := edtSupplierName.Text;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSupplierInvoiceCNFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSupplierInvoiceCNFrm.FormDestroy(Sender: TObject);
begin
  dmSupplierInvoice.free;
end;

procedure TPBLUSupplierInvoiceCNFrm.FormShow(Sender: TObject);
begin
  dmSupplierInvoice.SupplierName := edtSupplierName.text;
  dmSupplierInvoice.DisplayArchived := true;
//  dmSupplierInvoice.refreshdata;
  dbgSupplierInvoice.datasource := dmsupplierInvoice.dsSIHeaderGrid;
end;

procedure TPBLUSupplierInvoiceCNFrm.dbgSupplierInvoiceDblClick(
  Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSupplierInvoiceCNFrm.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Create a Supplier Credit Note for the selected invoice?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes
    then Exit;
  CreateSupplierCredit;
end;

procedure TPBLUSupplierInvoiceCNFrm.FormCreate(Sender: TObject);
begin
  stbrDetails.Top := Screen.Height - stbrDetails.Height;

  dmSupplierInvoice := TdmSupplierInvoice.Create(Self);
  dmSupplierInvoice.dsSIHeaderGrid.OnDataChange := SetButtons;
end;

procedure TPBLUSupplierInvoiceCNFrm.CreateSupplierCredit;
var
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
begin
  try
    aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
    try
      dmSupplierInvoice.PINumber := dbgSupplierInvoice.DataSource.dataset.fieldbyname('Supplier_invoice').asinteger;

      aInvoice.LoadCreditFromPI;
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

procedure TPBLUSupplierInvoiceCNFrm.dbgSupplierInvoiceCellClick(
  Column: TColumn);
begin
  with dbgSupplierInvoice do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

end.
