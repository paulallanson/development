unit PBOrderImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TPBOrderImportFrm = class(TForm)
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
    function ParseCSVOrderFile(DataLine: string; var OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, InvoiceNo, InvoiceDate, SuppInvoiceNo, SuppInvoiceDate: string): boolean;
    procedure ParseError(LineNo: Integer; DataLine: String;
      var theErrorFile: TextFile);
    procedure DoOneOrder(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice, SellPrice,
                         Vatable, RequiredDate, InvoiceDate: string);
    procedure DoOneSalesInvoice(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice, SellPrice,
                         Vatable, RequiredDate, InvoiceNo, InvoiceDate : string);
    procedure DoOneSupplierInvoice(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice, SellPrice,
                         Vatable, RequiredDate, SuppInvoiceNo, SuppInvoiceDate : string);
    procedure ImportCSVFile;
    procedure SetFileType(const Value: string);
    { Private declarations }
  public
    property FileType: string read FFileType write SetFileType;
  end;

var
  PBOrderImportFrm: TPBOrderImportFrm;

implementation

uses PBAccImportDM, CCSCommon;

{$R *.dfm}

procedure TPBOrderImportFrm.FormActivate(Sender: TObject);
begin
  cmbImportType.ItemIndex := 0;
  cmbImportTypeClick(self);
end;

procedure TPBOrderImportFrm.btnFindFileClick(Sender: TObject);
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

procedure TPBOrderImportFrm.cmbImportTypeClick(Sender: TObject);
begin
  if cmbImportType.ItemIndex > 0 then
    begin
      pnlImportFile.Enabled := True;
      lblStep3.Font.Style := [fsBold];
      lblStep1.Font.Style := [];
    end;
end;

procedure TPBOrderImportFrm.ImportBtnClick(Sender: TObject);
begin
  ImportCSVFile;
end;

procedure TPBOrderImportFrm.ImportCSVFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice, SellPrice: string;
  Vatable, RequiredDate, InvoiceNo, InvoiceDate, SuppInvoiceNo, SuppInvoiceDate: string;
  result: boolean;
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

          result := ParseCSVOrderFile(DataLine, OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, InvoiceNo, InvoiceDate, SuppInvoiceNo, SuppInvoiceDate);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if (trim(CustAccount) = '') or (trim(SuppAccount) = '') then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if cmbImportType.text = 'Buy Print Orders' then
            DoOneOrder(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, InvoiceDate)
          else
          if cmbImportType.text = 'Sales Invoices' then
            DoOneSalesInvoice(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, InvoiceNo, InvoiceDate)
          else
            DoOneSupplierInvoice(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, SuppInvoiceNo, SuppInvoiceDate);

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

