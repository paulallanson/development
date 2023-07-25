unit STRPPick;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, StdCtrls, STSOObjects, STPacks, CCSPrint, qrprntr,
  printers;

type
  TSTRPPickfrm = class(TForm)
    PickSOListQuickReport: TQuickRep;
    PageHeadQRBand: TQRBand;
    GroupHeadQRGroup: TQRGroup;
    AllocDataSource: TDataSource;
    GetAllocDetQuery: TQuery;
    oldGetAllocMasterQuery: TQuery;
    QRSubDetail1: TQRSubDetail;
    PartQRDBText: TQRDBText;
    DescQRDBText: TQRDBText;
    BinQRDBText: TQRDBText;
    PreviewQRLabel: TQRLabel;
    UpdAllocDetQuery: TQuery;
    GetAllAllocDetQuery: TQuery;
    UpdRefQuery: TQuery;
    NotesQRMemo: TQRMemo;
    GetCustSQL: TQuery;
    UpdSOHeadSQL: TQuery;
    GetDelivNarrSQL: TQuery;
    GetDelivCountSQL: TQuery;
    GetNextSODelivSQL: TQuery;
    GetAllocMasterQuery: TQuery;
    QRDBText4: TQRDBText;
    DummySQL: TQuery;
    DelInstructMemo: TQRMemo;
    QRLabelQty: TQRLabel;
    QRLabelDlvrd: TQRLabel;
    AdhocSQL: TQuery;
    AddressSRC: TDataSource;
    QRLblAccnt: TQRLabel;
    CustRefQRDBText: TQRDBText;
    DelNoQRLabel: TQRLabel;
    DespDtQRLbl: TQRLabel;
    SoNumQRDBText: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    GetAccountSQL: TQuery;
    qrlblAccountLabel: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    AddDelivLineDetSQL: TQuery;
    CheckDelivSQL: TQuery;
    AddDelivDetSQL: TQuery;
    qrdetailSerialNos: TQRSubDetail;
    GetAllocSerialNoSQL: TQuery;
    lblSerialCaption: TQRLabel;
    lblSerialRange: TQRLabel;
    qrLblShortCode: TQRLabel;
    qrlblWarehouse: TQRLabel;
    GetCustHOSQL: TQuery;
    qryCompany: TQuery;
    qryGetProduction: TQuery;
    qryGetJobBag: TQuery;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRLabel18: TQRLabel;
    CustomerAddMemo: TQRMemo;
    CustSQL: TQuery;
    QRBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    qrlblOverPick: TQRLabel;
    qryGetJobBagReq: TQuery;
    gtQRLabel1: TQRLabel;
    gtQRDBText3: TQRDBText;
    function GetDetails(Sender: TObject): Integer;
    procedure PageHeadQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PickSOListQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure GroupHeadQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure WriteLastRef(Sender: TObject);
    procedure UpdSalesOrdDel(sender: TObject);
    function GetNextRef(Sender: TObject): string;
    function GetNextDelNo(TempSONO:integer): integer;
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
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    function BuildQueryString : string;
    function GetJobBagNumber(tempCode: integer): string;
    procedure GetAddDetails(Cust, Branch: integer);
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

uses CCScommon, pbDatabase, pbImages, pbMainMenu;

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
  qrlblWarehouse.caption := '';
  qrlblWarehouse.caption := getAllocDetQuery.FieldByName('Part_Store_Name').Asstring;

//  qrlblReturns.Enabled := false;
//  qrshapeReturns.Enabled := false;

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
        qrlblShortCode.caption := '';
      end;
      AddressSRC.Dataset := AdhocSQL;
  end
  else
  if (getAllocDetQuery.FieldByName('Delivery_Customer').AsString <> '') and
      (getAllocDetQuery.FieldByName('Delivery_Customer').AsString <> '0') then
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
      qrlblShortCode.caption := FieldByName('Short_Code').Asstring;
      AddressSRC.Dataset := GetCustSQL;
    end;
