unit PBRPProof;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, CCSPrint, CCSCommon,
  gtQrCtrls;

type
  TPBRPProofFrm = class(TForm)
    PrintPOsQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    DetailQRBand: TQRBand;
    OrderLbl: TQRLabel;
    QRLabel4: TQRLabel;
    PONumberLbl: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    YourRefLbl: TQRLabel;
    AddressMemo: TQRMemo;
    GetProofSQL: TQuery;
    GetCompSQL: TQuery;
    CompSRC: TDataSource;
    POsSRC: TDataSource;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    GetPOSQL: TQuery;
    QRLabel20: TQRLabel;
    LabQuantity: TQRLabel;
    LabJobTitle: TQRLabel;
    LabDepth: TQRLabel;
    LabWidth: TQRLabel;
    FormRefSQL: TQuery;
    DateLbl: TQRLabel;
    UpdSQL: TQuery;
    AddSQL: TQuery;
    qryZero: TQuery;
    GetLastSQL: TQuery;
    lblProofRevision: TQRLabel;
    UpdPOSQL: TQuery;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lblOfficeContact: TQRLabel;
    QRDBText1: TQRDBText;
    QRMemoCmpnyNm: TQRMemo;
    gtlblFSCClaim: TgtQRLabel;
    qryGetFSCClaim: TQuery;
    qrlblVatNo: TgtQRMemo;
    ReportImage: TgtQRImage;
    procedure PrintPOsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure DetailQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure POsSRCDataChange(Sender: TObject; Field: TField);
    function GetDetails(Sender: TObject): Integer;
    procedure FormCreate(Sender: TObject);
    procedure PageHeaderQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    Continued: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
  public
    ProofRevision: string;
    ProofDefault: string;
    PONumber: real;
    iCustomer, iBranch: Integer;
    sByCustomer, sByBranch: string[1];
    OnlyMine, Preview, PrintLogo: ByteBool;
    PrinterSettings : TPrinterSettings;
    function GetNextDbKey : integer;
  end;

var
  PBRPProofFrm: TPBRPProofFrm;

implementation

uses PBImages, pbMainMenu;

{$R *.DFM}

procedure TPBRPProofFrm.PrintPOsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  irow: integer;
  sAddress: string;
begin
  with PrintPOsQuickReport.PrinterSettings do
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
  if PrintLogo then
  begin
    ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
    ReportImage.Enabled := true;
    qrMemoCmpnyNm.enabled := true;
    qrlblVatNo.Enabled := true;
  end;
  {Activate the company SQL}
  with GetCompSQL do
  begin
    Close;
    Open;
    First;
  end;

  with QRMemoCmpnyNm do
  begin
    sAddress := '';
    Lines.Clear;
    for irow := 1 to 5 do
      begin
        if Trim(GetCompSQL.Fields[3+irow].AsString) <> '' then
          sAddress := sAddress + Trim(GetCompSQL.Fields[3+irow].AsString) + ' ';
      end;
    Lines.Append(Trim(sAddress)) ;
  {Finally, add the phone number} ;
    Lines.Append('T ' + Trim(GetCompSQL.FieldByName('Phone').AsString) + ' F ' + Trim(GetCompSQL.FieldByName('Fax_Number').AsString));
    Lines.Append('www.nine8nine.co.uk');
  end;
end;

function TPBRPProofFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with GetProofSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PONumber;
    ParamByName('Customer').AsInteger := iCustomer;
    ParamByName('ByCustomer').AsString := sByCustomer;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('ByBranch').AsString := sByBranch;
    if OnlyMine then
      ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator
    else
      ParamByName('Operator').AsInteger := 0;
    Open;
    Result := RecordCount;
    PosSRC.Dataset := GetProofSQL;
    PrintPOsQuickReport.DataSet := GetProofSQL;
  end;
end;

