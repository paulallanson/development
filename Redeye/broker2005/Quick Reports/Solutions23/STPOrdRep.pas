unit STPOrdRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, StdCtrls, CCSPRint, gtQrCtrls;

type
  TSTPOrdRepFrm = class(TForm)
    PurchOrdQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    FooterQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    TotalQRLabel: TQRLabel;
    pogroupheader: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    LineQrLabel: TQRLabel;
    PartQRLabel: TQRLabel;
    DescQRLabel: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    GetOrdDetQuery: TQuery;
    GetRecOrdQuery: TQuery;
    GetDelFromSuppQuery: TQuery;
    UpdStatusQuery: TQuery;
    PreviewQRLabel: TQRLabel;
    GetDetsQuery: TQuery;
    GetOrdHedQuery: TQuery;
    GetDelFromStoreQuery: TQuery;
    PackqtyQRLabel: TQRLabel;
    ReprintQRLabel: TQRLabel;
    GetPFJQuery: TQuery;
    OrderValQRLabel: TQRLabel;
    SAddr5QRLabel: TQRLabel;
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
    SAddr1QRLabel: TQRLabel;
    SAddr2QRLabel: TQRLabel;
    SAddr3QRLabel: TQRLabel;
    SAddr4QRLabel: TQRLabel;
    SAddr6QRLabel: TQRLabel;
    GetDelivAddQuery: TQuery;
    SPhoneQRLabel: TQRLabel;
    SFaxQRLabel: TQRLabel;
    SEmailLegQRLabel: TQRLabel;
    SEmailQRLabel: TQRLabel;
    DAddr1QRLabel: TQRLabel;
    DAddr2QRLabel: TQRLabel;
    DAddr3QRLabel: TQRLabel;
    DAddr4QRLabel: TQRLabel;
    DAddr5QRLabel: TQRLabel;
    DAddr6QRLabel: TQRLabel;
    DPhoneQRLabel: TQRLabel;
    DFaxQRLabel: TQRLabel;
    POrdLineNoQRLabel: TQRLabel;
    PartCodeQRLabel: TQRLabel;
    PartDescrQRLabel: TQRLabel;
    PurchPriceQRLabel: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    PackSizeQRLabel: TQRLabel;
    QRLabel12: TQRLabel;
    QRLblValue: TQRLabel;
    GetSODelAddQuery: TQuery;
    CompSRC: TDataSource;
    GetCompSQL: TQuery;
    qryExtraCharges: TQuery;
    QRSubDetail2: TQRSubDetail;
    qrlblDetails: TQRLabel;
    qrlblExChrgAmount: TQRLabel;
    OrdNumQRLabel: TQRLabel;
    ReportTitleQRLabel: TQRLabel;
    OrdDateQRLabel: TQRLabel;
    PurchOrdDateQRLabel: TQRLabel;
    QRShape3: TQRShape;
    PurchOrdDescrQRLabel: TQRLabel;
    QRMemoAddress: TQRMemo;
    ReportImage: TQRImage;
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
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PurchOrdQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
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
  STPOrdRepFrm: TSTPOrdRepFrm;

implementation

uses STPordRSl, pbMainMenu, CCSCommon, PBImages;

{$R *.DFM}

{ TClPurOrdRepForm }

function TSTPOrdRepFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetOrdHedQuery do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    Result := RecordCount;
  end;
end;

function TSTPOrdRepFrm.RunReport(Sender: TObject): Integer;
begin
  Result := 0;
  StartReport(self);

(*  If not FaxIt then
  begin
    StartReport(Self)
  end
  else
    {Faxing to all Suppliers};
    with GetOrdHedQuery do
    begin
      Close;
      Open;
      First;
      while not EOF do
      begin
        if GetDetails(Self) > 0 then
        begin
        GetDelivAddQuery.Close;
        GetDelivAddQuery.ParamByName('Sel1').AsString := GetOrdHedQuery.FieldByName('Text100').AsString;
        GetDelivAddQuery.Open;

        FaxFound := pbSendFaxFrm.OutToFax(SuppFax,'PO: ' + SuppName, '');
          if (not FaxFound) then
            MessageDlg('The fax driver is not installed', mtError, [mbOK], 0)
          else
            begin
//              PurchOrdQuickReport.PrinterSettings.PrinterIndex := FaxFound;
              StartReport(Self);
            end;
        end;
        Next;
      end;
  end;
*)
end;

procedure TSTPOrdRepFrm.StartReport(Sender: TObject);
begin
PreviewQRLabel.Caption:='';
if Preview then
  begin
     PreviewQRLabel.Caption:='Preview';
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
  end;
