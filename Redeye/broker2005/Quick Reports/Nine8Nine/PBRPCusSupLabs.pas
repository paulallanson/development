unit PBRPCusSupLabs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint, PBPOObjects, gtQrCtrls;

type
  TPBRPCusSupLabsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    GetDetsSQL: TQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    CustomerSQL: TQuery;
    AddressSRC: TDataSource;
    CompSQL: TQuery;
    AddressMemo: TQRMemo;
    lblCustomer: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    FAOQRLabel: TQRLabel;
    SupplierSQL: TQuery;
    qrmCompany: TQRMemo;
    imgReport: TgtQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure SetbAddressOnly(const Value: boolean);
  private
    FbAddressOnly: boolean;
  public
    Preview, bCustomer: ByteBool;
    iIntSel: Integer;
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPCusSupLabsFrm: TPBRPCusSupLabsFrm;

implementation

uses PBImages;

{$R *.DFM}

procedure TPBRPCusSupLabsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo: string;
begin
  if (blineup) then Exit;

  lblCustomer.caption := AddressSRC.Dataset.fieldbyname('Name').AsString;
end;

function TPBRPCusSupLabsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  sTempDelimiter: String;
begin
  {Activate the main report SQL} ;
  {Note that all this SQL does is provide a number of records depending on the number} ;
  {of copies of the label required} ;
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;
  {Get the company address regardless of whether it's the delivery address because} ;
  {it's printed on each PMS format label} ;
          with CompSQL do
          begin
            Close;
            Open;
          end;

  AddressMemo.Lines.Clear;
  If bCustomer then
    begin
    {Printing CUSTOMERS} ;
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := GetDetsSQL.FieldByName('Sel2').AsInteger;
      ParamByName('Branch_no').AsInteger := GetDetsSQL.FieldByName('Sel3').AsInteger;
      ParamByName('Contact_no').AsInteger := GetDetsSQL.FieldByName('Sel4').AsInteger;
      Open;
    end;
    AddressSRC.Dataset := CustomerSQL;
    end
  else
    begin
    {Printing SUPPLIERS} ;
    with SupplierSQl do
    begin
      Close;
      ParamByName('Supplier').AsInteger := GetDetsSQL.FieldByName('Sel2').AsInteger;
      ParamByName('Branch_no').AsInteger := GetDetsSQL.FieldByName('Sel3').AsInteger;
      ParamByName('Contact_no').AsInteger := GetDetsSQL.FieldByName('Sel4').AsInteger;
      Open;
    end;
    AddressSRC.Dataset := SupplierSQl;
    end;
  {Build the Address Memo field EXCEPT the postcode} ;
  for irow := 1 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  {Add the postcode details to the end of the last line} ;
  AddressMemo.Lines[AddressMemo.Lines.Count-1] := AddressMemo.Lines[AddressMemo.Lines.Count-1] + '  ' +
        AddressSRC.DataSet.FieldByName('PostCode').AsString ;
  
  Result := GetDetsSQL.RecordCount;
  {Build the Company Memo field}
 // CompNameQRLabel.caption := UpperCase(Trim(CompSQL.fieldbyname('Company_Name').asstring));
 // CompAddrQRLabel.caption := '' ;
  {add in all the address details EXCEPT the postcode} ;
  qrmCompany.lines.Clear;
  for irow := 1 to 5 do
    begin
    {No comma or space before 1st detail, comma and space after others, just a space} ;
    {before postcode} ;
//    Case iRow of
//        1:      sTempDelimiter := '' ;
//        2..4:   sTempDelimiter := ', ' ;
//        5:      sTempDelimiter := ' ' ;
//        end;
    if Trim(CompSQL.Fields[irow].AsString) = '' then continue;
    qrmCompany.Lines.Add(Trim(CompSQL.Fields[irow].AsString));
    end;
  {Finally, add the phone number} ;
  qrmCompany.Lines.Add('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
// Result := GetDetsSQL.RecordCount;
  {Get the FOA} ;
   if GetDetsSQL.FieldByName('Sel4').AsInteger = 0 then
    FAOQRLabel.Caption := ''
   else
    FAOQRLabel.Caption := AddressSRC.Dataset.FieldByName('Contact_Name').AsString ;
//  FAOCapQRLabel.Enabled := (Trim(FAOQRLabel.Caption) <> '') ;
end;

procedure TPBRPCusSupLabsFrm.PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with PBLabelsQuickReport.PrinterSettings do
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

  imgReport.Picture := PBImagesFrm.ReportImage.Picture;
end;

procedure TPBRPCusSupLabsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
