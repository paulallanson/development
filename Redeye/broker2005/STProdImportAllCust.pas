unit STProdImportAllCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables,
  DBCtrls;

type
  TSTProdImportAllCustFrm = class(TForm)
    opndlgImportFile: TOpenDialog;
    mmErrorRecords: TMemo;
    pnlImportFile: TPanel;
    lblStep3: TLabel;
    edtImportFileName: TEdit;
    btnFindFile: TButton;
    pnlProgress: TPanel;
    Label1: TLabel;
    lblProgress: TLabel;
    lblRecordCount: TLabel;
    prgrsbrImport: TProgressBar;
    pnlCustomer: TPanel;
    lblStep1: TLabel;
    LblCustName: TLabel;
    pnlImport: TPanel;
    lblStep4: TLabel;
    ImportBtn: TButton;
    pnlCancel: TPanel;
    Cancel2BitBtn: TBitBtn;
    lblReadingFile: TLabel;
    pnlPrefix: TPanel;
    lblStep2: TLabel;
    Label2: TLabel;
    dblkpPartStore: TDBLookupComboBox;
    qryPartStore: TQuery;
    dtsPartStore: TDataSource;
    qryCompany: TQuery;
    Label4: TLabel;
    edtBin: TEdit;
    btnBin: TBitBtn;
    qryGetCustomer: TQuery;
    chkbxImportStock: TCheckBox;
    procedure btnFindFileClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtImportFileNameChange(Sender: TObject);
    procedure chkbxImportStockClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBinClick(Sender: TObject);
    procedure dblkpPartStoreClick(Sender: TObject);
    procedure edtBinChange(Sender: TObject);
  private
    function ParseBroadsystemsStockFile(ProdLine: string;
                        var Part, Part_Description, Prod_Status, Discount_this_Part, UOM, Cust_Code, Bin_Ref: string;
                        var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, Age: integer;
                        var Part_Cost_List, Part_Purchase_Price: real): boolean;
    function ParseMalagoStockFile(ProdLine: string;
                        var Part, Part_Description, Prod_Status, Discount_this_Part, UOM, Cust_Code, Bin_Ref: string;
                        var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, Age : integer;
                        var Part_Cost_List, Part_Purchase_Price : real): boolean;
    function ParseStockFile(ProdLine: string; var Part,
                    Part_Description, Prod_Status, Discount_this_Part, UOM, Cust_Code, Supplier_Code, Purchase_Order,
                    Bin_Ref, Paid_Stock: string; var Delivery_Date: TDateTime; var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag,
                    Min_Stock, Stock_Bal, Age, Reorder_Level, Price_Unit: integer; var Part_Cost_List, Part_Purchase_Price: real): boolean;
    function ParseEndsleighStockFile(ProdLine : string;
                        var Part, Part_Description, Prod_Status, Discount_this_Part, UOM: string;
                        var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal : integer;
                        var Part_Cost_List, Part_Purchase_Price : real):boolean;
    procedure UpdateError(LineNo: integer; ProdLine: String; var theErrorFile: TextFile);
    procedure InsertError(LineNo: Integer; ProdLine: String; var theErrorFile: TextFile);
    function CountTextFileLines(var theTextFile: TextFile): integer;
    procedure ParseError(LineNo: Integer; ProdLine: String;
                         var theErrorFile: TextFile);
    function ParseDiscountLine(ProdLine: string; var Part: string;
      var Part_Purchase_Price: Double): Boolean;
    function NoOfKFieldProdGroups: integer;
  public
    { Public declarations }
  end;

var
  STProdImportAllCustFrm: TSTProdImportAllCustFrm;

implementation

uses STPartSuppDM, STStockDM, STMntPrtBin, PBLUCust, CCSCommon;

var
  STPartSDM: TSTPartSDM;
  iCustCode : integer;
  iCustBranch : integer;
  iWarehouse: integer;
  ImportStock: boolean;
  sPrefix: string;
  ProdGroups: array of integer;
type
  TImportFieldDef = record
    FieldNo : integer;
    ColumnNo : integer;
    ColumnLength : integer;
  end;
{$R *.DFM}

