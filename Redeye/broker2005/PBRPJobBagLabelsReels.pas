unit PBRPJobBagLabelsReels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint, PBPOObjects, qrprntr, printers;

type
  TPBRPJobBagLabelsReelsFrm = class(TForm)
    PBLabelsQuickReport: TQuickRep;
    JBDelivSQL: TQuery;
    JBDelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    JBNumberLbl: TQRLabel;
    CustomerSQL: TQuery;
    AdhocSQL: TQuery;
    RepSQL: TQuery;
    SupplierSQL: TQuery;
    AddressSRC: TDataSource;
    CompSQL: TQuery;
    BoxQuantityLbl: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    QRDBCustOrderRef: TQRDBText;
    lblCustomer: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    NumberedLbl: TQRLabel;
    FromLbl: TQRLabel;
    qrmCompany: TQRMemo;
    ReportImage: TQRImage;
    qryGetFSCClaim: TQuery;
    Memodescription: TQRMemo;
    QRLabel7: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
    FbAddressOnly: boolean;
    procedure SetbAddressOnly(const Value: boolean);
    procedure SetCaptions;
  public
    useCustAddress: ByteBool;
    Preview: ByteBool;
    JobBag: integer;
    iBoxQuantity: Integer;
    iIntSel: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    bStocked: string;
    PrinterSettings : TPrinterSettings;
    property bAddressOnly: boolean read FbAddressOnly write SetbAddressOnly;
  end;

var
  PBRPJobBagLabelsReelsFrm: TPBRPJobBagLabelsReelsFrm;

implementation

uses CCSCommon, PBImages;

{$R *.DFM}

procedure TPBRPJobBagLabelsReelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo, sFSCClaim: string;
begin
  if (blineup) then Exit;

  SetCaptions;
  if bAddressOnly then exit;

  JBNumberLbl.Caption := JBDelivSQL.FieldByName('Job_Bag').AsString;

  if iBoxQuantity <= 0 then
    begin
      BoxQuantityLbl.enabled := false;
    end
  else
    begin
      BoxQuantityLbl.enabled := true;
      BoxQuantityLbl.Caption := IntToStr(iBoxQuantity);
    end;

  MemoDescription.lines.clear;
  MemoDescription.lines.add(JBDelivSQL.Fieldbyname('Job_Bag_Descr').asstring);

  if Trim(sNumberFrom) <> '' then
  begin
    sFrom := Trim(sPrefix) + Trim(sNumberFrom);
    sNumberTo := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity) - 1);
    sTo := Trim(sPrefix) + Trim(sNumberTo);
    FromLbl.Caption := sFrom + ' - ' + sTo;
    sNumberFrom := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity));
  end
  else
  begin
    NumberedLbl.Enabled := false;
    FromLbl.Enabled := false;
  end;

end;

function TPBRPJobBagLabelsReelsFrm.GetDetails(Sender: TObject): Integer;
var
  irow: integer;
  UseBrnchNm: ByteBool;
begin
  {Activate the main report SQL}
  with JBDelivSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;

//  AddressMemo.Lines.Clear;
  UseBrnchNm := False;
  if (self.useCustAddress) then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        JBDelivSQL.FieldByName('iCustomer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        JBDelivSQL.FieldByName('ordBranch').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else if (JBDelivSQL.FieldByName('Customer').AsString <> '') then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        JBDelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        JBDelivSQL.FieldByName('Branch_no').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
    if JBDelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          JBDelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := AdhocSQL;
    end
  else
    if JBDelivSQL.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            JBDelivSQL.FieldByName('Rep').AsInteger;
          Open;
        end;
        AddressSRC.Dataset := RepSQL;
      end
    else
      if JBDelivSQL.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              JBDelivSQL.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              JBDelivSQL.FieldByName('Supplier_Branch').AsInteger;
            Open;
          end;
          AddressSRC.Dataset := SupplierSQL;
        end
        else
        begin
          with CompSQL do
          begin
            Close;
            Open;
          end;
          AddressSRC.Dataset := CompSQL;
        end;

  if not UseBrnchNm then
    lblcustomer.Caption := AddressSRC.dataset.Fields[0].AsString
  else
    lblcustomer.Caption := AddressSRC.Dataset.FieldByName('Branch_Name').AsString;
  Result := JBDelivSQL.RecordCount;
end;

procedure TPBRPJobBagLabelsReelsFrm.PBLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  irow: integer;
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}

  PBLabelsQuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  PBLabelsQuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  PBLabelsQuickReport.PrinterSettings.Copies := Copies;   {set the output bin the }

  ReportImage.enabled := true;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

    {determine whether to show address or not}
  if bstocked = 'Y' then
    begin
      Numberedlbl.Enabled := True;
      fromLbl.Enabled := True;
    end;

  {Build the company address details}
  with CompSQL do
    begin
      qrmCompany.Lines.clear;
      Close;
      Open;
      for irow := 1 to 5 do
      begin
        if Fields[irow].AsString = '' then Continue;
          qrmCompany.Lines.Add(Trim(Fields[irow].AsString));
      end;
      {Finally, add the phone number} ;
      qrmCompany.Lines.Add('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
  end;

end;

procedure TPBRPJobBagLabelsReelsFrm.SetCaptions;
begin
  JBNumberLbl.enabled := not bAddressOnly;
  MemoDescription.enabled := not bAddressOnly;
  BoxQuantityLbl.enabled := not bAddressOnly;
  QRLabel3.enabled := not bAddressOnly;
  QRLabel4.enabled := not bAddressOnly;
  QRLabel5.enabled := not bAddressOnly;
  QRLabel6.enabled := not bAddressOnly;
  QRLabel7.enabled := not bAddressOnly;
  DeliveryDatelbl.Enabled := not bAddressOnly;
  QRDBCustOrderRef.Enabled := not bAddressOnly;
end;

procedure TPBRPJobBagLabelsReelsFrm.SetbAddressOnly(const Value: boolean);
begin
  FbAddressOnly := Value;
end;

end.
