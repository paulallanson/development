unit wtRPContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QRCtrls, gtQrCtrls, QuickRpt, ExtCtrls, Printers;

type
  TfrmWTRPContract = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    gtQRShape3: TgtQRShape;
    qrlblQuoteCaption: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRLabel16: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    gtQRShape7: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qrgQuote: TQRGroup;
    qryCompany: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryAddress: TQuery;
    qrygetNotes: TQuery;
    gtQRShape1: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrsdContractLine: TQRSubDetail;
    gtQRShape2: TgtQRShape;
    qrlblDrawingNumber: TgtQRLabel;
    gtQRShapeOption5: TgtQRShape;
    qryContractLine: TQuery;
    qryContractOption: TQuery;
    qrbContractLineHeader: TQRBand;
    gtQRShape15: TgtQRShape;
    gtQRShapeHead1: TgtQRShape;
    gtQRShapeHead2: TgtQRShape;
    gtQRShapeHead3: TgtQRShape;
    gtQRShapeHead4: TgtQRShape;
    qrlblDrawing: TgtQRLabel;
    qrlblOptionHead1: TgtQRLabel;
    qrlblOptionHead2: TgtQRLabel;
    qrlblOptionHead3: TgtQRLabel;
    qrlblOptionHead4: TgtQRLabel;
    gtQRShapeOption1: TgtQRShape;
    gtQRShapeOption2: TgtQRShape;
    gtQRShapeOption3: TgtQRShape;
    gtQRShapeOption4: TgtQRShape;
    qrlblOption1: TgtQRLabel;
    qrlblOption2: TgtQRLabel;
    qrlblOption3: TgtQRLabel;
    qrlblOption4: TgtQRLabel;
    dtsContractLine: TDataSource;
    qryOptionHeaders: TQuery;
    gtQRShapeOption6: TgtQRShape;
    gtQRShapeHead5: TgtQRShape;
    gtQRShapeHead6: TgtQRShape;
    qrlblOptionHead5: TgtQRLabel;
    qrlblOptionHead6: TgtQRLabel;
    qrlblOption5: TgtQRLabel;
    qrlblOption6: TgtQRLabel;
    qrcbNotes: TQRChildBand;
    qrlNotes: TgtQRLabel;
    qrrchTextNotes: TgtQRRichText;
    qrbTemplateFitting: TQRBand;
    qrbContractLineFooter: TQRChildBand;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TgtQRLabel;
    qrrchTextAvailability: TgtQRRichText;
    gtQRLabel2: TgtQRLabel;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRLabel3: TgtQRLabel;
    qrlblTemplatePrice: TgtQRLabel;
    qriHeadLogo: TgtQRImage;
    memAddress: TgtQRMemo;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    QRShape1: TgtQRShape;
    qrmAddress: TgtQRMemo;
    qryCompanyAddress: TQuery;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdContractLineBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbContractLineHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbNotesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTemplateFittingBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbContractLineHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdContractLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbTemplateFittingAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
    { Private declarations }
  public
    bPreview: boolean;
    bPrintLogo: boolean;
    bIncludeTemplating: boolean;
    bValuebyUnits: boolean;
    ContractQuote: integer;
    procedure ExporttoFile(filename: string);
    function GetDetails: integer;
    function GetOptionCount: integer;
  end;

var
  frmWTRPContract: TfrmWTRPContract;

implementation

{$R *.dfm}

function TfrmWTRPContract.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Contract_Quote').asinteger := self.ContractQuote;
      open;
      result := recordcount;
    end;
end;

function TfrmWTRPContract.GetOptionCount: integer;
begin
  with qryOptionHeaders do
    begin
      active := false;
      active := true;
      first;
      result := recordcount;
    end;
end;

procedure TfrmWTRPContract.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrbPageHeader.Enabled := true;
  qriHeadLogo.enabled := bPrintLogo;

  with qryCompany do
    begin
      close;
      open;
    end;

  getCompanyAddress;
  qrbTemplateFitting.Enabled := not self.bIncludeTemplating;
end;

procedure TfrmWTRPContract.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;
end;

procedure TfrmWTRPContract.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  with qryContractLine do
    begin
      active := false;
      active := true;
    end;

  qrmAddress.Lines.Clear;

  qryCustomer.close;
  qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
  qryCustomer.open;
  dtsAddress.dataset := qryCustomer;

  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
    qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);

  for i := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Notes').asinteger));

  qrrchTextAvailability.lines.clear;
  qrrchTextAvailability.lines.add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));

  qrcbNotes.Enabled := (trim(qrrchTextNotes.Lines[0]) <> '');
  qrcbAvailability.enabled := (trim(qrrchtextAvailability.lines[0]) <> '');
end;

function TfrmWTRPContract.BuildNotes(const iNotes: integer): string;
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

function TfrmWTRPContract.GetCompanyAddress: string;
var
  iCount: integer;