procedure TSTProdImportAllCustFrm.btnFindFileClick(Sender: TObject);
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

  if (iCustCode <> 0) and (edtImportFileName.Text <> '') then
  begin
    //enable the import button
    pnlImport.Enabled := True;
    lblStep4.Font.Style := [fsBold];
    lblStep2.Font.Style := [];
  end;
end;

procedure TSTProdImportAllCustFrm.ImportBtnClick(Sender: TObject);
var
  ProdTextFile : TextFile;
  ErrorRecordFile : TextFile;
//  DiscountFile : TextFile;
  ProdLine, Part, Part_Description, UOM, Bin, Cust_Code, Bin_Ref, New_Part, Supplier_Code, Purchase_Order, FormRef : String;
  Prod_Status, Discount_this_Part, Paid_Stock: String;
  Vat_Code, Purch_Pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, UOM_Code, Age, Reorder_Level, Price_Unit : integer;
  Part_Cost_List, Part_Purchase_Price : real;
  Delivery_Date: TDateTime;
  bPart_Exists: boolean;
  Result : boolean;
  iLengthPrefix: integer;
  LineCount, LineNo, ErrorCount : integer;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
//  inx: integer;
  newColourCodes: boolean;
begin
  if chkbxImportStock.checked and (edtBin.text = '') then
    begin
      MessageDlg('When importing stock, a warehouse and bin must be specified.', mterror,
        [mbAbort], 0);
      exit;
    end;
