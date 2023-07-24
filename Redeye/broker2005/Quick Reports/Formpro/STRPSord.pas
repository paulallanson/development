unit STRPSord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, StdCtrls, qrprntr,
  printers;

type
  TSTRPSordFrm = class(TForm)
    SalesOrdQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    FooterQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    QRSubDetail1: TQRSubDetail;
    pogroupheader: TQRGroup;
    GetDetsQuery: TQuery;
    GetOrdHedQuery: TQuery;
    PackqtyQRLabel: TQRLabel;
    SOrdLineNoQRLabel: TQRLabel;
    PartCodeQRLabel: TQRLabel;
    PartDescrQRLabel: TQRLabel;
    SellPriceQRLabel: TQRLabel;
    PackSizeQRLabel: TQRLabel;
    QRLblValue: TQRLabel;
    GetSOAddQuery: TQuery;
    ReportImage: TQRImage;
    CompSRC: TDataSource;
    GetCompSQL: TQuery;
    QRMemoAddress: TQRMemo;
    CustSQL: TQuery;
    AddressSRC: TDataSource;
    ExtChrgsQuery: TQuery;
    AddChargesBand: TQRSubDetail;
    ExtChrgVatQRlbl: TQRLabel;
    QRLblDetails: TQRLabel;
    QRLblamt: TQRLabel;
    QRLabel14: TQRLabel;
    GoodsValueLbl: TQRLabel;
    QRLabel15: TQRLabel;
    VATValueLbl: TQRLabel;
    TotalValueLbl: TQRLabel;
    QRLabel16: TQRLabel;
    VatQRLabel: TQRLabel;
    GetContactSQL: TQuery;
    lblSpecialNotes: TQRLabel;
    SpecialNotesMemo: TQRMemo;
    GetNarrSQL: TQuery;
    ReportTitleQRLabel: TQRLabel;
    OrdNumQRLabel: TQRLabel;
    OrdDateQRLabel: TQRLabel;
    SalesOrdDateQRLabel: TQRLabel;
    CustomerAddmemo: TQRMemo;
    QRLblWho: TQRLabel;
    QRLblCntct: TQRLabel;
    QRLblCustRef: TQRLabel;
    QRLblRef: TQRLabel;
    QRLblReqDt: TQRLabel;
    QRLblDtReq: TQRLabel;
    QRLabel5: TQRLabel;
    DellAddmemo: TQRMemo;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    QRLabel3: TQRLabel;
    DescQRLabel: TQRLabel;
    PartQRLabel: TQRLabel;
    LineQrLabel: TQRLabel;
    qrlblSalesOrder: TQRLabel;
    QRLabel2: TQRLabel;
    qryGetProduction: TQuery;
    AdhocSQL: TQuery;
    GetCustSQL: TQuery;
    GetCustHOSQL: TQuery;
    qryGetJobBag: TQuery;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    qryGetJobBagReq: TQuery;
    function GetDetails(Sender: TObject): Integer;
    function RunReport(Sender: TObject): Integer;
    procedure StartReport(Sender: TObject);
    procedure GetAddDetails(Cust,Branch :integer);
    procedure CreateMemo (TempRef: string);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure pogroupheaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure SalesOrdQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure AddChargesBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure BuildSpecialNotes(iNarrative: integer);
    function GetJobBagNumber(tempCode: integer): string;
    { Private declarations }
  public
    { Public declarations }
    RePRint, Preview, FaxIt, PrintLogo: ByteBool;
    SuppName, SuppFax : String;
    PackSize, QtyOrd : Integer;
    iIntSelCode: Integer ;
    TotOrdVal : Real;
    end;

var
  STRPSordFrm: TSTRPSordFrm;

implementation

uses PBSendFax, pbMainMenu, CCSCommon, PBImages;

var
  iGoods, iVAT: Real;


{$R *.DFM}

{ TClPurOrdRepForm }

function TSTRPSordFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetOrdHedQuery do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    Result := RecordCount;
  end;
