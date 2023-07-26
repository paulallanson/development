unit STRPDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls, StdCtrls, STSOObjects, STPacks, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPDelivfrm = class(TForm)
    PickSOListQuickReport: TQuickRep;
    PageHeadQRBand: TQRBand;
    GroupHeadQRGroup: TQRGroup;
    AllocDataSource: TDataSource;
    GetAllocDetQuery: TFDQuery;
    QRSubDetail1: TQRSubDetail;
    DescQRDBText: TQRDBText;
    PreviewQRLabel: TQRLabel;
    GetAllAllocDetQuery: TFDQuery;
    NotesQRMemo: TQRMemo;
    GetCustSQL: TFDQuery;
    UpdSOHeadSQL: TFDQuery;
    GetDelivNarrSQL: TFDQuery;
    GetAllocMasterQuery: TFDQuery;
    DummySQL: TFDQuery;
    QRLabelQty: TQRLabel;
    QRLabelDlvrd: TQRLabel;
    AdhocSQL: TFDQuery;
    AddressSRC: TDataSource;
    QRLblAccnt: TQRLabel;
    CustRefQRDBText: TQRDBText;
    DelNoQRLabel: TQRLabel;
    DespDtQRLbl: TQRLabel;
    SoNumQRDBText: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLblDelQtyHead: TQRLabel;
    GetAccountSQL: TFDQuery;
    AccNoQRLabel: TQRLabel;
    CustRefQRLabel: TQRLabel;
    TciketQRLabel: TQRLabel;
    QRLabel8: TQRLabel;
    SONOQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QROrdLblqty: TQRLabel;
    QRLabel3: TQRLabel;
    lblDelInst: TQRLabel;
    GetAllocSerialNoSQL: TFDQuery;
    qrdetailSerialNos: TQRSubDetail;
    lblSerialCaption: TQRLabel;
    lblSerialRange: TQRLabel;
    qrbFooter: TQRBand;
    qrmCompany: TQRMemo;
    qryCompName: TFDQuery;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    qrlblUOM: TQRLabel;
    qryUOM: TFDQuery;
    qrlblContact: TQRLabel;
    QRDBText2: TQRDBText;
    GetCustHOSQL: TFDQuery;
    GetCourierSQL: TFDQuery;
    QRChldBndCour: TQRChildBand;
    QRShape5: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLblDelNo: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRPageFoot: TQRBand;
    QRChldBndNoCour: TQRChildBand;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    qrlblDeliveryNotes: TQRLabel;
    DelInstructMemo: TQRMemo;
    lblCompanyName: TQRLabel;
    qryGetHO: TFDQuery;
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
    procedure qrdetailSerialNosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChldBndCourBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    NoOfSerialNoBands: integer;
    FDeliveryNo: integer;
    procedure BuildDeliveryNotes(aQuery : TFDQuery; const iNarrative : integer);
    function BuildQueryString : string;
    function GetUOM(tempCode: integer): string;
    procedure SetDeliveryNo(const Value: integer);
    procedure BuildHeaderDeliveryNotes(aQuery: TFDQuery;
      const iNarrative: integer);
  public
    DeliveryNotes: integer;
    Reprint: byteBool;
    Preview: ByteBool;
    PrintLogo: ByteBool;
    RepType: Integer;
    PickListRef: String [10];
    sDespDt: String;
    DateReq: TDate;
    DelNo: String;
    Store_Record, iIntSelCode, SalesOrder: Integer;
    UseHODeliveryNotes: boolean;
    PrinterSettings : TPrinterSettings;
    property DeliveryNo: integer read FDeliveryNo write SetDeliveryNo;
    { Public declarations }
  end;

var
  STRPDelivfrm: TSTRPDelivfrm;

implementation

uses PBImages, pbDatabase;

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
    ParamByName('Status_from').AsInteger := shdespconfirmed;
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
  qrmCompany.lines.clear;
  UseBrnchNm := False;

  lblCompanyName.enabled := not PrintLogo;
  qrmCompany.enabled := PrintLogo;
  
  with qryCompName do
    begin
      close;
      open;

      lblCompanyName.Caption := qryCompName.fieldbyname('Company_Name').AsString;

      for irow := 1 to 5 do
      begin
        if Fields[irow].AsString = '' then Continue;
          qrmCompany.Lines.Add(Trim(Fields[irow].AsString));
      end;
      qrmCompany.Lines.Add('');
      if Trim(FieldByName('Phone').AsString) <> '' then
        qrmCompany.Lines.Add('Tel: ' + Trim(FieldByName('Phone').AsString));
      if Trim(FieldByName('Fax_Number').AsString) <> '' then
        qrmCompany.Lines.Add('Fax: ' + Trim(FieldByName('Fax_Number').AsString));
      if Trim(FieldByName('Email').AsString) <> '' then
        qrmCompany.Lines.Add('Email: ' + Trim(FieldByName('Email').AsString));
    end;

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
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
      UseHODeliveryNotes := (FieldByName('Use_HO_Delivery_Notes').AsString = 'Y');
      
      BuildDeliveryNotes(GetCustSQL, FieldByName('Delivery_Narrative').AsInteger);
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
        AddressSRC.Dataset := GetCustHOSQL;
      end;
  end;
      {Build the Address Memo field}

  if Not UseBrnchNm then
  begin
    for irow := 0 to 6 do
    begin
      if AddressSRC.dataset.Fields[irow].AsString = '' then
        continue;
      if (irow = 1) and (AddressSRC.dataset.FieldByName('HO_Department').asinteger = 0) then
        continue;
      NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
    end;
  end
  else
  begin
  if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
    NotesQRMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  for irow := 2 to 6 do
    begin
      if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
      NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
    end;
  end;

  {If not printing logo and company address then print customer delivery notes}
  if not PrintLogo then
    begin
      qrmCompany.enabled := true;
      qrmCompany.lines.clear;
      qrmCompany.font.Size := 12;
      if UseHODeliveryNotes then
        BuildHeaderDeliveryNotes(qryGetHO,DeliveryNotes)
      else
        BuildHeaderDeliveryNotes(GetCustSQL, GetCustSQL.FieldByName('Delivery_Narrative').AsInteger);
    end;

  QRChldBndCour.enabled := False;
  QRChldBndNoCour.enabled := False;
