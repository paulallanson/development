unit STRPPOAck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, StdCtrls, CCSPrint, gtQrCtrls;

type
  TSTRPPOAckFrm = class(TForm)
    PurchOrdQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    pogroupheader: TQRGroup;
    QRLabel2: TgtQRLabel;
    QRLabel1: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    LineQrLabel: TgtQRLabel;
    PartQRLabel: TgtQRLabel;
    DescQRLabel: TgtQRLabel;
    OrdQtyQRLabel: TgtQRLabel;
    GetOrdDetQuery: TQuery;
    GetRecOrdQuery: TQuery;
    GetDelFromSuppQuery: TQuery;
    UpdStatusQuery: TQuery;
    GetDetsQuery: TQuery;
    GetOrdHedQuery: TQuery;
    GetDelFromStoreQuery: TQuery;
    GetPFJQuery: TQuery;
    SAddr5QRLabel: TgtQRLabel;
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
    SAddr1QRLabel: TgtQRLabel;
    SAddr2QRLabel: TgtQRLabel;
    SAddr3QRLabel: TgtQRLabel;
    SAddr4QRLabel: TgtQRLabel;
    SAddr6QRLabel: TgtQRLabel;
    GetDelivAddQuery: TQuery;
    POrdLineNoQRLabel: TgtQRLabel;
    PartCodeQRLabel: TgtQRLabel;
    PartDescrQRLabel: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLblValue: TgtQRLabel;
    GetSODelAddQuery: TQuery;
    CompSRC: TDataSource;
    GetCompSQL: TQuery;
    qryExtraCharges: TQuery;
    QRSubDetail2: TQRSubDetail;
    qrlblDetails: TgtQRLabel;
    qrlblExChrgAmount: TgtQRLabel;
    OrdNumQRLabel: TgtQRLabel;
    OrdDateQRLabel: TgtQRLabel;
    PurchOrdDateQRLabel: TgtQRLabel;
    QRShape3: TgtQRShape;
    PurchOrdDescrQRLabel: TgtQRLabel;
    qrlblContact: TgtQRLabel;
    GetNarrSQL: TQuery;
    DellAddmemo: TQRMemo;
    AddressSRC: TDataSource;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    gtQRShape3: TgtQRShape;
    gtQRLabel7: TgtQRLabel;
    qrlblNotes: TgtQRLabel;
    PackQTYQrLabel: TgtQRLabel;
    qrlblSuppliedQty: TgtQRLabel;
    QRBand1: TQRBand;
    TotalQRLabel: TgtQRLabel;
    OrderValQRLabel: TgtQRLabel;
    PurchPriceQrLabel: TgtQRLabel;
    PackSizeQRLabel: TgtQRLabel;
    OrigPurchPriceQrLabel: TgtQRLabel;
    qrlblPackSize: TgtQRLabel;
    function GetDetails(Sender: TObject): Integer;
    function RunReport(Sender: TObject): Integer;
    procedure StartReport(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure pogroupheaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FooterQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PurchOrdQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure BuildSpecialNotes(iNarrative: integer);
    { Private declarations }
  public
    { Public declarations }
    PONumber: integer;
    RePRint, Preview, FaxIt, PrintLogo: ByteBool;
    SuppName, SuppFax : String;
    PackSize, QtyOrd : Integer;
    iIntSelCode: Integer ;
    TotOrdVal : Real;
    PrinterSettings: TPrinterSettings;
    end;

var
  STRPPOAckFrm: TSTRPPOAckFrm;

implementation

uses pbMainMenu, CCSCommon;

{$R *.DFM}

{ TClPurOrdRepForm }

function TSTRPPOAckFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetOrdHedQuery do
  begin
    Close;
    ParamByName('Purch_Ord').AsInteger := PONumber;
    Open;
    Result := RecordCount;
  end;
end;

function TSTRPPOAckFrm.RunReport(Sender: TObject): Integer;
begin
  Result := 0;
  StartReport(self);
end;

procedure TSTRPPOAckFrm.StartReport(Sender: TObject);
begin
  if Preview then
  begin
     PurchOrdQuickReport.Preview;
  end
  else
  begin
    if not FaxIt then
    begin
      {Select the printer};
      PurchOrdQuickReport.PrinterSetup;
      if PurchOrdQuickReport.Tag <> 0 then
        Exit;
    end;
    PurchOrdQuickReport.Print;
  end;
end;

procedure TSTRPPOAckFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if (not Preview ) then
  with UpdStatusQuery do
   begin
    {update statuses depending on whether its a re-print};
    Close;
    ExecSQL;
   end;
   With GetDetsQuery do
    begin
        POrdLineNoQRLabel.Caption := IntToStr(FieldByName('Purch_Ord_Line_No').AsInteger);
        PartCodeQRLabel.Caption := FieldByName('Part').AsString;
        PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString;
        PurchPriceQRLabel.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(FieldByName('Purchase_Price').AsCurrency));
        if FieldByName('Original_Purchase_Price').asfloat = 0 then
          OrigPurchPriceQRLabel.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(FieldByName('Purchase_Price').AsCurrency))
        else
          OrigPurchPriceQRLabel.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(FieldByName('Original_Purchase_Price').AsCurrency));
