unit wtRPContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, QRCtrls, gtQrCtrls, QuickRpt, ExtCtrls, Printers,
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
    qriHeadLogo: TQRImage;
    qrmAddress: TQRMemo;
    gtQRLabel6: TQRLabel;
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
    gtQRShape4: TQRShape;
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
    gtQRShapeDrawing: TQRShape;
    qrlblDrawingNumber: TQRLabel;
    gtQRShapeOption5: TQRShape;
    qryContractLine: TFDQuery;
    qryContractOption: TFDQuery;
    qrbContractLineHeader: TQRBand;
    gtQRShapeHead0: TQRShape;
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
    qrlblDrawingNumberMemo: TQRRichText;
    qrlblOptionHead0: TQRRichText;
    qryOptionHeadersHeight: TFDQuery;
    qrbTemplateFitting: TQRBand;
    gtQRShape10: TQRShape;
    gtQRShapeTemplate: TQRShape;
    gtQRLabel3: TQRLabel;
    qrlblTemplatePrice: TQRLabel;
    qrbContractLineFooter: TQRChildBand;
    gtQRLabel2: TQRLabel;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TQRLabel;
    qrrchTextAvailability: TQRRichText;
    qrbOptionSummary: TQRChildBand;
    qrlblColourOptions: TQRLabel;
    qrtxtOptionColours1: TQRRichText;
    qrtxtOptionColours2: TQRRichText;
    qrtxtOptionColours3: TQRRichText;
    qrtxtOptionColours4: TQRRichText;
    qrtxtOptionColours5: TQRRichText;
    qrtxtOptionColours6: TQRRichText;
    qryOptionColours: TFDQuery;
    qrbPageFooter: TQRBand;
    qriFootLogo: TQRImage;
    gtQRShapeHead7: TQRShape;
    qrlblOptionHead7: TQRLabel;
    gtQRShapeOption7: TQRShape;
    qrlblOption7: TQRLabel;
    qrtxtOptionColours7: TQRRichText;
    qrmemCompanyAdd: TQRMemo;
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
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbContractLineHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdContractLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbTemplateFittingAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbContractLineFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbOptionSummaryAfterPrint(Sender: TQRCustomBand;
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
//  qrlblCompanyAdd.Enabled := qriHeadLogo.enabled;
  qrmemCompanyAdd.Enabled := qriHeadLogo.enabled;

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

  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
//    read customer details first to get vat rate
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

  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
    qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);

  for i := 1 to 7 do
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
  i: integer;
