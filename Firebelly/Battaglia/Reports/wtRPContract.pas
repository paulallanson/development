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
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    qriHeadLogo: TgtQRImage;
    qrmAddress: TgtQRMemo;
    gtQRLabel6: TgtQRLabel;
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
    gtQRShape4: TgtQRShape;
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
    gtQRShapeDrawing: TgtQRShape;
    qrlblDrawingNumber: TgtQRLabel;
    gtQRShapeOption5: TgtQRShape;
    qryContractLine: TQuery;
    qryContractOption: TQuery;
    qrbContractLineHeader: TQRBand;
    gtQRShapeHead0: TgtQRShape;
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
    qrlblDrawingNumberMemo: TgtQRRichText;
    qrlblOptionHead0: TgtQRRichText;
    qryOptionHeadersHeight: TQuery;
    qrbTotals: TQRBand;
    qrbContractLineFooter: TQRChildBand;
    gtQRLabel2: TgtQRLabel;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TgtQRLabel;
    qrrchTextAvailability: TgtQRRichText;
    qrbOptionSummary: TQRChildBand;
    qrlblColourOptions: TgtQRLabel;
    qrtxtOptionColours1: TgtQRRichText;
    qrtxtOptionColours2: TgtQRRichText;
    qrtxtOptionColours3: TgtQRRichText;
    qrtxtOptionColours4: TgtQRRichText;
    qrtxtOptionColours5: TgtQRRichText;
    qrtxtOptionColours6: TgtQRRichText;
    qryOptionColours: TQuery;
    qrbPageFooter: TQRBand;
    qrlblCompanyAdd: TgtQRLabel;
    gtQRShapeHead7: TgtQRShape;
    qrlblOptionHead7: TgtQRLabel;
    gtQRShapeOption7: TgtQRShape;
    qrlblOption7: TgtQRLabel;
    qrtxtOptionColours7: TgtQRRichText;
    qrlblQuoteCaption: TgtQRLabel;
    qrbTemplateFitting: TQRChildBand;
    gtQRShape10: TgtQRShape;
    gtQRShapeTemplate: TgtQRShape;
    gtQRLabel3: TgtQRLabel;
    qrlblTemplatePrice: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRShapeTotal1: TgtQRShape;
    gtQRShapeTotal2: TgtQRShape;
    gtQRShapeTotal3: TgtQRShape;
    gtQRShapeTotal4: TgtQRShape;
    gtQRShapeTotal5: TgtQRShape;
    gtQRShapeTotal6: TgtQRShape;
    gtQRShapeTotal7: TgtQRShape;
    qrlblOptionTotal1: TgtQRLabel;
    qrlblOptionTotal2: TgtQRLabel;
    qrlblOptionTotal3: TgtQRLabel;
    qrlblOptionTotal4: TgtQRLabel;
    qrlblOptionTotal5: TgtQRLabel;
    qrlblOptionTotal6: TgtQRLabel;
    qrlblOptionTotal7: TgtQRLabel;
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
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbContractLineHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdContractLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbContractLineFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbOptionSummaryAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbTemplateFittingAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbTemplateFittingBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotalsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbTotalsAfterPrint(Sender: TQRCustomBand;
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
    OptionCount: integer;
    procedure ExporttoFile(filename: string);
    function GetDetails: integer;
    function GetOptionCount: integer;
  end;

var
  frmWTRPContract: TfrmWTRPContract;
  OptionTotals: array[1..7] of real;

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
var
  iCount: integer;
begin
     
  qrbPageHeader.Enabled := true;
  qriHeadLogo.enabled := bPrintLogo;
  qrlblCompanyAdd.Enabled := qriHeadLogo.enabled;

  with qryCompany do
    begin
      close;
      open;
    end;

  getCompanyAddress;
  qrbTotals.Enabled := bValuebyUnits;
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
  iCount: integer;
begin
  OptionCount := 0;

  for iCount := 1 to 7 do
     OptionTotals[iCount] := 0;

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
  qrlblCompanyAdd.caption := '';
  for i := 19 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + qryCompany.Fields[i].AsString;
      if i <> 22 then
        qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + ', '
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

          tmpLabel := self.FindComponent('qrlblOption' + IntToStr(icount)) as TgtQRLabel;
          try
            tmpLabel.Caption := formatfloat('£#,##0.00',rTotal);
          except
          end;

          OptionTotals[iCount] := OptionTotals[iCount] + rTotal;
          
          tmpShape := self.findcomponent('gtQRShapeOption' + inttostr(icount)) as TgtQRShape;

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
  tmpLabel: TgtQRLabel;
  tmpShape: TgtQRShape;
  tmpRichText: TgtQRRichText;
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

      tmpLabel := self.findcomponent('qrlblOptionTotal' + inttostr(icount)) as TgtQRLabel;

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

      tmpShape := self.findcomponent('gtQRShapeTotal' + inttostr(icount)) as TgtQRShape;

      try
        tmpShape.enabled := false;
      except
      end;

      tmpRichText := self.findcomponent('qrtxtOptionColours' + inttostr(icount)) as TgtQRRichText;

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
          tmpLabel := self.findcomponent('qrlblOptionHead' + inttostr(icount)) as TgtQRLabel;

          try
            tmpLabel.Caption := qryOptionHeaders.fieldbyname('Option_Description').asstring;

            qrlblOptionHead0.Lines.clear;
            qrlblOptionHead0.Lines.add(qryOptionHeaders.fieldbyname('Option_Description').asstring);

            iHeight := (qrlblOptionHead0.Lines.count * 16) + 9;
            if iHeight > iBoxheight then
              iBoxHeight := iHeight;
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TgtQRShape;

          try
            tmpShape.enabled := true;
          except
          end;

          {Clear the Total values and Shape}
          tmpLabel := self.findcomponent('qrlblOptionTotal' + inttostr(icount)) as TgtQRLabel;

          try
            tmpLabel.Caption := '';
          except
          end;

          tmpShape := self.findcomponent('gtQRShapeTotal' + inttostr(icount)) as TgtQRShape;

          try
            tmpShape.enabled := true;
          except
          end;

          icount := icount + 1;

          next;
        end;
    end;

  OptionCount := icount - 1;
  
  {Set the height of the shapes}
  for icount := 0 to 7 do
    begin
      tmpShape := self.findcomponent('gtQRShapeHead' + inttostr(icount)) as TgtQRShape;

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

              tmpRichText := self.findcomponent('qrtxtOptionColours' + inttostr(icount)) as TgtQRRichText;

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
  tmpLabel: TgtQRLabel;
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
//      tempStr := qrlblDrawingNumber.caption;
      tempStr := qryContractLine.fieldbyname('Drawing_Number').asstring;

      if bValueByUnits then
        tempstr := tempstr + ',"' + qryContractLine.fieldbyname('Number_of_Units').asstring + '"';

      {Get all the Option prices}
      for icount := 1 to 7 do
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
  tmpRichText: TgtQRRichText;
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
          tmpRichText := self.findcomponent('qrtxtOptionColours' + inttostr(icount)) as TgtQRRichText;

          try
            if tmpRichText.Lines.text <> '' then
              tempStr := tempstr + ',"' + tmpRichText.Lines.text +'"';
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

procedure TfrmWTRPContract.qrbTotalsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tmpLabel: TgtQRLabel;
  tmpShape: TgtQRShape;
  iCount: integer;
begin
  for icount := 1 to 7 do
    begin
      if iCount > OptionCount then
        exit;           {We've got to the end of the options so don't show the rest}

      tmpLabel := self.FindComponent('qrlblOptionTotal' + IntToStr(icount)) as TgtQRLabel;

      try
        tmpLabel.Caption := formatfloat('£#,##0.00',OptionTotals[icount]);
      except
      end;
    end;
end;

procedure TfrmWTRPContract.qrbTotalsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
  tmpLabel: TgtQRLabel;
  iCount: integer;
begin
  if self.exporting and self.bValuebyUnits then
    begin
    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := 'Totals: ' + ',"' + '' + '"';

      {Get all the Option Totals}
      for icount := 1 to 7 do
        begin
          tmpLabel := self.findcomponent('qrlblOptionTotal' + inttostr(icount)) as TgtQRLabel;

          try
            if tmpLabel.Caption <> '' then
              tempStr := tempstr + ',"' + tmpLabel.Caption +'"';
          except
          end;
        end;
      writeLn(self.exportFile, tempStr);
    end;
end;

end.
