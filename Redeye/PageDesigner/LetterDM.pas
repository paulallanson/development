(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  DataModule for Page/Letter Layout Designer for Broker.

VSS Info:
$Header: /PageDesigner/LetterDM.pas 15    11/10/:1 8:13 Janiner $
$History: LetterDM.pas $
 * 
 * *****************  Version 15  *****************
 * User: Janiner      Date: 11/10/:1   Time: 8:13
 * Updated in $/PageDesigner
 * Add new routine to allow printing of extra charges as either a
 * summary/detail .
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 10/05/:1   Time: 14:01
 * Updated in $/PageDesigner
 * Need interim check in to enable test of moving invoice details for TF
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 30/01/:1   Time: 17:23
 * Updated in $/PageDesigner
 * Added functionality to read Exportfilters
 * 
 * *****************  Version 12  *****************
 * User: Roddym       Date: 9/03/:0    Time: 15:09
 * Updated in $/PageDesigner
 * Set default tabstops in letter object when loading from database and
 * tab stop values are zero.
 * 
 * *****************  Version 11  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Updated in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 10  *****************
 * User: Roddym       Date: 24/02/:0   Time: 11:31
 * Updated in $/PageDesigner
 * Store username and password in PBDatabase, the database component
 * wasn't returning the password from the loginvalues structure.  Use
 * these new properties in LetterDM when logging onto the data source.
 * 
 * *****************  Version 9  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:10
 * Updated in $/PageDesigner
 * New feature to allow setting of two tab stops per letter so the use can
 * size the virtual columns.  Version bumped to 2.3a because of this and
 * database changes.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 10/02/:0   Time: 17:34
 * Updated in $/PageDesigner
 * Set defaults for new quotation summary layout, fix script generation to
 * handle new layout and database fields.
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:29
 * Updated in $/PageDesigner
 * New letter layout Quotation Summary allows all lines of an enquiry to
 * be printed in one letter.  Database changes.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 10/02/:0   Time: 11:59
 * Updated in $/PageDesigner
 * Add questions and answers to Purchase Order and Acknowledgement letter
 * layouts.  Add new page layout field PrintDefault similar to FaxDefault.
 * Add new letter layout field LetterTypeDefault so we can display the
 * user's selected default on print selection forms in Broker.  Version
 * number of PageDesigner raised to 2.2a
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 13/01/:0   Time: 8:20
 * Updated in $/PageDesigner
 * Add new Clear method to TLetter.  Hardcoded layouts were being appended
 * to existing object causing multiple prints of same items.  Call Clear
 * in HardLoad and SoftLoad methods to ensure a blank layout to begin
 * with.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 12/01/:0   Time: 9:14
 * Updated in $/PageDesigner
 * Assorted layout fixes for letters, line spacing etc.  Fix script
 * generation.  Use CR + LF in text for acknowledgement.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/01/:0   Time: 11:27
 * Updated in $/PageDesigner
 * New feature:  generate SQL statements to create layout and element
 * entries in the database based on the internal hard coded values.
 *
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:41
 * Updated in $/PageDesigner
 * Changes to Letter object, also hard-coded version to make switch
 * transparent to Forms Technology.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit LetterDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, PDLetter, ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait;

type
  TdmLetter = class(TDataModule)
    qryLetter: TFDQuery;
    qryElement: TFDQuery;
    qryAddLetter: TFDQuery;
    qryLayouts: TFDQuery;
    ADOConn: TADOConnection;
    ADOAddElement: TADOQuery;
    ADOUpdElement: TADOQuery;
    qryUpdLetter: TFDQuery;
    qryDefaults: TFDQuery;
    qryExportFilter: TFDQuery;
    qryGetExportFilter: TFDQuery;
    FDConn: TFDConnection;
    procedure ADOConnBeforeConnect(Sender: TObject);
  private
    FOldDatabase : Boolean;
    FDatabaseOpened : Boolean;
    procedure AddElement(Letter: TLetter;
      const aNumber, aPrintOrder, aColumn, aLeft, aWidth, aStyle : integer;
      const aName, aText : string;
      const isDbData, isFixed, isPrinted : integer;
      const anAlignment : char);
    procedure CreateElements(Letter : TLetter; HardCodedArray : array of THardCoded;
      StringArray : array of string);
    procedure HardLoadEnquiry(Letter: TLetter);
    procedure HardLoadQuotation(Letter: TLetter);
    procedure HardLoadPurchaseOrder(Letter: TLetter);
    procedure HardLoadAcknowledgement(Letter: TLetter);
    procedure HardLoadQuotationSummary(Letter: TLetter);
    procedure SoftLoadLetter(Letter: TLetter);
    function GetFaxDefaultLayout : string;
    function GetOldDatabase : Boolean;
    function GetPrintDefaultLayout : string;
    procedure ClearLetterDefaults(const LetterType : integer);
  public
    procedure AddLetter(Letter : TLetter);
    function  BoolToChar(const B : Boolean) : char;
    function  GetLetterDefault(const LetterType : integer) : string;
    function  GetLetterLayoutList(const LetterType : integer) : TStringList;
    function  GetPageLayoutList : TStringList;
    function  GetExportFilters: TStringList;
    function  GetExportFilterCode(icount: integer): string;
    function  GetExportFilterDescr(sCode: string): String;
    procedure HardLoadLetter(Letter: TLetter);
    procedure LoadLetter(Letter : TLetter);
    procedure UpdateLetter(Letter : TLetter);
    property  FaxDefaultLayout : string read GetFaxDefaultLayout;
    property  PrintDefaultLayout : string read GetPrintDefaultLayout;
    property  OldDatabase : Boolean read GetOldDatabase;
  end;

var
  dmLetter: TdmLetter;

implementation
uses
  PBDatabase;
{$R *.DFM}

{ TdmLetter }

procedure TdmLetter.AddLetter(Letter: TLetter);
var
  i : integer;
  s : string;
begin
  if Letter.IsDefault then { reset flag in database for this letter type }
    dmLetter.ClearLetterDefaults(Letter.LetterType);
  with qryAddLetter do
  begin
    ParamByName('LetterName').AsString := Letter.Name;
    ParamByName('LetterType').AsInteger := Letter.LetterType;
    ParamByName('Default').AsString := BoolToChar(Letter.IsDefault);
    ParamByName('TabUnit').AsString := Letter.TabUnit;
    ParamByname('TabStop1').AsFloat := Letter.TabStop1;
    ParamByname('TabStop2').AsFloat := Letter.TabStop2;
    for i := Low(Letter.FontArray) to High(Letter.FontArray) do
    begin
      s := 'Font' + IntToStr(i);
      ParamByName(s + 'Name').AsString  := Letter.FontArray[i].FontName;
      ParamByName(s + 'Size').AsInteger := Letter.FontArray[i].FontSize;
      ParamByName(s + 'Style').AsInteger:= Letter.FontArray[i].FontStyle;
      Application.ProcessMessages;
    end;
    ExecSQL;
  end;
  with ADOAddElement, Parameters do
  begin
    ParamByName('LetterName').Value := Letter.Name;
    for i := 0 to Pred(Letter.Elements.Count) do
    begin
      with Letter.Elements[i] do
      begin
        ParamByName('BlankAfter').Value := BoolToChar(BlankAfter);
        ParamByName('BlankBefore').Value:= BoolToChar(BlankBefore);
        ParamByName('ElementName').Value:= Name;
        ParamByName('Column').Value     := Column;
        ParamByName('DbData').Value     := BoolToChar(DbData);
        ParamByName('Fixed').Value      := BoolToChar(Fixed);
        ParamByName('FontNo').Value     := FontNo;
        ParamByName('FontSize').Value   := FontSize;
        ParamByName('FontStyle').Value  := FontStyle;
        ParamByName('Font2No').Value    := Font2No;
        ParamByName('Font2Size').Value  := Font2Size;
        ParamByName('Font2Style').Value := Font2Style;
        ParamByName('Left').Value       := Left;
        ParamByName('Number').Value     := Number;
        ParamByName('Printed').Value    := BoolToChar(Printed);
        ParamByName('PrintOrder').Value := PrintOrder;
        ParamByName('Text').Value       := Text;
        ParamByName('UsesTab').Value    := UsesTab;
        ParamByName('Width').Value      := Width;
        case Alignment of
        taLeftJustify  : ParamByName('Alignment').Value := 'L';
        taRightJustify : ParamByName('Alignment').Value := 'R';
        taCenter       : ParamByName('Alignment').Value := 'C';
        end;  { case }
        ParamByName('Detailed').Value   := Detailed;
      end;
      ExecSQL;
      Application.ProcessMessages;
    end;
  end;
end;


function TdmLetter.BoolToChar(const B: Boolean): char;
begin
  if B then
    Result := 'Y'
  else
    Result := 'N';
end;

function TdmLetter.GetLetterLayoutList(
  const LetterType: integer): TStringList;
begin
  Result := TStringList.Create;
  with qryLayouts do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tb_LetterLayout WHERE f_LetterType = ' +
      IntToStr(LetterType));
    Open;
    while not EOF do
    begin
      Result.Add(FieldByName('f_LetterName').AsString);
      Next;
    end;
    Close;
  end;
