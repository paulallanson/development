unit STRPPick;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, StdCtrls, STSOObjects, STPacks, CCSPrint, gtQrCtrls;

type
  TSTRPPickfrm = class(TForm)
    PickSOListQuickReport: TQuickRep;
    PageHeadQRBand: TQRBand;
    GroupHeadQRGroup: TQRGroup;
    AllocDataSource: TDataSource;
    GetAllocDetQuery: TQuery;
    oldGetAllocMasterQuery: TQuery;
    QRSubDetail1: TQRSubDetail;
    PartQRDBText: TgtQRDBText;
    DescQRDBText: TgtQRDBText;
    BinQRDBText: TgtQRDBText;
    PreviewQRLabel: TgtQRLabel;
    UpdAllocDetQuery: TQuery;
    GetAllAllocDetQuery: TQuery;
    UpdRefQuery: TQuery;
    NotesQRMemo: TgtQRMemo;
    GetCustSQL: TQuery;
    AccNoQRLabel: TgtQRLabel;
    CustRefQRLabel: TgtQRLabel;
    SONOQRLabel: TgtQRLabel;
    CustRefQRDBText: TgtQRDBText;
    SoNumQRDBText: TgtQRDBText;
    UpdSOHeadSQL: TQuery;
    GetDelivNarrSQL: TQuery;
    GetDelivCountSQL: TQuery;
    GetNextSODelivSQL: TQuery;
    QRLabel1: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    GetAllocMasterQuery: TQuery;
    QRLabel7: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel8: TgtQRLabel;
    DummySQL: TQuery;
    TciketQRLabel: TgtQRLabel;
    DelNoQRLabel: TgtQRLabel;
    DespDtQRLbl: TgtQRLabel;
    DelInstructMemo: TgtQRMemo;
    QRLabel6: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabelQty: TgtQRLabel;
    QRLabelDlvrd: TgtQRLabel;
    QRLblAccnt: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    AdhocSQL: TQuery;
    AddressSRC: TDataSource;
    GetAccountSQL: TQuery;
    AddDelivDetSQL: TQuery;
    AddDelivLineDetSQL: TQuery;
    CheckDelivSQL: TQuery;
    qrdetailSerialNos: TQRSubDetail;
    lblSerialCaption: TgtQRLabel;
    lblSerialRange: TgtQRLabel;
    GetAllocSerialNoSQL: TQuery;
    function GetDetails(Sender: TObject): Integer;
    procedure PageHeadQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PickSOListQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure GroupHeadQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure WriteLastRef(Sender: TObject);
    procedure UpdSalesOrdDel(Sender: TObject);
    procedure UpdLastRef(TempRef: string);
    function GetNextRef(Sender: TObject): string;
    function GetNextDelNo(TempSONO: integer): integer;
    function GetDelivCount(TempSoNo: integer) : integer;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeadQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrdetailSerialNosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrdetailSerialNosAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    procedure BuildDeliveryNotes(aQuery : TQuery; const iNarrative : integer);
    function BuildQueryString : string;
  public
    Reprint: byteBool;
    Preview: ByteBool;
    RepType: Integer;
    PickListRef: String [10];
    sDespDt: String;
    DateReq: TDate;
    DelNo: String;
    Store_Record, iIntSelCode, SalesOrder, DeliveryNo: Integer;
    PrinterSettings : TPrinterSettings;
    { Public declarations }
  end;

var
  STRPPickfrm: TSTRPPickfrm;

implementation

uses pbDatabase, CCSCommon;

{$R *.DFM}

var
 rTotalValue: real;

{ TClPickListRepForm }

function TSTRPPickfrm.GetDetails(Sender: TObject): Integer;
begin
  with GetAllocMasterQuery do
  begin
    Close;
    sql.Clear;
    sql.Text := BuildQueryString;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    ParamByName('Status_from').AsInteger := shallocated;
    ParamByName('Status_to').AsInteger := shdespnoteprinted;
    ParamByName('Sales_Order').AsInteger := SalesOrder;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTRPPickfrm.PageHeadQRBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
irow : integer;
begin
  qrlabel4.enabled := getallocDetQuery.FieldByName('Stock_Bins_in_Use').AsString = 'Y' ;
//  qrlabel2.enabled := getallocDetQuery.FieldByName('Stock_Lots_in_Use').AsString = 'Y' ;
  NotesQRMemo.Lines.Clear;
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
      BuildDeliveryNotes(GetCustSQL, FieldByName('Delivery_Narrative').AsInteger);
    end;
    AddressSRC.Dataset := GetCustSQL;
  end;
      {Build the Address Memo field}
  for irow := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;

end;

procedure TSTRPPickfrm.PickSOListQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
If Preview = False then
  PreviewQRLabel.Caption := '';
DespDTQrLbl.Caption := sDespDt;
 with PickSOListQuickReport.PrinterSettings do
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
end;

procedure TSTRPPickfrm.GroupHeadQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rTotalValue := 0.00;
  with GetAllocDetQuery do
  begin
    Close;
    ParamByName('Sel1').AsInteger :=  getAllocMasterQuery.FieldByName('Sales_Order').AsInteger;
    Open;
  end;
  Reprint := GetAllocMasterQuery.FieldByName('Sales_order_Head_Status').AsInteger = shdespnoteprinted;
  DelNo := IntToStr(getallocMasterQuery.fieldByName('Sales_Order').AsInteger) + '01';
  if reprint = True then
    PreviewQRLabel.Caption := 'Reprint'
  else
    begin
      DeliveryNo := getnextDelNO(getallocMasterQuery.fieldByName('Sales_Order').AsInteger);
      DelNO := IntToStr(getallocMasterQuery.fieldByName('Sales_Order').AsInteger) + format ('%.2d',[DeliveryNo]);
    end;
