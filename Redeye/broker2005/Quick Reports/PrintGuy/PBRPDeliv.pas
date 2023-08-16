unit PBRPDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, CCSPrint, PBPOObjects,
  QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPDelivFrm = class(TForm)
    PBDelivQuickReport: TQuickRep;
    PODelivSQL: TFDQuery;
    PODelivSRC: TDataSource;
    QRBand1: TQRSubDetail;
    PONumberLbl: TQRLabel;
    AddressMemo: TQRMemo;
    DeliveryMemo: TQRMemo;
    CustomerSQL: TFDQuery;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    AddressSRC: TDataSource;
    SupplierSQL: TFDQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    GetNarrSQL: TFDQuery;
    CompSQL: TFDQuery;
    Account: TQRDBText;
    CustDetsSQL: TFDQuery;
    DelInstructMemo: TQRMemo;
    FormRefLbl: TQRLabel;
    FormRefDescLbl: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    OrderLbl: TQRLabel;
    gtQRLabel1: TQRLabel;
    qrlblInstructions: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    QRBand3: TQRBand;
    gtQRLabel11: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRShape7: TQRShape;
    gtQRLabel12: TQRLabel;
    gtQRLabel13: TQRLabel;
    gtQRShape8: TQRShape;
    labCompanyAddress: TQRMemo;
    gtQRLabel6: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRDBText1: TQRDBText;
    qryGetComp: TFDQuery;
    gtQRDBText2: TQRDBText;
    QRMemo1: TQRMemo;
    gtQRLabel2: TQRLabel;
    gtQRDBText3: TQRDBText;
    DeliveryDateLbl: TQRLabel;
    ReportImage: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure PBDelivQuickReportBeforePrint(Sender: TCustomQuickRep; var
      PrintReport: Boolean);
  private
    FDeliveryDate: string;
    procedure BuildDeliveryNotes(aQuery : TFDQuery; const iNarrative : integer);
    procedure SetDeliveryDate(const Value: string);
  public
    bPrintLogo: boolean;
    PONo: real;
    POLine, DelLine: integer;
    OnlyMine, Preview: ByteBool;
    bLineup: boolean;
    PrinterSettings : TPrinterSettings;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    function PrintToFile(PONo: real; POLine, DelLine: integer;
      attachmentType: string): TStringList;
  end;

var
  PBRPDelivFrm: TPBRPDelivFrm;

implementation

uses
  pbMainMenu, CCSCommon, PBImages, Printer.Tools;

{$R *.DFM}

procedure TPBRPDelivFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  irow: Integer;
  sTemp, sAddress : string;
  UseBrnchNm, UseFAO: boolean;
begin
  if blineup then Exit;
  UseBrnchNm := False;
  UseFAO := false;

  if DeliveryDate = '' then
    DeliveryDateLbl.Caption := 'Delivery Date: ' + PODelivSQL.FieldByName('Date_Point').AsString
  else
    DeliveryDateLbl.Caption := 'Delivery Date: ' + DeliveryDate;

(*  if PODelivSQL.FieldByName('No_of_Boxes').AsString <> '' then
    BoxesLbl.Caption := PODelivSQL.FieldByName('No_of_Boxes').AsString
  else
    BoxesLbl.Caption := '';
*)

  PONumberLbl.Caption := 'Delivery Note No: ' + PODelivSQL.FieldByName('Purchase_Order').AsString + '/' + PODelivSQL.FieldByName('Line').AsString;

  AddressMemo.Lines.Clear;
  DeliveryMemo.Lines.Clear;

  if PODelivSQL.FieldByName('Customer').AsString <> '' then
  begin
    if PODelivSQL.FieldByName('contact_name').asString <> '' then
    begin
      UseFAO := true;
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

  qrlblInstructions.Enabled := DeliveryMemo.lines.text <> '';
  
  sTemp := PODelivSQl.FieldbyName('Number_Instructions').asstring;
    
  DelInstructMemo.Lines.Text := sTemp;

  {Build the Address Memo field}
  if UseFAO then
  begin
    AddressMemo.Lines.Add(Trim(PODelivSQL.FieldByName('contact_Name').AsString));
  end;

  if UseBrnchNm then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      AddressMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for irow := (0 + integer(UseBrnchNm)) to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then Continue;
    AddressMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;

  {Display Form Reference}
  if trim(PODelivSQl.FieldbyName('Form_Reference_ID').asstring) <> '' then
    begin
      FormRefLbl.Caption := 'Form Ref: ' + PODelivSQl.FieldbyName('Form_Reference_ID').asstring;
      FormRefDescLbl.Caption := 'Description: ' + PODelivSQl.FieldbyName('Form_Reference_Descr').asstring;

      FormRefLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_ID').asstring <> '';
      FormRefDescLbl.enabled := PODelivSQl.FieldbyName('Form_Reference_Descr').asstring <> '';
    end
  else
    begin
      FormRefLbl.Caption := '';
      FormRefDescLbl.Caption := '';
    end;


  {Get the company address details}
  sAddress := '';
  labCompanyAddress.lines.clear;

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

  LabCompanyAddress.Lines.Add(sAddress);
  LabCompanyAddress.enabled := true;
end;

function TPBRPDelivFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with PODelivSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PONo;
    if OnlyMine then
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator
    else
      ParamByName('Operator').AsInteger := 0;
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
  end;
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

function TPBRPDelivFrm.PrintToFile(PONo: real; POLine, DelLine: integer; attachmentType: string): TStringList;
begin
  TPrinterTools.New.PrintToFileDelivery(PBDelivQuickReport, Result, PONo, POLine, DelLine, attachmentType);
end;

end.
