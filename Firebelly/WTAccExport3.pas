unit WTAccExport3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, Grids, DBGrids, ComCtrls, Inifiles, QrCtrls, DBCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTAccExport3 = class(TForm)
    pnlBottom: TPanel;
    BitBtn1: TBitBtn;
    FinishBtn: TBitBtn;
    BitBtn3: TBitBtn;
    pnlDetails: TPanel;
    Label2: TLabel;
    AccSystemEdit: TEdit;
    AliasLbl: TLabel;
    fileNameLbl: TLabel;
    cbsource: TComboBox;
    FileNameEdit: TEdit;
    ExportLbl: TLabel;
    ExportPathEdit: TEdit;
    BrowseBtn: TBitBtn;
    lblStatus: TLabel;
    Progress: TProgressBar;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
    procedure FinishBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbsourceChange(Sender: TObject);
    procedure FileNameEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExportPathEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure CreateAccExportFile;
    procedure CreateInvExportFile;
    procedure CreateSageMMSHeader;
    procedure GetCustomers(CustomerDataSQL: TFDQuery);
    procedure GetSuppliers(SupplierDataSQL: TFDQuery);
    procedure LinkerCustomers(CustomerDataSQL: TFDQuery);
    procedure Sage50Customers(CustomerDataSQL: TFDQuery);
    procedure LinkerSuppliers(SupplierDataSQL: TFDQuery);
    procedure Sage50Suppliers(SupplierDataSQL: TFDQuery);
    procedure GetSalesInvoices;
    procedure GetPurchaseInvoices;
    procedure CloseAccExportFiles;
    procedure CloseInvExportFiles;
    procedure UpInvoiceCustomers;
    procedure UpInvoiceSuppliers;
    procedure UpPOCustomers;
    procedure UpPOSuppliers;
    procedure ImportCurrency;
    procedure ImportStock;
    procedure ImportCreditLimits;
    procedure ImportMaximiserContacts;
    procedure ImportSage50Currency;
    procedure ImportSage50Stock;
    procedure ImportSage50CreditLimits;
    procedure ImportSage50Customers;
    procedure ImportSage50Suppliers;
    procedure ImportSage50Payments;
    function Sage50Format(sFieldText: string; bNeedQuotes: boolean; bNeedComma: boolean): string;
    procedure LinkerSalesInvoices;
    procedure LinkerPurchaseInvoices;
    procedure QBooksCustomers(CustomerDataSQL: TFDQuery);
    procedure QBooksSuppliers(SupplierDataSQL: TFDQuery);
    procedure QBooksGetPurchaseInvoices;
    procedure QBooksGetSalesInvoices;
    procedure QBooksCreateExportFile;
    procedure Sage50GetPurchaseInvoices;
    procedure Sage50GetSalesInvoices;
    procedure Sage50CreateExportFile;
    procedure SageMMSGetPurchaseInvoices;
    procedure SageMMSGetSalesInvoices;
    procedure SageMMSCreateExportFile;
    procedure XeroCustomers(CustomerDataSQL: TFDQuery);
    procedure XeroCreateCustomerExportHeader;
    procedure XeroCreateExportHeader;
    procedure XeroCreateExportFile;
    procedure XeroGetSalesInvoices;
    function NarrativeStrip(const Data : string) : string;
    procedure EnableFinishBtn;
    procedure GetDataSource;
    procedure WriteDataSource;
    procedure DeleteACCfile;
    function INVfileExists: boolean;
    procedure CreateQBooksHeader;
    function QBooksIIFFormat(sFieldText: string): string;
    procedure CreateQBooksCustomerHeader;
    procedure CreateQBooksSupplierHeader;
  public
    { Public declarations }
    sAccountsPackage: string;
    sLastForm: TForm;
    sRevCentrePrefix: string;
    procedure UpdateCustomers(UpCustomerDataSQL: TFDQuery; sStatusFrom: string; sStatusTo: string);
    procedure UpdateSuppliers(UpSupplierDataSQL: TFDQuery; sStatusFrom: string; sStatusTo: string);
    procedure UpdateSalesStatus(UpSalesInvSQL: TFDQuery; iStatusFrom: integer; iStatusTo: integer);
    procedure UpdatePurchStatus(UpSupplierInvSQL: TFDQuery; iStatusFrom: integer; iStatusTo: integer);
  end;

var
  frmWTAccExport3: TfrmWTAccExport3;

implementation

uses UITypes, WTAccExport1, WTAccExport4, WTAccExport2, WTAccExportDM, AllCommon,
  WtAccImportDM, WTMain, wtDataModule;

var
  sPathEdit: string[255];
  NewFilename: array[0..255] of Char;
  sFilename, sNewFilename: string[255];
  AccFilename, InvFilename: array[0..255] of Char;
  InvFile, AccFile, CurrFile, Stockfile: TextFile;
  sStatus: string[1];
  sEC_Status: string[1];
  sVat_Code: string[2];
  sPayType, sCurrency, sQuery_Code: string[1];
  sVersion, sSource, sReason: string[2];
  sAcc_Type, sDays_Discount: string[2];
  sCost_Centre, sDepartment: string[3];
  sUserNo: string[4];
  sAcc_Code, sCBAcc_Code: string[8];
  sDue_Date, sPost_Date: string[8];
  sPhone, sFax, sEMail, sRep, sVATRef, sTerms, sDescription: string[30];
  sVat_Description: string[40];
  sCompany, sAdd1, sAdd2, sAdd3, sAdd4, sAdd5, sContact: string[50];
  sCustomer_Name: string[100];
  iCustomers, iSuppliers, iSupplierInv, iSalesInv: Integer;
  Filebuffer: string[100];
  sCredit, sAvCredit, sSett_Days, sSett_Rate, sValue, sVatValue, sDate: string[10];
  sDiscount_Value, sTax_Discount_Value, sCurrency_Rate, sBase_Currency_Rate: string[18];
  sCode, sParent, sSymbol, sRate, sTxn_Ref1, sTxn_Ref2, sNomAnalysisCode, sReference: string[20];
  sDiscount_Perc, sTax_Discount_Perc: string[26];
  sNomAnalysisCodeName, sNomCode: string[60];

const
  sfiller = '                                                  ';

{$R *.DFM}

procedure TfrmWTAccExport3.FinishBtnClick(Sender: TObject);
begin
  {Re the export depending on the selection}
  with frmWTAccExport1.ActionListBox do
    begin
      {Save the export/import directory}
      case itemindex of
        0..4: dmAccExport.SetCompanyExportDir(ExportPathEdit.text);
        5..12: dmAccImport.SetCompanyImportDir(ExportPathEdit.text);
      end;

      //for the sales invoice export the user can specify the name of the file that
      //will be created, so check if it already exists
      if itemindex = 2 then
      begin
        if Self.INVfileExists then
        begin
          exit;
        end;
      end;

      {Customer EXport}
      if itemindex = 0 then
        begin
          CreateAccExportFile;
          {Set status of Pending Accounts to Awaiting Update}
          UpdateCustomers(dmAccExport.UpCustomerSQL,'P','U');
          {Now start reading the Customer database}
          GetCustomers(dmAccExport.CustomerSQL);
          CloseAccExportFiles;
        end
      else
      {Supplier export}
      if itemindex = 1 then
        begin
          CreateAccExportFile;
          {Set status of Pending Accounts to Awaiting Update}
          UpdateSuppliers(dmAccExport.UpSupplierSQL,'P','U');
          {Now start reading the Customer database}
          GetSuppliers(dmAccExport.SupplierSQL);
          CloseAccExportFiles;
        end
      else
      {Sales Invoice export}
      if itemindex = 2 then
        begin
          {Check if using Revenue Centres}
          if frmWTAccExport1.bUseRevenueCentre then
            begin
              case frmWTAccExport1.rdgrpRevenueCentre.itemindex of
                0:  begin
                      frmWTAccExport1.iRevenueCentre := 0;
                    end;
              else
                frmWTAccExport1.iRevenueCentre := frmWTAccExport1.dblkpRevCentre.keyvalue;
              end;
            end;
          
          CreateAccExportFile;
          CreateInvExportFile;
          {Change the status of Customer 'Prospects' to 'Invoice' Customers}
          UpInvoiceCustomers;
          UpdateSalesStatus(dmAccExport.UpSalesInvHeadSQl,20,25);

          {Now start checking for Sales Invoices}
          GetCustomers(dmAccExport.InvCustomerSQL);
          GetSalesInvoices;
          CloseAccExportFiles;
          CloseInvExportFiles;
        end
      else
      {Purchase Invoice export}
      if itemindex = 3 then
        begin
          CreateAccExportFile;
          CreateInvExportFile;
          {Change the status of suppliers 'Prospects' to 'Invoice' Customers}
          UpInvoiceSuppliers;
          UpdatePurchStatus(dmAccExport.UpSupplierInvSQl,20,25);

          {Now start checking for purchase Invoices}
          GetSuppliers(dmAccExport.InvSupplierSQL);
          GetPurchaseInvoices;
          CloseAccExportFiles;
          CloseInvExportFiles;
        end
      else
      {New Order Customer Accounts export}
      if itemindex = 4 then
        begin
          CreateAccExportFile;
          {Update the status of the Customers}
          UpPOCustomers;
          {Update the status of the Suppliers}
          UpPOSuppliers;

          {Now start reading the Customer database}
          GetCustomers(dmAccExport.POCustomerSQL);
          {Now start reading the Customer database}
          GetSuppliers(dmAccExport.POSupplierSQL);
          CloseAccExportFiles;
        end
      else
      {Import Currency Rates}
      if itemindex = 5 then
        begin
          if sAccountsPackage = 'SAGE50' then
            ImportSage50Currency
          else
            ImportCurrency;
        end
      else
      {Import Stock References}
      if itemindex = 6 then
        begin
          if sAccountsPackage = 'SAGE50' then
            ImportSage50Stock
          else
            ImportStock;
        end
      else
      {Import Credit Limits}
      if itemindex = 7 then
        begin
          progress.show;
          lblStatus.show;
          if sAccountsPackage = 'SAGE50' then
            ImportSage50CreditLimits
          else
            ImportCreditLimits;
        end
      else
      {Import Customer}
      if itemindex = 8 then
        begin
          progress.show;
          lblStatus.show;
          ImportSage50Customers;
        end
      else
      {Import Supplier}
      if itemindex = 9 then
        begin
          progress.show;
          lblStatus.show;
          ImportSage50Suppliers;
        end
      else
      {Import Sage Payments}
      if itemindex = 10 then
        begin
          progress.show;
          lblStatus.show;
          ImportSage50Payments;
        end
      else
      {Import Maximiser contacts}
      if itemindex = 12 then
        begin
          progress.show;
          lblStatus.show;
          ImportMaximiserContacts;
        end
    end;
  frmWTAccExport3.hide;
  frmWTAccExport4.show;
end;

procedure TfrmWTAccExport3.GetPurchaseInvoices;
begin
  with dmAccExport.CompanySQl do
    begin
      if fieldbyname('Accounts_Package').asstring = 'LINKER' then
        LinkerPurchaseInvoices
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGE50' then
        begin
          Sage50GetPurchaseInvoices;
          Sage50CreateExportFile;
        end
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGEMMS' then
        begin
          SageMMSGetPurchaseInvoices;
          SageMMSCreateExportFile;
        end
      else
      if fieldbyname('Accounts_Package').asstring = 'QBOOKS' then
        begin
          QBooksGetPurchaseInvoices;
          QBooksCreateExportFile;
        end;
    end;
end;

procedure TfrmWTAccExport3.LinkerPurchaseInvoices;
var
  sRef, sLongRef, sDesc, sInvType, sStockCode, sQty, sQtyStk, sUnitCost,
    sUnitSell, sValue,
    sNomCode, sCurr, sDoc, sDate, sCoRate, sVatRate, sQtyMul,
    sDiscount, sLoc, sLocDesc, sStockDesc, sPIN, sUser, sFolio: string[50];

  irow: Integer;
  rValue: Real;
begin
  with dmAccExport.PurchaseInvSQL do
  begin
    Close;
    Open;
    iSupplierInv := 0;
    First;
    irow := 0;
    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      inc(iSupplierInv);
      irow := irow + 1;
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 6);
      sRef := Copy(FieldByName('Supplier_Invoice').AsString + '/' +
        FieldByName('Invoice_Line_no').AsString + sfiller, 1, 10);
      sLongRef := Copy(FieldByName('Supplier_Invoice_no').AsString + sfiller, 1,
        20);
      {if generated for Enterprise then Version is I2}
      sVersion := 'I2';
      sDesc := Copy(FieldByName('Description').AsString + sfiller, 1, 50);
      sStockCode := Copy(sfiller, 1, 14);
      if FieldByName('Price_Unit_Factor').AsFloat = 0 then
        rValue := FieldByName('Goods_Value').AsFloat /
          FieldByName('Qty_Invoiced').AsFloat
      else
        rValue := FieldByName('Goods_Value').AsFloat /
          FieldByName('Price_Unit_Factor').AsFloat;
      sValue := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);
      {if generated for Enterprise then Paytype is null}

      sVat_Code := Copy(FieldByName('VAT_Ref').AsString + sfiller, 1, 1);
      sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 6);
      sInvType := 'PIN';
      sQty := Copy(FieldByName('Qty_Invoiced').AsString + sfiller, 1, 8);
      sQtyStk := Copy(sfiller, 1, 8);
      sUnitCost := Copy(sfiller, 1, 20);
      sUnitSell := Copy(sfiller, 1, 20);

      if FieldByName('Currency_Code').isNull then
        sCurr := '1 '
      else
        sCurr := Copy(FieldByName('Currency_Code').AsString + sfiller, 1, 2);

      sDoc := Copy(sfiller, 1, 1);
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sCoRate := Copy('1.0' + sfiller, 1, 6);
      sVATRate := Copy('1.0' + sfiller, 1, 6);
      sQtyMul := Copy('1.0' + sfiller, 1, 6);
      sDiscount := Copy('0.0' + sfiller, 1, 6);
      sAdd1 := Copy(' ' + sfiller, 1, 30);
      sAdd2 := Copy(' ' + sfiller, 1, 30);
      sAdd3 := Copy(' ' + sfiller, 1, 30);
      sAdd4 := Copy(' ' + sfiller, 1, 30);
      sAdd5 := Copy(' ' + sfiller, 1, 30);

      sLoc := Copy(sfiller, 1, 3);
      sLocDesc := Copy(sfiller, 1, 45);
      sStockDesc := Copy(sfiller, 1, 35);
      sPIN := Copy(FieldByName('Supp_Inv_Alt_Ref').AsString + sfiller, 1, 6);
      sUser := Copy(sfiller, 1, 10);
      sFolio := Copy(IntToStr(irow) + sfiller, 1, 8);

      Writeln(InvFile, sAcc_Code, sRef, sLongRef, sVersion, sDesc, ' ',
        sStockCode, '     ',
        sValue, sVat_Code, sNomCode, sInvType, sQty, sQtyStk, sUnitCost,
        sUnitSell, ' ', sCurr, sDoc, sDate, sCoRate, sVATRate, sQtyMul,
        sDiscount,
        sAdd1, sAdd2, sAdd3, sAdd4, sAdd5, '  ', sLoc, sLocDesc, sStockDesc,
        sPIN, sUser, sFolio);
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iSupplierInv;
  end;
end;

procedure TfrmWTAccExport3.Sage50GetPurchaseInvoices;
var
  rValue, rVatValue, rVatRate, rGoodsDiff, rVATDiff, rVatRemainder: real;
  sInvoiceNo: string;
  iInvoiceLine: integer;
  iInvoiceCode: integer;
  iNewInvoiceCode: integer;
begin
  {Delete existing Sage Line 50 invoices}
  with dmAccExport.qryDelSageInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  rVatRemainder := 0.00;

  sInvoiceNo := '';
  iNewInvoiceCode := 0;

  with dmAccExport.PurchaseInvSQL do
  begin
    Close;
    Open;
    First;
    iSupplierInv := 0;

    iInvoiceLine := 0;

    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      iInvoiceCode := fieldbyname('Supplier_invoice').asinteger;

      {Reference}
      sReference := trim(Copy(FieldByName('Supplier_invoice_no').AsString + sfiller, 1, 15));

//      if sReference <> sInvoiceNo then
      if iInvoiceCode <> iNewInvoiceCode then
        iInvoiceLine := 1;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        sAcc_Type := 'PC'
      else
        sAcc_Type := 'PI';

      {Account Code}
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8)
      else
        sNomCode := copy(dmAccExport.CompanySQL.Fieldbyname('Purch_Nom_Def').asstring +
          sfiller, 1, 8);

      {Department Number}
      sDepartment := '1';

