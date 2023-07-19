unit WtRPJobRemedialSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, gtQrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobRemedialSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    OldqryReport: TFDQuery;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryUpJStatus: TFDQuery;
    qryCompanyAddress: TFDQuery;
    memAddress: TgtQRRichText;
    qryJRemedials: TFDQuery;
    qrlblSOCaption: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    qrlblOrderNoLabel: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRShape15: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    gtQRShape18: TgtQRShape;
    QRLabel4: TgtQRLabel;
    gtQRShape22: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    qrlblContact: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape4: TgtQRShape;
    qryJobEdge: TFDQuery;
    qriHeadLogo: TgtQRImage;
    gtQRSysData1: TgtQRSysData;
    QRBand1: TQRBand;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRShape32: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRLabel17: TgtQRLabel;
    qrlblCompany: TgtQRLabel;
    QRSubDetail1: TQRSubDetail;
    gtQRLabel4: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRLabel15: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    qrrchTextInstallAddress: TgtQRMemo;
    qrrchTextRemedialDetails: TgtQRMemo;
    qryJobWorktops: TFDQuery;
    gtQRLabel49: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    qryReport: TFDQuery;
    gtQRLabel22: TgtQRLabel;
    gtQRShape12: TgtQRShape;
    qrrchTextMaterialDetails: TgtQRMemo;
    QRLabel15: TgtQRLabel;
    gtQRShape17: TgtQRShape;
    gtQRShape19: TgtQRShape;
    gtQRLabel26: TgtQRLabel;
    gtQRLabel27: TgtQRLabel;
    gtQRShape20: TgtQRShape;
    gtQRShape23: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRLabel28: TgtQRLabel;
    gtQRLabel29: TgtQRLabel;
    gtQRShape5: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRLabel30: TgtQRLabel;
    gtQRShape24: TgtQRShape;
    gtQRLabel31: TgtQRLabel;
    gtQRShape26: TgtQRShape;
    qrrchItemstoReturntoSite: TgtQRMemo;
    qrrchItemsLeftOnSite: TgtQRMemo;
    qrrchToolsRequired: TgtQRMemo;
    qrrchSiteRequirments: TgtQRMemo;
    qrrchAdditionalNotes: TgtQRMemo;
    qrrchManufacturingNotes: TgtQRMemo;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    qrlblOrderNumber: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    qrlblRemedialNoLabel: TgtQRLabel;
    qrlblRemedialNo: TgtQRLabel;
    qryGetVersionNumber: TFDQuery;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    function GetVersionNumber(tempNo: integer): real;
  public
    Job: integer;
    RemedialNo: integer;
    RemedialOrder: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bAccountsCopy: boolean;
    bRemedialTemplate: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobRemedialSheet: TfrmwtRPJobRemedialSheet;

implementation

{$R *.dfm}

function TfrmwtRPJobRemedialSheet.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      parambyname('Remedial_Number').asinteger := self.RemedialNo;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobRemedialSheet.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  icount: integer;
  TempAddress: string;
begin
  sWorktop := '';

  with qryJobWorktops do
    begin
      close;
      open;
    end;
    
  with qryCompany do
    begin
      close;
      open;
    end;

  {Customer address details}
  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
      qryAddress.close;
      qryAddress.parambyname('Address').asinteger := qryReport.FieldByName('Address').AsInteger;
      qryAddress.open;
      dtsAddress.dataset := qryAddress;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;
    end;

(*  {Build the address}
  for icount := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[icount].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[icount].asstring))
    end;
*)

  {Installation Address Details}
  qrrchTextInstallAddress.lines.clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  {Actual Company Name and address}
  tempAddress := '';
  memAddress.lines.clear;

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  tempAddress := qryCompanyAddress.fieldbyname('Company_Name').AsString;

  for icount := 1 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + ' T ' + qryCompanyAddress.Fields[6].AsString;
  tempAddress := tempAddress + ' F ' + qryCompanyAddress.Fields[7].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));

  memAddress.lines.add(tempAddress);

end;

