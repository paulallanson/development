(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Overdue Enquiries Report.

VSS Info:
$Header: /PBL D5/PBRPODueQte.pas 5     28/02/:3 11:22 Paul $
$History: PBRPODueQte.pas $
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 28/02/:3   Time: 11:22
 * Updated in $/PBL D5
 * Printersettings.OutputBin is set based on user selection
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 7/11/:2    Time: 15:13
 * Updated in $/PBL D5
 * Take company logo off and realign titles.
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 12/10/:0   Time: 11:47
 * Updated in $/PBL D5
 * Standardise formatdatetime to use PBDatestr in PBPOObjects, which
 * formats the date based on the selections in the control panel, regional
 * settings, data, short style.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 5/07/:0    Time: 17:01
 * Branched in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:02
 * Created in $/PBL D5/QuickReports/BroadSword
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:01
 * Created in $/PBL D5/QuickReports/Forms Technology
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 4  *****************
 * User: Debbies      Date: 14/12/99   Time: 10:58
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 13/12/99   Time: 14:16
 * Updated in $/PBL D5
 * Use new CCSPrinterSetup and set QuickReport's printerindex to the same
 * as the global printer setting.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:30
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRPODueQte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  PBPOObjects, CCSPrint;

type
  TPBRPODueQteFrm = class(TForm)
    PrintODueQteQuickReport: TQuickRep;
    EnquiriesSRC: TDataSource;
    CompSRC: TDataSource;
    GetCompSQL: TQuery;
    GetEnquiriesSQL: TQuery;
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