end;

procedure TSTPOrdRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
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
//        QRLblCost.Caption := CurrencyDisp(FloatToStr(FieldByName('Cost_Price').AsCurrency));
//        DateDelivExpQRLabel.Caption := DateToStr(FieldByName('Date_Deliv_Expected').AsDateTime);
        end;
 {  if STPordRSLFrm.PFJCheckBox.Checked = True then
    begin
      PFJQRMemo.Lines.Clear;
      PartsforJobQRLabel.Caption := '';
      With GetPFJQuery do
        begin
        Close;
        ParambyName('PurchOrd').AsInteger := GetDetsQuery.ParamByName('Sel1').AsInteger;
        ParamByName('PordLineNo').AsInteger := GetDetsQuery.FieldByName('Purch_Ord_line_No').AsInteger;
        Open;
        First;
        While not eof do
          begin
          PFJQRMemo.Lines.Add(getPFJQuery.FieldByName('Job').AsString);
          next;
          end;
        if recordcount > 0 then
        PartsforJobQRLabel.Caption := 'For Job:' ;
        end;
      end;  }
      QtyOrd := GetdetsQuery.FieldByName('Quantity_Ordered').AsInteger;
      Packsize :=GetDetsQuery.FieldByName('Purch_Pack_Quantity').AsInteger;
      PackQTYQrLabel.Caption := ShowInPacks(QtyOrd,Packsize);
      PackSizeQRLabel.Caption := IntToStr(Packsize) ;
      QRLblValue.Caption := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr((QtyOrd * GetDetsQuery.FieldByName('Purchase_Price').AsFloat)/Packsize));
  end;

procedure TSTPOrdRepFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
with GetDetsQuery do
  begin
    Close;
    ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
    Open;
  end;
with GetDelivAddQuery do
  Begin
    Close;
    ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
    Open;
    First ;
    If not STPordRSlFrm.bStore_Ord then
       begin
       SAddr1QRLabel.Caption := FieldByName('SuppNam').AsString ;
       SAddr2QRLabel.Caption := FieldByName('Name').AsString ;
       SAddr3QRLabel.Caption := FieldByName('Building_No_Name').AsString ;
       SAddr4QRLabel.Caption := FieldByName('Street').AsString ;
       If Trim(FieldByName('Locale').AsString) <> '' then
          SAddr5QRLabel.Caption := Trim(FieldByName('Locale').AsString) + ', ' +
                                   Trim(FieldByName('Town').AsString)
       else
          SAddr5QRLabel.Caption := Trim(FieldByName('Town').AsString) ;
       SAddr6QRLabel.Caption := FieldByName('PostCode').AsString ;
       SEmailLegQRLabel.Visible := True ;
       end
    else
       begin
       SAddr1QRLabel.Caption := FieldByName('SuppNam').AsString ;
       SAddr2QRLabel.Caption := FieldByName('SuppAdd1').AsString ;
       SAddr3QRLabel.Caption := FieldByName('SuppAdd2').AsString ;
       SAddr4QRLabel.Caption := FieldByName('SuppAdd3').AsString ;
       SAddr5QRLabel.Caption := FieldByName('SuppAdd4').AsString ;
       SAddr6QRLabel.Caption := '' ;
       SEmailLegQRLabel.Visible := False ;
       end;
    SPhoneQRLabel.Caption := FieldByName('SuppAdd5').AsString ;
    SFaxQRLabel.Caption := FieldByName('SuppAdd6').AsString ;
    SEmailQRLabel.Caption := FieldByName('SuppAdd7').AsString ;
    end;
