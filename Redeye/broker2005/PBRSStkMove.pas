unit PBRSStkMove;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Db, CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSStkMoveFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    rgCustomer: TRadioGroup;
    rgStockRef: TRadioGroup;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FormRefPanel: TPanel;
    lblSupplier: TLabel;
    edtStockRef: TEdit;
    btnFormRef: TButton;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    qryReport: TFDQuery;
    dsReport: TDataSource;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportDelivery_no: TIntegerField;
    qryReportAd_hoc_Address: TIntegerField;
    qryReportSupplier: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportRep: TIntegerField;
    qryReportQty_to_Deliver: TFloatField;
    qryReportQty_Delivered: TFloatField;
    qryReportQty_Invoiced: TFloatField;
    qryReportDate_Point: TDateTimeField;
    qryReportBranch_No0: TIntegerField;
    qryReportCustomer: TIntegerField;
    qryReportDeliver_via_Company: TWideStringField;
    qryReportDate_Deliv_Actual: TDateTimeField;
    qryReportDelivery_to_Stock: TWideStringField;
    qryReportDelivery_note_printed: TWideStringField;
    qryReportOrder_Customer: TIntegerField;
    qryReportCustomer_Branch: TIntegerField;
    qryReportCust_order_no: TWideStringField;
    qryReportPurch_Ord_Line_Status: TIntegerField;
    qryReportSupplier_1: TIntegerField;
    qryReportSupplier_Branch: TIntegerField;
    qryReportSupplier_Name: TWideStringField;
    qryReportCustomer_Name: TWideStringField;
    qryReportOrder_Status: TWideStringField;
    qryReportQty_In: TIntegerField;
    qryReportQty_Out: TIntegerField;
    qryReportDeliveryName: TWideStringField;
    DummySQL: TFDQuery;
    Label3: TLabel;
    cbSort1: TComboBox;
    qryReportCustomers_Desc: TWideStringField;
    qryReportForm_Reference_ID: TWideStringField;
    qryReportPOrder: TWideStringField;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    Label4: TLabel;
    cbSort2: TComboBox;
    qryReportSelling_Price: TCurrencyField;
    qryReportSell_Unit: TIntegerField;
    qryReportSell_Unit_Descr: TWideStringField;
    qryReportPrice_Unit_Factor: TFloatField;
    qryReportStock_Reference: TWideStringField;
    chkbxExcCsts: TCheckBox;
    Label5: TLabel;
    cbSort3: TComboBox;
    chkbxExcSell: TCheckBox;
    procedure rgCustomerClick(Sender: TObject);
    procedure rgStockRefClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnFormRefClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbSort1Change(Sender: TObject);
    procedure qryReportPOrderGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportQty_InGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportQty_OutGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportCalcFields(DataSet: TDataSet);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure cbSort2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure chkbxExcSellClick(Sender: TObject);
  private
    { Private declarations }
    FActivated: boolean;
    SelCustCode, SelCustBranch, SelFormCode: integer;
    SelFormText, SelCustText: string;
    DateFrom, DateTo : TDateTime;
    procedure SomethingChanged;
    procedure FixQuery;
    procedure DispSelection;
    procedure CanPrint;
    function BuildQueryString : string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox : TComboBox) : string;
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  PBRSStkMoveFrm: TPBRSStkMoveFrm;

implementation

uses UITypes, PBLUCust, PBDatabase, DateSelV5, PBLUFormRef, PBPODataMod, PBRPStkMove, CCSPrint, Printers;

{$R *.DFM}

procedure TPBRSStkMoveFrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  rgStockRef.enabled := rgCustomer.ItemIndex = 1;
  rgStockRef.visible := (rgCustomer.ItemIndex = 1);

  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSStkMoveFrm.rgStockRefClick(Sender: TObject);
begin
  FormRefPanel.Visible := rgStockRef.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSStkMoveFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.SelBranch := SelCustBranch;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustText := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
      SomethingChanged;
    end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBRSStkMoveFrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSStkMoveFrm.FixQuery;
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.Text := BuildQueryString;
    qryReport.Open;
  finally
    qryReport.EnableControls;
  end;
