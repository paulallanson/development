(*******************************************************************************

Copyright (c) Centrereed Ltd 2003

Comments
--------
  Enquiries Report.

VSS Info:
$Header: /PBL D5/PBRPEnqLst.pas 1    janine$
$History: PBRPEnqLst.pas $
*******************************************************************************)
unit PBRPEnqLst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint,
  QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPEnqLstFrm = class(TForm)
    qrpdetails: TQuickRep;
    PageHeaderQRBand: TQRBand;
    GetEnquiriesSQL: TFDQuery;
    EnquiriesSRC: TDataSource;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    GetQtysSQL: TFDQuery;
    RunDateQRLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRLblCst: TQRLabel;
    GetEnquiriesSQLCustName: TStringField;
    GetEnquiriesSQLEnquiry: TIntegerField;
    GetEnquiriesSQLLine: TIntegerField;
    GetEnquiriesSQLForm_Description: TStringField;
    GetEnquiriesSQLName: TStringField;
    GetEnquiriesSQLBranch_Name: TStringField;
    GetEnquiriesSQLName_1: TStringField;
    GetEnquiriesSQLDate_Point: TDateTimeField;
    GetEnquiriesSQLQuote_Required_By: TDateTimeField;
    QRLblStatus: TQRLabel;
    QRLblCntct: TQRLabel;
    GetEnquiriesSQLName_2: TStringField;
    GetEnquiriesSQLDescription: TStringField;
    qrgSortBy: TQRGroup;
    qrdbSortName: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    EnqNoLab: TQRLabel;
    QRLblEnqDt: TQRLabel;
    QRDBText1: TQRDBText;
    JobDescrQRDBText: TQRDBText;
    QRLblRqby: TQRLabel;
    QtysQRMemo: TQRMemo;
    QRDBtxtStatus: TQRDBText;
    QRDBtxtOp: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLblRep: TQRLabel;
    QRLblInactive: TQRLabel;
    QRlblLve: TQRLabel;
    qrlblDtRng: TQRLabel;
    GetEnquiriesSQLEnq_InActive: TStringField;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    GetEnquiriesSQLSupplier_Count: TIntegerField;
    qryDummy: TFDQuery;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField3: TIntegerField;
    procedure qrpdetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure qrgSortByBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportfile: textfile;
    iSuppBranchPage: Integer;
  public
    opNo: Integer;
    RepNo: Integer;
    DateFrom, DateTo, RepName, OpName: string;
    Preview, Inactive: ByteBool;
    SortbyRep, SortbyOffice: boolean;
    PrinterSettings : TPrinterSettings;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPEnqLstFrm: TPBRPEnqLstFrm;

implementation

uses PBImages, PBRSEnqSel;

{$R *.DFM}

procedure TPBRPEnqLstFrm.qrpdetailsBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qrpdetails.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    qrpdetails.PrinterSettings.Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;

  QRLblRep.Caption := '';
  if SortbyRep then
    begin
      qrgSortBy.Expression := 'Name_1';
      qrdbSortName.DataField := 'Name_1';
      if repNo <> 0 then
        begin
          QRLblRep.Caption := QRLblRep.Caption +  'Rep: '+RepName ;
        end
      else
        QRLblRep.Caption := QRLblRep.Caption +  'All Reps';
    end;

  if SortbyOffice then
    begin
      qrgSortBy.Expression := 'Name_2';
      qrdbSortName.DataField := 'Name_2';
      if OpNo <> 0 then
        begin
          QRLblRep.Caption := QRLblRep.Caption +  'Office Contact: '+OpName ;
        end
      else
        QRLblRep.Caption := QRLblRep.Caption +  'All Office Contacts';
    end;

// ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
  QRLblInactive.Enabled := Inactive;
  QRLblLve.Enabled := Inactive;
  {Activate the company query}
  with GetCompSQL do
  begin
    Close;
    Open;
  end;
end;

function TPBRPEnqLstFrm.GetDetails(Sender: TObject): Integer;
var
  temp: string;
