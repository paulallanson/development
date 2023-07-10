unit PBRSSupplierTurn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, ExtCtrls, DateSelV5, PBPOObjects, Printers, CCSPrint,
  ComCtrls, Spin, OleCtnrs;

type
  TPBRSSupplierTurnFrm = class(TForm)
    GrpBxDts: TGroupBox;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    PrintBitBtn: TBitBtn;
    TotByRadioGroup: TRadioGroup;
    Label3: TLabel;
    cbSort1: TComboBox;
    PreviewReportBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    spnRecords: TSpinEdit;
    GroupBox1: TGroupBox;
    chkbxExcludeCosts: TCheckBox;
    qryPurchByInv: TQuery;
    qryUpdIntSel: TQuery;
    AddIntSelQuery: TQuery;
    GetSalesQuery: TQuery;
    qryCreditLines: TQuery;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btbtnExcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function GetNextIntSelCode(Sender: TObject): Integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure DateToEditExit(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateFromEditExit(Sender: TObject);
    procedure Canprint;
    procedure btbtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    DateFrom, DateTo: TDateTime;
    SelRepCode: integer;
    SelRepText : string;
    procedure FixQuery(rep: Boolean);
    procedure CallReport(const bPreview : Boolean);
    procedure CreateWrkFile(Sender: TObject);
    procedure AddWork(OpNo, SupplierNo, BranchNo: Integer; TotSales, TotCst: real);
    procedure UpdWork(OpNo, SupplierNo, BranchNo: Integer; TotSales, TotCst: real);
    Function GetTotalSales(InvNo: Integer): real;
    function BuildQueryString(rep: Boolean): string;

  public
    { Public declarations }
    iIntselcode: Integer;
    bDatesChng: ByteBool;
  end;

var
  PBRSSupplierTurnFrm: TPBRSSupplierTurnFrm;

implementation

uses PBDatabase, PBRPSupplierTurn, CCSCommon;

{$R *.DFM}
const
  SQLCore =

  'SELECT Supplier_invoice.Supplier, '+
	'   Supplier_invoice.Supplier_Invoice, '+
	'   Supplier_invoice.Goods_Value, '+
	'   Supplier_invoice.Invoice_or_Credit, '+
  '	  Supplier_invoice.Branch_No, '+
	'   Supplier_invoice.Supplier_Invoice_no '+
  'FROM Supplier_invoice ';

procedure TPBRSSupplierTurnFrm.FormCreate(Sender: TObject);
begin
 Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 1;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  spnRecords.Value:= 0;
  bDatesChng := False;
  iIntselcode := GetNextIntSelCode(Self);
end;

procedure TPBRSSupplierTurnFrm.FormShow(Sender: TObject);
begin
// qrySalesByInv.Active := True;
end;

procedure TPBRSSupplierTurnFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
  {Delete ALL entries on the workfile for the int_sel_code} ;
  With dmBroker.DelWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
     ExecSQL ;
     end;
  {Add the reserving one back in} ;
  If not bTempDelCode then
     begin
     With dmBroker.AddWorkSQL do
          begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := '' ;
          ExecSQL ;
          end;
     end;
end;

function TPBRSSupplierTurnFrm.GetNextIntSelCode(Sender: TObject): Integer;
var
  iIntSelCode: Integer ;
begin
{Get the next int_sel_code to use} ;
  With dmBroker.GetLastIntSelSQL do
     begin
     Close ;
     Open ;
     First;
     iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
     end;
  {Reserve it on the int_sel file} ;
  With dmBroker.AddWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
     ParamByName('Text100').AsString := ' ' ;
     ExecSQL ;
     end;
  Result := iIntSelCode ;
end;

procedure TPBRSSupplierTurnFrm.DateToEditExit(Sender: TObject);
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
  bDatesChng := True;
end;

function TPBRSSupplierTurnFrm.InputDate(TempDate: TDateTime): TDateTime;
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
      begin
        Result := DateSelV5Form.Date;
        bDatesChng := True;
      end;
  finally
    DateSelV5Form.Free;
  end;

end;

procedure TPBRSSupplierTurnFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSSupplierTurnFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

function TPBRSSupplierTurnFrm.BuildQueryString(rep: Boolean): string;
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
  {rebuilds the query string depending on the sort selections}
  sTemp := SQLCore;
  sTemp := sTemp + ' WHERE Supplier_Invoice.Supp_Invoice_Status > 0 ';
  sTemp := sTemp + ' AND Supplier_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Supplier_Invoice.Invoice_Date <= ' + qDate(DateTo);

  Result := sTemp + 'Order By Supplier, Branch_no';
end;

procedure TPBRSSupplierTurnFrm.CallReport(const bPreview: Boolean);
var
  PBRPSupplierTurnFrm: TPBRPSupplierTurnFrm;
  PrinterSettings: TPrinterSettings;
begin
  if bDatesChng then
  begin
    qryPurchByInv.Close;
    DelIntSelCode(iIntSelCode, True);
    fixquery(True);
    if qryPurchByInv.recordcount = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOk], 0);
      CancelBitBtn.SetFocus;
      Exit;
    end;

  CreateWrkFile(Self);
  bDatesChng := False;
  end;
  {add total order by clause to report query}

  PBRPSupplierTurnfrm := TPBRPSupplierTurnfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSupplierTurnfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPSupplierTurnfrm.qrlblTitle.caption := PBRPSupplierTurnfrm.qrlblTitle.caption + DateToStr(Date);
          PBRPSupplierTurnfrm.qrlblDateRange.caption :=
          PBRPSupplierTurnfrm.qrlblDateRange.caption + DateFromEdit.Text +
            ' to: ' + DateToEdit.Text+',';
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSupplierTurnfrm.qrlblDateRange.caption :=
            PBRPSupplierTurnfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text + ' Ascending'
          else
            PBRPSupplierTurnfrm.qrlblDateRange.caption :=
            PBRPSupplierTurnfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text + ' Descending';
          PBRPSupplierTurnfrm.NoOfRecords := spnRecords.value;
          PBRPSupplierTurnfrm.OrderAsc := TotByRadioGroup.ItemIndex = 0;
          PBRPSupplierTurnfrm.seqbySales := cbsort1.itemindex = 0;
          PBRPSupplierTurnfrm.seqbyCost := cbsort1.itemindex = 1;
          PBRPSupplierTurnfrm.seqbyProfit := cbsort1.itemindex = 2;
          PBRPSupplierTurnfrm.seqbyMargPerc := cbsort1.itemindex = 3;
          PBRPSupplierTurnfrm.intselcode := iintselcode;

          PBRPSupplierTurnfrm.TurnOffCosts := chkbxexcludecosts.checked;

          if bPreview then
            PBRPSupplierTurnfrm.qrpDetails.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSupplierTurnfrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSupplierTurnfrm.free;
    Application.ProcessMessages;
  end;

