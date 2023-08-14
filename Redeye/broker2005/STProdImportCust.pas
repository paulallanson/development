unit STProdImportCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTProdImportCustFrm = class(TForm)
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
    btnSelectCustomer: TButton;
    LblCustName: TLabel;
    pnlImport: TPanel;
    lblStep4: TLabel;
    ImportBtn: TButton;
    pnlCancel: TPanel;
    Cancel2BitBtn: TBitBtn;
    lblReadingFile: TLabel;
    pnlPrefix: TPanel;
    lblStep2: TLabel;
    Label3: TLabel;
    edtPrefix: TEdit;
    chkbxImportStock: TCheckBox;
    Label2: TLabel;
    dblkpPartStore: TDBLookupComboBox;
    qryPartStore: TFDQuery;
    dtsPartStore: TDataSource;
    qryCompany: TFDQuery;
    Label4: TLabel;
    edtBin: TEdit;
    btnBin: TBitBtn;
    qryUpCustomer: TFDQuery;
    qryGetCustomer: TFDQuery;
    procedure btnFindFileClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectCustomerClick(Sender: TObject);
    procedure edtPrefixChange(Sender: TObject);
    procedure edtImportFileNameChange(Sender: TObject);
    procedure chkbxImportStockClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBinClick(Sender: TObject);
    procedure dblkpPartStoreClick(Sender: TObject);
  private
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
  STProdImportCustFrm: TSTProdImportCustFrm;

implementation

uses STPartSuppDM, STStockDM, STMntPrtBin, PBLUCust, pbDatabase;

var
  STPartSDM: TSTPartSDM;
  iCustCode, iSuppCode : integer;
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

procedure TSTProdImportCustFrm.btnFindFileClick(Sender: TObject);
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

procedure TSTProdImportCustFrm.ImportBtnClick(Sender: TObject);
var
  ProdTextFile : TextFile;
  ErrorRecordFile : TextFile;
  DiscountFile : TextFile;
  ProdLine, Part, Part_Description, UOM, Bin: String;
  Prod_Status, Discount_this_Part : String;
  Vat_Code, Purch_Pack_Quantity, Cat_Discount_Flag, Min_Stock, Stock_Bal, UOM_Code, Prod_Group: integer;
  Part_Cost_List, Part_Purchase_Price : real;
  bPart_Exists : boolean;
  Result : boolean;
  LineCount, LineNo, ErrorCount : integer;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
  inx: integer;
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
  newColourCodes := false;
  sPrefix := trim(edtPrefix.text);
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

      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

//Split input line into seperate data items
      if Pos('Stock', edtImportFileName.Text) > 0 then
        Result := ParseEndsleighStockFile(ProdLine, Part, Part_Description,
                        Prod_Status, Discount_this_Part, UOM, Vat_Code, Purch_Pack_Quantity,
                        Cat_Discount_Flag, Min_Stock, Stock_Bal, Part_Cost_List, Part_Purchase_Price)
      else
        Result := False;

      if Result = False then
      begin
        ParseError(LineNo, ProdLine, ErrorRecordFile);
        ErrorCount := ErrorCount + 1;
        continue;
      end;

// Is part on file?
      with STPartSDM.qryDoesPartExist do
      begin
        Params[0].AsString := sPrefix+Part;
        open;
        bPart_Exists := (recordcount > 0);
        close;
      end;

//check for UOM, if doesn't exist then add
      UOM_Code := STPartSDM.FindUOM(UOM);
      if (UOM_Code = 0) then
        UOM_Code := STPartSDM.NewUOM(UOM);