// Initialize counters and variables
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;
  sPrefix := 'PREFIX';
  iWarehouse := dblkpPartStore.keyvalue;
  ImportStock := chkbxImportStock.checked;
  Bin := edtBin.text;

  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.csv')
     or (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.csv') then
  begin
//prepare files for input/output
    AssignFile(ProdTextFile, edtImportFileName.Text);
    Reset(ProdTextFile);

    AssignFile(ErrorRecordFile, 'ErrorFile.txt');
    ReWrite(ErrorRecordFile);
    LineCount := CountTextFileLines(ProdTextFile);
    Reset(ProdTextFile);

//set count label values/visibility
    pnlProgress.height := 57;
    mmErrorRecords.height := 153;
    lblRecordCount.Caption := 'records read.';
    lblRecordCount.Visible := True;
    lblProgress.Visible := True;
    prgrsbrImport.Max := LineCount;
    mmErrorRecords.Lines.Clear;

    While Not EOF(ProdTextFile) do
    begin
//Read Line from Prod Text File
      ReadLn(ProdTextFile, ProdLine);
      LineNo := LineNo + 1;
      if LineNo = 1 then continue;

      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

//Split input line into seperate data items
      if Pos('Stock', edtImportFileName.Text) > 0 then
(*        Result := ParseMalagoStockFile(ProdLine, Part, Part_Description,
                        Prod_Status, Discount_this_Part, UOM, Cust_Code, Bin_Ref, Vat_Code, Purch_Pack_Quantity,
                        Cat_Discount_Flag, Min_Stock, Stock_Bal, Age, Part_Cost_List, Part_Purchase_Price)

        Result := ParseBroadsystemsStockFile(ProdLine, Part, Part_Description,
                        Prod_Status, Discount_this_Part, UOM, Cust_Code, Bin_Ref, Vat_Code, Purch_Pack_Quantity,
                        Cat_Discount_Flag, Min_Stock, Stock_Bal, Age, Part_Cost_List, Part_Purchase_Price)
*)
        Result := ParseStockFile(ProdLine, Part, Part_Description,
                        Prod_Status, Discount_this_Part, UOM, Cust_Code, Supplier_Code, Purchase_order, Bin_Ref, Paid_Stock, Delivery_Date, 
                        Vat_Code, Purch_Pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, Age, Reorder_Level, Price_Unit,
                        Part_Cost_List, Part_Purchase_Price)
      else
        Result := False;

      if Result = False then
      begin
        ParseError(LineNo, ProdLine, ErrorRecordFile);
        ErrorCount := ErrorCount + 1;
        continue;
      end;

//      if stock_bal = 0 then continue;

// Find the Client associated with this product
      if trim(Cust_Code) <> '' then
        begin
          with STPartSDM.qryGetCustWithAccCode do
            begin
              close;
              parambyname('Account_Code').asstring := copy(Cust_Code,1,(length(Cust_Code)));
              open;

              iCustCode := fieldbyname('Customer').asinteger;
(*          if trim(fieldbyname('Product_Code_Prefix').asstring) = '' then
            sPrefix := Cust_Code + '/'
          else
            sPrefix := fieldbyname('Product_Code_Prefix').asstring;
*)
              sPrefix := Cust_Code;

              if iCustCode = 0 then
                begin
                  UpdateError(LineNo, ProdLine, ErrorRecordFile);
                  ErrorCount := ErrorCount + 1;
                  continue;
                end;
            end;
        end
      else
        iCustCode := 0;

//      New_Part := copy(Part,7,20);      ---- Malago stock
//      New_Part := copy(Part,8,20);      ---- Broadsystems

      New_Part := trim(Part);

      iLengthPrefix := length(Cust_Code);
      if iLengthPrefix > 0 then
        FormRef := copy(Part,(iLengthPrefix+2),(length(Part)-(iLengthPrefix+1)))
      else
        FormRef := trim(Part);


//// Is part on file?
      with STPartSDM.qryDoesPartExist do
      begin
        parambyname('Part').asstring := New_Part;
        open;
        bPart_Exists := (RecordCount > 0);
        close;
      end;

//check for UOM, if doesn't exist then add
      if UOM <> '' then
        begin
          UOM_Code := STPartSDM.FindUOM(UOM);
          if (UOM_Code = 0) then
            UOM_Code := STPartSDM.NewUOM(UOM);
        end;

//update or insert part depending on whether it is already in database
      if bPart_Exists then
    //the part exists in the database already
      begin
        Result := STPartSDM.UpdateCustPart(New_Part, Part_Description, Prod_Status,
                            Discount_this_Part, FormRef, Bin, Bin_Ref, Paid_Stock, Delivery_Date, iCustCode, Vat_Code, Purch_Pack_Quantity,
                            UOM_Code, Min_Stock, iWarehouse, Stock_Bal, Age, Part_Cost_List, Part_Purchase_Price,
                            ImportStock);
        if Result = False then
        begin
          UpdateError(LineNo, ProdLine, ErrorRecordFile);
          ErrorCount := ErrorCount + 1;
          continue;
        end
        else
        begin
          UpdateRecordCount := UpdateRecordCount + 1;
        end;
      end
      else
      //the part is not in the database may need adding
      begin
        //try to insert to part and increment counters
        Result := STPartSDM.InsertCustPart(New_Part, Part_Description, Prod_Status,
                              Discount_this_Part, FormRef, Purchase_Order, Bin, Bin_Ref, Paid_Stock, Delivery_Date, iCustCode, Vat_Code, Purch_pack_Quantity,
                              UOM_Code, Min_Stock, iWarehouse, Stock_Bal, Age, Reorder_Level, Price_Unit, Part_Cost_List, Part_Purchase_Price,
                              ImportStock);

        if Result = False then
          begin
            InsertError(LineNo, ProdLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end
        else
          begin
            InsertRecordCount := InsertRecordCount + 1;
          end;
      end; //end of update/insert decision block
    end; //end while not EOF

//display error/insert/update counters
    mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
    if ErrorCount > 0 then
      mmErrorRecords.Lines.Add('The bad records have been written to C:\My Documents\ErrorFile.txt');
    mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
    mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
    mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

    //close Text Files
    CloseFile(ProdTextFile);
    CloseFile(ErrorRecordFile);

  end
end;

procedure TSTProdImportAllCustFrm.FormCreate(Sender: TObject);
begin
  STPartSDM := TSTPartSDM.Create(Self);
  STStockDataMod := TSTStockDataMod.create(self);
end;

procedure TSTProdImportAllCustFrm.UpdateError(LineNo: integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':UpdateError:'+ProdLine);
  WriteLn(theErrorFile, ProdLine);
end;

procedure TSTProdImportAllCustFrm.InsertError(LineNo: Integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':InsertError:'+ProdLine);
  WriteLn(theErrorFile, ProdLine);
end;

function TSTProdImportAllCustFrm.CountTextFileLines(
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

procedure TSTProdImportAllCustFrm.ParseError(LineNo: Integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, ProdLine);
end;

function TSTProdImportAllCustFrm.ParseEndsleighStockFile(ProdLine: string;
      var Part, Part_Description, Prod_Status, Discount_this_Part, UOM: string;
      var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal : integer;
      var Part_Cost_List, Part_Purchase_Price : real): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
// Parse ProdLine into individual data items.
    TempStr := '';
    ParseString := ProdLine;
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

    Part := LineData[1];
    Part_Description := LineData[2];
    Vat_Code := 0;

    Prod_Status := 'Y';

    try
      Part_Pack_Quantity := round(strtofloat(LineData[7]));
    except
      Part_Pack_Quantity := 1;
    end;

    Part_Cost_List := StrToFloat('0'+LineData[3]);
    Part_Purchase_Price := 0.00;
    Discount_this_Part := 'N';

    Cat_Discount_Flag := 0;

    UOM := LineData[4];

    Min_Stock := round(strtofloat(LineData[5]));
    Stock_Bal := round(strtofloat(LineData[6]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportAllCustFrm.ParseMalagoStockFile(ProdLine: string;
      var Part, Part_Description, Prod_Status, Discount_this_Part, UOM, Cust_Code, Bin_Ref: string;
      var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, Age : integer;
      var Part_Cost_List, Part_Purchase_Price : real): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
// Parse ProdLine into individual data items.
    TempStr := '';
    ParseString := ProdLine;
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

    Part := LineData[1];
    Part_Description := LineData[3];
    Vat_Code := 1;

    Cust_Code := LineData[2];

    Bin_Ref := LineData[7];

    Age := strtoint(LineData[8])+1;

    Prod_Status := 'Y';

    try
      Part_Pack_Quantity := 1;
    except
      Part_Pack_Quantity := 1;
    end;

    Part_Cost_List := 0.00;
    Part_Purchase_Price := 0.00;
    Discount_this_Part := 'N';

    Cat_Discount_Flag := 0;

    UOM := 'PACK';

    Min_Stock := 1000;
    Stock_Bal := round(strtofloat(LineData[6]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportAllCustFrm.ParseBroadsystemsStockFile(ProdLine: string;
      var Part, Part_Description, Prod_Status, Discount_this_Part, UOM, Cust_Code, Bin_Ref: string;
      var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, Age : integer;
      var Part_Cost_List, Part_Purchase_Price : real): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
// Parse ProdLine into individual data items.
    TempStr := '';
    ParseString := ProdLine;
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

    Part := LineData[1];
    Part_Description := LineData[2];
    Vat_Code := 1;

    Cust_Code := 'BROADS';

    Bin_Ref := 'Bench Stock Import';

    Age := 0;

    Prod_Status := 'Y';

    try
      Part_Pack_Quantity := 1;
    except
      Part_Pack_Quantity := 1;
    end;

    Part_Cost_List := 0.00;
    Part_Purchase_Price := 0.00;
    Discount_this_Part := 'N';

    Cat_Discount_Flag := 0;

    UOM := 'PACK';

    Min_Stock := 0;
    Stock_Bal := round(strtofloat(LineData[3]));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportAllCustFrm.ParseDiscountLine(ProdLine: string;
  var Part: string; var Part_Purchase_Price: Double): Boolean;
var CommaPos: integer;
begin
  Commapos := Pos(',', ProdLine);
  Part := Copy(ProdLine, 0, CommaPos-1);
  Delete(ProdLine, 1, CommaPos);

  CommaPos := Pos(',', ProdLine);
  Part_Purchase_Price := StrToFloat(Copy(ProdLine, 0, CommaPos-1));
  Result := True;
end;

function TSTProdImportAllCustFrm.NoOfKFieldProdGroups: integer;
begin
  result := STPartSDM.NoOfKFieldProdGroups;
end;

procedure TSTProdImportAllCustFrm.edtImportFileNameChange(Sender: TObject);
begin
  ImportBtn.Enabled := (edtImportFileName.text <> '');
end;

procedure TSTProdImportAllCustFrm.chkbxImportStockClick(Sender: TObject);
begin
  dblkpPartStore.Enabled := chkbxImportStock.Checked;
  btnBin.Enabled := chkbxImportStock.Checked;
end;

procedure TSTProdImportAllCustFrm.FormActivate(Sender: TObject);
begin
  qryCompany.close;
  qryCompany.open;

  qryPartStore.Close;
  qryPartStore.open;

  dblkpPartStore.keyvalue := qryCompany.fieldbyname('Default_Warehouse').asinteger;
end;

procedure TSTProdImportAllCustFrm.FormDestroy(Sender: TObject);
begin
  STStockDataMod.free;
  STPartSDM.free;
end;

procedure TSTProdImportAllCustFrm.btnBinClick(Sender: TObject);
begin
  STMntPrtBinFrm := TSTMntPrtBinFrm.Create(Self) ;
  try
    STMntPrtBinFrm.iStore := dblkpPartStore.keyvalue;
    STMntPrtBinFrm.sStoreName := dblkpPartStore.text;
    STMntPrtBinFrm.ShowModal ;
    edtBin.text := STMntPrtBinFrm.sSelBin ;
  finally
    STMntPrtBinFrm.Free ;
  end;
end;

procedure TSTProdImportAllCustFrm.dblkpPartStoreClick(Sender: TObject);
begin
  edtBin.Clear;
end;

procedure TSTProdImportAllCustFrm.edtBinChange(Sender: TObject);
begin
  pnlImportFile.enabled := (edtBin.Text <> '');
end;

function TSTProdImportAllCustFrm.ParseStockFile(ProdLine: string; var Part,
  Part_Description, Prod_Status, Discount_this_Part, UOM, Cust_Code, Supplier_Code, Purchase_Order,
  Bin_Ref, Paid_Stock: string; var Delivery_Date: TDateTime; var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag,
  Min_Stock, Stock_Bal, Age, Reorder_Level, Price_Unit: integer; var Part_Cost_List, Part_Purchase_Price: real): boolean;
var
  TabPos, iPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
// Parse ProdLine into individual data items.
    TempStr := '';
    ParseString := ProdLine;
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

    Part := LineData[1];
    Part_Description := LineData[2];

    iPos := pos('-',Part);
    if iPos = 0 then
      Cust_Code := ''
    else
      Cust_Code := Trim(Copy(Part,1,iPos-1));

    Age := 0;

    Prod_Status := 'Y';

    Discount_this_Part := 'N';

    Cat_Discount_Flag := 0;

    UOM := 'PACK';

    if trim(LineData[3]) = '' then
      Min_Stock := 0
    else
      Min_Stock := strtoint(LineData[3]);

    if trim(LineData[5]) = '' then
      Reorder_Level := 0
    else
      Reorder_Level := strtoint(LineData[5]);

    if trim(LineData[6]) = '' then
      Stock_Bal := 0
    else
      Stock_Bal := strtoint(LineData[6]);

    Bin_Ref := LineData[7];

    Delivery_Date := PBDateStr(trim(LineData[8]));

    if trim(LineData[9]) = '' then
      Part_Pack_Quantity := 1
    else
      begin
        try
          Part_Pack_Quantity := strtoint(LineData[9]);
        except
          Part_Pack_Quantity := 1;
        end;
      end;

    if trim(LineData[10]) = '' then
      Part_Purchase_Price := 0.00
    else
      Part_Purchase_Price := strtofloat(LineData[10]);

    if trim(LineData[11]) = '' then
      Part_Cost_List := 0
    else
      Part_Cost_List := strtofloat(LineData[11]);

    if trim(LineData[12]) = '' then
      Price_Unit := 1
    else
      begin
        try
          Price_Unit := strtoint(LineData[12]);
        except
          Price_Unit := 1;
        end;
      end;

    Vat_Code := strtoint(StringReplace(LineData[13],'T','',[rfReplaceAll]));

    Paid_Stock := copy(trim(LineData[14]),1,1);

    Supplier_Code := Trim(LineData[15]);

    Purchase_order := Trim(LineData[16]);

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;

end;

end.
