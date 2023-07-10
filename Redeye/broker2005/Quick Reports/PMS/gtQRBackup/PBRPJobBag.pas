unit PBRPJobBag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, gtQrCtrls, gtQrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TfrmPBRPJobBag = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    qrgJobBag: TQRGroup;
    QRLabel1: TgtQRLabel;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryContact: TQuery;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRDBText6: TgtQRDBText;
    qryReportlines: TQuery;
    dtsReport: TDataSource;
    qrygetNotes: TQuery;
    QRSubDetail1: TQRSubDetail;
    gtQRFilters1: TgtQRFilters;
    QRLabel6: TgtQRLabel;
    qrmAddress: TgtQRMemo;
    QRLabel10: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    qrlblContactName: TgtQRLabel;
    qrlblTelephone: TgtQRLabel;
    qrlblFax: TgtQRLabel;
    qrlblEmail: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    gtQRDBText5: TgtQRDBText;
    gtQRDBText7: TgtQRDBText;
    gtlblOrderType: TgtQRLabel;
    QRBand1: TQRBand;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    gtQRLabel11: TgtQRLabel;
    gtlblTotalCost: TgtQRLabel;
    gtlblTotalSales: TgtQRLabel;
    gtlblTotalMargin: TgtQRLabel;
    qrgfJobBag: TQRBand;
    gtQRLabel12: TgtQRLabel;
    memoNotes: TgtQRMemo;
    GetNarrSQL: TQuery;
    gtQRLabel13: TgtQRLabel;
    gtQRDBText8: TgtQRDBText;
    procedure qrgJobBagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsdtlProcessesAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrpProcessesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgfJobBagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rTotalCost, rTotalSell: real;
    ipage: integer;
    procedure BuildNotes(aQuery : TQuery; const iNarrative : integer);
    { Private declarations }
  public
    ForceNewPage: boolean;
    Key: real;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
  end;

var
  frmPBRPJobBag: TfrmPBRPJobBag;

implementation

{$R *.dfm}

function TfrmPBRPJobBag.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job_Bag').asfloat := self.key;
      open;
      result := recordcount;
    end;
end;

procedure TfrmPBRPJobBag.qrgJobBagBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  {Get the customer address details}

  qrmAddress.Lines.Clear;

  qryCustomer.close;
  qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
  qryCustomer.parambyname('Branch_no').asinteger := qryReport.FieldByName('Branch_no').AsInteger;
  qryCustomer.open;
  dtsAddress.dataset := qryCustomer;

  for i := 0 to 5 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;

  {Get the customer contact details}
  qryContact.close;
  qryContact.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
  qryContact.parambyname('Branch_no').asinteger := qryReport.FieldByName('Branch_no').AsInteger;
  qryContact.parambyname('Contact_no').asinteger := qryReport.FieldByName('Contact_no').AsInteger;
  qryContact.open;

  qrlblContactName.caption := qryContact.fieldbyname('Contact_Name').asstring;
  qrlblEmail.caption := qryContact.fieldbyname('Email').asstring;

  if qryContact.fieldbyname('Phone').asstring <> '' then
    qrlblTelephone.caption := qryContact.fieldbyname('Phone').asstring
  else
    qrlblTelephone.caption := qryContact.fieldbyname('Branch_Phone').asstring;

  if qryContact.fieldbyname('Fax_Number').asstring <> '' then
    qrlblFax.caption := qryContact.fieldbyname('Fax_Number').asstring
  else
    qrlblFax.caption := qryContact.fieldbyname('Branch_Fax_Number').asstring;

  BuildNotes(qryReport, qryReport.fieldbyname('Narrative').asinteger);

  if memoNotes.lines.text = '' then
    qrgfJobBag.enabled := false
  else
    qrgfJobBag.enabled := true;

end;

procedure TfrmPBRPJobBag.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }


  rTotalCost := 0;
  rTotalSell := 0;

  iPage := 0;
  with qryReportLines do
    begin
      close;
      open;
    end;
end;

procedure TfrmPBRPJobBag.qrsdtlProcessesAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
//  qrsdtlProcesses.Height := 24;
//  qrrchTextProcessNotes.Height := 16;
end;

procedure TfrmPBRPJobBag.qrGrpProcessesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inc(iPage);

end;

procedure TfrmPBRPJobBag.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryReportLines.fieldbyname('Job_Bag_Line_Type').asstring = 'P' then
    gtlblOrderType.caption := 'PO/' + qryReportLines.fieldbyname('Purchase_Order').asstring
  else
  if qryReportLines.fieldbyname('Job_Bag_Line_Type').asstring = 'S' then
    gtlblOrderType.caption := 'SO/' + qryReportLines.fieldbyname('Sales_Order').asstring
  else
    gtlblOrderType.caption := 'Sundry';

  rTotalCost := rTotalCost + qryReportLines.fieldbyname('Job_Bag_Line_cost').asfloat;
  rTotalSell := rTotalSell + qryReportLines.fieldbyname('Job_Bag_Line_sell').asfloat;
end;

procedure TfrmPBRPJobBag.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  gtlblTotalCost.caption := formatfloat('##,###,##0.00',rTotalCost);
  gtlblTotalSales.caption := formatfloat('##,###,##0.00',rTotalSell);
  gtlblTotalmargin.caption := formatfloat('##,###,##0.00',rTotalSell - rTotalCost);
end;

procedure TfrmPBRPJobBag.BuildNotes(aQuery: TQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
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
    MemoNotes.Lines.Clear;
    MemoNotes.Lines.Text := aStr;
  end;
end;

procedure TfrmPBRPJobBag.qrgfJobBagBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrgfJobBag.height := memoNotes.height + 13;
end;

end.