begin
  qrmemCompanyAdd.lines.clear;
  for i := 19 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        qrmemCompanyAdd.Lines.Append(Trim(qryCompany.Fields[i].asstring)) ;
    end;
      {Finally, add the phone number} ;
  qrmemCompanyAdd.Lines.Append('Tel: ' + Trim(qryCompany.fieldbyname('Telephone_number').asstring));
  if Trim(qryCompany.fieldbyname('Fax_Number').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append('Fax: ' + Trim(qryCompany.fieldbyname('Fax_Number').asstring));
  if Trim(qryCompany.fieldbyname('Email_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append(Trim(qryCompany.fieldbyname('Email_Address').asstring));
  if Trim(qryCompany.fieldbyname('Web_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append(Trim(qryCompany.fieldbyname('Web_Address').asstring));
end;

procedure TfrmWTRPContract.qrsdContractLineBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tmpLabel: TQRLabel;
  tmpShape: TQRShape;
  iCount: integer;
  rTotal: double;
begin
  if bValuebyUnits then
    qrlblDrawingNumber.caption := qryContractLine.fieldbyname('Drawing_Number').asstring + ' (' + qryContractLine.fieldbyname('Number_of_Units').asstring + ')'
  else
    qrlblDrawingNumber.caption := qryContractLine.fieldbyname('Drawing_Number').asstring;
  qrlblDrawingNumberMemo.lines.clear;
  qrlblDrawingNumberMemo.lines.add(qryContractLine.fieldbyname('Drawing_Number').asstring);

  gtQRShapeDrawing.Height := (qrlblDrawingNumberMemo.lines.count * 16) + 10;
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

          if bValuebyUnits then
            rTotal := (rTotal * qryContractLine.fieldbyname('Number_of_units').asinteger);

          tmpLabel := self.FindComponent('qrlblOption' + IntToStr(icount)) as TQRLabel;
          try
            tmpLabel.Caption := formatfloat('£#,##0.00',rTotal);
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeOption' + inttostr(icount)) as TQRShape;

          try
            tmpShape.enabled := true;
            tmpShape.Height := (qrlblDrawingNumberMemo.lines.count * 16) + 10 ;
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
  tmpRichText: TQRRichText;
  icount, iGroup, iOption: integer;
  iHeight, iBoxHeight: integer;
begin
  if bValueByUnits then
    qrlblDrawing.caption := qrlblDrawing.caption + ' (Units)'
  else
    qrlblDrawing.caption := 'Drawing Ref';

  {Clear all the Option headers}
  for icount := 1 to 7 do
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

      tmpRichText := self.findcomponent('qrtxtOptionColours' + inttostr(icount)) as TQRRichText;

      try
        tmpRichText.lines.clear;
      except
      end;
    end;

  iBoxHeight := 26;

  with qryOptionHeaders do
    begin
      active := false;
      active := true;

      icount := 1;
      first;
      while eof <> true do
        begin
          tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TQRLabel;

          try
            tmpLabel.Caption := qryOptionHeaders.fieldbyname('Option_Description').asstring;

            qrlblOptionHead0.Lines.clear;
            qrlblOptionHead0.Lines.add(qryOptionHeaders.fieldbyname('Option_Description').asstring);

            iHeight := (qrlblOptionHead0.Lines.count * 16) + 9;
            if iHeight > iBoxheight then
              iBoxHeight := iHeight;
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

  {Set the height of the shapes}
  for icount := 0 to 7 do
    begin
      tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TQRShape;

      try
        tmpShape.Height := iBoxHeight;
      except
      end;
    end;

  with qryOptionColours do
    begin
      active := false;
      active := true;

      icount := 0;
      iGroup := 0;
      iOption := 0;

      first;

      while eof <> true do
        begin
          if (iGroup <> fieldbyname('Group_Number').asinteger) or (iOption <> fieldbyname('Option_Number').asinteger) then
            begin
              icount := icount + 1;
              iGroup := fieldbyname('Group_Number').asinteger;
              iOption := fieldbyname('Option_Number').asinteger;

              tmpRichText := self.findcomponent('qrtxtOptionColours' + inttostr(icount)) as TQRRichText;

              try
                tmpRichText.Lines.Add(fieldbyname('Worktop_Description').asstring);
              except
              end;
            end
          else
            begin
              try
                tmpRichText.Lines.Add(fieldbyname('Worktop_Description').asstring);
              except
              end;
            end;
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
  rTotal, rTemp: real;
  iOptions: integer;
begin
  gtQRShapeTemplate.width := 134;
  rTotal := qryCustomer.fieldbyname('Installation_Price').asfloat + qryCustomer.fieldbyname('Survey_Price').asfloat + qryCustomer.fieldbyname('Delivery_Price').asfloat;
  qrlblTemplatePrice.caption := formatfloat('£#,##0.00',rTotal);

  iOptions := GetOptionCount;
  gtQRShapeTemplate.width := (gtQRShapeTemplate.width * iOptions) - (iOptions - 1);
  rTemp := (gtQRShapeTemplate.width / 2);
  qrlblTemplatePrice.left :=  round(rTemp)+ gtQRShapeTemplate.left;
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

procedure TfrmWTRPContract.qrgQuoteAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
    begin
    //Customer
      tempStr := '"' + 'Customer: ' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Quote Number
      tempStr := tempStr + ',"' + 'Quote No: '+ qryReport.fieldbyname('Contract_Quote').asstring + '"';

    //Date
      tempStr := tempStr + ',"' + 'Date: ' + qryReport.fieldbyname('Contract_Date').asstring + '"';
      writeln(self.exportFile, tempStr);

    //Contact/Account Manager Name
      tempStr := '"' + 'Contact: ' + qryReport.fieldbyname('Account_Manager_Name').asstring + '"';

    //Phone Number
      tempStr := tempStr + ',"' + 'Phone: '+ qryReport.fieldbyname('AM_Telephone_Number').asstring + '"';
      writeln(self.exportFile, tempStr);

    //Developer
      tempStr := '"' + 'Developer: ' + qryReport.fieldbyname('Developer').asstring + '"';
      writeln(self.exportFile, tempStr);

    //Location
      tempStr := '"' + 'Location: ' + qryReport.fieldbyname('Site_Location').asstring + '"';
      writeln(self.exportFile, tempStr);

    //Description
      tempStr := '"' + 'Description: ' + qryReport.fieldbyname('Contract_Description').asstring + '"';
      writeln(self.exportFile, tempStr);

    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);
    end;
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

      if bValueByUnits then
        tempstr := tempstr + ',"' + 'Units' + '"';

      {Get all the Option headers}
      for icount := 1 to 7 do
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
//      tempStr := qrlblDrawingNumber.caption;
      tempStr := qryContractLine.fieldbyname('Drawing_Number').asstring;

      if bValueByUnits then
        tempstr := tempstr + ',"' + qryContractLine.fieldbyname('Number_of_Units').asstring + '"';

      {Get all the Option prices}
      for icount := 1 to 7 do
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

procedure TfrmWTRPContract.qrbContractLineFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting then
    begin
    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := '"' + 'All prices are excluding VAT' + '"';
      writeLn(self.exportFile, tempStr);

    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

    //Blank Line
      tempStr := '"' + 'Notes:' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := '"' + '' + '","' + qrrchTextNotes.lines.text + '"';
      writeLn(self.exportFile, tempStr);
    end;

end;

procedure TfrmWTRPContract.qrbOptionSummaryAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  iCount: integer;
  tempStr: string;
  tmpRichText: TQRRichText;
begin
  if self.exporting then
    begin
    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := qrlblColourOptions.caption;
      writeLn(self.exportFile, tempStr);

      tempstr := '';

      if bValueByUnits then
        tempstr := tempstr + ',""';

      {Get all the Option prices}
      for icount := 1 to 7 do
        begin
          tmpRichText := self.findcomponent('qrtxtOptionColours' + inttostr(icount)) as TQRRichText;

          try
            if tmpRichText.Lines.text <> '' then
              tempStr := tempstr + ',"' + tmpRichText.Lines.text +'"';
          except
          end;
        end;
      writeLn(self.exportFile, tempStr);
    end;
end;

end.