(*      {Transaction Date}
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sDate,true,true));
*)

      {Description}
      if trim(FieldByName('Supp_Inv_alt_ref').AsString) = '' then
        sDescription := Copy(FieldByName('Purchase_Order').AsString + sfiller, 1, 30)
      else
        sDescription := Copy(FieldByName('Supp_Inv_alt_ref').AsString + sfiller, 1, 30);

      {Set the Goods and Vat Value differences}
      if iInvoiceLine = 1 then
        begin
          if sAcc_Type = 'PC' then
            begin
              rGoodsDiff := fieldbyname('Goods_Value_Diff').asfloat * -1;
              rVATdiff := fieldbyname('VAT_Value_Diff').asfloat * -1
            end
          else
            begin
              rGoodsDiff := fieldbyname('Goods_Value_Diff').asfloat;
              rVATdiff := fieldbyname('VAT_Value_Diff').asfloat
            end
        end
      else
        begin
          rGoodsDiff := 0.00;
//          rVATdiff := 0.00;
          rVATdiff := rVATRemainder;
        end;

      {Nett Amount}
      if FieldByName('Price_Unit_Factor').AsFloat = 0 then
        rValue := FieldByName('Goods_Value').AsFloat
      else
        rValue := (FieldByName('Qty_Invoiced').Asinteger / FieldByName('Price_Unit_Factor').AsFloat)
                  * FieldByName('Goods_Value').AsFloat;

      if rValue < 0 then
        rValue := rValue * -1;

//      sValue := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        rVatValue := fieldbyName('Vat_Value').asfloat * -1
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);
//      sVatValue := Copy(formatfloat('0.00000', rVatValue) + sfiller, 1, 20);

      {Apply any differences to goods and VAT values}
      rValue := rValue + rGoodsDiff;

      if (rValue <> 0) or (rVatValue <> 0) then
        begin
          if rVatValue <> 0 then
            begin
              rVatValue := rVatValue + rVATdiff;
              rVatRemainder := 0.00;
            end
          else
            rVatRemainder := rVatDiff;
        end
      else
        rVatRemainder := rVatDiff;

      {Write the details to the file}
      if rValue <> 0 then
        begin
          inc(iSupplierInv);
          {Update the temporary table with new records}
          dmAccExport.qryUpSageInvs.close;
          dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSupplierInv;
          dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.PurchaseInvSQL.FieldByName('Invoice_Date').AsDateTime;
          dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
          dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
          dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
          dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
          dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
          dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
          dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := rValue;
          dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := rVatValue;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
          dmAccExport.qryUpSageInvs.execsql;
          inc(iInvoiceLine);
        end;
//      if sInvoiceNo <> trim(sReference) then
      if iInvoiceCode <> iNewInvoiceCode then
        begin
        {Additional Details}
        with dmAccExport.PurchaseInvChgsSQL do
        begin
          Close;
          ParamByName('Supplier_Invoice').AsInteger :=
            dmAccExport.PurchaseInvSQL.FieldByName('Supplier_Invoice').AsInteger;
          Open;
          First;
          while (not dmAccExport.PurchaseInvChgsSQL.EOF) do
          begin
            {Set Account type based on the sign of the price, -ve or +ve}
            rValue := FieldByName('Amount').AsFloat;
            if rValue = 0 then
              begin
                next;
                continue;
              end;

            if rValue < 0 then
              begin
              rValue := rValue * -1;
              sAcc_Type := 'PC';
              end
            else
              begin
              sAcc_Type := 'PI';
              end;

            {Nominal Code}
            if Trim(FieldByName('Nominal').AsString) <> '' then
              sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8)
            else
              sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Purchase_Nom_Def').AsString +
                sfiller, 1, 8);

            {Nett Amount}
            {See further up for rValue}
//            sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

            {VAT Code - already set in main sales invoice line}
            sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

            {VAT Amount}
            rVatRate := FieldByName('VAT_Rate').Asfloat;
            rVatValue := rValue * (rVatRate/100);

            if rVatValue <> 0 then
              begin
                rVatValue := rVatValue + rVatRemainder;
                rVatRemainder := 0.00;
              end;

//            sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

            inc(iSupplierInv);
            if rValue <> 0 then
              begin
              {Update the temporary table with new records}
              dmAccExport.qryUpSageInvs.close;
              dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSupplierInv;
              dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.PurchaseInvSQL.FieldByName('Invoice_Date').AsDateTime;
              dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
              dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
              dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
              dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
              dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
              dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := rValue;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := rVatValue;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
              dmAccExport.qryUpSageInvs.execsql;
              inc(iInvoiceLine);
              end;
            dmAccExport.PurchaseInvChgsSQL.next;
          end;
          end;
          sInvoiceNo := trim(sReference);
          iNewInvoiceCode := iInvoiceCode;
        end;
      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.UpInvoiceCustomers;
begin
  {Update those Customer which are pending}
  with dmAccExport.UpInvCustomerSQL do
  begin
    Close;
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.UpInvoiceSuppliers;
begin
  {Update those Customer which are pending}
  with dmAccExport.UpInvSupplierSQL do
  begin
    Close;
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.UpPOCustomers;
begin
  {Update those Customer which are pending}
  with dmAccExport.UpPOCustomerSQL do
  begin
    Close;
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.UpPOSuppliers;
begin
  {Update those Customer which are pending}
  with dmAccExport.UpPOSupplierSQL do
  begin
    Close;
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.LinkerSuppliers(SupplierDataSQL: TFDQuery);
begin

  with SupplierDataSQL do
  begin
    Close;
    Open;

    iSuppliers := 0;
    First;
    sAcc_Type := 'SU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 6);
      if Trim(sAcc_Code) = '' then
      begin
        Next;
        Continue;
      end;

      inc(iSuppliers);
      sCompany := Copy(FieldByName('Supplier_Name').AsString + sfiller, 1, 30);
      sAdd1 := Copy(FieldByName('Building_no_name').AsString + sfiller, 1, 30);
      sAdd2 := Copy(FieldByName('Street').AsString + sfiller, 1, 30);
      sAdd3 := Copy(FieldByName('Locale').AsString + sfiller, 1, 30);
      sAdd4 := Copy(FieldByName('Town').AsString + sfiller, 1, 30);
      sAdd5 := Copy(FieldByName('Postcode').AsString + sfiller, 1, 30);
      sContact := Copy(FieldByName('Contact_Name').AsString + sfiller, 1, 25);

      {if generated for Enterprise then Version is A2}
      sVersion := 'A2';

      {if generated for Enterprise then Paytype is null}
      sPayType := ' ';

      sVat_Code := ' ';
      if FieldByName('Currency_code_def').isnull then
        scurrency := '1'
      else
        sCurrency := Copy(FieldByName('Currency_code_def').AsString + sfiller,
          1, 1);

      sPhone := Copy(FieldByName('Phone').AsString + sfiller, 1, 20);
      sFax := Copy(FieldByName('Fax_Number').AsString + sfiller, 1, 20);
      sEMail := Copy(FieldByName('Email').AsString + sfiller, 1, 20);

      {Check for Intrastat code}
      sEC_Status := 'Y';
      if FieldByName('Intrastat_id').AsInteger <> 1 then
        sEC_Status := 'N';
      Writeln(AccFile, sAcc_Type, sAcc_Code, sCompany, sAdd1, sAdd2, sAdd3,
        sAdd4,
        sAdd5, sContact, sVersion, sPayType, sVat_Code, sCurrency, sPhone, sFax,
        sEMail, sEC_Status);
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iSuppliers;
  end;
end;

procedure TfrmWTAccExport3.GetCustomers(CustomerDataSQL: TFDQuery);
begin
  with dmAccExport.CompanySQl do
    begin
      if fieldbyname('Accounts_Package').asstring = 'LINKER' then
        LinkerCustomers(CustomerDataSQL)
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGE50' then
        Sage50Customers(CustomerDataSQL)
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGEMMS' then
        Sage50Customers(CustomerDataSQL)
      else
      if fieldbyname('Accounts_Package').asstring = 'XERO' then
        begin
          XeroCreateCustomerExportHeader;
          XeroCustomers(CustomerDataSQL);
        end
      else
      if fieldbyname('Accounts_Package').asstring = 'QBOOKS' then
        QBooksCustomers(CustomerDataSQL);
    end;
end;

procedure TfrmWTAccExport3.GetSuppliers(SupplierDataSQL: TFDQuery);
begin
  with dmAccExport.CompanySQl do
    begin
      if fieldbyname('Accounts_Package').asstring = 'LINKER' then
        LinkerSuppliers(SupplierDataSQL)
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGE50' then
        Sage50Suppliers(SupplierDataSQL)
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGEMMS' then
        Sage50Suppliers(SupplierDataSQL)
      else
      if fieldbyname('Accounts_Package').asstring = 'QBOOKS' then
        QBooksSuppliers(SupplierDataSQL);
    end;
end;

procedure TfrmWTAccExport3.LinkerCustomers(CustomerDataSQL: TFDQuery);
begin
  with CustomerDataSQL do
  begin
    Close;
    Open;
    iCustomers := 0;
    First;
    sAcc_Type := 'CU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 6);
      if Trim(sAcc_Code) = '' then
      begin
        Next;
        Continue;
      end;

      inc(iCustomers);
      sCompany := Copy(FieldByName('Customer_Name').AsString + sfiller, 1, 30);
      sAdd1 := Copy(FieldByName('Building_no_name').AsString + sfiller, 1, 30);
      sAdd2 := Copy(FieldByName('Street').AsString + sfiller, 1, 30);
      sAdd3 := Copy(FieldByName('Locale').AsString + sfiller, 1, 30);
      sAdd4 := Copy(FieldByName('Town').AsString + sfiller, 1, 30);
      sAdd5 := Copy(FieldByName('Postcode').AsString + sfiller, 1, 30);
      sContact := Copy(FieldByName('Contact_Name').AsString + sfiller, 1, 25);

      {if generated for Enterprise then Version is A2}
      sVersion := 'A2';

      {if generated for Enterprise then Paytype is null}
      sPayType := ' ';

      sVat_Code := ' ';
      if FieldByName('Currency_code_def').isnull then
        scurrency := '1'
      else
        sCurrency := Copy(FieldByName('Currency_code_def').AsString + sfiller,
          1, 1);

      sPhone := Copy(FieldByName('Phone').AsString + sfiller, 1, 20);
      sFax := Copy(FieldByName('Fax_Number').AsString + sfiller, 1, 20);
      sEMail := Copy(FieldByName('Email').AsString + sfiller, 1, 20);

      {Check for Intrastat code}
      sEC_Status := 'Y';
      if FieldByName('Intrastat_id').AsInteger <> 1 then
        sEC_Status := 'N';
      Writeln(AccFile, sAcc_Type, sAcc_Code, sCompany, sAdd1, sAdd2, sAdd3,
        sAdd4,
        sAdd5, sContact, sVersion, sPayType, sVat_Code, sCurrency, sPhone, sFax,
        sEMail, sEC_Status);
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iCustomers;
  end;
end;

procedure TfrmWTAccExport3.Sage50Customers(CustomerDataSQL: TFDQuery);
var
  sSage50Text: string;
begin
  with CustomerDataSQL do
  begin
    Close;
    if frmWTAccExport1.bUseRevenueCentre then
      begin
        if frmWTAccExport1.iRevenueCentre = 0 then
          sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre is NULL '
        else
          sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre = ' + inttostr(frmWTAccExport1.iRevenueCentre);
      end;
    Open;
    iCustomers := 0;
    First;
    sAcc_Type := 'CU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);
      if Trim(sAcc_Code) = '' then
      begin
        Next;
        Continue;
      end;
      sSage50Text:='';
      inc(iCustomers);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAcc_Code,true,true));

      sCompany := Copy(FieldByName('Customer_Name').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sCompany,true,true));

      sAdd1 := Copy(FieldByName('Street').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd1,true,true));
      sAdd2 := Copy(FieldByName('Locale').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd2,true,true));
      sAdd3 := Copy(FieldByName('Town_City').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd3,true,true));
      sAdd4 := Copy(FieldByName('County_State').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd4,true,true));
      sAdd5 := Copy(FieldByName('Postcode').AsString + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd5,true,true));

      sContact := Copy(FieldByName('Contact_Name').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sContact,true,true));

      sPhone := Copy(FieldByName('Telephone_Number').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sPhone,true,true));

      sFax := Copy(FieldByName('Fax_Number').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sFax,true,true));

      sStatus := Copy('New' + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sStatus,true,true));

      sRep := Copy(FieldByName('Rep_Name').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sRep,true,true));
      {Region}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Dept Number}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      if sAcc_Code = 'DA3' then
        begin
          sVATRef := Copy(FieldByName('VAT_Reference').AsString + sfiller, 1, 30);
          sSage50Text := trim(sSage50Text) + trim(Sage50Format(sVATRef,true,true));
        end
      else
        begin
          sVATRef := Copy(FieldByName('VAT_Reference').AsString + sfiller, 1, 30);
          sSage50Text := trim(sSage50Text) + trim(Sage50Format(sVATRef,true,true));
        end;
      {Turnover}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Balance YTD}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Previous YTD}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      sCredit := Copy(FieldByName('Credit_Limit').AsString + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sCredit,true,true));

      {Terms}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      sSett_Days := Copy(FieldByName('Settlement_Days').AsString + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sSett_Days,false,true));

      sSett_Rate := Copy(FieldByName('Settlement_Discount').AsString + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sSett_Rate,false,true));

      {Def Nominal Code}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Def Tax Code}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,false));
      Writeln(AccFile, sSage50text);
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iCustomers;
  end;
end;

procedure TfrmWTAccExport3.Sage50Suppliers(SupplierDataSQL: TFDQuery);
var
  sSage50Text: string;
begin
  with SupplierDataSQL do
  begin
    Close;
    Open;

    iSuppliers := 0;
    First;
    sAcc_Type := 'SU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);
      if Trim(sAcc_Code) = '' then
      begin
        Next;
        Continue;
      end;

      sSage50Text:='';
      inc(iSuppliers);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAcc_Code,true,true));

      sCompany := Copy(FieldByName('Supplier_Name').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sCompany,true,true));

      sAdd1 := Copy(FieldByName('Building_no_name').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd1,true,true));
      sAdd2 := Copy(FieldByName('Street').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd2,true,true));
      sAdd3 := Copy(FieldByName('Locale').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd3,true,true));
      sAdd4 := Copy(FieldByName('Town').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd4,true,true));
      sAdd5 := Copy(FieldByName('Postcode').AsString + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAdd5,true,true));

      sContact := Copy(FieldByName('Contact_Name').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sContact,true,true));

      sPhone := Copy(FieldByName('Phone').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sPhone,true,true));

      sFax := Copy(FieldByName('Fax_Number').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sFax,true,true));

      {Region - analysis 1}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Supplier Type - analysis 2}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Supplier Type - analysis 3}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Dept Number}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      sVATRef := Copy(FieldByName('VAT_Reference').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sVATRef,true,true));

      {Turnover}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Balance YTD}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Previous YTD}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      {Credit Limit}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Terms}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      {Settlement Days}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Settlement Rate}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));

      {Nominal Code}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,true));
      {Def Tax Code}
      sSage50Text := trim(sSage50Text) + trim(Sage50Format('',false,false));
      Writeln(AccFile, sSage50text);
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iSuppliers;
  end;
end;

procedure TfrmWTAccExport3.XeroCustomers(CustomerDataSQL: TFDQuery);
var
  sXeroText: string;
  iCount: integer;
  sEmailAddress, sWebAddress: string;
begin
  with CustomerDataSQL do
  begin
    Close;
    Open;
    iCustomers := 0;
    First;
    sAcc_Type := 'CU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);
