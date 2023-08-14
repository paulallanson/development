unit STProdImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids;

type
  TSTProdImportFrm = class(TForm)
    opndlgImportFile: TOpenDialog;
    mmErrorRecords: TMemo;
    pnlImportFile: TPanel;
    lblStep2: TLabel;
    edtImportFileName: TEdit;
    btnFindFile: TButton;
    pnlProgress: TPanel;
    Label1: TLabel;
    lblProgress: TLabel;
    lblRecordCount: TLabel;
    prgrsbrImport: TProgressBar;
    pnlSupplier: TPanel;
    lblStep1: TLabel;
    btnSelectSupplier: TButton;
    LblSuppName: TLabel;
    pnlImport: TPanel;
    lblStep4: TLabel;
    ImportBtn: TButton;
    pnlCancel: TPanel;
    Cancel2BitBtn: TBitBtn;
    lblReadingFile: TLabel;
    chkbxDeleteStocked: TCheckBox;
    procedure btnFindFileClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectSupplierClick(Sender: TObject);
  private
    function ParseKingFieldOpdataFile(ProdLine : string;
                        var Part, Part_Description, Prod_Status, Discount_this_Part: string;
                        var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag : integer;
                        var Part_Cost_List, Part_Purchase_Price : Double):boolean;
    function ParseKingFieldKinnectFile(ProdLine : string;
                        var Part, Part_Description, Prod_Status, Discount_this_Part: string;
                        var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag : integer;
                        var Part_Cost_List, Part_Purchase_Price : Double):boolean;
    function ParseSchonwaldFile(ProdLine: string;
                        var Part, Part_Description, Product_Group, Prod_Status, Discount_this_Part: string;
                        var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag: integer;
                        var Part_Cost_List, Part_Purchase_Price: Double): boolean;
    procedure UpdateError(LineNo: integer; ProdLine: String; var theErrorFile: TextFile);
    procedure InsertError(LineNo: Integer; ProdLine: String; var theErrorFile: TextFile);
    function CountTextFileLines(var theTextFile: TextFile): integer;
    procedure ParseError(LineNo: Integer; ProdLine: String;
                         var theErrorFile: TextFile);
    function ParseDiscountLine(ProdLine: string; var Part: string;
      var Part_Purchase_Price: Double): Boolean;
    function NoOfKFieldProdGroups: integer;
    procedure SetUpGroupArray;
    function ParseContractHeader(ProdLine: string; var ContractCode: string;
      var DateFrom, DateTo: TDateTime): Boolean;
    function ParseContractLine(ProdLine: string;
        var Part, Discount_Type: string; var Part_Purchase_Price, Discount_Value: Double; var Pack_Size: integer): Boolean;
  public
    { Public declarations }
  end;

var
  STProdImportFrm: TSTProdImportFrm;

implementation

uses STPartSuppDM, PBLUSupp, CCSCommon, pbDatabase;

var
  STPartSDM: TSTPartSDM;
  iSupplCode : integer;
  iSupplBranch : integer;
  ProdGroups: array of integer;
type
  TImportFieldDef = record
    FieldNo : integer;
    ColumnNo : integer;
    ColumnLength : integer;
  end;
{$R *.DFM}

procedure TSTProdImportFrm.btnFindFileClick(Sender: TObject);
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

  if (iSupplCode <> 0) and (edtImportFileName.Text <> '') then
  begin
    //enable the import button
    pnlImport.Enabled := True;
    lblStep4.Font.Style := [fsBold];
    lblStep2.Font.Style := [];
  end;
end;

