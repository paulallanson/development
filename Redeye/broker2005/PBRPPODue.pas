unit PBRPPODue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPPODueFrm = class(TForm)
    PrintPOsDueEnqQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    QRLabel3: TQRLabel;
    POsDataSource: TDataSource;
    DetailQRBand: TQRBand;
    CompDataSource: TDataSource;
    GetCompSQL: TFDQuery;
    ODueDateQRLabel: TQRLabel;
    SelSuppsQRLabel: TQRLabel;
    SupNamQRDBText: TQRDBText;
    PONumberQRLabel: TQRLabel;
    JobDescrQRDBText: TQRDBText;
    QRLabel11: TQRLabel;
    DateQRDBText: TQRDBText;
    QRLabel10: TQRLabel;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    QRLabel13: TQRLabel;
    OurPhoneQRDBText: TQRDBText;
    SuppRefQRDBText: TQRDBText;
    QRLabel12: TQRLabel;
    QtyQRLabel: TQRLabel;
    RunDateQRLabel: TQRLabel;
    Quantity: TQRDBText;
    SelCustQRLabel: TQRLabel;
    SupplierNameLbl: TQRLabel;
    ReportSelectionLbl: TQRLabel;
    QRShape1: TQRShape;
    Cust_SuppLbl: TQRLabel;
    QRDBText1: TQRDBText;
    GetPOsSQL: TFDQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    OnHoldLbl: TQRLabel;
    SuppgrpFooter: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    oldGetPOsSQL: TFDQuery;
    SuppGrpFooterChild: TQRChildBand;
    qrshpSupplierTerms: TQRShape;
    GetNarrSQL: TFDQuery;
    memSupplierNotes: TQRRichText;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    SuppQRGroup: TQRGroup;
    SuppBranchQRGroup: TQRGroup;
    procedure PrintPOsDueEnqQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure DetailQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    procedure BuildSupplierTerms(const iNarrative: integer);
  public
    ContactNo, SupplierNo, BranchNo, CustomerNo, CustBranchNo, AccountMgr: Integer;
    Preview: ByteBool;
    SupplierName, CustomerName: string;
    ODueDate: TDateTime;
    PrinterSettings: TPrinterSettings;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPPODueFrm: TPBRPPODueFrm;

implementation

uses PBImages, PBRSPODue, pbDatabase;

{$R *.DFM}

procedure TPBRPPODueFrm.PrintPOsDueEnqQuickReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
var
  iLines: integer;
begin
  with PrintPOsDueEnqQuickReport.PrinterSettings do
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
  RunDateQRLabel.Caption := 'Run Date: ' + DateToStr(Now);

  ODueDateQRLabel.Caption := 'For Orders Due Before: ' + DateToStr(ODueDate);
  if SupplierNo = 0 then
    SelSuppsQRLabel.Caption := 'All Suppliers'
  else
    SelSuppsQRLabel.Caption := 'For Supplier/Branch: ' + SupplierName;
  if CustomerNo = 0 then
    SelCustQRLabel.Caption := 'All Customers'
  else
    SelCustQRLabel.Caption := 'For Customer/Branch: ' + CustomerName;

  ReportselectionLbl.Caption := ODueDateQRLabel.Caption;
  {Activate the company query}
  with GetCompSQL do
  begin
    Close;
    Open;
    SuppGrpFooterChild.Enabled := (fieldbyname('Supplier_Payment_Terms').asinteger <> 0);
  end;

  if (GetCompSQL.fieldbyname('Supplier_Payment_Terms').asinteger <> 0) then
    begin
      SuppGrpFooterChild.Enabled := true;
      memSupplierNotes.lines.clear;
      BuildSupplierTerms(GetCompSQL.fieldbyname('Supplier_Payment_Terms').asinteger);
      qrshpSupplierTerms.Height := (memSupplierNotes.lines.count * 19) + 18;
    end
  else
    SuppGrpFooterChild.Enabled := false;
end;

function TPBRPPODueFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with GetPOsSQL do
  begin
    Close;
    ParamByName('Contact_No').AsInteger := ContactNo;
    ParamByName('Supplier').AsInteger := SupplierNo;
    ParamByName('Branch_No').AsInteger := BranchNo;
    ParamByName('ODue_Date').AsDateTime := ODueDate;
    ParamByName('Customer').AsInteger := CustomerNo;
    ParamByName('CustBranch').AsInteger := CustBranchNo;
    ParamByName('Account_Manager').AsInteger := AccountMgr;
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPPODueFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  PageNoQRLabel.Caption := 'Page: ' +
    IntToStr(PrintPOsDueEnqQuickReport.PageNumber);
end;

procedure TPBRPPODueFrm.DetailQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  PONumberLbl.Caption := PBFormatPONum(GetPOsSQL.fieldbyname('Purchase_order').asFloat,GetPOsSQL.fieldbyname('Line').asinteger) ;
  if GetPOsSQL.fieldbyname('Form_reference_id').asstring = '' then
    DetailQRBand.height := 19
  else
    DetailQRBand.height := 38;

  if GetPOsSQl.fieldbyname('On_Hold').asstring = 'Y' then
    OnHoldLbl.caption := 'ON HOLD'
  else
    OnHoldLbl.caption := '';
end;

procedure TPBRPPODueFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Supplier"'
    + ',"Telephone"'
    + ',"PO Number"'
    + ',"Job Description"'
    + ',"Form Reference"'
    + ',"Supplier Ref"'
    + ',"Date Due"'
    + ',"Quantity"'
    + ',"Customer"'
    + ',"Order Number"'
    + ',"Operator"'
    + ',"Account Manager"'
    + ',"On Hold"';

  writeLn(self.exportFile, tempStr);
  self.PrintPOsDueEnqQuickReport.Prepare;
  
  CloseFile(self.exportFile);
end;

procedure TPBRPPODueFrm.DetailQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting then
  begin
    //Supplier
    tempStr := '"' + GetPOsSQL.fieldByName('Name').asString + '"';

    //Phone Number
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Phone').asString + '"';

    //PO Number
//    tempStr := tempStr + ',"' + PONumberLbl.caption + '"';
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Purchase_Order').asString + '"';

    //Job Description
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Suppliers_Desc').asString + '"';

    //Form Reference ID
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Form_Reference_ID').asString + '"';

    //Job Reference
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Supplier_Job_Ref').asString + '"';

    //Date Due
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Date_Point').asString + '"';

    //Quantity to deliver
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Qty_to_Deliver').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Customer_Name').asString + '"';

    //Order Number
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Cust_Order_No').asString + '"';

    //Operator
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Operator_Short_Name').asString + '"';

    //Account Manager
    tempStr := tempStr + ',"' + GetPOsSQL.fieldByName('Account_Manager_Short_Name').asString + '"';

    //On hold
    tempStr := tempStr + ',"' + OnHoldlbl.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSPODueFrm.prgbrExport.StepIt;
  end;

end;

procedure TPBRPPODueFrm.BuildSupplierTerms(const iNarrative : integer);
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
  memSupplierNotes.Lines.Clear;
  memSupplierNotes.Lines.Text := aStr;
end;

end.
