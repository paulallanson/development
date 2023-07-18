unit STRPPickingNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls, gtQrCtrls, qrprntr, printers;

type
  TSTRPPickingNoteFrm = class(TForm)
    qrDetails: TQuickRep;
    PageHeadQRBand: TQRBand;
    QRLabel1: TgtQRLabel;
    PreviewQRLabel: TgtQRLabel;
    NotesQRMemo: TgtQRMemo;
    DelInstructMemo: TgtQRMemo;
    QRLblAccnt: TgtQRLabel;
    CustRefQRDBText: TgtQRDBText;
    SoNumQRDBText: TgtQRDBText;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    qrlblAccountLabel: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    qrLblShortCode: TgtQRLabel;
    qrlblWarehouse: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    CustomerAddMemo: TgtQRMemo;
    GroupHeadQRGroup: TQRGroup;
    qrLinedetails: TQRSubDetail;
    PartQRDBText: TgtQRDBText;
    BinQRDBText: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRLabelDlvrd: TgtQRLabel;
    QRLabelQty: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRShape1: TgtQRShape;
    qrlblOverPick: TQRLabel;
    qrdetailSerialNos: TQRSubDetail;
    lblSerialCaption: TgtQRLabel;
    lblSerialRange: TgtQRLabel;
    QRBand1: TQRBand;
    QRLabel17: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel19: TgtQRLabel;
    QRShape3: TgtQRShape;
    qryReport: TQuery;
    GetCustSQL: TQuery;
    AdhocSQL: TQuery;
    qryGetProduction: TQuery;
    qryGetJobBag: TQuery;
    GetAccountSQL: TQuery;
    AddressSRC: TDataSource;
    GetCustHOSQL: TQuery;
    GetDelivNarrSQL: TQuery;
    AddDelivDetSQL: TQuery;
    AddDelivLineDetSQL: TQuery;
    UpdSOHeadSQL: TQuery;
    CustSQL: TQuery;
    GetDelivCountSQL: TQuery;
    gtQRDBText1: TgtQRDBText;
    gtQRDBText2: TgtQRDBText;
    qryGetSerialNos: TQuery;
    CheckDelivSQL: TQuery;
    qryGetJobBagReq: TQuery;
    gtQRLabel2: TgtQRLabel;
    qryGetFSCClaim: TQuery;
    chldbndFSCClaim: TQRChildBand;
    gtlblFSCClaim: TgtQRLabel;
    gtQRMemo1: TgtQRMemo;
    PartDescrQRLabel: TgtQRLabel;
    qrmCompanyName: TgtQRMemo;
    CompSQL: TQuery;
    qryGetDelivery: TQuery;
    procedure qrLinedetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeadQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeadQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrdetailSerialNosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrdetailSerialNosAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    sLastProduct: string;
    DeliveryNo: Integer;
    procedure BuildDeliveryNotes(aQuery: TQuery;
      const iNarrative: integer);
    function GetJobBagNumber(tempCode: integer): string;
    function GetNextDeliveryNo(TempSoNo: integer): integer;
    procedure GetAddDetails(Cust, Branch: integer);
    procedure UpdateDeliveryLines(Sender: Tobject);
    { Private declarations }
  public
    SOPicking: integer;
    Reprint: ByteBool;
    Preview: ByteBool;
    function GetDetails(Sender: TObject): integer;
  end;

var
  STRPPickingNoteFrm: TSTRPPickingNoteFrm;

implementation

uses CCSCommon, CCSPrint, STSOObjects, pbDatabase;

{$R *.dfm}

{ TSTRPPickingNoteFrm }

function TSTRPPickingNoteFrm.GetDetails(Sender: TObject): integer;
begin
  with qryReport do
  begin
    Close;
    ParamByName('Sales_Order_Picking').AsInteger := SOPicking;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTRPPickingNoteFrm.qrLinedetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  stemp: string;
  sFSCClaim: string;
