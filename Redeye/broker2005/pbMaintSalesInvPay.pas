unit pbMaintSalesInvPay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSalesInvPayFrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtCustomer: TEdit;
    Label2: TLabel;
    edtInvoiceNo: TEdit;
    Label3: TLabel;
    edtInvoiceDate: TEdit;
    edtTotalGoods: TEdit;
    Label4: TLabel;
    edtReference: TEdit;
    Label6: TLabel;
    Label10: TLabel;
    edtDatePaid: TEdit;
    btnDate: TSpeedButton;
    qryGetInvoice: TFDQuery;
    qryUpInvoice: TFDQuery;
    memTotalPaid: TMemo;
    grpbxCreditCard: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cmbbxMonth: TComboBox;
    edtAccountName: TEdit;
    edtAccountNumber: TEdit;
    cmbbxYear: TComboBox;
    Label13: TLabel;
    chkbxPaid: TCheckBox;
    rdgrpPaymentType: TRadioGroup;
    qryGetSILines: TFDQuery;
    qryGetJobBag: TFDQuery;
    qryUpdJobBag: TFDQuery;
    qryGetPOdelivLines: TFDQuery;
    qryUpdPODeliv: TFDQuery;
    qryUpdPO: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkbxPaidClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDatePaidExit(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure rdgrpPaymentTypeClick(Sender: TObject);
  private
    bPaid: boolean;
    dtPaymentDate: TDateTime;
    sOldValue: string;
    DatePaid: TDateTime;
    FActivated: boolean;
    procedure GetInvoiceDetails;
    procedure SavetoJobBag;
    procedure ShowDetails;
    procedure SavetoDB;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure UpdatePODelivery(tempCode: real; tempLine: integer);
  public
    bOK: boolean;
    Mode: string;
    SalesInvoice: integer;
  end;

var
  PBMaintSalesInvPayFrm: TPBMaintSalesInvPayFrm;

implementation

uses UITypes, CCSCommon, DateSelV5, pbDatabase;

{$R *.DFM}

procedure TPBMaintSalesInvPayFrm.btnOKClick(Sender: TObject);
begin
  {Check the Payment Date}
  if (dtPaymentDate > PBDateStr(edtDatePaid.Text)) and (bPaid = false) then
    begin
      messagedlg('The Paid Date is prior to the last Payment Import date. Please select a date after ' + PBDateStr(dtPaymentDate), mtError, [mbAbort], 0);
      edtDatePaid.SetFocus;
      exit;
    end;

  SavetoDB;
  SavetoJobBag;
  bOK := true;
  close;
end;

procedure TPBMaintSalesInvPayFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    GetInvoiceDetails;
    dtPaymentDate := dmBroker.GetLastPaymentDate;
    ShowDetails;
    FActivated := true;
    enableok(self);
  end;
end;

procedure TPBMaintSalesInvPayFrm.GetInvoiceDetails;
begin
  with qryGetInvoice do
    begin
      close;
      parambyname('Sales_invoice').asinteger := SalesInvoice;
      open;
    end;
end;

procedure TPBMaintSalesInvPayFrm.ShowDetails;
begin
  edtCustomer.text := qryGetInvoice.fieldbyname('Customer_Name').asstring;
  edtInvoiceNo.text := qryGetInvoice.fieldbyname('Sales_Invoice_no').asstring;
  edtInvoiceDate.text := pbDateStr(qryGetInvoice.fieldbyname('Invoice_Date').asdatetime);
  edtReference.text := qryGetInvoice.fieldbyname('Reference').asstring;
  edtTotalGoods.text := formatfloat('0.00',qryGetInvoice.fieldbyname('Total_Value').asfloat);
  memTotalPaid.text := formatfloat('0.00',qryGetInvoice.fieldbyname('Paid_Amount').asfloat);
  edtAccountNumber.text := qryGetInvoice.fieldbyname('Account_Number').asstring;
  edtAccountName.text := qryGetInvoice.fieldbyname('Contact_Name').asstring;
  cmbbxMonth.text := qryGetInvoice.fieldbyname('Account_Month').asstring;
  cmbbxYear.text := qryGetInvoice.fieldbyname('Account_Year').asstring;

  chkbxPaid.Checked := qryGetInvoice.fieldbyname('Paid_Status').asstring = 'Y';
  bPaid := (qryGetInvoice.fieldbyname('Paid_Status').asstring = 'Y');
  
  if qryGetInvoice.fieldbyname('Payment_Method').asinteger = 0 then
    rdgrpPaymentType.itemindex := 0
  else
    rdgrpPaymentType.itemindex := qryGetInvoice.fieldbyname('Payment_Method').asinteger - 1;

  if pbDateStr(qryGetInvoice.fieldbyname('Paid_Date').asdatetime) = '' then
    begin
      edtDatePaid.text := pbDateStr(date);
      DatePaid := date;
    end
  else
    begin
      edtDatePaid.text := pbDateStr(qryGetInvoice.fieldbyname('Paid_Date').asdatetime);
      DatePaid := qryGetInvoice.fieldbyname('Paid_Date').asdatetime;
    end;
end;

procedure TPBMaintSalesInvPayFrm.SavetoDB;
begin
  with qryUpInvoice do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := SalesInvoice;
      parambyname('Account_Number').asstring := edtAccountNumber.text;
      parambyname('Contact_Name').asstring := edtAccountName.text;
      parambyname('Account_Month').asstring := cmbbxMonth.text;
      parambyname('Account_Year').asstring := cmbbxYear.text;
      parambyname('Paid_Amount').asfloat := StrToFloatDef(memTotalPaid.text, 0, FormatSettings);
      parambyname('Paid_Date').asdatetime := pbdatestr(edtDatePaid.text);
      parambyname('Payment_Method').asinteger := (rdgrpPaymentType.ItemIndex + 1);
      if (StrToFloatDef(memTotalPaid.text, 0, FormatSettings) = 0) and (StrToFloatDef(edtTotalGoods.Text, 0, FormatSettings) <> 0) then
        begin
          parambyname('Paid_Status').asstring := '';
          parambyname('Paid_Date').clear;
        end
      else
      if StrToFloatDef(memTotalPaid.text, 0, FormatSettings) = StrToFloatDef(edtTotalGoods.text, 0, FormatSettings) then
        parambyname('Paid_Status').asstring := 'Y'
      else
        parambyname('Paid_Status').asstring := 'p';
      execsql;
    end;
end;

procedure TPBMaintSalesInvPayFrm.chkbxPaidClick(Sender: TObject);
begin
  if (Sender as TCheckbox).state = cbChecked then
    begin
      memTotalPaid.text := formatfloat('0.00',qryGetInvoice.fieldbyname('Total_Value').asfloat);
      rdgrppaymentType.Enabled := true;
      grpbxCreditCard.Enabled := true;
    end
  else
  if (Sender as TCheckbox).state = cbUnChecked then
    begin
      memTotalPaid.text := formatfloat('0.00',0);
      rdgrppaymentType.Enabled := false;
      grpbxCreditCard.Enabled := false;
    end;
  enableok(self);
end;

procedure TPBMaintSalesInvPayFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSalesInvPayFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintSalesInvPayFrm.btnDateClick(Sender: TObject);
begin
  DatePaid := InputDate(DatePaid);
  edtDatePaid.Text := PBDatestr(DatePaid);
  enableok(self);
end;

function TPBMaintSalesInvPayFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;

end;

procedure TPBMaintSalesInvPayFrm.edtDatePaidExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDatePaid.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDatePaid.SetFocus;
      Exit;
    end;
  end;

  edtDatePaid.Text := PBDatestr(NewDate);
  DatePaid := NewDate;
end;

procedure TPBMaintSalesInvPayFrm.enableOK(Sender: TObject);
begin
  if (chkbxPaid.checked) and (rdgrpPaymentType.ItemIndex = 0) then
    begin
      btnOK.enabled :=  (edtDatePaid.Text <> '') and
                        (memTotalPaid.Text <> '') and
                        (edtAccountNumber.Text <> '') and
                        (edtAccountName.Text <> '') and
                        (cmbbxMonth.text <> '') and
                        (cmbbxYear.Text <> '');
    end
  else
  if (chkbxPaid.checked) then
    begin
      btnOK.enabled :=  (edtDatePaid.Text <> '') and
                        (memTotalPaid.Text <> '')
    end
  else
    begin
      btnOK.enabled :=  true;
    end;
end;

procedure TPBMaintSalesInvPayFrm.rdgrpPaymentTypeClick(Sender: TObject);
begin
  grpBxCreditCard.enabled := (rdgrpPaymentType.ItemIndex = 0);
  enableok(self);
end;

procedure TPBMaintSalesInvPayFrm.SavetoJobBag;
begin
  {need to check if this invoice is connected to a job bag, if so then release the job}
  with qryGetSILines do
    begin
      close;
      parambyname('sales_invoice').asinteger := SalesInvoice;
      open;

      while eof <> true do
        begin
          if fieldbyname('Purchase_Order').asfloat <> 0 then
            UpdatePODelivery(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
          qryGetJobBag.close;
          qryGetJobBag.parambyname('Purchase_Order').asfloat := qryGetSILines.fieldbyname('Purchase_Order').asfloat;
          qryGetJobBag.parambyname('Line').asinteger := qryGetSILines.fieldbyname('Line').asinteger;
          qryGetJobBag.open;

          if qryGetJobBag.recordcount > 0 then
            begin
              qryUpdJobBag.close;
              qryUpdJobBag.parambyname('Job_Bag').asinteger := qryGetJobBag.fieldbyname('Job_Bag').asinteger;
              if StrToFloatDef(memTotalPaid.text, 0, FormatSettings) = StrToFloatDef(edtTotalGoods.text, 0, FormatSettings) then
                qryUpdJobBag.parambyname('On_Hold').asstring := 'N'
              else
                qryUpdJobBag.parambyname('On_Hold').asstring := 'P';
              qryUpdJobBag.execsql;
            end;
          next;
        end;
    end;
end;

procedure TPBMaintSalesInvPayFrm.UpdatePODelivery(tempCode: real; tempLine: integer);
begin
  {need to check if the invoice lines are associated with purchase orders}
  with qryGetPODelivLines do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;

      while eof <> true do
        begin
          if (fieldbyname('Qty_Delivered').asinteger > 0) or (fieldbyname('Delivery_to_stock').asstring = 'Y') then
            begin
              next;
              continue;
            end;
          qryUpdPODeliv.close;
          qryUpdPODeliv.parambyname('Purchase_Order').asfloat := tempCode;
          qryUpdPODeliv.parambyname('Line').asinteger := tempLine;
          qryUpdPODeliv.parambyname('Delivery_no').asinteger := fieldbyname('Delivery_no').asinteger;
          qryUpdPODeliv.parambyname('Date_Deliv_Actual').asdatetime := date;
          qryUpdPODeliv.execsql;
          next;
        end;

      qryUpdPO.close;
      qryUpdPO.parambyname('Purchase_Order').asfloat := tempCode;
      qryUpdPO.parambyname('Line').asinteger := tempLine;
      qryUpdPO.ExecSQL;
    end;
end;

end.
