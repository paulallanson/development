unit WTLUSalesInvoiceCN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data.DB, Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Inifiles, wtSalesInvoiceDM;

type
  TfrmWTLUSalesInvoiceCN = class(TForm)
    SearchTimer: TTimer;
    ImgLstHot: TImageList;
    ImgLstCold: TImageList;
    pnlDetail: TPanel;
    dbgSalesInvoice: TDBGrid;
    pnlSelection: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    NameEdit: TEdit;
    stsBrInvoices: TStatusBar;
    edtSalesInvNo: TEdit;
    lblSalesInvNo: TLabel;
    pmnRaise: TPopupMenu;
    btnFromProduction: TMenuItem;
    btnfromJobBag: TMenuItem;
    btnFromSalesOrder: TMenuItem;
    pmnDummy: TPopupMenu;
    GroupBox2: TGroupBox;
    btnSelect: TBitBtn;
    btnClose: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure CheckBoxInActiveClick(Sender: TObject);
    procedure ArchiveCheckBoxClick(Sender: TObject);
    procedure edtSalesInvNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbgSalesInvoiceDblClick(Sender: TObject);
    procedure dbgSalesInvoiceDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnSelectClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FInvoiceDate: string;
    dmSalesInvoiceCN: TdtmdlSalesInvoice;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetSalesInvoiceEdit(Dataset: TDataset);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CreateSalesCredit;
    procedure SetInvoiceDate(const Value: string);
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property InvoiceDate: string read FInvoiceDate write SetInvoiceDate;
  end;

var
  frmWTLUSalesInvoiceCN: TfrmWTLUSalesInvoiceCN;
  sInvFuncMode: string[1];

implementation

uses
  wtMaintSalesInvoice, AllCommon;

{$R *.DFM}

procedure TfrmWTLUSalesInvoiceCN.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUSalesInvoiceCN.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesInvoiceCN.FormCreate(Sender: TObject);
begin
  dmSalesInvoiceCN := TdtmdlSalesInvoice.create(self);
  dmSalesInvoiceCN.dsSIHeaderGrid.OnDataChange := SetButtons;
  dmSalesInvoiceCN.qrySIHeaderGrid.AfterScroll := SetSalesInvoiceEdit;

  dmSalesInvoiceCN.qryCompany.close;
  dmSalesInvoiceCN.qryCompany.open;
end;

procedure TfrmWTLUSalesInvoiceCN.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoiceCN do
  begin
    btnSelect.enabled := (qrySIHeaderGrid.recordcount > 0);
    stsBrInvoices.panels[0].text := inttostr(qrySIHeaderGrid.recordcount) + ' sales invoices listed';
  end;
end;

procedure TfrmWTLUSalesInvoiceCN.SetSalesInvoiceEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
      try
        edtSalesInvNo.Text := floatToStr(Dataset.FieldByName('Sales_Invoice_no').asfloat);
      except
        edtSalesInvNo.Text := '';
      end;
    end;
end;

procedure TfrmWTLUSalesInvoiceCN.FormDestroy(Sender: TObject);
begin
  dmSalesInvoiceCN.free;
end;

procedure TfrmWTLUSalesInvoiceCN.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSalesInvoiceCN.refreshdata;
end;

procedure TfrmWTLUSalesInvoiceCN.NameEditChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dmSalesInvoiceCN.Customer := NameEdit.Text;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TfrmWTLUSalesInvoiceCN.CheckBoxInActiveClick(Sender: TObject);
begin
  dmSalesInvoiceCN.displayInactive := (sender as Tcheckbox).checked;
  dmSalesInvoiceCN.refreshdata;
end;

procedure TfrmWTLUSalesInvoiceCN.ArchiveCheckBoxClick(Sender: TObject);
begin
  dmSalesInvoiceCN.displayArchived := (sender as Tcheckbox).checked;
  dmSalesInvoiceCN.refreshdata;
end;

procedure TfrmWTLUSalesInvoiceCN.edtSalesInvNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgSalesInvoice.Datasource.Dataset.Locate('Invoice_no', Variant(edtSalesInvNo.Text), [loPartialKey]) then
      btnSelectClick(self)
    else
      ShowMessage('Sales Invoice: '+ edtSalesInvNo.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmWTLUSalesInvoiceCN.FormShow(Sender: TObject);
begin
//  dmSalesInvoice.refreshdata;
  dmSalesInvoiceCN.DisplayArchived := true;
  dbgSalesInvoice.datasource := dmSalesInvoiceCN.dsSIHeaderGrid;
end;

procedure TfrmWTLUSalesInvoiceCN.dbgSalesInvoiceDblClick(Sender: TObject);
begin
  btnSelectclick(self);
end;

procedure TfrmWTLUSalesInvoiceCN.dbgSalesInvoiceDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
VAR
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  TempRect := Rect;
  if (dmSalesInvoiceCN.dsSIHeaderGrid.dataset.fieldbyname('Invoice_or_credit').asstring = 'I') and
    (dmSalesInvoiceCN.dsSIHeaderGrid.dataset.fieldByName('Inactive').AsString = 'Y') then
    (Sender as TDBGrid).Canvas.font.Color := clFuchsia;
  if  (Column.Title.Caption <> 'Invoice No') and
      (Column.Title.Caption <> 'Goods Value') and
      (Column.Title.Caption <> 'VAT Value') then
  	begin
  		StrPCopy(txt, Column.field.asstring);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if  (Column.Title.Caption <> 'Invoice No') and
              (Column.Title.Caption <> 'Goods Value') and
               (Column.Title.Caption <> 'VAT Value') then
              	begin
        			Canvas.Brush.Color := Color;
        			Canvas.Font.Color  := Font.Color;
        			Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
          			Column.field.asstring);
                 end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Goods Value') or
          (Column.Title.Caption = 'VAT Value') then
        try
            sValue := formatfloat('£#,###,##0.00',StrToFloatDef(Column.field.asstring, 0, FormatSettings))
        except
          sValue := ''
        end
      else
        sValue := Column.field.asstring;
  		StrPCopy(Txt, sValue);

  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmWTLUSalesInvoiceCN.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Create a Credit Note for the selected invoice?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes
    then Exit;
  CreateSalesCredit;
end;

procedure TfrmWTLUSalesInvoiceCN.CreateSalesCredit;
var
  frm : TfrmWTMaintSalesInvoice;
  aInvoice : TSalesInvoice;
begin
  try
    aInvoice := TSalesInvoice.Create(dmSalesInvoiceCN);
    try
      dmSalesInvoiceCN.SInvoiceNumber := dbgSalesInvoice.DataSource.dataset.fieldbyname('Sales_invoice').asinteger;
      dmSalesInvoiceCN.InvoiceDate := paDateStr(InvoiceDate);
      aInvoice.LoadCreditFromSI;
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
  finally
  end;
end;

procedure TfrmWTLUSalesInvoiceCN.SetInvoiceDate(const Value: string);
begin
  FInvoiceDate := Value;
end;

end.


