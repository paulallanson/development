unit WTMaintLastNumbers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CRControls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintLastNumbers = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label65: TLabel;
    edtLastQuoteNumber: TCREditInt;
    edtLastContractQuoteNumber: TCREditInt;
    edtLastJobNumber: TCREditInt;
    edtLastSalesOrderNumber: TCREditInt;
    edtLastPurchaseOrderNumber: TCREditInt;
    edtLastInvoiceNumber: TCREditInt;
    edtLastCreditNoteNumber: TCREditInt;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryUpCompany: TFDQuery;
    qryCompany: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    procedure SaveToDB;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTMaintLastNumbers: TfrmWTMaintLastNumbers;

implementation

{$R *.dfm}

procedure TfrmWTMaintLastNumbers.FormActivate(Sender: TObject);
begin
  with qryCompany do
    begin
      open;
      edtLastQuoteNumber.text := inttostr(fieldbyname('Last_Quote_Number').asinteger);
      edtLastContractQuoteNumber.text := inttostr(fieldbyname('Last_Contract_Quote_Number').asinteger);
      edtLastJobNumber.text := inttostr(fieldbyname('Last_Job_Number').asinteger);
      edtLastSalesOrderNumber.text := inttostr(fieldbyname('Last_Sales_Order_Number').asinteger);
      edtLastPurchaseOrderNumber.text := inttostr(fieldbyname('Last_Purchase_Order_Number').asinteger);
      edtLastInvoiceNumber.text := inttostr(fieldbyname('Last_Invoice_Number').asinteger);
      edtLastCreditNoteNumber.text := inttostr(fieldbyname('Last_Credit_Note_Number').asinteger);
      close;
    end;
end;

procedure TfrmWTMaintLastNumbers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTMaintLastNumbers.SaveToDB;
begin
  with qryUpCompany do
    begin
      close;

      parambyname('Last_Quote_Number').asinteger := strtoint(edtLastQuoteNumber.text);
      parambyname('Last_Contract_Quote_Number').asinteger := strtoint(edtLastContractQuoteNumber.text);
      parambyname('Last_Job_Number').asinteger := strtoint(edtLastJobNumber.text);
      parambyname('Last_Sales_Order_Number').asinteger := strtoint(edtLastSalesOrderNumber.text);
      parambyname('Last_Purchase_Order_Number').asinteger := strtoint(edtLastPurchaseOrderNumber.text);
      parambyname('Last_Invoice_Number').asinteger := strtoint(edtLastInvoiceNumber.text);
      parambyname('Last_Credit_Note_Number').asinteger := strtoint(edtLastCreditNoteNumber.text);

      execsql;
    end;
end;


procedure TfrmWTMaintLastNumbers.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

end.