procedure TfrmwtRPJobRemedialSheet.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  rVersionNumber: real;
begin
  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;

      qryAddress.close;
      qryAddress.parambyname('Address').asinteger := qryReport.FieldByName('Address').AsInteger;
      qryAddress.open;
      dtsAddress.dataset := qryAddress;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;
    end;

  {Check if printing Remedial Order, Remedial Sheet}
  if RemedialOrder > 0 then
    begin
      qrlblOrderNoLabel.caption := 'Remedial Order:';
      qrlblOrderNumber.caption := inttostr(RemedialOrder);

      qrlblRemedialNoLabel.caption := 'Original Order:';
      rVersionNumber := GetVersionNumber(RemedialOrder);
      qrlblRemedialNo.caption := formatfloat('0.00',rVersionNumber);
    end
  else
    begin
      qrlblOrderNoLabel.caption := 'Order Number:';
      qrlblOrderNumber.caption := qryReport.FieldByName('Sales_Order').AsString;

      qrlblRemedialNoLabel.caption := '';
      qrlblRemedialNo.caption := '';
    end;

  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
    qrlblContact.caption := qryReport.FieldByName('Contact_Name').AsString
  else
    qrlblContact.caption := '';

end;

function TfrmwtRPJobRemedialSheet.BuildNotes(const iNotes: integer): string;
var
  aStr: string;
begin
  if iNotes > 0 then
    begin
      qryGetNotes.parambyname('Notes_Code').asinteger := iNotes;
      qryGetNotes.open;
      aStr := '';
      while (not qryGetNotes.eof) do
        Begin
          astr := aStr + qryGetNotes.fieldbyname('Notes_text').asstring;
          if Length(qryGetNotes.fieldbyname('Notes_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;

procedure TfrmwtRPJobRemedialSheet.qrgQuoteAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (qryReport.fieldbyname('Job_status').asinteger < 40) and not bPreview then
    with qryUpJStatus do
      begin
        close;
        parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
        parambyname('Production_Date_Actual').asdatetime := date;
        parambyname('Job_Status').asinteger := 40;
        execsql;
      end;

end;

procedure TfrmwtRPJobRemedialSheet.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;

end;

procedure TfrmwtRPJobRemedialSheet.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrrchTextRemedialDetails.lines.clear;
  qrrchTextMaterialDetails.lines.clear;
  qrrchItemstoReturntoSite.lines.clear;
  qrrchItemsLeftOnSite.lines.clear;
  qrrchToolsRequired.lines.clear;
  qrrchSiteRequirments.lines.clear;
  qrrchAdditionalNotes.lines.clear;
  qrrchManufacturingNotes.lines.clear;

  if bRemedialTemplate then
    exit;
    
  qrrchTextRemedialDetails.lines.clear;
  qrrchTextRemedialDetails.lines.add(BuildNotes(qryReport.fieldbyname('Remedial_Notes').asinteger));

  qrrchTextMaterialDetails.lines.add(qryReport.fieldbyname('Material_Required').asstring);
  qrrchItemstoReturntoSite.lines.Add(qryReport.fieldbyname('Items_to_Return_to_Site').asstring);
  qrrchItemsLeftOnSite.lines.add(qryReport.fieldbyname('Items_Still_on_Site').asstring);
  qrrchToolsRequired.lines.add(qryReport.fieldbyname('Tools_Required').asstring);
  qrrchSiteRequirments.lines.add(qryReport.fieldbyname('Site_Requirements').asstring);

  qrrchAdditionalNotes.lines.clear;
  qrrchAdditionalNotes.lines.add(BuildNotes(qryReport.fieldbyname('Additional_Notes').asinteger));

  qrrchManufacturingNotes.lines.clear;
  qrrchManufacturingNotes.lines.add(BuildNotes(qryReport.fieldbyname('Manufacturing_Notes').asinteger));
end;

function TfrmwtRPJobRemedialSheet.GetVersionNumber(tempNo: integer): real;
begin
  with qryGetVersionNumber do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempNo;
      open;
      result := fieldbyname('Sales_Order_Number').asfloat;
    end;
end;

end.