end;

procedure TPBRSSupplierTurnFrm.CreateWrkFile(Sender: TObject);
var
  TotalPurchase, TotalSales : real;
  SupplierNo, InvNo, OpNo, SaveSupplierNo, BranchNo, SaveBranchNo : integer;
begin
  SaveSupplierNo := 0;
  SaveBranchNo := 0;
  OpNo := iIntselcode;
  With qryPurchByInv do
  begin
    close;
    Open;
    First;
    while not eof do
    begin
      InvNo := FieldByName('Supplier_Invoice').AsInteger;
      TotalPurchase := FieldByName('Goods_Value').Asfloat;
      SupplierNo := FieldByName('Supplier').AsInteger;
      TotalSales := GetTotalSales(InvNO);
      BranchNo := FieldByName('Branch_No').AsInteger;
      if (SupplierNo <> SaveSupplierNo) or (BranchNo <>SaveBranchNo) then
        AddWork(OpNo, SupplierNo, BranchNo, TotalSales, TotalPurchase)
      else
        UpdWork(OpNo, SupplierNo, BranchNo, TotalSales, TotalPurchase);
      SaveSupplierNo := FieldByName('Supplier').AsInteger;
      SaveBranchNo := FieldByName('Branch_No').AsInteger;
      next;
    end;
  end;
end;

procedure TPBRSSupplierTurnFrm.AddWork(OpNO, SupplierNo, BranchNo: Integer; TotSales,
  TotCst: real);
begin
  with AddIntSelQuery do
  begin
    close;
    ParamByName('Int_Sel_Code').AsInteger := Opno;
    ParamByName('Sel1').AsFloat := SupplierNo;
    ParamByName('Sel2').AsFloat := BranchNo;
    ParamByName('Sel3').AsFloat := TotSales;
    if TotCst = 0 then
      ParamByName('Sel4').AsFloat := 0.001
    else
      ParamByName('Sel4').AsFloat := TotCst;
    ParamByName('Text100').AsString := ' ';
    execSQL;
  end;
end;