(*      if (Trim(sAcc_Code) = '') or (Trim(sAcc_Code) = 'RETAIL') or (fieldbyname('Is_Retail_Customer').asstring = 'Y') then
      begin
        Next;
        Continue;
      end;
*)
      sXeroText:='';
      inc(iCustomers);

      {Customer Name}
      sCompany := stringreplace(FieldByName('Customer_Name').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sCompany,true,true));

      {Account Number}
      sXeroText := trim(sXeroText) + trim(Sage50Format(sAcc_Code,true,true));

      {Email Address}
      sEmailAddress := stringreplace(fieldbyname('Email_Address').asstring,',',' ',[rfReplaceAll]);
      if pos('@',sEmailAddress) = 0 then
        sEmailAddress := '';
      sXeroText := trim(sXeroText) + trim(Sage50Format(sEmailAddress,true,true));

      {First Name}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Last Name}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Postal Address Details}
      sContact := Copy(FieldByName('Contact_Name').AsString + sfiller, 1, 30);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sContact,true,true));

      sAdd1 := stringreplace(FieldByName('Street').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sAdd1,true,true));

      sAdd2 := stringreplace(FieldByName('Locale').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sAdd2,true,true));

      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      sAdd3 := stringreplace(FieldByName('Town_City').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sAdd3,true,true));

      sAdd4 := stringreplace(FieldByName('County_State').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sAdd4,true,true));

      sAdd5 := stringreplace(FieldByName('Postcode').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sAdd5,true,true));

      {Country}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Street Address Details}
      for iCount := 1 to 9 do
        begin
          sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));
        end;

      sPhone := stringreplace(FieldByName('Telephone_Number').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sPhone,true,true));

      sFax := stringreplace(FieldByName('Fax_Number').AsString,',',' ',[rfReplaceAll]);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sFax,true,true));

      {Mobile Number}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {DDI Number}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Skype Name}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Bank Details}
      for iCount := 1 to 6 do
        begin
          sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));
        end;

      {Website}
      sWebAddress := stringreplace(fieldbyname('web_address').asstring,',',' ',[rfReplaceAll]);
      if pos('@',sWebAddress) > 0 then
        sWebAddress := '';

      if trim(sWebAddress) <> '' then
        sWebAddress := 'http://' + sWebAddress;
        
      sXeroText := trim(sXeroText) + trim(Sage50Format(sWebAddress,true,true));

      {Discount Rate}
      sXeroText := trim(sXeroText) + trim(Sage50Format(fieldbyname('discount_rate').asstring,true,true));

      {Bank Details}
      for iCount := 1 to 16 do
        begin
          sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));
        end;

      Writeln(AccFile, sXeroText);
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iCustomers;
  end;
end;

procedure TfrmWTAccExport3.QBooksCustomers(CustomerDataSQL: TFDQuery);
var
  sQBooksText: string;
  sCType: string;
begin
  CreateQBooksCustomerHeader;

  with CustomerDataSQL do
  begin
    Close;
    Open;
    iCustomers := 0;
    First;
    sAcc_Type := 'CU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 50);
      if Trim(sAcc_Code) = '' then
      begin
        Next;
        Continue;
      end;
      inc(iCustomers);

      sQBooksText:='CUST';

      {Name}
      sCompany := trim(FieldByName('Customer_Name').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sCompany);

      {Address line 1}
      sAdd1 := trim(FieldByName('Street').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd1);

      {Locale}
      sAdd2 := trim(FieldByName('Locale').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd2);

      {Town/City}
      sAdd3 := trim(FieldByName('Town').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd3);

      {postcode}
      sAdd4 := trim(FieldByName('Postcode').AsString);
      sQBooksText := sQBooksText +  QBooksIIFFormat(sAdd4);

      {Phone Number}
      sPhone := trim(FieldByName('Phone').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sPhone);

      {Phone 2}
      sQBooksText := trim(sQBooksText) + QBooksIIFFormat('');

      {Fax Number}
      sFax := trim(FieldByName('Fax_Number').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sFax);

      {Account Code - Note field in Quickbooks}
      sQBooksText := sQBooksText + QBooksIIFFormat(sAcc_Code);

      {Contact Name}
      sContact := trim(FieldByName('Contact_Name').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sContact);

      {Customer Type}
      sCType := trim(FieldByName('Customer_Type_Descr').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sCType);

      {Rep}
      sRep := trim(FieldByName('Rep_Name').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sRep);

      {Company Name}
      sQBooksText := sQBooksText + QBooksIIFFormat(sCompany);

      Writeln(AccFile, sQBooksText);

      Next;
    end;
    frmWTAccExport4.iRecordCounter := iCustomers;
  end;
end;

procedure TfrmWTAccExport3.QBooksSuppliers(SupplierDataSQL: TFDQuery);
var
  sQBooksText: string;
begin
  CreateQBooksSupplierHeader;

  with SupplierDataSQL do
  begin
    Close;
    Open;

    iSuppliers := 0;
    First;
    sAcc_Type := 'SU';
    while (not EOF) do
    begin
      sAcc_Code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);
      if Trim(sAcc_Code) = '' then
      begin
        Next;
        Continue;
      end;

      sQBooksText:='VEND';

      inc(iSuppliers);

      {Name}
      sCompany := trim(FieldByName('Supplier_Name').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sCompany);

      {Address line 1}
      sAdd1 := trim(FieldByName('Building_no_name').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd1);

      {Address line 2}
      sAdd2 := trim(FieldByName('Street').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd2);

      {Locale}
      sAdd3 := trim(FieldByName('Locale').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd3);

      {Town/City}
      sAdd4 := trim(FieldByName('Town').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sAdd4);

      {postcode}
      sAdd5 := trim(FieldByName('Postcode').AsString);
      sQBooksText := sQBooksText +  QBooksIIFFormat(sAdd5);

      {Phone Number}
      sPhone := trim(FieldByName('Phone').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sPhone);

      {Phone 2}
      sQBooksText := trim(sQBooksText) + QBooksIIFFormat('');

      {Fax Number}
      sFax := trim(FieldByName('Fax_Number').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sFax);

      {Contact Name}
      sContact := trim(FieldByName('Contact_Name').AsString);
      sQBooksText := sQBooksText + QBooksIIFFormat(sContact);

      {Company Name}
      sQBooksText := sQBooksText + QBooksIIFFormat(sCompany);

      Writeln(AccFile, sQBooksText);

      Next;
    end;
    frmWTAccExport4.iRecordCounter := iSuppliers;
  end;
end;

function TfrmWTAccExport3.Sage50Format(sFieldText: string; bNeedQuotes: boolean; bNeedComma: boolean): string;
var
  sComma, sQuotes: string;
begin
  {Accept a string and enclose within quotes and add comma}
  sComma := '';
  sQuotes := '';

  if bNeedComma then
    sComma := ',';

  if bNeedQuotes then
    sQuotes := '"';

  Result := sQuotes+trim(sFieldText)+sQuotes+sComma;
end;

function TfrmWTAccExport3.QBooksIIFFormat(sFieldText: string): string;
var
  sSeparator: string;
begin
  {Accept a string and enclose within quotes and add comma}
  sSeparator := chr(vk_tab);

  Result := sSeparator + sFieldText;
end;

procedure TfrmWTAccExport3.GetSalesInvoices;
begin
  if sAccountsPackage = 'SAGE50' then
    begin
      Sage50GetSalesInvoices;
      Sage50CreateExportFile;
    end
  else
  if sAccountsPackage = 'SAGEMMS' then
    begin
      SageMMSGetSalesInvoices;
      SageMMSCreateExportFile;
    end
  else
  if sAccountsPackage = 'XERO' then
    begin
      XeroGetSalesInvoices;
      XeroCreateExportHeader;
      XeroCreateExportFile;
    end
  else
  if sAccountsPackage = 'QBOOKS' then
    begin
      QBooksGetSalesInvoices;
      QBooksCreateExportFile;
    end;
(*  with dmAccExport.CompanySQl do
    begin
      if fieldbyname('Accounts_Package').asstring = 'SAGE50' then
        begin
          Sage50GetSalesInvoices;
          Sage50CreateExportFile;
        end
      else
      if fieldbyname('Accounts_Package').asstring = 'SAGEMMS' then
        begin
          SageMMSGetSalesInvoices;
          SageMMSCreateExportFile;
        end
      else
      if fieldbyname('Accounts_Package').asstring = 'XERO' then
        begin
          XeroGetSalesInvoices;
          XeroCreateExportHeader;
          XeroCreateExportFile;
        end
      else
      if fieldbyname('Accounts_Package').asstring = 'QBOOKS' then
        begin
          QBooksGetSalesInvoices;
          QBooksCreateExportFile;
        end;
    end;
*)
end;

procedure TfrmWTAccExport3.LinkerSalesInvoices;
var
  sRef, sTempRef, sLongRef, sDesc, sInvType, sStockCode, sQty, sQtyStk, sUnitCost,
    sUnitSell, sValue,
    sNomCode, sCurr, sDoc, sDate, sCoRate, sVatRate, sQtyMul,
    sDiscount, sLoc, sLocDesc, sStockDesc, sPIN, sUser, sFolio: string[50];

  irow, iFieldLength, istart, iEnd: integer;

  stext, sNewText: string;
  rValue: Real;

begin

  with dmAccExport.SalesInvSQL do
  begin
    Close;
    Open;
    First;
    isalesinv := 0;
    irow := 0;
    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;
      inc(isalesInv);
      irow := irow + 1;

      {Get the Form reference details}
      dmAccExport.GetFormRefSQL.close;
      dmAccExport.GetFormRefSQL.parambyname('Customer').asinteger := fieldbyname('Customer').asinteger;
      dmAccExport.GetFormRefSQL.parambyname('Branch_no').asinteger := fieldbyname('Branch_no').asinteger;
      dmAccExport.GetFormRefSQL.parambyname('Form_Reference').asinteger := fieldbyname('Form_Reference').asinteger;
      dmAccExport.GetFormRefSQL.open;

      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 6);
      sRef := Copy(FieldByName('Purchase_Order').AsString +
        FieldByName('Line').AsString + sfiller, 1, 10);
      sLongRef := Copy(FieldByName('Cust_Order_no').AsString + sfiller, 1, 20);
      {if generated for Enterprise then Version is I2}
      sVersion := 'I2';
      sDesc := Copy(FieldByName('Description').AsString + sfiller, 1, 50);
      sStockCode := Copy(dmAccExport.GetFormRefSQL.FieldByName('Form_Reference_ID').AsString + sfiller, 1,
        14);

      if FieldByName('Price_Unit_Factor').AsFloat = 0 then
        rValue := FieldByName('Goods_Value').AsFloat /
          FieldByName('Qty_Invoiced').AsFloat
      else
        rValue := FieldByName('Goods_Value').AsFloat /
          FieldByName('Price_Unit_Factor').AsFloat;
      sValue := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);
      {if generated for Enterprise then Paytype is null}

      sVat_Code := Copy(FieldByName('VAT_Ref').AsString + sfiller, 1, 1);

      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 6)
      else
        sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
          sfiller, 1, 6);

      sInvType := 'SIN';
      sQty := Copy(FieldByName('Qty_Invoiced').AsString + sfiller, 1, 8);
      sQtyStk := Copy(FieldByName('Qty_Invoiced').AsString + sfiller, 1, 8);

      if FieldByName('Order_Unit_Factor').AsFloat = 0 then
        rValue := FieldByName('Order_Price').AsFloat /
          FieldByName('Qty_Invoiced').AsFloat
      else
        rValue := FieldByName('Order_Price').AsFloat /
          FieldByName('Order_Unit_Factor').AsFloat;
      sUnitCost := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);

      if FieldByName('Price_Unit_Factor').AsFloat = 0 then
        rValue := FieldByName('Goods_Value').AsFloat /
          FieldByName('Qty_Invoiced').AsFloat
      else
        rValue := FieldByName('Goods_Value').AsFloat /
          FieldByName('Price_Unit_Factor').AsFloat;
      sUnitSell := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);

      if FieldByName('Currency_Code').isNull then
        sCurr := '1 '
      else
        sCurr := Copy(FieldByName('Currency_Code').AsString + sfiller, 1, 2);

      sDoc := Copy(sfiller, 1, 1);
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sCoRate := Copy('1.0' + sfiller, 1, 6);
      sVATRate := Copy('1.0' + sfiller, 1, 6);
      sQtyMul := Copy('1.0' + sfiller, 1, 6);
      sDiscount := Copy('0.0' + sfiller, 1, 6);
      sAdd1 := Copy(FieldByName('Building_no_Name').AsString + sfiller, 1, 30);
      sAdd2 := Copy(FieldByName('Street').AsString + sfiller, 1, 30);
      sAdd3 := Copy(FieldByName('Locale').AsString + sfiller, 1, 30);
      sAdd4 := Copy(FieldByName('Town').AsString + sfiller, 1, 30);
      sAdd5 := Copy(FieldByName('Postcode').AsString + sfiller, 1, 30);
      sLoc := 'GI ';
      sLocDesc := Copy('Goods In' + sfiller, 1, 45);
      sStockDesc := Copy(dmAccExport.GetFormRefSQL.FieldByName('Form_Reference_Descr').AsString + sfiller,
        1, 35);

      sPIN := Copy(sfiller, 1, 6);
      sUser := Copy(sfiller, 1, 10);
      sFolio := Copy(IntToStr(irow) + sfiller, 1, 8);

      {Don't set stock code and description if not stocked}
      if dmAccExport.GetFormRefSQL.FieldByName('Stocked_Item').AsString <> 'Y' then
      begin
        sStockCode := Copy(sfiller, 1, 14);
        sStockDesc := Copy(sfiller, 1, 35);
        sLoc := '   ';
        sLocDesc := Copy(sfiller, 1, 45);
      end;

      Writeln(InvFile, sAcc_Code, sRef, sLongRef, sVersion, sDesc, ' ',
        sStockCode, '     ',
        sValue, sVat_Code, sNomCode, sInvType, sQty, sQtyStk, sUnitCost,
        sUnitSell,
        ' ', sCurr, sDoc, sDate, sCoRate, sVATRate, sQtyMul, sDiscount,
        sAdd1, sAdd2, sAdd3, sAdd4, sAdd5, '  ', sLoc, sLocDesc, sStockDesc,
        sPIN, sUser, sFolio);

       {Save the Main Invoice Reference}
      sTempRef := sRef;
      {Additional Details}
      with dmAccExport.SalesInvAddSQL do
      begin
        Close;
        ParamByName('Sales_Invoice').AsInteger :=
          dmAccExport.SalesInvSQL.FieldByName('Sales_Invoice').AsInteger;
        ParamByName('Invoice_Line_no').AsInteger :=
          dmAccExport.SalesInvSQL.FieldByName('Invoice_Line_no').AsInteger;
        Open;
        First;
        while (not dmAccExport.SalesInvAddSQL.EOF) do
        begin
{          sRef := Copy(Trim(sTempRef) + 'A' +
            Trim(FieldByName('Additional_Charge').AsString) + sfiller, 1, 10);
}
          sDesc := Copy(FieldByName('Details').AsString + sfiller, 1, 50);
          sStockCode := Copy(sfiller, 1, 14);

          rValue := FieldByName('Quotation_Price').AsFloat;
          sValue := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);
          {if generated for Enterprise then Paytype is null}

          if Trim(FieldByName('Nominal').AsString) <> '' then
            sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 6)
          else
            sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
              sfiller, 1, 6);

          sInvType := 'SIN';
          sQty := Copy('1' + sfiller, 1, 8);
          sQtyStk := Copy(sfiller, 1, 8);

          rValue := FieldByName('Amount').AsFloat;
          sUnitCost := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);

          rValue := FieldByName('Quotation_Price').AsFloat;
          sUnitSell := Copy(formatfloat('0.00000', rValue) + sfiller, 1, 20);

          sStockCode := Copy(sfiller, 1, 14);
          sStockDesc := Copy(sfiller, 1, 35);
          sLoc := '   ';
          sLocDesc := Copy(sfiller, 1, 45);
          
          Writeln(InvFile, sAcc_Code, sRef, sLongRef, sVersion, sDesc, ' ',
            sStockCode, '     ',
            sValue, sVat_Code, sNomCode, sInvType, sQty, sQtyStk, sUnitCost,
            sUnitSell,
            ' ', sCurr, sDoc, sDate, sCoRate, sVATRate, sQtyMul, sDiscount,
            sAdd1, sAdd2, sAdd3, sAdd4, sAdd5, '  ', sLoc, sLocDesc, sStockDesc,
            sPIN, sUser, sFolio);
          Next;
        end;
      end;

      {Narrative Text}
      with dmAccExport.SalesInvNarrSQL do
      begin
        Close;
        ParamByName('Narrative').AsInteger :=
          dmAccExport.SalesInvSQL.FieldByName('Narrative').AsInteger;
        Open;
        First;
        stext := '';
        while (not dmAccExport.SalesInvNarrSQL.EOF) do
         begin
           if (Length(NarrativeStrip(FieldByName('Narrative_Text').AsString)) = 0) or
               (NarrativeStrip(FieldByName('Narrative_Text').AsString) = '') then
               begin
               next;
               continue;
               end;
           if Length(NarrativeStrip(FieldByName('Narrative_Text').AsString)) < 100 then
             sNewtext := NarrativeStrip(FieldByName('Narrative_Text').AsString) + ' '
           else
             sNewText := NarrativeStrip(FieldByName('Narrative_Text').AsString);
           stext := stext + sNewText;
           next;
         end;
      end;

      {Update the Export file with the Narrative string, break it down
      into chunks of 50}
      iFieldLength := Length(trim(sText));
      istart := 1;
      iEnd := 50;
      while istart < iFieldLength do
       begin
         sDesc := Copy(copy(trim(stext),istart,50) + sfiller, 1, 50);
         if trim(sDesc) = '' then break;
{         sRef := Copy(Trim(sTempRef) + 'N' +
                   Trim(inttostr(icount)) + sfiller, 1, 10);
}
         sStockCode := Copy(sfiller, 1, 14);

         sValue := Copy(sfiller, 1, 20);

         {if generated for Enterprise then Paytype is null}
         sNomCode := Copy(sfiller, 1, 6) ;
         sInvType := 'SIN';
         sQty := Copy(sfiller, 1, 8);
         sQtyStk := Copy(sfiller, 1, 8);

         sUnitCost := Copy(sfiller, 1, 20);
         sUnitSell := Copy(sfiller, 1, 20);

         sCurr := Copy(sfiller, 1, 2);
         sDoc := Copy(sfiller, 1, 1);
         sDate := Copy(sfiller, 1, 10);
         sCoRate := Copy(sfiller, 1, 6);
         sVatRate:= Copy(sfiller, 1, 6);
         sQtyMul := Copy(sfiller, 1, 6);
         sDiscount := Copy(sfiller, 1, 6);
         sAdd1 := Copy(sfiller, 1, 30);
         sAdd2 := Copy(sfiller, 1, 30);
         sAdd3 := Copy(sfiller, 1, 30);
         sAdd4 := Copy(sfiller, 1, 30);
         sAdd5 := Copy(sfiller, 1, 30);
         sLoc := Copy(sfiller, 1, 3);
         sLocDesc := Copy(sfiller, 1, 45);
         sStockDesc := Copy(sfiller, 1, 35);
         sPin := Copy(sfiller, 1, 6);
         sUser := Copy(sfiller, 1, 10);

         Writeln(InvFile, sAcc_Code, sRef, sLongRef, sVersion, sDesc, ' ',
               sStockCode, '     ',
               sValue, sVat_Code, sNomCode, sInvType, sQty, sQtyStk, sUnitCost,
               sUnitSell,
               ' ', sCurr, sDoc, sDate, sCoRate, sVATRate, sQtyMul, sDiscount,
               sAdd1, sAdd2, sAdd3, sAdd4, sAdd5, '  ', sLoc, sLocDesc, sStockDesc,
               sPIN, sUser, sFolio);
         istart := iend + 1;
         iend := istart + 49;
       end;

      Next;
    end;
    frmWTAccExport4.iRecordCounter := iSalesInv;
  end;