function TPBOrderImportFrm.CountTextFileLines(
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

function TPBOrderImportFrm.ParseCSVOrderFile(DataLine: string; var OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, InvoiceNo, InvoiceDate, SuppInvoiceNo, SuppInvoiceDate: string): boolean;
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

    OrderNo := trim(copy(LineData[1], 4,8));

    OrderDate := LineData[2];

    CustAccount := LineData[3];

    SuppAccount := LineData[4];

    CustDescr := LineData[5];

    ProductType := LineData[6];

    CustOrderRef := LineData[7];

    SuppOrderRef := LineData[8];

    Quantity := LineData[9];

    CostPrice := LineData[10];

    SellPrice := LineData[11];

    Vatable := LineData[13];

    RequiredDate := LineData[16];

    InvoiceNo := LineData[17];

    InvoiceDate := LineData[18];

    SuppInvoiceDate := LineData[20];

    SuppInvoiceNo := LineData[21];

    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

procedure TPBOrderImportFrm.ParseError(LineNo: Integer; DataLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, DataLine);
end;

procedure TPBOrderImportFrm.DoOneOrder(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice,
                                      SellPrice, Vatable, RequiredDate, InvoiceDate: string);
begin
  try
    dmAccImport.PONumber := strtofloat(OrderNo);
    try
      if OrderDate = '' then
        dmAccImport.OrderDate := date
      else
        dmAccImport.OrderDate := PBDateStr(OrderDate);
    except
      dmAccImport.OrderDate := date;
    end;
    dmAccImport.CustomerAccount := CustAccount;
    dmAccImport.SupplierAccount := SuppAccount;
    dmAccImport.Description := CustDescr;
    dmAccImport.ProductType := ProductType;
    dmAccImport.CustomerOrderRef := CustOrderRef;
    dmAccImport.SupplierOrderRef := SuppOrderRef;
    try
      dmAccImport.Quantity := strtoint(Quantity);
    except
      dmAccImport.Quantity := 1;
    end;
    try
      dmAccImport.CostPrice := strtofloat(CostPrice);
    except
      dmAccImport.CostPrice := 0.00;
    end;

    try
      dmAccImport.SellPrice := strtofloat(SellPrice)
    except
      dmAccImport.SellPrice := 0.00;
    end;

    dmAccImport.Vatable := Vatable;
    try
      dmAccImport.RequiredDate := PBDateStr(RequiredDate);
    except
      dmAccImport.RequiredDate := 0;
    end;

    try
      dmAccImport.InvoiceDate := PBDateStr(InvoiceDate);
    except
      dmAccImport.InvoiceDate := 0;
    end;

    dmAccImport.DoOneOrder;
  finally
  end;

end;

procedure TPBOrderImportFrm.DoOneSupplierInvoice(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice, SellPrice,
                         Vatable, RequiredDate, SuppInvoiceNo, SuppInvoiceDate : string);
begin
  if (trim(SuppInvoiceNo) = '') or (trim(SuppInvoiceNo) = '*') then exit;

  try
    dmAccImport.PONumber := strtofloat(OrderNo);
    try
      if OrderDate = '' then
        dmAccImport.OrderDate := date
      else
        dmAccImport.OrderDate := PBDateStr(OrderDate);
    except
      dmAccImport.OrderDate := date;
    end;
    dmAccImport.CustomerAccount := CustAccount;
    dmAccImport.SupplierAccount := SuppAccount;
    dmAccImport.Description := CustDescr;
    dmAccImport.ProductType := ProductType;
    dmAccImport.CustomerOrderRef := CustOrderRef;
    dmAccImport.SupplierOrderRef := SuppOrderRef;
    try
      dmAccImport.Quantity := strtoint(Quantity);
    except
      dmAccImport.Quantity := 1;
    end;
    try
      dmAccImport.CostPrice := strtofloat(CostPrice);
    except
      dmAccImport.CostPrice := 0.00;
    end;

    try
      dmAccImport.SellPrice := strtofloat(SellPrice)
    except
      dmAccImport.SellPrice := 0.00;
    end;

    dmAccImport.Vatable := Vatable;
    try
      dmAccImport.RequiredDate := PBDateStr(RequiredDate);
    except
      dmAccImport.RequiredDate := 0;
    end;

    try
      dmAccImport.SupplierInvoiceDate := PBDateStr(SuppInvoiceDate);
    except
      dmAccImport.SupplierInvoiceDate := date;
    end;

    dmAccImport.SupplierInvoiceNo := SuppInvoiceNo;
    dmAccImport.DoOneSupplierInvoice;
  finally
  end;

end;

procedure TPBOrderImportFrm.DoOneSalesInvoice(OrderNo, OrderDate, CustAccount, SuppAccount, CustDescr, ProductType, CustOrderRef, SuppOrderRef, Quantity, CostPrice, SellPrice,
                         Vatable, RequiredDate, InvoiceNo, InvoiceDate: string);
var
  iInvoiceNo: integer;
begin
  if (trim(InvoiceNo) = '') or (trim(InvoiceNo) = '*') then exit;

  try
    iInvoiceNo := strtoint(InvoiceNo);
  except
    exit
  end;

  try
    dmAccImport.PONumber := strtofloat(OrderNo);
    try
      if OrderDate = '' then
        dmAccImport.OrderDate := date
      else
        dmAccImport.OrderDate := PBDateStr(OrderDate);
    except
      dmAccImport.OrderDate := date;
    end;
    dmAccImport.CustomerAccount := CustAccount;
    dmAccImport.SupplierAccount := SuppAccount;
    dmAccImport.Description := CustDescr;
    dmAccImport.ProductType := ProductType;
    dmAccImport.CustomerOrderRef := CustOrderRef;
    dmAccImport.SupplierOrderRef := SuppOrderRef;
    try
      dmAccImport.Quantity := strtoint(Quantity);
    except
      dmAccImport.Quantity := 1;
    end;
    try
      dmAccImport.CostPrice := strtofloat(CostPrice);
    except
      dmAccImport.CostPrice := 0.00;
    end;

    try
      dmAccImport.SellPrice := strtofloat(SellPrice)
    except
      dmAccImport.SellPrice := 0.00;
    end;

    dmAccImport.Vatable := Vatable;
    try
      dmAccImport.RequiredDate := PBDateStr(RequiredDate);
    except
      dmAccImport.RequiredDate := 0;
    end;

    try
      dmAccImport.SalesInvoiceDate := PBDateStr(InvoiceDate);
    except
      dmAccImport.SalesInvoiceDate := date;
    end;

    dmAccImport.SalesInvoiceNo := InvoiceNo;
    dmAccImport.DoOneSalesInvoice;
  finally
  end;

end;

procedure TPBOrderImportFrm.SetFileType(const Value: string);
begin
  FFileType := Value;
  if FFileType = 'QB' then
    self.caption := 'Import Quickbooks data'
  else
    self.caption := 'Import CSV file type data';
end;

end.
