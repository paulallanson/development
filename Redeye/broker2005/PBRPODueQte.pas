unit PBRPODueQte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, Grids, DBGrids,
  PBPOObjects, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPODueQteFrm = class(TForm)
    PrintODueQteQuickReport: TQuickRep;
    EnquiriesSRC: TDataSource;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
    GetEnquiriesSQL: TFDQuery;
    ODuePageHeaderBand: TQRBand;
    QRLabel1: TQRLabel;
    RepsSelQRLabel: TQRLabel;
    ODueDetailBand: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    RepPageLbl: TQRLabel;
    ColumnHeadings: TQRBand;
    QRLabel8: TQRLabel;
    ContactLbl: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    ODueDateQRLabel: TQRLabel;
    RunDateQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    DateSentLbl: TQRLabel;
    procedure PrintODueQteQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure RepHeaderBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure ODueDetailBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
  public
    RepNo: Integer;
    Preview: ByteBool;
    RepName: string;
    ODueDate: TDate;
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPODueQteFrm: TPBRPODueQteFrm;
  iRepPage: Integer;

implementation

uses PBImages;

{$R *.DFM}

procedure TPBRPODueQteFrm.PrintODueQteQuickReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with PrintODueQteQuickReport.PrinterSettings do
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
  ODueDateQRLabel.Caption := 'Overdue As At: ' + DateToStr(ODueDate);
  RunDateQRLabel.Caption := 'Run Date: ' + DateToStr(Now);
 // ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
  if RepNo = 0 then
    RepsSelQRLabel.Caption := 'Selected Rep: All'
  else
    RepsSelQRLabel.Caption := 'Selected Rep: ' + RepName;
  {Activate the company query}
  with GetCompSQL do
  begin
    Close;
    Open;
  end;
end;

function TPBRPODueQteFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with GetEnquiriesSQL do
  begin
    Close;
    ParamByName('Rep').AsInteger := RepNo;
    ParamByName('ODue_Date').AsDateTime := ODueDate;
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPODueQteFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  iRepPage := iRepPage + 1;
  RepPageLbl.Caption := 'Rep Page: ' + IntToStr(iRepPage);
end;

procedure TPBRPODueQteFrm.RepHeaderBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  iRepPage := 0;
end;

procedure TPBRPODueQteFrm.ODueDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DateSentLbl.Caption := PBDatestr(EnquiriesSRC.Dataset.FieldByName('Customer_Quote_Date').AsDateTime);
end;

end.