end;

function TdmLetter.GetPageLayoutList: TStringList;
begin
  Result := TStringList.Create;
  with qryLayouts do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tb_PageLayout');
    Open;
    while not EOF do
    begin
      Result.Add(FieldByName('f_PageLayoutName').AsString);
      Next;
    end;
    Close;
  end;
end;

function TdmLetter.GetExportFilters: TStringList;
begin
  Result := TStringList.Create;
  with qryExportFilter do
  begin
    Close;
    Open;
    while not EOF do
    begin
      Result.Add(FieldByName('Description').AsString);
      Next;
    end;
  end;
end;

function TdmLetter.GetExportFilterDescr(sCode: string): String;
begin
  with qryGetExportFilter do
  begin
    Close;
    parambyname('Exportfilter').asstring := sCode;
    Open;
    if recordcount = 0 then
      Result := ''
    else
      Result := fieldbyname('Description').asstring;
  end;
end;

function TdmLetter.GetExportFilterCode(icount: integer): string;
begin
  with qryExportFilter do
  begin
    first;
    moveby(icount);
    Result := fieldbyname('ExportFilter').asstring;
  end;
end;

procedure TdmLetter.SoftLoadLetter(Letter: TLetter);
var
  i : integer;
  s : string;
  element : TElement;
begin
  Letter.Clear;
  with qryLetter do
  begin
    Close;
    ParamByName('Name').AsString := Letter.Name;
    Open;
    if RecordCount = 0 then
    begin
      Close;
      Exit;
    end;
    Letter.LetterType := FieldByName('f_LetterType').AsInteger;
    Letter.IsDefault  := FieldByName('f_LetterTypeDefault').AsString = 'Y';
    Letter.TabUnit := FieldByName('f_TabUnit').AsString;
    if Letter.TabUnit = '' then
      Letter.TabUnit := sInches;
    Letter.TabStop1 := FieldByName('f_TabStop1').AsFloat;
    Letter.TabStop2 := FieldByName('f_TabStop2').AsFloat;
    if Letter.TabStop1 = 0 then
      Letter.TabStop1 := DefaultTab1;
    if Letter.TabStop2 = 0 then
      Letter.TabStop2 := DefaultTab2;
    for i := Low(Letter.FontArray) to High(Letter.FontArray) do
    begin
      s := 'f_Font' + IntToStr(i);
      Letter.FontArray[i].FontName := FieldByName(s + 'Name').AsString;
      Letter.FontArray[i].FontSize := FieldByName(s + 'Size').AsInteger;
      Letter.FontArray[i].FontStyle := FieldByName(s + 'Style').AsInteger;
      Application.ProcessMessages;
    end;
    Close;
  end;
  with qryElement do
  begin
    Close;
    ParamByName('Name').AsString := Letter.Name;
    Open;
    while not EOF do
    begin
      element := TElement.Create(Letter);
      with element do
      begin
        BlankAfter := FieldByName('f_BlankAfter').AsString = 'Y';
        BlankBefore:= FieldByName('f_BlankBefore').AsString = 'Y';
        Column     := FieldByName('f_Column').AsInteger;
        DbData     := FieldByName('f_DbData').AsString = 'Y';
        Fixed      := FieldByName('f_Fixed').AsString = 'Y';
        FontNo     := FieldByName('f_FontNo').AsInteger;
        FontSize   := FieldByName('f_FontSize').AsInteger;
        FontStyle  := FieldByName('f_FontStyle').AsInteger;
        if  FieldByName('f_Font2No').IsNull then
        begin
          Font2No    := FontNo;
          Font2Size  := FontSize;
          Font2Style := FontStyle;
        end
        else
        begin
          Font2No    := FieldByName('f_Font2No').AsInteger;
          Font2Size  := FieldByName('f_Font2Size').AsInteger;
          Font2Style := FieldByName('f_Font2Style').AsInteger;
        end;
        Left       := FieldByName('f_Left').AsInteger;
        Name       := FieldByName('f_ElementName').AsString;
        Number     := FieldByName('f_Number').AsInteger;
        Printed    := FieldByName('f_Printed').AsString = 'Y';
        PrintOrder := FieldByName('f_PrintOrder').AsInteger;
        Text       := FieldByName('f_Text').AsString;
        UsesTab    := FieldByName('f_UsesTab').AsString;
        Width      := FieldByName('f_Width').AsInteger;
        Detailed   := FieldByName('f_Detailed').AsString;
        ShowDetailed := FieldByName('F_ShowDetailed').AsString = 'Y';
        if FieldByName('f_Alignment').IsNull then
          Alignment := taLeftJustify
        else
        case FieldByName('f_Alignment').AsString[1] of
        'R' : Alignment := taRightJustify;
        'C' : Alignment := taCenter;
        else  Alignment := taLeftJustify;
        end;  { case }
      end;
      Letter.Elements.Add(element);
      Next;
      Application.ProcessMessages;
    end;
    Close;
  end;
