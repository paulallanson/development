unit STPOrdRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, StdCtrls, CCSPRint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPOrdRepFrm = class(TForm)
    PurchOrdQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    FooterQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    TotalQRLabel: TQRLabel;
    pogroupheader: TQRGroup;
    GetOrdDetQuery: TFDQuery;
    GetRecOrdQuery: TFDQuery;
    GetDelFromSuppQuery: TFDQuery;
    UpdStatusQuery: TFDQuery;
    GetDetsQuery: TFDQuery;
    GetOrdHedQuery: TFDQuery;
    GetDelFromStoreQuery: TFDQuery;
    PackqtyQRLabel: TQRLabel;
    ReprintQRLabel: TQRLabel;
    GetPFJQuery: TFDQuery;
    OrderValQRLabel: TQRLabel;
    GetDelFromSuppQuerySuppNam: TWideStringField;
    GetDelFromSuppQueryName: TWideStringField;
    GetDelFromSuppQueryBuilding_No_Name: TWideStringField;
    GetDelFromSuppQueryStreet: TWideStringField;
    GetDelFromSuppQueryLocale: TWideStringField;
    GetDelFromSuppQueryTown: TWideStringField;
    GetDelFromSuppQueryPostCode: TWideStringField;
    GetDelFromSuppQueryPhone: TWideStringField;
    GetDelFromSuppQueryFax_Number: TWideStringField;
    GetDelFromSuppQueryemail: TWideStringField;
    GetDelivAddQuery: TFDQuery;
    PartCodeQRLabel: TQRLabel;
    PartDescrQRLabel: TQRLabel;
    PurchPriceQRLabel: TQRLabel;
    PackSizeQRLabel: TQRLabel;
    QRLblValue: TQRLabel;
    GetSODelAddQuery: TFDQuery;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
    qryExtraCharges: TFDQuery;
    QRSubDetail2: TQRSubDetail;
    qrlblDetails: TQRLabel;
    qrlblExChrgAmount: TQRLabel;
    QRLabel14: TQRLabel;
    QRLblAcc: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    OrdNumQRLabel: TQRLabel;
    PurchOrdDateQRLabel: TQRLabel;
    PurchOrdDescrQRLabel: TQRLabel;
    QRLabel9: TQRLabel;
    QRlblDelDt: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DescQRLabel: TQRLabel;
    PartQRLabel: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    QRLabel3: TQRLabel;
    PreviewQRLabel: TQRLabel;
    qrmCompany: TQRMemo;
    qrlblNotes: TQRLabel;
    qrPolDetails: TQRSubDetail;
    ReportImage: TQRImage;
    SupplierAddmemo: TQRMemo;
    SpecialNotesMemo: TQRMemo;
    GetNarrSQL: TFDQuery;
    lblSpecialNotes: TQRLabel;
    SuppSQL: TFDQuery;
    AddressSRC: TDataSource;
    DellAddmemo: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    function GetDetails(Sender: TObject): Integer;
    function RunReport(Sender: TObject): Integer;
    procedure StartReport(Sender: TObject);
    procedure qrPolDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure pogroupheaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrPolDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PurchOrdQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure BuildSpecialNotes(iNarrative: integer);
    procedure GetAddDetails(Supp, Branch: integer);
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
    Result := GetOrdHedQuery.RecordCount;
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
          FaxFound :=
            PBSendFaxFrm.OutToFax(GetDelivAddQuery.FieldByname('SuppAdd6').AsString,
            'PO: ' + GetDelivAddQuery.FieldByName('SuppNam').AsString, '');
          if FaxFound = -2 then
          begin
            MessageDlg('No fax system installed', mtError, [mbOK], 0);
            Exit;
          end;
          PurchOrdQuickReport.PrinterSettings.PrinterIndex := FaxFound;
          StartReport(Self);
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

procedure TSTPOrdRepFrm.qrPolDetailsBeforePrint(Sender: TQRCustomBand;
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
        PartCodeQRLabel.Caption := FieldByName('Part').AsString;
        PartDescrQRLabel.Caption := FieldByName('Part_Description').AsString;
        PurchPriceQRLabel.Caption := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(FieldByName('Purchase_Price').AsCurrency));
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
      QRLblValue.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr((QtyOrd * GetDetsQuery.FieldByName('Purchase_Price').AsFloat)/Packsize));
      qrlblNotes.Caption := trim(GetDetsQuery.Fieldbyname('Line_Notes').asstring);

  if trim(GetDetsQuery.FieldByName('Line_Notes').asstring) = '' then
    qrPolDetails.height := 21
  else
    qrPolDetails.height := 41;
end;

procedure TSTPOrdRepFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Supp, Branch: integer;
  icount: integer;