begin
  memAddress.lines.clear;
  with qryCompanyAddress do
    begin
      close;
      open;
      for iCount := 0 to 4 do
        begin
          if qryCompanyAddress.Fields[iCount].asstring = '' then
            continue
          else
            memAddress.Lines.Append(Trim(qryCompanyAddress.Fields[iCount].asstring)) ;
        end;

      {Finally, add the phone number} ;
      memAddress.Lines.Append('Tel: ' + Trim(qryCompanyAddress.fieldbyname('Telephone_number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring) <> '' then
        memAddress.Lines.Append('Fax: ' + Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring));
    end;
end;

procedure TfrmWTRPContract.qrsdContractLineBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tmpLabel: TgtQRLabel;
  tmpShape: TgtQRShape;
  iCount: integer;
  rTotal: double;
begin
  qrlblDrawingNumber.caption := qryContractLine.fieldbyname('Drawing_Number').asstring;

  with qryContractOption do
    begin
      active := false;
      active := true;
      first;
      icount := 1;
      while eof <> true do
        begin
          rTotal := fieldbyname('Nett_Price').asfloat - fieldbyname('Discount_Value').asfloat + fieldbyname('Markup_Value').asfloat;

          if bIncludeTemplating then
            rTotal := rTotal + fieldbyname('Survey_Price').asfloat + fieldbyname('Installation_Price').asfloat + fieldbyname('Delivery_Price').asfloat;

          tmpLabel := self.FindComponent('qrlblOption' + IntToStr(icount)) as TgtQRLabel;
          try
            tmpLabel.Caption := formatfloat('£#,##0.00',rTotal);
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeOption' + inttostr(icount)) as TgtQRShape;

          try
            tmpShape.enabled := true;
          except
          end;
          
          icount := icount + 1;
          next;
        end;

    end;
end;

procedure TfrmWTRPContract.qrbContractLineHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tmpLabel: TgtQRLabel;
  tmpShape: TgtQRShape;
  icount: integer;
begin
  {Clear all the Option headers}
  for icount := 1 to 6 do
    begin
      tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TgtQRLabel;

      try
        tmpLabel.Caption := '';
      except
      end;

      tmpLabel := self.findcomponent('qrlblOption' + inttostr(icount)) as TgtQRLabel;

      try
        tmpLabel.Caption := '';
      except
      end;

      tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TgtQRShape;

      try
        tmpShape.enabled := false;
      except
      end;

      tmpShape := self.findcomponent('gtQRShapeOption' + inttostr(icount)) as TgtQRShape;

      try
        tmpShape.enabled := false;
      except
      end;
    end;


  with qryOptionHeaders do
    begin
      active := false;
      active := true;
      first;
      icount := 1;
      while eof <> true do
        begin
          tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TgtQRLabel;

          try
            tmpLabel.Caption := qryOptionHeaders.fieldbyname('Option_Description').asstring;
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TgtQRShape;

          try
            tmpShape.enabled := true;
          except
          end;

          icount := icount + 1;

          next;
        end;
    end;
end;

procedure TfrmWTRPContract.qrcbNotesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbNotes.height := 52;
  if trim(qrrchtextNotes.lines[0]) = '' then
    qrlNotes.Caption := '';
  iLines := qrrchTextNotes.lines.count;
  qrrchTextNotes.Height := iLines * 18;
  qrcbNotes.height := qrrchTextNotes.height + 32;
end;

procedure TfrmWTRPContract.qrcbAvailabilityBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbAvailability.height := 52;
  if trim(qrrchTextAvailability.lines[0]) = '' then
    qrrchTextAvailability.lines.Add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));
  iLines := qrrchTextAvailability.lines.count;
  qrrchTextAvailability.Height := iLines * 18;
  qrcbAvailability.height := qrrchTextAvailability.height + 32;
end;

procedure TfrmWTRPContract.qrbTemplateFittingBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rTotal: real;
begin
  rTotal := qryCustomer.fieldbyname('Installation_Price').asfloat + qryCustomer.fieldbyname('Survey_Price').asfloat + qryCustomer.fieldbyname('Delivery_Price').asfloat;
  qrlblTemplatePrice.caption := formatfloat('£#,##0.00',rTotal);
end;

procedure TfrmWTRPContract.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;


procedure TfrmWTRPContract.qrbContractLineHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  tmpLabel: TgtQRLabel;
  iCount: integer;
begin
  if self.exporting then
    begin
      tempStr := '"Drawing Ref"';

      {Get all the Option headers}
      for icount := 1 to 6 do
        begin
          tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TgtQRLabel;

          try
            if tmpLabel.Caption <> '' then
              tempStr := tempstr + ',"' + tmpLabel.Caption +'"';
          except
          end;
        end;
      writeLn(self.exportFile, tempStr);
    end;
end;

procedure TfrmWTRPContract.qrsdContractLineAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  tmpLabel: TgtQRLabel;
  iCount: integer;
begin
  if self.exporting then
    begin
      tempStr := qrlblDrawingNumber.caption;

      {Get all the Option prices}
      for icount := 1 to 6 do
        begin
          tmpLabel := self.findcomponent('qrlblOption' + inttostr(icount)) as TgtQRLabel;

          try
            if tmpLabel.Caption <> '' then
              tempStr := tempstr + ',"' + tmpLabel.Caption +'"';
          except
          end;
        end;
      writeLn(self.exportFile, tempStr);
    end;
end;

procedure TfrmWTRPContract.qrbTemplateFittingAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting and (BandPrinted = true) then
    begin
    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := '"' + 'Templating & Fitting: '  + '","' +  qrlblTemplatePrice.caption + '"';
      writeLn(self.exportFile, tempStr);
    end;
end;

end.
