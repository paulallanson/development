unit PBFileImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TPBFileImportFrm = class(TForm)
    pnlCustomer: TPanel;
    lblStep1: TLabel;
    LblCustName: TLabel;
    pnlImportFile: TPanel;
    lblStep3: TLabel;
    edtImportFileName: TEdit;
    btnFindFile: TButton;
    pnlImport: TPanel;
    lblStep4: TLabel;
    ImportBtn: TButton;
    pnlProgress: TPanel;
    Label1: TLabel;
    lblProgress: TLabel;
    lblRecordCount: TLabel;
    lblReadingFile: TLabel;
    prgrsbrImport: TProgressBar;
    mmErrorRecords: TMemo;
    pnlCancel: TPanel;
    Cancel2BitBtn: TBitBtn;
    cmbImportType: TComboBox;
    opndlgImportFile: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure btnFindFileClick(Sender: TObject);
    procedure cmbImportTypeClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
  private
    FFileType: string;
    function CountTextFileLines(var theTextFile: TextFile): integer;
    function ParseCSVSInvoiceFile(DataLine: string; var InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode,
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
    function ParseCSVOrderFile(DataLine: string; var SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
    function ParseCSVAddressFile(DataLine: string; var Salutation, FName,
      LName, Company, Address1, Address2, Address3, Address4, City,
      Postcode, County, DAddress1, DAddress2, DAddress3, DAddress4, DCity,
      DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress,
      CustomerStatus, CreditTerms, ContactPhone, ContactMobile, SubRep, CustomerType, Analysis1, Analysis2, Analysis3,
      Analysis4, CoRegNumber, VATNumber, Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode,
      ContactTitle, ContactFName, ContactLName, ContactSalutation, ContactEmail, ContactType, ContactLinkedIn,
      DeliveryNOtes, CustomerNotes: string): boolean;
    function ParseQBAddressFile(DataLine: string; var Salutation, FName,
      LName, Company, Address1, Address2, Address3, Address4, City,
      Postcode, County, DAddress1, DAddress2, DAddress3, DAddress4, DCity,
      DPostcode, DCounty: string): boolean;
    procedure ParseError(LineNo: Integer; DataLine: String;
      var theErrorFile: TextFile);
    procedure DoOneCustomer(Salutation, FName, LName, Company, Address1,
      Address2, Address3, Address4, City, Postcode, County, DAddress1,
      DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress, CustomerStatus,
      CreditTerms, ContactPhone, ContactMobile, SubRep, CustomerType, Analysis1, Analysis2, Analysis3, Analysis4, CoRegNumber, VATNumber,
      Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation,
      ContactEmail, ContactType, ContactLinkedIn, DeliveryNotes, CustomerNotes: string);
    procedure DoOneSupplier(Salutation, FName, LName, Company, Address1,
      Address2, Address3, Address4, City, Postcode, County, DAddress1,
      DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Phone, Fax, Email, AccCode, WebAddress, CustomerStatus,
      CreditTerms, ContactPhone, ContactMobile, Analysis1, Analysis2, Analysis3, Analysis4, CoRegNumber, VATNumber,
      Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation,
      ContactEmail, ContactType, ContactLinkedIn: string);
    function DoOneInvoice(InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode,
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): integer;
    function DoOneInvoiceLine(Invoice: integer; InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode,
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
    function DoOneJobBag(SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): integer;
    function DoOneJobBagLine(JobBag: integer; AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
    function DoOnePurchaseOrder(SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
    procedure ImportQBFile;
    procedure ImportCSVFile;
    procedure ImportCSVOrderFile;
    procedure ImportCSVSInvoiceFile;
    procedure SetFileType(const Value: string);
    function DoOneCustomerRep(Company, Rep: string): boolean;
    { Private declarations }
  public
    property FileType: string read FFileType write SetFileType;
  end;

var
  PBFileImportFrm: TPBFileImportFrm;

implementation

uses UITypes, PBAccImportDM, CCSCommon;

{$R *.dfm}

procedure TPBFileImportFrm.FormActivate(Sender: TObject);
begin
  cmbImportType.ItemIndex := 0;
  cmbImportTypeClick(self);
end;

procedure TPBFileImportFrm.btnFindFileClick(Sender: TObject);
begin
  opndlgImportFile.Files.Clear;
  edtImportFileName.Text := '';
  if opndlgImportFile.Execute then
  begin
    if opndlgImportFile.Files.Count > 0 then
    begin
      edtImportFileName.Text := opndlgImportFile.Files[opndlgImportFile.Files.Count - 1];
      ImportBtn.Enabled := True;
    end;
  end;

  if (edtImportFileName.Text <> '') then
  begin
    //enable the import button
    pnlImport.Enabled := True;
    lblStep4.Font.Style := [fsBold];
    lblStep3.Font.Style := [];
  end;
end;

procedure TPBFileImportFrm.cmbImportTypeClick(Sender: TObject);
begin
  if cmbImportType.ItemIndex > 0 then
    begin
      pnlImportFile.Enabled := True;
      lblStep3.Font.Style := [fsBold];
      lblStep1.Font.Style := [];
    end;
end;

procedure TPBFileImportFrm.ImportBtnClick(Sender: TObject);
begin
  case cmbImportType.itemindex of
    0..2:
      begin
        if FileType = 'QB' then
          ImportQBFile
        else
          ImportCSVFile;
      end;
    3: ImportCSVOrderFile;
  else
    ImportCSVSInvoiceFile;
  end;
end;

procedure TPBFileImportFrm.ImportCSVSInvoiceFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  result: boolean;
  Invoice: integer;
  InvoiceNumber, InvoiceDate, SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DelAddressNumber, CompletedDate, DateRequired: string;
  OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, ProductDescription, QtyOrdered, QtyDelivered: string;
  PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber, DiscountValue, Description, Exported, Cancelled, NominalCode, SONumberItem: string;
  InvoiceOrCredit, PaidStatus, DateCreated, TotalValue: string;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
  OldInvoiceNumber: string;
begin
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;

  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.csv') or
     (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.CSV') then
    begin
//prepare files for input/output
      try
        AssignFile(DataTextFile, edtImportFileName.Text);
        Reset(DataTextFile);
      except
        begin
          messagedlg('The file is in use or is open by another application', mtError, [mbOk], 0);
          exit;
        end;
      end;

      AssignFile(ErrorRecordFile, 'ErrorFile.txt');
      ReWrite(ErrorRecordFile);

      LineCount := CountTextFileLines(DataTextFile);
      Reset(DataTextFile);

//set count label values/visibility
      pnlProgress.height := 57;
      mmErrorRecords.height := 153;
      lblRecordCount.Caption := 'records read.';
      lblRecordCount.Visible := True;
      lblProgress.Visible := True;
      prgrsbrImport.Max := LineCount;
      mmErrorRecords.Lines.Clear;

      While Not EOF(DataTextFile) do
        begin
//Read Line from Prod Text File
          ReadLn(DataTextFile, DataLine);
          LineNo := LineNo + 1;
          if LineNo = 1 then continue;

          lblProgress.Caption := IntToStr(LineNo);
          prgrsbrImport.Position := LineNo;
          pnlProgress.Repaint;

          Result := ParseCSVSInvoiceFile(DataLine, InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode, 
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if (pos('Y', Cancelled) > 0) or (trim(JobNumber) = '0') then
            continue;

          if (trim(InvoiceNumber) <> OldInvoiceNumber) then
            begin
              Invoice := DoOneInvoice(InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode,
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);
              OldInvoiceNumber := InvoiceNumber;
            end;

          if (Invoice <> 0) and (strtoint(trim(ItemNumber)) < 999) and (strtoint(trim(SONumberItem)) > 0) and (QtyOrdered <> '0') then
            begin
              Result := DoOneInvoiceLine(Invoice, InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode,
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);
            end;

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
          end;
        end;
    end;
//display error/insert/update counters
  mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
  if ErrorCount > 0 then
    mmErrorRecords.Lines.Add('The bad records have been written to C:\My Documents\ErrorFile.txt');
  mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
  mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
  mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

  //close Text Files
  CloseFile(DataTextFile);
  CloseFile(ErrorRecordFile);
end;

procedure TPBFileImportFrm.ImportCSVOrderFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  result, POResult: boolean;
  JobBag: integer;
  SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DelAddressNumber, CompletedDate, DateRequired: string;
  OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, ProductDescription, QtyOrdered, QtyDelivered: string;
  PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
  OldSONumber: string;
begin
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;

  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.csv') or
     (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.CSV') then
    begin
//prepare files for input/output
      try
        AssignFile(DataTextFile, edtImportFileName.Text);
        Reset(DataTextFile);
      except
        begin
          messagedlg('The file is in use or is open by another application', mtError, [mbOk], 0);
          exit;
        end;
      end;

      AssignFile(ErrorRecordFile, 'ErrorFile.txt');
      ReWrite(ErrorRecordFile);

      LineCount := CountTextFileLines(DataTextFile);
      Reset(DataTextFile);

//set count label values/visibility
      pnlProgress.height := 57;
      mmErrorRecords.height := 153;
      lblRecordCount.Caption := 'records read.';
      lblRecordCount.Visible := True;
      lblProgress.Visible := True;
      prgrsbrImport.Max := LineCount;
      mmErrorRecords.Lines.Clear;
      OldSONumber := '';


      While Not EOF(DataTextFile) do
        begin
//Read Line from Prod Text File
          ReadLn(DataTextFile, DataLine);
          LineNo := LineNo + 1;
          if LineNo = 1 then continue;

          lblProgress.Caption := IntToStr(LineNo);
          prgrsbrImport.Position := LineNo;
          pnlProgress.Repaint;

          Result := ParseCSVOrderFile(DataLine, SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                    DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                    ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if OrderStatus = 'Cancelled' then
            continue;

          if (trim(PONumber) <> '0') and (trim(PONumber) <> '') then
            begin
              POResult := DoOnePurchaseOrder(SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                        DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                        ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);
              if POResult = false then
                continue;
            end;

//          if (trim(ItemNumber) = '1') then
          if (trim(SONumber) <> OldSONumber) then
            begin
              JobBag := DoOneJobBag(SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                      DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                      ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);
              OldSONumber := SONumber;
            end;

          if (JobBag <> 0) and (strtoint(trim(ItemNumber)) < 999) and (QtyOrdered <> '0') then
            begin
              Result := DoOneJobBagLine(JobBag, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                      DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                      ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber);
            end;

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
          end;
        end;
    end;
//display error/insert/update counters
  mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
  if ErrorCount > 0 then
    mmErrorRecords.Lines.Add('The bad records have been written to C:\My Documents\ErrorFile.txt');
  mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
  mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
  mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

  //close Text Files
  CloseFile(DataTextFile);
  CloseFile(ErrorRecordFile);
end;

procedure TPBFileImportFrm.ImportQBFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  result: boolean;
  Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County: string;
  DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode: string;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
begin
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;

  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.txt') or
     (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.TXT') then
    begin
//prepare files for input/output
      try
        AssignFile(DataTextFile, edtImportFileName.Text);
        Reset(DataTextFile);
      except
        begin
          messagedlg('The file is in use or is open by another application', mtError, [mbOk], 0);
          exit;
        end;
      end;

      AssignFile(ErrorRecordFile, 'ErrorFile.txt');
      ReWrite(ErrorRecordFile);

      LineCount := CountTextFileLines(DataTextFile);
      Reset(DataTextFile);

//set count label values/visibility
      pnlProgress.height := 57;
      mmErrorRecords.height := 153;
      lblRecordCount.Caption := 'records read.';
      lblRecordCount.Visible := True;
      lblProgress.Visible := True;
      prgrsbrImport.Max := LineCount;
      mmErrorRecords.Lines.Clear;

      While Not EOF(DataTextFile) do
        begin
//Read Line from Prod Text File
          ReadLn(DataTextFile, DataLine);
          LineNo := LineNo + 1;
          if LineNo = 1 then continue;

          lblProgress.Caption := IntToStr(LineNo);
          prgrsbrImport.Position := LineNo;
          pnlProgress.Repaint;

          result := ParseQBAddressFile(DataLine, Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if cmbImportType.text = 'Customer' then
            DoOneCustomer(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty,
                                        Rep, Phone, Fax, DName, DCode, '', '', '', '','','','', '', '', '', '','','','','',
                                        '','','','','','','','','','','','','','','')
          else
            DoOneSupplier(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty,
                                        Phone, Fax, '', '', '', '','', '', '','','','', '', '', '', '','','','','',
                                        '','','','','','','','')
        end;
    end;
//display error/insert/update counters
  mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
  if ErrorCount > 0 then
    mmErrorRecords.Lines.Add('The bad records have been written to C:\My Documents\ErrorFile.txt');
  mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
  mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
  mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

  //close Text Files
  CloseFile(DataTextFile);
  CloseFile(ErrorRecordFile);
end;

procedure TPBFileImportFrm.ImportCSVFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  result: boolean;
  Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County, AccCode, WebAddress, CustomerStatus: string;
  CreditTerms, ContactPhone, ContactMobile, ContactTitle, ContactFName, ContactLName, ContactSalutation, ContactEmail, ContactType, ContactLinkedIn: string;
  SubRep, CustomerType, Analysis1, Analysis2, Analysis3, Analysis4, CoRegNumber, VATNumber: string;
  Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, DeliveryNotes, CustomerNotes: string;
  DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email: string;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
begin
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;

  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.csv') or
     (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.CSV') then
    begin
//prepare files for input/output
      try
        AssignFile(DataTextFile, edtImportFileName.Text);
        Reset(DataTextFile);
      except
        begin
          messagedlg('The file is in use or is open by another application', mtError, [mbOk], 0);
          exit;
        end;
      end;

      AssignFile(ErrorRecordFile, 'ErrorFile.txt');
      ReWrite(ErrorRecordFile);

      LineCount := CountTextFileLines(DataTextFile);
      Reset(DataTextFile);

//set count label values/visibility
      pnlProgress.height := 57;
      mmErrorRecords.height := 153;
      lblRecordCount.Caption := 'records read.';
      lblRecordCount.Visible := True;
      lblProgress.Visible := True;
      prgrsbrImport.Max := LineCount;
      mmErrorRecords.Lines.Clear;

      While Not EOF(DataTextFile) do
        begin
//Read Line from Prod Text File
          ReadLn(DataTextFile, DataLine);
          LineNo := LineNo + 1;
          if LineNo = 1 then continue;

          lblProgress.Caption := IntToStr(LineNo);
          prgrsbrImport.Position := LineNo;
          pnlProgress.Repaint;

          result := ParseCSVAddressFile(DataLine, Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName,
                                        DCode, Email, AccCode, WebAddress, CustomerStatus, CreditTerms, ContactPhone, ContactMobile, SubRep,
                                        CustomerType, Analysis1, Analysis2, Analysis3, Analysis4, CoRegNumber, VATNumber, Country, DateCreated,
                                        AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation,
                                        ContactEmail, ContactType, ContactLinkedIn, DeliveryNotes, CustomerNotes);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if cmbImportType.text = 'Customer' then
            DoOneCustomer(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress, CustomerStatus,
                                        CreditTerms, ContactPhone, ContactMobile, SubRep, CustomerType, Analysis1, Analysis2, Analysis3, Analysis4,
                                        CoRegNumber, VATNumber, Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation,
                                        ContactEmail, ContactType, ContactLinkedIn, DeliveryNotes, CustomerNotes)
          else
          if cmbImportType.text = 'Supplier' then
            DoOneSupplier(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Phone, Fax, Email, AccCode, WebAddress, CustomerStatus,
                                        CreditTerms, ContactPhone, ContactMobile, Analysis1, Analysis2, Analysis3, Analysis4,
                                        CoRegNumber, VATNumber, Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation,
                                        ContactEmail, ContactType, ContactLinkedIn)
          else
            Result := DoOneCustomerRep(Company, Rep);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
          end;
        end;
    end;
//display error/insert/update counters
  mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
  if ErrorCount > 0 then
    mmErrorRecords.Lines.Add('The bad records have been written to C:\My Documents\ErrorFile.txt');
  mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
  mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
  mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

  //close Text Files
  CloseFile(DataTextFile);
  CloseFile(ErrorRecordFile);
end;

function TPBFileImportFrm.CountTextFileLines(
  var theTextFile: TextFile): integer;
var
  tempCount : integer;
begin
  tempCount := 0;
  while not EOF(theTextFile) do
  begin
    ReadLn(theTextFile);
    tempCount := tempCount + 1;
  end;
  CountTextFileLines := tempCount;
end;

function TPBFileImportFrm.ParseQBAddressFile(DataLine: string;
      var Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County: string;
      var DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
//  Parse DataLine into individual data items.
    TempStr := '';
    ParseString := DataLine;
    ColIndex := 0;

//copy data items from the line to an array
    While (Pos(#9, ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(#9, ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos-1));
      Delete(ParseString,1,TabPos);
    end;
    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    Salutation := LineData[1];

    FName := LineData[2];

    LName := LineData[3];

    Company := LineData[12];

    Address1 := LineData[13];

    Address2 := LineData[14];

    Address3 := LineData[15];

    Address4 := LineData[15];

    City := LineData[6];

    Postcode := LineData[8];

    County := LineData[7];

    DAddress1 := LineData[17];

    DAddress2 := LineData[18];

    DAddress3 := LineData[19];

    DAddress4 := LineData[21];

    DCity := LineData[20];

    DPostcode := LineData[22];

    DCounty := LineData[21];

    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

function TPBFileImportFrm.ParseCSVAddressFile(DataLine: string; var Salutation, FName,
      LName, Company, Address1, Address2, Address3, Address4, City,
      Postcode, County, DAddress1, DAddress2, DAddress3, DAddress4, DCity,
      DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress, CustomerStatus,
      CreditTerms, ContactPhone, ContactMobile, SubRep, CustomerType, Analysis1, Analysis2, Analysis3,
      Analysis4, CoRegNumber, VATNumber, Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode,
      ContactTitle, ContactFName, ContactLName, ContactSalutation, ContactEmail, ContactType, ContactLinkedIn,
      DeliveryNotes, CustomerNotes: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
//  Parse DataLine into individual data items.
    TempStr := '';
    ParseString := DataLine;
    ColIndex := 0;

//copy data items from the line to an array
    While (Pos(',', ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(',', ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos-1));
      Delete(ParseString,1,TabPos);
    end;
    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    FName := LineData[13];

    Company := LineData[1];

    AccCode := LineData[15];

    Address1 := LineData[2];

    Address2 := LineData[10];

    Address3 := LineData[11];

    Address4 := LineData[3];

    City := LineData[3];

    Postcode := LineData[4];

    County := LineData[12];

    DName := LineData[8];

    if DName <> '' then
      begin
        DCode := LineData[9];

        DAddress1 := LineData[2];

        DAddress2 := LineData[10];

        DAddress3 := LineData[11];

        DAddress4 := LineData[3];

        DCity := LineData[3];

        DPostcode := LineData[4];

        DCounty := LineData[12];
      end
    else
      begin
        DCode := '';

        DAddress1 := '';

        DAddress2 := '';

        DAddress3 := '';

        DAddress4 := '';

        DCity := '';

        DPostcode := '';

        DCounty := '';
      end;

    Rep := LineData[7];

    Phone := LineData[5];

    Fax := LineData[6];

    Email := LineData[14];

    WebAddress := LineData[16];

    CustomerStatus := LineData[17];

    CreditTerms := LineData[18];

    ContactPhone := LineData[19];

    ContactMobile := LineData[20];

    SubRep := LineData[21];

    CustomerType := LineData[22];

    Analysis1 := LineData[23];

    Analysis2 := LineData[24];

    Analysis3 := LineData[25];

    Analysis4 := LineData[26];

    CoRegNumber := LineData[27];

    VATNumber := LineData[28];

    Country := LineData[29];

    DateCreated := LineData[30];

    AccountOnHold := LineData[31];

    CreditLimit := LineData[32];

    VATCode := LineData[33];

    SICCode := LineData[34];

    ContactTitle := LineData[35];

    ContactFName := LineData[36];

    ContactLName := LineData[37];
    LName := LineData[37];

    ContactSalutation := LineData[38];
    Salutation := LineData[38];


    ContactEmail := LineData[39];

    ContactType := LineData[40];

    ContactLinkedIn := LineData[41];

    DeliveryNotes := LineData[42];

    CustomerNotes := LineData[43];

    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

procedure TPBFileImportFrm.ParseError(LineNo: Integer; DataLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, DataLine);
end;

procedure TPBFileImportFrm.DoOneCustomer(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County: string;
      DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress, CustomerStatus,
      CreditTerms, ContactPhone, ContactMobile, SubRep, CustomerType, Analysis1, Analysis2, Analysis3, Analysis4, CoRegNumber, VATNumber, Country,
      DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation, ContactEmail, ContactType,
      ContactLinkedIn, DeliveryNotes, CustomerNotes: string);
begin
  try
    dmAccImport.CompanyName := Company;
    if trim(AccCode) = '' then
      dmAccImport.AccountRef := ''
    else
      dmAccImport.AccountRef := AccCode;

    dmAccImport.DateCreated := PBDatestr(DateCreated);

    dmAccImport.Address1 := Address1;
    dmAccImport.Address2 := Address2;
    dmAccImport.Address3 := Address3;
    dmAccImport.Address4 := Address4;
    dmAccImport.Address5 := postcode;
    dmAccImport.Country  := Country;

    dmAccImport.ContactName := trim(FName) + ' ' + trim(LName);
    dmAccImport.FirstName := trim(FName);
    dmAccImport.LastName := trim(LName);
    dmAccImport.Salutation := trim(Salutation);
    dmAccImport.Title := trim(ContactTitle);
    dmAccImport.Email := trim(Email);
    dmAccImport.ContactEmail := trim(ContactEmail);
    dmAccImport.ContactMobile := trim(ContactMobile);
    dmAccImport.ContactType := trim(ContactType);

    dmAccImport.Telephone := Phone;
    dmAccImport.Fax := Fax;
    dmAccImport.webaddress := WebAddress;
    dmAccImport.CustomerStatus := CustomerStatus;
    dmAccImport.CustomerType := CustomerType;

    dmAccImport.delName := DName;
    dmAccImport.delCode := DCode;
    dmAccImport.delAddress1 := DAddress1;
    dmAccImport.delAddress2 := DAddress2;
    dmAccImport.delAddress3 := DAddress3;
    dmAccImport.delAddress4 := DAddress4;
    dmAccImport.delAddress5 := DPostcode;

    dmAccImport.delContact := '';
    dmAccImport.DelTelephone := Phone;
    dmAccImport.DelFax := Fax;
    dmAccImport.Rep := Rep;
    dmAccImport.SubRep := SubRep;

    dmAccImport.CoRegNumber := CoRegNumber;
    dmAccImport.VATNumber := VATNumber;
    dmAccImport.Currency := '1';
    dmAccImport.SettlementRate := 0;
    dmAccImport.SettlementDays := 0;

    if AccountOnHold = 'Yes' then
      dmAccImport.OnHold := 'Y'
    else
      dmAccImport.OnHold := 'N';

    dmAccImport.CreditLimit := StrToFloatDef(CreditLimit, 0, FormatSettings);
    dmAccImport.VatCode := VatCode;
    dmAccImport.SICCode := SICCode;

    dmAccImport.Analysis1 := Analysis1;
    dmAccImport.Analysis2 := Analysis2;
    dmAccImport.Analysis3 := Analysis3;
    dmAccImport.Analysis4 := Analysis4;

    dmAccImport.CreditTerms := strtoint(CreditTerms);

    dmAccImport.DoOneCustomer;
  finally
  end;
end;

procedure TPBFileImportFrm.DoOneSupplier(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County: string;
      DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Phone, Fax, Email, AccCode, WebAddress, CustomerStatus,
      CreditTerms, ContactPhone, ContactMobile, Analysis1, Analysis2, Analysis3, Analysis4, CoRegNumber, VATNumber,
      Country, DateCreated, AccountOnHold, CreditLimit, VATCode, SICCode, ContactTitle, ContactFName, ContactLName, ContactSalutation,
      ContactEmail, ContactType, ContactLinkedIn: string);
begin
  try
    dmAccImport.CompanyName := Company;
    if trim(AccCode) = '' then
      dmAccImport.AccountRef := ''
    else
      dmAccImport.AccountRef := AccCode;

    dmAccImport.Address1 := Address1;
    dmAccImport.Address2 := Address2;
    dmAccImport.Address3 := Address3;
    dmAccImport.Address4 := Address4;
    dmAccImport.Address5 := postcode;
    dmAccImport.ContactName := trim(FName) + ' ' + trim(LName);

    dmAccImport.Telephone := phone;
    dmAccImport.Fax := fax;
    dmAccImport.webaddress := webAddress;

    dmAccImport.delAddress1 := DAddress1;
    dmAccImport.delAddress2 := DAddress2;
    dmAccImport.delAddress3 := DAddress3;
    dmAccImport.delAddress4 := DAddress4;
    dmAccImport.delAddress5 := DPostcode;

    dmAccImport.delContact := '';
    dmAccImport.DelTelephone := '';
    dmAccImport.DelFax := '';
    dmAccImport.Rep := '';

    dmAccImport.Salutation := trim(Salutation);
    dmAccImport.Title := trim(ContactTitle);
    dmAccImport.Email := trim(Email);
    dmAccImport.ContactEmail := trim(ContactEmail);
    dmAccImport.ContactMobile := trim(ContactMobile);

    dmAccImport.CoRegNumber := CoRegNumber;
    dmAccImport.VATNumber := VATNumber;
    dmAccImport.Currency := '1';
    dmAccImport.SettlementRate := 0;
    dmAccImport.SettlementDays := 0;

    dmAccImport.CreditLimit := 0;

    dmAccImport.DoOneSupplier;
  finally
  end;
end;

function TPBFileImportFrm.DoOneCustomerRep(Company, Rep: string): boolean;
begin
  try
    dmAccImport.CompanyName := Company;
    dmAccImport.Rep := Rep;
    result := dmAccImport.DoOneCustomerRep;
  finally
  end;
end;

procedure TPBFileImportFrm.SetFileType(const Value: string);
begin
  FFileType := Value;
  if FFileType = 'QB' then
    self.caption := 'Import Quickbooks data'
  else
    self.caption := 'Import CSV file type data';
end;

function TPBFileImportFrm.ParseCSVOrderFile(DataLine: string; var SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
//  Parse DataLine into individual data items.
    TempStr := '';
    ParseString := DataLine;
    ColIndex := 0;

//copy data items from the line to an array
    While (Pos(',', ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(',', ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos-1));
      Delete(ParseString,1,TabPos);
    end;
    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    SONumber := LineData[1];

    CashSale := LineData[2];

    AccountCode := LineData[3];

    OrderDate := LineData[4];

    ContactName := LineData[5];

    RaisedBy := LineData[6];

    Subject := LineData[7];

    CustOrderNumber := LineData[8];

    DelAddressNumber := LineData[9];

    CompletedDate := LineData[10];

    DateRequired := LineData[11];

    OrderStatus := LineData[12];

    SpecialInstructions := LineData[13] + ' ' + LineData[14];

    OrderMethod := LineData[15];

    Operator := LineData[16];

    IncludesVAT := LineData[19];

    Notes := LineData[21];

    ItemNumber := LineData[22];

    ProductCode := LineData[23];

    ProductDescription := LineData[24];

    QtyOrdered := LineData[26];

    QtyDelivered := LineData[27];

    PriceUnit := LineData[29];

    UnitPrice := LineData[30];

    UnitCost := LineData[31];

    PONumber := LineData[32];

    DiscountAmount := LineData[33];

    PrintIfZero := LineData[34];

    TaxCode := StringReplace(LineData[35],'T','',[rfReplaceAll]);

    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

function TPBFileImportFrm.DoOneJobBag(SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): integer;
begin
  try
    dmAccImport.CustomerAccount := AccountCode;

    dmAccImport.PONumber := StrToFloatDef(PONumber, 0, FormatSettings);
    dmAccImport.OrderDate := PBDatestr(OrderDate);
    dmAccImport.Operator := dmAccImport.GetOperatorByInitials(RaisedBy);
    dmAccImport.CustomerContactName := ContactName;
    dmAccImport.OfficeContact := dmAccImport.GetOperatorByInitials(RaisedBy);

    dmAccImport.ProductType := 'Imported Product';
    dmAccImport.CustomerOrderRef := CustOrderNumber;
    dmAccImport.SupplierOrderRef := 'Imported Order';
    dmAccImport.RequiredDate := PBDateStr(DateRequired);
    dmAccImport.InvoiceDate := PBDateStr(CompletedDate);
    dmAccImport.Vatable := IncludesVAT;
    dmAccImport.VatCode := TaxCode;

    if trim(Subject) = '' then
      dmAccImport.Description := 'No description - Imported Order'
    else
      dmAccImport.Description := Subject;

    dmAccImport.DescriptiveReference := SONumber;
    dmAccImport.LineNumber := strtoint(ItemNumber);
    dmAccImport.Quantity := round(StrToFloatDef(QtyOrdered, 0, FormatSettings));
    dmAccImport.PriceUnit := dmAccImport.GetPriceUnitByDescription(PriceUnit);
    dmAccImport.CostPrice := StrToFloatDef(UnitCost, 0, FormatSettings);
    dmAccImport.SellPrice := StrToFloatDef(UnitPrice, 0, FormatSettings);

    if pos('Inv',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 30
    else
    if pos('Despatched',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 20
    else
    if pos('Acknowledged',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 20
    else
    if pos('New',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 10
    else
      dmAccImport.OrderStatus := 20;

    Result := dmAccImport.DoOneJobBag;

  finally
  end;
end;

function TPBFileImportFrm.DoOneJobBagLine(JobBag: integer; AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
var
  iPriceUnit: integer;
begin
  try
    dmAccImport.CustomerAccount := AccountCode;
    if PONumber <> '0' then
      dmAccImport.SupplierAccount := dmAccImport.GetSupplierAccountCode(PONumber);

    dmAccImport.PONumber := StrToFloatDef(PONumber, 0, FormatSettings);
    dmAccImport.OrderDate := PBDatestr(OrderDate);
    dmAccImport.Operator := dmAccImport.GetOperatorByInitials(RaisedBy);
    dmAccImport.CustomerContactName := ContactName;
    dmAccImport.OfficeContact := dmAccImport.GetOperatorByInitials(RaisedBy);

    dmAccImport.ProductType := 'Imported Product';
    dmAccImport.CustomerOrderRef := CustOrderNumber;
    dmAccImport.SupplierOrderRef := 'Imported Order';
    dmAccImport.RequiredDate := PBDateStr(DateRequired);
    dmAccImport.InvoiceDate := PBDateStr(CompletedDate);
    dmAccImport.Vatable := IncludesVAT;
    dmAccImport.VatCode := TaxCode;
    if StrToFloatDef(PONumber, 0, FormatSettings) <> 0 then
      dmAccImport.Description := Subject
    else
      dmAccImport.Description := trim(ProductCode) + ' - ' + trim(ProductDescription);
    dmAccImport.LineNumber := strtoint(ItemNumber);
    dmAccImport.Quantity := round(StrToFloatDef(QtyOrdered, 0, FormatSettings));
    iPriceUnit := dmAccImport.GetPriceUnitByDescription(PriceUnit);
    dmAccImport.PriceUnit := iPriceUnit;
    dmAccImport.CostPrice := StrToFloatDef(UnitCost, 0, FormatSettings);
    dmAccImport.SellPrice := StrToFloatDef(UnitPrice, 0, FormatSettings);

    if pos('Inv',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 30
    else
    if pos('Despatched',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 20
    else
    if pos('Acknowledged',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 20
    else
    if pos('New',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 10
    else
      dmAccImport.OrderStatus := 20;

    dmAccImport.DoOneJobBagLine(JobBag);

  finally
  end;
end;

function TPBFileImportFrm.DoOnePurchaseOrder(SONumber, AccountCode, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber,
                DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode,
                ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
begin
  try
    dmAccImport.CustomerAccount := AccountCode;
    dmAccImport.SupplierAccount := dmAccImport.GetSupplierAccountCode(PONumber);

    dmAccImport.PONumber := StrToFloatDef(PONumber, 0, FormatSettings);
    dmAccImport.OrderDate := PBDatestr(OrderDate);
    dmAccImport.Operator := dmAccImport.GetOperatorByInitials(RaisedBy);
    dmAccImport.CustomerContactName := ContactName;
    dmAccImport.OfficeContact := dmAccImport.GetOperatorByInitials(RaisedBy);

    dmAccImport.ProductType := 'Imported Product';
    dmAccImport.CustomerOrderRef := CustOrderNumber;
    dmAccImport.SupplierOrderRef := 'Imported Order';
    dmAccImport.RequiredDate := PBDateStr(DateRequired);
    dmAccImport.InvoiceDate := PBDateStr(CompletedDate);
    dmAccImport.Vatable := IncludesVAT;
    dmAccImport.VatCode := TaxCode;

    if trim(Subject) = '' then
      dmAccImport.Description := 'No description - Imported Order'
    else
      dmAccImport.Description := Subject;
    dmAccImport.Quantity := strtoint(QtyOrdered);
    dmAccImport.PriceUnit := dmAccImport.GetPriceUnitByDescription(PriceUnit);
    dmAccImport.CostPrice := StrToFloatDef(UnitCost, 0, FormatSettings);
    dmAccImport.SellPrice := StrToFloatDef(UnitPrice, 0, FormatSettings);

    if pos('Inv',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 30
    else
    if pos('Despatched',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 21
    else
    if pos('Acknowledged',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 20
    else
    if pos('New',OrderStatus) > 0 then
      dmAccImport.OrderStatus := 20
    else
      dmAccImport.OrderStatus := 22;

    if dmAccImport.OrderExists(StrToFloatDef(PONumber, 0, FormatSettings)) then
      begin
        dmAccImport.UpdateOrder;
        Result := false;
      end
    else
      result := dmAccImport.DoOneOrder;

  finally
  end;
end;

function TPBFileImportFrm.ParseCSVSInvoiceFile(DataLine: string; var InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode,
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
//  Parse DataLine into individual data items.
    TempStr := '';
    ParseString := DataLine;
    ColIndex := 0;

//copy data items from the line to an array
    While (Pos(',', ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(',', ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos-1));
      Delete(ParseString,1,TabPos);
    end;
    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    InvoiceNumber := LineData[1];

    InvoiceDate := LineData[2];

    SONumber := LineData[3];

    AccountCode := LineData[4];

    OrderStatus := LineData[5];

    Cancelled := LineData[6];

    DateCreated := LineData[7];

    PaidStatus := LineData[8];

    InvoiceOrCredit := LineData[9];

    Exported := LineData[10];

    TotalValue := LineData[12];

    Notes := LineData[13];

    ItemNumber := LineData[14];

    SONumber := LineData[15];

    SONumberItem := LineData[16];

    CustOrderNumber := LineData[17];

    QtyOrdered := LineData[18];

    UnitPrice := LineData[19];

    TaxCode := StringReplace(LineData[20],'T','',[rfReplaceAll]);

    NominalCode := LineData[21];

    PriceUnit := LineData[22];

    RaisedBy := LineData[23];

    DiscountValue := LineData[24];

    Operator := LineData[25];

    PrintifZero := LineData[26];

    Description := LineData[27];

    JobNumber := inttostr(dmAccImport.GetJobBagByReference(SONumber));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TPBFileImportFrm.DoOneInvoice(InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode, 
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): integer;
begin
  try
    dmAccImport.CustomerAccount := AccountCode;

    dmAccImport.SalesInvoiceNo := InvoiceNumber;
    dmAccImport.SalesInvoiceDate := PBDatestr(InvoiceDate);

    dmAccImport.SellPrice := StrToFloatDef(TotalValue, 0, FormatSettings);

    dmAccImport.Operator := dmAccImport.GetOperatorByInitials(RaisedBy);
    dmAccImport.OfficeContact := dmAccImport.GetOperatorByInitials(RaisedBy);

    dmAccImport.InvoiceOrCredit := InvoiceOrCredit;

    if pos('P',OrderStatus) > 0 then
      dmAccImport.PaidStatus := 'P'
    else
      dmAccImport.PaidStatus := '';

    dmAccImport.PaidDate := PBDatestr(PaidStatus);
    dmAccImport.PaidAmount := 0.00;

    dmAccImport.Reference := JobNumber;
    dmAccImport.Description := dmAccImport.GetJobBagDescription(SONumber);
    dmAccImport.CustomerOrderRef := CustOrderNumber;

    dmAccImport.OrderStatus := 30;

    Result := dmAccImport.DoOneSalesInvoice;

  finally
  end;
end;

function TPBFileImportFrm.DoOneInvoiceLine(Invoice: integer; InvoiceNumber, InvoiceDate, SONumber, AccountCode, TotalValue, CashSale, OrderDate, ContactName, RaisedBy, Subject, CustOrderNumber, DiscountValue, Description,
                Exported, DelAddressNumber, CompletedDate, DateRequired, OrderStatus, SpecialInstructions, OrderMethod, Operator, IncludesVAT, Notes, ItemNumber, ProductCode, Cancelled, NominalCode, 
                SONumberItem, InvoiceOrCredit, PaidStatus, DateCreated, ProductDescription, QtyOrdered, QtyDelivered, PriceUnit, UnitPrice, UnitCost, DiscountAmount, PrintIfZero, TaxCode, PONumber, JobNumber: string): boolean;
var
  iPriceUnit: integer;
begin
  try
    dmAccImport.Quantity := round(StrToFloatDef(QtyOrdered, 0, FormatSettings));
    dmAccImport.SellPrice := StrToFloatDef(UnitPrice, 0, FormatSettings);
    dmAccImport.VatCode := TaxCode;

    dmAccImport.ProductType := 'Imported Product';

    dmAccImport.OrderStatus := 30;

    iPriceUnit := dmAccImport.GetPriceUnitByDescription(PriceUnit);
    dmAccImport.PriceUnit := iPriceUnit;

    dmAccImport.NominalCode := NominalCode;

    dmAccImport.JBNumber := strtoint(JobNumber);
    dmAccImport.LineNumber := strtoint(SONumberItem);

    if strtoint(SONumberItem) > 1 then
      begin
        if not dmAccImport.JBLineExists(strtoint(JobNumber),strtoint(SONumberItem)) then
          begin
            dmAccImport.DoOneSalesInvoiceCharge(Invoice);
            Result := false;
          end
        else
          dmAccImport.DoOneSalesInvoiceLine(Invoice);
      end
    else
      dmAccImport.DoOneSalesInvoiceLine(Invoice);

    dmAccImport.UpdateSalesInvoice(Invoice);

  finally
  end;
end;

end.