end;

procedure TPBRSStkMoveFrm.DispSelection;
begin
  {Display selection}
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';

  {Display selection}
  if SelFormCode <> 0 then
    edtStockRef.Text := SelFormText
  else
    edtStockRef.Text := '';
end;

procedure TPBRSStkMoveFrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled := (qryReport.RecordCount > 0) and
    (
    ((rgStockRef.ItemIndex = 0) and (rgCustomer.ItemIndex = 0)) or
    ((rgStockRef.ItemIndex = 1) and (edtStockRef.Text <> '')) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

function TPBRSStkMoveFrm.BuildQueryString: string;
var
  sTemp : string;
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
  Result := DummySQL.SQL.text;
  Result := Result + ' AND Delivery_Detail.Date_Deliv_Actual >= ' + qDate(DateFrom);
  Result := Result + ' AND Delivery_Detail.Date_Deliv_Actual <= ' + qDate(DateTo);

  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Purchase_OrderLine.Customer = ' +
      IntToStr(SelCustCode) + ' AND Purchase_OrderLine.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;

  if (rgStockRef.ItemIndex = 1) and (SelFormCode <> 0) then
  begin
    Result := Result + ' AND Purchase_OrderLine.Form_Reference = ' +
      IntToStr(SelFormCode);
  end;

  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) + Ordering(cbSort3);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end
  else
    sTemp := '';

(*      if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0)
      or (cbSort3.ItemIndex >= 0) then
        begin
          sTemp := ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) +
            Ordering(cbSort3);
          if sTemp[Length(sTemp)] = ',' then
            sTemp[Length(sTemp)] := ' ';
        end
      else
        sTemp := '';
*)

  Result := Result + sTemp;
end;

function TPBRSStkMoveFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Customer.Name,';
  1:   Result := ' Supplier_Branch.Name,';
  2:   Result := ' Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line,';
  3:   Result := ' Delivery_Detail.Date_Point,';
  4:   Result := ' Delivery_Detail.Date_Deliv_Actual,';
  5:   Result := ' Form_Reference.Stock_Reference,';
  else Result := '';
  end;
end;

procedure TPBRSStkMoveFrm.btnFormRefClick(Sender: TObject);
begin
  PBLUFormRefFrm := TPBLUFormRefFrm.Create(Self);
  try
    PBLUFormRefFrm.bIs_Lookup := True;
    PBLUFormRefFrm.bAllow_Upd := false;
    PBLUFormRefFrm.iCust := SelCustCode;
    PBLUFormRefFrm.sCustName := SelCustText;
    PBLUFormRefFrm.iBranch := SelCustBranch;
    PBLUFormRefFrm.sBranchName := PBPODM.GetCustBranchName(SelCustCode,SelCustBranch);
    PBLUFormRefFrm.SelCode := SelFormCode;
    PBLUFormRefFrm.ShowModal;
    if PBLUFormRefFrm.bSelected then
    begin
      SelFormCode := PBLUFormRefFrm.SelCode;
      SelFormText := PBLUFormRefFrm.StockCode;

      edtStockRef.Text := PBLUFormRefFrm.StockCode;
      SomethingChanged;
    end;
  finally
    PBLUFormRefFrm.Free;
  end;

end;

procedure TPBRSStkMoveFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgCustomer.ItemIndex := 0;
    rgStockRef.itemindex := 0;
    rgStockRefClick(nil);
    rgCustomerClick(nil);
    cbSort1.ItemIndex := 0;
    cbSort2.ItemIndex := 5;
    cbSort3.ItemIndex := 4;

    DateTo := Date;
    DateToEdit.Text := PBDatestr(DateTo);
    DateFrom := Date - 30;
    DateFromEdit.Text := PBDatestr(DateFrom);

    SomethingChanged;
    FActivated := true;
  end;

end;

procedure TPBRSStkMoveFrm.cbSort1Change(Sender: TObject);
begin
  SomethingChanged;
end;

procedure TPBRSStkMoveFrm.qryReportPOrderGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReportPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryReportPurchase_Order.Asfloat,qryReportLine.AsInteger);
end;

