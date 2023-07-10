unit PBRPWorksOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, gtQrCtrls, gtQrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TfrmPBRPWorksOrder = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    qrgWOrder: TQRGroup;
    QRLabel1: TQRLabel;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    gtQRDBText1: TgtQRDBText;
    qryContact: TQuery;
    gtQRShape1: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    gtQRDBText5: TgtQRDBText;
    gtQRDBText6: TgtQRDBText;
    qryWOProcesses: TQuery;
    dtsReport: TDataSource;
    qrsdtlProcesses: TQRSubDetail;
    qrygetNotes: TQuery;
    qrGrpProcesses: TQRGroup;
    gtProcess: TgtQRDBText;
    qryWOProcessQ: TQuery;
    qrbGrpProcessFooter: TQRBand;
    QRSubDetail1: TQRSubDetail;
    dtsWOProcesses: TDataSource;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText8: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRDBText9: TgtQRDBText;
    gtQRDBText10: TgtQRDBText;
    gtQRFilters1: TgtQRFilters;
    QRLabel6: TQRLabel;
    qrmAddress: TgtQRMemo;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TgtQRLabel;
    qrlblContactName: TgtQRLabel;
    qrlblTelephone: TgtQRLabel;
    qrlblFax: TgtQRLabel;
    qrlblEmail: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    qrMemoProcessNotes: TgtQRMemo;
    gtQRLabel13: TgtQRLabel;
    gtQRDBText11: TgtQRDBText;
    gtQRShape2: TgtQRShape;
    qrmAnswer: TgtQRRichText;
    gtQRDBText12: TgtQRDBText;
    qrgrpDelivery: TQRGroup;
    qrsdtlDelivery: TQRSubDetail;
    qryWODelivery: TQuery;
    gtQRLabel14: TgtQRLabel;
    gtQRDBText13: TgtQRDBText;
    gtQRDBText14: TgtQRDBText;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    gtQRLabel15: TgtQRLabel;
    gtQRLabel16: TgtQRLabel;
    gtQRShape14: TgtQRShape;
    gtQRShape15: TgtQRShape;
    gtQRLabel18: TgtQRLabel;
    gtQRShape16: TgtQRShape;
    gtQRLabel19: TgtQRLabel;
    gtQRShape17: TgtQRShape;
    gtQRLabel20: TgtQRLabel;
    gtQRLabel21: TgtQRLabel;
    gtQRShape18: TgtQRShape;
    gtQRShape19: TgtQRShape;
    gtQRShape20: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRShape22: TgtQRShape;
    gtQRShape23: TgtQRShape;
    gtQRShape24: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRDBText15: TgtQRDBText;
    gtQRDBText17: TgtQRDBText;
    gtQRDBText19: TgtQRDBText;
    gtQRDBText16: TgtQRDBText;
    qrchildDelivery: TQRChildBand;
    gtQRLabel22: TgtQRLabel;
    qrmDeliveryAddress: TgtQRMemo;
    qrgfWOrder: TQRBand;
    gtQRLabel23: TgtQRLabel;
    qrMemoNotes: TgtQRMemo;
    QRShape1: TQRShape;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRShape26: TgtQRShape;
    qrlblAccountCode: TgtQRLabel;
    QRShape2: TQRShape;
    gtQRShape28: TgtQRShape;
    qrlblAccountName: TgtQRLabel;
    qryUpWO: TQuery;
    qrlblProcessSize: TgtQRLabel;
    gtdbTextRunTime: TgtQRDBText;
    gtlblRunTime: TgtQRLabel;
    gtlblTeamSize: TgtQRLabel;
    gtdbtextTeamSize: TgtQRDBText;
    gtlblMAchineGroup: TgtQRLabel;
    OldqryWOProcesses: TQuery;
    gtdbtextMachineGroup: TgtQRDBText;
    gtlblMachine: TgtQRLabel;
    gtdbTextMachine: TgtQRDBText;
    QRShape3: TQRShape;
    gtQRLabel17: TgtQRLabel;
    gtQRShape4: TgtQRShape;
    gtlblPayment: TgtQRLabel;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRLabel10: TgtQRLabel;
    gtQRLabel11: TgtQRLabel;
    gtQRDBText7: TgtQRDBText;
    gtQRDBText18: TgtQRDBText;
    procedure qrgWOrderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsdtlProcessesAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrpProcessesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGrpProcessFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGrpProcessFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdtlDeliveryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgfWOrderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    ipage: integer;
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    ForceNewPage: boolean;
    WorksOrder: real;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
  end;

var
  frmPBRPWorksOrder: TfrmPBRPWorksOrder;

implementation

{$R *.dfm}

function TfrmPBRPWorksOrder.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Works_Order_Number').asfloat := self.WorksOrder;
      open;
      result := recordcount;
    end;
end;