end;

function TfrmWTAccExport3.NarrativeStrip(const Data : string) : string;
var
  i : integer;
begin
  { Remove any characters less than space }
  Result := '';
  for i := 1 to Length(Data) do
    if Data[i] >= ' ' then
      Result := Result + Data[i];
end;

procedure TfrmWTAccExport3.Sage50GetSalesInvoices;
var
  rValue, rVatValue, rVatRate: real;
  sInvoiceNo: string;
  iInvoiceCode: integer;
  sOldDescription: string;
begin
  {Delete existing Sage Line 50 invoices}
  with dmAccExport.qryDelSageInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  sInvoiceNo := '';
  with dmAccExport.SalesInvSQL do
  begin
    Close;
    if frmWTAccExport1.bUseRevenueCentre then
      begin
        if frmWTAccExport1.iRevenueCentre = 0 then
          sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre is NULL '
        else
          sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre = ' + inttostr(frmWTAccExport1.iRevenueCentre);
      end;
    sql.Text := sql.Text + ' ORDER BY Sales_Invoice_Line.Sales_Invoice, Sales_Invoice_Line.Invoice_Line_No ';
    Open;
    First;
    isalesinv := 0;
    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        sAcc_Type := 'SC'
      else
        sAcc_Type := 'SI';

      iInvoiceCode := fieldbyname('Sales_invoice').asinteger;

      {Account Code}
//      if (FieldByName('Cash_Sales').AsString = 'Y') then
//        sAcc_code := Copy(dmAccExport.CompanySQL.FieldByName('Cash_Sales_Account_Code').AsString + sfiller, 1, 8)
//      else
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8)
      else
        sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
          sfiller, 1, 8);

      {Department Number}
      sDepartment := '1';

      {Reference}
      sReference := Copy(FieldByName('invoice_No').AsString + sfiller, 1, 15);

      {Description}
//      sDescription := Copy((FieldByName('Reference').AsString) + sfiller, 1, 30);
      {Use the Sales order number to retrieve the customer reference from the sales order}
      if sAcc_Type = 'SC' then
        sDescription := copy((dmAccExport.GetSOCustomerOrderNo(FieldByName('Sales_Order').AsString)) + sfiller, 1, 30)
      else
        sDescription := copy((dmAccExport.GetSOCustomerOrderNo(FieldByName('Reference').AsString)) + sfiller, 1, 30);

      if trim(sDescription) = '' then
        sDescription := sOldDescription;

      sOldDescription := sDescription;

(*      {if Cash Sales then add to description the customer account code}
      if FieldByName('Cash_Sales').AsString = 'Y' then
        begin
          sDescription := trim(sDescription) + ' (' + trim(FieldByName('Account_Code').AsString) + ')';
          sDescription := Copy(sDescription + sfiller, 1, 30);
        end;
*)

      {Nett Amount}
      rValue := (FieldByName('Quantity_Invoiced').Asinteger / FieldByName('sell_unit').AsFloat)
                  * FieldByName('unit_price').AsFloat;

(*      if (rValue < 0) and (sAcc_Type = 'SC') then
        begin
          rValue := rValue * -1;
        end;
*)
      sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

      {VAT Code}
      sVat_Code := trim(Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2));

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        begin
          rVatValue := fieldbyName('Vat_Value').asfloat;
          if rVatValue < 0 then
            rVatValue := fieldbyName('Vat_Value').asfloat * -1;
        end
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);

      sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

      {Write the details to the file}
      if (rValue <> 0) or (rVatValue <> 0) then
        begin
        inc(isalesInv);
        {Update the temporary table with new records}
        dmAccExport.qryUpSageInvs.close;
        dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSalesInv;
        dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime;
        dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
        dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
        dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
        dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
        dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
        dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
        dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := strtofloat(sValue);
        dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := strtofloat(sVatValue);
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
        dmAccExport.qryUpSageInvs.execsql;
        end;

      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.XeroGetSalesInvoices;
var
  rValue, rVatValue, rVatRate: real;
  sLineDescription, sOrderReference: string;
  sPrefix: string;
  rQuantity: real;
  sInvoiceNo: string;
  iInvoiceCode: integer;
begin
  {Delete existing Xero invoices}
  with dmAccExport.qryDelXeroInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  with dmAccExport.SalesInvSQL do
  begin
    Close;
    Open;
    First;
    isalesinv := 0;
    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      {Customer Name}
      sCustomer_Name := fieldbyname('Customer_Name').asstring;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        begin
          sPrefix := 'CR-'
        end
      else
        begin
          sPrefix := 'INV-';
        end;

      iInvoiceCode := fieldbyname('Sales_Invoice').asinteger;

      sInvoiceNo := fieldbyname('Invoice_No').asstring;

      {Account Code}
//      if (FieldByName('Cash_Sales').AsString = 'Y') then
//        sAcc_code := Copy(dmAccExport.CompanySQL.FieldByName('Cash_Sales_Account_Code').AsString + sfiller, 1, 8)
//      else
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8)
      else
        sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
          sfiller, 1, 8);

      {Department Number}
      sDepartment := '1';

      {Reference}
      sOrderReference := Copy(FieldByName('Reference').AsString + sfiller, 1, 15);

      {Description}
      sLineDescription := fieldbyname('Description').asstring;

      {Nett Amount}
      rValue := FieldByName('unit_price').AsFloat;

      sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

      {Quantity}
      rQuantity := (FieldByName('Quantity_Invoiced').Asinteger / FieldByName('sell_unit').AsFloat);
      if rQuantity < 0 then
        rQuantity := rQuantity * -1;

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        begin
          rVatValue := fieldbyName('Vat_Value').asfloat;
          if rVatValue < 0 then
            rVatValue := fieldbyName('Vat_Value').asfloat * -1;
        end
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);

      sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);
      
      sVat_Description := fieldbyname('Vat_Description').asstring;

      {Write the details to the file}
      if (rValue <> 0) or (rVatValue <> 0) then
        begin
        inc(isalesInv);
        {Update the temporary table with new records}
        dmAccExport.qryUpXeroInvs.close;
        dmAccExport.qryUpXeroInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
        dmAccExport.qryUpXeroInvs.Parambyname('Customer_Name').asstring := sCustomer_Name;
        dmAccExport.qryUpXeroInvs.Parambyname('Invoice_no').asstring := sPrefix + sInvoiceNo;
        dmAccExport.qryUpXeroInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime;
        dmAccExport.qryUpXeroInvs.Parambyname('Due_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime +
                                                                        dmAccExport.SalesInvSQL.FieldByName('Number_of_Days').Asinteger;
        dmAccExport.qryUpXeroInvs.Parambyname('Description').asstring := sLineDescription;
        dmAccExport.qryUpXeroInvs.Parambyname('Reference').asstring := sOrderReference;

        dmAccExport.qryUpXeroInvs.Parambyname('Quantity').asfloat := rQuantity;
        dmAccExport.qryUpXeroInvs.Parambyname('Unit_Price').asfloat := strtofloat(sValue);

        dmAccExport.qryUpXeroInvs.Parambyname('Nominal').asstring := sNomCode;

        dmAccExport.qryUpXeroInvs.Parambyname('Tax_Rate').asstring := sVat_Description;
        dmAccExport.qryUpXeroInvs.execsql;
        end;

      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.QBooksGetPurchaseInvoices;
var
  rValue, rVatValue, rVatRate, rGoodsDiff, rVATDiff, rVatRemainder: real;
  sInvoiceNo: string;
  iInvoiceLine: integer;
  iInvoiceCode: integer;
begin
  {Delete existing Sage Line 50 invoices}
  with dmAccExport.qryDelSageInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  rVatRemainder := 0.00;

  sInvoiceNo := '';
  with dmAccExport.PurchaseInvSQL do
  begin
    Close;
    Open;
    First;
    iSupplierInv := 0;

    iInvoiceLine := 0;

    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      {Reference}
      sReference := trim(Copy(FieldByName('Supplier_invoice_no').AsString + sfiller, 1, 8));

      if sReference <> sInvoiceNo then
        iInvoiceLine := 1;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        sAcc_Type := 'PC'
      else
        sAcc_Type := 'PI';

      iInvoiceCode := fieldbyname('Supplier_invoice').asinteger;

      {Account Code}
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 50);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 50)
      else
        sNomCode := copy(dmAccExport.CompanySQL.Fieldbyname('Purch_Nom_Def').asstring +
          sfiller, 1, 50);

      {Department Number}
      sDepartment := '1';

(*      {Transaction Date}
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sDate,true,true));
*)

      {Description}
      if trim(FieldByName('Supp_Inv_alt_ref').AsString) = '' then
        sDescription := Copy(FieldByName('Purchase_Order').AsString + sfiller, 1, 30)
      else
        sDescription := Copy(FieldByName('Supp_Inv_alt_ref').AsString + sfiller, 1, 30);

      {Set the Goods and Vat Value differences}
      if iInvoiceLine = 1 then
        begin
          if sAcc_Type = 'PC' then
            begin
              rGoodsDiff := fieldbyname('Goods_Value_Diff').asfloat * -1;
              rVATdiff := fieldbyname('VAT_Value_Diff').asfloat * -1;
            end
          else
            begin
              rGoodsDiff := fieldbyname('Goods_Value_Diff').asfloat;
              rVATdiff := fieldbyname('VAT_Value_Diff').asfloat;
            end
        end
      else
        begin
          rGoodsDiff := 0.00;
//          rVATdiff := 0.00;
          rVATdiff := rVATRemainder;
        end;

      {Nett Amount}
      rValue := (FieldByName('Quantity_Invoiced').Asinteger / FieldByName('sell_unit').AsFloat)
                  * FieldByName('unit_price').AsFloat;
      if rValue < 0 then
        rValue := rValue * -1;

      sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        rVatValue := fieldbyName('Vat_Value').asfloat * -1
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);
//      sVatValue := Copy(formatfloat('0.00000', rVatValue) + sfiller, 1, 20);

      {Apply any differences to goods and VAT values}
      rValue := rValue + rGoodsDiff;

      if (rValue <> 0) or (rVatValue <> 0) then
        begin
          rVatValue := rVatValue + rVATdiff;
          rVatRemainder := 0.00;
        end
      else
        rVatRemainder := rVatDiff;

      {Write the details to the file}
      if rValue <> 0 then
        begin
          inc(iSupplierInv);
          {Update the temporary table with new records}
          dmAccExport.qryUpSageInvs.close;
          dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSupplierInv;
          dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.PurchaseInvSQL.FieldByName('Invoice_Date').AsDateTime;
          dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
          dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
          dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
          dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
          dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
          dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
          dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := rValue;
          dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := rVatValue;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
          dmAccExport.qryUpSageInvs.execsql;
          inc(iInvoiceLine);
        end;
      if sInvoiceNo <> trim(sReference) then
        begin
        {Additional Details}
        with dmAccExport.PurchaseInvChgsSQL do
        begin
          Close;
          ParamByName('Supplier_Invoice').AsInteger :=
            dmAccExport.PurchaseInvSQL.FieldByName('Supplier_Invoice').AsInteger;
          Open;
          First;
          while (not dmAccExport.PurchaseInvChgsSQL.EOF) do
          begin
            {Set Account type based on the sign of the price, -ve or +ve}
            rValue := FieldByName('Amount').AsFloat;
            if rValue = 0 then
              begin
                next;
                continue;
              end;

            if rValue < 0 then
              begin
              rValue := rValue * -1;
              sAcc_Type := 'PC';
              end
            else
              begin
              sAcc_Type := 'PI';
              end;

            {Nominal Code}
            if Trim(FieldByName('Nominal').AsString) <> '' then
              sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 50)
            else
              sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Purchase_Nom_Def').AsString +
                sfiller, 1, 50);

            {Nett Amount}
            {See further up for rValue}
//            sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

            {VAT Code - already set in main sales invoice line}
            sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

            {VAT Amount}
            rVatRate := FieldByName('VAT_Rate').Asfloat;
            rVatValue := rValue * (rVatRate/100);

            if rVatValue <> 0 then
              begin
                rVatValue := rVatValue + rVatRemainder;
                rVatRemainder := 0.00;
              end;

//            sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

            inc(iSupplierInv);
            if rValue <> 0 then
              begin
              {Update the temporary table with new records}
              dmAccExport.qryUpSageInvs.close;
              dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSupplierInv;
              dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.PurchaseInvSQL.FieldByName('Invoice_Date').AsDateTime;
              dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
              dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
              dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
              dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
              dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
              dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := rValue;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := rVatValue;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
              dmAccExport.qryUpSageInvs.execsql;
              inc(iInvoiceLine);
              end;
            dmAccExport.PurchaseInvChgsSQL.next;
          end;
          end;
          sInvoiceNo := trim(sReference);
        end;
      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.QBooksGetSalesInvoices;
var
  rValue, rVatValue, rVatRate: real;
  sInvoiceNo: string;
  iInvoiceCode: integer;
begin
  {Delete existing Sage Line 50 invoices}
  with dmAccExport.qryDelSageInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  sInvoiceNo := '';
  with dmAccExport.SalesInvSQL do
  begin
    Close;
    Open;
    First;
    isalesinv := 0;
    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        sAcc_Type := 'SC'
      else
        sAcc_Type := 'SI';

      iInvoiceCode := fieldbyname('Sales_invoice').asinteger;

      {Account Code}
//      if FieldByName('Cash_Sales').AsString = 'Y' then
//        sAcc_code := Copy(dmAccExport.CompanySQL.FieldByName('Cash_Sales_Account_Code').AsString + sfiller, 1, 50)
//      else
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 50);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 30)
      else
        sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
          sfiller, 1, 30);

      {Department Number}
      sDepartment := '1';

      {Reference}
      sReference := Copy(FieldByName('invoice_No').AsString + sfiller, 1, 20);

      {Description}
      sDescription := Copy((FieldByName('Reference').AsString) + sfiller, 1, 30);

      {if Cash Sales then add to description the customer account code}
