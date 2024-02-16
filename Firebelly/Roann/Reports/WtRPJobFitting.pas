unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, Math, qrprntr, printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qryGetNotes: TFDQuery;
    qryUpJStatus: TFDQuery;
    qryCompanyAddress: TFDQuery;
    memAddress: TQRRichText;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TQRLabel;
    memAddress1: TQRRichText;
    QRLabel18: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel48: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel49: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    qryJRemedials: TFDQuery;
    qrbSignature: TQRBand;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    qrlblSOCaption: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRDBText2: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRShape5: TQRShape;
    QRLabel24: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRShape7: TQRShape;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRShape23: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    QRShape35: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText5: TQRDBText;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    gtQRShape19: TQRShape;
    gtQRLabel16: TQRLabel;
    gtQRShape18: TQRShape;
    gtQRShape20: TQRShape;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel4: TQRLabel;
    gtQRShape22: TQRShape;
    gtQRShape21: TQRShape;
    gtQRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    gtQRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    qrlblContact: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape24: TQRShape;
    gtQRShape25: TQRShape;
    qriheadlogo1: TQRImage;
    gtQRRichText1: TQRRichText;
    gtQRShape4: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel1: TQRLabel;
    qrlblEdgeDetail: TQRLabel;
    qrlblThickness: TQRLabel;
    qryJobEdge: TFDQuery;
    qryJobThickness: TFDQuery;
    qryJobUpstand: TFDQuery;
    qriHeadLogo: TQRImage;
    gtQRShape27: TQRShape;
    gtQRLabel12: TQRLabel;
    qrlblColour: TQRLabel;
    qryJobWorktop: TFDQuery;
    gtQRLabel19: TQRLabel;
    gtQRLabel20: TQRLabel;
    gtQRShape31: TQRShape;
    gtQRLabel24: TQRLabel;
    gtQRShape32: TQRShape;
    gtQRLabel25: TQRLabel;
    qryJobWorktopCount: TFDQuery;
    qrchdDelivery: TQRChildBand;
    gtQRLabel28: TQRLabel;
    qriheadlogo3: TQRImage;
    gtQRLabel31: TQRLabel;
    gtQRDBText8: TQRDBText;
    gtQRLabel32: TQRLabel;
    gtQRDBText9: TQRDBText;
    gtQRLabel33: TQRLabel;
    gtQRDBText10: TQRDBText;
    qrrchTextInstallAddress2: TQRMemo;
    gtQRLabel34: TQRLabel;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TQRLabel;
    qryQElements: TFDQuery;
    gtQRLabel44: TQRLabel;
    gtQRLabel45: TQRLabel;
    lblQuantity: TQRLabel;
    gtQRLabel46: TQRLabel;
    qryJobWorktopWeight: TFDQuery;
    qrlblWorktopWeight: TQRLabel;
    gtQRShape37: TQRShape;
    gtQRShape38: TQRShape;
    gtQRShape39: TQRShape;
    gtQRShape40: TQRShape;
    gtQRLabel3: TQRLabel;
    gtQRShape41: TQRShape;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRShape42: TQRShape;
    gtQRLabel18: TQRLabel;
    gtQRLabel47: TQRLabel;
    gtQRLabel48: TQRLabel;
    gtQRLabel49: TQRLabel;
    gtQRLabel50: TQRLabel;
    gtQRLabel51: TQRLabel;
    gtQRLabel52: TQRLabel;
    gtQRLabel53: TQRLabel;
    gtQRLabel54: TQRLabel;
    gtQRLabel55: TQRLabel;
    gtQRLabel56: TQRLabel;
    gtQRLabel57: TQRLabel;
    gtQRShape43: TQRShape;
    gtQRShape44: TQRShape;
    gtQRShape45: TQRShape;
    gtQRShape46: TQRShape;
    gtQRShape47: TQRShape;
    gtQRShape49: TQRShape;
    gtQRShape50: TQRShape;
    gtQRShape51: TQRShape;
    gtQRShape52: TQRShape;
    gtQRShape53: TQRShape;
    gtQRLabel58: TQRLabel;
    gtQRLabel59: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRLabel60: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrlblDateRequired: TQRLabel;
    qrrchTextRiskNotes: TQRMemo;
    qrrchTextNotes: TQRMemo;
    gtQRShape12: TQRShape;
    gtQRLabel4: TQRLabel;
    qrrchTextSiteNotes: TQRMemo;
    gtQRLabel17: TQRLabel;
    qrrchTextOrderNotes: TQRMemo;
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
  qrpJobSheet.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
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
