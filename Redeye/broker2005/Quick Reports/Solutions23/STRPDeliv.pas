unit STRPDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, StdCtrls, STSOObjects, STPacks, CCSPrint,
  ccsCommon, qrprntr, printers;

type
  TSTRPDelivfrm = class(TForm)
    PickSOListQuickReport: TQuickRep;
    PageHeadQRBand: TQRBand;
    GroupHeadQRGroup: TQRGroup;
    AllocDataSource: TDataSource;
    GetAllocDetQuery: TQuery;
    QRSubDetail1: TQRSubDetail;
    PartQRDBText: TQRDBText;
    DescQRDBText: TQRDBText;
    PreviewQRLabel: TQRLabel;
    GetAllAllocDetQuery: TQuery;
    NotesQRMemo: TQRMemo;
    GetCustSQL: TQuery;
    GetDelivNarrSQL: TQuery;
    GetAllocMasterQuery: TQuery;
    QRDBText4: TQRDBText;
    DummySQL: TQuery;
    DelInstructMemo: TQRMemo;
    QRLabelQty: TQRLabel;
    AdhocSQL: TQuery;
    AddressSRC: TDataSource;
    QRLblAccnt: TQRLabel;
    CustRefQRDBText: TQRDBText;
    DelNoQRLabel: TQRLabel;
    SoNumQRDBText: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    GetAccountSQL: TQuery;
    GetAllocSerialNoSQL: TQuery;
    qrdetailSerialNos: TQRSubDetail;
    lblSerialCaption: TQRLabel;
    lblSerialRange: TQRLabel;
    gtQRLabel1: TQRLabel;
    qrlblInstructions: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    gtQRShape1: TQRShape;
    QRLabel3: TQRLabel;
    qrlblDespatched: TQRLabel;
    QRBand3: TQRBand;
    qryGetComp: TQuery;
    QRLabel4: TQRLabel;
    qrlblLineNo: TQRLabel;
    OrderLbl: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRShape7: TQRShape;
    gtQRLabel12: TQRLabel;
    gtQRLabel13: TQRLabel;
    gtQRShape8: TQRShape;
    labCompanyAddress: TQRMemo;
    QRMemo1: TQRMemo;
    DespDtQRLbl: TQRLabel;
    qrlblCustomerName: TQRLabel;
    ReportImage: TQRImage;
    function GetDetails(Sender: TObject): Integer;
    procedure PageHeadQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PickSOListQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure GroupHeadQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeadQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrdetailSerialNosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    iLineCount: integer;
    NoOfSerialNoBands: integer;
    procedure BuildDeliveryNotes(aQuery : TQuery; const iNarrative : integer);
    function BuildQueryString : string;
  public
    Reprint: byteBool;
    PrintLogo: byteBool;
    Preview: ByteBool;
    RepType: Integer;
    PickListRef: String [10];
    sDespDt: String;
    DateReq: TDate;
    DelNo: String;
    Store_Record, iIntSelCode, SalesOrder: Integer;
    PrinterSettings : TPrinterSettings;
    { Public declarations }
  end;

var
  STRPDelivfrm: TSTRPDelivfrm;

implementation

uses pbDatabase, PBImages;

{$R *.DFM}

var
 rTotalValue: real;

{ TClPickListRepForm }

function TSTRPDelivfrm.GetDetails(Sender: TObject): Integer;
begin
  with GetAllocMasterQuery do
  begin
    Close;
    sql.Clear;
    sql.Text := BuildQueryString;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    ParamByName('Status_from').AsInteger := shdespConfirmed;
    ParamByName('Sales_Order').AsInteger := SalesOrder;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTRPDelivfrm.PageHeadQRBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