(*      if FieldByName('Cash_Sales').AsString = 'Y' then
        begin
          sDescription := trim(sDescription) + ' (' + trim(FieldByName('Account_Code').AsString) + ')';
          sDescription := Copy(sDescription + sfiller, 1, 30);
        end;
*)

      {Nett Amount}
      rValue := (FieldByName('Quantity_Invoiced').Asinteger / FieldByName('sell_unit').AsFloat)
                  * FieldByName('unit_price').AsFloat;
      if rValue < 0 then
        rValue := rValue * -1;

      sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        begin
          rVatValue := fieldbyName('Vat_Value').asfloat;
          if rVatValue < 0 then
            rVatValue := fieldbyName('Vat_Value').asfloat * -1;
        end
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);

      sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

      {Write the details to the file}
      if (rValue <> 0) or (rVatValue <> 0) then
        begin
        inc(isalesInv);
        {Update the temporary table with new records}
        dmAccExport.qryUpSageInvs.close;
        dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSalesInv;
        dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime;
        dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
        dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
        dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
        dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
        dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
        dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
        dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := strtofloat(sValue);
        dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := strtofloat(sVatValue);
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
        dmAccExport.qryUpSageInvs.execsql;
        end;

      {get any Additional Charges}
      if sInvoiceNo <> trim(sReference) then
        begin
        {Additional Details}
        with dmAccExport.SalesInvChgsSQL do
        begin
          Close;
          ParamByName('Sales_Invoice').AsInteger :=
            dmAccExport.SalesInvSQL.FieldByName('Sales_Invoice').AsInteger;
          Open;
          First;
          while (not dmAccExport.SalesInvChgsSQL.EOF) do
          begin
            {Set Account type based on the sign of the price, -ve or +ve}
            rValue := FieldByName('Amount').AsFloat;
            if rValue = 0 then
              begin
              next;
              continue;
              end;

            if rValue < 0 then
              begin
              rValue := rValue * -1;
              sAcc_Type := 'SC';
              end
            else
              begin
              sAcc_Type := 'SI';
              end;

            {Nominal Code}
            if Trim(FieldByName('Nominal').AsString) <> '' then
              sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 30)
            else
              sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
                sfiller, 1, 30);

            {Nett Amount}
            {See further up for rValue}
            sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

            {VAT Code - already set in main sales invoice line}
            sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

            {VAT Amount}
            rVatRate := FieldByName('VAT_Rate').Asfloat;
            rVatValue := rValue * (rVatRate/100);

            sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

            inc(isalesInv);
            if rValue <> 0 then
              begin
              {Update the temporary table with new records}
              dmAccExport.qryUpSageInvs.close;
              dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSalesInv;
              dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime;
              dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
              dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
              dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
              dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
              dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
              dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := strtofloat(sValue);
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := strtofloat(sVatValue);
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
              dmAccExport.qryUpSageInvs.execsql;
              end;
            dmAccExport.SalesInvChgsSQL.next;
          end;
          end;
          sInvoiceNo := trim(sReference);
        end;
      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.Sage50CreateExportFile;
var
  sSage50Text: string;
  sInvoiceNo: string;
//  iMultiplier: integer;
  iCounter: integer;
begin
  sInvoiceNo := '';
  with dmAccExport.qryGetSageImport do
  begin
    Close;
    parambyname('Operator').asinteger := frmWTMain.Operator;
    Open;
    First;
    icounter := 0;
    while (not EOF) do
    begin
      sSage50Text := '';

      {Account Type - set to Sales Invoice}
      sAcc_Type := copy(fieldbyname('Transaction_type').asstring + sfiller,1,2);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAcc_Type,true,true));

      {Account Code}
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sAcc_code,true,true));

      {Nominal Code}
      sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sNomCode,true,true));

      {Department Number}
      sDepartment := Copy(FieldByName('Department').AsString + sfiller, 1, 1);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sDepartment,false,true));

      {Transaction Date}
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sDate,true,true));

      {Reference}
      sReference := Copy(FieldByName('Reference').AsString + sfiller, 1, 15);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sReference,true,true));

      {Description}
      sDescription := Copy(FieldByName('Description').AsString + sfiller, 1, 30);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sDescription,true,true));

      {Nett Amount}
      sValue := Copy(formatfloat('0.00000', (FieldByName('Total_Goods_Value').AsFloat)) + sfiller, 1, 20);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sValue,false,true));

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sVat_Code,true,true));

      {VAT Amount}
      sVatValue := Copy(formatfloat('0.00000', (FieldByName('Total_VAT_Value').AsFloat)) + sfiller, 1, 20);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sVatValue,false,false));

      Writeln(InvFile, sSage50Text);
      if sInvoiceNo <> trim(sReference) then
        begin
          inc(icounter);
          sInvoiceNo := trim(sReference);
        end;
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iCounter;
  end;
end;

procedure TfrmWTAccExport3.XeroCreateExportHeader;
var
  tempStr: string;
begin
  tempStr := '"*ContactName"'
    + ',"EmailAddress"'
    + ',"POAddressLine1"'
    + ',"POAddressLine2"'
    + ',"POAddressLine3"'
    + ',"POAddressLine4"'
    + ',"POCity"'
    + ',"PORegion"'
    + ',"POCostalCode"'
    + ',"POCountry"'
    + ',"*InvoiceNumber"'
    + ',"Reference"'
    + ',"*InvoiceDate"'
    + ',"*DueDate"'
    + ',"Total"'
    + ',"InventoryItemCode"'
    + ',"*Description"'
    + ',"*Quantity"'
    + ',"*UnitAmount"'
    + ',"Discount"'
    + ',"*AccountCode"'
    + ',"*TaxType"'
    + ',"TaxAmount"'
    + ',"TrackingName1"'
    + ',"TrackingOption1"'
    + ',"TrackingName2"'
    + ',"TrackingOption2"'
    + ',"Currency"'
    + ',"BrandingTheme"';

  Writeln(InvFile, tempStr);
end;

procedure TfrmWTAccExport3.XeroCreateCustomerExportHeader;
var
  tempStr: string;
begin
  tempStr := '"*ContactName"'
    + ',"AccountNumber"'
    + ',"EmailAddress"'
    + ',"FirstName"'
    + ',"LastName"'
    + ',"POAttentionTo"'
    + ',"POAddressLine1"'
    + ',"POAddressLine2"'
    + ',"POAddressLine3"'
    + ',"POAddressLine4"'
    + ',"POCity"'
    + ',"PORegion"'
    + ',"POCostalCode"'
    + ',"POCountry"'
    + ',"SAAttentionTo"'
    + ',"SAAddressLine1"'
    + ',"SAAddressLine2"'
    + ',"SAAddressLine3"'
    + ',"SAAddressLine4"'
    + ',"SACity"'
    + ',"SARegion"'
    + ',"SAPostalCode"'
    + ',"SACountry"'
    + ',"PhoneNumber"'
    + ',"FaxNumber"'
    + ',"MobileNumber"'
    + ',"DDINumber"'
    + ',"SkypeName"'
    + ',"BankAccountName"'
    + ',"BankAccountNumber"'
    + ',"BankAccountParticulars"'
    + ',"TaxNumber"'
    + ',"AccountReceivableTaxCodeName"'
    + ',"AccountPayableTaxCodeName"'
    + ',"Website"'
    + ',"Discount"'
    + ',"CompanyNumber"'
    + ',"DueDateBillDay"'
    + ',"DueDateBillTerm"'
    + ',"DueDateSalesDay"'
    + ',"DueDateSalesTerm"'
    + ',"SalesAccount"'
    + ',"PurchasesAccount"'
    + ',"TrackingName1"'
    + ',"SalesTrackingOption1"'
    + ',"PurchaseTrackingOption1"'
    + ',"TrackingName2"'
    + ',"SalesTrackingOption2"'
    + ',"PurchaseTrackingOption2"'
    + ',"BrandingTheme"'
    + ',"DefaultTaxBills"'
    + ',"DefaultTaxSales"';

  Writeln(AccFile, tempStr);
end;

procedure TfrmWTAccExport3.XeroCreateExportFile;
var
  sXeroText: string;
  sInvoiceNo, sInvoiceReference, sOrderReference, sLineDescription: string;
//  iMultiplier: integer;
  iCount, iCounter: integer;
begin
  sInvoiceNo := '';
  with dmAccExport.qryGetXeroImport do
  begin
    Close;
    parambyname('Operator').asinteger := frmWTMain.Operator;
    Open;
    First;
    icounter := 0;
    while (not EOF) do
    begin
      sXeroText := '';

      {Customer Name}
      sXeroText := trim(sXeroText) + trim(Sage50Format(fieldbyname('Customer_Name').asstring,true,true));

      {Email Address}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {PO Name and Address}
      for iCount := 1 to 8 do
        begin
          sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));
        end;

      {Invoice Number}
      sInvoiceReference := trim(FieldByName('Invoice_no').AsString);
      sXeroText := trim(sXeroText) + trim(Sage50Format(fieldbyname('Invoice_no').asstring,true,true));

      {Reference}
      sOrderReference := trim(FieldByName('Reference').AsString);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sOrderReference,true,true));

      {Invoice Date}
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sDate,true,true));

      {Due Date}
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Due_Date').AsDateTime) + sfiller, 1, 10);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sDate,true,true));

      {Total}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {InventoryItemCode}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Description}
      sLineDescription := FieldByName('Description').AsString;
      sXeroText := trim(sXeroText) + trim(Sage50Format(sLineDescription,true,true));

      {Quantity}
      sXeroText := trim(sXeroText) + trim(Sage50Format(fieldbyname('Quantity').asstring,true,true));

      {Unit Price}
      sXeroText := trim(sXeroText) + trim(Sage50Format(fieldbyname('Unit_Price').asstring,true,true));

      {Discount}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));

      {Nominal Code}
      sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8);
      sXeroText := trim(sXeroText) + trim(Sage50Format(sNomCode,true,true));

      {Tax Type}
      sXeroText := trim(sXeroText) + trim(Sage50Format(FieldByName('Tax_Rate').AsString,true,true));

      {Tax Amount}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',false,false));

      {Tracking}
      for iCount := 1 to 4 do
        begin
          sXeroText := trim(sXeroText) + trim(Sage50Format('',true,true));
        end;

      {Currency}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',false,false));

      {Branding Theme!!}
      sXeroText := trim(sXeroText) + trim(Sage50Format('',false,false));

      Writeln(InvFile, sXeroText);
      if sInvoiceNo <> trim(sInvoiceReference) then
        begin
          inc(icounter);
          sInvoiceNo := trim(sInvoiceReference);
        end;
      Next;
    end;
    frmWTAccExport4.iRecordCounter := iCounter;
  end;
end;

procedure TfrmWTAccExport3.CreateAccExportFile;
begin
  {Check for any \ on the end of the path}
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {Create the Accounts file name}
  sFilename := sPathEdit + 'New_accounts.txt';

  StrPCopy(AccFilename, sFilename);

  assignfile(AccFile, AccFilename);
  try
    deletefile(AccFilename);
  except
  end;

  try
    Append(AccFile);
  except
    begin
      try
        ReWrite(AccFile);
      except
        MessageDlg('Can''t open the Accounts output file ' + AccFileName,
          mtInformation,
          [mbOk], 0);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmWTAccExport3.CreateInvExportFile;
begin
  {Check for any \ on the end of the path}
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {Create the Invoices file name}
  sFilename := sPathEdit + 'New_Invoices.txt';

  StrPCopy(InvFilename, sFilename);

  assignfile(InvFile, InvFilename);
  try
    deletefile(InvFilename);
  except
  end;

  try
    Append(InvFile);
  except
    begin
      try
        ReWrite(InvFile);
      except
        MessageDlg('Can''t open the Invoice output file ' + InvFileName,
          mtInformation,
          [mbOk], 0);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmWTAccExport3.CloseAccExportFiles;
var
  sAccFileName, sPrefix, sNextAccFile: string;
begin
  sAccFileName := FileNameEdit.Text;
  if Pos('INV', sAccFileName) = 1 then
    sAccFileName := Copy(sAccFileName, 4, 256);

  {Set the file extension}
  if (sAccountsPackage = 'SAGE50') or
     (sAccountsPackage = 'SAGEMMS') or
     (sAccountsPackage = 'XERO') then
    sPrefix := '.csv'
  else
  if (sAccountsPackage = 'QBOOKS') then
    sPrefix := '.iif'
  else
    sPrefix := '.txt';

  {Close the Accounts files and rename them}
  closefile(accfile);
  if (iCustomers > 0) then
  begin
    sNextAccFile := IntToStr(dmAccExport.CompanySQL.FieldByName('Last_file_No_Acc').AsInteger
      + 1);
    sNewFilename := sPathEdit + sRevCentrePrefix + 'SACC' + sAccFileName + sPrefix;
    //see if file with this name already exists

    StrPCopy(NewFilename, sNewFilename);
    RenameFile(AccFilename, NewFilename);
  end
  else
  if (iSuppliers > 0) then
  begin
    sNextAccFile := IntToStr(dmAccExport.CompanySQL.FieldByName('Last_file_No_Acc').AsInteger
      + 1);
    sNewFilename := sPathEdit + sRevCentrePrefix + 'PACC' + sAccFileName + sPrefix;
    //see if file with this name already exists

    StrPCopy(NewFilename, sNewFilename);
    RenameFile(AccFilename, NewFilename);
  end;


  with dmAccExport.UpCompanyAccSQL do
  begin
    Close;
    ParamByName('Last_file_no_Acc').AsInteger := StrToInt(sNextAccFile);
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.CloseInvExportFiles;
var
  sNextInvFile, sPrefix: string;
begin
  sNextInvFile := FileNameEdit.Text;
  if Pos('INV', sNextInvFile) = 1 then
    sNextInvFile := Copy(sNextInvFile, 4, 256);

  {Set the file extension}
  if (sAccountsPackage = 'SAGE50') or
     (sAccountsPackage = 'SAGEMMS') or
     (sAccountsPackage = 'XERO') then
    sPrefix := '.csv'
  else
  if (sAccountsPackage = 'QBOOKS') then
    sPrefix := '.iif'
  else
    sPrefix := '.txt';

  {Close the Invoices files and rename them}
  closefile(invfile);
  if (iSupplierInv > 0) and (frmWTAccExport1.ActionListBox.itemindex = 3) then
    begin
      sNewFilename := sPathEdit + sRevCentrePrefix + 'PINV' + sNextInvFile + sPrefix;
      StrPCopy(NewFilename, sNewFilename);
      RenameFile(InvFilename, NewFilename);
      dmAccExport.UpdatePIFilename(sNewFilename);
    end
  else
  if (iSalesInv > 0) and (frmWTAccExport1.ActionListBox.itemindex = 2) then
    begin
      sNewFilename := sPathEdit + sRevCentrePrefix + 'SINV' + sNextInvFile + sPrefix;
      StrPCopy(NewFilename, sNewFilename);
      RenameFile(InvFilename, NewFilename);
      dmAccExport.UpdateSIFilename(sNewFilename);
    end;

  {Update the last Invoice File number}
  try
    StrToInt(sNextInvFile);
    with dmAccExport.UpCompanyInvSQL do
    begin
      //user hasn't typed in file name, its still a number so update the
      //last invoice file number
      Close;
      ParamByName('Last_file_no_Inv').AsInteger := StrToInt(sNextInvFile);
      ExecSQL;
    end;
  except
    //user must have typed in a filename, so no need to update file name count
    exit;
  end;
end;

procedure TfrmWTAccExport3.UpdateCustomers(UpCustomerDataSQL: TFDQuery; sStatusFrom: string; sStatusTo: string);
begin
  {Update those Customer which are pending}
  with UpCustomerDataSQL do
  begin
    Close;
    ParambyName('Status_From').asstring := sStatusFrom;
    ParambyName('Status_To').asstring := sStatusTo;
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.UpdateSuppliers(UpSupplierDataSQL: TFDQuery; sStatusFrom: string; sStatusTo: string);
begin
  {Update those Suppliers which are pending}
  with UpSupplierDataSQL do
  begin
    Close;
    ParambyName('Status_From').asstring := sStatusFrom;
    ParambyName('Status_To').asstring := sStatusTo;
    ExecSQL;
  end;
end;

procedure TfrmWTAccExport3.UpdateSalesStatus(UpSalesInvSQL: TFDQuery; iStatusFrom: integer; iStatusTo: integer);
begin
    {Check for Sales Invoice Header}
    with dmAccExport.UpSalesInvHeadSQL do
    begin
      Close;
      sql.Text := dmAccExport.UpSalesInvHeadBaseSQL.SQL.Text;
      
      if frmWTAccExport1.bUseRevenueCentre then
        begin
          if frmWTAccExport1.iRevenueCentre = 0 then
            sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre is NULL '
          else
            sql.Text := sql.Text + ' AND Sales_invoice.Revenue_Centre = ' + inttostr(frmWTAccExport1.iRevenueCentre);
        end;
      parambyname('Status_From').asinteger := iStatusFrom;
      parambyname('Status_To').asinteger := iStatusTo;
      ExecSQL;
    end;
end;

