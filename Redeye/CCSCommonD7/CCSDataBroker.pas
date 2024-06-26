(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  The ancestral datamodule from which each report data broker should
  be descended.

VSS Info:
$Header: /CCSCommon/CCSDataBroker.pas 12    16/08/:1 15:33 Janiner $
$History: CCSDataBroker.pas $
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 16/08/:1   Time: 15:33
 * Updated in $/CCSCommon
 * Amend to be purchase orders and Enquiries, not Purchase Orders and
 * Acknowledgements.
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 27/07/:1   Time: 15:49
 * Updated in $/CCSCommon
 * Changed to use the Supplier_Fax field rather than the
 * Supplier_Fax_Number field.
 * 
 * *****************  Version 10  *****************
 * User: Janiner      Date: 24/07/:1   Time: 14:19
 * Updated in $/CCSCommon
 * Add new check on letter name to ensure switch between customer/supplier
 * ohone and fax details.
 * 
 * *****************  Version 9  *****************
 * User: Roddym       Date: 20/03/:0   Time: 17:24
 * Updated in $/CCSCommon
 * Fix bug in AddOrMerge method, column 3 text was overwriting column.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:11
 * Updated in $/CCSCommon
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:11
 * Updated in $/CCSCommon
 * New feature to allow setting of two tab stops per letter so the user
 * can size the virtual columns.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:41
 * Updated in $/CCSCommon
 * Changes for new letter printing mechanism, driven by the
 * tb_LetterLayout and tb_LetterElement tables.  New Letter object, also
 * hard-coded version to make switch transparent to Forms Technology.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 24/12/99   Time: 9:52
 * Updated in $/CCSCommon
 * New method BlankLineIfNeeded to prevent multiple blank lines.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 20/12/99   Time: 11:09
 * Updated in $/CCSCommon
 * Fix bug where continuation text on multiple letters/faxes was always
 * that of the last letter/fax to be printed.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 17/12/99   Time: 10:27
 * Updated in $/CCSCommon
 * Delete contents of FPrintRecords when calling BuildPrintRecords, this
 * was causing faxes to be sent appending each one to the next.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:16
 * Updated in $/CCSCommon
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 8/12/99    Time: 16:17
 * Created in $/CCSCommon
 * First conversion of Enquiry and Purchase Order fax/letters.

*******************************************************************************)
unit CCSDataBroker;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CCSPrint, Db, LetterDM, PDLetter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TBrokerProc = procedure of Object;

  TDataBroker = class(TDataModule)
    qryLayout: TFDQuery;
    qryCompany: TFDQuery;
    qryFormRef: TFDQuery;
    qryFSCClaim: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCompanyAddress : string;
    FCompanyname : string;
    FPageLayout: TPageLayout;
    FPixelFactor : real;
    FDatabaseName: string;
    FLayoutName: string;
    FPrinterSettings: TPrinterSettings;
    FLetterName: string;
    FContinuedFont: TFont;
    FPrintAddressbyLine: boolean;
    FRegisteredAddress : string;
    FPrintRegAddressbyLine: boolean;
    function  GetCompanyAddress : string;
    function  GetCompanyName : string;
    function  GetRegisteredAddress: string;
    function  Pixelate(const FieldName : string) : integer;
    procedure SetPageSize(const PageSize : string);
    procedure SetDatabaseName(const Value: string);
    procedure SetLayoutName(const Value: string);
    procedure SetLetterName(const Value: string);
    procedure SetContinuedFont(const Value: TFont);
    procedure SetPrintAddressbyLine(const Value: boolean);
    procedure SetPrintRegAddressbyLine(const Value: boolean);
  protected
    FContinuedText : string;
    FCurrentRecord : integer;
    FLetter : TLetter;
    FPrintRecords : TList;
    FPrintRecord : TPrintRecord;
    FColumnRecord : TColumnRecord;
    procedure AddOrMerge(aPrintRecord : TPrintRecord);
    function  AddWithSpace(const TempInp, TempAdd: string): string;
    function  AssignDataColumn(element : TElement) : integer;
    procedure BlankLine;
    procedure BlankLineIfNeeded;
    function  ContinuedRecord(const data : string;
      const iCol : integer) : TPrintRecord;
    function  CreateColumnRecord(const data : string) : TColumnRecord;
    function  CreatePrintRecord(const prType : TRecordType) : TPrintRecord;
    function  GetFormRefID(const FormRef : integer) : string;
    function  GetFSCClaim(const FSCClaim: integer; tmpMixedPerc: real): string;
    function  GetFSCTitle(const FSCClaim: integer): string;
    function  GetLastRecord : TPrintRecord;
    function  SimpleText(const data : string;
      element : TElement) : TPrintRecord;
    procedure AddEndRecord;
    procedure TextAlignAndFont(PrintRec : TPrintRecord; iCol, eNumber : integer);
    procedure DataAlignAndFont(PrintRec : TPrintRecord; iCol, eNumber : integer);
    function  TextLength(const Data : string; Font : TFont) : integer;
  public
    procedure BuildPageLayout; virtual;
    procedure BuildPrintRecords; virtual;
    procedure UpdateStatus(UpdateInfo : TUpdateInfo); virtual;
    procedure LoadPageLayoutFromDB(const LayoutName : string);
    function  GetNext : TPrintRecord;
    property  CompanyAddress : string read GetCompanyAddress;
    property  CompanyName : string read GetCompanyName;
    property  ContinuedFont : TFont read FContinuedFont write SetContinuedFont;
    property  ContinuedText : string read FContinuedText write FContinuedText;
    property  ConnectionName : string read FDatabaseName write SetDatabaseName;
    property  LayoutName : string read FLayoutName write SetLayoutName;
    property  LetterName : string read FLetterName write SetLetterName;
    property  PageLayout : TPageLayout read FPageLayout;
    property  PrintAddressbyLine: boolean read FPrintAddressbyLine write SetPrintAddressbyLine;
    property  PrintRegAddressbyLine: boolean read FPrintRegAddressbyLine write SetPrintRegAddressbyLine;
    property  PrinterSettings: TPrinterSettings read FPrinterSettings;
    property  RegisteredAddress : string read GetRegisteredAddress;
    procedure Reset;
  end;