end;

function TSTRPSordFrm.RunReport(Sender: TObject): Integer;
var
  FaxFound: ByteBool;
begin
  Result := 0;
  If not FaxIt then
  begin
    StartReport(Self)
  end
  else
    {Faxing to all Customers};
    with GetOrdHedQuery do
    begin
      Close;
      Open;
      First;
      while not EOF do
      begin
        if GetDetails(Self) > 0 then
        begin
          GetSOAddQuery.Close;
          GetSOAddQuery.ParamByName('Sel1').AsString := GetOrdHedQuery.FieldByName('Text100').AsString;
          GetSOAddQuery.Open;
          FaxFound :=
            PBSendFaxFrm.OutToFax(GetSOAddQuery.FieldByname('CustAdd6').AsString,
            'SO: ' + GetSOAddQuery.FieldByName('CustNam').AsString, '');
          if not FaxFound then
            begin
              MessageDlg('No fax system installed', mtError, [mbOK], 0);
              Exit;
            end;
//          SalesOrdQuickReport.PrinterSettings.PrinterIndex := FaxFound;
          StartReport(Self);
        end;
        Next;
      end;
end;
end;

procedure TSTRPSordFrm.StartReport(Sender: TObject);
begin
if Preview then
  begin
     SalesOrdQuickReport.Preview;
  end
  else
  begin
    if not FaxIt then
    begin
      {Select the printer};
      SalesOrdQuickReport.PrinterSetup;
      if SalesOrdQuickReport.Tag <> 0 then
        Exit;
    end;
    SalesOrdQuickReport.Print;
  end;
end;

procedure TSTRPSordFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rvatvalue : real;
begin
   With GetDetsQuery do
   begin
    SOrdLineNoQRLabel.Caption := IntToStr(FieldByName('Sales_Order_Line_No').AsInteger);
    PartCodeQRLabel.Caption := FieldByName('Part').AsString;
    PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString;
    SellPriceQRLabel.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(FieldByName('Part_Sales_Price').AsCurrency));
    QtyOrd := FieldByName('Quantity_Ordered').AsInteger + FieldByName('Quantity_Overs').AsInteger;
    Packsize :=FieldByName('Sell_Pack_Quantity').AsInteger;
    PackQTYQrLabel.Caption := ShowInPacks(QtyOrd,Packsize);
    PackSizeQRLabel.Caption := IntToStr(Packsize) ;
    QRLblValue.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr((QtyOrd * GetDetsQuery.FieldByName('Part_Sales_Price').AsFloat)/Packsize));
    iGoods := iGoods + StrToFloat(QRLblValue.Caption);
     rVatValue := StrToFloat(QRLblValue.Caption) *
    (FieldByName('Vat_Rate').AsFloat / 100);
  VatQRLabel.Caption := formatFloat('0.00',rVatValue);
  ivat := ivat + rVatValue;
  end;
end;

procedure TSTRPSordFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount,Cust,Branch: Integer;
  irow: integer;
begin
  iGoods := 0.00;
  iVat := 0.00;

  with GetDetsQuery do
  begin
    Close;
    ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
    Open;
  end;
  CustomerAddMemo.Lines.Clear;
  SpecialNotesmemo.Lines.clear;

  BuildSpecialNotes(GetDetsQuery.FieldByName('Narrative').AsInteger);

  {Get Delivery Details}
  Cust :=  GetDetsQuery.FieldByName('Customer').AsInteger;
  Branch := GetDetsQuery.FieldByName('Branch_No').AsInteger;

  GetAddDetails(Cust,Branch);

  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
