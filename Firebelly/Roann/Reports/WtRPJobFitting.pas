unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls, Math, qrprntr, printers;

type
  TfrmwtRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qryGetNotes: TQuery;
    qryUpJStatus: TQuery;
    qryCompanyAddress: TQuery;
    memAddress: TgtQRRichText;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TgtQRLabel;
    memAddress1: TgtQRRichText;
    QRLabel18: TgtQRLabel;
    QRMemo1: TgtQRMemo;
    QRLabel23: TgtQRLabel;
    QRLabel25: TgtQRLabel;
    QRMemo2: TgtQRMemo;
    QRLabel48: TgtQRLabel;
    QRMemo3: TgtQRMemo;
    QRLabel49: TgtQRLabel;
    QRMemo4: TgtQRMemo;
    QRLabel50: TgtQRLabel;
    QRLabel51: TgtQRLabel;
    qryJRemedials: TQuery;
    qrbSignature: TQRBand;
    QRLabel60: TgtQRLabel;
    QRLabel61: TgtQRLabel;
    QRLabel62: TgtQRLabel;
    QRLabel65: TgtQRLabel;
    QRLabel67: TgtQRLabel;
    QRLabel68: TgtQRLabel;
    qrlblSOCaption: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape5: TgtQRShape;
    QRLabel24: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRShape23: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    QRShape35: TgtQRShape;
    QRLabel22: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    gtQRShape19: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRShape18: TgtQRShape;
    gtQRShape20: TgtQRShape;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel4: TgtQRLabel;
    gtQRShape22: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    qrlblContact: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape24: TgtQRShape;
    gtQRShape25: TgtQRShape;
    qriheadlogo1: TgtQRImage;
    gtQRRichText1: TgtQRRichText;
    gtQRShape4: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    qrlblEdgeDetail: TgtQRLabel;
    qrlblThickness: TgtQRLabel;
    qryJobEdge: TQuery;
    qryJobThickness: TQuery;
    qryJobUpstand: TQuery;
    qriHeadLogo: TgtQRImage;
    gtQRShape27: TgtQRShape;
    gtQRLabel12: TgtQRLabel;
    qrlblColour: TgtQRLabel;
    qryJobWorktop: TQuery;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    gtQRShape31: TgtQRShape;
    gtQRLabel24: TgtQRLabel;
    gtQRShape32: TgtQRShape;
    gtQRLabel25: TgtQRLabel;
    qryJobWorktopCount: TQuery;
    qrchdDelivery: TQRChildBand;
    gtQRLabel28: TgtQRLabel;
    qriheadlogo3: TgtQRImage;
    gtQRLabel31: TgtQRLabel;
    gtQRDBText8: TgtQRDBText;
    gtQRLabel32: TgtQRLabel;
    gtQRDBText9: TgtQRDBText;
    gtQRLabel33: TgtQRLabel;
    gtQRDBText10: TgtQRDBText;
    qrrchTextInstallAddress2: TgtQRRichText;
    gtQRLabel34: TgtQRLabel;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TgtQRLabel;
    qryQElements: TQuery;
    gtQRLabel44: TgtQRLabel;
    gtQRLabel45: TgtQRLabel;
    lblQuantity: TgtQRLabel;
    gtQRLabel46: TgtQRLabel;
    qryJobWorktopWeight: TQuery;
    qrlblWorktopWeight: TgtQRLabel;
    gtQRShape37: TgtQRShape;
    gtQRShape38: TgtQRShape;
    gtQRShape39: TgtQRShape;
    gtQRShape40: TgtQRShape;
    gtQRLabel3: TgtQRLabel;
    gtQRShape41: TgtQRShape;
    gtQRLabel10: TgtQRLabel;
    gtQRLabel11: TgtQRLabel;
    gtQRShape42: TgtQRShape;
    gtQRLabel18: TgtQRLabel;
    gtQRLabel47: TgtQRLabel;
    gtQRLabel48: TgtQRLabel;
    gtQRLabel49: TgtQRLabel;
    gtQRLabel50: TgtQRLabel;
    gtQRLabel51: TgtQRLabel;
    gtQRLabel52: TgtQRLabel;
    gtQRLabel53: TgtQRLabel;
    gtQRLabel54: TgtQRLabel;
    gtQRLabel55: TgtQRLabel;
    gtQRLabel56: TgtQRLabel;
    gtQRLabel57: TgtQRLabel;
    gtQRShape43: TgtQRShape;
    gtQRShape44: TgtQRShape;
    gtQRShape45: TgtQRShape;
    gtQRShape46: TgtQRShape;
    gtQRShape47: TgtQRShape;
    gtQRShape49: TgtQRShape;
    gtQRShape50: TgtQRShape;
    gtQRShape51: TgtQRShape;
    gtQRShape52: TgtQRShape;
    gtQRShape53: TgtQRShape;
    gtQRLabel58: TgtQRLabel;
    gtQRLabel59: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    gtQRLabel60: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrlblDateRequired: TgtQRLabel;
    qrrchTextRiskNotes: TgtQRMemo;
    qrrchTextNotes: TgtQRMemo;
    gtQRShape12: TgtQRShape;
    gtQRLabel4: TgtQRLabel;
    qrrchTextSiteNotes: TgtQRMemo;
    gtQRLabel17: TgtQRLabel;
    qrrchTextOrderNotes: TgtQRMemo;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrchdSatisfactionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    bIncludeVoucher: boolean;
    bRetail: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bAccountsCopy: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobFitting: TfrmwtRPJobFitting;