procedure TSTProdImportFrm.ImportBtnClick(Sender: TObject);
var
  tmpDir: string;
  ProdTextFile : TextFile;
  ErrorRecordFile : TextFile;
  DiscountFile : TextFile;
  ContractFile : TextFile;
  ContractCode: string;
  DateFrom, DateTo: TDateTime;
  ProdLine, Part, Part_Description : String;
  Prod_Status, Discount_this_Part, ProductGroupName, Product_Group, Discount_type : String;
  Vat_Code, Purch_Pack_Quantity, Cat_Discount_Flag, iProdGroup, Pack_Size, Sell_Pack_Size: integer;
  Part_Cost_List, Part_Purchase_Price, Discount_Value : Double;
  bStocked, bPart_Exists, bPG_Exists : boolean;
  Result : boolean;
  LineCount, LineNo, ErrorCount, iRecCount : integer;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
  inx, iLength, iStart: integer;
  newColourCodes: boolean;
  bDeleteDiscounts: boolean;
begin
// Initialize counters and variables
  self.SetUpGroupArray;
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;
  newColourCodes := false;

//Check to see if user is trying to import contract file

// Do the Contract files
  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.css')
    or (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.CSS') then
  begin
    if (messagedlg('All existing product discounts for this supplier and associated customer contracts will be deleted. Continue?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      exit;


  //Customer Contract File
    AssignFile(ContractFile, edtImportFileName.Text);
    Reset(ContractFile);
    AssignFile(ErrorRecordFile, tmpDir+'ErrorFile.txt');
    ReWrite(ErrorRecordFile);
    lblReadingFile.Caption := 'Reading Contract File';
    LineCount := CountTextFileLines(ContractFile)-1;
    Reset(ContractFile);
    lblRecordCount.Caption := 'records read.';

    LineNo := 0;

    ReadLn(ContractFile, ProdLine);  //first line holds contract code
    ParseContractHeader(ProdLine, ContractCode, DateFrom, DateTo);

// check for customers with this contract code
    STPartSDM.qryGetContract.close;
    STPartSDM.qryGetContract.parambyname('Contract_Code').asstring := trim(ContractCode);
    STPartSDM.qryGetContract.open;

    prgrsbrImport.Max := (LineCount*STPartSDM.qryGetContract.recordcount);

    while STPartSDM.qryGetContract.eof <> true do
      begin
        stPartSDM.qryDelCustDisc.close;
        stPartSDM.qryDelCustDisc.parambyname('Supplier').asinteger := iSupplCode;
        stPartSDM.qryDelCustDisc.parambyname('Customer').asinteger := STPartSDM.qryGetContract.fieldbyname('Customer').asinteger;
        stPartSDM.qryDelCustDisc.execsql;

        if chkbxDeleteStocked.checked then
          begin
            stPartSDM.qryDelCustStockDisc.close;
            stPartSDM.qryDelCustStockDisc.parambyname('Customer').asinteger := STPartSDM.qryGetContract.fieldbyname('Customer').asinteger;
            stPartSDM.qryDelCustStockDisc.execsql;
          end;

        Reset(ContractFile);
        ReadLn(ContractFile, ProdLine);  //re-read the first line

        while not EOF(ContractFile) do
          begin
            ReadLn(ContractFile, ProdLine);
            LineNo := LineNo + 1;
            ParseContractLine(ProdLine, Part, Discount_Type, Part_Purchase_Price, Discount_Value, Pack_Size);
            lblProgress.Caption := IntToStr(LineNo);
            prgrsbrImport.Position := LineNo;
            pnlProgress.Repaint;

// Is part on file?
            with STPartSDM.qryDoesPartExist do
            begin
              Params[0].AsString := Part;
              open;
              bPart_Exists := (recordcount > 0);
              Sell_Pack_Size := fieldbyname('Sell_Pack_Quantity').asinteger;
              bStocked := (fieldbyname('Product_Class').asstring = 'STK');
              close;
            end;

            if bPart_exists then
            //update part record
              begin
                try
                STPartSDM.qryAddCustDisc.close;
                if bStocked then
                  STPartSDM.qryAddCustDisc.parambyname('Supplier').asinteger := 0
                else
                  STPartSDM.qryAddCustDisc.parambyname('Supplier').asinteger := iSupplCode;
                STPartSDM.qryAddCustDisc.parambyname('Customer').asinteger := STPartSDM.qryGetContract.fieldbyname('Customer').asinteger;
                STPartSDM.qryAddCustDisc.parambyname('Part').asstring := Part;
                STPartSDM.qryAddCustDisc.parambyname('Discount_Value').asfloat := Discount_Value*Sell_Pack_Size;
                STPartSDM.qryAddCustDisc.parambyname('Part_Purchase_Price').asfloat := Part_Purchase_Price;
                STPartSDM.qryAddCustDisc.parambyname('Date_Effective').asdatetime := DateFrom;
                STPartSDM.qryAddCustDisc.parambyname('Date_Ineffective').asdatetime := DateTo;
                STPartSDM.qryAddCustDisc.parambyname('Discount_Type').asstring := Discount_Type;
                STPartSDM.qryAddCustDisc.execsql;
                except
                InsertError(LineNo, ProdLine, ErrorRecordFile);
                ErrorCount := ErrorCount + 1;
                end;
              end
            else
              begin
                InsertError(LineNo, ProdLine, ErrorRecordFile);
                ErrorCount := ErrorCount + 1;
              end;
          end;
        STPartSDM.qryGetContract.next;
      end;

    CloseFile(ContractFile);
    mmErrorRecords.Lines.Add('Contract File Processed.');
    exit;
  end
  else
  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.csv')
     or (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.CSV') then
  begin
//prepare files for input/output
    tmpDir := edtImportFileName.Text;
    iLength := length(tmpDir);

    while pos('\',tmpDir) > 0 do
      begin
        istart := pos('\',tmpDir);
        tmpDir[iStart] := '*';
      end;
    tmpDir :=  copy(edtImportFileName.Text,1,(iLength-(ilength-iStart)));

    AssignFile(ProdTextFile, edtImportFileName.Text);
    Reset(ProdTextFile);
    AssignFile(ErrorRecordFile, tmpDir+'ErrorFile.txt');
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

    ProductGroupName := '';

    While Not EOF(ProdTextFile) do
    begin
//Read Line from Prod Text File
      ReadLn(ProdTextFile, ProdLine);
      LineNo := LineNo + 1;

      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

//Split input line into seperate data items
      Result := ParseSchonwaldFile(ProdLine, Part, Part_Description, Product_Group,
                        Prod_Status, Discount_this_Part, Vat_Code, Purch_Pack_Quantity,
                        Cat_Discount_Flag, Part_Cost_List, Part_Purchase_Price);

//This is a Product group record if no description exists. Save it for later on
      if Part = '' then
        continue
      else if Part = '9999999' then
        break;

      if Part_Description = '' then
        begin
          iRecCount := 0;
          ProductGroupName := Part;
          continue;
        end;

      if Result = False then
      begin
        ParseError(LineNo, ProdLine, ErrorRecordFile);
        ErrorCount := ErrorCount + 1;
        continue;
      end;

      iRecCount := iRecCount + 1;

// Is part on file?
      with STPartSDM.qryDoesPartExist do
      begin
        Params[0].AsString := Part;
        open;
        bPart_Exists := (recordcount > 0);
        close;
      end;

//Does the product group exist
      if iRecCount = 1 then
        begin
          bPG_Exists := false;
          with StPartSDM.qryGetPartGroup do
            begin
              close;
              parambyname('Part_Group_Descr_Short').asstring := Product_Group;
              open;
              bPG_Exists := (recordcount > 0);
            end;

          if not bPG_exists then
            begin
            //this adds product groups
            StPartSDM.ADDPartGroup(cat_Discount_Flag, Product_Group, ProductGroupName);
            end;
          iProdGroup := cat_Discount_Flag;
        end;

      {if this is a different part group to the main section one then see if it exists and if it doesn't then add it with no description}
      if iProdGroup <> cat_Discount_Flag then
        begin
          bPG_Exists := false;
          with StPartSDM.qryGetPartGroup do
            begin
              close;
              parambyname('Part_Group_Descr_Short').asstring := Product_Group;
              open;
              bPG_Exists := (recordcount > 0);
            end;

          if not bPG_exists then
            begin
            //this adds product groups
            StPartSDM.ADDPartGroup(cat_Discount_Flag, Product_Group, Product_Group);
            end;
        end;

//update or insert part depending on wether it is already in database
      if bPart_Exists then
    //the part exists in the database already
      begin
        Result := STPartSDM.UpdatePart(Part, Part_Description, Prod_Status, Discount_this_Part,
                            iSupplCode, Vat_Code, Purch_Pack_Quantity, Cat_Discount_Flag,
                            Part_Cost_List, Part_Purchase_Price);
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
        if ((Prod_Status = 'D') or (Prod_Status = 'M')) then
        begin
          //don't bother inserting discontinued Prods into database
          DiscontRecordCount := DiscontRecordCount + 1;
        end
        else
        begin
          //try to insert to part and increment counters
          Result := STPartSDM.InsertPart(Part, Part_Description, Prod_Status, Discount_this_Part,
                              iSupplCode, Vat_Code, Purch_pack_Quantity, Cat_Discount_Flag,
                              Part_Cost_List, Part_Purchase_Price);

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
        end;
      end; //end of update/insert decision block
    end; //end while not EOF

//display error/insert/update counters
    mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
    if ErrorCount > 0 then
      mmErrorRecords.Lines.Add('The bad records have been written to '+tmpDir+'ErrorFile.txt');
    mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
    mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
    mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

    //close Text Files
    CloseFile(ProdTextFile);
    CloseFile(ErrorRecordFile);
  end
  else
  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) <> '.tmf')
     and (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) <> '.TMF') then
  begin
//prepare files for input/output
    tmpDir := edtImportFileName.Text;
    iLength := length(tmpDir);

    while pos('\',tmpDir) > 0 do
      begin
        istart := pos('\',tmpDir);
        tmpDir[iStart] := '*';
      end;
    tmpDir :=  copy(edtImportFileName.Text,1,(iLength-(ilength-iStart)));

    AssignFile(ProdTextFile, edtImportFileName.Text);
    Reset(ProdTextFile);
    AssignFile(ErrorRecordFile, tmpDir+'ErrorFile.txt');
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
//the data contained in the text file differs between opdata and kinnect files
      if Pos('opdata', edtImportFileName.Text) > 0 then
        Result := ParseKingFieldOpdataFile(ProdLine, Part, Part_Description,
                        Prod_Status, Discount_this_Part, Vat_Code, Purch_Pack_Quantity,
                        Cat_Discount_Flag, Part_Cost_List, Part_Purchase_Price)
      else
        if Pos('kinnect', edtImportFileName.Text) > 0 then
        Result := ParseKingFieldKinnectFile(ProdLine, Part, Part_Description,
                        Prod_Status, Discount_this_Part, Vat_Code, Purch_Pack_Quantity,
                        Cat_Discount_Flag, Part_Cost_List, Part_Purchase_Price);

      if Result = False then
      begin
        ParseError(LineNo, ProdLine, ErrorRecordFile);
        ErrorCount := ErrorCount + 1;
        continue;
      end;

// Is part on file?
      with STPartSDM.qryDoesPartExist do
      begin
        Params[0].AsString := Part;
        open;
        bPart_Exists := (recordcount > 0);
        close;
      end;

//Does the product group exist
      if ProdGroups[Cat_Discount_Flag] = -1 then
      begin
        //prod groupd hasn't been looked up yet so do it
        ProdGroups[Cat_Discount_Flag] := STPartSDM.FindPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag));
      end;

      if Cat_Discount_Flag > High(ProdGroups) then
      begin
        //this adds product groups that Kingfield have introduced without telling us
        //they are set up with generic codes and at the end of this routine the user
        //should be warned to contact Kingfield to find out what the colour codes are.
        inx := High(ProdGroups) + 1;
        setLength(ProdGroups, (Cat_Discount_Flag + 1));
        for inx := inx to Cat_Discount_Flag do
        begin
          ProdGroups[inx] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(inx), 'Kingfield Cat Code'+ IntToStr(inx));
        end;
        newColourCodes := true;
      end;

      if ProdGroups[Cat_Discount_Flag] = -1 then
      begin
        //this adds the product groups we know about if they are not already on file
        case Cat_Discount_Flag of
          1: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Blue Codes nett disc');
          2: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Blue Codes non nett disc');
          3: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Green Codes');
          4: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Pink Codes');
          5: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Black Codes');
          6: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Orange Codes');
          7: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield Yellow Codes');
          8: ProdGroups[Cat_Discount_Flag] := StPartSDM.NewPartGroup('KFIELDCAT' + IntToStr(Cat_Discount_Flag), 'Kingfield White Codes');
        end;
      end;

//update or insert part depending on wether it is already in database
      if bPart_Exists then
    //the part exists in the database already
      begin
        Result := STPartSDM.UpdatePart(Part, Part_Description, Prod_Status, Discount_this_Part,
                            iSupplCode, Vat_Code, Purch_Pack_Quantity, ProdGroups[Cat_Discount_Flag],
                            Part_Cost_List, Part_Purchase_Price);
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
        if ((Prod_Status = 'D') or (Prod_Status = 'M')) then
        begin
          //don't bother inserting discontinued Prods into database
          DiscontRecordCount := DiscontRecordCount + 1;
        end
        else
        begin
          //try to insert to part and increment counters
          Result := STPartSDM.InsertPart(Part, Part_Description, Prod_Status, Discount_this_Part,
                              iSupplCode, Vat_Code, Purch_pack_Quantity, ProdGroups[Cat_Discount_Flag],
                              Part_Cost_List, Part_Purchase_Price);

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
        end;
      end; //end of update/insert decision block
    end; //end while not EOF

//display error/insert/update counters
    mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
    if ErrorCount > 0 then
      mmErrorRecords.Lines.Add('The bad records have been written to '+tmpDir+'ErrorFile.txt');
    mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
    mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
    mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

    if newColourCodes then
    begin
      mmErrorRecords.Lines.Add('New Kingfield Product Groups have been introduced.');
      mmErrorRecords.Lines.Add('Contact your system support for assistance.');
    end;
    //close Text Files
    CloseFile(ProdTextFile);
    CloseFile(ErrorRecordFile);
  end
  else
  begin
  //Discount File
    AssignFile(DiscountFile, edtImportFileName.Text);
    Reset(DiscountFile);
    lblReadingFile.Caption := 'Reading Discount File';
    LineCount := CountTextFileLines(DiscountFile)-1;
    Reset(DiscountFile);
    lblRecordCount.Caption := 'records read.';
    prgrsbrImport.Max := LineCount;

    ReadLn(DiscountFile, ProdLine);  //first line holds a/c

    LineNo := 0;
    while not EOF(DiscountFile) do
    begin
      ReadLn(DiscountFile, ProdLine);
      LineNo := LineNo + 1;
      ParseDiscountLine(ProdLine, Part, Part_Purchase_Price);
      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

      //update part record
      with STPartSDM.qryUpdatePartPurchPrice do
      begin
        ParamByName('Part_Purchase_Price').AsCurrency := Part_Purchase_Price;
        ParamByName('Part').AsString := Part;
        ExecSQL;
      end;
      //set discount flag on part_supplier record to 'N' to stop two discounts being applied
      with STPartSDM.qryUpdPartSuppDisc do
      begin
        paramByName('Discount_this_Part').AsString := 'N';
        paramByName('Supplier').asInteger := iSupplCode;
        paramByName('Branch_No').asInteger := 0;
        paramByName('Part').asString := Part;
        ExecSQL;
      end;
    end;
    CloseFile(DiscountFile);
    mmErrorRecords.Lines.Add('Discount File Processed.');
  end;
end;

procedure TSTProdImportFrm.FormCreate(Sender: TObject);
begin
  STPartSDM := TSTPartSDM.Create(Self);
end;

procedure TSTProdImportFrm.UpdateError(LineNo: integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':UpdateError:'+ProdLine);
  WriteLn(theErrorFile, ProdLine);
end;

procedure TSTProdImportFrm.InsertError(LineNo: Integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':InsertError:'+ProdLine);
  WriteLn(theErrorFile, ProdLine);
end;

function TSTProdImportFrm.CountTextFileLines(
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

procedure TSTProdImportFrm.ParseError(LineNo: Integer;
  ProdLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, ProdLine);
end;

procedure TSTProdImportFrm.btnSelectSupplierClick(Sender: TObject);
var
  PBLUSuppFrm : TPBLUSuppFrm;
begin
  lblSuppName.Caption := '';
  iSupplCode := 0;
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_LookUp := True ;
    PBLUSuppFrm.bAllow_Upd := False ;
    PBLUSuppFrm.bSel_Branch := True ;
    PBLUSuppFrm.ShowModal;
    If PBLUSuppFrm.Selected then
       begin
       iSupplCode := PBLUSuppFrm.SelCode ;
       iSupplBranch := PBLUSuppFrm.SelBranch ;
       LblSuppName.Caption := PBLUSuppFrm.SelName + ', ' + PBLUSuppFrm.SelBranchName ;
       end;
  finally
    PBLUSuppFrm.Free;
  end;

  if iSupplCode <> 0 then
  begin
    lblStep1.Font.Style :=[];
    lblStep2.Font.Style :=[fsBold];
    pnlImportFile.Enabled := True;
  end
  else
  begin
    lblStep1.Font.Style :=[fsBold];
    lblStep2.Font.Style :=[];
    pnlImportFile.Enabled := False;
  end;
end;

function TSTProdImportFrm.ParseKingFieldKinnectFile(ProdLine: string;
  var Part, Part_Description, Prod_Status, Discount_this_Part: string;
  var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag: integer;
  var Part_Cost_List, Part_Purchase_Price: Double): boolean;
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
    While (Pos(Chr(vk_Tab), ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(Chr(vk_Tab), ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos));
      Delete(ParseString,1,TabPos);
    end;
    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    Part := LineData[1];
    Part_Description := LineData[2];
    if (LineData[16] = '3') then
      Vat_Code := 0
    else
      Vat_Code := dmBroker.GetCompanyVatCode;

    if (LineData[21] = 'X') then
      Prod_Status := 'Y'
    else
      Prod_Status := 'N';

    Part_Pack_Quantity := StrToInt(LineData[13]);
    Part_Cost_List := (StrToFloatDef(LineData[11], 0, FormatSettings) / 1000);
    Part_Purchase_Price := (StrToFloatDef(LineData[12], 0, FormatSettings) / 1000);

    Cat_Discount_Flag := StrToInt(LineData[17]);
    if (LineData[17] = '6') or (LineData[17] = '4') then
      Discount_this_Part := 'Y'
    else
      Discount_this_Part := 'N';

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportFrm.ParseKingFieldOpdataFile(ProdLine: string;
  var Part, Part_Description, Prod_Status, Discount_this_Part: string;
  var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag: integer;
  var Part_Cost_List, Part_Purchase_Price: Double): boolean;
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
    While (Pos(Chr(vk_Tab), ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(Chr(vk_Tab), ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos));
      Delete(ParseString,1,TabPos);
    end;
    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    Part := LineData[1];
    Part_Description := LineData[2];
    if (LineData[28] = '3') then
      Vat_Code := 0
    else
      Vat_Code := dmBroker.GetCompanyVatCode;

(*    try
      if (LineData[37] = 'D') or (LineData[37] = 'M') then
        Prod_Status := 'Y'
      else
        Prod_Status := 'N';
    except
      Prod_Status := 'N';
    end;
*)
    Prod_Status := 'N';

    Part_Pack_Quantity := StrToInt(LineData[7]);
    Part_Cost_List := StrToFloatDef(LineData[25], 0, FormatSettings);
    Part_Purchase_Price := StrToFloatDef(LineData[26], 0, FormatSettings);
    if LineData[32] = '0' then
    begin
      //apply discount
      Discount_this_Part := 'Y';
    end
    else
    begin
      //no discount
      Discount_this_Part := 'N';
    end;
    Cat_Discount_Flag := StrToInt(LineData[30]);

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportFrm.ParseSchonwaldFile(ProdLine: string;
  var Part, Part_Description, Product_Group, Prod_Status, Discount_this_Part: string;
  var Vat_Code, Part_pack_Quantity, Cat_Discount_Flag: integer;
  var Part_Cost_List, Part_Purchase_Price: Double): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
  Group, Code: string;
  iLength: integer;
const
  sPadding2 = '00';
  sPadding4 = '0000';

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

    {if not a product group then construct the product code -
    the structure is A AA AAAA}
    if LineData[4] <> '' then
      begin
        iLength := length(Linedata[2]);
        Group := copy((sPadding2+LineData[2]),iLength+1,2);

        iLength := length(Linedata[3]);
        Code := copy((sPadding4+LineData[3]),iLength+1,4);

        Part := LineData[1]+Group+Code;

        if LineData[9] <> '' then
          Part := LineData[9];
      end
    else
      Part := LineData[1];

    Part_Description := LineData[4];
    if Part_Description = '' then
      begin
        Linedata := nil;
        exit;
      end;

    Vat_Code := dmBroker.GetCompanyVatCode;

    Prod_Status := 'N';

    Part_Pack_Quantity := StrToInt(LineData[8]);
    Part_Cost_List := StrToFloatDef(LineData[7], 0, FormatSettings) * StrToIntDef(LineData[8], 0);
    Part_Purchase_Price := StrToFloatDef(LineData[6], 0, FormatSettings) * StrToIntDef(LineData[8], 0);
    //no discount
    Discount_this_Part := 'N';

    Product_Group := Group;
    Cat_Discount_Flag := StrToInt(LineData[2]);

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportFrm.ParseDiscountLine(ProdLine: string;
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

function TSTProdImportFrm.ParseContractHeader(ProdLine: string;
  var ContractCode: string; var DateFrom, DateTo: TDateTime): Boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := ProdLine;
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

    ContractCode := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));
    DateFrom := PBDateStr(trim(stringreplace(LineData[4],'"','',[rfReplaceAll])));
    DateTo := PBDateStr(trim(stringreplace(LineData[5],'"','',[rfReplaceAll])));

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportFrm.ParseContractLine(ProdLine: string;
  var Part, Discount_Type: string; var Part_Purchase_Price, Discount_Value: Double; var Pack_Size: integer): Boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
  try
    TempStr := '';
    ParseString := ProdLine;
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

    Part := trim(stringreplace(LineData[1],'"','',[rfReplaceAll]));
    try
      Discount_Value := StrToFloatDef(trim(stringreplace(LineData[4],'"','',[rfReplaceAll])), 0, FormatSettings);
    except
      Discount_Value := 0.00;
    end;

    try
      Part_Purchase_Price := StrToFloatDef(trim(stringreplace(LineData[5],'"','',[rfReplaceAll])), 0, FormatSettings);
    except
      Part_Purchase_Price := 0.00;
    end;

    try
      Pack_Size := StrTointDef(trim(stringreplace(LineData[6],'"','',[rfReplaceAll])), 0);
    except
      Pack_Size := 1;
    end;

    {Set the discount type}
    if Part_Purchase_Price <> 0 then
      Discount_type := 'A'
    else
      Discount_type := 'P';

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TSTProdImportFrm.NoOfKFieldProdGroups: integer;
begin
  result := STPartSDM.NoOfKFieldProdGroups;
end;

procedure TSTProdImportFrm.SetUpGroupArray;
var
  NoOfGroups: integer;
  inx: integer;
begin
  NoOfGroups := self.NoOfKFieldProdGroups;
  setLength(ProdGroups, NoOfGroups + 1);

  for inx := 0 to (NoOfGroups) do
  begin
    ProdGroups[inx] := -1;
  end;
end;

end.