//  sPhoneQrLabel.Caption := addressSrc.Dataset.fields[6].AsString;
//  sFaxQRLabel.Caption := addressSrc.Dataset.fields[7].AsString;
//  sEmailQRLabel.Caption := addressSrc.Dataset.fields[8].AsString;
  qrLblCntct.Caption := '';

  qrlblRef.Caption := GetDetsQuery.fieldByName('Cust_Order_No').AsString;

  with getcontactSQL do
  begin
    close;
    paramByname('Customer').asInteger := Cust;
    ParamByName('Branch_No').asInteger := Branch;
    ParamByname('Contact_No').asInteger := GetDetsQuery.fieldByName('Contact_No').Asinteger;
    open;
    QrLblCntct.Caption := GetContactSQL.FieldByName('Contact_Name').asString;
  end;
  DellAddMemo.Lines.Clear;

  if GetDetsQuery.FieldByName('Ad_Hoc_Address').AsString <> '' then
  begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          GetDetsQuery.FieldByName('Ad_Hoc_Address').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := AdhocSQL;
  end
  else
  if (GetDetsQuery.FieldByName('Delivery_Customer').AsString <> '') and
      (GetDetsQuery.FieldByName('Delivery_Customer').AsString <> '0') then
  begin
    with GetCustSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        GetDetsQuery.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        GetDetsQuery.FieldByName('Delivery_Branch').AsInteger;
      Open;
      AddressSRC.Dataset := GetCustSQL;
    end;
//  if head Office department then get head Office address
    if GetCustSQl.fieldbyname('HO_Department').asinteger = 1 then
      begin
        GetCustHOSQL.Close;
        GetCustHOSQL.ParamByName('Customer').AsInteger :=
          GetDetsQuery.FieldByName('Delivery_Customer').AsInteger;
        GetCustHOSQL.ParamByName('Branch_no').AsInteger :=
          GetDetsQuery.FieldByName('Delivery_Branch').AsInteger;
        GetCustHOSQL.Open;
        AddressSRC.Dataset := GetCustHOSQL;
      end;
  end
  else
  {Must be delivery in to production}
  begin
    with qryGetProduction do
      begin
        close;
        parambyname('Production_Location').asinteger := GetDetsQuery.FieldByName('Production_Location').AsInteger;
        open;
        AddressSRC.DataSet := qryGetProduction;
      end;

    ReportTitleQRlabel.caption := 'Stock Request';
    qrlblSalesOrder.caption := 'Stock Request';
    qrlblCustRef.caption := 'Job Bag Number';
    qrlblRef.caption := GetJobBagNumber(GetDetsQuery.fieldbyname('OrdNum').asinteger);

    qrlblWho.enabled := false;
    qrlblCntct.enabled := false;
  end;
  {Build the Address Memo field}
  for irow := 0 to 6 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then
      continue;
    if (irow = 1) and (AddressSRC.dataset.FieldByName('HO_Department').asinteger = 0) then
      continue;
    DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;

(*  CustSQL.Close;
  CustSQL.ParamByName('Customer').AsInteger :=
    getDetsQuery.FieldByName('Delivery_Customer').AsInteger;
  CustSql.ParamByName('Branch_No').AsInteger :=
    getDetsQuery.FieldByName('Delivery_Branch').AsInteger;
  CustSQL.Open;
  CreateMemo(custsql.fieldbyname('Customer_Name').AsString);
  CreateMemo(custsql.fieldbyname('Building_No_Name').AsString);
  CreateMemo(custsql.fieldbyname('Street').AsString);
  CreateMemo(custsql.fieldbyname('Locale').AsString);
  CreateMemo(custsql.fieldbyname('Town').AsString);
  CreateMemo(custsql.fieldbyname('Postcode').AsString);
*)

  With GetDetsQuery do
    begin
    OrdNumQRLabel.Caption := FieldByName('OrdNum').AsString;
    SalesOrdDateQRLabel.Caption := DateToStr(FieldByName('Date_Ordered').AsDateTime);
    QRLblReqDT.Caption := DateToStr(FieldByName('Date_Required').AsDateTime);
  end;

  extChrgsQuery.active := true;
  if ExtChrgsQuery.recordcount = 0 then
    AddChargesBand.enabled := false
  else
    AddChargesBand.enabled := true;
end;