begin
  lblSerialCaption.Enabled := true;
  QrLabelQty.Caption := qryReport.FieldbyName('Quantity_to_pick').Asstring;
  QRLabeldlvrd.Caption := ShowinPacks(qryReport.FieldbyName('Quantity_to_pick').AsInteger,qryReport.fieldByname('Sell_Pack_Quantity').AsInteger);
  qrlblOverPick.enabled := (qryReport.fieldbyname('Invoice_upfront').asstring = 'N');

  if qryReport.fieldbyname('Line_Is_Sample').asstring = 'Y' then
    PartDescrQRLabel.Caption := qryReport.FieldByName('Part_Description').AsString + ' (SAMPLE)'
  else
    PartDescrQRLabel.Caption := qryReport.FieldByName('Part_Description').AsString;

  if slastProduct <> qryReport.FieldbyName('Part').Asstring then
  begin
    slastProduct := qryReport.FieldbyName('Part').Asstring;
    gtlblFSCClaim.Caption := '';

    {Display the FSC Claim details}
    if qryReport.fieldbyname('FSC_Material_Claim').asinteger <> 0 then
    begin
      with qryGetFSCClaim do
        begin
          close;
          parambyname('FSC_Material_Claim').asinteger := qryReport.fieldbyname('FSC_Material_Claim').asinteger;
          open;
          if recordcount > 0 then
            begin
              if fieldbyname('Mixed_Claim').asstring = 'Y' then
                sFSCClaim := stringreplace(fieldbyname('Short_Description').asstring,'X',formatfloat('0',qryReport.fieldbyname('FSC_Mixed_Percentage').asfloat),[])
              else
                sFSCClaim := fieldbyname('Short_Description').asstring;

              if trim(fieldbyname('Claim_Type').asstring) = 'FSC' then
                gtlblFSCClaim.Caption := 'FSC Claim: ' + sFSCClaim
              else
                gtlblFSCClaim.Caption := 'PEFC Declaration: ' + sFSCClaim
            end
          else
            begin
              gtlblFSCClaim.Caption := '';
            end;
        end;
    end;

    chldbndFSCClaim.Enabled := (gtlblFSCClaim.caption <> '');
  end
  else
    chldbndFSCClaim.Enabled := false;

  with qryGetSerialNos do
    begin
      close;
      parambyname('Part_Store_allocation').asinteger := qryReport.FieldbyName('Part_Store_allocation').Asinteger;
      parambyname('Sales_order').asinteger := qryReport.FieldbyName('Sales_order').Asinteger;
      open;
      qrDetailSerialNos.enabled := (recordcount > 0);
    end;

  UpdateDeliveryLines(Self);
end;

procedure TSTRPPickingNoteFrm.PageHeadQRBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  irow : integer;
  UseBranchName: boolean;
begin
  UseBranchName := false;

  qrlblWarehouse.caption := '';
  qrlblWarehouse.caption := qryReport.FieldByName('Part_Store_Name').Asstring;

  qrlabel4.enabled := qryReport.FieldByName('Stock_Bins_in_Use').AsString = 'Y' ;

  NotesQRMemo.Lines.Clear;
  GetCustSQL.Close;
  GetCustSQL.ParamByName('Customer').AsInteger := qryReport.FieldByName('Customer').AsInteger;
  GetCustSql.ParamByName('Branch_No').AsInteger := qryReport.FieldByName('Branch_No').AsInteger;
  GetCustSQL.Open;
  if ((GetCustSQL.FieldByName('Inv_To_Customer').AsInteger = qryReport.FieldByName('Customer').AsInteger) and
       (GetCustSQL.FieldByName('Inv_To_Branch').AsInteger = qryReport.FieldByName('Branch_No').AsInteger)) then
          QRLblAccnt.Caption := GetCustsql.fieldbyname('Account_code').AsString
  else
    begin
      GetAccountSQL.Close;
      GetAccountSQL.ParamByName('Customer').AsInteger := GetCustSQL.FieldByName('Inv_To_Customer').AsInteger;
      GetAccountSQL.ParamByName('Branch_No').AsInteger := GetCustSQL.FieldByName('Inv_To_Branch').AsInteger;
      GetAccountSQL.Open;
      QRLblAccnt.Caption := GetAccountsql.fieldbyname('Account_code').AsString;
    end;

  if qryReport.FieldByName('Ad_Hoc_Address').AsString <> '' then
  begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          qryReport.FieldByName('Ad_Hoc_Address').AsInteger;
        Open;
        BuildDeliveryNotes(AdHocSQL, FieldByName('Delivery_Narrative').AsInteger);
        qrlblShortCode.caption := '';
      end;
      AddressSRC.Dataset := AdhocSQL;
  end
  else
  if (qryReport.FieldByName('Delivery_Customer').AsString <> '') and
      (qryReport.FieldByName('Delivery_Customer').AsString <> '0') then
  begin
    with GetCustSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := qryReport.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger := qryReport.FieldByName('Delivery_Branch').AsInteger;
      Open;

      UseBranchName := FieldByName('Use_Branch_Name').AsString = 'Y';

      BuildDeliveryNotes(GetCustSQL, FieldByName('Delivery_Narrative').AsInteger);
      qrlblShortCode.caption := FieldByName('Short_Code').Asstring;
      AddressSRC.Dataset := GetCustSQL;
    end;
