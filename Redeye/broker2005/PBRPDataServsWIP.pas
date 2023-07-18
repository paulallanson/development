unit PBRPDataServsWIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, qrprntr, Printers, CCSCommon;

type
  TPBRPDataServsWIPFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblDateRange: TQRLabel;
    qryReport: TQuery;
    qrGroup: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    qrlblGroupHeader: TQRLabel;
    qrdbtext: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qryDummy: TQuery;
    qrlblLiveAppDate: TQRLabel;
    qrlblLiveReqDate: TQRLabel;
    qrlblTextToDSDate: TQRLabel;
    qrlblBrieftoDSDate: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDataInDate: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    AccManager, Customer: integer;
    DateFrom, DateTo: TDateTime;
    SortbyDate, SortbyJob, SortbyAccMgr, SortbyCustomer: boolean;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPDataServsWIPFrm: TPBRPDataServsWIPFrm;

implementation

uses PBRSDataServsWIP;

{$R *.dfm}

function TPBRPDataServsWIPFrm.GetDetails: integer;
var
  temp: string;
begin
  qryReport.sql.clear;
  qryReport.sql.Text := qryDummy.sql.Text;

  if SortbyDate then
    temp := temp + 'ORDER BY Job_Bag_Schedule.Proof_Required_Date, Job_Bag_Schedule.Job_Bag'
  else
  if SortbyJob then
    temp := temp + 'ORDER BY Job_Bag_Schedule.Job_Bag'
  else
  if SortbyAccMgr then
    temp := temp + 'ORDER BY Account_Manager, Job_Bag_Schedule.Job_Bag'
  else
  if SortbyCustomer then
    temp := temp + 'ORDER BY Customer_Name, Job_Bag_Schedule.Job_Bag';

  qryReport.SQL.Add(temp);
  with qryReport do
    begin
      close;
      parambyname('Account_Manager').AsInteger := AccManager;
      parambyname('Customer').AsInteger := Customer;
      parambyname('Date_from').AsDateTime := datefrom;
      parambyname('Date_to').asdatetime := dateto;
      parambyname('Date_zero').asdatetime := 0;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPDataServsWIPFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  if SortbyAccMgr then
    begin
      qrGroup.Enabled := true;
      qrGroup.Expression := 'Account_Manager';
      qrlblGroupHeader.caption := 'Account Manager: ';
      qrdbtext.DataField := 'Account_Manager'
    end
  else
  if SortbyCustomer then
    begin
      qrGroup.Enabled := true;
      qrGroup.Expression := 'Customer_Name';
      qrlblGroupHeader.caption := 'Customer: ';
      qrdbtext.DataField := 'Customer_Name'
    end
  else
    qrGroup.Enabled := false;
end;

procedure TPBRPDataServsWIPFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"Job Number"'
              + ',"Account Manager"'
              + ',"Customer"'
              + ',"Job Title"'
              + ',"Data to DS"'
              + ',"Text to DS"'
              + ',"Live Proof Date"'
              + ',"Live Proof Approval Date"'
              + ',"Quantity"'
              + ',"Date Required"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPDataServsWIPFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (qryReport.fieldbyname('Data_Required_Date').asdatetime <> 0) and
     (qryReport.fieldbyname('Data_Required_Date').asstring <> '') then
      qrlblDataInDate.caption := pbdatestr(qryReport.fieldbyname('Data_Required_Date').asdatetime)
  else
    qrlblDataInDate.caption := '';
  if (qryReport.fieldbyname('Data_Required_Date_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Data_Required_Date_Act').asstring <> '') then
      qrlblDataInDate.caption := 'COMPLETE';

  if (qryReport.fieldbyname('Proof_Approval_Date').asdatetime <> 0) and
     (qryReport.fieldbyname('Proof_Approval_Date').asstring <> '') then
      qrlblLiveAppDate.caption := pbdatestr(qryReport.fieldbyname('Proof_Approval_Date').asdatetime)
  else
    qrlblLiveAppDate.caption := '';
  if (qryReport.fieldbyname('Proof_Approval_Date_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Proof_Approval_Date_Act').asstring <> '') then
      qrlblLiveAppDate.caption := 'COMPLETE';

  if (qryReport.fieldbyname('Proof_Required_Date').asdatetime <> 0) and
     (qryReport.fieldbyname('Proof_Required_Date').asstring <> '') then
      qrlblLiveReqDate.caption := pbdatestr(qryReport.fieldbyname('Proof_Required_Date').asdatetime)
  else
    qrlblLiveReqDate.caption := '';
  if (qryReport.fieldbyname('Proof_Required_Date_act').asdatetime <> 0) and
     (qryReport.fieldbyname('Proof_Required_Date_Act').asstring <> '') then
      qrlblLiveReqDate.caption := 'COMPLETE';

  if (qryReport.fieldbyname('Text_Available_Date').asdatetime <> 0) and
     (qryReport.fieldbyname('Text_Available_Date').asstring <> '') then
      qrlblTexttoDSDate.caption := pbdatestr(qryReport.fieldbyname('Text_Available_Date').asdatetime)
  else
    qrlblTexttoDSDate.caption := '';
  if (qryReport.fieldbyname('Text_Available_Date_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Text_Available_Date_Act').asstring <> '') then
      qrlblTexttoDSDate.caption := 'COMPLETE';

  if (qryReport.fieldbyname('Brief_Available_Date').asdatetime <> 0) and
     (qryReport.fieldbyname('Brief_Available_Date').asstring <> '') then
      qrlblBrieftoDSDate.caption := pbdatestr(qryReport.fieldbyname('Brief_Available_Date').asdatetime)
  else
    qrlblBrieftoDSDate.caption := '';
  if (qryReport.fieldbyname('Brief_Available_Date_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Brief_Available_Date_Act').asstring <> '') then
      qrlblBrieftoDSDate.caption := 'COMPLETE';

end;

procedure TPBRPDataServsWIPFrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //job bag
    tempStr := '"' + qryReport.fieldbyname('Job_Bag').asstring + '"';

    //account manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Descr').asstring + '"';

    //Data and Brief to DS
    tempStr := tempStr + ',"' + qrlblBrieftoDSDate.caption + '"';

    //text to DS
    tempStr := tempStr + ',"' + qrlblTexttoDSDate.caption + '"';

    //Live Proof Required Date
    tempStr := tempStr + ',"' + qrlblLiveReqDate.caption + '"';

    //Live Proof Approval Date
    tempStr := tempStr + ',"' + qrlblLiveAppDate.caption + '"';

    //Quantity/Volume
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Quantity').asstring + '"';

    //Mailing/Required Date
    tempStr := tempStr + ',"' + pbdatestr(qryReport.fieldbyname('Goods_Required').asdatetime) + '"';

    writeln(self.exportFile, tempStr);

    PBRSDataServsWIPfrm.prgbrExport.StepIt;
  end;
end;

end.
