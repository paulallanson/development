(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Process Sales Invoices.

VSS Info:
$Header: /PBL D5/PBLUSalesInvoiceCN.pas 7     20/06/03 9:52 Andrewh $
$History: PBLUSalesInvoiceCN.pas $
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 19/03/03   Time: 10:40
 * Updated in $/PBL D5
 * More changes related to Credit Note processing
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 18/03/03   Time: 12:17
 * Updated in $/PBL D5
 * Further changes to Sales Credits to allow specifiying of Credit Type
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 17/03/:3   Time: 17:20
 * Updated in $/PBL D5
 * Further changes to credit notes
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 17/03/:3   Time: 12:15
 * Created in $/PBL D5
 * Initial take on of NEW Sales credit note programs
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 30/01/:3   Time: 16:08
 * Updated in $/PBL D5
 * Interim check in
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 6/01/:3    Time: 11:22
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 13/12/:2   Time: 16:54
 * Updated in $/PBL D5
 * Periodical update
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 2/12/:2    Time: 16:54
 * Updated in $/PBL D5
 * Various changes made
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 20/11/:2   Time: 9:35
 * Created in $/PBL D5
 * 
*******************************************************************************)
unit PBLUSalesInvoiceCN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, PBPOObjects, Inifiles,
  ComCtrls, ImgList, ToolWin, PBJobBagDM, PBSalesInvoiceDm, Menus,
  System.ImageList;

type
  TPBLUSalesInvoiceCNfrm = class(TForm)
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
  PBLUSalesInvoiceCNfrm: TPBLUSalesInvoiceCNfrm;
  sInvFuncMode: string[1];

implementation

uses
  PBMaintSalesInvoice, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBLUSalesInvoiceCNfrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUSalesInvoiceCNfrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUSalesInvoiceCNfrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  dmSalesInvoice.dsSIHeaderGrid.OnDataChange := SetButtons;
  dmSalesInvoice.qrySIHeaderGrid.AfterScroll := SetSalesInvoiceEdit;

  dmSalesInvoice.qryCompany.close;
  dmSalesInvoice.qryCompany.open;
end;

procedure TPBLUSalesInvoiceCNfrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnSelect.enabled := (qrySIHeaderGrid.recordcount > 0);
    stsBrInvoices.panels[0].text := inttostr(qrySIHeaderGrid.recordcount) + ' sales invoices listed';
  end;
end;

procedure TPBLUSalesInvoiceCNfrm.SetSalesInvoiceEdit(Dataset: TDataset);
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

procedure TPBLUSalesInvoiceCNfrm.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
end;

procedure TPBLUSalesInvoiceCNfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  dmSalesInvoice.refreshdata;
end;

procedure TPBLUSalesInvoiceCNfrm.NameEditChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dmSalesInvoice.Customer := NameEdit.Text;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSalesInvoiceCNfrm.CheckBoxInActiveClick(Sender: TObject);
begin
  dmSalesInvoice.displayInactive := (sender as Tcheckbox).checked;
  dmSalesInvoice.refreshdata;
end;

procedure TPBLUSalesInvoiceCNfrm.ArchiveCheckBoxClick(Sender: TObject);
begin
  dmSalesInvoice.displayArchived := (sender as Tcheckbox).checked;
  dmSalesInvoice.refreshdata;
end;

procedure TPBLUSalesInvoiceCNfrm.edtSalesInvNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgSalesInvoice.Datasource.Dataset.Locate('Sales_Invoice_no', Variant(edtSalesInvNo.Text), [loPartialKey]) then
      btnSelectClick(self)
    else
      ShowMessage('Sales Invoice: '+ edtSalesInvNo.Text + ' does not exist in the current selection.');
  end;
end;

procedure TPBLUSalesInvoiceCNfrm.FormShow(Sender: TObject);
begin
//  dmSalesInvoice.refreshdata;
  dmSalesInvoice.DisplayArchived := true;
  dbgSalesInvoice.datasource := dmsalesInvoice.dsSIHeaderGrid;
end;

procedure TPBLUSalesInvoiceCNfrm.dbgSalesInvoiceDblClick(Sender: TObject);
begin
  btnSelectclick(self);
end;

procedure TPBLUSalesInvoiceCNfrm.dbgSalesInvoiceDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (dmSalesInvoice.dsSIHeaderGrid.dataset.fieldbyname('Invoice_or_credit').asstring = 'I') and
    (dmSalesInvoice.dsSIHeaderGrid.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clFuchsia;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  if  (Column.Title.Caption <> 'Invoice No') and
      (Column.Title.Caption <> 'Goods Value') and
      (Column.Title.Caption <> 'VAT Value') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if (Column.Title.Caption <> 'Invoice No') and
               (Column.Title.Caption <> 'Goods Value') and
               (Column.Title.Caption <> 'VAT Value') then
              	begin
        			    Canvas.Brush.Color := Color;
        			    Canvas.Font.Color  := Font.Color;
        			    Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, Column.field.asstring);
                end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Goods Value') or
          (Column.Title.Caption = 'VAT Value') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

      Column.Alignment := taRightJustify;
    end;
end;

procedure TPBLUSalesInvoiceCNfrm.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Create a Credit Note for the selected invoice?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes
    then Exit;
  CreateSalesCredit;
end;

procedure TPBLUSalesInvoiceCNFrm.CreateSalesCredit;
var
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
begin
  try
    aInvoice := TSalesInvoice.Create(dmSalesInvoice);
    try
      try
        if dbgSalesInvoice.DataSource.dataset.fieldbyname('Sales_invoice_Type').asstring = 'J' then
          dmSalesInvoice.JBNumber := dbgSalesInvoice.DataSource.dataset.fieldbyname('Reference').asinteger
        else
          dmSalesInvoice.JBNumber := 0;
      except
        dmSalesInvoice.JBNumber := 0;
      end;
      dmSalesInvoice.SInvoiceNumber := dbgSalesInvoice.DataSource.dataset.fieldbyname('Sales_invoice').asinteger;
      dmSalesInvoice.InvoiceDate := PBDateStr(InvoiceDate);
      aInvoice.LoadCreditFromSI;
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
  finally
  end;
end;

procedure TPBLUSalesInvoiceCNfrm.SetInvoiceDate(const Value: string);
begin
  FInvoiceDate := Value;
end;

end.


