unit STImpSalesOrdersDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, CCSCommon, FileCtrl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlImpSO = class(TDataModule)
    qryAddSO: TFDQuery;
    qryCompany: TFDQuery;
    GetLastSQL: TFDQuery;
    UpdLastSQL: TFDQuery;
    qryAddSORep: TFDQuery;
    qryChkCostCentre: TFDQuery;
    qryAddCostCentre: TFDQuery;
    qryGetCustRep: TFDQuery;
    qryGetCustContact: TFDQuery;
    qryGetBranch: TFDQuery;
    qryAddSOLine: TFDQuery;
    qryGetPart: TFDQuery;
    qryAddCustContact: TFDQuery;
    qryLastCustContact: TFDQuery;
    qryCustomer: TFDQuery;
    qryAuditSession: TFDQuery;
    qryAddError: TFDQuery;
    qryDeleteSOL: TFDQuery;
    qryDeleteSO: TFDQuery;
    qryDeleteSORep: TFDQuery;
    qryGetConsumer: TFDQuery;
    qryGetDelBranch: TFDQuery;
    qryLastBranch: TFDQuery;
    qryAddBranch: TFDQuery;
    qryGetPartDisc: TFDQuery;
    qryGetSuppCharges: TFDQuery;
    qryAddSOCharge: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FOperator: integer;
    FSession: integer;
    FWarehouse: integer;
    FSessionStart: TDateTime;
    FSupplier: integer;
    FSupplierBranch: integer;
    { Private declarations }
    function AddDeliveryBranch(Customer: integer; BranchName, Add1,
      Add2, Add3, Add4, Postcode: string): Integer;
    procedure CheckCostCentre(Customer: integer; CostCentre: string);
    function GetCustomerContact(Customer, Branch: integer; ContactName: string): Integer;
    function GetConsumerDetails(ConsumerCode, UserID: string; var CustCode, BranchCode, ContactCode: integer;
              var Contact: string): boolean;
    function GetCustomerRep(Customer, Branch: integer): Integer;
    function GetDefaultStore: Integer;
    function GetCustomerBranch(Customer: integer; BranchName: string): Integer;
    function GetDeliveryBranch(Customer: integer; PostCode: string): Integer;
    function GetNextSONumber: Integer;
    function GetCustomerPrefix(Customer: integer): string;
    function GetPartCostPrice(Product: string; Customer: integer): double;
    function GetPartSellPrice(Product: string): double;
    function GetPartCostPackQty(Product: string): integer;
    function GetPartSellPackQty(Product: string): integer;
    function GetPartVatCode(Product: string): integer;
    function InsertSOHeader(CustCode, BranchCode: integer; OrderDate, DateRequired, OrderBranch, Contact, CostCentre,
                                    SpInstructions, DelBranch, OrderRef: string): integer;
    function InsertSOLine(SOLine, SONumber, OrderQty: integer; Product, UOM, Prefix: string): boolean;
    function InsertDirectSOLine(SOLine, SONumber, OrderQty: integer; Product: string; NetPrice: real; Customer: integer): boolean;
    function InsertDirectSOHeader(CustCode, BranchCode, CustContact: integer; OrderDate,
      DateRequired, SpInstructions, DelName, DelAdd1, DelAdd2, DelAdd3, DelAdd4, Postcode, OrderRef, Contact: string): integer;
    procedure InsertSupplierCharges(SONumber: integer);
    procedure FreeCompanyRecord;
    procedure LockCompanyRecord;
    function ParseKingFieldLine1(SRLine: string; var OrderDate, DateRequired, ConsumerCode, UserID: string): boolean;
    function ParseKingFieldLine2(SRLine: string; var OrderRef, ConsumerRef: string): boolean;
    function ParseKingFieldLine3(SRLine: string; var DelBranch: string): boolean;
    function ParseKingFieldLine4(SRLine: string; var Address1: string): boolean;
    function ParseKingFieldLine5(SRLine: string; var Address2: string): boolean;
    function ParseKingFieldLine6(SRLine: string; var Address3: string): boolean;
    function ParseKingFieldLine7(SRLine: string; var Address4: string): boolean;
    function ParseKingFieldLine8(SRLine: string; var Postcode: string): boolean;
    function ParseKingFieldLine9(SRLine: string; var Department, Carriage: string): boolean;
    function ParseKingFieldLine10(SRLine: string; var spInstructions: string): boolean;
    function ParseKingFieldAddComments(SRLine: string; var spInstructions: string): boolean;
    function ParseKingFieldLine(SRLine: string; var Product, CostCentre: string;
      var OrderQty, LineNumber: integer; var NetPrice: real): boolean;
    function ParseSRHeader(SRLine: string;
      var OrderDate, DateRequired, OrderBranch, Contact, CostCentre, spInstructions, DelBranch: string;
      var NoofLines: integer): boolean;
    function ParseSRLine(SRLine: string; var Product, UOM: string;
      var OrderQty: integer): boolean;
    procedure SetOperator(const Value: integer);
    function CountLines(tempFile: string): integer;
    function GetAuditSession: integer;
    function ParseError(tempcode: integer; tempOrder: string; tempLine: integer; tempPart: string): string;
    procedure SetSession(const Value: integer);
    procedure DeleteOrder(tempOrder: integer);
    procedure SetWarehouse(const Value: integer);
    procedure SetSessionStart(const Value: TDateTime);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierBranch(const Value: integer);
  public
    function ProcessKingFieldOrder(tempDir, tempFile: string): boolean;
    function ProcessOrder(tempDir, tempFile: string): boolean;
    property Operator: integer read FOperator write SetOperator;
    property Session: integer read FSession write SetSession;
    property SessionStart: TDateTime read FSessionStart write SetSessionStart;
    property Warehouse: integer read FWarehouse write SetWarehouse;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierBranch: integer read FSupplierBranch write SetSupplierBranch;
  end;