begin
  GetEnquiriesSQL.sql.clear;
  GetEnquiriesSQL.sql.Text := qryDummy.sql.Text;

  if SortbyRep then
    temp := temp + 'ORDER BY Rep.Name, EnquiryLine.Enquiry, EnquiryLine.Line'
  else
  if SortbyOffice then
    temp := temp + 'ORDER BY Operator.Name, EnquiryLine.Enquiry, EnquiryLine.Line';

  GetEnquiriesSQL.SQL.Add(temp);

  {Activate the main report query}
  with GetEnquiriesSQL do
  begin
    Close;
    ParamByName('Rep').AsInteger := RepNo;
    ParamByName('Office_Contact').AsInteger := OpNo;
    ParamByName('DateFrom').AsDateTime := StrToDate(DateFrom);
    ParamByName('DateTo').AsDateTime := StrToDate(DateTo);
    if not Inactive then
        ParamByName('Nonactive').AsString :='Y'
      else
        ParamByName('Nonactive').Asstring := '';
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPEnqLstFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
 // PageNoQRLabel.Caption := 'Report Page: ' +
 //   IntToStr(PrintEnqQuickReport.PageNumber);
end;

procedure TPBRPEnqLstFrm.qrgSortByBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 iSuppBranchPage := 0;
end;

procedure TPBRPEnqLstFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 sTemp : string;
begin
  {Get the quantities}
  QtysQRMemo.Lines.Text := '';
  with GetQtysSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    Open;
    First;
    sTemp := '';
    while (not EOF) do
    begin
      if sTemp <> '' then
        sTemp := sTemp + ', ';
      sTemp := sTemp + IntToStr(FieldByName('Quantity').AsInteger);
      Next;
    end;
    Close;
    QtysQRMemo.Lines.Text := sTemp;
  end;
  EnqNoLab.Caption :=
    EnquiriesSRC.DataSet.FieldByName('Enquiry').AsString+' / '+EnquiriesSRC.DataSet.FieldByName('Line').AsString;
  QrLblEnqDt.Caption := FormatDateTime('dd/mm/yy', EnquiriesSRC.DataSet.FieldByName('Date_Point').AsDateTime);
  QRLblRqby.Caption :=  FormatDateTime('dd/mm/yy',EnquiriesSRC.DataSet.FieldByName('Quote_Required_By').AsDateTime);
  If EnquiriesSRC.Dataset.FieldByName('Enq_Inactive').AsString = 'Y' then
    QRLblLve.Caption := '*'
  else
    QRLblLve.Caption := '';
end;

procedure TPBRPEnqLstFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"Enquiry No"'
              + ',"Line No"'
              + ',"Enquiry Date"'
              + ',"Rep"'
              + ',"Customer"'
              + ',"Job Description"'
              + ',"Date Required"'
              + ',"Quantities"'
              + ',"Status"'
              + ',"Office Contact"'
              + ',"Supplier Count"'
              + ',"Enquiry Inactive"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPEnqLstFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
  tempQtys: string;
  icount: integer;
begin
  if exporting then
  begin
    //Enquiry
    tempStr := '"' + GetEnquiriesSQL.fieldbyname('Enquiry').asstring + '"';

    //enquiry line
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Line').asstring + '"';

    //enquiry date
    tempStr := tempStr + ',"' + QRLblEnqDt.caption + '"';

    //rep
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Name_1').asstring + '"';

    //customer
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Name').asstring + '"';

    //description
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Form_Description').asstring + '"';

    //date required
    tempStr := tempStr + ',"' + QRLblRqby.caption + '"';

    //quantities
    for icount := 0 to pred(QtysQRMemo.Lines.count) do
      tempQtys := tempQtys + QtysQRMemo.Lines[icount];

    tempStr := tempStr + ',"' + tempQtys + '"';

    //status
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Description').asstring + '"';

    //status
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Name_2').asstring + '"';

    //supplier count
    tempStr := tempStr + ',"' + GetEnquiriesSQL.fieldbyname('Supplier_Count').asstring + '"';

    //inactive
    tempStr := tempStr + ',"' + qrlbllve.Caption + '"';

    writeln(self.exportFile, tempStr);

    PBRSEnqSelfrm.prgbrExport.StepIt;
  end;
end;

end.
