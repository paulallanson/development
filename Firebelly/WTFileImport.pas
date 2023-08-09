unit WTFileImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DBCtrls, ExtCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTFileImport = class(TForm)
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
    Label2: TLabel;
    dblkpDataSource: TDBLookupComboBox;
    qryDataSource: TFDQuery;
    dtsDataSource: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btnFindFileClick(Sender: TObject);
    procedure cmbImportTypeClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
  private
    FFileType: string;
    function CountTextFileLines(var theTextFile: TextFile): integer;
    function ParseCSVAddressFile(DataLine: string; var Salutation, FName,
      LName, Company, Address1, Address2, Address3, Address4, City,
      Postcode, County, DAddress1, DAddress2, DAddress3, DAddress4, DCity,
      DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress,
      Title, ContactType, CustomerType, NoEmployees: string): boolean;
    function ParseCSVWorktopFile(DataLine: string; var Material, Worktop,
      Group, Thickness1, Thickness2, Thickness3, Thickness4: string): boolean;
    function ParseCSVWorktopHeaderFile(DataLine: string; var HeadMaterial, HeadWorktop,
      HeadGroup, HeadThickness1, HeadThickness2, HeadThickness3, HeadThickness4: string): boolean;
    function ParseQBAddressFile(DataLine: string; var Salutation, FName,
      LName, Company, Address1, Address2, Address3, Address4, City,
      Postcode, County, DAddress1, DAddress2, DAddress3, DAddress4, DCity,
      DPostcode, DCounty: string): boolean;
    procedure ParseError(LineNo: Integer; DataLine: String;
      var theErrorFile: TextFile);
    procedure DoOneCustomer(Salutation, FName, LName, Company, Address1,
      Address2, Address3, Address4, City, Postcode, County, DAddress1,
      DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode,
      Email, AccCode, WebAddress, Title, ContactType, CustomerType, NoEmployees: string);
    procedure DoOneSupplier(Salutation, FName, LName, Company, Address1,
      Address2, Address3, Address4, City, Postcode, County, DAddress1,
      DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty: string);
    function DoOneCustomerRep(Company, Rep: string): boolean;
    function DoOneWorktop(Material, Worktop, Group, Thickness: string; Price: real): boolean;
    procedure ImportQBFile;
    procedure ImportCSVFile;
    procedure ImportWorktopCSVFile;
    procedure SetFileType(const Value: string);
    { Private declarations }
  public
    property FileType: string read FFileType write SetFileType;
  end;

var
  frmWTFileImport: TfrmWTFileImport;

implementation

uses WTAccImportDM;

{$R *.dfm}

procedure TfrmWTFileImport.FormActivate(Sender: TObject);
begin
  with qryDataSource do
    begin
      close;
      open;
    end;

  cmbImportType.ItemIndex := 0;
  cmbImportTypeClick(self);
end;

procedure TfrmWTFileImport.btnFindFileClick(Sender: TObject);
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

procedure TfrmWTFileImport.cmbImportTypeClick(Sender: TObject);
begin
  if cmbImportType.ItemIndex > 0 then
    begin
      pnlImportFile.Enabled := True;
      lblStep3.Font.Style := [fsBold];
      lblStep1.Font.Style := [];
    end;
end;

procedure TfrmWTFileImport.ImportBtnClick(Sender: TObject);
begin
  if FileType = 'QB' then
    ImportQBFile
  else
    begin
      if cmbImportType.text = 'Worktops' then
        ImportWorktopCSVFile
      else
        ImportCSVFile;
    end;
end;

procedure TfrmWTFileImport.ImportQBFile;
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
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode,
                                        '', '', '', '', '', '', '')
          else
            DoOneSupplier(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty)
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

procedure TfrmWTFileImport.ImportCSVFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  result: boolean;
  Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County, AccCode, WebAddress: string;
  Title, ContactType, CustomerType, NoEmployees: string;
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
                                        DCode, Email, AccCode, WebAddress, Title, ContactType, CustomerType, NoEmployees);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          if cmbImportType.text = 'Customer' then
            DoOneCustomer(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode,
                                        Email, AccCode, WebAddress, Title, ContactType, CustomerType, NoEmployees)
          else
          if cmbImportType.text = 'Supplier' then
            DoOneSupplier(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode,
                                        County, DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty)
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