//  if head Office department then get head Office address
    if GetCustSQl.fieldbyname('HO_Department').asinteger = 1 then
      begin
        GetCustHOSQL.Close;
        GetCustHOSQL.ParamByName('Customer').AsInteger := qryReport.FieldByName('Delivery_Customer').AsInteger;
        GetCustHOSQL.ParamByName('Branch_no').AsInteger := qryReport.FieldByName('Delivery_Branch').AsInteger;
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
        parambyname('Production_Location').asinteger := qryReport.FieldByName('Production_Location').AsInteger;
        open;
        BuildDeliveryNotes(AdHocSQL, 0);
        qrlblShortCode.caption := '';
        AddressSRC.DataSet := qryGetProduction;
      end;
    qrlblAccountLabel.caption := 'Job Bag Number';
    qrlblAccnt.caption := GetJobBagNumber(qryReport.fieldbyname('Sales_Order').asinteger);
  end;

  {Build the Address Memo field}
  if UseBranchName then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      NotesQRMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for irow := (0 + integer(UseBranchName)) to 5 do
  begin
    if AddressSRC.dataset.Fields[irow].AsString = '' then
      continue;
//    if (irow = 1) and (AddressSRC.dataset.FieldByName('HO_Department').asinteger = 0) then
//      continue;
    NotesQRMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[irow].AsString));
  end;
end;

