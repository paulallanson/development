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
    SOrdLineNoQRLabel: TQRLabel;
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
    ReportImage: TQRImage;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
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
    QRLblWho: TQRLabel;
    QRLblCntct: TQRLabel;
    GetContactSQL: TFDQuery;
    OrdNumQRLabel: TQRLabel;
    OrdDateQRLabel: TQRLabel;
    SalesOrdDateQRLabel: TQRLabel;
    ReportTitleQRLabel: TQRLabel;
    QRLblRef: TQRLabel;
    QRLblCustRef: TQRLabel;
    QRLblDtReq: TQRLabel;
    QRLblReqDt: TQRLabel;
    chldbndFSCClaim: TQRChildBand;
    gtlblFSCClaim: TQRLabel;
    qryGetFSCClaim: TFDQuery;
    gtQRMemo1: TQRMemo;
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
  sFSCClaim: string;
begin
   With GetDetsQuery do
   begin
    SOrdLineNoQRLabel.Caption := IntToStr(FieldByName('Sales_Order_Line_No').AsInteger);
    PartCodeQRLabel.Caption := FieldByName('Part').AsString;
    if fieldbyname('Line_Is_Sample').asstring = 'Y' then
      PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString + ' (SAMPLE)'
    else
      PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString;
    SellPriceQRLabel.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(FieldByName('Part_Sales_Price').AsCurrency));
    QtyOrd := FieldByName('Quantity_Ordered').AsInteger;
    Packsize :=FieldByName('Sell_Pack_Quantity').AsInteger;
    PackQTYQrLabel.Caption := ShowInPacks(QtyOrd,Packsize);
    PackSizeQRLabel.Caption := IntToStr(Packsize) ;
    QRLblValue.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr((QtyOrd * GetDetsQuery.FieldByName('Part_Sales_Price').AsFloat)/Packsize));
    iGoods := iGoods + StrToFloatDef(QRLblValue.Caption, 0, FormatSettings);
     rVatValue := StrToFloatDef(QRLblValue.Caption, 0, FormatSettings) *
    (FieldByName('Vat_Rate').AsFloat / 100);
    VatQRLabel.Caption := formatFloat('0.00',rVatValue);
    ivat := ivat + rVatValue;

    {Display FSC Claim}
    gtlblFSCClaim.caption := '';

    if fieldbyname('FSC_Material_Claim').asinteger <> 0 then
      begin
        qryGetFSCClaim.close;
        qryGetFSCClaim.parambyname('FSC_Material_Claim').asinteger := fieldbyname('FSC_Material_Claim').asinteger;
        qryGetFSCClaim.open;
        if qryGetFSCClaim.recordcount > 0 then
          begin
            if qryGetFSCClaim.fieldbyname('Mixed_Claim').asstring = 'Y' then
              sFSCClaim := stringreplace(qryGetFSCClaim.fieldbyname('Short_Description').asstring,'X',formatfloat('0',fieldbyname('FSC_Mixed_Percentage').asfloat),[])
            else
              sFSCClaim := qryGetFSCClaim.fieldbyname('Short_Description').asstring;

            if trim(qryGetFSCClaim.fieldbyname('Claim_Type').asstring) = 'FSC' then
              gtlblFSCClaim.Caption := 'FSC Claim: ' + sFSCClaim
            else
              gtlblFSCClaim.Caption := 'PEFC Declaration: ' + sFSCClaim
          end
        else
          begin
            gtlblFSCClaim.caption := '';
          end;
      end;

    chldbndFSCClaim.Enabled := (gtlblFSCClaim.caption <> '');
  end;
end;

procedure TSTRPSordFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount,Cust,Branch: Integer;
  UseBranchName: boolean;
begin

  UseBranchName := false;

  iGoods := 0.00;
  iVat := 0.00;

  with GetDetsQuery do
  begin
    Close;
    ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
    Open;
  end;
  CustomerAddMemo.Lines.Clear;

  {Get Ordering Customer Details}
  Cust :=  GetDetsQuery.FieldByName('Customer').AsInteger;
  Branch := GetDetsQuery.FieldByName('Branch_No').AsInteger;

  GetAddDetails(Cust,Branch);

  UseBranchName := CustSQL.FieldByName('Use_Branch_Name').AsString = 'Y';

  if UseBranchName then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      CustomerAddMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for icount := (0 + integer(UseBranchName)) to 5 do
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

  {Get Ordering Customer Details}
  Cust :=  GetDetsQuery.FieldByName('Delivery_Customer').AsInteger;
  Branch := GetDetsQuery.FieldByName('Delivery_Branch').AsInteger;

  GetAddDetails(Cust,Branch);

  UseBranchName := CustSQL.FieldByName('Use_Branch_Name').AsString = 'Y';

  if UseBranchName then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      DellAddMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for icount := (0 + integer(UseBranchName)) to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
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

  itotal := StrToFloatDef(GoodsValueLbl.Caption, 0, FormatSettings) + StrToFloatDef(VatValueLbl.Caption, 0, FormatSettings);
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
begin
  ReportImage.enabled := PrintLogo;
  ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
//QRMemoAddress.enabled := printlogo;
//      ReportImage.Picture := STImagesFrm.ReportImage.Picture;
      {Activate the company SQL}
{with GetCompSQL do
  begin
    Close;
    Open;
    First;
  end; }
//QRMemoAddress.lines.Clear;
  {Get the Phone details}
{      for irow := 3 to 8 do
        begin
          if Trim(GetCompSQl.Fields[irow].AsString) = '' then Continue;
          QRMemoAddress.Lines.Append(Trim(GetCompSQl.Fields[irow].AsString));
        end; }
        {Do phone numbers}
{        QRMemoAddress.Lines.Append('');
        if Trim(GetCompSQl.Fields[9].AsString) <> '' then
          QRMemoAddress.Lines.Append('Telephone: ' + Trim(GetCompSQl.Fields[9].AsString));

        if Trim(GetCompSQl.Fields[10].AsString) <> '' then
          QRMemoAddress.Lines.Append('Facsimile: ' + Trim(GetCompSQl.Fields[10].AsString));  }
  
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
