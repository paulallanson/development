unit PBRPWorksOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, QrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TfrmPBRPWorksOrder = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    qrgWOrder: TQRGroup;
    QRLabel1: TQRLabel;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    gtQRDBText1: TQRDBText;
    qryContact: TQuery;
    gtQRShape1: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    gtQRDBText5: TQRDBText;
    gtQRDBText6: TQRDBText;
    qryWOProcesses: TQuery;
    dtsReport: TDataSource;
    qrsdtlProcesses: TQRSubDetail;
    qrygetNotes: TQuery;
    qrGrpProcesses: TQRGroup;
    gtProcess: TQRDBText;
    qryWOProcessQ: TQuery;
    qrbGrpProcessFooter: TQRBand;
    QRSubDetail1: TQRSubDetail;
    dtsWOProcesses: TDataSource;
    gtQRLabel2: TQRLabel;
    gtQRDBText8: TQRDBText;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRDBText9: TQRDBText;
    gtQRDBText10: TQRDBText;
    gtQRFilters1: TgtQRFilters;
    QRLabel6: TQRLabel;
    qrmAddress: TQRMemo;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    qrlblContactName: TQRLabel;
    qrlblTelephone: TQRLabel;
    qrlblFax: TQRLabel;
    qrlblEmail: TQRLabel;
    QRDBText3: TQRDBText;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape3: TQRShape;
    gtQRLabel9: TQRLabel;
    qrMemoProcessNotes: TQRMemo;
    gtQRLabel13: TQRLabel;
    gtQRDBText11: TQRDBText;
    gtQRShape2: TQRShape;
    qrmAnswer: TQRRichText;
    gtQRDBText12: TQRDBText;
    qrgrpDelivery: TQRGroup;
    qrsdtlDelivery: TQRSubDetail;
    qryWODelivery: TQuery;
    gtQRLabel14: TQRLabel;
    gtQRDBText13: TQRDBText;
    gtQRDBText14: TQRDBText;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    gtQRLabel15: TQRLabel;
    gtQRLabel16: TQRLabel;
    gtQRShape14: TQRShape;
    gtQRShape19: TQRShape;
    gtQRShape21: TQRShape;
    gtQRDBText15: TQRDBText;
    gtQRDBText17: TQRDBText;
    gtQRDBText19: TQRDBText;
    gtQRDBText16: TQRDBText;
    qrchildDelivery: TQRChildBand;
    gtQRLabel22: TQRLabel;
    qrmDeliveryAddress: TQRMemo;
    qrgfWOrder: TQRBand;
    gtQRLabel23: TQRLabel;
    qrMemoNotes: TQRMemo;
    QRShape1: TQRShape;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRShape26: TQRShape;
    qrlblAccountCode: TQRLabel;
    QRShape2: TQRShape;
    gtQRShape28: TQRShape;
    qrlblAccountName: TQRLabel;
    qryUpWO: TQuery;
    qrlblProcessSize: TQRLabel;
    gtdbTextRunTime: TQRDBText;
    gtlblRunTime: TQRLabel;
    gtlblTeamSize: TQRLabel;
    gtdbtextTeamSize: TQRDBText;
    gtlblMAchineGroup: TQRLabel;
    OldqryWOProcesses: TQuery;
    gtdbtextMachineGroup: TQRDBText;
    gtlblMachine: TQRLabel;
    gtdbTextMachine: TQRDBText;
    QRShape3: TQRShape;
    gtQRLabel17: TQRLabel;
    gtQRShape4: TQRShape;
    gtlblPayment: TQRLabel;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRDBText7: TQRDBText;
    gtQRDBText18: TQRDBText;
    QRBand1: TQRBand;
    gtQRLabel12: TQRLabel;
    qrlblPaymentTerms: TQRLabel;
    QRGroup1: TQRGroup;
    qrsdtPOrders: TQRSubDetail;
    qryWOPOrders: TQuery;
    dsWOPOrders: TDataSource;
    gtQRLabel26: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel27: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRLabel28: TQRLabel;
    gtQRShape11: TQRShape;
    gtQRLabel29: TQRLabel;
    gtQRShape27: TQRShape;
    gtQRShape20: TQRShape;
    gtQRShape29: TQRShape;
    gtQRShape30: TQRShape;
    gtQRDBText20: TQRDBText;
    gtQRDBText21: TQRDBText;
    gtQRDBText22: TQRDBText;
    gtQRShape31: TQRShape;
    gtQRShape32: TQRShape;
    gtQRLabel30: TQRLabel;
    gtQRDBText23: TQRDBText;
    gtQRLabel19: TQRLabel;
    gtQRLabel20: TQRLabel;
    gtQRLabel21: TQRLabel;
    QRShape4: TQRShape;
    gtQRShape15: TQRShape;
    QRShape5: TQRShape;
    gtQRShape16: TQRShape;
    QRShape6: TQRShape;
    gtQRShape17: TQRShape;
    QRShape7: TQRShape;
    gtQRLabel18: TQRLabel;
    gtQRShape18: TQRShape;
    qrChildReturnAddress: TQRChildBand;
    gtQRLabel31: TQRLabel;
    qrmReturnAddress: TQRMemo;
    qryGetCompAddr: TQuery;
    qryGetCustAddr: TQuery;
    qryGetAddHocAddr: TQuery;
    dtsReturnAddress: TDataSource;
    qryGetCompBrAddr: TQuery;
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
    function GetReturnAddress(iTempCode, iTempBranch,
      iTempType: Integer): string;
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