procedure TfrmWTAccExport3.UpdatePurchStatus(UpSupplierInvSQL: TFDQuery; iStatusFrom: integer; iStatusTo: integer);
begin
    {Check for Sales Invoice Header}
    with dmAccExport.UpSupplierInvHeadSQL do
    begin
      Close;
      parambyname('Status_From').asinteger := iStatusFrom;
      parambyname('Status_To').asinteger := iStatusTo;
      ExecSQL;
    end;
end;

procedure TfrmWTAccExport3.BitBtn1Click(Sender: TObject);
begin
  frmWTAccExport3.Hide;
  sLastForm.show;
end;

procedure TfrmWTAccExport3.BitBtn3Click(Sender: TObject);
begin
  frmWTAccExport1.close;
end;

procedure TfrmWTAccExport3.FormShow(Sender: TObject);
begin
  Caption := frmWTAccExport1.ActionListBox.Items[frmWTAccExport1.ActionListBox.Itemindex];

  Filenameedit.readonly := true;
  with frmWTAccExport1.ActionListBox do
    begin
      if (itemindex = 0) or
         (itemindex = 1) or
         (itemindex = 4) then
         FileNameEdit.Text := 'ACC' + IntToStr(dmAccExport.CompanySQL.FieldByName('Last_file_No_Acc').AsInteger
                           + 1)
      else
      if (itemindex = 2) or (itemindex = 3) then
      begin
         FileNameEdit.Text := 'INV'+IntToStr(dmAccExport.CompanySQL.FieldByName('Last_file_No_inv').AsInteger
                           + 1);
         FileNameEdit.ReadOnly := false;
      end
      else
      if itemindex > 4 then
         begin
           Filenameedit.readonly := false;
           ExportPathEdit.Text := dmAccExport.CompanySQL.fieldbyname('Data_Import_Directory').asstring;
         end;
      {Decide whether to show the ODBC prompts}
      if (itemindex > 4) and
         (sAccountsPackage = 'SAGE50') then
         begin
           Filenamelbl.Visible := false;
           FilenameEdit.visible := false;
           ExportLbl.visible := false;
           ExportPathEdit.visible := false;
           browsebtn.visible := false;
           AliasLbl.visible := true;
           cbsource.visible := true;
           if itemindex = 11 then
            AccSystemEdit.text := 'Maximiser contact management system';
         end
      else
         begin
           Filenamelbl.Visible := true;
           FilenameEdit.visible := true;
           ExportLbl.visible := true;
           ExportPathEdit.visible := true;
           browsebtn.visible := true;
           AliasLbl.visible := false;
           cbsource.visible := false;
         end;
   end;
   EnableFinishBtn;
end;

procedure TfrmWTAccExport3.EnableFinishBtn;
begin
  with frmWTAccExport1.ActionListBox do
    begin
      if (itemindex > 4) and
         (sAccountsPackage = 'SAGE50') then
        begin
          if cbsource.text = '' then
            begin
              FinishBtn.enabled := false;
              exit;
            end
        end
      else
        begin
          if (FileNameedit.text = '') or
             (ExportPathEdit.text = '') then
            begin
              FinishBtn.enabled := false;
              exit;
            end
        end;
      FinishBtn.enabled := true;
    end;
end;

procedure TfrmWTAccExport3.ImportCurrency;
var
  icurrency: Integer;
begin
  {Check for any \ on the end of the path}
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {Import Currency}
  sFilename := sPathEdit + 'currency.txt';
  sNewFilename := sPathEdit + 'New_currency.txt';

  RenameFile(sFilename, sNewFilename);

  assignfile(CurrFile, sNewFilename);
  reset(Currfile);
  if IOresult <> 0 then
  begin
    MessageDlg('File access error', mtWarning, [mbOk], 0);
    Exit;
  end;
  icurrency := 0;
  while not EOF(Currfile) do
    begin
      Readln(Currfile, FileBuffer);

      inc(icurrency);

      sCode := Copy(Filebuffer, 1, 2);
      sDescription := Copy(Filebuffer, 3, 11);
      sSymbol := Copy(Filebuffer, 14, 3);
      sRate := Copy(Filebuffer, 17, 20);

      {Check whether the record exists}
      with dmAccExport.CurrencySQL do
        begin
          Close;
          ParamByName('code').AsInteger := StrToInt(sCode);
          Open;

          if RecordCount > 0 then Continue;
        end;

      with dmAccExport.UpCurrSQL do
        begin
          Close;
          ParamByName('Code').AsInteger := StrToInt(sCode);
          ParamByName('Description').AsString := sDescription;
          ParamByName('Symbol').AsString := sSymbol;
          ParamByName('Rate').AsFloat := StrToFloat(sRate);
          ExecSQL;
        end;
    end;
    frmWTAccExport4.iRecordCounter := icurrency;
end;

procedure TfrmWTAccExport3.ImportStock;
var
  iCustomer, iBranch, iForm: Integer;
  istock: Integer;
begin
  {Check for any \ on the end of the path}
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {Import Stock Reference}
  sFilename := sPathEdit + 'Stock.txt';
  sNewFilename := sPathEdit + 'New_Stock.txt';

  RenameFile(sFilename, sNewFilename);

  assignfile(StockFile, sNewFilename);
  reset(Stockfile);
  if IOresult <> 0 then
  begin
    MessageDlg('File access error', mtWarning, [mbOk], 0);
    Exit;
  end;
  istock := 0;
  while not EOF(Stockfile) do
  begin
    Readln(Stockfile, FileBuffer);
    inc(istock);
    sParent := Copy(Filebuffer, 15, 14);
    sCode := Copy(Filebuffer, 1, 14);
    sDescription := Copy(Filebuffer, 29, 35);

    {get the Customer and Branch associated with the Parent code}
    with dmAccExport.BranchSQl do
    begin
      Close;
      ParamByName('Account_Code').AsString := sParent;
      Open;

      iCustomer := FieldByName('Customer').AsInteger;
      iBranch := FieldByName('Branch_no').AsInteger;
    end;
    {Check whether the record exists}
    with dmAccExport.StockSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := icustomer;
      ParamByName('Branch_no').AsInteger := iBranch;
      ParamByName('Form_Reference_ID').AsString := sCode;
      Open;

      if RecordCount > 0 then Continue;
    end;
    with dmAccExport.MaxStockSQL do
    begin
      Close;
      Open;

      iForm := FieldByName('Last_Reference').AsInteger + 1;
    end;

    with dmAccExport.UpStockSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := icustomer;
      ParamByName('Branch_no').AsInteger := iBranch;
      ParamByName('Form_Reference').AsInteger := iForm;
      ParamByName('Form_Reference_id').AsString := sCode;
      ParamByName('Form_Reference_Descr').AsString := sDescription;
      ExecSQL;
    end;
  end;
  frmWTAccExport4.irecordcounter := istock;
end;

procedure TfrmWTAccExport3.ImportCreditLimits;
var
  iaccounts, icustomer: Integer;
begin
  {Check for any \ on the end of the path}
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {Import Accounts}
  sFilename := sPathEdit + 'Accounts.txt';
  sNewFilename := sPathEdit + 'New_Accounts.txt';

  RenameFile(sFilename, sNewFilename);

  assignfile(AccFile, sNewFilename);
  reset(Accfile);
  if IOresult <> 0 then
  begin
    MessageDlg('File access error', mtWarning, [mbOk], 0);
    Exit;
  end;
  iaccounts := 0;
  while not EOF(Accfile) do
  begin
    Readln(Accfile, FileBuffer);

    inc(iaccounts);

    sAcc_Type := Copy(Filebuffer, 1, 2);
    sAcc_Code := Copy(Filebuffer, 3, 6);
    sCredit := Copy(Filebuffer, 9, 20);
    sAvCredit := Copy(Filebuffer, 29, 20);
    sStatus := Copy(Filebuffer, 50, 1);
    sEC_Status := Copy(Filebuffer, 51, 1);

    {Check whether the record exists}
    if sAcc_Type = 'CU' then
    begin
      with dmAccExport.BranchSQl do
      begin
        Close;
        ParamByName('Account_Code').AsString := sAcc_Code;
        Open;

        iCustomer := FieldByName('Customer').AsInteger;
      end;
      with dmAccExport.UpCustSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCustomer;
        ParamByName('credit_limit').AsFloat := StrToFloat(sCredit);
        ParamByName('available_credit').AsFloat := StrToFloat(sAvCredit);
        if sStatus = '2' then
          ParamByName('Credit_Status').AsString := 'S'
        else
          ParamByName('Credit_Status').AsString := 'L';

        if sEC_Status = 'N' then
          ParamByName('Intrastat_ID').AsInteger := 3
        else
          ParamByName('Intrastat_ID').AsInteger := 2;

        ExecSQL;
      end;
    end;
    frmWTAccExport4.irecordcounter := iaccounts;
  end;
end;

procedure TfrmWTAccExport3.ImportSage50Currency;
begin
  dmAccImport.AddCurrency;
  frmWTAccExport4.irecordcounter := dmAccImport.icurrencycount;
end;

procedure TfrmWTAccExport3.ImportSage50Stock;
begin
  dmAccImport.AddStock(cbSource.text);
  frmWTAccExport4.irecordcounter := dmAccImport.istockcount;
end;

procedure TfrmWTAccExport3.ImportSage50CreditLimits;
begin
  dmAccImport.AddCreditLimits(cbSource.text);
  frmWTAccExport4.irecordcounter := dmAccImport.icreditcount;
end;

procedure TfrmWTAccExport3.ImportSage50Payments;
begin
  dmAccImport.AddPayments(cbSource.text);
  frmWTAccExport4.irecordcounter := dmAccImport.icreditcount;
end;

procedure TfrmWTAccExport3.ImportSage50Customers;
begin
  dmAccImport.AddCurrency;
  dmAccImport.AddCustomers(cbSource.text);
  frmWTAccExport4.irecordcounter := dmAccImport.icustomercount;
end;

procedure TfrmWTAccExport3.ImportSage50Suppliers;
begin
  dmAccImport.AddCurrency;
  dmAccImport.AddSuppliers(cbSource.text);
  frmWTAccExport4.irecordcounter := dmAccImport.iSuppliercount;
end;

procedure TfrmWTAccExport3.BrowseBtnClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := ExportPathEdit.Text;
    if DirDlg.Execute then
      ExportPathEdit.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTAccExport3.FormCreate(Sender: TObject);
begin
  FDManager.GetConnectionDefNames(cbSource.Items);
  GetDataSource;
  icustomers := 0;
  isuppliers := 0;
end;

procedure TfrmWTAccExport3.cbsourceChange(Sender: TObject);
begin
  EnableFinishBtn;
end;

procedure TfrmWTAccExport3.FileNameEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EnableFinishBtn;
end;

procedure TfrmWTAccExport3.ExportPathEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EnableFinishBtn;
end;

procedure TfrmWTAccExport3.GetDataSource;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmWTMain.AppIniFile);

  with IniFile do
    begin
      cbSource.itemindex := cbsource.Items.Indexof(ReadString('Centrereed Broker', 'DataSource', 'None'));
      Free;
    end;
(*  GetPrivateProfileString('Email', 'Application', '', TempArray,
    sizeof(TempArray), frmWTMain.AppIniFile);

  Applic := TempArray;

  GetPrivateProfileString('Email', 'DEF Attach Type', '', TempArray,
    sizeof(TempArray), frmWTMain.AppIniFile);

  AttachType := TempArray;
  GetPrivateProfileString('Email', 'Def Attach Direc', '', TempArray,
    sizeof(TempArray), frmWTMain.AppIniFile);

  Direc := TempArray;

  AttachDirecEdit.Text := Direc;
  TypeDBLCB.Keyvalue := AttachType;
  ApplicDBLCB.KeyValue := Applic;

*)
end;

procedure TfrmWTAccExport3.WriteDataSource;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmWTMain.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'DataSource',cbSource.text);
      Free;
    end;
end;

procedure TfrmWTAccExport3.FormDestroy(Sender: TObject);
begin
  WriteDataSource;
end;

procedure TfrmWTAccExport3.FormActivate(Sender: TObject);
begin
  sAccountsPackage := dmAccExport.CompanySQl.fieldbyname('Accounts_Package').asstring;

  Progress.Position := 0;

  EnableFinishBtn;
end;

function TfrmWTAccExport3.INVfileExists: boolean;
begin
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {build the full Accounts file name}
  if Pos('INV', FileNameEdit.Text) = 1 then
    sFilename := sPathEdit + FileNameEdit.Text
  else
    sFilename := sPathEdit + 'INV' + FileNameEdit.Text;
    
  if sAccountsPackage = 'SAGE50' then
    sFilename := sFilename + '.csv'
  else
    sFilename := sFilename + '.txt';

  StrPCopy(AccFilename, sFilename);

  assignfile(AccFile, AccFilename);
  try
    Reset(AccFile);
    closeFile(AccFile);
    Result := True;
  except
    Result := false;
  end;

  if Result = true then
  begin
    if MessageDlg('File ' + sFilename + ' already exists. Do you want to overwrite it?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      DeleteFile(sFilename);
      sFileName := Copy(sFileName, (Pos('INV', sFileName)+3), 256);
      sFileName := sPathEdit + 'ACC' + sFileName;
      DeleteFile(sFilename);
      Result := false;
    end;
  end;
end;

procedure TfrmWTAccExport3.DeleteACCfile;
begin
  if Copy(ExportPathEdit.Text, Length(ExportPathEdit.Text), 1) = '\' then
    sPathEdit := ExportPathEdit.Text
  else
    sPathEdit := ExportPathEdit.Text + '\';

  {build the full Accounts file name}
  if Pos('INV', FileNameEdit.Text) = 1 then
    sFilename := sPathEdit + 'ACC' + Copy(FileNameEdit.Text, 4, 256)
  else
    sFilename := sPathEdit + 'ACC' + FileNameEdit.Text;

  if sAccountsPackage = 'SAGE50' then
    sFilename := sFilename + '.csv'
  else
    sFilename := sFilename + '.txt';

  StrPCopy(AccFilename, sFilename);

  assignfile(AccFile, AccFilename);
  try
    DeleteFile(sFilename);
  except

  end;
end;

procedure TfrmWTAccExport3.ImportMaximiserContacts;
begin
  dmAccImport.AddMaximiserContacts(cbSource.text);
  frmWTAccExport4.irecordcounter := dmAccImport.icustomercount;
end;

procedure TfrmWTAccExport3.SageMMSGetPurchaseInvoices;
var
  rValue, rVatValue, rVatRate, rGoodsDiff, rVATDiff, rVatRemainder: real;
  sInvoiceNo: string;
  iInvoiceLine: integer;
  iInvoiceCode: integer;
  iNewInvoiceCode: integer;
begin
  {Delete existing Sage Line 50 invoices}
  with dmAccExport.qryDelSageInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  rVatRemainder := 0.00;

  sInvoiceNo := '';
  iNewInvoiceCode := 0;

  with dmAccExport.PurchaseInvSQL do
  begin
    Close;
    Open;
    First;
    iSupplierInv := 0;

    iInvoiceLine := 0;

    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      {Reference}
      sReference := trim(Copy(FieldByName('Supplier_invoice_no').AsString + sfiller, 1, 20));

      iInvoiceCode := fieldbyname('Supplier_invoice').asinteger;

//      if sReference <> sInvoiceNo then
      if iInvoiceCode <> iNewInvoiceCode then
        iInvoiceLine := 1;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        sAcc_Type := 'PC'
      else
        sAcc_Type := 'PI';

      {Account Code}
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 14)
      else
        sNomCode := copy(dmAccExport.CompanySQL.Fieldbyname('Purch_Nom_Def').asstring +
          sfiller, 1, 14);

      {Department Number}
      sDepartment := '1';