var
  dtmdlImpSO: TdtmdlImpSO;

const
  DelivNotes = 'Please label all boxes with the following contact name: ';
  PACTNotes = 'This is a PACT account, the PACT reference is CARTE2N7 ';

implementation

{$R *.DFM}

function TdtmdlImpSO.CountLines(tempFile: string): integer;
var
  icount: integer;
  tempTextFile: TextFile;
  tempLine: string;
begin
  AssignFile(tempTextFile, tempFile);
  Reset(tempTextFile);

  icount := 0;
  while Not EOF(tempTextFile) do
    begin
      ReadLn(tempTextFile, tempLine);
      icount := icount + 1;
    end;
  CloseFile(tempTextFile);
  Result := icount - 1;
end;

function TdtmdlImpSO.ProcessOrder(tempDir, tempFile: string): boolean;
var
  SRTextFile: TextFile;
  SRLine: string;
  CustCode, BranchCode, SalesOrder: integer;
  OrderRef, OrderDate, DateRequired, OrderBranch, Contact, CostCentre: string;
  Product, UOM, spInstructions, DelBranch, prefix, sDirectory: string;
  NoofLines, OrderQty, ErrorCode: integer;
  ilength, ipos1, ipos2, icount, LineCount, ErrorCount: integer;
  HeadResult, LineResult, LineInsert: boolean;
begin
  if not FileExists(tempDir+tempFile) then
    exit;
// find out the number of lines in the file
  LineCount := CountLines(tempDir+tempFile);

// Go ahead and process this file
  AssignFile(SRTextFile, tempDir+tempFile);
  Reset(SRTextFile);

  ErrorCount := 0;
// Get the Customer order number from the file header
  ilength := length(tempfile);

  ipos1 := 3;
  ipos2 := Pos('.', tempFile);
  OrderRef := copy(tempFile,ipos1,(ipos2-ipos1));

  CustCode := strtoint(copy(tempfile,(ipos2+1),(ilength-ipos2)));
  BranchCode := 0;

  Prefix := GetCustomerPrefix(CustCode);
//  Prefix := '';
  icount := 0;

// start processing
  ErrorCode := 0;
  ParseError(ErrorCode,OrderRef,0,'');

  while Not EOF(SRTextFile) do
    begin
//Read Line from Prod Text File
      ReadLn(SRTextFile, SRLine);