With GetDetsQuery do
    begin 
    OrdNumQRLabel.Caption := ReportTitleQRLabel.Caption+':   '+FieldByName('OrdNum').AsString;
    PurchOrdDateQRLabel.Caption := DateToStr(FieldByName('Purch_Ord_Date').AsDateTime);
    PurchOrdDescrQRLabel.Caption := FieldByName('Purch_Ord_Descr').AsString;

    if fieldbyname('Sales_Order').asinteger <> 0 then
      begin
        GetSODelAddQuery.close;
        GetSODelAddQuery.parambyname('Sales_Order').asinteger := GetDetsQuery.fieldbyname('Sales_Order').asinteger;
        GetSODelAddQuery.open;

        DAddr1QRLabel.Caption := GetSODelAddQuery.FieldByName('DelNam').AsString ;
        DAddr2QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd1').AsString ;
        DAddr3QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd2').AsString ;
        DAddr4QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd3').AsString ;
        DAddr5QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd4').AsString ;
        DAddr6QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd5').AsString ;

        DPhoneQRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd6').AsString ;
        DFaxQRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd7').AsString ;
      end
    else
      begin
        DAddr1QRLabel.Caption := FieldByName('DelNam').AsString ;
        DAddr2QRLabel.Caption := FieldByName('DelAdd1').AsString ;
        DAddr3QRLabel.Caption := FieldByName('DelAdd2').AsString ;
        DAddr4QRLabel.Caption := FieldByName('DelAdd3').AsString ;
        DAddr5QRLabel.Caption := FieldByName('DelAdd4').AsString ;
        DAddr6QRLabel.Caption := '' ;
        DPhoneQRLabel.Caption := FieldByName('DelAdd5').AsString ;
        DFaxQRLabel.Caption := FieldByName('DelAdd6').AsString ;
      end;
      
    if fieldbyname('Purch_Ord_Status').AsString = 'G' then
       ReprintQRLabel.Caption := '** REPRINT **'
    else
       ReprintQRLabel.Caption := '';
  end;

  with qryExtraCharges do
  begin
    close;
    ParamByName('Purch_Ord_no').AsString := GetOrdHedQuery.FieldByName('Text100').AsString;
    open;
  end;
end;

procedure TSTPOrdRepFrm.FormCreate(Sender: TObject);
begin
if STPordRslFrm.itranstype = 1 then
  begin
    GetDetsQuery.SQL := GetRecOrdQuery.SQL;
    GetDetsQuery.Params := GetRecOrdQuery.Params;
    GetDetsQuery.FieldDefs := GetRecOrdQuery.FieldDefs;
    ReportTitleQRLabel.Caption := 'Recommended ';
    end
else
  begin
    GetDetsQuery.SQL := GetOrdDetQuery.SQL;
    GetDetsQuery.Params := GetOrdDetQuery.Params;
    GetDetsQuery.FieldDefs := GetOrdDetQuery.FieldDefs;
    ReportTitleQRLabel.Caption := '';
  end ;
{GetDetsQuery.Active := True};
if STPordRSlFrm.bStore_Ord = true then
  begin
    GetDelivAddQuery.SQL := GetDelFromStoreQuery.SQL;
    GetDelivAddQuery.Params := GetDelFromStoreQuery.Params;
    GetDelivAddQuery.FieldDefs := GetDelFromStoreQuery.FieldDefs;
    ReportTitleQRLabel.Caption := ReportTitleQRLabel.Caption + 'Store Order';
    end
else
    begin
    GetDelivAddQuery.SQL := GetDelFromSuppQuery.SQL;
    GetDelivAddQuery.Params := GetDelFromSuppQuery.Params;
    ReportTitleQRLabel.Caption := ReportTitleQRLabel.Caption + 'Purchase Order';
    end;
{GetDelivAddQuery.Active := True};
end;

procedure TSTPOrdRepFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotOrdval := TotOrdval + (QtyOrd * GetDetsQuery.fieldByname('Purchase_Price').AsFloat/PackSize);
end;

procedure TSTPOrdRepFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  OrderValQRLabel.Caption:= FormatFloat('£######0.00',Totordval)
end;

procedure TSTPOrdRepFrm.FooterQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 Totordval := 0.
end;

procedure TSTPOrdRepFrm.PurchOrdQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
irow : integer;
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

  ReportImage.enabled := PrintLogo;
  QRMemoAddress.enabled := printlogo;
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
  for irow := 3 to 8 do
    begin
      if Trim(GetCompSQl.Fields[irow].AsString) = '' then Continue;
        QRMemoAddress.Lines.Append(Trim(GetCompSQl.Fields[irow].AsString));
    end;
  {Do phone numbers}
  QRMemoAddress.Lines.Append('');
  if Trim(GetCompSQl.Fields[9].AsString) <> '' then
    QRMemoAddress.Lines.Append('Telephone: ' + Trim(GetCompSQl.Fields[9].AsString));

  if Trim(GetCompSQl.Fields[10].AsString) <> '' then
    QRMemoAddress.Lines.Append('Facsimile: ' + Trim(GetCompSQl.Fields[10].AsString));
end;

procedure TSTPOrdRepFrm.QRSubDetail2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotOrdval := TotOrdval + (qryExtraCharges.fieldByname('Amount').AsFloat);
end;

procedure TSTPOrdRepFrm.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qryExtraCharges do
  begin
    qrlblDetails.Caption := FieldByName('Details').AsString;
    qrlblExChrgAmount.Caption := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(FieldByName('Amount').AsCurrency));
  end;
end;

end.