end;

procedure TdmLetter.UpdateLetter(Letter: TLetter);
var
  i : integer;
  s : string;
begin
  if Letter.IsDefault then { reset flag in database for this letter type }
    ClearLetterDefaults(Letter.LetterType);
  with qryUpdLetter do
  begin
    ParamByName('Name').AsString := Letter.Name;
    ParamByName('Default').AsString := BoolToChar(Letter.IsDefault);
    ParamByName('TabUnit').AsString := Letter.TabUnit;
    ParamByname('TabStop1').AsFloat := Letter.TabStop1;
    ParamByname('TabStop2').AsFloat := Letter.TabStop2;    
    for i := Low(Letter.FontArray) to High(Letter.FontArray) do
    begin
      s := 'Font' + IntToStr(i);
      ParamByName(s + 'Name').AsString  := Letter.FontArray[i].FontName;
      ParamByName(s + 'Size').AsInteger := Letter.FontArray[i].FontSize;
      ParamByName(s + 'Style').AsInteger:= Letter.FontArray[i].FontStyle;
      Application.ProcessMessages;
    end;
    ExecSQL;
  end;
  with ADOUpdElement, Parameters do
  begin
    ParamByName('Name').Value := Letter.Name;
    for i := 0 to Pred(Letter.Elements.Count) do
    begin
      with Letter.Elements[i] do
      begin
        ParamByName('BlankAfter').Value := BoolToChar(BlankAfter);
        ParamByName('BlankBefore').Value:= BoolToChar(BlankBefore);
        ParamByName('EName').Value      := Name;
        ParamByName('Column').Value     := Column;
        ParamByName('DbData').Value     := BoolToChar(DbData);
        ParamByName('Fixed').Value      := BoolToChar(Fixed);
        ParamByName('FontNo').Value     := FontNo;
        ParamByName('FontSize').Value   := FontSize;
        ParamByName('FontStyle').Value  := FontStyle;
        ParamByName('Font2No').Value    := Font2No;
        ParamByName('Font2Size').Value  := Font2Size;
        ParamByName('Font2Style').Value := Font2Style;
        ParamByName('Left').Value       := Left;
        ParamByName('Number').Value     := Number;
        ParamByName('Printed').Value    := BoolToChar(Printed);
        ParamByName('PrintOrder').Value := PrintOrder;
        ParamByName('Text').Value       := Text;
        ParamByName('UsesTab').Value    := UsesTab;
        ParamByName('Width').Value      := Width;
        case Alignment of
        taLeftJustify  : ParamByName('Alignment').Value := 'L';
        taRightJustify : ParamByName('Alignment').Value := 'R';
        taCenter       : ParamByName('Alignment').Value := 'C';
        end;  { case }
        ParamByName('Detailed').Value   := Detailed;
      end;
      ExecSQL;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TdmLetter.ADOConnBeforeConnect(Sender: TObject);
