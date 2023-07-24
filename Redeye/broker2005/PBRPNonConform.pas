unit PBRPNonConform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, QrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TfrmPBRPNonConform = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TQRLabel;
    QRLabel2: TQRLabel;
    qrlblDateRequiredData: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    qrlblDescriptionData: TQRDBText;
    qrlblTitle: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRDBText2: TQRDBText;
    dtsReport: TDataSource;
    gtQRFilters1: TgtQRFilters;
    GetNarrSQL: TQuery;
    gtQRLabel13: TQRLabel;
    gtQRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrlblJobBag: TQRLabel;
    qrlblJobBagData: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    qrgNCA: TQRGroup;
    qrgfNCA: TQRBand;
    gtQRLabel12: TQRLabel;
    memoNotes: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    gtQRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    gtQRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    gtQRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    gtQRDBText10: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRDBText11: TQRDBText;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    QRBand1: TQRBand;
    gtQRSysData1: TQRSysData;
    ReportImage: TQRImage;
    memoResponse: TQRMemo;
    ChildBand4: TQRChildBand;
    gtQRLabel7: TQRLabel;
    memoPreventative: TQRMemo;
    memoCorrective: TQRMemo;
    ChildBand3: TQRChildBand;
    gtQRLabel5: TQRLabel;
    gtQRShape2: TQRShape;
    qrlblCosttoCompany: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRShape3: TQRShape;
    qrlblCosttoClient: TQRLabel;
    qetOldReport: TQuery;
    QRLabel1: TQRLabel;
    gtQRDBText3: TQRDBText;
    procedure qrgNCABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGrpProcessesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rTotalCost, rTotalSell: real;
    ipage: integer;
    procedure BuildNotes(aQuery : TQuery; const iNarrative : integer);
    procedure BuildResponse(aQuery: TQuery; const iNarrative: integer);
    procedure BuildCorrective(aQuery: TQuery; const iNarrative: integer);
    procedure BuildPreventative(aQuery: TQuery; const iNarrative: integer);
    { Private declarations }
  public
    ForceNewPage: boolean;
    Key: integer;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
  end;

var
  frmPBRPNonConform: TfrmPBRPNonConform;

implementation

uses PBImages;

{$R *.dfm}

function TfrmPBRPNonConform.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job_Bag_Non_Conform').asinteger := self.key;
      open;
      result := recordcount;
    end;
end;

procedure TfrmPBRPNonConform.qrgNCABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  BuildNotes(qryReport, qryReport.fieldbyname('Non_Conform_Notes').asinteger);
  BuildResponse(qryReport, qryReport.fieldbyname('Response_Notes_id').asinteger);
  BuildCorrective(qryReport, qryReport.fieldbyname('Corrective_Notes_id').asinteger);
  BuildPreventative(qryReport, qryReport.fieldbyname('Preventative_Notes_id').asinteger);

  printBand := false;
end;

procedure TfrmPBRPNonConform.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

  if qryReport.FieldByName('Job_bag').asinteger <> 0 then
    begin
      qrlblJobBag.caption := 'Job Bag:';
      qrlblTitle.caption := 'Job Title:';
      qrlblJobBagData.DataField := 'Job_Bag';
      qrlblDescriptionData.DataField := 'Job_Bag_Descr';
      qrlblDateRequiredData.DataField := 'Goods_Required';
    end
  else
    begin
      qrlblJobBag.caption := 'PO Number:';
      qrlblTitle.caption := 'Description:';
      qrlblJobBagData.DataField := 'Purchase_Order';
      qrlblDescriptionData.DataField := 'Customers_Desc';
      qrlblDateRequiredData.DataField := 'PO_Goods_Required';
    end;

  rTotalCost := 0;
  rTotalSell := 0;

  iPage := 0;
end;

procedure TfrmPBRPNonConform.qrGrpProcessesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inc(iPage);

end;

procedure TfrmPBRPNonConform.BuildNotes(aQuery: TQuery;
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

procedure TfrmPBRPNonConform.BuildResponse(aQuery: TQuery;
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
    MemoResponse.Lines.Clear;
    MemoResponse.Lines.Text := aStr;
  end;
end;

procedure TfrmPBRPNonConform.BuildCorrective(aQuery: TQuery;
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
    MemoCorrective.Lines.Clear;
    MemoCorrective.Lines.Text := aStr;
  end;
end;

procedure TfrmPBRPNonConform.BuildPreventative(aQuery: TQuery;
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
    MemoPreventative.Lines.Clear;
    MemoPreventative.Lines.Text := aStr;
  end;
end;

procedure TfrmPBRPNonConform.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryReport.fieldbyname('Total_Cost').asfloat <> 0 then
    qrlblCosttoCompany.caption := FloatToStrF(qryReport.fieldbyname('Total_Cost').asfloat, ffCurrency, 15, 2)
  else
    qrlblCosttoCompany.caption := '';

  if qryReport.fieldbyname('Total_Cost_to_Client').asfloat <> 0 then
    qrlblCosttoClient.caption := FloatToStrF(qryReport.fieldbyname('Total_Cost_to_Client').asfloat, ffCurrency, 15, 2)
  else
    qrlblCosttoClient.caption := '';
end;

end.