//        QRLblCost.Caption := CurrencyDisp(FloatToStr(FieldByName('Cost_Price').AsCurrency));
//        DateDelivExpQRLabel.Caption := DateToStr(FieldByName('Date_Deliv_Expected').AsDateTime);
    end;
      QtyOrd := GetdetsQuery.FieldByName('Quantity_Ordered').AsInteger;
      Packsize := GetDetsQuery.FieldByName('Original_Purch_Pack_Qty').AsInteger;
      if PackSize = 0 then
        PackSize := GetDetsQuery.FieldByName('Purch_Pack_Quantity').AsInteger;
      PackQTYQrLabel.Caption := ShowInPacks(QtyOrd,Packsize);
      PackSizeQRLabel.Caption := IntToStr(Packsize) ;
      qrlblSuppliedQty.Caption := ShowInPacks(GetdetsQuery.FieldByName('Quantity_Received').AsInteger,GetdetsQuery.FieldByName('Purch_Pack_Quantity').AsInteger);
      qrlblPackSize.Caption := GetDetsQuery.fieldbyname('Purch_Pack_Quantity').asstring ;
      QRLblValue.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr((GetdetsQuery.FieldByName('Quantity_Received').AsInteger * GetDetsQuery.FieldByName('Purchase_Price').AsFloat)/GetdetsQuery.FieldByName('Purch_Pack_Quantity').AsInteger));
      if GetdetsQuery.FieldByName('Replacement_For_Line').AsInteger <> 0 then
        qrlblNotes.Caption := 'Substitute Part for Line ' + inttostr(GetdetsQuery.FieldByName('Replacement_For_Line').AsInteger)
      else
      if GetdetsQuery.FieldByName('Product_Status').asstring <> '' then
        begin
          if GetdetsQuery.FieldByName('Product_Status').asstring = 'PDC' then
            qrlblNotes.Caption := 'Product Discontinued'
        end
      else
        begin
          qrlblNotes.Caption := '';
          if (trim(PackQTYQrLabel.Caption) <> trim(qrlblSuppliedQty.Caption)) or
              (trim(PackSizeQRLabel.Caption) <> trim(qrlblPackSize.Caption)) or
              (trim(PurchPriceQRLabel.Caption) <> trim(OrigPurchPriceQRLabel.Caption)) then
            qrlblNotes.caption := '***'

        end;
  end;

procedure TSTRPPOAckFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount: integer;
begin
  with GetDetsQuery do
  begin
    Close;
    ParamByName('Purch_Ord_No').AsString :=  GetOrdHedQuery.FieldByName('Purch_Ord_No').AsString;
    Open;
  end;

//  SpecialNotesmemo.Lines.clear;