var
  uName, pWord, alias : string;
begin
  if OldDatabase then
    Exit;
  uName := dmBroker.UserName;
  pWord := dmBroker.Password;
  alias := dmBroker.PBLDatabase.ConnectionDefName + 'ADO';
  with ADOConn do
  begin
    ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;' +
      'User ID=' + uName + '; Password=' + pWord + ';' +
      'Data Source=' + alias + ';Connect Timeout=15';
  end;
end;

procedure TdmLetter.HardLoadLetter(Letter: TLetter);
begin
  { For the existing installations, we want to be able to upgrade the
    Broker software but not do the database, ADO and ODBC changes we
    also need.  This procedure builds letter objects without using
    the database.  The resulting letters are in the format currently
    used by Forms Technology. }
  Letter.Clear;
  Letter.IsDefault := true;
  if Letter.Name = 'Enquiry' then
    HardLoadEnquiry(Letter)
  else
  if Letter.Name = 'Quotation' then
    HardLoadQuotation(Letter)
  else
  if Letter.Name = 'Purchase Order' then
    HardLoadPurchaseOrder(Letter)
  else
  if Letter.Name = 'Acknowledgement' then
    HardLoadAcknowledgement(Letter)
  else
  if Letter.Name = 'Quotation Summary' then
    HardLoadQuotationSummary(Letter);