procedure TfrmWTFileImport.ImportWorktopCSVFile;
var
  DataTextFile : TextFile;
  ErrorRecordFile : TextFile;
  LineCount, LineNo, ErrorCount : integer;
  DataLine: string;
  result: boolean;
  Headmaterial, Material, HeadWorktop, Worktop, HeadGroup, Group, HeadThickness1, Thickness1, HeadThickness2, Thickness2: string;
  HeadThickness3, Thickness3, HeadThickness4, Thickness4, Thickness: string;
  icount: integer;

  Price: real;
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
          if LineNo = 1 then
            begin
              result := ParseCSVWorktopHeaderFile(DataLine, HeadMaterial, HeadWorktop, HeadGroup, HeadThickness1, HeadThickness2, HeadThickness3, HeadThickness4);
              continue;
            end;

          lblProgress.Caption := IntToStr(LineNo);
          prgrsbrImport.Position := LineNo;
          pnlProgress.Repaint;

          result := ParseCSVWorktopFile(DataLine, Material, Worktop, Group, Thickness1, Thickness2, Thickness3, Thickness4);

          if Result = False then
          begin
            ParseError(LineNo, DataLine, ErrorRecordFile);
            ErrorCount := ErrorCount + 1;
            continue;
          end;

          {Increment through the size options}
          for icount := 1 to 4 do
            begin
              case icount of
                1: begin
                    Thickness := HeadThickness1;
                    try
                      Price := StrToFloatDef(Thickness1, 0, FormatSettings);
                    except
                      Price := 0.00
                    end;
                   end;
                2: begin
                    Thickness := HeadThickness2;
                    try
                      Price := StrToFloatDef(Thickness2, 0, FormatSettings);
                    except
                      Price := 0.00
                    end;
                   end;
                3: begin
                    Thickness := HeadThickness3;
                    try
                      Price := StrToFloatDef(Thickness3, 0, FormatSettings);
                    except
                      Price := 0.00
                    end;
                   end;
                4: begin
                    Thickness := HeadThickness4;
                    try
                      Price := StrToFloatDef(Thickness4, 0, FormatSettings);
                    except
                      Price := 0.00
                    end;
                   end;
               end;

              if Thickness <> '' then
                DoOneWorktop(Material, Worktop, Group, Thickness, Price);
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