procedure TfrmPBRPWorksOrder.qrgWOrderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  {Get the customer address details}

  qrmAddress.Lines.Clear;

  qryCustomer.close;
  qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
  qryCustomer.parambyname('Branch_no').asinteger := qryReport.FieldByName('Branch_no').AsInteger;
  qryCustomer.open;
  dtsAddress.dataset := qryCustomer;

  for i := 0 to 5 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;

  {Get the customer contact details}
  qryContact.close;
  qryContact.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
  qryContact.parambyname('Branch_no').asinteger := qryReport.FieldByName('Branch_no').AsInteger;
  qryContact.parambyname('Contact_no').asinteger := qryReport.FieldByName('Contact_no').AsInteger;
  qryContact.open;

  qrlblContactName.caption := qryContact.fieldbyname('Contact_Name').asstring;
  qrlblEmail.caption := qryContact.fieldbyname('Email').asstring;

  if qryContact.fieldbyname('Phone').asstring <> '' then
    qrlblTelephone.caption := qryContact.fieldbyname('Phone').asstring
  else
    qrlblTelephone.caption := qryContact.fieldbyname('Branch_Phone').asstring;

  if qryContact.fieldbyname('Fax_Number').asstring <> '' then
    qrlblFax.caption := qryContact.fieldbyname('Fax_Number').asstring
  else
    qrlblFax.caption := qryContact.fieldbyname('Branch_Fax_Number').asstring;

  qrMemoNotes.lines.clear;
  qrMemoNotes.lines.add(BuildNotes(qryReport.fieldbyname('Narrative').asinteger));

  qrgfWOrder.Enabled := (trim(qrMemoNotes.lines[0]) <> '');
end;

procedure TfrmPBRPWorksOrder.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  iPage := 0;
  with qryWOProcesses do
    begin
      close;
      open;
      qrsdtlProcesses.Enabled := (recordcount > 0)
    end;

  with qryWOProcessQ do
    begin
      close;
      open;
      qrsdtlProcesses.Enabled := (recordcount > 0)
    end;

  with qryWODelivery do
    begin
      close;
      open;
      qrsdtlDelivery.Enabled := (recordcount > 0)
    end;

end;

procedure TfrmPBRPWorksOrder.qrsdtlProcessesAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
//  qrsdtlProcesses.Height := 24;
//  qrrchTextProcessNotes.Height := 16;
end;

procedure TfrmPBRPWorksOrder.qrGrpProcessesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  stemp, sPaper, sNumberType: string;
begin
  if qryWOProcesses.fieldbyname('Laser_Format').asstring = 'S' then
    stemp := 'Simplex'
  else
  if qryWOProcesses.fieldbyname('Laser_Format').asstring = 'D' then
    stemp := 'Duplex'
  else
    sTemp := '';

  spaper := trim(qryWOProcesses.fieldbyname('Paper_Description').asstring) + ' ' + trim(qryWOProcesses.fieldbyname('Custom_Paper_Size').asstring);

  if qryWOProcesses.fieldbyname('Number_Type_Short_Desc').asstring = '' then
    sNumberType := ' up'
  else
    sNumberType := ' ' + qryWOProcesses.fieldbyname('Number_Type_Short_Desc').asstring;

(*  if stemp <> '' then
    stemp := ' - ' + sTemp + ' ' + trim(sPaper) + ' ' + qryWOProcesses.fieldbyname('Number_up').asstring + sNumberType
  else
    stemp := ' - ' + trim(sPaper) + ' ' + qryWOProcesses.fieldbyname('Number_up').asstring + sNumberType;

  if qryWOProcesses.fieldbyname('Short_Desc').asstring = '' then
    stemp := '';
*)

  if stemp <> '' then
    stemp := ' - ' + qryWOProcesses.fieldbyname('Number_up').asstring + sNumberType + ' ' + trim(sPaper) + ' ' + sTemp
  else
    stemp := ' - ' + qryWOProcesses.fieldbyname('Number_up').asstring + sNumberType + ' ' + trim(sPaper);

  if qryWOProcesses.fieldbyname('Short_Desc').asstring = '' then
    stemp := '';

  qrlblProcessSize.caption := stemp;

  gtlblRunTime.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('No_Of_hours').asfloat <> 0);
  gtdbtextRunTime.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('No_Of_hours').asfloat <> 0);
  gtlblTeamSize.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('Team_Count').asfloat <> 0);
  gtdbTextTeamSize.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('Team_Count').asfloat <> 0);
  gtlblMachineGroup.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('Work_Centre_Group_Name').asstring <> '');
  gtdbTextMachineGroup.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('Work_Centre_Group_Name').asstring <> '');
  gtlblMachine.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('Work_Centre_Name').asstring <> '');
  gtdbTextMachine.enabled := (qryWOProcesses.fieldbyname('Is_Work_centre_Based').asstring = 'Y') and (qryWOProcesses.fieldbyname('Work_Centre_Name').asstring <> '');

  if iPage > 0 then
    qrGrpProcesses.ForceNewPage := ForceNewPage;
  inc(iPage);