//  QRChldBndCour.Height := 0;
//  QRChldBndNoCour.Height := 0;
end;

procedure TSTRPDelivfrm.PickSOListQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  DelInstructMemo.Lines.Clear;

  DeliveryNotes := 0;
  QRmemo1.lines.clear;

  GetCourierSQL.Close;
  GetCourierSQL.ParamByName('Sales_Order').AsInteger := getAllocMasterQuery.FieldByName('Sales_Order').AsInteger;
  GetCourierSQL.ParamByName('Sales_Order_Delivery_No').AsInteger := 1;
  GetCourierSQL.Open;
  if getcourierSQL.FieldByName('Consignment_Number').Asstring = '' then
    begin
      QRChldBndCour.parentBand := nil;
      QRChldBndCour.enabled := False;
 //     QRChldBndNoCour.AlignToBottom := True;
    end
  else
    begin
      QRChldBndNoCour.ParentBand := nil;
      QRChldBndNOCour.enabled := False;
//      QRChldBndCour.AlignToBottom := True;
    end;
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

procedure TSTRPDelivfrm.GroupHeadQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rTotalValue := 0.00;
  Reprint := GetAllocMasterQuery.FieldByName('Sales_order_Head_Status').AsInteger = shdespnoteprinted;
  if reprint = True then
    PreviewQRLabel.Caption := 'Reprint';
  with GetAllocDetQuery do
  begin
    Close;
    ParamByName('Sel1').AsInteger :=  getAllocMasterQuery.FieldByName('Sales_Order').AsInteger;
    Open;
  DelNoQRLabel.Caption := getAllocMasterQuery.FieldByName('Sales_Order').Asstring + '01';
  end;

  with qryGetHO do
    begin
      close;
      parambyname('Customer').asinteger := GetAllocDetQuery.fieldbyname('Customer').asinteger;
      open;

      PrintLogo := (fieldbyname('Call_Off_Delivery_Note_Type').asstring <> 'N');
      DeliveryNotes := fieldbyname('Delivery_Narrative').asinteger;
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

  QrOrdLblQty.Caption := GetAllocDetQuery.FieldbyName('Quantity_Ordered').Asstring;
  QrLabelQty.Caption := GetAllocDetQuery.FieldbyName('Quantity_Delivered').Asstring;
  QRLabeldlvrd.Caption := ShowinPacks(GetAllocDetQuery.FieldbyName('Quantity_Delivered').AsInteger,GetAllocDetQuery.fieldByname('Sell_Pack_Quantity').AsInteger);

  qrlblUOM.Caption := GetUOM(GetAllocDetQuery.FieldbyName('Unit_of_Measure').Asinteger);

  if qrlblUOM.caption = '' then
    qrlblUOM.caption := 'BOX';

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

function TSTRPDelivfrm.GetUOM(tempCode: integer): string;
begin
  with qryUOM do
    begin
      close;
      parambyname('Unit_of_Measure').asinteger := tempCode;
      open;
      result := fieldbyname('UOM_Description').asstring;
    end;
end;

procedure TSTRPDelivfrm.BuildDeliveryNotes(aQuery: TFDQuery;
  const iNarrative: integer);
var
  aStr : string;
begin
  with aQuery do
  begin
    {If any notes then get them}
    if (iNarrative > 0) and not UseHODeliveryNotes then
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

procedure TSTRPDelivfrm.BuildHeaderDeliveryNotes(aQuery: TFDQuery;
  const iNarrative: integer);
var
  aStr : string;
begin
  with aQuery do
  begin
    {If any notes then get them}
    if (iNarrative > 0) then
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

    qrmCompany.Lines.Clear;
    qrmCompany.Lines.Text := aStr;
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

procedure TSTRPDelivfrm.qrbFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DelInstructMemo.enabled := (trim(DelInstructMemo.lines.text) <> '');
  QRMemo1.Lines.Text := DelInstructMemo.Lines.text;
  qrlblDeliveryNotes.Enabled := (trim(DelInstructMemo.lines.text) <> '');
  QRLblDelNo.enabled := qrlblDeliveryNotes.enabled;
  QRChldBndCour.enabled := True;
  QRChldBndNoCour.enabled := True;
//  QRChldBndCour.Height := 233;
//  QRChldBndNoCour.Height := 164;
end;

procedure TSTRPDelivfrm.SetDeliveryNo(const Value: integer);
begin
  FDeliveryNo := Value;
end;

procedure TSTRPDelivfrm.QRChldBndCourBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
////
end;

end.