function TPBRSSupplierTurnFrm.GetTotalSales(InvNo: Integer): real;
var
  rTotalCost :real;
  iQty: integer;
  raddcost: real;
begin
  rTotalCost := 0;
  {only get the costs if invoice}
  if (qryPurchByInv.FieldByName('Invoice_or_Credit').asstring = 'I') or
     (qryPurchByInv.FieldByName('Invoice_or_Credit').asstring = '') then
    begin
      with getSalesQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger := InvNo;
          Open;
          First;

          while not eof do
            begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Invoiced').asinteger;

            if FieldByName('Sell_Unit_Factor').asfloat <> 0 then
              rTotalCost := rTotalCost + (iQty / FieldByName('Sell_Unit_Factor').asinteger)
                      * FieldByName('Selling_Price').asfloat
            else
              begin
                try
                  rTotalCost := rTotalCost + ((FieldByName('Selling_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                except
                  rTotalCost := rTotalCost + 0;
                end;
              end;
            next;
            end;
        end;
      rAddCost := 0;
      rTotalCost := rTotalCost + rAddcost;
    end;

  Result := rTotalCost;
end;

procedure TPBRSSupplierTurnFrm.FixQuery(rep: Boolean);
begin
  qryPurchByInv.DisableControls;
  try
    qryPurchByInv.Close;
    qryPurchByInv.SQL.Clear;
    qryPurchByInv.SQL.text := BuildQueryString(rep);
    qryPurchByInv.Open;
  finally
    qryPurchByInv.EnableControls;
  end;
end;

procedure TPBRSSupplierTurnFrm.PrintBitBtnClick(Sender: TObject);
begin
 CallReport(False);
end;

procedure TPBRSSupplierTurnFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
 CallReport(True);
end;

procedure TPBRSSupplierTurnFrm.UpdWork(OpNo, SupplierNo, BranchNo: Integer; TotSales,
  TotCst: real);
begin
  with qryUpdIntSel do
  begin
    close;
    ParamByName('Int_Sel_Code').AsInteger := Opno;
    ParamByName('Sel1').AsFloat := SupplierNo;
    ParamByName('Sel2').AsFloat := BranchNo;
    ParamByName('Sel3').AsFloat := TotSales;
    ParamByName('Sel4').AsFloat := TotCst;
    execSQL;
  end;
end;

procedure TPBRSSupplierTurnFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSSupplierTurnFrm.DateFromEditExit(Sender: TObject);
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
  bDatesChng := True;
end;

procedure TPBRSSupplierTurnFrm.Canprint;
begin
 {Check if can print}
  PrintBitBtn.Enabled := (dateFromEdit.text <> '') and
                         (dateToEdit.Text <> '');
  PreviewReportBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRSSupplierTurnFrm.btbtnExcelClick(Sender: TObject);
var
  PBRPSupplierTurnFrm: TPBRPSupplierTurnFrm;
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempFileName: string;
begin
  if bDatesChng then
  begin
    qryPurchByInv.Close;
    DelIntSelCode(iIntSelCode, True);
    fixquery(True);
    if qryPurchByInv.recordcount = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOk], 0);
      CancelBitBtn.SetFocus;
      Exit;
    end;

  CreateWrkFile(Self);
  bDatesChng := False;
  end;
  {add total order by clause to report query}

  PBRPSupplierTurnfrm := TPBRPSupplierTurnfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSupplierTurnfrm.PrinterSettings := PrinterSettings;

      {this part copies the query and values from the report selection form to the report print form}
      PBRPSupplierTurnfrm.NoOfRecords := spnRecords.value;
      PBRPSupplierTurnfrm.OrderAsc := TotByRadioGroup.ItemIndex = 0;
      PBRPSupplierTurnfrm.seqbySales := cbsort1.itemindex = 0;
      PBRPSupplierTurnfrm.seqbyCost := cbsort1.itemindex = 1;
      PBRPSupplierTurnfrm.seqbyProfit := cbsort1.itemindex = 2;
      PBRPSupplierTurnfrm.seqbyMargPerc := cbsort1.itemindex = 3;
      PBRPSupplierTurnfrm.intselcode := iintselcode;

      PBRPSupplierTurnfrm.TurnOffCosts := chkbxexcludecosts.checked;

      reccount := qryPurchByInv.recordcount;
      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + 'Supplier Turnover ' + formatdatetime('ddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPSupplierTurnfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSupplierTurnfrm.Free;
    Application.ProcessMessages;
  end;

end;

end.
