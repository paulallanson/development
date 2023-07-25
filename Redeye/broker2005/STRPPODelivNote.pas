unit STRPPODelivNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, StdCtrls, CCSPrint;

type
  TSTRPPODelivNoteFrm = class(TForm)
    qrpDetails: TQuickRep;
    PageHeaderQRBand: TQRBand;
    FooterQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    pogroupheader: TQRGroup;
    LineQrLabel: TQRLabel;
    PartQRLabel: TQRLabel;
    DescQRLabel: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    GetOrdDetQuery: TQuery;
    GetDelFromSuppQuery: TQuery;
    GetDetsQuery: TQuery;
    GetOrdHedQuery: TQuery;
    PackqtyQRLabel: TQRLabel;
    GetDelFromSuppQuerySuppNam: TStringField;
    GetDelFromSuppQueryName: TStringField;
    GetDelFromSuppQueryBuilding_No_Name: TStringField;
    GetDelFromSuppQueryStreet: TStringField;
    GetDelFromSuppQueryLocale: TStringField;
    GetDelFromSuppQueryTown: TStringField;
    GetDelFromSuppQueryPostCode: TStringField;
    GetDelFromSuppQueryPhone: TStringField;
    GetDelFromSuppQueryFax_Number: TStringField;
    GetDelFromSuppQueryemail: TStringField;
    POrdLineNoQRLabel: TQRLabel;
    PartCodeQRLabel: TQRLabel;
    PartDescrQRLabel: TQRLabel;
    QRLabel3: TQRLabel;
    PackSizeQRLabel: TQRLabel;
    GetSODelAddQuery: TQuery;
    CompSRC: TDataSource;
    GetCompSQL: TQuery;
    qryExtraCharges: TQuery;
    ReportImage: TQRImage;
    ReportTitleQRLabel: TQRLabel;
    lblSpecialNotes: TQRLabel;
    SpecialNotesMemo: TQRMemo;
    GetNarrSQL: TQuery;
    gtQRShape1: TQRShape;
    AddressSRC: TDataSource;
    gtQRLabel2: TQRLabel;
    DateRequiredLabel: TQRLabel;
    GetDelivAddQuery: TQuery;
    QRLabel2: TQRLabel;
    qrlblContact: TQRLabel;
    QRShape2: TQRShape;
    DellAddmemo: TQRMemo;
    qrlblReferencelabel: TQRLabel;
    qrlblreference: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DPhoneQRLabel: TQRLabel;
    DFaxQRLabel: TQRLabel;
    qrlDelNumber: TQRLabel;
    function GetDetails(Sender: TObject): Integer;
    function RunReport(Sender: TObject): Integer;
    procedure StartReport(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure pogroupheaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FDeliveryNo: integer;
    procedure BuildSpecialNotes(iNarrative: integer);
    procedure SetDeliveryNo(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    Preview, PrintLogo, CustomerLogo: ByteBool;
    PackSize, QtyOrd : Integer;
    iIntSelCode: Integer ;
    PrinterSettings: TPrinterSettings;
    property DeliveryNo: integer read FDeliveryNo write SetDeliveryNo;
  end;

var
  STRPPODelivNoteFrm: TSTRPPODelivNoteFrm;

implementation

uses pbMainMenu, CCSCommon, PBImages, pbDatabase;

{$R *.DFM}

{ TClPurOrdRepForm }

function TSTRPPODelivNoteFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetOrdHedQuery do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    Result := RecordCount;
  end;
end;

function TSTRPPODelivNoteFrm.RunReport(Sender: TObject): Integer;
begin
  Result := 0;
  StartReport(self);

end;

procedure TSTRPPODelivNoteFrm.SetDeliveryNo(const Value: integer);
begin
  FDeliveryNo := Value;
end;

procedure TSTRPPODelivNoteFrm.StartReport(Sender: TObject);
begin
  {Select the printer};
  qrpDetails.PrinterSetup;
  if qrpDetails.Tag <> 0 then
    exit;
  qrpDetails.Print;
end;

procedure TSTRPPODelivNoteFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With GetDetsQuery do
    begin
      POrdLineNoQRLabel.Caption := IntToStr(FieldByName('Purch_Ord_Line_No').AsInteger);
      PartCodeQRLabel.Caption := FieldByName('Part').AsString;
      if fieldbyname('Line_Is_Sample').asstring = 'Y' then
        PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString + ' (SAMPLE)'
      else
        PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString;
    end;
  QtyOrd := GetdetsQuery.FieldByName('Quantity_Ordered').AsInteger;

  Packsize := GetDetsQuery.FieldByName('Purch_Pack_Quantity').AsInteger;
  try
    PackQTYQrLabel.Caption := ShowInPacks(QtyOrd,Packsize);
  except
    PackQTYQrLabel.Caption := '1';
  end;
  PackSizeQRLabel.Caption := IntToStr(Packsize) ;
end;

procedure TSTRPPODelivNoteFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount: integer;
  UseBranchName: boolean;
  tempDir: string;
begin
  with GetDetsQuery do
  begin
    Close;
    ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
    Open;
  end;

  SpecialNotesmemo.Lines.clear;

  BuildSpecialNotes(GetDetsQuery.fieldbyname('Narrative').asinteger);

  DellAddMemo.Lines.Clear;

  with GetDetsQuery do
  begin
    DeliveryNo := Fieldbyname('OrdNum').AsInteger;
    qrlDelNumber.caption := 'Delivery Number: ' + DeliveryNo.ToString;
    DateRequiredLabel.Caption := DateToStr(FieldByName('Date_Required').AsDateTime);

    if fieldbyname('Sales_Order').asinteger <> 0 then
      begin
        GetSODelAddQuery.close;
        GetSODelAddQuery.parambyname('Sales_Order').asinteger := GetDetsQuery.fieldbyname('Sales_Order').asinteger;
        GetSODelAddQuery.open;

//        qrlblContact.caption := GetSODelAddQuery.FieldByName('Contact_Name').AsString ;
        qrlblContact.caption := GetSODelAddQuery.FieldByName('Delivery_Contact_Name').AsString ;

        AddressSRC.DataSet := GetSODelAddQuery;

        UseBranchName := GetSODelAddQuery.FieldByName('Use_Branch_Name').AsString = 'Y';

        {Add contact name}
        if AddressSRC.Dataset.FieldByName('Delivery_Contact_Name').AsString <> '' then
            DellAddMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Delivery_Contact_Name').AsString));

        {If using branch name then add branch name}
        if UseBranchName then
        begin
          if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
            DellAddMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
        end;

        for icount := (1 + integer(UseBranchName)) to 6 do
        begin
          if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
          DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
        end;

        DPhoneQRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd6').AsString ;
        DFaxQRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd7').AsString ;

        qrlblReferenceLabel.Enabled := true;
        qrlblReference.Caption := GetSODelAddQuery.FieldByName('Cust_Order_no').asstring;
      end
    else
      begin
        AddressSRC.DataSet := GetDetsQuery;

        qrlblContact.caption := '';

        for icount := 15 to 22 do
        begin
          if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
          DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
        end;

        DPhoneQRLabel.Caption := FieldByName('DelAdd5').AsString ;
        DFaxQRLabel.Caption := FieldByName('DelAdd6').AsString ;

        qrlblReferenceLabel.Enabled := false;
        qrlblReference.Caption := '';
      end;
  end;

  //detemine whether to print logo
  if CustomerLogo then
    begin
      try
        tempDir := dmBroker.GetCustomerLogoFile(GetSODelAddQuery.fieldbyname('Customer').asinteger);
        ReportImage.Picture.LoadFromFile(tempDir);
      except
        ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
      end;
    end
  else
    ReportImage.Picture := PBImagesFrm.ReportImage.Picture;

  ReportImage.Enabled := PrintLogo;
end;

procedure TSTRPPODelivNoteFrm.FormCreate(Sender: TObject);
begin
  GetDetsQuery.SQL := GetOrdDetQuery.SQL;
  GetDetsQuery.Params := GetOrdDetQuery.Params;
  GetDetsQuery.FieldDefs := GetOrdDetQuery.FieldDefs;
  ReportTitleQRLabel.Caption := '';

  GetDelivAddQuery.SQL := GetDelFromSuppQuery.SQL;
  GetDelivAddQuery.Params := GetDelFromSuppQuery.Params;
  ReportTitleQRLabel.Caption := ReportTitleQRLabel.Caption + 'Delivery Note';
end;

procedure TSTRPPODelivNoteFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qrpDetails.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;  
    OutputBin := PrinterSettings.OutputBin;
  end;


end;

procedure TSTRPPODelivNoteFrm.BuildSpecialNotes(iNarrative : integer);
var
  aStr : string;
begin
  if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
  SpecialNotesMemo.Lines.Clear;
  SpecialNotesMemo.Lines.Text := aStr;

//  lblSpecialNotes.enabled  := (trim(aStr) <> '');
end;

end.