procedure TSTRPPickingNoteFrm.BuildDeliveryNotes(aQuery: TQuery;
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
      DelInstructMemo.Lines.Text := qryReport.FieldByName('Delivery_Notes').AsString
    else
      DelInstructMemo.Lines.Text := DelInstructMemo.Lines.Text + cLFCR + qryReport.FieldByName('Delivery_Notes').AsString;
  end;
end;

function TSTRPPickingNoteFrm.GetJobBagNumber(tempCode: integer): string;
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

procedure TSTRPPickingNoteFrm.GroupHeadQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Cust, Branch, icount: integer;
  DelNo: string;
  UseBranchName: boolean;
begin
  {Check whether the Delivery Details have already been added}
  with qryGetDelivery do
    begin
      close;
      parambyname('Sales_order').asinteger := qryReport.fieldByName('Sales_Order').AsInteger;
      open;
      Reprint := (recordcount > 0);
    end;

  DeliveryNo := 1;
  DelNo := IntToStr(qryReport.fieldByName('Sales_Order').AsInteger) + '01';

  UseBranchName := false;

  if reprint = True then
    PreviewQRLabel.Caption := 'Reprint';

(*  if reprint = True then
    PreviewQRLabel.Caption := 'Reprint'
  else
    begin
      DeliveryNo := GetNextDeliveryNo(qryReport.fieldByName('Sales_Order').AsInteger);
      DelNO := IntToStr(qryReport.fieldByName('Sales_Order').AsInteger) + format ('%.2d',[DeliveryNo]);
    end;
*)
  if (Preview = False) and (Reprint = False) then
    begin
//      WriteLastRef(Self);
      try
        with AddDelivDetSQL do
        begin
          Close;
          ParamByName('Sales_Order').AsInteger := qryReport.fieldByName('Sales_Order').AsInteger;
          ParamByName('Sales_Order_Deliv').AsInteger := DeliveryNo;
          ParamByName('Del_Dt').AsDateTime := qryReport.fieldByName('Date_Picked').Asdatetime;
          ParamByName('Desp_Note_No').AsString := DelNo;
          ParamByName('Delivery_Instructions').asstring := qryReport.fieldbyname('Delivery_Notes').asstring;
          ParamByName('Del_Type').clear;
          ParamByname('Courier').clear;
          ExecSQL;
        end;
      except
      end;
    end;

  if (Preview = False) then
    begin
      if qryReport.fieldbyname('Sales_order_Head_Status').AsInteger <= shDespNotePrinted then
        begin
          with updSOHeadSQL do
            begin
              Close;
              ParamByName('Sales_Order').AsInteger := qryReport.FieldByName('Sales_Order').AsInteger;
              ParamByName('Status').AsInteger := shDespNotePrinted;
              ExecSQL;
            end;
        end;
    end;

  CustomerAddMemo.Lines.Clear;

  {Get Delivery Details}
  Cust :=  qryReport.FieldByName('Customer').AsInteger;
  Branch := qryReport.FieldByName('Branch_No').AsInteger;

  GetAddDetails(Cust,Branch);

  UseBranchName := CustSQL.FieldByName('Use_Branch_Name').AsString = 'Y';

  if UseBranchName then
  begin
    if AddressSRC.Dataset.FieldByName('Branch_Name').AsString <> '' then
      CustomerAddMemo.Lines.Add(Trim(AddressSRC.Dataset.FieldByName('Branch_Name').AsString));
  end;

  for icount := (0 + integer(UseBranchName)) to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
end;

procedure TSTRPPickingNoteFrm.GetAddDetails(Cust, Branch: integer);
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

function TSTRPPickingNoteFrm.GetNextDeliveryNo(TempSoNo: integer): integer;
begin
  with GetdelivCountSql do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := TempSoNo;
      Open;
      Result := Recordcount + 1;
    end;
end;

procedure TSTRPPickingNoteFrm.qrDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
   irow: integer;
begin
  {set the printer to what the user selected}
  qrDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  If Preview = False then
    PreviewQRLabel.Caption := '';

  with qrmCompanyName do
    begin
      CompSQL.close;
      CompSQL.open;
      Lines.Clear;
      for irow := 0 to 5 do
        begin
        if Trim(CompSQL.Fields[irow].AsString) <> '' then
        Lines.Append(Trim(CompSQL.Fields[irow].AsString)) ;
      end;
    {Finally, add the phone number} ;
      Lines.Append(' ');
      Lines.Append('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
      Lines.Append('Fax: ' + Trim(CompSQL.FieldByName('Fax_Number').AsString));
      Lines.Append('Email: ' + Trim(CompSQL.FieldByName('Email').AsString));
    end;
//  qrlblCompany.Caption := dmBroker.getCompanyName;
end;

procedure TSTRPPickingNotefrm.UpdateDeliveryLines(Sender: Tobject);
begin
  if (Preview = False) and (Reprint = False) then
  begin
    with CheckDelivSQL do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := qryReport.fieldByName('Sales_Order').AsInteger;
      ParamByName('Sales_order_Line_No').AsInteger := qryReport.fieldByName('Sales_Order_Line_No').AsInteger;
      ParamByName('Sales_Order_Deliv').AsInteger := DeliveryNo;
      Open;
      if eof then
      begin
        with AddDelivLineDetSQL do
        begin
          Close;
          ParamByName('Sales_Order').AsInteger := qryReport.fieldByName('Sales_Order').AsInteger;
          ParamByName('Sales_order_Line_No').AsInteger := qryReport.fieldByName('Sales_Order_Line_No').AsInteger;
          ParamByName('Sales_Order_Deliv').AsInteger := DeliveryNo;
          ExecSQL;
        end;
      end;
    end;
  end;
end;

procedure TSTRPPickingNoteFrm.qrdetailSerialNosBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lblSerialRange.caption := qryGetSerialNos.fieldbyname('Serial_Item_from').asstring + ' to ' +
                            qryGetSerialNos.fieldbyname('Serial_Item_to').asstring;

end;

procedure TSTRPPickingNoteFrm.qrdetailSerialNosAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  lblSerialCaption.enabled := false;
end;

end.