//  if head Office department then get head Office address
    if GetCustSQl.fieldbyname('HO_Department').asinteger = 1 then
      begin
        GetCustHOSQL.Close;
        GetCustHOSQL.ParamByName('Customer').AsInteger :=
          getAllocDetQuery.FieldByName('Delivery_Customer').AsInteger;
        GetCustHOSQL.ParamByName('Branch_no').AsInteger :=
          getAllocDetQuery.FieldByName('Delivery_Branch').AsInteger;
        GetCustHOSQL.Open;
        BuildDeliveryNotes(GetCustHOSQL, GetCustHOSQL.FieldByName('Delivery_Narrative').AsInteger);
        qrlblShortCode.caption := GetCustHOSQL.FieldByName('Short_Code').Asstring;
        AddressSRC.Dataset := GetCustHOSQL;
      end;
  end
  else
  {Must be delivery in to production}
  begin
    with qryGetProduction do
      begin
        close;
        parambyname('Production_Location').asinteger := getAllocDetQuery.FieldByName('Production_Location').AsInteger;
        open;
        BuildDeliveryNotes(AdHocSQL, 0);
        qrlblShortCode.caption := '';
        AddressSRC.DataSet := qryGetProduction;
      end;
    qrlblAccountLabel.caption := 'Job Bag Number';
    qrlblAccnt.caption := GetJobBagNumber(GetAllocDetQuery.fieldbyname('Sales_Order').asinteger);
//    qrlblReturns.Enabled := true;
//    qrshapeReturns.Enabled := true;
  end;
      {Build the Address Memo field}
  for irow := 0 to 6 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then
      continue;
    if (irow = 1) and (AddressSRC.dataset.FieldByName('HO_Department').asinteger = 0) then
      continue;
    NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;

end;

function TSTRPPickfrm.GetJobBagNumber(tempCode: integer): string;
begin
  with qryGetJobBag do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;

      if recordcount > 0 then
        begin
          result := fieldbyname('Job_Bag').asstring;
          exit;
        end;
    end;

  with qryGetJobBagReq do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;

      result := fieldbyname('Job_Bag').asstring;
    end;
end;

procedure TSTRPPickfrm.PickSOListQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  PickSOListQuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  PickSOListQuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  PickSOListQuickReport.PrinterSettings.Copies := Copies;   {set the copies }

  If Preview = False then
    PreviewQRLabel.Caption := '';
  DespDTQrLbl.Caption := sDespDt;

(*  with PickSOListQuickReport.PrinterSettings do
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
*)
end;

procedure TSTRPPickfrm.GroupHeadQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Cust, Branch, icount: integer;
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
        ParamByName('Delivery_Instructions').asstring := GetAllocDetQuery.fieldbyname('Delivery_Notes').asstring;
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

  CustomerAddMemo.Lines.Clear;

  {Get Delivery Details}
  Cust :=  GetAllocDetQuery.FieldByName('Customer').AsInteger;
  Branch := GetAllocDetQuery.FieldByName('Branch_No').AsInteger;

  GetAddDetails(Cust,Branch);

  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
end;

procedure TSTRPPickfrm.GetAddDetails(Cust, Branch: integer);
begin
  begin
    with CustSQl do
      begin
        Close;
        ParamByName('Customer').AsInteger := Cust;
        ParamByName('Branch_no').AsInteger := Branch;
        Open;
      end;
      AddressSRC.Dataset := CustSQL;
  end;
end;

procedure TSTRPPickfrm.FormCreate(Sender: TObject);
begin
GetAllocDetQuery.Active := True;
end;

function TSTRPPickfrm.GetNextRef(Sender: TObject): string;
begin
  LockCompanyRecord;
  try
    try
  With dmBroker.qryCompany do
     begin
     Close ;
     Open ;
     First ;
     Result := IncrementNo(dmBroker.qryCompany.FieldByName('Picking_List_Ref').AsString);     end;
     with UpdRefQuery do
      begin
        Close;
        ParamByName('Picking_Ref_No'). AsString := Result;
        ExecSQl;
      end;
    except on E: Exception do
    begin
      Result := '';
      Raise Exception.Create('Failed to get next Pick Ref:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;



end;

procedure TSTRPPickfrm.WriteLastRef(Sender: TObject);
var
  PickRef: string[10];
begin
  PickRef:= GetNextRef(Self);
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
  qrlblOverPick.enabled := (GetAllocDetQuery.fieldbyname('Invoice_upfront').asstring = 'N');
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
  aStr := '';
  with aQuery do
  begin  {If any notes then get them}
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
    if trim(DelInstructMemo.Lines.Text) = '' then
      DelInstructMemo.Lines.Text := getAllocDetQuery.FieldByName('Delivery_Notes').AsString
    else
      DelInstructMemo.Lines.Text := DelInstructMemo.Lines.Text + cLFCR + getAllocDetQuery.FieldByName('Delivery_Notes').AsString;
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

procedure TSTRPPickfrm.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TSTRPPickfrm.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmpbMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

end.