(*      {Transaction Date}
      sDate := Copy(FormatDateTime('dd"/"mm"/"yyyy',
        FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 10);
      sSage50Text := trim(sSage50Text) + trim(Sage50Format(sDate,true,true));
*)

      {Description}
      if trim(FieldByName('Supp_Inv_alt_ref').AsString) = '' then
        sDescription := Copy(FieldByName('Purchase_Order').AsString + sfiller, 1, 30)
      else
        sDescription := Copy(FieldByName('Supp_Inv_alt_ref').AsString + sfiller, 1, 30);

      {Set the Goods and Vat Value differences}
      if iInvoiceLine = 1 then
        begin
          if sAcc_Type = 'PC' then
            begin
              rGoodsDiff := fieldbyname('Goods_Value_Diff').asfloat * -1;
              rVATdiff := fieldbyname('VAT_Value_Diff').asfloat * -1;
            end
          else
            begin
              rGoodsDiff := fieldbyname('Goods_Value_Diff').asfloat;
              rVATdiff := fieldbyname('VAT_Value_Diff').asfloat;
            end
        end
      else
        begin
          rGoodsDiff := 0.00;
//          rVATdiff := 0.00;
          rVATdiff := rVATRemainder;
        end;

      {Nett Amount}
      rValue := (FieldByName('Quantity_Invoiced').Asinteger / FieldByName('sell_unit').AsFloat)
                  * FieldByName('unit_price').AsFloat;
      if rValue < 0 then
        rValue := rValue * -1;

      sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        rVatValue := fieldbyName('Vat_Value').asfloat * -1
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);
//      sVatValue := Copy(formatfloat('0.00000', rVatValue) + sfiller, 1, 20);

      {Apply any differences to goods and VAT values}
      rValue := rValue + rGoodsDiff;

      if (rValue <> 0) or (rVatValue <> 0) then
        begin
          rVatValue := rVatValue + rVATdiff;
          rVatRemainder := 0.00;
        end
      else
        rVatRemainder := rVatDiff;

      {Write the details to the file}
      if rValue <> 0 then
        begin
          inc(iSupplierInv);
          {Update the temporary table with new records}
          dmAccExport.qryUpSageInvs.close;
          dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSupplierInv;
          dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.PurchaseInvSQL.FieldByName('Invoice_Date').AsDateTime;
          dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
          dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
          dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
          dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
          dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
          dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
          dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := rValue;
          dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := rVatValue;
          dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
          dmAccExport.qryUpSageInvs.execsql;
          inc(iInvoiceLine);
        end;
//      if sInvoiceNo <> trim(sReference) then
      if iInvoiceCode <> iNewInvoiceCode then
        begin
        {Additional Details}
        with dmAccExport.PurchaseInvChgsSQL do
        begin
          Close;
          ParamByName('Supplier_Invoice').AsInteger :=
            dmAccExport.PurchaseInvSQL.FieldByName('Supplier_Invoice').AsInteger;
          Open;
          First;
          while (not dmAccExport.PurchaseInvChgsSQL.EOF) do
          begin
            {Set Account type based on the sign of the price, -ve or +ve}
            rValue := FieldByName('Amount').AsFloat;
            if rValue = 0 then
              begin
                next;
                continue;
              end;

            if rValue < 0 then
              begin
              rValue := rValue * -1;
              sAcc_Type := 'PC';
              end
            else
              begin
              sAcc_Type := 'PI';
              end;

            {Nominal Code}
            if Trim(FieldByName('Nominal').AsString) <> '' then
              sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 14)
            else
              sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Purchase_Nom_Def').AsString +
                sfiller, 1, 14);

            {Nett Amount}
            {See further up for rValue}
//            sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

            {VAT Code - already set in main sales invoice line}
            sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

            {VAT Amount}
            rVatRate := FieldByName('VAT_Rate').Asfloat;
            rVatValue := rValue * (rVatRate/100);

            if rVatValue <> 0 then
              begin
                rVatValue := rVatValue + rVatRemainder;
                rVatRemainder := 0.00;
              end;

//            sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

            inc(iSupplierInv);
            if rValue <> 0 then
              begin
              {Update the temporary table with new records}
              dmAccExport.qryUpSageInvs.close;
              dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSupplierInv;
              dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.PurchaseInvSQL.FieldByName('Invoice_Date').AsDateTime;
              dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
              dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
              dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
              dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
              dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
              dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := rValue;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := rVatValue;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
              dmAccExport.qryUpSageInvs.execsql;
              inc(iInvoiceLine);
              end;
            dmAccExport.PurchaseInvChgsSQL.next;
          end;
          end;
          iNewInvoiceCode := iInvoiceCode;
          sInvoiceNo := trim(sReference);
        end;
      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.SageMMSGetSalesInvoices;
var
  rValue, rVatValue, rVatRate: real;
  sInvoiceNo: string;
  iInvoiceCode: integer;
begin
  {Delete existing Sage MMS invoices}
  with dmAccExport.qryDelSageInvs do
    begin
      close;
      parambyname('Operator').asinteger := frmWTMain.Operator;
      execsql;
    end;

  sInvoiceNo := '';
  with dmAccExport.SalesInvSQL do
  begin
    Close;
    Open;
    First;
    isalesinv := 0;
    while (not EOF) do
    begin
      if Trim(FieldByName('Account_Code').AsString) = '' then
      begin
        Next;
        Continue;
      end;

      iInvoiceCode := fieldbyname('Sales_invoice').asinteger;

      {Account Type - set to Sales Invoice}
      if fieldbyname('Invoice_or_credit').asstring = 'C' then
        sAcc_Type := 'SC'
      else
        sAcc_Type := 'SI';

      {Account Code}
//      if (FieldByName('Cash_Sales').AsString = 'Y') then
//        sAcc_code := Copy(dmAccExport.CompanySQL.FieldByName('Cash_Sales_Account_Code').AsString + sfiller, 1, 8)
//      else
      sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);

      {Nominal Code}
      if Trim(FieldByName('Nominal').AsString) <> '' then
        sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 14)
      else
        sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
          sfiller, 1, 14);

      {Department Number}
      sDepartment := '1';

      {Reference}
      sReference := Copy(FieldByName('invoice_No').AsString + sfiller, 1, 20);

      {Description}
      sDescription := Copy((FieldByName('Reference').AsString) + sfiller, 1, 30);

      if FieldByName('Invoice_or_Credit').AsString = 'C' then
        sDescription := Copy(('INV/'+FieldByName('Reference').AsString) + sfiller, 1, 30);

      {if Cash Sales then add to description the customer account code}
(*      if FieldByName('Cash_Sales').AsString = 'Y' then
        begin
          sDescription := trim(sDescription) + ' (' + trim(FieldByName('Account_Code').AsString) + ')';
          sDescription := Copy(sDescription + sfiller, 1, 30);
        end;
*)

      {Nett Amount}
      rValue := (FieldByName('Quantity_Invoiced').Asinteger / FieldByName('sell_unit').AsFloat)
                  * FieldByName('unit_price').AsFloat;
      if rValue < 0 then
        rValue := rValue * -1;

      sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

      {VAT Amount}
      if fieldbyname('Credit_Type').asstring = 'V' then
        begin
          rVatValue := fieldbyName('Vat_Value').asfloat;
          if rVatValue < 0 then
            rVatValue := fieldbyName('Vat_Value').asfloat * -1;
        end
      else
        rVatValue := rValue * (FieldByName('VAT_Rate').Asfloat/100);

      sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

      {Write the details to the file}
      if (rValue <> 0) or (rVatValue <> 0) then
        begin
        inc(isalesInv);
        {Update the temporary table with new records}
        dmAccExport.qryUpSageInvs.close;
        dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSalesInv;
        dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime;
        dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
        dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
        dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
        dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
        dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
        dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
        dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := strtofloat(sValue);
        dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := strtofloat(sVatValue);
        dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
        dmAccExport.qryUpSageInvs.execsql;
        end;

      {get any Additional Charges}
      if sInvoiceNo <> trim(sReference) then
        begin
        {Additional Details}
        with dmAccExport.SalesInvChgsSQL do
        begin
          Close;
          ParamByName('Sales_Invoice').AsInteger :=
            dmAccExport.SalesInvSQL.FieldByName('Sales_Invoice').AsInteger;
          Open;
          First;
          while (not dmAccExport.SalesInvChgsSQL.EOF) do
          begin
            {Set Account type based on the sign of the price, -ve or +ve}
            rValue := FieldByName('Amount').AsFloat;
            if rValue = 0 then
              begin
              next;
              continue;
              end;

            if rValue < 0 then
              begin
              rValue := rValue * -1;
              sAcc_Type := 'SC';
              end
            else
              begin
              sAcc_Type := 'SI';
              end;

            {Nominal Code}
            if Trim(FieldByName('Nominal').AsString) <> '' then
              sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 14)
            else
              sNomCode := Copy(dmAccExport.CompanySQL.FieldByName('Sales_Nom_Def').AsString +
                sfiller, 1, 14);

            {Nett Amount}
            {See further up for rValue}
            sValue := Copy(formatfloat('0.00000', (rValue)) + sfiller, 1, 20);

            {VAT Code - already set in main sales invoice line}
            sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);

            {VAT Amount}
            rVatRate := FieldByName('VAT_Rate').Asfloat;
            rVatValue := rValue * (rVatRate/100);

            sVatValue := Copy(formatfloat('0.00000', (rVatValue)) + sfiller, 1, 20);

            inc(isalesInv);
            if rValue <> 0 then
              begin
              {Update the temporary table with new records}
              dmAccExport.qryUpSageInvs.close;
              dmAccExport.qryUpSageInvs.Parambyname('Operator').asinteger := frmWTMain.Operator;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_no').asinteger := iSalesInv;
              dmAccExport.qryUpSageInvs.Parambyname('Transaction_Type').asstring := sAcc_Type;
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Date').asdatetime := dmAccExport.SalesInvSQL.FieldByName('Invoice_Date').AsDateTime;
              dmAccExport.qryUpSageInvs.Parambyname('Reference').asstring := sReference;
              dmAccExport.qryUpSageInvs.Parambyname('Account_Code').asstring := sAcc_Code;
              dmAccExport.qryUpSageInvs.Parambyname('Description').asstring := sDescription;
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Code').asinteger := strtoint(sVat_Code);
              dmAccExport.qryUpSageInvs.Parambyname('Nominal').asstring := sNomCode;
              dmAccExport.qryUpSageInvs.Parambyname('Department').asstring := '1';
              dmAccExport.qryUpSageInvs.Parambyname('Goods_Value').asfloat := strtofloat(sValue);
              dmAccExport.qryUpSageInvs.Parambyname('Vat_Value').asfloat := strtofloat(sVatValue);
              dmAccExport.qryUpSageInvs.Parambyname('Invoice_Code').asinteger := iInvoiceCode;
              dmAccExport.qryUpSageInvs.execsql;
              end;
            dmAccExport.SalesInvChgsSQL.next;
          end;
          end;
          sInvoiceNo := trim(sReference);
        end;
      Next;
    end;
  end;
end;

procedure TfrmWTAccExport3.CreateSageMMSHeader;
var
  sSageMMSText: string;
  sInvoiceNo: string;
  i: integer;
  iCounter: integer;
  iNominalCounter: integer;
begin
  sInvoiceNo := '';
  sReference := '';
  icounter := 0;
  iNominalCounter := 0;

  with dmAccExport.qryGetSageImport do
  begin
    Close;
    parambyname('Operator').asinteger := frmWTMain.Operator;
    Open;
    First;
    sInvoiceNo := fieldbyname('Reference').asstring;

    while (not EOF) do
    begin
      sReference := fieldbyname('Reference').asstring;
      if trim(sInvoiceNo) = trim(sReference) then
        begin
          inc(icounter);
        end
      else
        begin
          if icounter > iNominalCounter then
            iNominalCounter := icounter;
          sInvoiceNo := trim(sReference);
          icounter := 1;
        end;
      Next;
    end;

    if icounter > iNominalCounter then
      iNominalCounter := icounter;
  end;

  sSageMMSText := '';
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('AccountNumber',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('CBAccountNumber',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('DaysDiscountValid',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('DiscountValue',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('DiscountPercentage',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('DueDate',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('GoodsValueInAccountCurrency',true,true));

  {Sales}
  if frmWTAccExport1.ActionListBox.ItemIndex = 2 then
    sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('SalControlValueInBaseCurrency',true,true))
  else
  {Purchases}
    sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('PurControlValueInBaseCurrency',true,true));

  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('DocumenttoBaseCurrencyRate',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('DocumentToAccountCurrencyRate',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('PostedDate',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('QueryCode',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TransactionReference',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('SecondReference',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('Source',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('SYSTraderTranType',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TransactionDate',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('UniqueReferenceNumber',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('UserNumber',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxValue',true,true));
  sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('SYSTraderGenerationReasonType',true,true));

  for i := 1 to iNominalCounter do
    begin
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisTransactionValue/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalAccountNumber/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalCostCentre/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalDepartment/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalAnalysisNarrative/'+inttostr(i),true,true));

      {Sales}
      if frmWTAccExport1.ActionListBox.ItemIndex = 2 then
        sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisTransactionAnalysisCode/'+inttostr(i),true,true));

(*      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisTransactionValue/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalAccountNumber/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalCostCentre/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalDepartment/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisNominalAnalysisNarrative/2',true,true));

      {Sales}
      if frmWTAccExport1.ActionListBox.ItemIndex = 2 then
        sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('NominalAnalysisTransactionAnalysisCode/2',true,true));
*)

      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisTaxRate/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisGoodsValueBeforeDiscount/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisDiscountValue/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisDiscountPercentage/'+inttostr(i),true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisTaxOnGoodsValue/'+inttostr(i),true,true));

(*      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisTaxRate/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisGoodsValueBeforeDiscount/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisDiscountValue/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisDiscountPercentage/2',true,true));
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('TaxAnalysisTaxOnGoodsValue/2',true,true));
*)
    end;

  Writeln(InvFile, sSageMMSText);
end;

procedure TfrmWTAccExport3.SageMMSCreateExportFile;
var
  bInvoiceSame: boolean;
  sSageMMSText: string;
  sInvoiceNo: string;
//  iMultiplier: integer;
  iCounter: integer;
  iNominalCounter: integer;
  iInvoiceCode, iNewInvoiceCode: integer;
  sGrossValue, sGoodsValue, sVatValue, sNomGoodsValue: string;
begin
  CreateSageMMSHeader;

  sInvoiceNo := '';
  iNewInvoiceCode := 0;

  bInvoiceSame := false;

  with dmAccExport.qryGetSageImport do
  begin
    Close;
    parambyname('Operator').asinteger := frmWTMain.Operator;
    Open;
    First;
    icounter := 0;
    iNominalCounter := 1;

    while (not EOF) do
    begin
      if iNominalCounter = 1 then
        begin
          sSageMMSText := '';

          iInvoiceCode := fieldbyname('Invoice_Code').asinteger;

          {Account Code}
          sAcc_code := Copy(FieldByName('Account_Code').AsString + sfiller, 1, 8);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sAcc_code,true,true));

          {Cash Book Account Number}
          sCBAcc_code := Copy('' + sfiller, 1, 8);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sCBAcc_code,true,true));

          {Days Discount Valid}
          sDays_Discount := Copy('' + sfiller, 1, 2);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sDays_Discount,false,true));

          {Discount Value}
          sDiscount_Value := Copy('' + sfiller, 1, 18);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sDiscount_Value,false,true));

          {Discount Percentage}
          sDiscount_Perc := Copy('' + sfiller, 1, 26);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sDiscount_Perc,false,true));

          {Txn Due Date}  {}
          sDue_Date := Copy(FormatDateTime('dd"/"mm"/"yy', (FieldByName('Invoice_Date').AsDateTime + 30)) + sfiller, 1, 8);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sDue_Date,true,true));

          {Goods Gross Value in Accounts Currency}
//          sValue := Copy(formatfloat('0.00', (FieldByName('Total_Goods_Value').AsFloat+FieldByName('Total_Vat_Value').AsFloat)) + sfiller, 1, 20);
          sValue := Copy(formatfloat('0.00',
            (dmAccExport.GetInvoiceGrossTotal(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring))) + sfiller, 1, 20);
          sGrossValue := sValue;
          if (fieldbyname('Transaction_type').asstring = 'SC') or (fieldbyname('Transaction_type').asstring = 'PC') then
            sValue := floattostr(strtofloat(sValue) * -1);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sValue,false,true));

          {Goods Gross Value in Base Currency}
