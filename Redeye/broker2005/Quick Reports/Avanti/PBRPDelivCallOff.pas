(*******************************************************************************


*******************************************************************************)
unit PBRPDelivCallOff;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, CCSPrint, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPDelivCallOffFrm = class(TForm)
    PBDelivQuickReport: TQuickRep;
    PODelivSQL: TFDQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressMemo: TQRMemo;
    DeliveryMemo: TQRMemo;
    CustomerSQL: TFDQuery;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    AddressSRC: TDataSource;
    SupplierSQL: TFDQuery;
    QRDBText2: TQRDBText;
    YourRefLbl: TQRLabel;
    DateLbl: TQRLabel;
    GetNarrSQL: TFDQuery;
    CompSQL: TFDQuery;
    Account: TQRDBText;
    CustDetsSQL: TFDQuery;
    Accountlbl: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    QRLabel1: TQRLabel;
    lblDelInst: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRSubDetail;
    GetPickDataSource: TDataSource;
    GetPickSQL: TFDQuery;
    FormRefLbl: TQRLabel;
    FormRefDescLbl: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    BoxesLbl: TQRLabel;
    QuantityLbl: TQRLabel;
    OrderRefLbl: TQRLabel;
    CallOffDataSource: TDataSource;
    CallOffSQL: TFDQuery;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel7: TQRLabel;
    PickQRMemo: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure GetPickLocations(Sender: TObject);
    procedure PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FDeliveryDate: string;
    FBranch: integer;
    FCustomer: integer;
    FCustomerRef: string;
    FOrderDate: TDateTime;
    procedure BuildDeliveryNotes(aQuery : TFDQuery; const iNarrative : integer);
    procedure SetDeliveryDate(const Value: string);
    procedure SetBranch(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerRef(const Value: string);
    procedure SetOrderDate(const Value: TDateTime);
  public
    PONo: real;
    POLine, DelLine: integer;
    OnlyMine, Preview: ByteBool;
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    property Customer: integer read FCustomer write SetCustomer;
    property Branch: integer read FBranch write SetBranch;
    property CustomerRef: string read FCustomerRef write SetCustomerRef;
    property OrderDate: TDateTime read FOrderDate write SetOrderDate;
  end;

var
  PBRPDelivCallOffFrm: TPBRPDelivCallOffFrm;

implementation

uses PBMenuMain, PBPODataMod;

{$R *.DFM}

procedure TPBRPDelivCallOffFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sTemp : string;
begin
  if blineup then Exit;
  DateLbl.Enabled := False;
  YourRefLbl.Enabled := False;
  OrderRefLbl.Enabled := False;
//  QtyOrderedLbl.Enabled := False;
  QuantityLbl.Enabled := False;
  AccountLbl.Enabled := False;

    DeliveryDateLbl.Caption := DeliveryDate;

  AddressMemo.Lines.Clear;
  DeliveryMemo.Lines.Clear;

  if PODelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        PODelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        PODelivSQL.FieldByName('Branch_no0').AsInteger;
      Open;
      BuildDeliveryNotes(CustomerSQL, FieldByName('Delivery_Narrative').AsInteger);
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
    if PODelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          PODelivSQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        BuildDeliveryNotes(AdHocSQL,
          FieldByName('Delivery_Narrative').AsInteger);
      end;
      AddressSRC.Dataset := AdhocSQL;
    end
    else
      if PODelivSQL.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            PODelivSQL.FieldByName('Rep').AsInteger;
          Open;
        end;
        AddressSRC.Dataset := RepSQL;
      end
      else
        if PODelivSQL.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              PODelivSQL.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              PODelivSQL.FieldByName('Branch_no').AsInteger;
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
  { This may be a database not upgraded so take the exception }
  try
    sTemp := PODelivSQL.FieldByName('Delivery_Instructions').AsString
  except
    sTemp := '';  { Ignore missing data }
  end;

  if trim(DeliveryMemo.lines.Text) = '' then
    DeliveryMemo.lines.text := sTemp
  else
    DeliveryMemo.Lines.Text := DeliveryMemo.Lines.Text + cLFCR + sTemp;

  sTemp := PODelivSQL.FieldbyName('Number_Instructions').asstring;

//  DelInstructMemo.Lines.Text := sTemp;
  {Build the Address Memo field}
  for irow := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;

  if trim(Deliverymemo.lines.text) = '' then
    lblDelInst.Enabled := false;

end;


function TPBRPDelivCallOffFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with PODelivSQL do
  begin
    Close;
    ParamByName('Customer').asinteger := Customer;
    ParamByName('Branch_no').asinteger := Branch;
    ParamByName('Cust_Order_no').asstring := CustomerRef;
    ParamByName('Date_Point').asdatetime := OrderDate;
(*    if OnlyMine then
      ParamByName('Operator').AsInteger := PBMenuMainFrm.iOperator
    else
      ParamByName('Operator').AsInteger := 0;
*)
//    ParamByName('Line').asinteger := POLine;
//    ParamByName('Delivery_no').asinteger := DelLine;
    Open;
    Result := RecordCount;
    if Result > 0 then
      CustDetsSQL.Open;
  end;
end;

procedure TPBRPDelivCallOffFrm.PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with PBDelivQuickReport.PrinterSettings do
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
(*    with CallOffSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PONo;
    Open;

end;
*)
end;

procedure TPBRPDelivCallOffFrm.BuildDeliveryNotes(aQuery: TFDQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
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
    DeliveryMemo.Lines.Clear;
    DeliveryMemo.Lines.Text := aStr;
  end;
end;

procedure TPBRPDelivCallOffFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
end;

procedure TPBRPDelivCallOffFrm.GetPickLocations(Sender: TObject);
var
Pick : string;
begin
  with PBPODM.GetPickCallOffSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat :=PODelivSQL.FieldByName('Original_Order').Asfloat;
      parambyname('Line').asinteger := PODelivSQL.FieldByName('Original_OrderLine').AsInteger;
      ParamByName('Delivery_no').Asinteger := PODelivSQL.FieldByName('Delivery_No').AsInteger;
      ParamByName('Calloff_order').Asfloat := PODelivSQL.FieldByName('Purchase_Order').Asfloat;
      ParamByName('Calloff_Line').Asinteger := PODelivSQL.FieldByName('Line').AsInteger;
      open;
      first;
      while not eof do
        begin
          Pick := FieldByName('Description').AsString;
          Pick := Pick + '  '+formatfloat('#########',fieldByName('quantity_Picked').asfloat);
          PickQRMemo.Lines.Add(Pick);
      next;
    end;
  end;
end;

procedure TPBRPDelivCallOffFrm.FormCreate(Sender: TObject);
begin
PBPODM := TPBPODM.Create(Self);
end;

procedure TPBRPDelivCallOffFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    PBPODM.free;
end;

procedure TPBRPDelivCallOffFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if blineup then Exit;
  YourRefLbl.Enabled := False;
  OrderRefLbl.Enabled := False;
//  QtyOrderedLbl.Enabled := False;
  QuantityLbl.Enabled := False;
//  DescLbl.Enabled := False;
  AccountLbl.Enabled := False;

  if PODelivSQL.FieldByName('No_of_Boxes').Asinteger = 0 then
    BoxesLbl.Caption := ''
  else
    BoxesLbl.Caption := PODelivSQL.FieldByName('No_of_Boxes').AsString;

//  PONumberLbl.Caption := PODelivSQL.FieldByName('Purchase_Order').AsString + '/' +
//    PODelivSQL.FieldByName('Line').AsString;


  {Display Form Reference}
  if trim(PODelivSQl.FieldbyName('Form_Reference_ID').asstring) <> '' then
    begin
      FormRefLbl.Caption := PODelivSQl.FieldbyName('Form_Reference_ID').asstring;
      FormRefDescLbl.Caption := PODelivSQl.FieldbyName('Form_Reference_Descr').asstring;

      FormRefLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_ID').asstring <> '';
      FormRefDescLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_Descr').asstring <> '';
    end
  else
    begin
      FormRefLbl.Caption := '';
      FormRefDescLbl.Caption := '';
    end;
    PickqrMemo.Lines.Clear;
    GetPickLocations(Self);
end;

procedure TPBRPDelivCallOffFrm.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TPBRPDelivCallOffFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBRPDelivCallOffFrm.SetCustomerRef(const Value: string);
begin
  FCustomerRef := Value;
end;

procedure TPBRPDelivCallOffFrm.SetOrderDate(const Value: TDateTime);
begin
  FOrderDate := Value;
end;

end.
