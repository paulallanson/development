unit wtRPContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, QRCtrls,  QuickRpt, ExtCtrls, Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPContract = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    gtQRShape3: TQRShape;
    qrlblQuoteCaption: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    gtQRLabel7: TQRLabel;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qrgQuote: TQRGroup;
    qryCompany: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryAddress: TFDQuery;
    qrygetNotes: TFDQuery;
    gtQRShape1: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrsdContractLine: TQRSubDetail;
    gtQRShape2: TQRShape;
    qrlblDrawingNumber: TQRLabel;
    gtQRShapeOption5: TQRShape;
    qryContractLine: TFDQuery;
    qryContractOption: TFDQuery;
    qrbContractLineHeader: TQRBand;
    gtQRShape15: TQRShape;
    gtQRShapeHead1: TQRShape;
    gtQRShapeHead2: TQRShape;
    gtQRShapeHead3: TQRShape;
    gtQRShapeHead4: TQRShape;
    qrlblDrawing: TQRLabel;
    qrlblOptionHead1: TQRLabel;
    qrlblOptionHead2: TQRLabel;
    qrlblOptionHead3: TQRLabel;
    qrlblOptionHead4: TQRLabel;
    gtQRShapeOption1: TQRShape;
    gtQRShapeOption2: TQRShape;
    gtQRShapeOption3: TQRShape;
    gtQRShapeOption4: TQRShape;
    qrlblOption1: TQRLabel;
    qrlblOption2: TQRLabel;
    qrlblOption3: TQRLabel;
    qrlblOption4: TQRLabel;
    dtsContractLine: TDataSource;
    qryOptionHeaders: TFDQuery;
    gtQRShapeOption6: TQRShape;
    gtQRShapeHead5: TQRShape;
    gtQRShapeHead6: TQRShape;
    qrlblOptionHead5: TQRLabel;
    qrlblOptionHead6: TQRLabel;
    qrlblOption5: TQRLabel;
    qrlblOption6: TQRLabel;
    qrcbNotes: TQRChildBand;
    qrlNotes: TQRLabel;
    qrrchTextNotes: TQRRichText;
    qrbTemplateFitting: TQRBand;
    qrbContractLineFooter: TQRChildBand;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TQRLabel;
    qrrchTextAvailability: TQRRichText;
    gtQRLabel2: TQRLabel;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel3: TQRLabel;
    qrlblTemplatePrice: TQRLabel;
    qriHeadLogo: TQRImage;
    memAddress: TQRMemo;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    QRShape1: TQRShape;
    qrmAddress: TQRMemo;
    qryCompanyAddress: TFDQuery;
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
  tmpLabel: TQRLabel;
  tmpShape: TQRShape;
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

          tmpLabel := self.FindComponent('qrlblOption' + IntToStr(icount)) as TQRLabel;
          try
            tmpLabel.Caption := formatfloat('£#,##0.00',rTotal);
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeOption' + inttostr(icount)) as TQRShape;

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
  tmpLabel: TQRLabel;
  tmpShape: TQRShape;
  icount: integer;
begin
  {Clear all the Option headers}
  for icount := 1 to 6 do
    begin
      tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TQRLabel;

      try
        tmpLabel.Caption := '';
      except
      end;

      tmpLabel := self.findcomponent('qrlblOption' + inttostr(icount)) as TQRLabel;

      try
        tmpLabel.Caption := '';
      except
      end;

      tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TQRShape;

      try
        tmpShape.enabled := false;
      except
      end;

      tmpShape := self.findcomponent('gtQRShapeOption' + inttostr(icount)) as TQRShape;

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
          tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TQRLabel;

          try
            tmpLabel.Caption := qryOptionHeaders.fieldbyname('Option_Description').asstring;
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TQRShape;

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
  tmpLabel: TQRLabel;
  iCount: integer;
begin
  if self.exporting then
    begin
      tempStr := '"Drawing Ref"';

      {Get all the Option headers}
      for icount := 1 to 6 do
        begin
          tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TQRLabel;

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
  tmpLabel: TQRLabel;
  iCount: integer;
begin
  if self.exporting then
    begin
      tempStr := qrlblDrawingNumber.caption;

      {Get all the Option prices}
      for icount := 1 to 6 do
        begin
          tmpLabel := self.findcomponent('qrlblOption' + inttostr(icount)) as TQRLabel;

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