procedure TPBRSStkMoveFrm.qryReportQty_InGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring = 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';
end;

procedure TPBRSStkMoveFrm.qryReportQty_OutGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring <> 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';
end;

procedure TPBRSStkMoveFrm.qryReportCalcFields(DataSet: TDataSet);
begin
  if qryReport.FieldByName('Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        qryReport.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        qryReport.FieldByName('Branch_no0').AsInteger;
      Open;
    qryReport.Fieldbyname('DeliveryName').asstring := 'Cust/Br: '+fieldbyname('Customer_Name').asstring;
    end;
  end
  else
    if qryReport.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          qryReport.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        qryReport.Fieldbyname('DeliveryName').asstring := 'AdHoc: '+fieldbyname('Name').asstring;
      end;
    end
    else
      if qryReport.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            qryReport.FieldByName('Rep').AsInteger;
          Open;
          qryReport.Fieldbyname('DeliveryName').asstring := 'Rep: '+fieldbyname('Name').asstring;
        end;
      end
      else
        if qryReport.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              qryReport.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              qryReport.FieldByName('Branch_no').AsInteger;
            Open;
            qryReport.Fieldbyname('DeliveryName').asstring := 'Supp/Br: '+fieldbyname('Supplier_Name').asstring;
          end;
        end
        else
        begin
          with CompSQL do
          begin
            Close;
            Open;
            qryReport.Fieldbyname('DeliveryName').asstring := 'Comp: '+fieldbyname('Company_Name').asstring;
          end;
        end;

end;

procedure TPBRSStkMoveFrm.CallReport(const bPreview: Boolean);
var
  PBRPStkMovefrm: TPBRPStkMovefrm;
  PrinterSettings: TPrinterSettings;
begin
  qryReport.Close;
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      begin
        PBRPStkMoveFrm := TPBRPStkMoveFrm.Create(Self);
        try
          PBRPStkMoveFrm.PrinterSettings := PrinterSettings;
          PBRPStkMoveFrm.qryReport.SQL.Clear;
          PBRPStkMoveFrm.qryReport.SQL.Text := qryReport.SQL.Text;
          PBRPStkMoveFrm.qrlblTitle.Caption := PBRPStkMoveFrm.qrlblTitle.Caption + DateToStr(Now);
          PBRPStkMoveFrm.qrlblDateRange.caption :=
              PBRPStkMoveFrm.qrlblDateRange.caption + DateFromEdit.Text +
                ' to: ' + DateToEdit.Text;
          PBRPStkMoveFrm.hidecosts := chkbxExcCsts.checked;
          PBRPStkMoveFrm.hidesell := chkbxExcSell.checked;
          PBRPStkMoveFrm.onecustomer := (rgCustomer.itemindex = 1);
          if bPreview then
            PBRPStkMoveFrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPStkMoveFrm.QuickReport.Print;
        finally
          PBRPStkMoveFrm.Free;
          Application.ProcessMessages;
        end;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    qryReport.Open;
  end;
end;

procedure TPBRSStkMoveFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSStkMoveFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSStkMoveFrm.cbSort2Change(Sender: TObject);
begin
  SomethingChanged;
end;

procedure TPBRSStkMoveFrm.FormCreate(Sender: TObject);
begin
  PBPODM := TPBPODM.create(self);
end;

procedure TPBRSStkMoveFrm.FormDestroy(Sender: TObject);
begin
  PBPODM.free;
end;

procedure TPBRSStkMoveFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
  somethingchanged;
end;

procedure TPBRSStkMoveFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
  somethingchanged;
end;

procedure TPBRSStkMoveFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  somethingchanged;
end;

procedure TPBRSStkMoveFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  Dateto := InputDate(Dateto);
  DatetoEdit.Text := PBDatestr(Dateto);
  somethingchanged;
end;

function TPBRSStkMoveFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
  somethingchanged;
end;

procedure TPBRSStkMoveFrm.chkbxExcSellClick(Sender: TObject);
begin
  chkbxExcCsts.checked := chkbxExcSell.checked;
  chkbxExcCsts.enabled := not chkbxExcSell.checked;
end;

end.