implementation

uses allCommon;

{$R *.dfm}

function TfrmwtRPJobFitting.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobFitting.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  icount: integer;
  TempAddress: string;
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpJobSheet.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpJobSheet.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpJobSheet.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpJobSheet.PrinterSettings.PaperSize := Size;   {set the number of copies }

  sWorktop := '';

  with qryCompany do
    begin
      close;
      open;
    end;

(*  {Customer address details}
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
*)
(*  {Build the address}
  for icount := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[icount].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[icount].asstring))
    end;
*)

  {Actual Company Name and address}
  tempAddress := '';
  memAddress.lines.clear;
  memAddress1.lines.clear;

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
  memAddress1.lines.add(tempAddress);

end;

procedure TfrmwtRPJobFitting.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblDateRequired.Caption := padatestr(qryReport.FieldByName('Order_Date_Required').asdatetime);

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
  if trim(qryReport.FieldByName('Order_Contact_Name').AsString) <> '' then
    qrlblContact.caption := qryReport.FieldByName('Order_Contact_Name').AsString
  else
    qrlblContact.caption := '';

  {Installation Address Details}
  qrrchTextInstallAddress.lines.clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Order_Install_Address').asinteger));

  {Installation Address Details}
  qrrchTextInstallAddress2.lines.clear;
  qrrchTextInstallAddress2.lines.add(BuildNotes(qryReport.fieldbyname('Order_Install_Address').asinteger));

  {Get Job Worktop, edge and upstand details}
  with qryJobWorktop do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobEdge do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobThickness do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobWorktopCount do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;

//      qrlblWorktops.caption := inttostr(fieldbyname('Total_Pieces').Asinteger);
    end;

  {Total Weight}
  with qryJobWorktopWeight do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;

      qrlblWorktopWeight.caption := formatfloat('###,0',ceil(fieldbyname('Total_Weight').Asfloat)) + ' kgs';
    end;