uses pbDatabase;

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

  if qryCustomer.fieldbyname('Payment_Terms_Description').asstring = '' then
    qrlblPaymentTerms.Caption := 'No payment Terms defined'
  else
    qrlblPaymentTerms.Caption := qryCustomer.fieldbyname('Payment_Terms_Description').asstring;

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

  qrchildReturnAddress.enabled := (qryReport.fieldbyname('Return_Company').asinteger <> 0) or
                                  (qryReport.fieldbyname('Return_Customer').asinteger <> 0) or
                                  (qryReport.fieldbyname('Return_Customer_Ad_hoc_Address').asinteger <> 0);

  if qrChildReturnAddress.enabled then
    begin
      if qryReport.FieldByName('Return_Company').asinteger <> 0 then
        GetReturnAddress(0, qryReport.FieldByName('Return_Company_Branch').asinteger, 1)
      else
      if qryReport.FieldByName('Return_Customer').asinteger <> 0 then
        GetReturnAddress(qryReport.FieldByName('Return_Customer').asinteger, qryReport.FieldByName('Return_Branch_no').asinteger, 2)
      else
      if qryReport.FieldByName('Return_Customer_Ad_hoc_Address').asinteger <> 0 then
        GetReturnAddress(qryReport.FieldByName('Return_Customer_Ad_hoc_Address').asinteger, 0, 3);

      {Build the address}
      qrmReturnAddress.Lines.Clear;
      if trim(dtsReturnAddress.Dataset.fieldbyname('Name').asstring) <> '' then
        qrmReturnAddress.Lines.Add(trim(dtsReturnAddress.Dataset.fieldbyname('Name').asstring));

      {Add the branch name if required}
      if trim(dtsReturnAddress.Dataset.fieldbyname('Use_Branch_Name').asstring) = 'Y' then
        qrmReturnAddress.Lines.Add(trim(dtsReturnAddress.Dataset.fieldbyname('Branch_Name').asstring));

      for i := 1 to 6 do
        begin
          if trim(dtsReturnAddress.Dataset.fields[i].asstring) <> '' then
            qrmReturnAddress.Lines.Add(trim(dtsReturnAddress.Dataset.fields[i].asstring))
        end;
    end;
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
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
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

  if dmBroker.DisplayWIPurchaseOrders then
    begin
      with qryWOPOrders do
        begin
          close;
          open;
          qrsdtPOrders.Enabled := (recordcount > 0)
        end;
    end
  else
    qrsdtPOrders.Enabled := false;

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

function TfrmPBRPWorksOrder.GetReturnAddress(iTempCode, iTempBranch, iTempType: Integer): string;
begin
  {Build a suitable description for the delivery}
  if iTempType = 1 then {Customer address}
    begin
      if iTempBranch <> 0 then
        begin
          dtsReturnAddress.DataSet := qryGetCompBrAddr;
          with qryGetCompBrAddr do
          begin
            Close;
            ParamByName('Branch_No').AsInteger := iTempBranch;
            Open;
            Result := 'Here:  ' + Trim(FieldByName('Name').AsString);
          end;
        end
      else
        begin
          dtsReturnAddress.DataSet := qryGetCompAddr;
          with qryGetCompAddr do
            begin
              Close;
              Open;
              Result := 'Here:  ' + FieldByName('Name').AsString;
            end;
        end;
    end
  else
  if iTempType = 2 then {Customer address}
    begin
      dtsReturnAddress.DataSet := qryGetCustAddr;
      with qryGetCustAddr do
      begin
        Close;
        ParamByName('Customer').AsInteger := iTempcode;
        ParamByName('Branch_No').AsInteger := iTempBranch;
        Open;
        Result := 'Cust/Br:  ' + Trim(FieldByName('Name').AsString);
      end;
    end
  else
  if iTempType = 3 then {Ad-hoc address}
    begin
      dtsReturnAddress.DataSet := qryGetAddHocAddr;
      with qryGetAddHocAddr do
      begin
        Close;
        ParamByName('Ad_Hoc_Address').AsInteger := iTempCode;
        Open;
        Result := 'Ad Hoc:  ' + FieldByName('Name').AsString;
      end;
    end;
end;

end.
