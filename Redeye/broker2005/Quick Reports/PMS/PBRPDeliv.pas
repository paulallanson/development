unit PBRPDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, CCSPrint, PBPOObjects,
  jpeg, QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPDelivFrm = class(TForm)
    PBDelivQuickReport: TQuickRep;
    PODelivSQL: TFDQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    AddressMemo: TQRMemo;
    DeliveryMemo: TQRMemo;
    BoxesLbl: TQRLabel;
    CustomerSQL: TFDQuery;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    AddressSRC: TDataSource;
    SupplierSQL: TFDQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    YourRefLbl: TQRLabel;
    DateLbl: TQRLabel;
    OrderRefLbl: TQRLabel;
    QtyOrderedLbl: TQRLabel;
    GetNarrSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustDetsSQL: TFDQuery;
    DelInstructMemo: TQRMemo;
    FormRefLbl: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    QRLabel1: TQRLabel;
    lblDelInst: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    GetPickDataSource: TDataSource;
    GetPickSQL: TFDQuery;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QuantityLbl: TQRLabel;
    QRLabel12: TQRLabel;
    ContactQRLabel: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    GetContactSQL: TFDQuery;
    QRLabel3: TQRLabel;
    GetPickCallOffSQL: TFDQuery;
    ReportImage: TQRImage;
    PsQRShape1: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure GetPickLocations(Sender: TObject);
    procedure PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FDeliveryDate: string;
    procedure BuildDeliveryNotes(aQuery : TFDQuery; const iNarrative : integer);
    procedure SetDeliveryDate(const Value: string);
  public
    PONo: real;
    POLine, DelLine: integer;
    OnlyMine, Preview: ByteBool;
    bLineup, bPrintLogo: boolean;
    PrinterSettings : TPrinterSettings;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  end;

var
  PBRPDelivFrm: TPBRPDelivFrm;

implementation

uses
  CCSCommon, PBImages, Printer.Tools;

{$R *.DFM}

procedure TPBRPDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sTemp : string;
  UseBrnchNm, UseFAO: boolean;
begin
  if blineup then Exit;
  DateLbl.Enabled := False;
  YourRefLbl.Enabled := False;
  OrderRefLbl.Enabled := False;
  QtyOrderedLbl.Enabled := False;
  QuantityLbl.Enabled := False;
  UseBrnchNm := False;
  UseFAO := false;

  if DeliveryDate = '' then
    DeliveryDateLbl.Caption := PODelivSQL.FieldByName('Date_Point').AsString
  else
    DeliveryDateLbl.Caption := DeliveryDate;

  if PODelivSQL.FieldByName('No_of_Boxes').Asinteger = 0 then
    BoxesLbl.Caption := ''
  else
    BoxesLbl.Caption := PODelivSQL.FieldByName('No_of_Boxes').AsString;

  AddressMemo.Lines.Clear;
  DeliveryMemo.Lines.Clear;

  if PODelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    if PODelivSQL.FieldByName('contact_name').asString <> '' then
    begin
      UseFAO := true;
    end;

    {The FOR ATTN label details} ;
    if UseFAO <> true then
      begin
        with GetContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := PODelivSQl.FieldbyName('Cust_code').AsInteger ;
            ParamByName('Branch_No').AsInteger := PODelivSQl.FieldbyName('Cust_Branch_Code').AsInteger ;
            ParamByName('Contact_No').AsInteger := PODelivSQl.FieldbyName('Contact_No').AsInteger ;
            Open ;
            First ;
            if not EOF then
              ContactQRLabel.Caption := 'FAO: ' + FieldByName('Name').AsString
            else
              ContactQRLabel.Caption := '' ;
          end;
      end;

    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        PODelivSQL.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        PODelivSQL.FieldByName('Branch_no0').AsInteger;
      Open;
      UseBrnchNm := FieldByName('Use_Branch_Name').AsString = 'Y';
      BuildDeliveryNotes(CustomerSQL, FieldByName('Delivery_Narrative').AsInteger);
    end;
    AddressSRC.Dataset := CustomerSQL;
  end
  else
  if PODelivSQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      if PODelivSQL.FieldByName('contact_name').asString <> '' then
      begin
        UseFAO := true;
      end;

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
          BuildDeliveryNotes(CompSQL,
              FieldByName('Delivery_Narrative').AsInteger);
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

  sTemp := PODelivSQl.FieldbyName('Number_Instructions').asstring;
    
  DelInstructMemo.Lines.Text := sTemp;