irow : integer;
UseBrnchNm: ByteBool;
begin
  NotesQRMemo.Lines.Clear;
  UseBrnchNm := False;
  GetCustSQL.Close;
  GetCustSQL.ParamByName('Customer').AsInteger :=
    getAllocDetQuery.FieldByName('Customer').AsInteger;
  GetCustSql.ParamByName('Branch_No').AsInteger :=
    getAllocDetQuery.FieldByName('Branch_No').AsInteger;
  GetCustSQL.Open;
  if ((GetCustSQL.FieldByName('Inv_To_Customer').AsInteger = getAllocDetQuery.FieldByName('Customer').AsInteger) and
       (GetCustSQL.FieldByName('Inv_To_Branch').AsInteger = getAllocDetQuery.FieldByName('Branch_No').AsInteger)) then
          QRLblAccnt.Caption := GetCustsql.fieldbyname('Account_code').AsString
  else
    begin
      GetAccountSQL.Close;
      GetAccountSQL.ParamByName('Customer').AsInteger := GetCustSQL.FieldByName('Inv_To_Customer').AsInteger;
      GetAccountSQL.ParamByName('Branch_No').AsInteger := GetCustSQL.FieldByName('Inv_To_Branch').AsInteger;
      GetAccountSQL.Open;
      QRLblAccnt.Caption := GetAccountsql.fieldbyname('Account_code').AsString;
    end;

  qrlblCustomerName.Caption := GetCustSQL.fieldbyname('Cust_Name').AsString;

  if getAllocDetQuery.FieldByName('Ad_Hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          getAllocDetQuery.FieldByName('Ad_Hoc_Address').AsInteger;
        Open;
        BuildDeliveryNotes(AdHocSQL,
          FieldByName('Delivery_Narrative').AsInteger);
      end;
      AddressSRC.Dataset := AdhocSQL;
    end
  else
    if getAllocDetQuery.FieldByName('Delivery_Customer').AsString <> '' then
    begin
    with GetCustSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        getAllocDetQuery.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        getAllocDetQuery.FieldByName('Delivery_Branch').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
      BuildDeliveryNotes(GetCustSQL, FieldByName('Delivery_Narrative').AsInteger);
    end;
    AddressSRC.Dataset := GetCustSQL;
  end;
      {Build the Address Memo field}
  if Not UseBrnchNm then
  begin
    for irow := 0 to 5 do
    begin
      if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
      NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
    end;
  end
  else
  begin
  if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
    NotesQRMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  for irow := 1 to 5 do
    begin
      if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
      NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
    end;
  end;
  qrlblInstructions.Enabled := DelInstructMemo.lines.text <> '';
end;

procedure TSTRPDelivfrm.PickSOListQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  sAddress: string;
  iRow: integer;
begin
  {set the printer to what the user selected}
  PickSOListQuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  PickSOListQuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  PickSOListQuickReport.PrinterSettings.copies := Copies;   {set the number of copies }
  PickSOListQuickReport.PrinterSettings.PaperSize := Size;   {set the number of copies }

  If Preview = False then
    PreviewQRLabel.Caption := '';
  DespDTQrLbl.Caption := 'Delivery Date: ' + sDespDt;
  if PrintLogo then
  begin
    ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
    ReportImage.Enabled := true;
  end;

    {Get the company address details}
  sAddress := '';

  with qryGetComp do
    begin
      close;
      open;
    end;
    
  for irow := 0 to 5 do
    begin
      if Trim(qryGetComp.Fields[irow].AsString) = '' then Continue;
        sAddress := sAddress + Trim(qryGetComp.Fields[irow].AsString) + ' | ';
    end;
  sAddress := copy(sAddress,1,(length(sAddress)-2));

  LabCompanyAddress.Lines.Add(sAddress);

  sAddress := '';
  if Trim(qryGetComp.fieldbyname('Phone').AsString) <> '' then
    sAddress := sAddress + 'Tel: ' + Trim(qryGetComp.fieldbyname('Phone').AsString) + ' | ';

  if Trim(qryGetComp.fieldbyname('Email').AsString) <> '' then
    sAddress := sAddress + 'Email: ' + Trim(qryGetComp.fieldbyname('Email').AsString) + ' | ';

  if Trim(qryGetComp.fieldbyname('Web_Address').AsString) <> '' then
    sAddress := sAddress + 'Web: ' + Trim(qryGetComp.fieldbyname('Web_Address').AsString) + ' ';

  LabCompanyAddress.Lines.Add(Trim(sAddress));
  LabCompanyAddress.enabled := true;

end;

procedure TSTRPDelivfrm.GroupHeadQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rTotalValue := 0.00;
  iLineCount := 0;

  Reprint := GetAllocMasterQuery.FieldByName('Sales_order_Head_Status').AsInteger = shdespnoteprinted;
  if reprint = True then
    PreviewQRLabel.Caption := 'Reprint';
  with GetAllocDetQuery do
  begin
    Close;
    ParamByName('Sel1').AsInteger :=  getAllocMasterQuery.FieldByName('Sales_Order').AsInteger;
    Open;
    DelNoQRLabel.Caption := 'Delivery Note No: ' + getAllocMasterQuery.FieldByName('Sales_Order').Asstring + '/01';
  end;
end;

procedure TSTRPDelivfrm.FormCreate(Sender: TObject);
begin
GetAllocDetQuery.Active := True;
end;

function TSTRPDelivfrm.BuildQueryString: string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  Result := DummySQL.SQL.Text;
  if DateReq <> 0 then
    Result := Result + ' AND Sales_Order.Date_Required <= ' + qDate(DateReq);
  Result := Result+'Order by Sales_Order.Sales_Order'
end;

procedure TSTRPDelivfrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  iLineCount := iLinecount + 1;
  qrlblLineNo.caption := inttostr(iLineCount);
  QrLabelQty.Caption := GetAllocDetQuery.FieldbyName('Quantity_Ordered').Asstring;
  QrlblDespatched.Caption := GetAllocDetQuery.FieldbyName('Quantity_Delivered').Asstring;
//  QRLabeldlvrd.Caption := ShowinPacks(GetAllocDetQuery.FieldbyName('Quantity_Delivered').AsInteger,GetAllocDetQuery.fieldByname('Sell_Pack_Quantity').AsInteger);

  GetAllocSerialNoSQL.active := false;
  GetAllocSerialNoSQL.ParamByName('sales_order').asInteger := GetAllocDetQuery.FieldByName('sales_order').asInteger;
  GetAllocSerialNoSQL.ParamByName('sales_order_line_no').asInteger := GetAllocDetQuery.FieldByName('sales_order_line_no').asInteger;
  GetAllocSerialNoSQL.active := true;
  if GetAllocSerialNoSQL.RecordCount > 0 then
    qrdetailSerialNos.Enabled := true
  else
    qrdetailSerialNos.enabled := false;

  self.NoOfSerialNoBands := 0;
end;

procedure TSTRPDelivfrm.PageHeadQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
DelInstructMemo.Lines.Clear;
end;

procedure TSTRPDelivfrm.BuildDeliveryNotes(aQuery: TQuery;
  const iNarrative: integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetDelivNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetDelivNarrSQL.Open;
      aStr := '';
      while (not GetDelivNarrSQL.EOF) do
      begin
        aStr := aStr + GetDelivNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetDelivNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetDelivNarrSQL.Next;
      end;
      GetDelivNarrSQL.Close;
    end;
    DelInstructMemo.Lines.Clear;
    DelInstructMemo.Lines.Text := aStr;
  end;
end;

procedure TSTRPDelivfrm.qrdetailSerialNosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.NoOfSerialNoBands := self.NoOfSerialNoBands + 1;
  
  if self.NoOfSerialNoBands > 1 then
    lblSerialCaption.enabled := false
  else
    lblSerialCaption.enabled := true;
    
  lblSerialRange.caption := GetAllocSerialNoSQL.fieldbyname('Serial_Item_from').asstring + ' to ' +
                            GetAllocSerialNoSQL.fieldbyname('Serial_Item_to').asstring;
end;

end.