end;

procedure TfrmPBRPWorksOrder.qrbGrpProcessFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  qrbGrpProcessFooter.Height := 24;
//  qrrchTextProcessNotes.Height := 16;
  qrMemoProcessNotes.Height := 16;
end;

procedure TfrmPBRPWorksOrder.qrbGrpProcessFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iLines: integer;
begin
(*  qrrchTextProcessNotes.lines.clear;
  qrrchTextProcessNotes.lines.add(BuildNotes(qryWOProcesses.fieldbyname('Narrative').asinteger));

  qrbGrpProcessFooter.height := 24;
  if trim(qrrchtextProcessNotes.lines[0]) = '' then
    qrbGrpProcessFooter.height := 0;
  iLines := qrrchTextProcessNotes.lines.count;
  qrrchTextProcessNotes.Height := iLines * 18;
  qrbGrpProcessFooter.height := qrrchTextProcessNotes.height + 6;
*)
  qrMemoProcessNotes.lines.clear;
  qrMemoProcessNotes.lines.add(BuildNotes(qryWOProcesses.fieldbyname('Narrative').asinteger));

  qrbGrpProcessFooter.height := 24;
  if trim(qrMemoProcessNotes.lines[0]) = '' then
    qrMemoProcessNotes.height := 0;
  iLines := qrMemoProcessNotes.lines.count;
  qrMemoProcessNotes.Height := iLines * 18;
  qrbGrpProcessFooter.height := qrMemoProcessNotes.height + 6;
end;

procedure TfrmPBRPWorksOrder.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i, iLines: integer;
begin
  iLines := 0;
  qrmAnswer.Height := 17;
  for i := pred(qrmAnswer.Lines.Count) downto 0 do
    qrmAnswer.Lines.Delete(i);

  qrmAnswer.Lines.add(qryWOProcessQ.fieldbyname('Process_Answer').asstring);

  iLines := qrmAnswer.Lines.count;
  qrmAnswer.Height := (iLines * 17);
  qrsubdetail1.Height := qrmAnswer.Height + 4;
  gtqrshape2.Height := qrmAnswer.Height + 4;
  gtqrshape3.Height := qrmAnswer.Height + 4;
//  gtqrshape4.Height := qrmAnswer.Height + 4;
//  gtqrshape5.Height := qrmAnswer.Height + 4;
//  gtqrshape6.Height := qrmAnswer.Height + 4;
end;

procedure TfrmPBRPWorksOrder.qrsdtlDeliveryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
begin
  if qryWODelivery.FieldByName('Customer_Account').asstring = 'Y' then
    begin
      gtlblPayment.caption := 'Clients Docket';
      qrlblAccountCode.caption := qryWODelivery.FieldByName('Customer_Account_Code').asstring;
      qrlblAccountName.caption := qryWODelivery.FieldByName('Customer_Account_Name').asstring;
    end
  else
    begin
      gtlblPayment.caption := 'Our Docket';
      qrlblAccountCode.caption := 'N/A';
      qrlblAccountName.caption := 'N/A';
    end;

  qrchildDelivery.enabled := (qryWODelivery.FieldByName('postcode').asstring <> '');

  if qrchildDelivery.enabled then
    begin
      qrmDeliveryAddress.Lines.Clear;
      if trim(qryWODelivery.fieldbyname('Name').asstring) <> '' then
        qrmDeliveryAddress.Lines.Add(trim(qryWODelivery.fieldbyname('Name').asstring));

      for i := 13 to 17 do
        begin
          if trim(qryWODelivery.fields[i].asstring) <> '' then
            qrmDeliveryAddress.Lines.Add(trim(qryWODelivery.fields[i].asstring))
        end;
    end;
end;

function TfrmPBRPWorksOrder.BuildNotes(const iNotes: integer): string;
var
  aStr: string;
begin
  if iNotes > 0 then
    begin
      qryGetNotes.parambyname('Narrative').asinteger := iNotes;
      qryGetNotes.open;
      aStr := '';
      while (not qryGetNotes.eof) do
        Begin
          astr := aStr + qryGetNotes.fieldbyname('Narrative_text').asstring;
          if Length(qryGetNotes.fieldbyname('Narrative_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;

procedure TfrmPBRPWorksOrder.qrgfWOrderAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if bPreview then exit;
  if qryReport.FieldByName('Works_Order_Status').asinteger < 20 then
    begin
      with qryUpWO do
        begin
          close;
          parambyname('Works_Order').asinteger := qryReport.fieldbyname('Works_Order').asinteger;
          execsql;
        end;
    end;
end;

end.
