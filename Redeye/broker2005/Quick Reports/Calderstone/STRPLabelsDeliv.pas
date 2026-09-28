unit STRPLabelsDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, Grids, DBGrids,
  CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPLabelsDelivFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    SODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressSRC: TDataSource;
    AdhocSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    SODelivSQL: TFDQuery;
    QRShape3: TQRShape;
    CompNameQRLabel: TQRLabel;
    CompAddrQRLabel: TQRLabel;
    QRShape4: TQRShape;
    CompSQL: TFDQuery;
    QRLabel7: TQRLabel;
    DescrQRLabel: TQRLabel;
    QRLabel1: TQRLabel;
    FormRefLbl: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    FAOQRLabel: TQRLabel;
    AddressMemo: TQRMemo;
    lblCustomer: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
  public
    Preview: ByteBool;
    iSONumber: integer;
    iLine, iBoxQuantity, iSets: Integer;
    iIntSel: Integer;
    LogoPath: string;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
  end;

var
  STRPLabelsDelivFrm: TSTRPLabelsDelivFrm;

implementation

{$R *.DFM}

procedure TSTRPLabelsDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  if (blineup) then Exit;

  FormRefLbl.Caption := SODelivSQL.FieldByName('Sales_Order').AsString;
end;

function TSTRPLabelsDelivFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  sTempDelimiter: string;
  UseBrnchNm: ByteBool;
begin
  {Activate the main report SQL}
  with SODelivSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;

  AddressMemo.Lines.Clear;

{Get the company address regardless of whether it's the delivery address because} ;
  {it's printed on each PMS format label} ;
          with CompSQL do
          begin
            Close;
            Open;
          end;

  UseBrnchNm := False;
  if SODelivSQL.FieldByName('Delivery_Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := SODelivSQL.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger := SODelivSQL.FieldByName('Delivery_Branch').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end;
  if SODelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      UseBrnchNm := true;
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          SODelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := AdhocSQL;
    end ;
   {Get the FOA} ;
  if SODelivSQL.FieldByName('Delivery_Customer').AsString <> '' then
  begin
    FAOQRLabel.Caption := SODelivSQL.FieldByName('Contact_Name').AsString ;
  end
  else
  begin
    FAOQRLabel.Caption := '';
    QRLabel3.Caption  := '';
  end;
  {can only get ftao if is deliv to customer} ;


  for irow := 1 to 4 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  {Add the postcode details to the end of the last line} ;
  AddressMemo.Lines[AddressMemo.Lines.Count-1] := trim(AddressMemo.Lines[AddressMemo.Lines.Count-1]) + '  ' +
        AddressSRC.DataSet.FieldByName('PostCode').AsString ;

  Result := SODelivSQL.RecordCount;
  if not UseBrnchNm then
    begin
      lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString;
    end
  else
    begin
      lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
    end;

    {Build the Company Memo field}
  CompNameQRLabel.caption := UpperCase(Trim(CompSQL.fieldbyname('Company_Name').asstring));
  CompAddrQRLabel.caption := '' ;
  {add in all the address details EXCEPT the postcode} ;
  for irow := 1 to 5 do
    begin
    {No comma or space before 1st detail, comma and space after others, just a space} ;
    {before postcode} ;
    Case iRow of
        1:      sTempDelimiter := '' ;
        2..4:   sTempDelimiter := ', ' ;
        5:      sTempDelimiter := ' ' ;
        end;
    if Trim(CompSQL.Fields[irow].AsString) <> '' then
        CompAddrQRLabel.caption := CompAddrQRLabel.caption + sTempDelimiter +
                        Trim(CompSQL.Fields[irow].AsString);
    end;
  {Finally, add the phone number} ;
  {CompQRMemo.Lines.Add('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString))};
  DescrQRLabel.Caption := SODelivSQL.fieldByName('Cust_Order_No').AsString;
  FormRefLbl.Caption := SODelivSQL.FieldByName('Sales_Order').AsString;
end;

procedure TSTRPLabelsDelivFrm.STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with STLabelsQuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;
end;

end.
