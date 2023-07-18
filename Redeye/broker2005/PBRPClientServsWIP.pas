unit PBRPClientServsWIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, qrprntr, Printers, CCSCommon;

type
  TPBRPClientServsWIPFrm = class(TForm)
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
    qrlblSEPApprovalDate: TQRLabel;
    qrlblSEPtoClientDate: TQRLabel;
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
  PBRPClientServsWIPFrm: TPBRPClientServsWIPFrm;

implementation

uses PBRSDataServsWIP;

{$R *.dfm}

function TPBRPClientServsWIPFrm.GetDetails: integer;
var
  temp: string;
begin
  qryReport.sql.clear;
  qryReport.sql.Text := qryDummy.sql.Text;

  if SortbyDate then
    temp := temp + 'ORDER BY Job_Bag.Goods_Required, Job_Bag_Schedule.Job_Bag'
  else
  if SortbyJob then
    temp := temp + 'ORDER BY Job_Bag_Schedule.Job_Bag, Job_Bag_Schedule.Schedule_no'
  else
  if SortbyAccMgr then
    temp := temp + 'ORDER BY Account_Manager, Job_Bag_Schedule.Job_Bag, Job_Bag_Schedule.Schedule_no'
  else
  if SortbyCustomer then
    temp := temp + 'ORDER BY Customer_Name, Job_Bag_Schedule.Job_Bag, Job_Bag_Schedule.Schedule_no';

  qryReport.SQL.Add(temp);
  with qryReport do
    begin
      close;
      parambyname('Account_Manager').AsInteger := AccManager;
      parambyname('Customer').AsInteger := Customer;
      parambyname('Date_from').AsDateTime := datefrom;
      parambyname('Date_to').asdatetime := dateto;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPClientServsWIPFrm.qrpDetailsBeforePrint(
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

procedure TPBRPClientServsWIPFrm.ExportToFile(fileName: string);
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
              + ',"Quantity"'
              + ',"Live Proof Date"'
              + ',"Live Proof Approval Date"'
              + ',"SEP to Client Date"'
              + ',"SEP Approval Date"'
              + ',"Date Required"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPClientServsWIPFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
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
  if (qryReport.fieldbyname('Proof_Required_Date_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Proof_Required_Date_Act').asstring <> '') then
      qrlblLiveReqDate.caption := 'COMPLETE';

  if (qryReport.fieldbyname('Sample_To_Client').asdatetime <> 0) and
     (qryReport.fieldbyname('Sample_To_Client').asstring <> '') then
      qrlblSEPtoClientDate.caption := pbdatestr(qryReport.fieldbyname('Sample_To_Client').asdatetime)
  else
    qrlblSEPtoClientDate.caption := '';
  if (qryReport.fieldbyname('Sample_To_Client_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Sample_To_Client_Act').asstring <> '') then
      qrlblSEPtoClientDate.caption := 'COMPLETE';

  if (qryReport.fieldbyname('Sample_Approval').asdatetime <> 0) and
     (qryReport.fieldbyname('Sample_Approval').asstring <> '') then
      qrlblSEPApprovalDate.caption := pbdatestr(qryReport.fieldbyname('Sample_Approval').asdatetime)
  else
    qrlblSEPApprovalDate.caption := '';
  if (qryReport.fieldbyname('Sample_Approval_Act').asdatetime <> 0) and
     (qryReport.fieldbyname('Sample_Approval_Act').asstring <> '') then
      qrlblSEPApprovalDate.caption := 'COMPLETE';
end;

procedure TPBRPClientServsWIPFrm.QRSubDetail1AfterPrint(
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

    //Quantity/Volume
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Quantity').asstring + '"';

    //Live Proof Required Date
    tempStr := tempStr + ',"' + qrlblLiveReqDate.caption + '"';

    //Live Proof Approval Date
    tempStr := tempStr + ',"' + qrlblLiveAppDate.caption + '"';

    //Data and Brief to DS
    tempStr := tempStr + ',"' + qrlblSEPtoClientDate.caption + '"';

    //text to DS
    tempStr := tempStr + ',"' + qrlblSEPApprovalDate.caption + '"';

    //Mailing/Required Date
    tempStr := tempStr + ',"' + pbdatestr(qryReport.fieldbyname('Goods_Required').asdatetime) + '"';

    writeln(self.exportFile, tempStr);

    PBRSDataServsWIPfrm.prgbrExport.StepIt;
  end;
end;

end.