//  BuildSpecialNotes(GetDetsQuery.fieldbyname('Narrative').asinteger);

  with GetDelivAddQuery do
    begin
      close;
      ParamByName('Purch_Ord_No').AsString :=  GetOrdHedQuery.FieldByName('Purch_Ord_No').AsString;
      Open;
      First ;

      SAddr1QRLabel.Caption := FieldByName('SuppNam').AsString ;
      SAddr2QRLabel.Caption := FieldByName('Name').AsString ;
      SAddr3QRLabel.Caption := FieldByName('Building_No_Name').AsString ;
      SAddr4QRLabel.Caption := FieldByName('Street').AsString ;
      if Trim(FieldByName('Locale').AsString) <> '' then
        SAddr5QRLabel.Caption := Trim(FieldByName('Locale').AsString) + ', ' +
                                   Trim(FieldByName('Town').AsString)
      else
        SAddr5QRLabel.Caption := Trim(FieldByName('Town').AsString) ;

      SAddr6QRLabel.Caption := FieldByName('PostCode').AsString ;
//      SEmailLegQRLabel.Visible := True ;

//      SPhoneQRLabel.Caption := FieldByName('SuppAdd5').AsString ;
//      SFaxQRLabel.Caption := FieldByName('SuppAdd6').AsString ;
//      SEmailQRLabel.Caption := FieldByName('SuppAdd7').AsString ;
    end;

  with GetDetsQuery do
    begin
      OrdNumQRLabel.Caption := FieldByName('OrdNum').AsString;
      PurchOrdDateQRLabel.Caption := DateToStr(FieldByName('Purch_Ord_Date').AsDateTime);
      PurchOrdDescrQRLabel.Caption := FieldByName('Purch_Ord_Descr').AsString;

      if fieldbyname('Sales_Order').asinteger <> 0 then
        begin
          GetSODelAddQuery.close;
          GetSODelAddQuery.parambyname('Sales_Order').asinteger := GetDetsQuery.fieldbyname('Sales_Order').asinteger;
          GetSODelAddQuery.open;

          qrlblContact.caption := GetSODelAddQuery.FieldByName('Contact_Name').AsString ;
          AddressSRC.DataSet := GetSODelAddQuery;

          for icount := 0 to 6 do
          begin
            if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
            DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
          end;
//          DPhoneQRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd6').AsString ;
//          DFaxQRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd7').AsString ;

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

//          DPhoneQRLabel.Caption := FieldByName('DelAdd5').AsString ;
//          DFaxQRLabel.Caption := FieldByName('DelAdd6').AsString ;
        end;
    end;

  with qryExtraCharges do
  begin
    close;
    ParamByName('Purch_Ord_no').AsString := GetOrdHedQuery.FieldByName('Purch_Ord_No').AsString;
    open;
    qrsubdetail2.Enabled := (recordcount > 0);
  end;
end;

procedure TSTRPPOAckFrm.FormCreate(Sender: TObject);
begin
  GetDetsQuery.SQL := GetOrdDetQuery.SQL;
  GetDetsQuery.Params := GetOrdDetQuery.Params;
  GetDetsQuery.FieldDefs := GetOrdDetQuery.FieldDefs;

  GetDelivAddQuery.SQL := GetDelFromSuppQuery.SQL;
  GetDelivAddQuery.Params := GetDelFromSuppQuery.Params;
end;

procedure TSTRPPOAckFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotOrdval := TotOrdval + (GetdetsQuery.FieldByName('Quantity_Received').AsInteger * GetDetsQuery.fieldByname('Purchase_Price').AsFloat/GetdetsQuery.FieldByName('Purch_Pack_Quantity').AsInteger);
end;

procedure TSTRPPOAckFrm.FooterQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 Totordval := 0.
end;

procedure TSTRPPOAckFrm.PurchOrdQuickReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with PurchOrdQuickReport.PrinterSettings do
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

procedure TSTRPPOAckFrm.QRSubDetail2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotOrdval := TotOrdval + (qryExtraCharges.fieldByname('Amount').AsFloat);
end;

procedure TSTRPPOAckFrm.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qryExtraCharges do
  begin
    qrlblDetails.Caption := FieldByName('Details').AsString;
    qrlblExChrgAmount.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(FieldByName('Amount').AsCurrency));
  end;
end;

procedure TSTRPPOAckFrm.BuildSpecialNotes(iNarrative : integer);
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
//  SpecialNotesMemo.Lines.Clear;
//  SpecialNotesMemo.Lines.Text := aStr;

//  lblSpecialNotes.enabled  := (trim(aStr) <> '');
end;

procedure TSTRPPOAckFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  OrderValQRLabel.Caption:= FormatFloat('£######0.00',Totordval)
end;

end.