procedure TPBRPProofFrm.DetailQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sFSCClaim: string;
begin
 with GetPOSQL do
   begin
     close;
     parambyname('Enquiry').asinteger := PosSRC.Dataset.FieldByName('Enquiry').AsInteger;
     parambyname('Line').asinteger := PosSRC.Dataset.FieldByName('Enquiry_line').AsInteger;
     open;
   end;
  OrderLbl.Caption := 'Proof Approval: ';
  YourRefLbl.Caption := PosSRC.Dataset.FieldByName('Cust_Order_no').AsString;

  {Get the Customer details}
  AddressMemo.Lines.Clear;
  AddressMemo.Lines.Add(POsSRC.Dataset.fieldbyname('Cust_Contact_Name').asstring);
  for irow := 13 to 18 do
  begin
    if Trim(POsSRC.Dataset.Fields[irow].AsString) = '' then Continue;
    AddressMemo.Lines.Add(Trim(POsSRC.Dataset.Fields[irow].AsString));
  end;

(*  lblCompanyAddress.caption := '';
  {Get the Phone details}
  if PrintLogo then
    begin
      for irow := 4 to 8 do
        begin
          if Trim(GetCompSQl.Fields[irow].AsString) = '' then Continue;
          lblCompanyAddress.Caption := lblCompanyAddress.caption + Trim(GetCompSQl.Fields[irow].AsString) + '  ';
        end;
        {Do phone numbers}
        if Trim(GetCompSQl.Fields[9].AsString) <> '' then
          lblCompanyAddress.Caption := lblCompanyAddress.caption + 'Telephone: ' + Trim(GetCompSQl.Fields[9].AsString) + '  ';

        if Trim(GetCompSQl.Fields[10].AsString) <> '' then
          lblCompanyAddress.Caption := lblCompanyAddress.caption + 'Facsimile: ' + Trim(GetCompSQl.Fields[10].AsString) + '  ';
    end;
*)
  PONumberLbl.Caption := OrderLbl.Caption + ' '
    + PBFormatPONum(POsSRC.dataSet.FieldByName('Purchase_Order').AsFloat,POsSRC.DataSet.FieldByName('Line').AsInteger);

  LabQuantity.caption := POsSRC.Dataset.fieldbyname('Quantity').asstring;
  LabJobTitle.caption := POsSRC.Dataset.fieldbyname('Customers_Desc').asstring;
  LabDepth.caption := POsSRC.Dataset.fieldbyname('Depth').asstring + ' ' + POsSRC.Dataset.fieldbyname('Depth_Unit').asstring;
  LabWidth.caption := POsSRC.Dataset.fieldbyname('Width').asstring + ' ' + POsSRC.Dataset.fieldbyname('Width_Unit').asstring;

  {FSC Claim}
  gtlblFSCClaim.Enabled := false;
  gtlblFSCClaim.Caption := '';
  if POsSRC.Dataset.fieldbyname('FSC_Material_Claim').asinteger <> 0 then
    begin
      with qryGetFSCClaim do
        begin
          close;
          parambyname('FSC_Material_Claim').asinteger := POsSRC.Dataset.fieldbyname('FSC_Material_Claim').asinteger;
          open;
          if recordcount > 0 then
            begin
              gtlblFSCClaim.Enabled := true;
              if fieldbyname('Mixed_Claim').asstring = 'Y' then
                sFSCClaim := stringreplace(fieldbyname('Short_Description').asstring,'X',formatfloat('0',POsSRC.Dataset.fieldbyname('FSC_Mixed_Percentage').asfloat),[])
              else
                sFSCClaim := fieldbyname('Short_Description').asstring;
              if trim(fieldbyname('Claim_Type').asstring) = 'FSC' then
                gtlblFSCClaim.Caption := 'FSC Claim: ' + sFSCClaim
              else
                gtlblFSCClaim.Caption := 'PEFC Declaration: ' + sFSCClaim
            end
          else
            begin
              gtlblFSCClaim.Caption := '';
            end;
        end;
    end;

