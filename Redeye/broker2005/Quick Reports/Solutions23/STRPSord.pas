unit STRPSord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, StdCtrls, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPSordFrm = class(TForm)
    SalesOrdQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    FooterQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    QRSubDetail1: TQRSubDetail;
    pogroupheader: TQRGroup;
    OrdDateQRLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    LineQrLabel: TQRLabel;
    PartQRLabel: TQRLabel;
    DescQRLabel: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    GetDetsQuery: TFDQuery;
    GetOrdHedQuery: TFDQuery;
    PackqtyQRLabel: TQRLabel;
    SPhoneQRLabel: TQRLabel;
    SFaxQRLabel: TQRLabel;
    SEmailLegQRLabel: TQRLabel;
    SEmailQRLabel: TQRLabel;
    OrdNumQRLabel: TQRLabel;
    SalesOrdDateQRLabel: TQRLabel;
    PartCodeQRLabel: TQRLabel;
    PartDescrQRLabel: TQRLabel;
    SellPriceQRLabel: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    PackSizeQRLabel: TQRLabel;
    QRLabel12: TQRLabel;
    QRLblValue: TQRLabel;
    GetSOAddQuery: TFDQuery;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
    ReportTitleQRLabel: TQRLabel;
    CustomerAddmemo: TQRMemo;
    CustSQL: TFDQuery;
    AddressSRC: TDataSource;
    ExtChrgsQuery: TFDQuery;
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
    QRLabel2: TQRLabel;
    VatQRLabel: TQRLabel;
    DellAddmemo: TQRMemo;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRLblDtReq: TQRLabel;
    QRLblReqDt: TQRLabel;
    QRLblCustRef: TQRLabel;
    QRLblRef: TQRLabel;
    QRLblWho: TQRLabel;
    QRLblCntct: TQRLabel;
    GetContactSQL: TFDQuery;
    SOrdLineNoQRLabel: TQRLabel;
    QRBand1: TQRBand;
    QRMemoAddress: TQRMemo;
    ReportImage: TQRImage;
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
    { Private declarations }
  public
    { Public declarations }
    RePRint, Preview, FaxIt, PrintLogo: ByteBool;
    SuppName, SuppFax : String;
    PackSize, QtyOrd : Integer;
    iIntSelCode: Integer ;
    TotOrdVal : Real;
    PrinterSettings: TPrinterSettings;
  end;

var
  STRPSordFrm: TSTRPSordFrm;

implementation

uses PBSendFax, pbMainMenu, CCSCommon, pbImages;

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
    SOrdLineNoQRLabel.Caption := '1';
    SOrdLineNoQRLabel.Caption := IntToStr(FieldByName('Sales_Order_Line_No').AsInteger);
    PartCodeQRLabel.Caption := FieldByName('Part').AsString;
    PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString;
    SellPriceQRLabel.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(FieldByName('Part_Sales_Price').AsCurrency));
    QtyOrd := FieldByName('Quantity_Ordered').AsInteger;
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

  {Get Delivery Details}
  Cust :=  GetDetsQuery.FieldByName('Customer').AsInteger;
  Branch := GetDetsQuery.FieldByName('Branch_No').AsInteger;

  GetAddDetails(Cust,Branch);

  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
  sPhoneQrLabel.Caption := addressSrc.Dataset.fields[6].AsString;
  sFaxQRLabel.Caption := addressSrc.Dataset.fields[7].AsString;
  sEmailQRLabel.Caption := addressSrc.Dataset.fields[8].AsString;
  qrLblCntct.Caption := '';
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
  CustSQL.Close;
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
With GetDetsQuery do
    begin 
    OrdNumQRLabel.Caption := ReportTitleQRLabel.Caption+':   '+FieldByName('OrdNum').AsString;
    SalesOrdDateQRLabel.Caption := DateToStr(FieldByName('Date_Ordered').AsDateTime);
    QRLblReqDT.Caption := DateToStr(FieldByName('Date_Required').AsDateTime);
    QRLblRef.Caption := fieldByName('Cust_Order_No').AsString;
  end;
ExtChrgsQuery.active := true;
if ExtChrgsQuery.recordcount = 0 then
    AddChargesBand.enabled := false
  else
    AddChargesBand.enabled := true;
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
irow : integer;
sAddress: string;
begin
ReportImage.enabled := PrintLogo;
QRMemoAddress.enabled := printlogo;
ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
      {Activate the company SQL}
with GetCompSQL do
  begin
    Close;
    Open;
    First;
  end;
sAddress := '';

QRMemoAddress.lines.Clear;
  {Get the Phone details}
      for irow := 4 to 8 do
        begin
          if Trim(GetCompSQl.Fields[irow].AsString) = '' then Continue;
          sAddress := sAddress + Trim(GetCompSQl.Fields[irow].AsString) + ' ';
        end;

      if Trim(GetCompSQl.Fields[9].AsString) <> '' then
          sAddress := sAddress + 'Tel: ' + Trim(GetCompSQl.Fields[9].AsString) + ' ';
      if Trim(GetCompSQl.Fields[10].AsString) <> '' then
          sAddress := sAddress + 'Fax: ' + Trim(GetCompSQl.Fields[10].AsString) + ' ';

      QRMemoAddress.Lines.Add(Trim(sAddress));

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

end.