end;

procedure TdmLetter.LoadLetter(Letter: TLetter);
begin
  if OldDatabase then
    HardLoadLetter(Letter)
  else
    SoftLoadLetter(Letter);
{$IFDEF DEBUG}
  Letter.Dump;
{$ENDIF}
end;

procedure TdmLetter.HardLoadAcknowledgement(Letter: TLetter);
begin
  with Letter do
  begin
    LetterType := ltAcknowledgement;
    IsDefault := true;
    TabUnit := sInches;
    TabStop1 := DefaultTab1;
    TabStop2 := DefaultTab2;
    FontArray[1].FontName := 'Times New Roman';
    FontArray[1].FontSize := 12;
    FontArray[1].FontStyle := 0;
  end;
  CreateElements(Letter, cHardCodedAcknowledgement, AcknowledgementElements);
end;

procedure TdmLetter.HardLoadEnquiry(Letter: TLetter);
begin
  with Letter do
  begin
    LetterType := ltEnquiry;
    IsDefault := true;
    TabUnit := sInches;
    TabStop1 := DefaultTab1;
    TabStop2 := DefaultTab2;
    FontArray[1].FontName := 'Times New Roman';
    FontArray[1].FontSize := 12;
    FontArray[1].FontStyle := 0;
  end;
  CreateElements(Letter, cHardCodedEnquiry, EnquiryElements);
end;

procedure TdmLetter.HardLoadPurchaseOrder(Letter: TLetter);
begin
  with Letter do
  begin
    LetterType := ltPurchaseOrder;
    IsDefault := true;
    TabUnit := sInches;
    TabStop1 := DefaultTab1;
    TabStop2 := DefaultTab2;
    FontArray[1].FontName := 'Times New Roman';
    FontArray[1].FontSize := 12;
    FontArray[1].FontStyle := 0;
  end;
  CreateElements(Letter, cHardCodedPurchaseOrder, PurchaseOrderElements);
end;

procedure TdmLetter.HardLoadQuotation(Letter: TLetter);
begin
  with Letter do
  begin
    LetterType := ltQuotation;
    IsDefault := true;
    TabUnit := sInches;
    TabStop1 := DefaultTab1;
    TabStop2 := DefaultTab2;
    FontArray[1].FontName := 'Times New Roman';
    FontArray[1].FontSize := 12;
    FontArray[1].FontStyle := 0;
  end;
  CreateElements(Letter, cHardCodedQuotation, QuotationElements);
end;

procedure TdmLetter.AddElement(Letter: TLetter;
      const aNumber, aPrintOrder, aColumn, aLeft, aWidth, aStyle : integer;
      const aName, aText : string;
      const isDbData, isFixed, isPrinted : integer;
      const anAlignment : char);
var
  element : TElement;
