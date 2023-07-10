unit PBRPCustCreditTerms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, CCSPrint, DB, DBTables, CCSCommon, PBPOObjects,
  gtQrCtrls, gtQrExport, qrprntr, printers, QRCtrls;
type
  TPBRPCustCreditTermsFrm = class(TForm)
    qrpDetails: TQuickRep;
    qryDetails: TQuery;
    QRBand1: TQRBand;
    QRLabel3: TgtQRLabel;
    imgReport: TgtQRImage;
    CustomerAddMemo: TgtQRMemo;
    CompSQL: TQuery;
    gtQRSysData1: TgtQRSysData;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    qrlblAccountCode: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    qrlblCreditTerms: TgtQRLabel;
    qrlblCreditLimit: TgtQRLabel;
    QRBand2: TQRBand;
    qrlblForCompany: TgtQRLabel;
    qrlblForCustomer: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    gtQRLabel11: TgtQRLabel;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    qrmCompanyDetails: TgtQRMemo;
    memCreditTerms: TgtQRMemo;
    GetNarrSQL: TQuery;
    qrlblOperatorName: TgtQRLabel;
    qrlblOperatorPosition: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    qrlblOperatorPhone: TgtQRLabel;
    qrlblOperatorSignature: TgtQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure BuildCreditTerms(const iNarrative: integer);
  public
    bPrintLogo: boolean;
    iCustomer, iOperator: integer;
    sOperatorName, sOperatorPosition, sOperatorPhone, sOperatorJobTitle: string;
    PrinterSettings: TPrinterSettings;
    function GetDetails: integer;
  end;

var
  PBRPCustCreditTermsFrm: TPBRPCustCreditTermsFrm;

implementation

uses PBImages;

{$R *.dfm}

function TPBRPCustCreditTermsFrm.GetDetails: integer;
begin
  with qryDetails do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPCustCreditTermsFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  icount: Integer;
  UseBranchName: boolean;
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  irow: integer;
begin

  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpDetails.PrinterSettings.PaperSize := Size;   {set the number of copies }

  CustomerAddMemo.Lines.Clear;

  {Create the Customer Address details memo}
  UseBranchName := qryDetails.FieldByName('Use_Branch_Name').AsString = 'Y';

  if UseBranchName then
    CustomerAddMemo.Lines.Add(qryDetails.fieldbyname('Branch_Name').AsString)
  else
    CustomerAddMemo.Lines.Add(qryDetails.fieldbyname('Customer_Name').AsString);
    
  for icount := 13 to 18 do
  begin
    if qryDetails.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(qryDetails.Fields[icount].AsString);
  end;

  {Create the company address}
  with qrmCompanyDetails do
    begin
      CompSQL.close;
      CompSQL.open;
      Lines.Clear;
      for irow := 1 to 5 do
        begin
          if Trim(CompSQL.Fields[irow].AsString) <> '' then
            Lines.Append(Trim(CompSQL.Fields[irow].AsString)) ;
        end;
      {Finally, add the phone number} ;
      Lines.Append(' ');
      Lines.Append('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
      Lines.Append('Fax: ' + Trim(CompSQL.FieldByName('Fax_Number').AsString));
      Lines.Append('Email: ' + Trim(CompSQL.FieldByName('Email').AsString));
    end;

  qrlblAccountCode.caption := qryDetails.fieldbyname('Account_Code').AsString;
  qrlblCreditLimit.caption := formatfloat('£0.00',qryDetails.fieldbyname('Credit_Limit').Asfloat);
  qrlblCreditTerms.caption := qryDetails.fieldbyname('Payment_Terms_Description').Asstring;

  qrlblForCompany.caption := 'For ' + CompSQL.fieldbyname('Company_Name').Asstring;
  qrlblForCustomer.caption := 'For ' + qryDetails.fieldbyname('Customer_Name').Asstring;

  BuildCreditTerms(CompSQL.fieldbyname('Credit_Terms_Notes').Asinteger);

  qrlblOperatorName.caption := sOperatorName;
  qrlblOperatorSignature.caption := sOperatorName;
  qrlblOperatorPosition.caption := sOperatorPosition;
  qrlblOperatorPhone.caption := sOperatorPhone;
  qrlblOperatorPosition.caption := sOperatorJobTitle;

  if bPrintLogo then
  begin
    imgReport.Picture := PBImagesFrm.ReportImage.Picture;
    imgReport.Enabled := true;
    qrmCompanYDetails.Enabled := true;
  end
  else
  begin
    imgReport.Enabled := false;
    qrmCompanYDetails.Enabled := false;
  end;
end;

procedure TPBRPCustCreditTermsFrm.BuildCreditTerms(const iNarrative : integer);
var
  aStr : string;
begin
  if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
  memCreditTerms.Lines.Clear;
  memCreditTerms.Lines.Text := aStr;
end;

end.