// Read order header
      if icount = 0 then
        begin
          HeadResult := ParseSRHeader(SRLine, OrderDate, DateRequired, OrderBranch, Contact, CostCentre,
                                    SpInstructions, DelBranch, NoofLines);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,OrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end;

          if LineCount <> NoofLines then
          begin
            ErrorCode := 11;
            ParseError(ErrorCode,OrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end;
          SalesOrder := InsertSOHeader(CustCode, BranchCode, OrderDate, DateRequired, OrderBranch, Contact, CostCentre,
                                    SpInstructions, DelBranch, OrderRef);
          if SalesOrder = 0 then
          begin
            ErrorCode := 12;
            ParseError(ErrorCode,OrderRef,0,'');
            DeleteOrder(SalesOrder);
            ErrorCount := ErrorCount + 1;
            break;
          end;
        end
      else
// order line details
        begin
          ErrorCode := 20;
          ParseError(ErrorCode,OrderRef,icount,'');

          LineResult := ParseSRLine(SRLine, Product, UOM, OrderQty);
          if LineResult = False then
          begin
            ErrorCode := 21;
            ParseError(ErrorCode,OrderRef,icount,Product);
            DeleteOrder(SalesOrder);
            ErrorCount := ErrorCount + 1;
            break;
          end;

          LineInsert := InsertSOLine(icount, SalesOrder, OrderQty, Product, UOM, Prefix);
          if LineInsert = False then
          begin
            ErrorCode := 22;
            ParseError(ErrorCode,OrderRef,icount,Product);
            DeleteOrder(SalesOrder);
            ErrorCount := ErrorCount + 1;
            break;
          end;
        end;
      inc(icount);
    end;
  CloseFile(SRTextFile);
  if errorcount > 0 then
    sDirectory := 'error'
  else
    sDirectory := 'archive';
// check that the failed directory exists

// check that directory exist
  if not SysUtils.DirectoryExists(tempDir+sDirectory) then
    begin
      try
        CreateDir(tempDir+sDirectory);
      except
        exit
      end;
    end;

// move the file to archive directory
  RenameFile(tempDir+tempFile,tempDir+sDirectory+'\'+tempFile);

// successfully created order
  if errorcount > 0 then
    begin
      Result := false;
      ErrorCode := 99;
      ParseError(ErrorCode,OrderRef,0,'');
    end
  else
    begin
      Result := true;
      ErrorCode := 100;
      ParseError(ErrorCode,OrderRef,0,'');
    end;
end;

function TdtmdlImpSO.ProcessKingFieldOrder(tempDir, tempFile: string): boolean;
var
  SRTextFile: TextFile;
  SRLine: string;
  CustCode, BranchCode, ContactCode, SalesOrder: integer;
  KFOrderRef, OrderRef, ConsumerRef, OrderDate, DateRequired, OrderBranch, Contact, UserID, CostCentre, ConsumerCode: string;
  Product, UOM, spInstructions, DelBranch, Prefix, sDirectory: string;
  Address1, Address2, Address3, Address4, Postcode, Department, Carriage: string;
  NoofLines, OrderQty, LineNumber, ErrorCode: integer;
  NetPrice: real;
  ilength, ipos1, ipos2, icount, iLineNo, LineCount, ErrorCount: integer;
  HeadResult, LineResult, LineInsert: boolean;
begin
  if not FileExists(tempDir+tempFile) then
    exit;
// find out the number of lines in the file
  LineCount := CountLines(tempDir+tempFile);

// Go ahead and process this file
  AssignFile(SRTextFile, tempDir+tempFile);
  Reset(SRTextFile);

  try
  ErrorCount := 0;
// Get the Customer order number from the file header
  ilength := length(tempfile);


  ipos1 := 1;
  ipos2 := Pos('.', tempFile);
  KFOrderRef := copy(tempFile,ipos1,(ipos2-ipos1));

// start processing
  ErrorCode := 0;
  ParseError(ErrorCode,KFOrderRef,0,'');

  icount := 0;
  iLineNo := 0;

  try
    while Not EOF(SRTextFile) do
    begin
      if icount = linecount then
        break;
//Read Line from Prod Text File
      ReadLn(SRTextFile, SRLine);
// Read order header line 1
      if icount = 0 then
        begin
          HeadResult := ParseKingFieldLine1(SRLine, OrderDate, DateRequired, ConsumerCode, UserID);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 2
      if icount = 1 then
        begin
          HeadResult := ParseKingFieldLine2(SRLine, OrderRef, ConsumerRef);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 3
      if icount = 2 then
        begin
          HeadResult := ParseKingFieldLine3(SRLine, DelBranch);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 4
      if icount = 3 then
        begin
          HeadResult := ParseKingFieldLine4(SRLine, Address1);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 5
      if icount = 4 then
        begin
          HeadResult := ParseKingFieldLine5(SRLine, Address2);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 6
      if icount = 5 then
        begin
          HeadResult := ParseKingFieldLine6(SRLine, Address3);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 7
      if icount = 6 then
        begin
          HeadResult := ParseKingFieldLine7(SRLine, Address4);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 8
      if icount = 7 then
        begin
          HeadResult := ParseKingFieldLine8(SRLine, PostCode);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 9
      if icount = 8 then
        begin
          HeadResult := ParseKingFieldLine9(SRLine, Department, Carriage);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end
        end
      else
// Read order header line 10
      if icount = 9 then
        begin
          HeadResult := ParseKingFieldLine10(SRLine, spInstructions);
          if HeadResult = False then
          begin
            ErrorCode := 10;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end;

          HeadResult := GetConsumerDetails(ConsumerCode, UserID, CustCode, BranchCode, ContactCode, Contact);
          if HeadResult = False then
          begin
            ErrorCode := 13;
            ParseError(ErrorCode,KFOrderRef,0,'');
            ErrorCount := ErrorCount + 1;
            break;
          end;
        end
      else
// order line details
        begin
          LineResult := ParseKingFieldLine(SRLine, Product, CostCentre, OrderQty, LineNumber, NetPrice);
// if product code is empty, then must be another comments line
          if Product = '' then
            begin
              HeadResult := ParseKingFieldAddComments(SRLine, spInstructions);
              if HeadResult = False then
                begin
                  ErrorCode := 10;
                  ParseError(ErrorCode,KFOrderRef,0,'');
                  ErrorCount := ErrorCount + 1;
                  break;
                end;
              continue;
            end
          else
          begin
            inc(iLineNo);

            if iLineNo = 1 then
            begin
              SalesOrder := InsertDirectSOHeader(CustCode, BranchCode, ContactCode, OrderDate, DateRequired,
                                              SpInstructions, DelBranch, Address1, Address2, Address3, Address4, Postcode, OrderRef, Contact);
              if SalesOrder = 0 then
              begin
                ErrorCode := 12;
                ParseError(ErrorCode,KFOrderRef,0,'');
                DeleteOrder(SalesOrder);
                ErrorCount := ErrorCount + 1;
                break;
              end;
            end;

            ErrorCode := 20;
            ParseError(ErrorCode,KFOrderRef,iLineNo,'');

            if LineResult = False then
              begin
                ErrorCode := 21;
                ParseError(ErrorCode,KFOrderRef,iLineNo,Product);
                DeleteOrder(SalesOrder);
                ErrorCount := ErrorCount + 1;
                break;
              end;
          end;
          LineInsert := InsertDirectSOLine(iLineNo, SalesOrder, OrderQty, Product, NetPrice, CustCode);
          if LineInsert = False then
          begin
            ErrorCode := 22;
            ParseError(ErrorCode,KFOrderRef,iLineNo,Product);
            DeleteOrder(SalesOrder);
            ErrorCount := ErrorCount + 1;
            break;
          end;
        end;
      inc(icount);
    end;
    //Add the supplier additional charges
    InsertSupplierCharges(SalesOrder);
  except
    errorcount := errorcount + 1;
  end;
  finally
    CloseFile(SRTextFile);
  end;
  if errorcount > 0 then
    sDirectory := 'error'
  else
    sDirectory := 'archive';
// check that the failed directory exists

// check that directory exist
  if not SysUtils.DirectoryExists(tempDir+sDirectory) then
    begin
      try
        CreateDir(tempDir+sDirectory);
      except
        exit
      end;
    end;

// move the file to archive or error directory
  if FileExists(tempDir+sDirectory+'\'+tempFile) then
    DeleteFile(tempDir+sDirectory+'\'+tempFile);

  RenameFile(tempDir+tempFile,tempDir+sDirectory+'\'+tempFile);

// successfully created order
  if errorcount > 0 then
    begin
      Result := false;
      ErrorCode := 99;
      ParseError(ErrorCode,KFOrderRef,0,'');
    end
  else
    begin
      Result := true;
      ErrorCode := 100;
      ParseError(ErrorCode,KFOrderRef,0,'');
    end;
end;

function TdtmdlImpSO.ParseSRHeader(SRLine: string;
                            var OrderDate, DateRequired, OrderBranch, Contact, CostCentre, spInstructions, DelBranch: string;
                            var NoofLines: integer): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

    While (Pos('","', ParseString) > 0) do
      begin
        ColIndex := ColIndex + 1;
        SetLength(LineData, ColIndex+1);
        TabPos := Pos('","', ParseString);
        LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos-1));
        Delete(ParseString,1,TabPos+2);
      end;

    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    OrderDate := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));
    DateRequired := trim(stringreplace(LineData[2],'"','',[rfReplaceAll]));
    OrderBranch := trim(stringreplace(LineData[5],'"','',[rfReplaceAll]));
    Contact := trim(stringreplace(LineData[6],'"','',[rfReplaceAll]));
    CostCentre := trim(stringreplace(LineData[7],'"','',[rfReplaceAll]));
    spInstructions := trim(stringreplace(LineData[8],'"','',[rfReplaceAll]));
    DelBranch := trim(stringreplace(LineData[9],'"','',[rfReplaceAll]));
    NoofLines := strtoint(trim(stringreplace(LineData[10],'"','',[rfReplaceAll])));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseSRLine(SRLine: string; var Product, UOM: string;
                                  var OrderQty: integer): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

    While (Pos('","', ParseString) > 0) do
      begin
        ColIndex := ColIndex + 1;
        SetLength(LineData, ColIndex+1);
        TabPos := Pos('","', ParseString);
        LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos-1));
        Delete(ParseString,1,TabPos+2);
      end;

    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    Product := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));
    UOM := trim(stringreplace(LineData[2],'"','',[rfReplaceAll]));
    OrderQty := strtoint(trim(stringreplace(LineData[3],'"','',[rfReplaceAll])));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine1(SRLine: string; var OrderDate, DateRequired, ConsumerCode, UserID: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    OrderDate := PBDateStr(date);
    DateRequired := trim(stringreplace(LineData[5],'"','',[rfReplaceAll]));
    ConsumerCode := trim(stringreplace(LineData[3],'"','',[rfReplaceAll]));
    UserID := trim(stringreplace(LineData[4],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine2(SRLine: string; var OrderRef, ConsumerRef: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    OrderRef := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));
    ConsumerRef := trim(stringreplace(LineData[2],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine3(SRLine: string; var DelBranch: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    DelBranch := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine4(SRLine: string; var Address1: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    Address1 := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine(SRLine: string; var Product, CostCentre: string;
                                  var OrderQty, LineNumber: integer; var NetPrice: real): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    if ColIndex < 5 then
      begin
        Product := '';
        NetPrice := 0.00;
        OrderQty := 0;
        CostCentre := '';
        LineNumber := 0;
      end
    else
      begin
        Product := trim(stringreplace(LineData[2],'"','',[rfReplaceAll]));
        NetPrice := StrToFloatDef(trim(stringreplace(LineData[3],'"','',[rfReplaceAll])), 0, FormatSettings);
        OrderQty := StrToIntDef(trim(stringreplace(LineData[4],'"','',[rfReplaceAll])), 0);
        CostCentre := trim(stringreplace(LineData[5],'"','',[rfReplaceAll]));
        LineNumber := StrToIntDef(trim(stringreplace(LineData[1],'"','',[rfReplaceAll])), 0);
      end;
    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.InsertSOHeader(CustCode, BranchCode: integer; OrderDate, DateRequired, OrderBranch, Contact, CostCentre,
                                    SpInstructions, DelBranch, OrderRef: string): integer;
var
  SONumber, CustContact, DeliveryBranch, Rep: integer;
  i: integer;
begin
  SONumber := GetNextSONumber;

  CustContact := GetCustomerContact(CustCode, BranchCode, Contact);

  if CostCentre <> '' then
    CheckCostCentre(CustCode, CostCentre);

  DeliveryBranch := GetCustomerBranch(CustCode,DelBranch);

  if self.Warehouse = 0 then
    self.Warehouse := GetDefaultStore;

  Rep := GetCustomerRep(CustCode, BranchCode);

// add the sales order header
  with qryAddSO do
    begin
      Close;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Office_Contact').AsInteger := self.Operator;
      ParamByName('Operator').AsInteger := self.Operator;
      ParamByName('Date_Reqd').AsDateTime := PBDateStr(DateRequired);
      ParamByName('Date_Ordrd').AsDateTime := PBDateStr(OrderDate);
      ParamByName('Cust_Order_No').AsString := OrderRef;
      ParamByName('Customer').AsInteger := CustCode;
      ParamByName('Branch_No').AsInteger := BranchCode;
      if CostCentre = '' then
        begin
          ParamByName('Cost_Centre').clear;
          ParamByName('Customer0').clear;
        end
      else
        begin
          ParamByName('Cost_Centre').Asstring := CostCentre;
          ParamByName('Customer0').AsInteger := CustCode;
        end;

      ParamByName('Order_Type').AsString := 'S';
      ParamByName('Sales_Order_Head_Status').AsInteger := 10;
      ParamByName('Contact_No').AsInteger := CustContact;
      ParamByName('Delivery_Notes').Asstring := spInstructions;
      ParamByName('Delivery_Customer').Asinteger := CustCode;
      ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
      Parambyname('Replenish_source').asinteger := 2;
      Parambyname('Part_Store').asinteger := self.Warehouse;
      Parambyname('Delivery_Contact_Name').asstring := '';
  end;

// add the sales order rep details
  with qryAddSORep do
    begin
      close;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Rep').AsInteger := Rep;
      ParamByName('Rep_Percentage').AsFloat := 0;
    end;

  try
    qryAddSO.execsql;
    qryAddSORep.execsql;
    Result := SONumber;
  except
    Result := 0
  end;
end;

function TdtmdlImpSO.InsertDirectSOHeader(CustCode, BranchCode, CustContact: integer; OrderDate,
      DateRequired, SpInstructions, DelName, DelAdd1, DelAdd2, DelAdd3, DelAdd4, Postcode, OrderRef, Contact: string): integer;
var
  SONumber, DeliveryBranch, Rep: integer;
  i: integer;
begin
  SONumber := GetNextSONumber;

  DeliveryBranch := GetDeliveryBranch(CustCode, PostCode);
  if DeliveryBranch = 0 then
    DeliveryBranch := AddDeliveryBranch(CustCode, DelName, DelAdd1, DelAdd2, DelAdd3, DelAdd4, Postcode);

  self.Warehouse := GetDefaultStore;

  Rep := GetCustomerRep(CustCode, BranchCode);
  if Rep = 0 then
    Rep := GetCustomerRep(CustCode,0);

// add the sales order header
  with qryAddSO do
    begin
      Close;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Office_Contact').AsInteger := self.Operator;
      ParamByName('Operator').AsInteger := self.Operator;
      ParamByName('Date_Reqd').AsDateTime := PBDateStr(DateRequired);
      ParamByName('Date_Ordrd').AsDateTime := PBDateStr(OrderDate);
      ParamByName('Cust_Order_No').AsString := OrderRef;
      ParamByName('Customer').AsInteger := CustCode;
      ParamByName('Branch_No').AsInteger := BranchCode;

      ParamByName('Cost_Centre').clear;
      ParamByName('Customer0').clear;

      ParamByName('Order_Type').AsString := 'S';
      ParamByName('Sales_Order_Head_Status').AsInteger := 10;
      ParamByName('Contact_No').AsInteger := CustContact;
      ParamByName('Delivery_Notes').Asstring := DelivNotes + ' ' + Contact + #13#10 + #13#10 + PACTNOTES;
      ParamByName('Delivery_Customer').Asinteger := CustCode;
      ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
      Parambyname('Replenish_source').asinteger := 1;
      Parambyname('Supplier').asinteger := Supplier;
      Parambyname('Branch_no0').asinteger := SupplierBranch;
      Parambyname('Supp_Order_type').asstring := 'PDC';
      Parambyname('Part_Store').asinteger := self.Warehouse;
      Parambyname('Delivery_Contact_Name').asstring := trim(spInstructions);
    end;

// add the sales order rep details
  with qryAddSORep do
    begin
      close;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Rep').AsInteger := Rep;
      ParamByName('Rep_Percentage').AsFloat := 0;
    end;

  try
    qryAddSO.execsql;
    qryAddSORep.execsql;
    Result := SONumber;
  except
    Result := 0
  end;
end;

function TdtmdlImpSO.InsertSOLine(SOLine, SONumber, OrderQty: integer; Product, UOM, Prefix: string): boolean;
var
  Part_Cost, Sell_Price: real;
  CostPack, SellPack, VatCode: integer;
  i: integer;
begin
  Product := Prefix + Product;
  Part_Cost := GetPartCostPrice(Product,0);
  Sell_Price := GetPartSellPrice(Product);

  CostPack := GetPartCostPackQty(Product);
  SellPack := GetPartSellPackQty(Product);

  VatCode := GetPartVatCode(Product);

  with qryAddSOLine do
    begin
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Line').AsInteger := SOLine;
      ParamByName('Part').AsString := Product;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Purch_Pack_Quantity').AsInteger := CostPack;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPack;
      ParamByName('Quantity_Ordered').AsInteger := OrderQty;
      ParamByName('Quantity_Allocated').AsInteger := 0;
      ParamByName('Quantity_Delivered').AsInteger := 0;
      ParamByName('Sales_Order_Line_Status').AsInteger := 10;
      ParamByName('Quantity_Invoiced').AsInteger := 0;
      ParamByName('Discount_Value').asFloat := 0.00;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParamByName('Original_Sell_Price').Asfloat := Sell_Price;
    end;
  try
    qryAddSOLine.ExecSQL;
    Result := true;
  except
    Result := false;
  end;
end;

function TdtmdlImpSO.InsertDirectSOLine(SOLine, SONumber, OrderQty: integer; Product: string; NetPrice: real; Customer: integer): boolean;
var
  Part_Cost, Sell_Price: real;
  CostPack, SellPack, VatCode: integer;
  i: integer;
begin
  Product := Product;
  Part_Cost := GetPartCostPrice(Product, Customer);
  Sell_Price := NetPrice;

  CostPack := GetPartCostPackQty(Product);
  SellPack := GetPartSellPackQty(Product);

  VatCode := GetPartVatCode(Product);

  with qryAddSOLine do
    begin
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Line').AsInteger := SOLine;
      ParamByName('Part').AsString := Product;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Purch_Pack_Quantity').AsInteger := CostPack;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPack;
      ParamByName('Quantity_Ordered').AsInteger := OrderQty*sellpack;
      ParamByName('Quantity_Allocated').AsInteger := 0;
      ParamByName('Quantity_Delivered').AsInteger := 0;
      ParamByName('Sales_Order_Line_Status').AsInteger := 10;
      ParamByName('Quantity_Invoiced').AsInteger := 0;
      ParamByName('Discount_Value').asFloat := 0.00;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParamByName('Original_Sell_Price').Asfloat := Sell_Price;
    end;
  try
    qryAddSOLine.ExecSQL;
    Result := true;
  except
    Result := false;
  end;
end;

function TdtmdlImpSO.GetNextSONumber: Integer;
begin
  LockCompanyRecord;
  try
    try
      with GetLastSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_SO_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastSQL do
      begin
        ParamByName('Last_SO_Number').AsInteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next SO number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

procedure TdtmdlImpSO.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := self.Operator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

procedure TdtmdlImpSO.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TdtmdlImpSO.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TdtmdlImpSO.CheckCostCentre(Customer: integer; CostCentre: string);
begin
  with qryChkCostCentre do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Cost_Centre').asstring := CostCentre;
      open;
      if recordcount > 0 then exit
    end;

  with qryAddCostCentre do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Cost_Centre').asstring := CostCentre;
      parambyname('Description').asstring := CostCentre;
      execsql;
    end;
end;

function TdtmdlImpSO.GetCustomerBranch(Customer: integer;
  BranchName: string): Integer;
begin
  with qryGetBranch do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Short_Code').asstring := BranchName;
      open;
      result := fieldbyname('Branch_no').asinteger;
    end;
end;

function TdtmdlImpSO.GetDeliveryBranch(Customer: integer;
  PostCode: string): Integer;
begin
  with qryGetDelBranch do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('PostCode').asstring := PostCode;
      open;
      result := fieldbyname('Branch_no').asinteger;
    end;
end;

function TdtmdlImpSO.GetCustomerContact(Customer, Branch: integer;
  ContactName: string): Integer;
var
  NewContact: integer;
begin
// find the contact if it exist
  with qryGetCustContact do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Branch_no').asinteger := Branch;
      parambyname('Name').asstring := ContactName;
      open;
      Result := fieldbyname('Contact_no').asinteger;
    end;
  if Result = 0 then
  begin
// get last contact number
    with qryLastCustContact do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Branch_no').asinteger := Branch;
        open;
        NewContact := fieldbyname('Last_Contact').asinteger+1;
      end;
// add new contact
    with qryAddCustContact do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Branch_no').asinteger := Branch;
        parambyname('Contact_no').asinteger := NewContact;
        parambyname('Name').asstring := ContactName;
        execsql;
      end;
    Result := NewContact;
  end;
end;

function TdtmdlImpSO.AddDeliveryBranch(Customer: integer; BranchName, Add1, Add2, Add3, Add4, Postcode: string): Integer;
var
  NewBranch: integer;
begin
// get last branch number
    with qryLastBranch do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        open;
        NewBranch := fieldbyname('Last_Branch').asinteger+1;
      end;
// add new contact
    with qryAddBranch do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Branch_no').asinteger := NewBranch;
        parambyname('Name').asstring := BranchName;
        parambyname('Building_no_Name').asstring := Add1;
        parambyname('Street').asstring := Add2;
        parambyname('Locale').asstring := Add3;
        parambyname('Town').asstring := Add4;
        parambyname('Postcode').asstring := Postcode;
        parambyname('Phone').asstring := '0';
        parambyname('Inv_to_Customer').asinteger := customer;
        parambyname('Inv_to_Branch').asinteger := 0;
        execsql;
      end;
    Result := NewBranch;
end;

function TdtmdlImpSO.GetDefaultStore: Integer;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Default_Warehouse from Company Where Company = 1');
    open;
    Result := fieldbyname('Default_Warehouse').asinteger;
  end;
end;

function TdtmdlImpSO.GetCustomerRep(Customer, Branch: integer): Integer;
begin
  with qryGetCustRep do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Branch_no').asinteger := Branch;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdtmdlImpSO.GetPartCostPackQty(Product: string): integer;
begin
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := Product;
      open;
      result := fieldbyname('Purch_Pack_Quantity').asinteger
    end;
end;

function TdtmdlImpSO.GetPartCostPrice(Product: string; Customer: integer): double;
begin
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := Product;
      open;
      result := fieldbyname('Part_Purchase_Price').asfloat;
    end;

  if Customer <> 0 then
    begin
// this must be a direct order, so see if there are any discounts for this supplier and this customer
      with qryGetPartDisc do
        begin
          close;
          parambyname('Part').asstring := Product;
          parambyname('effective_Date').asdatetime := date;
          parambyname('Supplier').asinteger := Supplier;
          parambyname('Customer').asinteger := customer;
          open;

          if recordcount > 0 then
            result := fieldbyname('Part_Purchase_Price').asfloat;
        end;
    end;

end;

function TdtmdlImpSO.GetPartSellPackQty(Product: string): integer;
begin
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := Product;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

function TdtmdlImpSO.GetPartSellPrice(Product: string): double;
begin
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := Product;
      open;
      result := fieldbyname('Part_Cost_List').asfloat;
    end;
end;

function TdtmdlImpSO.GetPartVatCode(Product: string): integer;
begin
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := Product;
      open;
      result := fieldbyname('Vat_Code').asinteger;
    end;

end;

function TdtmdlImpSO.GetCustomerPrefix(Customer: integer): string;
begin
  with qryCustomer do
    begin
      close;
      parambyname('Customer').asinteger := customer;
      open;
      result := fieldbyname('Product_Code_Prefix').asstring;
    end;
end;

function TdtmdlImpSO.ParseError(tempcode: integer; tempOrder: string; tempLine: integer; tempPart: string): string;
begin
  with qryAddError do
    begin
      close;
      parambyname('Audit_Number').asinteger := Session;
      parambyname('Operator').asinteger := self.Operator;
      parambyname('Date_Started').asdatetime := SessionStart;
      parambyname('Date_Time_Entered').asdatetime := now;
      parambyname('Transfer_Type').asinteger := 1;
      parambyname('Error_Code').asinteger := tempcode;
      parambyname('Audit_Code_1_Field').asstring := tempOrder;
      parambyname('Audit_Code_2_Field').asstring := inttostr(tempLine);
      parambyname('Audit_Code_3_Field').asstring := tempPart;
      parambyname('Audit_Code_4_Field').asstring := '';
      execsql;
    end;
end;

procedure TdtmdlImpSO.DeleteOrder(tempOrder: integer);
begin
  with qryDeleteSOL do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempOrder;
      execsql;
    end;

  with qryDeleteSORep do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempOrder;
      execsql;
    end;

  with qryDeleteSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempOrder;
      execsql;
    end;
end;

procedure TdtmdlImpSO.DataModuleCreate(Sender: TObject);
begin
  Session := GetAuditSession;
  SessionStart := now;
  Warehouse := 0;
end;

function TdtmdlImpSO.GetAuditSession: integer;
begin
  with qryAuditSession do
    begin
      close;
      open;
      try
        result := fieldbyname('Last_Session').asinteger + 1;
      except
        result := 1;
      end;
    end;
end;

procedure TdtmdlImpSO.SetSession(const Value: integer);
begin
  FSession := Value;
end;

procedure TdtmdlImpSO.SetWarehouse(const Value: integer);
begin
  FWarehouse := Value;
end;

procedure TdtmdlImpSO.SetSessionStart(const Value: TDateTime);
begin
  FSessionStart := Value;
end;

function TdtmdlImpSO.ParseKingFieldLine10(SRLine: string; var spInstructions: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    spInstructions := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldAddComments(SRLine: string; var spInstructions: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    spInstructions := spInstructions + #13#10 + trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine5(SRLine: string;
  var Address2: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    Address2 := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine6(SRLine: string;
  var Address3: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    Address3 := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine7(SRLine: string; var Address4: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    Address4 := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine8(SRLine: string; var Postcode: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    Postcode := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.ParseKingFieldLine9(SRLine: string; var Department,
  Carriage: string): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := SRLine;
    ColIndex := 0;

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

    Department := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));
    Carriage := trim(stringreplace(LineData[2],'"','',[rfReplaceAll]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TdtmdlImpSO.GetConsumerDetails(ConsumerCode, UserID: string; var CustCode, BranchCode, ContactCode: integer;
              var Contact: string): boolean;
begin
  with qryGetConsumer do
    begin
      close;
      parambyname('Consumer_Code').AsString := trim(ConsumerCode);
      parambyname('Consumer_ID').asstring := trim(UserID);
      open;

      CustCode := fieldbyname('Customer').AsInteger;
      BranchCode := fieldbyname('Branch_no').asinteger;
      ContactCode := fieldbyname('Contact_no').asinteger;
      Contact := fieldbyname('Contact_Name').asstring;
      result := (recordcount > 0);
    end;
end;

procedure TdtmdlImpSO.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TdtmdlImpSO.SetSupplierBranch(const Value: integer);
begin
  FSupplierBranch := Value;
end;

procedure TdtmdlImpSO.InsertSupplierCharges(SONumber: integer);
var
  icount: integer;
begin
  with qryGetSuppCharges do
    begin
      Close;
      parambyname('Supplier').asinteger := Supplier;
      Open;
      icount := 1;
      while eof <> true do
        begin
          qryAddSOCharge.close;
          qryAddSOCharge.parambyname('Sales_Order').asinteger := SONumber;
          qryAddSOCharge.parambyname('Additional_Charge').asinteger := icount;
          qryAddSOCharge.parambyname('Details').asstring := qryGetSuppCharges.fieldbyname('Details').asstring;
          qryAddSOCharge.parambyname('Amount').asfloat := qryGetSuppCharges.fieldbyname('Quotation_Price').asfloat;
          qryAddSOCharge.parambyname('Nominal').asstring := '';
          qryAddSOCharge.parambyname('Vat_Code').asinteger := qryGetSuppCharges.fieldbyname('Vat_Code').asinteger;
          qryAddSOCharge.parambyname('Cost').asfloat := qryGetSuppCharges.fieldbyname('Amount').asfloat;
          qryAddSOCharge.execsql;
          icount := icount + 1;
          next;
        end;
    end;
end;

end.