if (Preview = False) and (Reprint = False) then
begin
    WriteLastRef(Self);
    with AddDelivDetSQL do
    begin
        Close;
        ParamByName('Sales_Order').AsInteger := getallocMasterQuery.fieldByName('Sales_Order').AsInteger;
        ParamByName('Sales_Order_Deliv').AsInteger := DeliveryNo;
        ParamByName('Del_Dt').AsDateTime := StrToDate(sDespDt);
        ParamByName('Desp_Note_No').AsString := DelNo;
        ParamByName('Del_Type').clear;
        ParamByname('Courier').clear;
        ExecSQL;
  end;
  with getallallocdetquery do
  begin
    Close;
    ParamByName('Sel1').AsInteger :=  getAllocMasterQuery.FieldByName('Sales_Order').AsInteger;
    Open;
    First;
    While not eof do
      begin
        with updallocdetquery do
          begin
          Close;
          ParamByName('Store_Record').AsInteger := getallAllocdetQuery.fieldByName('Part_Store_Allocation').AsInteger;
          ParamByName('Picking_List_Ref').AsString := UpdRefQuery.ParamByName('Picking_Ref_No').asString;
          ExecSQL;
          end;
        next;
      end;
  end;
  with updSOHeadSQL do
    begin
    Close;
    ParamByName('Sales_Order').AsInteger := getallocMasterQuery.FieldByName('Sales_Order').AsInteger;
    ParamByName('Status').AsInteger := shDespNotePrinted;
    ExecSQL;
    end;
//  PickRefQRLabel.Caption := copy(AddDelivDetSQL.paramByName('Desp_Note_No').AsString,5,10);
  end;
  DelNoQRLabel.Caption := DelNo;
end;

procedure TSTRPPickfrm.FormCreate(Sender: TObject);
begin
GetAllocDetQuery.Active := True;
end;

function TSTRPPickfrm.GetNextRef(Sender: TObject): string;
var
TempNextRef: string[10];
begin
With dmBroker.qryCompany do
     begin
     Close ;
     Open ;
     First ;
     TempNextRef :=
                 IncrementNo(dmBroker.qryCompany.FieldByName('Picking_List_Ref').AsString);
     Result := TempNextRef;
     end;
end;

procedure TSTRPPickfrm.UpdLastRef(TempRef: string);
begin
 with UpdRefQuery do
  begin
  Close;
  ParamByName('Picking_Ref_No'). AsString := TempRef;
  ExecSQl;
  end;
end;

procedure TSTRPPickfrm.WriteLastRef(Sender: TObject);
var
  PickRef: string[10];
begin
  PickRef:= GetNextRef(Self);
  UpdLastRef(PickRef)
end;

function TSTRPPickfrm.GetDelivCount(TempSoNo: integer): integer;
begin
with GetdelivCountSql do
begin
  close;
  ParamByName('Sales_Order').AsInteger := TempSoNo;
 // ParamByName('Line_No').AsInteger := TempSoLineNo;
  Open;
  Result := Recordcount + 1;
 end;
end;

function TSTRPPickfrm.GetNextDelNo(TempSONO: integer): integer;
begin
 Result := GetDelivCount(TempSoNo);
end;

function TSTRPPickfrm.BuildQueryString: string;
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

procedure TSTRPPickfrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblSerialCaption.Enabled := true;
  QrLabelQty.Caption := GetAllocDetQuery.FieldbyName('Qty_Alloc').Asstring;
  QRLabeldlvrd.Caption := ShowinPacks(GetAllocDetQuery.FieldbyName('Qty_Alloc').AsInteger,GetAllocDetQuery.fieldByname('Sell_Pack_Quantity').AsInteger);

  with GetAllocSerialNoSQL do
    begin
      close;
      parambyname('Store_stock').asinteger := GetAllocDetQuery.FieldbyName('Store_stock').Asinteger;
      parambyname('Sales_order').asinteger := GetAllocDetQuery.FieldbyName('Sales_order').Asinteger;
      open;
      qrDetailSerialNos.enabled := (recordcount > 0);
    end;

  UpdSalesOrdDel(Self);
end;

procedure TSTRPPickfrm.PageHeadQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
DelInstructMemo.Lines.Clear;
end;

procedure TSTRPPickfrm.BuildDeliveryNotes(aQuery: TQuery;
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

procedure TSTRPPickfrm.UpdSalesOrdDel(Sender: Tobject);
begin
 if (Preview = False) and (Reprint = False) then
  begin
    with CheckDelivSQL do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := getallocMasterQuery.fieldByName('Sales_Order').AsInteger;
      ParamByName('Sales_order_Line_No').AsInteger := getAllocDetQuery.fieldByName('Sales_Order_Line_No').AsInteger;
      ParamByName('Sales_Order_Deliv').AsInteger := DeliveryNo;
      Open;
      if eof then
      begin
        with AddDelivLineDetSQL do
        begin
          Close;
          ParamByName('Sales_Order').AsInteger := getallocMasterQuery.fieldByName('Sales_Order').AsInteger;
          ParamByName('Sales_order_Line_No').AsInteger := getAllocDetQuery.fieldByName('Sales_Order_Line_No').AsInteger;
          ParamByName('Sales_Order_Deliv').AsInteger := DeliveryNo;
          ExecSQL;
        end;
      end;
    end;
  end;
end;

procedure TSTRPPickfrm.qrdetailSerialNosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblSerialRange.caption := GetAllocSerialNoSQL.fieldbyname('Serial_Item_from').asstring + ' to ' +
                            GetAllocSerialNoSQL.fieldbyname('Serial_Item_to').asstring;
end;

procedure TSTRPPickfrm.qrdetailSerialNosAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  lblSerialCaption.enabled := false;
end;

end.
