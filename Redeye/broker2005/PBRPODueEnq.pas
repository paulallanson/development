unit PBRPODueEnq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint,
  QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPODueEnqFrm = class(TForm)
    PrintODueEnqQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    GetEnquiriesSQL: TFDQuery;
    EnquiriesSRC: TDataSource;
    DetailQRBand: TQRBand;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    ODueDateQRLabel: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    SupNamQRDBText: TQRDBText;
    SupAdd1QRDBText: TQRDBText;
    SupAdd2QRDBText: TQRDBText;
    SuppAdd3QRDBText: TQRDBText;
    SupTownQRDBText: TQRDBText;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    PhoneQRDBText: TQRDBText;
    FaxQRDBText: TQRDBText;
    SupPostCodeQRDBText: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    JobDescrQRDBText: TQRDBText;
    QRLabel11: TQRLabel;
    DateQRDBText: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    GetQtysSQL: TFDQuery;
    QtysQRMemo: TQRMemo;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    OurPhoneQRDBText: TQRDBText;
    OurFaxQRDBText: TQRDBText;
    BranchQRGroup: TQRGroup;
    EMailQRDBText: TQRDBText;
    QRLabel15: TQRLabel;
    EnqLineQRLabel: TQRLabel;
    SuppBranchPageNoQRLabel: TQRLabel;
    RunDateQRLabel: TQRLabel;
    EnqNoLab: TQRLabel;
    procedure PrintODueEnqQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure DetailQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure BranchQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure DateQRDBTextPrint(sender: TObject; var Value: String);
  private
    iSuppBranchPage: Integer;
  public
    SupplierNo, BranchNo: Integer;
    RepNo: Integer;
    RepName: string;
    Preview: ByteBool;
    SupplierName: string;
    ODueDate: TDate;
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPODueEnqFrm: TPBRPODueEnqFrm;

implementation

uses PBImages;

{$R *.DFM}

procedure TPBRPODueEnqFrm.PrintODueEnqQuickReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with PrintODueEnqQuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;
  RunDateQRLabel.Caption := 'Overdue Enquiries - Run Date: ' + DateToStr(Now);
 // ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
  iSuppBranchPage := 0;
  ODueDateQRLabel.Caption := 'Overdue As At: ' + DateToStr(ODueDate);
  if SupplierNo = 0 then
    ODueDateQRLabel.Caption := ODueDateQRLabel.Caption + ' (All Suppliers)';
  if repNo <> 0 then
    ODUeDateQRLabel.Caption := ODueDateQRLabel.Caption +  '(Rep: '+RepName+')';
  {Activate the company query}
  with GetCompSQL do
  begin
    Close;
    Open;
  end;
end;

function TPBRPODueEnqFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with GetEnquiriesSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := SupplierNo;
    ParamByName('Branch_No').AsInteger := BranchNo;
    ParamByName('ODue_Date').AsDateTime := ODueDate;
    ParamByName('Rep').AsInteger := RepNo;
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPODueEnqFrm.DetailQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
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
    EnquiriesSRC.DataSet.FieldByName('Enquiry').AsString;
  EnqLineQRLabel.Caption :=
    EnquiriesSRC.DataSet.FieldByName('Line').AsString;
end;

procedure TPBRPODueEnqFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  iSuppBranchPage := iSuppBranchPage + 1;
  PageNoQRLabel.Caption := 'Report Page: ' +
    IntToStr(PrintODueEnqQuickReport.PageNumber);
  SuppBranchPageNoQRLabel.Caption := 'Supplier/Branch Page: ' +
    IntToStr(iSuppBranchPage);
end;

procedure TPBRPODueEnqFrm.BranchQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  iSuppBranchPage := 0;
end;

procedure TPBRPODueEnqFrm.DateQRDBTextPrint(sender: TObject;
  var Value: String);
begin
  with EnquiriesSRC.DataSet do
    Value := DateToStr(FieldByName('Req_Response_Date').AsDateTime);
end;

end.