function TSTRPSordFrm.GetJobBagNumber(tempCode: integer): string;
begin
  with qryGetJobBag do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;

      if recordcount > 0 then
        begin
          result := fieldbyname('Job_Bag').asstring;
          exit;
        end;
    end;

  with qryGetJobBagReq do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;

      result := fieldbyname('Job_Bag').asstring;
    end;
end;

procedure TSTRPSordFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotOrdval := TotOrdval + (QtyOrd * GetDetsQuery.fieldByname('Part_Sales_Price').AsFloat/PackSize);
end;

procedure TSTRPSordFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iTotal: Real;
begin
  GoodsValueLbl.Caption := formatfloat('0.00', iGoods);
  VatValueLbl.Caption := formatfloat('0.00', ivat);

  itotal := strtofloat(GoodsValueLbl.Caption) + strtofloat(VatValueLbl.Caption);
  TotalValueLbl.Caption := formatfloat('0.00', iTotal);
end;

procedure TSTRPSordFrm.FooterQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 Totordval := 0.
end;

procedure TSTRPSordFrm.SalesOrdQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
   irow: integer;
begin
  SalesOrdQuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;   {set
the printer to what the user selected}
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  SalesOrdQuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  SalesOrdQuickReport.PrinterSettings.Copies := Copies;   {set the copies }

  ReportImage.enabled := PrintLogo;
//QRMemoAddress.enabled := printlogo;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;
      {Activate the company SQL}
with GetCompSQL do
  begin
    Close;
    Open;
    First;
  end;
QRMemoAddress.lines.Clear;
  {Get the Phone details}
      for irow := 4 to 8 do
        begin
          if Trim(GetCompSQl.Fields[irow].AsString) = '' then Continue;
          QRMemoAddress.Lines.Append(Trim(GetCompSQl.Fields[irow].AsString));
        end;
        {Do phone numbers}
        QRMemoAddress.Lines.Append('');
        if Trim(GetCompSQl.Fields[9].AsString) <> '' then
          QRMemoAddress.Lines.Append('Tel: ' + Trim(GetCompSQl.Fields[9].AsString));

        if Trim(GetCompSQl.Fields[10].AsString) <> '' then
          QRMemoAddress.Lines.Append('Fax: ' + Trim(GetCompSQl.Fields[10].AsString));

        if Trim(GetCompSQl.Fields[11].AsString) <> '' then
          QRMemoAddress.Lines.Append('Email: ' + Trim(GetCompSQl.Fields[11].AsString));
end;

procedure TSTRPSordFrm.GetAddDetails(Cust, Branch: integer);
begin
    begin
      with CustSQl do
      begin
        Close;
        ParamByName('Customer').AsInteger := Cust;
        ParamByName('Branch_no').AsInteger := Branch;
        Open;
      end;
      AddressSRC.Dataset := CustSQL;
end;
end;

procedure TSTRPSordFrm.AddChargesBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 rAddTotal, rVatValue: real;
begin
  rVatValue := (ExtChrgsQuery.Fieldbyname('amount').asfloat
     * (ExtChrgsQuery.FieldByName('Vat_Rate').AsFloat / 100));

  rAddTotal := ExtChrgsQuery.Fieldbyname('Amount').asfloat;

  ivat := ivat + rVatValue;

  iGoods := iGoods + rAddTotal;

  ExtChrgVatQRLbl.Caption := formatFloat('0.00',rVatValue);
  QRlblAmt.caption := formatfloat('0.00',raddtotal);
  qrlblDetails.caption := ExtChrgsQuery.fieldByName('Details').Asstring;
end;

procedure TSTRPSordFrm.CreateMemo(TempRef: string);
var
sAddLine: String;
begin
  sAddLine := '' ;
  sAddLine := Trim(TempRef);
  if sAddLine <> '' then
        DellAddMemo.Lines.Add(sAddLine);
end;

procedure TSTRPSordFrm.BuildSpecialNotes(iNarrative : integer);
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

    lblSpecialNotes.enabled  := (trim(aStr) <> '');
end;

end.