//update or insert part depending on whether it is already in database
      if bPart_Exists then
    //the part exists in the database already
      begin
        Result := STPartSDM.UpdatePart(sPrefix+Part, Part_Description, Prod_Status,
                            Discount_this_Part, iSuppCode, Vat_Code, Purch_Pack_Quantity, Prod_Group, Part_Cost_List, Part_Purchase_Price);

        if Result = False then
        begin
          UpdateError(LineNo, ProdLine, ErrorRecordFile);
          ErrorCount := ErrorCount + 1;
          continue;
        end;

        if ImportStock then
          begin
            Result := STPartSDM.UpdateCustPart(sPrefix+Part, Part_Description, Prod_Status,
                            Discount_this_Part, Part, Bin, '', 'N', date, iCustCode, Vat_Code, Purch_Pack_Quantity,
                            UOM_Code, Min_Stock, iWarehouse, Stock_Bal, 0, Part_Cost_List, Part_Purchase_Price,
                            ImportStock);
            if Result = False then
            begin
              UpdateError(LineNo, ProdLine, ErrorRecordFile);
              ErrorCount := ErrorCount + 1;
              continue;
            end
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
        Result := STPartSDM.InsertCustPart(sPrefix+Part, Part_Description, Prod_Status,
                              Discount_this_Part, Part, '0', Bin, '', 'N', date, iCustCode, Vat_Code, Purch_pack_Quantity,
                              UOM_Code, Min_Stock, iWarehouse, Stock_Bal, 0, 0, 1, Part_Cost_List, Part_Purchase_Price,
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

    qryUpCustomer.close;
    qryUpCustomer.parambyname('Customer').asinteger := iCustCode;
    qryUpCustomer.parambyname('Product_Code_Prefix').asstring := trim(edtPrefix.text);
    qryUpCustomer.execsql;
  end
end;

procedure TSTProdImportCustFrm.FormCreate(Sender: TObject);
begin
  STPartSDM := TSTPartSDM.Create(Self);
  STStockDataMod := TSTStockDataMod.create(self);
end;

procedure TSTProdImportCustFrm.UpdateError(LineNo: integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':UpdateError:'+ProdLine);
  WriteLn(theErrorFile, ProdLine);
end;

procedure TSTProdImportCustFrm.InsertError(LineNo: Integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':InsertError:'+ProdLine);
  WriteLn(theErrorFile, ProdLine);
end;

function TSTProdImportCustFrm.CountTextFileLines(
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

procedure TSTProdImportCustFrm.ParseError(LineNo: Integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, ProdLine);
end;

procedure TSTProdImportCustFrm.btnSelectCustomerClick(Sender: TObject);
var
  PBLUCustFrm : TPBLUCustFrm;
begin
  lblCustName.Caption := '';
  iCustCode := 0;
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := False ;
    PBLUCustFrm.bSel_Branch := True ;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
       begin
       iCustCode := PBLUCustFrm.SelCode ;
       iCustBranch := PBLUCustFrm.SelBranch ;
       LblCustName.Caption := PBLUCustFrm.SelName + ', ' + PBLUCustFrm.SelBranchName ;
       with qryGetCustomer do
        begin
          close;
          parambyname('Customer').asinteger := iCustCode;
          open;
          edtPrefix.text := fieldbyname('Product_Code_Prefix').asstring;
        end;
       end;
  finally
    PBLUCustFrm.Free;
  end;

  if iCustCode <> 0 then
  begin
    lblStep1.Font.Style :=[];
    lblStep2.Font.Style :=[fsBold];
    edtPrefix.Enabled := True;
    edtPrefix.setFocus;
  end
  else
  begin
    lblStep1.Font.Style :=[fsBold];
    lblStep2.Font.Style :=[];
    edtPrefix.Enabled := False;
  end;
end;

function TSTProdImportCustFrm.ParseEndsleighStockFile(ProdLine: string;
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
    Vat_Code := dmBroker.GetCustomerVATCode(iCustCode);

    Prod_Status := 'N';

    try
      Part_Pack_Quantity := round(StrToFloatDef(LineData[7], 0, FormatSettings));
    except
      Part_Pack_Quantity := 1;
    end;

    Part_Cost_List := StrToFloatDef('0'+LineData[3], 0, FormatSettings);
    Part_Purchase_Price := StrToFloatDef('0'+LineData[8], 0, FormatSettings);
    Discount_this_Part := 'N';

    Cat_Discount_Flag := 0;

    UOM := LineData[4];

    Min_Stock := round(StrToFloatDef(LineData[5], 0, FormatSettings));
    Stock_Bal := round(StrToFloatDef(LineData[6], 0, FormatSettings));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportCustFrm.ParseDiscountLine(ProdLine: string;
  var Part: string; var Part_Purchase_Price: Double): Boolean;
var CommaPos: integer;
begin
  Commapos := Pos(',', ProdLine);
  Part := Copy(ProdLine, 0, CommaPos-1);
  Delete(ProdLine, 1, CommaPos);

  CommaPos := Pos(',', ProdLine);
  Part_Purchase_Price := StrToFloatDef(Copy(ProdLine, 0, CommaPos-1), 0, FormatSettings);
  Result := True;
end;

function TSTProdImportCustFrm.NoOfKFieldProdGroups: integer;
begin
  result := STPartSDM.NoOfKFieldProdGroups;
end;

procedure TSTProdImportCustFrm.edtPrefixChange(Sender: TObject);
begin
  if edtPrefix.text <> '' then
    begin
      lblStep2.Font.Style :=[];
      lblStep3.Font.Style :=[fsBold];
      btnFindFile.enabled := true;
      pnlImportFile.Enabled := true;
    end
  else
    begin
      lblStep2.Font.Style :=[fsBold];
      lblStep3.Font.Style :=[];
      btnFindFile.enabled := false;
      pnlImportFile.Enabled := false;
    end;
end;

procedure TSTProdImportCustFrm.edtImportFileNameChange(Sender: TObject);
begin
  ImportBtn.Enabled := (edtImportFileName.text <> '');
end;

procedure TSTProdImportCustFrm.chkbxImportStockClick(Sender: TObject);
begin
  dblkpPartStore.Enabled := chkbxImportStock.Checked;
  btnBin.Enabled := chkbxImportStock.Checked;
end;

procedure TSTProdImportCustFrm.FormActivate(Sender: TObject);
begin
  qryCompany.close;
  qryCompany.open;

  qryPartStore.Close;
  qryPartStore.open;

  dblkpPartStore.keyvalue := qryCompany.fieldbyname('Default_Warehouse').asinteger;
end;

procedure TSTProdImportCustFrm.FormDestroy(Sender: TObject);
begin
  STStockDataMod.free;
  STPartSDM.free;
end;

procedure TSTProdImportCustFrm.btnBinClick(Sender: TObject);
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

procedure TSTProdImportCustFrm.dblkpPartStoreClick(Sender: TObject);
begin
  edtBin.Clear;
end;

end.