begin
  element := TElement.Create(Letter);
  with element do
  begin
    if (Letter.LetterType = ltEnquiry) then
      BlankAfter := not (aNumber in [ecArtwork, ecQuantities])
    else
    if (Letter.LetterType = ltQuotation) then
      BlankAfter := not (aNumber = qcArtwork)
    else
    if (Letter.LetterType = ltPurchaseOrder) then
      BlankAfter := not (aNumber = pcArtwork)
    else
    if (Letter.LetterType = ltAcknowledgement) then
      BlankAfter := not (aNumber = acArtwork);

    if (Letter.LetterType = ltEnquiry) then
      BlankBefore := (aNumber = ecAdditionalDetails)
    else
    if (Letter.LetterType = ltQuotation) then
      BlankBefore := (aNumber = qcAdditionalDetails)
    else
    if (Letter.LetterType = ltPurchaseOrder) then
      BlankBefore := (aNumber = pcAdditionalDetails)
    else
    if (Letter.LetterType = ltAcknowledgement) then
      BlankBefore := (aNumber = acAdditionalDetails);

    Column := aColumn;
    DbData := isDbData = 1;
    Fixed := isFixed = 1;
    FontNo := 1;
    FontSize := 12;
    FontStyle := aStyle;
    Font2No := 1;
    Font2Size := 12;
    Font2Style := aStyle;
    Left := aLeft;
    Name := aName;
    Number := aNumber;
    Printed := isPrinted = 1;
    PrintOrder := aPrintOrder;
    Text := aText;
    Width := aWidth;
    case anAlignment of
    'L' : Alignment := taLeftJustify;
    'R' : Alignment := taRightJustify;
    'C' : Alignment := taCenter;
    'X' :
    begin
      Alignment := taLeftJustify;
      UsesTab := '1';
    end;
    end;  { case }
  end;
{$IFDEF DEBUG}
  element.Dump;
{$ENDIF}
  Letter.Elements.Add(element);
end;

procedure TdmLetter.CreateElements(Letter: TLetter;
  HardCodedArray: array of THardCoded; StringArray: array of string);
var
  i : integer;
begin
  for i := Low(HardCodedArray) to High(HardCodedArray) do
    with HardCodedArray[i] do
      AddElement(Letter, N, P, C, L, W, S, StringArray[i], T, D, F, O, A);
end;

function TdmLetter.GetFaxDefaultLayout: string;
begin
  with qryLayouts do
  try
    Close;
    SQL.Clear;
    SQL.Add('SELECT f_PageLayoutName FROM tb_PageLayout');
    SQL.Add('WHERE f_FaxDefault = ''Y''');
    Open;
    if RecordCount = 0 then
      Result := 'Blank'
    else
      Result := Fields[0].AsString;
    Close;
  except
    Result := 'Blank';
  end;
end;

procedure TdmLetter.ClearLetterDefaults(const LetterType: integer);
begin
  with qryDefaults do
  begin
    ParamByName('Type').AsInteger := LetterType;
    ExecSQL;
  end
end;

function TdmLetter.GetPrintDefaultLayout: string;
begin
  with qryLayouts do
  try
    Close;
    SQL.Clear;
    SQL.Add('SELECT f_PageLayoutName FROM tb_PageLayout');
    SQL.Add('WHERE f_PrintDefault = ''Y''');
    Open;
    if RecordCount = 0 then
      Result := 'Blank'
    else
      Result := Fields[0].AsString;
    Close;
  except
    Result := 'Blank';
  end;
end;

function TdmLetter.GetLetterDefault(const LetterType: integer): string;
begin
  with qryLayouts do
  try
    Close;
    SQL.Clear;
    SQL.Add('SELECT f_LetterName FROM tb_LetterLayout ' +
            'WHERE f_LetterType = ' + IntToStr(LetterType) +
            ' and f_LetterTypeDefault = ''Y''');
    Open;
    Result := Fields[0].AsString;
    Close;
  except
    case LetterType of
    ltEnquiry         : Result := 'Enquiry';
    ltQuotation       : Result := 'Quotation';
    ltPurchaseOrder   : Result := 'Purchase Order';
    ltAcknowledgement : Result := 'Acknowledgement';
    ltQuotationSummary: Result := 'Quotation Summary';
    end;
  end;
end;

procedure TdmLetter.HardLoadQuotationSummary(Letter: TLetter);
begin
  with Letter do
  begin
    LetterType := ltQuotationSummary;
    IsDefault := true;
    TabUnit := sInches;
    TabStop1 := DefaultTab1;
    TabStop2 := DefaultTab2;
    FontArray[1].FontName := 'Times New Roman';
    FontArray[1].FontSize := 12;
    FontArray[1].FontStyle := 0;
  end;
  CreateElements(Letter, cHardCodedQuotationSummary, QuotationSummaryElements);
end;

function TdmLetter.GetOldDatabase: Boolean;
begin
  { See if this datbase has the required tables }
  if not FDatabaseOpened then
  with qryLayouts do
  try
    FDatabaseOpened := true;
    Close;
    SQL.Clear;
    SQL.Add('SELECT f_LetterTypeDefault FROM tb_LetterLayout');
    Open;
    FOldDatabase := false;
    Close;
  except
    FOldDatabase := true;
  end;
  Result := FOldDatabase;
end;

end.