begin
  with GetDetsQuery do
    begin
      Close;
      ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
      Open;
    end;
  SupplierAddMemo.Lines.Clear;
  SpecialNotesmemo.Lines.clear;

  BuildSpecialNotes(GetDetsQuery.fieldbyname('Narrative').asinteger);

  {Get Delivery Details}
  Supp :=  GetDetsQuery.FieldByName('Supplier').AsInteger;
  Branch := GetDetsQuery.FieldByName('Branch_No').AsInteger;

  GetAddDetails(Supp,Branch);

  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    SupplierAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;

  With GetDetsQuery do
    begin
    OrdNumQRLabel.Caption := FieldByName('OrdNum').AsString;
    PurchOrdDateQRLabel.Caption := DateToStr(FieldByName('Purch_Ord_Date').AsDateTime);
    PurchOrdDescrQRLabel.Caption := FieldByName('Purch_Ord_Descr').AsString;
    QRLblDelDt.Caption := DateToStr(FieldByname('Date_Deliv_Expected').AsDateTime);
    QRLblAcc.Caption := FieldByName('Account_Code').AsString;

    if fieldbyname('Sales_Order').asinteger <> 0 then
      begin
        GetSODelAddQuery.close;
        GetSODelAddQuery.parambyname('Sales_Order').asinteger := GetDetsQuery.fieldbyname('Sales_Order').asinteger;
        GetSODelAddQuery.open;

        AddressSRC.DataSet := GetSODelAddQuery;

        for icount := 0 to 5 do
        begin
          if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
          DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
        end;
(*        DAddr1QRLabel.Caption := GetSODelAddQuery.FieldByName('DelNam').AsString ;
        DAddr2QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd1').AsString ;
        DAddr3QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd2').AsString ;
        DAddr4QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd3').AsString ;
        DAddr5QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd4').AsString ;
        DAddr6QRLabel.Caption := GetSODelAddQuery.FieldByName('DelAdd5').AsString ;
*)
      end
    else
      begin
        AddressSRC.DataSet := GetDetsQuery;

        for icount := 15 to 22 do
        begin
          if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
          DellAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
        end;
(*        DAddr1QRLabel.Caption := FieldByName('DelNam').AsString ;
        DAddr2QRLabel.Caption := FieldByName('DelAdd1').AsString ;
        DAddr3QRLabel.Caption := FieldByName('DelAdd2').AsString ;
        DAddr4QRLabel.Caption := FieldByName('DelAdd3').AsString ;
        DAddr5QRLabel.Caption := FieldByName('DelAdd4').AsString ;
        DAddr6QRLabel.Caption := '' ;
*)
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
    end
else
  begin
    GetDetsQuery.SQL := GetOrdDetQuery.SQL;
    GetDetsQuery.Params := GetOrdDetQuery.Params;
    GetDetsQuery.FieldDefs := GetOrdDetQuery.FieldDefs;
  end ;
{GetDetsQuery.Active := True};
if STPordRSlFrm.bStore_Ord = true then
  begin
    GetDelivAddQuery.SQL := GetDelFromStoreQuery.SQL;
    GetDelivAddQuery.Params := GetDelFromStoreQuery.Params;
    GetDelivAddQuery.FieldDefs := GetDelFromStoreQuery.FieldDefs;
    end
else
    begin
    GetDelivAddQuery.SQL := GetDelFromSuppQuery.SQL;
    GetDelivAddQuery.Params := GetDelFromSuppQuery.Params;
    end;
{GetDelivAddQuery.Active := True};
end;

procedure TSTPOrdRepFrm.qrPolDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotOrdval := TotOrdval + (QtyOrd * GetDetsQuery.fieldByname('Purchase_Price').AsFloat/PackSize);
//  qrPolDetails.height := 23;
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
    if fieldByName('amount').asCurrency = 0.00 then
      QrLblExChrgAmount.Caption := ''
    else
      qrlblExChrgAmount.Caption := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(FieldByName('Amount').AsCurrency));
  end;
end;

procedure TSTPOrdRepFrm.PageHeaderQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  irow: integer;
begin
  qrmCompany.lines.clear;
  with GetCompSQL do
    begin
      close;
      open;
      for irow := 4 to 8 do
      begin
        if Fields[irow].AsString = '' then Continue;
          qrmCompany.Lines.Add(Trim(Fields[irow].AsString));
      end;

      qrmCompany.Lines.Add('');
      if Trim(FieldByName('Phone').AsString) <> '' then
        qrmCompany.Lines.Add('Tel: ' + Trim(FieldByName('Phone').AsString));
      if Trim(FieldByName('Fax_Number').AsString) <> '' then
        qrmCompany.Lines.Add('Fax: ' + Trim(FieldByName('Fax_Number').AsString));
      if Trim(FieldByName('Email').AsString) <> '' then
        qrmCompany.Lines.Add('Email: ' + Trim(FieldByName('Email').AsString));
    end
end;

procedure TSTPOrdRepFrm.PurchOrdQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
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

  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

  if Preview then
    PreviewQRLabel.Caption:='Preview'
  else
    PreviewQRLabel.Caption:='';

end;

procedure TSTPOrdRepFrm.BuildSpecialNotes(iNarrative : integer);
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

procedure TSTPOrdRepFrm.GetAddDetails(Supp, Branch: integer);
begin
  with SuppSQl do
    begin
      Close;
      ParamByName('Supplier').AsInteger := Supp;
      ParamByName('Branch_no').AsInteger := Branch;
      Open;
    end;

  AddressSRC.Dataset := SuppSQL;
end;

end.