(*  {Build the Address Memo field EXCEPT the postcode} ;
  if not UseFAO then
  begin
    AddressMemo.Lines.Add(Trim(PODelivSQL.FieldByName('contact_Name').AsString));
  end;
*)

  if UseBrnchNm then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      AddressMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for irow := (0 + integer(UseBrnchNm)) to 4 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
  
  {Add the postcode details to the end of the last line} ;
  AddressMemo.Lines[AddressMemo.Lines.Count-1] := AddressMemo.Lines[AddressMemo.Lines.Count-1] + '  ' +
        AddressSRC.DataSet.FieldByName('PostCode').AsString ;

  if trim(Deliverymemo.lines.text) = '' then
    lblDelInst.Enabled := false;

  {Display Form Reference}
  if trim(PODelivSQl.FieldbyName('Form_Reference_ID').asstring) <> '' then
    begin
      FormRefLbl.Caption := PODelivSQl.FieldbyName('Form_Reference_Descr').asstring;
      FormRefLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_Descr').asstring <> '';
    end
  else
    begin
      FormRefLbl.Caption := '';
    end;
    GetPickLocations(Self);

  if UseFAO then
    ContactQRLabel.Caption := 'FAO: ' + PODelivSQL.FieldByName('contact_name').asString;

end;

function TPBRPDelivFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with PODelivSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PONo;
(*    if OnlyMine then
      ParamByName('Operator').AsInteger := PBMenuMainFrm.iOperator
    else
      ParamByName('Operator').AsInteger := 0;
*)
    ParamByName('Line').asinteger := POLine;
    ParamByName('Delivery_no').asinteger := DelLine;
    Open;
    Result := RecordCount;
    if Result > 0 then
      CustDetsSQL.Open;
  end;
end;

procedure TPBRPDelivFrm.PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //ReportQRImage.Picture := PBImagesFrm.ReportImage.Picture ;
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

  if bPrintLogo then
  begin
    ReportImage.Picture := PBImagesFrm.ReportImage.Picture;
    ReportImage.Enabled := true;
  end
  else
  begin
    ReportImage.Enabled := false;
  end
end;

procedure TPBRPDelivFrm.BuildDeliveryNotes(aQuery: TFDQuery;
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

procedure TPBRPDelivFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
end;

procedure TPBRPDelivFrm.GetPickLocations(Sender: TObject);
begin
  with GetPickCallOffSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat :=PODelivSQL.FieldByName('Original_Order').Asfloat;
      parambyname('Line').asinteger := PODelivSQL.FieldByName('Original_OrderLine').AsInteger;
      ParamByName('Delivery_no').Asinteger := PODelivSQL.FieldByName('Delivery_No').AsInteger;
      ParamByName('Calloff_order').Asfloat := PODelivSQL.FieldByName('Purchase_Order').Asfloat;
      ParamByName('Calloff_Line').Asinteger := PODelivSQL.FieldByName('Line').AsInteger;
      open;
      if recordcount > 0 then
        begin
          QRBand2.enabled := True;
          QRLabel2.Caption := 'Picking information for '+GetPickCallOffSQL.FieldByName('Stock_Location_Desc').AsString;
        end
      else
        begin
          QRBand2.enabled := False;
          QRLabel2.Caption := '';
        end;
        end;
end;

procedure TPBRPDelivFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel13.Caption := GetPickCallOffSQL.FieldByName('Description').AsString;
  QRLabel14.Caption := formatfloat('####',GetPickCallOffSql.fieldByName('quantity_Picked').asfloat);
end;

function TPBRPDelivFrm.PrintToFile(PONo: real; POLine, DelLine: integer; attachmentType: string): TStringList;
begin
  TPrinterTools.New.PrintToFileDelivery(PBDelivQuickReport, Result, PONo, POLine, DelLine, attachmentType);
end;

end.