function TfrmWTFileImport.CountTextFileLines(
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

function TfrmWTFileImport.ParseQBAddressFile(DataLine: string;
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

function TfrmWTFileImport.ParseCSVAddressFile(DataLine: string; var Salutation, FName,
      LName, Company, Address1, Address2, Address3, Address4, City,
      Postcode, County, DAddress1, DAddress2, DAddress3, DAddress4, DCity,
      DPostcode, DCounty, Rep, Phone, Fax, DName, DCode, Email, AccCode, WebAddress,
      Title, ContactType, CustomerType, NoEmployees: string): boolean;
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

    Salutation := '';

    Company := LineData[1];

    Address1 := LineData[2];

    Address2 := LineData[3];

    Address3 := LineData[4];

    Address4 := LineData[5];

    City := LineData[5];

    County := LineData[6];

    Postcode := LineData[7];

    Phone := LineData[8];
    if Phone = '' then
      Phone := '0';

    Title := LineData[9];

    FName := LineData[10];

    LName := LineData[11];

    ContactType := LineData[12];

    CustomerType := LineData[13];

    NoEmployees := lineData[14];

    WebAddress := LineData[15];

    AccCode := LineData[16];

    Fax := LineData[17];
    if Fax = '' then
      Fax := '0';

    Email := LineData[18];


    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

procedure TfrmWTFileImport.ParseError(LineNo: Integer; DataLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, DataLine);
end;

procedure TfrmWTFileImport.DoOneCustomer(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County: string;
      DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty, Rep, Phone, Fax, DName, DCode,
      Email, AccCode, WebAddress, Title, ContactType, CustomerType, NoEmployees: string);
begin
  try
    dmAccImport.CompanyName := Company;
    if trim(AccCode) = '' then
      dmAccImport.AccountRef := Company
    else
      dmAccImport.AccountRef := AccCode;

    dmAccImport.CustomerType := CustomerType;
    dmAccImport.Address1 := Address1;
    dmAccImport.Address2 := Address2;
    dmAccImport.Address3 := Address3;
    dmAccImport.Address4 := Address4;
    dmAccImport.Address5 := postcode;
    dmAccImport.County := County;
    dmAccImport.ContactName := trim(trim(Salutation) + ' ' + trim(FName) + ' ' + trim(LName));
    dmAccImport.ForeName := trim(FName);
    dmAccImport.ContactType := trim(ContactType);

    dmAccImport.Telephone := Phone;
    dmAccImport.Fax := Fax;
    dmAccImport.webaddress := WebAddress;

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

    dmAccImport.Salutation := trim(FName);
    dmAccImport.Title := trim(Salutation);
    dmAccImport.Email := trim(Email);

    dmAccImport.VATNumber := '';
    dmAccImport.Currency := '1';
    dmAccImport.SettlementRate := 0;
    dmAccImport.SettlementDays := 0;
    dmAccImport.NoEmployees := strtoint(NoEmployees);
    dmAccImport.CustDataSource := dblkpdataSource.KeyValue;

    dmAccImport.CreditLimit := 0;

    dmAccImport.DoOneCustomer;
  finally
  end;
end;

procedure TfrmWTFileImport.DoOneSupplier(Salutation, FName, LName, Company, Address1, Address2, Address3, Address4, City, Postcode, County: string;
      DAddress1, DAddress2, DAddress3, DAddress4, DCity, DPostcode, DCounty: string);
begin
  try
    dmAccImport.CompanyName := Company;
    dmAccImport.AccountRef := Company;
    dmAccImport.Address1 := Address1;
    dmAccImport.Address2 := Address2;
    dmAccImport.Address3 := Address3;
    dmAccImport.Address4 := Address4;
    dmAccImport.Address5 := postcode;
    dmAccImport.ContactName := trim(Salutation) + trim(FName) + trim(LName);

    dmAccImport.Telephone := '';
    dmAccImport.Fax := '';
    dmAccImport.webaddress := '';

    dmAccImport.delAddress1 := DAddress1;
    dmAccImport.delAddress2 := DAddress2;
    dmAccImport.delAddress3 := DAddress3;
    dmAccImport.delAddress4 := DAddress4;
    dmAccImport.delAddress5 := DPostcode;

    dmAccImport.delContact := '';
    dmAccImport.DelTelephone := '';
    dmAccImport.DelFax := '';
    dmAccImport.Rep := '';

    dmAccImport.Salutation := trim(FName);
    dmAccImport.Title := trim(Salutation);

    dmAccImport.VATNumber := '';
    dmAccImport.Currency := '1';
    dmAccImport.SettlementRate := 0;
    dmAccImport.SettlementDays := 0;

    dmAccImport.CreditLimit := 0;

    dmAccImport.DoOneSupplier;
  finally
  end;
end;

function TfrmWTFileImport.DoOneCustomerRep(Company, Rep: string): boolean;
begin
  try
    dmAccImport.CompanyName := Company;
    dmAccImport.Rep := Rep;
    result := dmAccImport.DoOneCustomerRep;
  finally
  end;
end;

function TfrmWTFileImport.DoOneWorktop(Material, Worktop, Group, Thickness: string; Price: real): boolean;
begin
  try
    dmAccImport.Material := Material;
    dmAccImport.Worktop := Worktop;
    dmAccImport.Group := Group;
    dmAccImport.Thickness := Thickness;
    dmAccImport.Price := Price;
    result := dmAccImport.DoOneWorktop;
  finally
  end;
end;

procedure TfrmWTFileImport.SetFileType(const Value: string);
begin
  FFileType := Value;
  if FFileType = 'QB' then
    self.caption := 'Import Quickbooks data'
  else
    self.caption := 'Import CSV file type data';
end;

function TfrmWTFileImport.ParseCSVWorktopFile(DataLine: string;
  var Material, Worktop, Group, Thickness1, Thickness2, Thickness3, Thickness4: string): boolean;
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

    Material := LineData[1];

    Worktop := LineData[2];

    Group := LineData[3];

    Thickness1 := LineData[4];

    Thickness2 := LineData[5];

    Thickness3 := LineData[6];

    Thickness4 := LineData[7];

    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

function TfrmWTFileImport.ParseCSVWorktopHeaderFile(DataLine: string;
  var HeadMaterial, HeadWorktop, HeadGroup, HeadThickness1, HeadThickness2, HeadThickness3, HeadThickness4: string): boolean;
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

    headMaterial := LineData[1];

    HeadWorktop := LineData[2];

    HeadGroup := LineData[3];

    HeadThickness1 := LineData[4];

    HeadThickness2 := LineData[5];

    HeadThickness3 := LineData[6];

    HeadThickness4 := LineData[7];

    Result := True;
    LineData := nil;

  except
    Result := False;
    LineData := nil;
  end;

end;

end.