(*  if POsSRC.Dataset.fieldbyname('Form_Reference').asstring <> '' then
    begin
      with FormRefSQL do
        begin
          close;
          parambyname('Form_Reference').asinteger := POsSRC.Dataset.fieldbyname('Form_Reference').asinteger;
          open;

          FormRefLbl.caption := fieldbyname('Form_Reference_ID').asstring;
          FormRefDescLbl.caption := fieldbyname('Form_Reference_Descr').asstring;

          FormRefLbl.enabled := fieldbyname('Form_Reference_ID').asstring <> '';
          FormRefDescLbl.enabled := fieldbyname('Form_Reference_Descr').asstring <> '';
        end
    end
  else
    begin
      FormRefLbl.enabled := false;
      FormRefDescLbl.enabled := false;
    end;
*)end;

procedure TPBRPProofFrm.POsSRCDataChange(Sender: TObject; Field: TField);
begin
  Continued := False;
end;

procedure TPBRPProofFrm.FormCreate(Sender: TObject);
begin
  sByCustomer := 'N';
  sByBranch := 'N';
end;

procedure TPBRPProofFrm.PageHeaderQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  {set flag to say if you get to the page top, this is a continuation}
  Continued := True;
end;

procedure TPBRPProofFrm.PageHeaderQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DateLbl.Caption := FormatDateTime('dd mmmm yyyy', Date);
  lblOfficeContact.caption := 'Office Contact: ' + POsSRC.Dataset.fieldbyname('Contact_Name').asstring;
  if ProofRevision = '' then
    lblProofRevision.caption := POsSRC.Dataset.fieldbyname('Proof_Revision').asstring
  else
    lblProofRevision.caption := ProofRevision;
end;

procedure TPBRPProofFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  icode: integer;
begin
  {Update the Proof status to 'With Customer' - only if printing not preview}
  if Preview then exit;
  iCode := GetNextDbKey;

  with UpdPOSQL do
    begin
      close;
      parambyname('Purchase_Order').asfloat := POsSRC.DataSet.FieldByName('Purchase_Order').asfloat;
      parambyname('Line').asinteger := POsSRC.DataSet.FieldByName('Line').AsInteger;
      parambyname('Proof_revision').asstring := ProofRevision;
      execsql;
    end;

  with UpdSQL do
    begin
      Close;
      ParamByName('Proof_History').AsInteger := iCode;
      ParamByName('Purchase_Order').asfloat := POsSRC.DataSet.FieldByName('Purchase_Order').asfloat;
      ParamByName('Line').AsInteger := POsSRC.DataSet.FieldByName('Line').AsInteger;
      ParamByName('Proof_Date').AsDateTime := now;
      ParamByName('Proof_Status').AsString := ProofDefault;
      ParamByName('Operator').Asinteger := frmpbMainMenu.iOperator;
      ExecSQL;
    end;
end;

procedure TPBRPProofFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Proof_History ' +
            '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line) ' +
            'VALUES(0, ''D'', ''01/01/2000'',null,null)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBRPProofFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Proof_History Where Proof_History=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBRPProofFrm.GetNextDbKey: integer;
var
  aDouble : double;
begin
  { We can't use GUIDs here to be unique as there isn't a string
    field in the table so use the PC's current date/time and the
    PO Number/Line to be as unique as possible.  We have to be
    very, very unlucky for two users to hit this code at the identical
    minute on the same PO and Line. }
  AddZero;
  try
    aDouble := Now;
    with AddSQL do
    begin
      ParamByName('Date').AsDateTime := aDouble;
      ParamByName('Order').Asfloat := POsSRC.DataSet.FieldByName('Purchase_Order').asfloat;
      ParamByName('Line').AsInteger := POsSRC.DataSet.FieldByName('Line').AsInteger;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Date').AsDateTime := aDouble;
      ParamByName('Order').Asfloat := POsSRC.DataSet.FieldByName('Purchase_Order').asfloat;
      ParamByName('Line').AsInteger := POsSRC.DataSet.FieldByName('Line').AsInteger;
      Open;
      Result := FieldByName('Proof_History').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