(*  with qryJobUpstand do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;

      while eof <> true do
        begin
          if (pos('upstand',fieldbyname('Use_Description').AsString) > 0) or (pos('Upstand',fieldbyname('Use_Description').AsString) > 0) or (fieldbyname('Use_Description').AsString = '') then
            begin
              if fieldbyname('Total_Pieces').Asinteger = 0 then
                qrlblUpstand.caption := inttostr(fieldbyname('Use_Count').Asinteger)
              else
                qrlblUpstand.caption := inttostr(fieldbyname('Total_Pieces').Asinteger);
            end
          else
          if (pos('Sill',fieldbyname('Use_Description').AsString) > 0) or (pos('sill',fieldbyname('Use_Description').AsString) > 0) then
            qrlblWindowCill.caption := inttostr(fieldbyname('Use_Count').Asinteger)
          else
          if (pos('End Panel',fieldbyname('Use_Description').AsString) > 0) then
            qrlblEndPanels.caption := inttostr(fieldbyname('Use_Count').Asinteger)
          else
          if (pos('Splash',fieldbyname('Use_Description').AsString) > 0) or (pos('splash',fieldbyname('Use_Description').AsString) > 0) then
            qrlblSplashback.caption := inttostr(fieldbyname('Use_Count').Asinteger);
          next;
        end;
    end;
*)
  with qryQElements do
    begin
      close;
      open;
      qrsdQElements.Enabled := (recordcount > 0)
    end;

  qrlblColour.caption := qryJobWorktop.fieldbyname('Worktop_Description').asstring + ' ' + qryJobWorktop.fieldbyname('Material_Description').asstring;
  qrlblEdgeDetail.caption := qryJobEdge.fieldbyname('Description').asstring;
  qrlblThickness.caption := qryJobThickness.fieldbyname('Thickness_mm').asstring;

  qrrchTextSiteNotes.lines.clear;
  qrrchTextSiteNotes.lines.add(BuildNotes(qryReport.fieldbyname('Site_Instructions').asinteger));

  qrrchTextOrderNotes.lines.clear;
  qrrchTextOrderNotes.lines.add(BuildNotes(qryReport.fieldbyname('Order_Extra_Notes').asinteger));

  qrrchTextRiskNotes.lines.clear;
  qrrchTextRiskNotes.lines.add(BuildNotes(qryReport.fieldbyname('Risk_Notes').asinteger));

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(qryReport.fieldbyname('Appliance_Details').asstring);

(*  if (qryReport.fieldbyname('Appliance_Details').asstring = '') then
    qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Order_Extra_Notes').asinteger));
*)
end;

function TfrmwtRPJobFitting.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobFitting.qrgQuoteAfterPrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPJobFitting.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo3.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;

end;

procedure TfrmwtRPJobFitting.qrchdSatisfactionBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrmemo1.lines.text := stringreplace(qrMemo1.lines.text,'<Company>',qryCompanyAddress.fieldbyname('Company_Name').AsString, [rfReplaceAll]);
end;

procedure TfrmwtRPJobFitting.qrsdQElementsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rArea: real;
  sUpstand, sDescription: string;
begin
  lblWorktopSize.caption := '';
  lblQuantity.caption := '';

  sDescription := qryQElements.fieldbyname('Thickness_mm').asstring + ' ' +
                  qryQElements.fieldbyname('Description').asstring + ' ' + qryQElements.fieldbyname('Material_Description').asstring;

  if qryQElements.fieldbyname('Element_number').asinteger > 1000 then
    begin
      if qryQElements.fieldbyname('Use_Description').asstring <> '' then
        begin
          if qryQElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := ' (Polished ' + qryQElements.fieldbyname('Use_Description').asstring + ') '
          else
            sUpstand := ' (' + qryQElements.fieldbyname('Use_Description').asstring + ') '
        end
      else
        begin
          if qryQElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := ' (Polished Upstand) '
          else
            sUpstand := ' (Upstand) ';
        end;
    end
  else
    sUpstand := ' ';

  lblWorktopSize.caption := sDescription + sUpstand +
                            qryQElements.fieldbyname('Length').asstring + 'mm x ' +
                            qryQElements.fieldbyname('Depth').asstring + 'mm';
  if qryQElements.fieldbyname('Total_Upstand_Pieces').asinteger > 1 then
    lblWorktopSize.caption := lblWorktopSize.caption + ' (' + formatfloat('0', qryQElements.fieldbyname('Total_Upstand_Pieces').asfloat) + ' individual pieces)';

  lblQuantity.caption := formatfloat('0',qryQElements.fieldbyname('Quantity').asinteger);

(*  rArea :=  ((qryQElements.fieldbyname('Length').asinteger *
            qryQElements.fieldbyname('Depth').asinteger *
            qryQElements.fieldbyname('Quantity').asinteger)/1000000);
  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';
*)
end;

end.