//          sValue := Copy(formatfloat('0.00', (FieldByName('Total_Goods_Value').AsFloat+FieldByName('Total_Vat_Value').AsFloat)) + sfiller, 1, 20);
          sValue := Copy(formatfloat('0.00',
            (dmAccExport.GetInvoiceGrossTotal(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring))) + sfiller, 1, 20);
          if (fieldbyname('Transaction_type').asstring = 'SC') or (fieldbyname('Transaction_type').asstring = 'PC') then
            sValue := floattostr(strtofloat(sValue) * -1);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sValue,false,true));

          {Accounts Currency Rate}
          sCurrency_Rate := Copy('1.00' + sfiller, 1, 18);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sCurrency_Rate,false,true));

          {Base Currency Rate}
          sBase_Currency_Rate := Copy('1.00' + sfiller, 1, 18);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sBase_Currency_Rate,false,true));

          {Posting Date}
          sPost_Date := Copy(FormatDateTime('dd"/"mm"/"yy', date) + sfiller, 1, 8);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sPost_Date,true,true));

          {Query Code}
          sQuery_Code := copy('' + sfiller,1,1);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sQuery_Code,true,true));

          {Txn ref 1}
          sTxn_Ref1 := copy(fieldbyname('Reference').asstring + sfiller,1,20);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sTxn_Ref1,true,true));

          {Txn Ref 2}
          sTxn_Ref2 := copy(FieldByName('Description').AsString + sfiller,1,20);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sTxn_Ref2,true,true));

          {Txn Source}
          sSource := Copy('' + sfiller, 1, 2);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sSource,false,true));

          {Account Type - set to Invoice or Credit}
          if (fieldbyname('Transaction_type').asstring = 'SI') or (fieldbyname('Transaction_type').asstring = 'PI') then
            sAcc_Type := copy('4' + sfiller,1,2)
          else
            sAcc_Type := copy('5' + sfiller,1,2);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sAcc_Type,false,true));

          {Transaction Date}
          sDate := Copy(FormatDateTime('dd"/"mm"/"yy',
            FieldByName('Invoice_Date').AsDateTime) + sfiller, 1, 8);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sDate,true,true));

          {Reference}
          sReference := Copy(FieldByName('Reference').Asstring + sfiller, 1, 8);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('',false,true));

          {User Number}
          sUserNo := Copy('' + sfiller, 1, 4);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sUserNo,false,true));

          {Tax Value - VAT Amount}
//          sVatValue := Copy(formatfloat('0.00', (FieldByName('Total_VAT_Value').AsFloat)) + sfiller, 1, 18);
          sVatValue := Copy(formatfloat('0.00',
            (dmAccExport.GetInvoiceVatTotal(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring))) + sfiller, 1, 20);
//          sGoodsValue := floattostr(strtofloat(sGrossValue) - strtofloat(sVatValue));
          sGoodsValue := formatfloat('0.00',(strtofloat(sGrossValue) - strtofloat(sVatValue)));
          if (fieldbyname('Transaction_type').asstring = 'SC') or (fieldbyname('Transaction_type').asstring = 'PC') then
            sVatValue := floattostr(strtofloat(sVatValue) * -1);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sVatValue,false,false));

          {Reason Code}
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format('',false,true));

          {Reason Code}
          sReason := Copy('' + sfiller, 1, 2);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sReason,false,true));
        end;

      {Nominal Nett Amount}
      sValue := Copy(formatfloat('0.00', roundfloat(FieldByName('Total_Goods_Value').AsFloat,2)) + sfiller, 1, 18);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sValue,false,true));
      sNomGoodsValue := sValue;

      {Nominal Code}
      sNomCode := Copy(FieldByName('Nominal').AsString + sfiller, 1, 8);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sNomCode,true,true));

      {Cost centre}
      sCost_Centre := Copy(FieldByName('Nominal').AsString + sfiller, 9, 3);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sCost_Centre,true,true));

      {Department Number}
      sDepartment := Copy(FieldByName('Nominal').AsString + sfiller, 12, 3);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sDepartment,true,true));

      {Nominal Analysis Code Name}
      sNomAnalysisCodeName := Copy('' + sfiller, 1, 60);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sNomAnalysisCodeName,true,true));

      {Nominal Analysis Code}
      if frmWTAccExport1.ActionListBox.ItemIndex = 2 then
        begin
          sNomAnalysisCode := Copy('' + sfiller, 1, 20);
          sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sNomAnalysisCode,true,true));
        end;

      {Tax Analysis 1 ----------------------------------------------------------------}

      {VAT Code}
      sVat_Code := Copy(FieldByName('VAT_Code').AsString + sfiller, 1, 2);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sVat_Code,false,true));

      {Nett Goods Amount - before discount}
      sValue := Copy(formatfloat('0.00', roundfloat(FieldByName('Total_Goods_Value').AsFloat,2)) + sfiller, 1, 18);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sValue,false,true));

      {Tax Discount Value}
      sTax_Discount_Value := Copy(formatfloat('0.00', (0.00)) + sfiller, 1, 18);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sTax_Discount_Value,false,true));

      {Tax Discount Perc}
      sTax_Discount_Perc := Copy(formatfloat('0.00', (0.00)) + sfiller, 1, 20);
      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sTax_Discount_Perc,false,true));

      {Nett Goods Amount - after discount}
      if trim(sNomGoodsValue) = trim(sGoodsValue) then
        sValue := trim(sVatValue)
      else
        sValue := Copy(formatfloat('0.00', roundfloat(FieldByName('Total_Vat_Value').AsFloat,2)) + sfiller, 1, 18);

      sSageMMSText := trim(sSageMMSText) + trim(Sage50Format(sValue,false,true));

      Next;

      sInvoiceNo := fieldbyname('Reference').asstring;
      iNewInvoiceCode := fieldbyname('Invoice_Code').asinteger;

      {write the contents of the record away}
//      if sInvoiceNo <> trim(sReference) then
      if iInvoiceCode <> iNewInvoiceCode then
        begin
          Writeln(InvFile, sSageMMSText);
          inc(icounter);
//          sInvoiceNo := trim(sReference);
          iNominalCounter := 1;
        end
      else
        begin
          inc(iNominalCounter);
        end;
    end;

    {write away the final record}
    if sSageMMSText <> '' then
      begin
        Writeln(InvFile, sSageMMSText);
        inc(icounter);
      end;

    frmWTAccExport4.iRecordCounter := iCounter;
  end;
end;

procedure TfrmWTAccExport3.QBooksCreateExportFile;
var
  bInvoiceSame: boolean;
  sQBooksText: string;
  sInvoiceNo: string;
  iMultiplier: integer;
  i, iCounter: integer;
  iNominalCounter: integer;
  sField: string;
begin
  CreateQBooksHeader;

  sInvoiceNo := '';
  bInvoiceSame := false;

  with dmAccExport.qryGetSageImport do
  begin
    Close;
    parambyname('Operator').asinteger := frmWTMain.Operator;
    Open;
    First;
    icounter := 0;
    iNominalCounter := 1;

    while (not EOF) do
    begin
      if iNominalCounter = 1 then
        begin
          if (fieldbyname('Transaction_type').asstring = 'SI') or
             (fieldbyname('Transaction_type').asstring = 'PI') then
            iMultiplier := -1
          else
            iMultiplier := 1;

          sQBooksText := '';

          sQBooksText := 'TRNS';

          {Transaction ID}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Transaction Type - set to Invoice or Credit}
          if (fieldbyname('Transaction_type').asstring = 'SI') then
            sField := 'INVOICE'
          else
          if (fieldbyname('Transaction_type').asstring = 'SC') then
            sField := 'CREDIT MEMO'
          else
          if (fieldbyname('Transaction_type').asstring = 'PI') then
            sField := 'BILL'
          else
          if (fieldbyname('Transaction_type').asstring = 'PC') then
            sField := 'BILL REFUND';
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Transaction Date}
          sField := FormatDateTime('mm"/"dd"/"yy', FieldByName('Invoice_Date').AsDateTime);
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Account Code}
//          sField := trim(FieldByName('Account_Code').AsString);
          if (fieldbyname('Transaction_type').asstring = 'SI') or
             (fieldbyname('Transaction_type').asstring = 'SC') then
            sField := 'Accounts Receivable'
          else
            sField := 'Cost of Goods Sold';

          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Customer/Supplier Name}
          sField := trim(dmAccExport.GetInvoiceAccount(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring));
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Class/Subclass}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Goods Gross Value in Accounts Currency}
          sField := formatfloat('0.00',
            (dmAccExport.GetInvoiceGrossTotal(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring)));
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Invoice/Credit Note Number}
          sReference := trim(fieldbyname('Reference').asstring);
          sField := trim(fieldbyname('Reference').asstring);
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Memo}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Clear}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {To Print}
          sQBooksText := sQBooksText + QBooksIIFFormat('N');

          {Address 1}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Address 2}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Address 3}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Address 4}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Address 5}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Due Date}
          sField := FormatDateTime('mm"/"dd"/"yy', date);
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {Terms}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          {Paid}
          sQBooksText := sQBooksText + QBooksIIFFormat('N');

(*          {Shipped Date}
          sField := FormatDateTime('mm"/"dd"/"yy', FieldByName('Invoice_Date').AsDateTime);
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {VAT Rate}
          sQBooksText := sQBooksText + QBooksIIFFormat('');
*)
          {VAT Amount}
          sField := formatfloat('0.00',
            (dmAccExport.GetInvoiceVatTotal(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring)));
          sQBooksText := sQBooksText + QBooksIIFFormat(sField);

          {VAT Code}
          sQBooksText := sQBooksText + QBooksIIFFormat('');

          Writeln(InvFile, sQBooksText);
          inc(iNominalCounter);
        end;

{------------------   SPL Transactions   -------------------------------------}

      sQBooksText := 'SPL';

      {Transaction ID}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Transaction Type - set to Invoice or Credit}
      if (fieldbyname('Transaction_type').asstring = 'SI') then
        sField := 'INVOICE'
      else
      if (fieldbyname('Transaction_type').asstring = 'SC') then
        sField := 'CREDIT MEMO'
      else
      if (fieldbyname('Transaction_type').asstring = 'PI') then
        sField := 'BILL'
      else
      if (fieldbyname('Transaction_type').asstring = 'PC') then
        sAcc_Type := 'BILL REFUND';
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Transaction Date}
      sField := FormatDateTime('mm"/"dd"/"yy', FieldByName('Invoice_Date').AsDateTime);
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Nominal Code}
      sField := trim(FieldByName('Nominal').AsString) ;
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Customer Name}
      sField := '';
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Class/Subclass}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Nominal Nett Amount}
      sField := formatfloat('0.00', (FieldByName('Total_Goods_Value').AsFloat)*iMultiplier);
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Invoice/Credit Note Number}
      sField := '';
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Memo}
      sField := dmAccExport.GetInvoiceDescription(fieldbyname('Invoice_Code').asinteger,fieldbyname('Transaction_type').asstring);
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Clear}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Quantity}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Nominal Nett Amount}
      sField := formatfloat('0.00', (FieldByName('Total_Goods_Value').AsFloat));
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Invoice Item}
      sField := '';
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      {Payment Method}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Taxable}
      if (FieldByName('Total_VAT_Value').AsFloat) <> 0 then
        sQBooksText := sQBooksText + QBooksIIFFormat('Y')
      else
        sQBooksText := sQBooksText + QBooksIIFFormat('N');

      {ValAdj}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {ServiceDate}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Other2}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {Extra}
      sQBooksText := sQBooksText + QBooksIIFFormat('');

      {VAT Amount}
      sField := formatfloat('0.00', (FieldByName('Total_VAT_Value').AsFloat*iMultiplier));
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

(*     {VAT Rate}
      sField := formatfloat('0.00000', dmAccExport.GetVatRate(fieldbyname('VAT_Code').asinteger));
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);
*)
      {VAT Code}
      sField := dmAccExport.GetVatRef(fieldbyname('VAT_Code').asinteger);
      sQBooksText := sQBooksText + QBooksIIFFormat(sField);

      Writeln(InvFile, sQBooksText);

      Next;

      sInvoiceNo := trim(fieldbyname('Reference').asstring);

      {write the contents of the record away}
      if sInvoiceNo <> trim(sReference) then
        begin
          sQBooksText := 'ENDTRNS';
          for i := 1 to 21 do
            sQBooksText := sQBooksText + QBooksIIFFormat('');

          Writeln(InvFile, sQBooksText);
          inc(icounter);
          iNominalCounter := 1;
        end
      else
        begin
          inc(iNominalCounter);
        end;
    end;

    {write away the final record}
    if sQBooksText <> '' then
      begin
        sQBooksText := 'ENDTRNS';
        for i := 1 to 21 do
          sQBooksText := sQBooksText + QBooksIIFFormat('');

        Writeln(InvFile, sQBooksText);
        inc(icounter);
      end;

    frmWTAccExport4.iRecordCounter := iCounter;
  end;
end;


procedure TfrmWTAccExport3.CreateQBooksHeader;
var
  sQBooksText: string;
  i: integer;
begin

  sQBooksText := '';
  sQBooksText := '!TRNS';
  sQBooksText := sQBooksText + QBooksIIFFormat('TRNSID');
  sQBooksText := sQBooksText + QBooksIIFFormat('TRNSTYP');
  sQBooksText := sQBooksText + QBooksIIFFormat('DATE');
  sQBooksText := sQBooksText + QBooksIIFFormat('ACCNT');
  sQBooksText := sQBooksText + QBooksIIFFormat('NAME');
  sQBooksText := sQBooksText + QBooksIIFFormat('CLASS');
  sQBooksText := sQBooksText + QBooksIIFFormat('AMOUNT');
  sQBooksText := sQBooksText + QBooksIIFFormat('DOCNUM');
  sQBooksText := sQBooksText + QBooksIIFFormat('MEMO');
  sQBooksText := sQBooksText + QBooksIIFFormat('CLEAR');
  sQBooksText := sQBooksText + QBooksIIFFormat('TOPRINT');
  sQBooksText := sQBooksText + QBooksIIFFormat('ADDR1');
  sQBooksText := sQBooksText + QBooksIIFFormat('ADDR2');
  sQBooksText := sQBooksText + QBooksIIFFormat('ADDR3');
  sQBooksText := sQBooksText + QBooksIIFFormat('ADDR4');
  sQBooksText := sQBooksText + QBooksIIFFormat('ADDR5');
  sQBooksText := sQBooksText + QBooksIIFFormat('DUEDATE');
  sQBooksText := sQBooksText + QBooksIIFFormat('TERMS');
  sQBooksText := sQBooksText + QBooksIIFFormat('PAID');
  sQBooksText := sQBooksText + QBooksIIFFormat('VATAMOUNT');
  sQBooksText := sQBooksText + QBooksIIFFormat('VATCODE');

  Writeln(InvFile, sQBooksText);

  sQBooksText := '';
  sQBooksText := '!SPL';
  sQBooksText := sQBooksText + QBooksIIFFormat('SPLID');
  sQBooksText := sQBooksText + QBooksIIFFormat('TRNSTYP');
  sQBooksText := sQBooksText + QBooksIIFFormat('DATE');
  sQBooksText := sQBooksText + QBooksIIFFormat('ACCNT');
  sQBooksText := sQBooksText + QBooksIIFFormat('NAME');
  sQBooksText := sQBooksText + QBooksIIFFormat('CLASS');
  sQBooksText := sQBooksText + QBooksIIFFormat('AMOUNT');
  sQBooksText := sQBooksText + QBooksIIFFormat('DOCNUM');
  sQBooksText := sQBooksText + QBooksIIFFormat('MEMO');
  sQBooksText := sQBooksText + QBooksIIFFormat('CLEAR');
  sQBooksText := sQBooksText + QBooksIIFFormat('QNTY');
  sQBooksText := sQBooksText + QBooksIIFFormat('PRICE');
  sQBooksText := sQBooksText + QBooksIIFFormat('INVITEM');
  sQBooksText := sQBooksText + QBooksIIFFormat('PAYMETH');
  sQBooksText := sQBooksText + QBooksIIFFormat('TAXABLE');
  sQBooksText := sQBooksText + QBooksIIFFormat('VALADJ');
  sQBooksText := sQBooksText + QBooksIIFFormat('SERVICEDATE');
  sQBooksText := sQBooksText + QBooksIIFFormat('OTHER2');
  sQBooksText := sQBooksText + QBooksIIFFormat('EXTRA');
  sQBooksText := sQBooksText + QBooksIIFFormat('VATAMOUNT');
  sQBooksText := sQBooksText + QBooksIIFFormat('VATCODE');

  Writeln(InvFile, sQBooksText);

  sQBooksText := '';
  sQBooksText := '!ENDTRANS';
  for i := 1 to 21 do
    sQBooksText := sQBooksText + QBooksIIFFormat('');

  Writeln(InvFile, sQBooksText);
end;

procedure TfrmWTAccExport3.CreateQBooksCustomerHeader;
var
  sQBooksText: string;
begin

  sQBooksText := '!CUST ';
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('NAME');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('BADDR1');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('BADDR2');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('BADDR3');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('BADDR4');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('BADDR5');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('PHONE1');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('PHONE2');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('FAXNUM');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('NOTE');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('CONT1');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('CTYPE');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('REP');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('COMPANYNAME');

  Writeln(AccFile, sQBooksText);
end;

procedure TfrmWTAccExport3.CreateQBooksSupplierHeader;
var
  sQBooksText: string;
begin

  sQBooksText := '!VEND ';
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('NAME');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('ADDR1');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('ADDR2');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('ADDR3');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('ADDR4');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('ADDR5');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('PHONE1');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('PHONE2');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('FAXNUM');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('CONT1');
  sQBooksText := trim(sQBooksText) + QBooksIIFFormat('COMPANYNAME');

  Writeln(AccFile, sQBooksText);
end;

end.
