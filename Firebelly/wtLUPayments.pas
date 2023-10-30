unit wtLUPayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, ComCtrls,
  AllCommon, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUPayments = class(TForm)
    dbgDetails: TDBGrid;
    srcPayments: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryDelete: TFDQuery;
    Panel2: TPanel;
    Label1: TLabel;
    lblTotalPayments: TLabel;
    qryPayments: TFDQuery;
    qryGetSOPayments: TFDQuery;
    qryUpSOPayments: TFDQuery;
    qryUpSINVPayments: TFDQuery;
    qryGetTotalPayments: TFDQuery;
    lblDeposit: TLabel;
    lblDepositRequired: TLabel;
    pnlHeader: TPanel;
    lblSalesOrder: TLabel;
    lblDescription: TLabel;
    lblCustomer: TLabel;
    lblSalesInvoice: TLabel;
    lblTotalValueLabel: TLabel;
    lblOrderValue: TLabel;
    Label3: TLabel;
    lblOutstanding: TLabel;
    dbgCredits: TDBGrid;
    pnlCreditNotes: TPanel;
    lblCreditNotes: TLabel;
    qryCreditNotes: TFDQuery;
    srcCreditNotes: TDataSource;
    lblCredits: TLabel;
    lblTotalCredits: TLabel;
    qryGetTotalCredits: TFDQuery;
    qryGetTotalSICredits: TFDQuery;
    lblAccountCode: TLabel;
    qryPaymentsPayment: TFDAutoIncField;
    qryPaymentsPayment_date: TSQLTimeStampField;
    qryPaymentsPaid_Amount: TCurrencyField;
    qryPaymentsPayment_Method: TIntegerField;
    qryPaymentsPayment_Description: TWideStringField;
    qryPaymentsPayment_Method_Description: TWideStringField;
    qryPaymentsSales_Order: TIntegerField;
    qryPaymentsSales_Invoice: TIntegerField;
    qryPaymentsAccount_Number: TWideStringField;
    qryPaymentsAccount_Month: TWideStringField;
    qryPaymentsAccount_Year: TWideStringField;
    qryPaymentsInvoice_no: TWideStringField;
    qryCreditNotesInvoice_no: TWideStringField;
    qryCreditNotesInvoice_date: TSQLTimeStampField;
    qryCreditNotesGoods_value: TCurrencyField;
    qryCreditNotesVat_Value: TCurrencyField;
    qryCreditNotesReference: TWideStringField;
    qryCreditNotesdescription: TWideStringField;
    qryCreditNotesTotal_Value: TCurrencyField;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgCreditsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FSalesOrder: integer;
    FSalesInvoice: integer;
    FfunctionMode: string;
    FInvoiceNumber: string;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteFromDB(Payment: integer);
    procedure SetSalesInvoice(const Value: integer);
    procedure SetSalesOrder(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetfunctionMode(const Value: string);
    procedure SetInvoiceNumber(const Value: string);
    { Private declarations }
  public
    bPaymentRequired: boolean;
    rDepositAmount, rDepositTerms, rTotalValue, rTotalPayments, rTotalCredits, rTotalSICredits: real;
    property functionMode: string read FfunctionMode write SetfunctionMode;
    property InvoiceNumber: string read FInvoiceNumber write SetInvoiceNumber;
    property SalesInvoice: integer read FSalesInvoice write SetSalesInvoice;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
  end;

var
  frmwtLUPayments: TfrmwtLUPayments;

implementation

uses
  System.UITypes,
  wtMain, wtMaintPayments;

{$R *.dfm}

procedure TfrmwtLUPayments.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUPayments.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  if FuncMode = 'A' then
    iCode := 0
  else
    iCode := dbgDetails.datasource.dataset.fieldbyname('Payment').asinteger;
    
  frmWTMaintPayments := TfrmWTMaintPayments.create(Application);
  try
    frmWTMaintPayments.FunctionMode := FuncMode;

    frmWTMaintPayments.SalesInvoice := SalesInvoice;
    frmWTMaintPayments.SalesOrder := SalesOrder;

    frmWTMaintPayments.showmodal;
    if frmWTMaintPayments.bOK then
      begin
        iCode := frmWTMaintPayments.iCode;
        Refresh;
        qryPayments.Locate('Payment',Variant(inttostr(iCode)),[]);
      end;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintPayments.free;
  end;
end;

procedure TfrmwtLUPayments.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUPayments.SetButtons(Sender: TObject; Field: TField);
begin
  with srcPayments.DataSet do
  begin
    btnEdit.Enabled := RecordCount > 0;
    btnDelete.Enabled := RecordCount > 0;
    btnExcel.enabled := RecordCount > 0;
    stsBrDetails.panels[0].text := inttostr(RecordCount) + ' records displayed';
  end;
end;

procedure TfrmwtLUPayments.btnDeleteClick(Sender: TObject);
var
  iCode: integer;
begin
  iCode := dbgDetails.datasource.DataSet.fieldbyname('Payment').asinteger;
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DeleteFromDB(qryPayments.fieldbyname('Payment').AsInteger);
        Refresh;
      except
        messagedlg('Payment record' + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;

end;

procedure TfrmwtLUPayments.DeleteFromDB(Payment: integer);
begin
  with qryDelete do
    begin
      close;
      parambyname('Payment').asinteger := Payment;
      execsql;
    end;
end;

procedure TfrmwtLUPayments.BitBtn4Click(Sender: TObject);
var
  rTotalPayments: real;
begin
  if FunctionMode <> 'V' then
    begin

      {Update Sales order payments}
      with qryGetSOPayments do
        begin
          close;
          parambyname('Sales_Order').asinteger := SalesOrder;
          open;

          rTotalPayments := fieldbyname('Total_Payments').asfloat;
        end;

      {If a deposit has been entered in sales order or invoice then check that this has been covered}
//      if rDepositAmount > rTotalPayments then
      if bPaymentRequired and (rDepositAmount > rTotalPayments) then
        begin
          messagedlg('A deposit amount has been entered for the order/invoice of ' + formatfloat('£#,###,##0.00',rDepositAmount) + '.' + #10#13
                        + 'The payments do not cover this. Please add a payment to cover the deposit.', mterror, [mbOk], 0);
          exit;
        end;

      with qryUpSOPayments do
        begin
          close;
          parambyname('Sales_Order').asinteger := SalesOrder;
          parambyname('Deposit_Amount').asfloat := rTotalPayments ;
          execsql;
        end;

      {Update Sales order payments}
      if SalesInvoice <> 0 then
        begin
          rTotalPayments := qryGetTotalPayments.fieldbyname('Total_Payments').AsFloat;
          {Update Sales invoice payments}
          with qryUpSINVPayments do
            begin
              close;
              parambyname('Sales_Invoice').asinteger := SalesInvoice;
              parambyname('Paid_Amount').asfloat := rTotalPayments ;
              parambyname('Deposit_Amount').asfloat := rTotalPayments ;

              if roundfloat(rTotalPayments,2) >= roundfloat(rTotalValue,2) then
                parambyname('Paid_Status').asstring := 'Y'
              else
              if rTotalPayments > 0 then
                parambyname('Paid_Status').asstring := 'P'
              else
                parambyname('Paid_Status').asstring := 'N';
              execsql;
            end;
        end;
    end;
    
  close;
end;

procedure TfrmwtLUPayments.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUPayments.Refresh;
var
  rDepositRequired: real;
begin
  with qryPayments do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := SalesInvoice;
      parambyname('Sales_Order').asinteger := SalesOrder;
      open;
    end;

  {Show Credit Notes}
  with qryCreditNotes do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      parambyname('Invoice_no').asstring := InvoiceNumber;
      open;
    end;

  with qryGetTotalPayments do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := SalesInvoice;
      parambyname('Sales_Order').asinteger := SalesOrder;
      open;

      lblTotalPayments.Caption := formatfloat('£#,###,##0.00', fieldbyname('Total_Payments').asfloat);
      rTotalPayments := fieldbyname('Total_Payments').asfloat;
    end;

  with qryGetTotalCredits do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      parambyname('Invoice_no').asstring := InvoiceNumber;
      open;

      lblTotalCredits.Caption := formatfloat('£#,###,##0.00', fieldbyname('Total_Credits').asfloat);
      rTotalCredits := fieldbyname('Total_Credits').asfloat;
    end;

  with qryGetTotalSICredits do
    begin
      close;
      parambyname('Invoice_no').asstring := InvoiceNumber;
      open;

      rTotalSICredits := fieldbyname('Total_Credits').asfloat;
    end;

  if SalesInvoice > 0 then
    begin
      lblSalesInvoice.caption := 'Sales Invoice: ' + InvoiceNumber;
      lblDepositRequired.caption := '';
      lblDeposit.caption := '';
      lblTotalValueLabel.caption := 'Total Invoice/Credit';
      lblOrderValue.caption := formatfloat('£#,###,##0.00', rTotalValue);
    end
  else
    begin
      lblSalesInvoice.caption := '';
      lblOrderValue.caption := formatfloat('£#,###,##0.00', rTotalValue);
      rDepositRequired := rTotalValue * (rDepositTerms/100);
      lblDepositRequired.caption := formatfloat('£#,###,##0.00', rDepositRequired);
    end;

  if (roundfloat(rTotalValue,2) - roundfloat(rTotalSICredits,2)) <= 0 then
    lblOutstanding.caption := formatfloat('£#,###,##0.00', 0.00)
  else
    lblOutstanding.caption := formatfloat('£#,###,##0.00', (rTotalValue - rTotalPayments - rTotalCredits) );
end;

procedure TfrmwtLUPayments.FormActivate(Sender: TObject);
begin
  Refresh;
  bPaymentRequired := (rDepositAmount > 0) and (rTotalPayments = 0);
end;

procedure TfrmwtLUPayments.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if  (Column.Title.Caption <> 'Amount') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmwtLUPayments.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUPayments);
end;

procedure TfrmwtLUPayments.SetSalesInvoice(const Value: integer);
begin
  FSalesInvoice := Value;
end;

procedure TfrmwtLUPayments.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TfrmwtLUPayments.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
  srcPayments.OnDataChange := SetButtons;
end;

procedure TfrmwtLUPayments.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
  if FFunctionMode = 'V' then
    begin
      btnAdd.visible := false;
      btnEdit.Visible := false;
      btnDelete.Visible := false;
      btnExcel.Visible := false;
    end;
end;

procedure TfrmwtLUPayments.SetInvoiceNumber(const Value: string);
begin
  FInvoiceNumber := Value;
end;

procedure TfrmwtLUPayments.dbgCreditsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if  (Column.Title.Caption <> 'Credit Value') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

end.