implementation

{$IFDEF DEBUG}
uses
  System.UITypes,
  CCSDebug;
{$ENDIF}

{$R *.DFM}

{ TDataBroker }

procedure TDataBroker.BuildPageLayout;
begin
//  Descendants write their own code
end;

procedure TDataBroker.BuildPrintRecords;
var
  i : integer;
begin
  for i := 0 to Pred(FPrintRecords.Count) do
    TPrintRecord(FPrintRecords[i]).Free;
  FPrintRecords.Clear;
  FCurrentRecord := 0;
  BuildPageLayout;
//  Write yer code in descendant
end;

function TDataBroker.GetNext: TPrintRecord;
begin
  if FCurrentRecord = FPrintRecords.Count then
    Result := nil
  else
  begin
    Result := FPrintRecords[FCurrentRecord];
    Inc(FCurrentRecord);
  end;
end;

procedure TDataBroker.DataModuleCreate(Sender: TObject);
begin
  FContinuedFont := TFont.Create;
  FLetter := TLetter.Create;
  FPrintRecords := TList.Create;
  FPageLayout := TPageLayout.Create;
  FPrinterSettings := TPrinterSettings.Create;
  FCurrentRecord := 0;
  ConnectionName := 'PB';  { Default to Print Broker database }
end;

procedure TDataBroker.DataModuleDestroy(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to Pred(FPrintRecords.Count) do
    TPrintRecord(FPrintRecords[i]).Free;
  FPrinterSettings.Free;
  FPrintRecords.Free;
  FPageLayout.Free;
  FLetter.Free;
  FContinuedFont.Free;
end;

procedure TDataBroker.Reset;
begin
  FCurrentRecord := 0;
end;

procedure TDataBroker.LoadPageLayoutFromDB(const LayoutName: string);
begin
  FPageLayout.Clear;
  if LayoutName = '' then
    FPageLayout.PageLayoutName:= 'Blank'
  else
    FPageLayout.PageLayoutName:= LayoutName;
  with qryLayout do
  begin
    ParamByName('Name').AsString := FPageLayout.PageLayoutName;
    Open;
    if RecordCount = 1 then
    with FPageLayout do
    begin
      if CompareText(FieldByName('f_Units').AsString, sInches) = 0 then
        FPixelFactor  := Screen.PixelsPerInch
      else
        FPixelFactor := (1/InchesToCm) * Screen.PixelsPerInch;
      Portrait      := FieldByName('f_Portrait').AsString = 'Y';
      SetPageSize(FieldByName('f_PaperSize').AsString);
      Preprinted    := FieldByName('f_Preprinted').AsString = 'Y';
      PrintAddress  := FieldByName('f_PrintAddress').AsString = 'Y';
      PrintRegAddress  := FieldByName('f_PrintRegAddress').AsString = 'Y';
      PrintLogo     := FieldByName('f_PrintLogo').AsString = 'Y';
      PrintLogo1     := FieldByName('f_PrintLogo1').AsString = 'Y';
      PrintLogo2     := FieldByName('f_PrintLogo2').AsString = 'Y';
      PrintLogo3     := FieldByName('f_PrintLogo3').AsString = 'Y';

      {Get the Address detail}
      if FieldByName('f_AddressFontName').AsString = '' then
        AddressFontName := 'Arial'
      else
        AddressFontName := FieldByName('f_AddressFontName').AsString;

      if FieldByName('f_AddressFontSize').Asstring = '' then
        AddressFontSize := 10
      else
        AddressFontSize := FieldByName('f_AddressFontSize').Asinteger;

      AddressFontStyle := FieldByName('f_AddressFontStyle').Asinteger;

      if FieldByName('f_AddressAlignment').Asstring = '' then
        AddressAlignment := 'L'
      else
        AddressAlignment := FieldByName('f_AddressAlignment').Asstring;
      AddressPrintByLine := (FieldByName('f_AddressPrintByLine').Asstring <> 'N');
      AddressHeight := Pixelate('f_AddressHeight');
      AddressLeft   := Pixelate('f_AddressLeft');
      AddressTop    := Pixelate('f_AddressTop');
      AddressWidth  := Pixelate('f_AddressWidth');

      {Get the Registered Address detail}
      if FieldByName('f_RegAddressFontName').AsString = '' then
        RegAddressFontName := 'Arial'
      else
        RegAddressFontName := FieldByName('f_RegAddressFontName').AsString;

      if FieldByName('f_RegAddressFontSize').Asstring = '' then
        RegAddressFontSize := 10
      else
        RegAddressFontSize := FieldByName('f_RegAddressFontSize').Asinteger;

      RegAddressFontStyle := FieldByName('f_RegAddressFontStyle').Asinteger;

      if FieldByName('f_RegAddressAlignment').Asstring = '' then
        RegAddressAlignment := 'L'
      else
        RegAddressAlignment := FieldByName('f_RegAddressAlignment').Asstring;
      RegAddressPrintByLine := (FieldByName('f_RegAddressPrintByLine').Asstring <> 'N');
      RegAddressHeight := Pixelate('f_RegAddressHeight');
      RegAddressLeft   := Pixelate('f_RegAddressLeft');
      RegAddressTop    := Pixelate('f_RegAddressTop');
      RegAddressWidth  := Pixelate('f_RegAddressWidth');

      {Main Logo}
      LogoHeight    := Pixelate('f_LogoHeight');
      LogoLeft      := Pixelate('f_LogoLeft');
      LogoTop       := Pixelate('f_LogoTop');
      LogoWidth     := Pixelate('f_LogoWidth');

      LogoHeight1    := Pixelate('f_Logo1Height');
      LogoLeft1      := Pixelate('f_Logo1Left');
      LogoTop1       := Pixelate('f_Logo1Top');
      LogoWidth1     := Pixelate('f_Logo1Width');

      LogoHeight2    := Pixelate('f_Logo2Height');
      LogoLeft2      := Pixelate('f_Logo2Left');
      LogoTop2       := Pixelate('f_Logo2Top');
      LogoWidth2     := Pixelate('f_Logo2Width');

      LogoHeight3    := Pixelate('f_Logo3Height');
      LogoLeft3      := Pixelate('f_Logo3Left');
      LogoTop3       := Pixelate('f_Logo3Top');
      LogoWidth3     := Pixelate('f_Logo3Width');

      MarginBottom  := Pixelate('f_BottomMargin');
      MarginLeft    := Pixelate('f_LeftMargin');
      MarginRight   := Pixelate('f_RightMargin');
      MarginTop     := Pixelate('f_TopMargin');
      PPHeight      := Pixelate('f_PPHeight');
      PPLeft        := Pixelate('f_PPLeft');
      PPTop         := Pixelate('f_PPTop');
      PPWidth       := Pixelate('f_PPWidth');
      LogoFileName  := FieldByName('f_LogoFile').AsString;
    end;
    Close;
  end;
end;

procedure TDataBroker.SetPageSize(const PageSize: string);
begin
  with FPageLayout do
  begin
    PageWidth := 0;
    PageHeight := 0;
    if (PageSize = 'A4') and Portrait then
    begin
      PageWidth := Trunc(8.27 * Screen.PixelsPerInch);
      PageHeight := Trunc(11.69 * Screen.PixelsPerInch);
    end
    else
    if (PageSize = 'A4') and not Portrait then
    begin
      PageWidth := Trunc(11.69 * Screen.PixelsPerInch);
      PageHeight := Trunc(8.27 * Screen.PixelsPerInch);
    end
    else
    if (PageSize = 'Letter') and Portrait then
    begin
      PageWidth := Trunc(8.5 * Screen.PixelsPerInch);
      PageHeight := Trunc(11 * Screen.PixelsPerInch);
    end
    else
    if (PageSize = 'Letter') and not Portrait then
    begin
      PageWidth := Trunc(11 * Screen.PixelsPerInch);
      PageHeight := Trunc(8.5 * Screen.PixelsPerInch);
    end;
  end;
end;

function TDataBroker.Pixelate(const FieldName: string): integer;
begin
  with qryLayout do
  begin
    Result := Trunc(FieldByName(FieldName).AsFloat * FPixelFactor);
  end;
end;

function TDataBroker.GetCompanyAddress: string;
var
  sjoiner: string;
begin
  if PrintAddressByLine  then
    sJoiner := cLFCR
  else
    sJoiner := ' ';
  if FCompanyAddress = '' then
  with qryCompany do
  begin
    Open;
//    FCompanyName := Trim(FieldByName('Name').AsString);
//    FCompanyAddress := FCompanyName;
//    if Trim(FieldByName('Building_No_Name').AsString) <> '' then
//      FCompanyAddress := FCompanyAddress + cLFCR +
    FCompanyAddress := Trim(FieldByName('Building_No_Name').AsString);
    if Trim(FieldByName('Street').AsString) <> '' then
      FCompanyAddress := FCompanyAddress + sJoiner +
      Trim(FieldByName('Street').AsString);
    if Trim(FieldByName('Locale').AsString) <> '' then
      FCompanyAddress := FCompanyAddress + sJoiner +
      Trim(FieldByName('Locale').AsString);
    if Trim(FieldByName('Town').AsString) <> '' then
      FCompanyAddress := FCompanyAddress + sJoiner +
      Trim(FieldByName('Town').AsString);
    if Trim(FieldByName('Postcode').AsString) <> '' then
      FCompanyAddress := FCompanyAddress + sJoiner +
      Trim(FieldByName('Postcode').AsString);
    if (lettername = 'Purchase Order') or (lettername = 'Enquiry') then
      begin
      if Trim(FieldByName('Supplier_Phone').AsString) <> '' then
        FCompanyAddress := FCompanyAddress + sJoiner + 'Tel: ' +
        Trim(FieldByName('Supplier_Phone').AsString)
      else
        FCompanyAddress := FCompanyAddress + sJoiner + 'Tel: ' +
        Trim(FieldByName('Phone').AsString);
      if Trim(FieldByName('Supplier_Fax').AsString) <> '' then
        FCompanyAddress := FCompanyAddress + sJoiner + 'Fax: ' +
        Trim(FieldByName('Supplier_Fax').AsString)
      else
      if Trim(FieldByName('Fax_Number').AsString) <> '' then
        FCompanyAddress := FCompanyAddress + sJoiner + 'Fax: ' +
        Trim(FieldByName('Fax_Number').AsString);
      end
   else
      begin
      if Trim(FieldByName('Phone').AsString) <> '' then
        FCompanyAddress := FCompanyAddress + sJoiner + 'Tel: ' +
        Trim(FieldByName('Phone').AsString);
      if Trim(FieldByName('Fax_Number').AsString) <> '' then
        FCompanyAddress := FCompanyAddress + sJoiner + 'Fax: ' +
        Trim(FieldByName('Fax_Number').AsString);
    end;
    if Trim(FieldByName('Web_Address').AsString) <> '' then
      FCompanyAddress := FCompanyAddress + sJoiner +
      Trim(FieldByName('Web_Address').AsString);
    if Trim(FieldByName('Email').AsString) <> '' then
      FCompanyAddress := FCompanyAddress + sJoiner +
      Trim(FieldByName('Email').AsString);
    Close;
  end;
  Result := FCompanyAddress;
end;

function TDataBroker.GetRegisteredAddress: string;
var
  sjoiner: string;
begin
  if PrintRegAddressByLine  then
    sJoiner := cLFCR
  else
    sJoiner := ' ';
  if FRegisteredAddress = '' then
  with qryCompany do
  begin
    Open;
    if Trim(FieldByName('Company_Reg_No').AsString) <> '' then
      FRegisteredAddress := 'Registered in England & Wales Registration No: ' + Trim(FieldByName('Company_Reg_No').AsString);

    if Trim(FieldByName('VAT_Registration_No').AsString) <> '' then
      FRegisteredAddress := FRegisteredAddress + sJoiner + 'Vat No: ' + Trim(FieldByName('VAT_Registration_No').AsString);

    FRegisteredAddress := FRegisteredAddress + sJoiner + 'Registered Office: ' + Trim(FieldByName('Registered_Office_Address').AsString) ;

    Close;
  end;
  Result := FRegisteredAddress;
end;

procedure TDataBroker.SetDatabaseName(const Value: string);
var
  i : integer;
begin
  FDatabaseName := Value;
  for i := 0 to Pred(ComponentCount) do
    if Components[i] is TFDQuery then
      TFDQuery(Components[i]).ConnectionName := Value
    else
    if Components[i] is TFDStoredProc then
      TFDStoredProc(Components[i]).ConnectionName := Value
    else
    if Components[i] is TFDTable then
      TFDTable(Components[i]).ConnectionName := Value;
end;

function TDataBroker.CreatePrintRecord(
  const prType: TRecordType): TPrintRecord;
begin
  Result := TPrintRecord.Create;
  Result.RecordType := prType;
end;

function TDataBroker.CreateColumnRecord(const data : string): TColumnRecord;
begin
  Result := TColumnRecord.Create;
  Result.Alignment := taLeftJustify;
  Result.Width := 0;  { want whole line as default }
  Result.Text := data;
end;

function TDataBroker.SimpleText(const data: string;
  element : TElement): TPrintRecord;
var
  aColumn : TColumnRecord;
  iCol : integer;
begin
  Result := CreatePrintRecord(rtText);
  aColumn := CreateColumnRecord(data);
  if Assigned(element) then
  begin
    aColumn.LeftMargin := element.Left;
    aColumn.Width := element.Width;
    Result.PrintOrder := element.PrintOrder;
    iCol := element.Column
  end
  else
    iCol := 0;
  case iCol of
  2 :  Result.Column2 := aColumn;
  3 :  Result.Column3 := aColumn;
  else Result.Column1 := aColumn;
  end;  { case }
end;

function TDataBroker.AddWithSpace(const TempInp, TempAdd: string): string;
var
  s1, s2 : string;
begin
  s1 := Trim(TempInp);
  s2 := Trim(TempAdd);
  if s1 = '' then
    Result := s2
  else
  if s2 = '' then
    Result := s1
  else { Don't add space if force linebreak found }
  if CharInSet(s1[Length(s1)], [#10, #13]) or CharInSet(s2[1], [#10, #13]) then
    Result := s1 + s2
  else
    Result := s1 + ' ' + s2;

end;

procedure TDataBroker.AddEndRecord;
begin
  FPrintRecords.Add(CreatePrintRecord(rtEnd));
end;

procedure TDataBroker.BlankLine;
begin
  FPrintRecords.Add(CreatePrintRecord(rtBlank));
end;

procedure TDataBroker.SetLayoutName(const Value: string);
begin
  FLayoutName := Value;
end;

function TDataBroker.GetCompanyName: string;
begin
  if FCompanyName = '' then
  with qryCompany do
  begin
    Open;
    FCompanyName := Trim(FieldByName('Name').AsString);
    Close;
  end;
  Result := FCompanyName;
end;

procedure TDataBroker.UpdateStatus(UpdateInfo: TUpdateInfo);
begin
  { Write yer own code for this }
end;

function TDataBroker.ContinuedRecord(const data: string;
  const iCol : integer): TPrintRecord;
begin
  Result := SimpleText(data, nil);
  Result.RecordType := rtContinuedText;
  Result.ContinuedText := data;
end;

procedure TDataBroker.BlankLineIfNeeded;
var
  i : integer;
begin
  i := Pred(FPrintRecords.Count);
  if i >= 0 then
    if TPrintRecord(FPrintRecords[i]).RecordType <> rtBlank then
      BlankLine;
end;

procedure TDataBroker.SetLetterName(const Value: string);
begin
  FLetterName := Value;
end;

procedure TDataBroker.TextAlignAndFont(PrintRec: TPrintRecord; iCol, eNumber: integer);
var
  element : TElement;
  ColumnRec : TColumnRecord;
begin
  case iCol of
  2 :  ColumnRec := PrintRec.Column2;
  3 :  ColumnRec := PrintRec.Column3;
  else ColumnRec := PrintRec.Column1;
  end;  { case }
  { Assign the default font first then look to see if any override }
  ColumnRec.Font.Name := FLetter.FontArray[1].FontName;
  ColumnRec.Font.Size := FLetter.FontArray[1].FontSize;
  ColumnRec.Font.Style := [];
  if (FLetter.FontArray[1].FontStyle and cBold) <> 0 then
    ColumnRec.Font.Style := ColumnRec.Font.Style + [fsBold];
  if (FLetter.FontArray[1].FontStyle and cItalic) <> 0 then
    ColumnRec.Font.Style := ColumnRec.Font.Style + [fsItalic];
  if (FLetter.FontArray[1].FontStyle and cUnderline) <> 0 then
    ColumnRec.Font.Style := ColumnRec.Font.Style + [fsUnderline];
  element := FLetter.Elements.ElementByNumber[eNumber];
  if Assigned(element) then
  begin
    if not (element.FontNo in [0, 1]) then
      ColumnRec.Font.Name := FLetter.FontArray[element.FontNo].FontName;
    if element.FontSize <> 0 then
      ColumnRec.Font.Size := element.FontSize;
    if element.FontStyle <> 0 then
    begin
      ColumnRec.Font.Style := [];
      if (element.FontStyle and cBold) <> 0 then
        ColumnRec.Font.Style := ColumnRec.Font.Style + [fsBold];
      if (element.FontStyle and cItalic) <> 0 then
        ColumnRec.Font.Style := ColumnRec.Font.Style + [fsItalic];
      if (element.FontStyle and cUnderline) <> 0 then
        ColumnRec.Font.Style := ColumnRec.Font.Style + [fsUnderline];
    end;
    ColumnRec.Alignment := element.Alignment;
  end;
end;

procedure TDataBroker.DataAlignAndFont(PrintRec: TPrintRecord;
  iCol, eNumber: integer);
var
  element : TElement;
  ColumnRec : TColumnRecord;
begin
  case iCol of
  2 :  ColumnRec := PrintRec.Column2;
  3 :  ColumnRec := PrintRec.Column3;
  else ColumnRec := PrintRec.Column1;
  end;  { case }
  { Assign the default font first then look to see if any override }
  ColumnRec.Font.Name := FLetter.FontArray[1].FontName;
  ColumnRec.Font.Size := FLetter.FontArray[1].FontSize;
  ColumnRec.Font.Style := [];
  if (FLetter.FontArray[1].FontStyle and cBold) <> 0 then
    ColumnRec.Font.Style := ColumnRec.Font.Style + [fsBold];
  if (FLetter.FontArray[1].FontStyle and cItalic) <> 0 then
    ColumnRec.Font.Style := ColumnRec.Font.Style + [fsItalic];
  if (FLetter.FontArray[1].FontStyle and cUnderline) <> 0 then
    ColumnRec.Font.Style := ColumnRec.Font.Style + [fsUnderline];
  element := FLetter.Elements.ElementByNumber[eNumber];
  if Assigned(element) then
  begin
    if not (element.Font2No in [0, 1]) then
      ColumnRec.Font.Name := FLetter.FontArray[element.Font2No].FontName;
    if element.Font2Size <> 0 then
      ColumnRec.Font.Size := element.Font2Size;
    if element.Font2Style <> 0 then
    begin
      ColumnRec.Font.Style := [];
      if (element.Font2Style and cBold) <> 0 then
        ColumnRec.Font.Style := ColumnRec.Font.Style + [fsBold];
      if (element.Font2Style and cItalic) <> 0 then
        ColumnRec.Font.Style := ColumnRec.Font.Style + [fsItalic];
      if (element.Font2Style and cUnderline) <> 0 then
        ColumnRec.Font.Style := ColumnRec.Font.Style + [fsUnderline];
    end;
    ColumnRec.Alignment := element.Alignment;
  end;
end;

procedure TDataBroker.SetContinuedFont(const Value: TFont);
begin
  FContinuedFont := Value;
end;

function TDataBroker.GetFormRefID(const FormRef: integer): string;
begin
  with qryFormRef do
  try
    Close;
    ParamByName('Ref').AsInteger := FormRef;
    Open;
    Result := FieldByName('Form_Reference_ID').AsString;
    Close;
  except
    Result := '';
  end;
end;

function TDataBroker.GetFSCClaim(const FSCClaim: integer; tmpMixedPerc: real): string;
begin
  with qryFSCClaim do
  try
    Close;
    ParamByName('FSC_Material_Claim').AsInteger := FSCClaim;
    Open;
    if recordcount > 0 then
      begin
        if fieldbyname('Mixed_Claim').asstring = 'Y' then
          result := stringreplace(fieldbyname('Short_Description').asstring,'X',formatfloat('0',tmpMixedPerc),[])
        else
          result := fieldbyname('Short_Description').asstring;
      end
    else
      result := '';
    Close;
  except
    Result := '';
  end;
end;

function TDataBroker.GetFSCTitle(const FSCClaim: integer): string;
begin
  result := 'FSC';
  with qryFSCClaim do
  try
    Close;
    ParamByName('FSC_Material_Claim').AsInteger := FSCClaim;
    Open;

    if recordcount > 0 then
      result := fieldbyname('Claim_Type').asstring
    else
      result := 'FSC';
    Close;
  except
    Result := '';
  end;
end;

function TDataBroker.TextLength(const Data: string; Font: TFont): integer;
var
  Form : TForm;
begin
  Form := TForm.Create(Self);
  try
    Form.Canvas.Font.Assign(Font);
    Result := Form.Canvas.TextWidth(Data);
  finally
    Form.Free;
  end;
end;

procedure TDataBroker.AddOrMerge(aPrintRecord: TPrintRecord);
var
  LastRec : TPrintRecord;
begin
  LastRec := GetLastRecord;
  if not Assigned(LastRec) then
    FPrintRecords.Add(aPrintRecord)
  else
  begin
    if LastRec.PrintOrder <> aPrintRecord.PrintOrder then
      FPrintRecords.Add(aPrintRecord)
    else
    begin  { same printorder so merge the data streams }
      if Assigned(LastRec.Column1) and Assigned(aPrintRecord.Column1) then
        LastRec.Column1.Text := LastRec.Column1.Text + cLFCR +
          aPrintRecord.Column1.Text
      else
      if Assigned(aPrintRecord.Column1) then
      begin
        LastRec.Column1 := aPrintRecord.Column1;
        aPrintRecord.Column1 := nil;
      end;
      if Assigned(LastRec.Column2) and Assigned(aPrintRecord.Column2) then
        LastRec.Column2.Text := LastRec.Column2.Text + cLFCR +
          aPrintRecord.Column2.Text
      else
      if Assigned(aPrintRecord.Column2) then
      begin
        LastRec.Column2 := aPrintRecord.Column2;
        aPrintRecord.Column2 := nil;
      end;
      if Assigned(LastRec.Column3) and Assigned(aPrintRecord.Column3) then
        LastRec.Column3.Text := LastRec.Column3.Text + cLFCR +
          aPrintRecord.Column3.Text
      else
      if Assigned(aPrintRecord.Column3) then
      begin
        LastRec.Column3 := aPrintRecord.Column3;
        aPrintRecord.Column3 := nil;
      end;
      { Now free redundant record }
      aPrintRecord.Free;
    end;
  end;
end;

function TDataBroker.GetLastRecord: TPrintRecord;
var
  i : integer;
begin
  Result := nil;
  for i := Pred(FPrintRecords.Count) downto 0 do
    if TPrintRecord(FPrintRecords[i]).RecordType
    in [rtText, rtKeepTogether] then
    begin
      Result := TPrintRecord(FPrintRecords[i]);
      Break;
    end;
end;

function TDataBroker.AssignDataColumn(element : TElement): integer;
begin
  case element.Column of
  2 :
  begin
    FPrintRecord.Column3 := FColumnRecord;
    Result := 3;
  end;
  3 :
    Raise Exception.Create('Invalid letter layout column value ' +
      element.Name);
  else
  begin
    FPrintRecord.Column2 := FColumnRecord;
    Result := 2;
  end;
  end;  { case }

end;

procedure TDataBroker.SetPrintAddressbyLine(const Value: boolean);
begin
  FPrintAddressbyLine := Value;
end;

procedure TDataBroker.SetPrintRegAddressbyLine(const Value: boolean);
begin
  FPrintRegAddressbyLine := Value;
end;

end.
