unit PBRSProofStatus;

(**********************************************************************

Copyright (c)  Centrereed Ltd 2000

Comments
   Proof Status report selection form.
VSS Info:
$Header: /PBL D5/PBRSProofStatus.pas 13    26/11/:1 16:04 Paul $
$History: PBRSProofStatus.pas $
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 26/11/:1   Time: 16:04
 * Updated in $/PBL D5
 * Modified to NOT display Inactive orders
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 27/09/:1   Time: 11:28
 * Updated in $/PBL D5
 * Fix bug re annoying printer dialog when previewing report.
 * 
 * *****************  Version 11  *****************
 * User: Janiner      Date: 14/06/:1   Time: 13:50
 * Updated in $/PBL D5
 * Modify to use new Purchase Order number/line number format
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 2/05/:1    Time: 13:02
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 19/03/:1   Time: 10:59
 * Updated in $/PBL D5
 * Corrected problem with displaying proof status
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 6/02/:1    Time: 14:22
 * Updated in $/PBL D5
 * Corrected problem whereby the SQl was failing when selecting to sort by
 * Customer.
 * 
 * *****************  Version 7  *****************
 * User: Davidn       Date: 17/10/00   Time: 13:55
 * Updated in $/PBL D5
 * added supplier fields and also allowed selection of specific supplier
 * and ordering by supplier.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 4/10/00    Time: 14:33
 * Updated in $/PBL D5
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 29/09/00   Time: 10:20
 * Updated in $/PBL D5
 * Added Combo Sort Boxes to order results of query.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 28/09/00   Time: 17:39
 * Updated in $/PBL D5
 * Combined PONumber and Line for display in DBGrid.
 * Added Cancel button.
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 28/09/00   Time: 16:36
 * Updated in $/PBL D5
 * Removed use of views (not allowed in Access databases) used a correlated
 * subquery instead and added a record counter to the form.
 * 
 * *****************  Version 1  *****************
 * User: Davidn       Date: 22/09/00   Time: 13:42
 * Created in $/PBL D5

***********************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, Buttons,
  PBRPProofStatus, Printers, CCSPrint, CCSCommon;

type
  TPBRSProofStatusFrm = class(TForm)
    qryCurrentProofStatus: TQuery;
    dtsrcCurrentProofStatus: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    pnlPrintControl: TPanel;
    pnlStatusSelect: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    qryProofStatus: TQuery;
    cmbbxProofStatus: TComboBox;
    dbgrdProofStatus: TDBGrid;
    lblRecordCount: TLabel;
    CancelBitBtn: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    cbSort3: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rgSupplier: TRadioGroup;
    pnlSuppSearch: TPanel;
    Label2: TLabel;
    edtSupplier: TEdit;
    btnSupplier: TButton;
    qryCurrentProofStatusProof_Date: TDateTimeField;
    qryCurrentProofStatusProof_Status: TStringField;
    qryCurrentProofStatusCustomers_Desc: TStringField;
    qryCurrentProofStatusCustomer: TIntegerField;
    qryCurrentProofStatusBranch_no: TIntegerField;
    qryCurrentProofStatusCustomer_Name: TStringField;
    qryCurrentProofStatusGoods_Required: TDateTimeField;
    qryCurrentProofStatusSupplier: TIntegerField;
    qryCurrentProofStatusSupplier_Name: TStringField;
    qryCurrentProofStatusCust_Order_No: TStringField;
    qryCurrentProofStatusPurch_Ord_Line_Status: TIntegerField;
    qryCurrentProofStatusDescription: TStringField;
    qryCurrentProofStatusBranch_No_1: TIntegerField;
    qryCurrentProofStatusPurchase_Order: TFloatField;
    qryCurrentProofStatusLine: TIntegerField;
    qryCurrentProofStatusPOLine: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cmbbxProofStatusChange(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure rgSupplierClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure qryCurrentProofStatusPOLineGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    SelCustCode, SelCustBranch, SelSuppCode, SelSuppBranch : integer;
    SelCustText, SelSuppText : string;
    procedure FixQuery;
    function BuildQueryString: string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
  public
    { Public declarations }
  end;

var
  PBRSProofStatusFrm: TPBRSProofStatusFrm;

implementation

uses PBLUCust, PBLUSupp;

{$R *.DFM}

const
  SQLCore =
  'SELECT '+
  'PHist.Purchase_Order, '+
  'PHist.Line, '+
  'PHist.Proof_Date, '+
  'PHist.Proof_Status, '+
  'Customers_Desc, '+
  'Purchase_OrderLine.Customer, '+
  'Purchase_OrderLine.Branch_no, '+
  'Customer.Name as Customer_Name, '+
  'Goods_Required, '+
  'Purchase_Order.Supplier, '+
  'Purchase_Order.Branch_No, '+
  'Supplier.Name as Supplier_Name, '+
  'Cust_Order_No, '+
  'Purch_Ord_Line_Status, '+
  'Description, ' +
  'Supplier_Job_ref ' +
  'FROM (((((Proof_History PHist '+
  'INNER JOIN Proof_Status ON (PHist.Proof_Status = Proof_Status.Proof_Status)) '+
  'INNER JOIN Purchase_OrderLine ON (PHist.Purchase_Order=Purchase_OrderLine.Purchase_Order AND PHist.Line = Purchase_OrderLine.Line)) '+
  'INNER JOIN Customer ON (Purchase_OrderLine.Customer=Customer.Customer)) '+
  'INNER JOIN Purchase_Order ON (PHist.Purchase_Order = Purchase_Order.Purchase_Order)) '+
  'INNER JOIN Supplier ON (Purchase_Order.Supplier = Supplier.Supplier)) '+
  'WHERE ((Purchase_OrderLine.Inactive <> ''Y'') or (Purchase_OrderLine.Inactive is null)) AND '+
  ' (PHist.Proof_Date = (SELECT MAX(Proof_Date) '+
    'FROM Proof_History '+
    'WHERE (Purchase_Order = PHist.Purchase_Order AND Line = PHist.Line) '+
  'GROUP BY Purchase_Order, Line) '+
  'AND Purch_Ord_Line_Status = 20) ';


procedure TPBRSProofStatusFrm.FormCreate(Sender: TObject);
begin
  qryProofStatus.Open;
  while not qryProofStatus.Eof do
  begin
    cmbbxProofStatus.Items.Add(qryProofStatus.Fields[0].AsString);
    qryProofStatus.Next;
  end;
  cmbbxProofStatus.Items.Add('Show All');
  cbSort1.ItemIndex := 0;
  Screen.Cursor := crDefault;
  FixQuery;  
end;

procedure TPBRSProofStatusFrm.cmbbxProofStatusChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSProofStatusFrm.rgCustomerClick(Sender: TObject);
begin
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    qryCurrentProofStatusCustomer_Name.visible := True;
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
  FixQuery;
end;

procedure TPBRSProofStatusFrm.btnCustomerClick(Sender: TObject);
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
    end;
    edtCustomer.Text := SelCustText;
    FixQuery;
  finally
    PBLUCustFrm.Free;
    qryCurrentProofStatusCustomer_Name.visible := False;
  end;
end;

procedure TPBRSProofStatusFrm.FormShow(Sender: TObject);
begin
  qryProofStatus.Active := True;
  qryCurrentProofStatus.Active := True;
end;

procedure TPBRSProofStatusFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSProofStatusFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSProofStatusFrm.CallReport(const bPreview: Boolean);
var
  PBRPProofStatusfrm: TPBRPProofStatusfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryCurrentProofStatus.Close;
  PBRPProofStatusfrm := TPBRPProofStatusfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPProofStatusfrm.PrinterSettings := PrinterSettings;
      PBRPProofStatusfrm.qryReport.SQL.Clear;
      PBRPProofStatusfrm.qryReport.SQL.Text := qryCurrentProofStatus.Text;
      if bPreview then
        PBRPProofStatusfrm.qrpProofStatus.Preview
      else
        if SetupPrinter(PrinterSettings) then
          PBRPProofStatusfrm.qrpProofStatus.Print;
      PBRPProofStatusfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentProofStatus.Open;
  end;
end;

function TPBRSProofStatusFrm.BuildQueryString: string;
var
  sTemp : string;
begin
  sTemp := SQLCore;
  if (cmbbxProofStatus.Text <> '') then
    begin
      if  (cmbbxProofStatus.Text <> 'Show All') then
      begin
        sTemp := sTemp + ' AND Proof_Status.Description = ''' + cmbbxProofStatus.Text + ' '' ';
      end;
    end;

  if (edtCustomer.Text <> '') then
  begin
    sTemp := sTemp + ' AND Purchase_OrderLine.Customer = ' + IntToStr(SelCustCode);
    sTemp := sTemp + ' AND Purchase_OrderLine.Branch_No = ' + IntToStr(SelCustBranch);
  end;

  if (edtSupplier.Text <> '') then
  begin
    sTemp := sTemp + ' AND Purchase_Order.Supplier = ' + IntToStr(SelSuppCode);
    sTemp := sTemp + ' AND Purchase_Order.Branch_No = ' + IntToStr(SelSuppBranch);
  end;

  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0)
  or (cbSort3.ItemIndex >= 0) then
  begin
    sTemp := sTemp + ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) +
      Ordering(cbSort3);
    if sTemp[Length(sTemp)] = ',' then
      sTemp[Length(sTemp)] := ' ';
  end;
  Result := sTemp;
end;

procedure TPBRSProofStatusFrm.FixQuery;
begin
  qryCurrentProofStatus.DisableControls;
  try
    qryCurrentProofStatus.Close;
    qryCurrentProofStatus.SQL.Clear;
    qryCurrentProofStatus.SQL.text := BuildQueryString;
    qryCurrentProofStatus.Open;
    lblRecordCount.Caption:=IntToStr(qryCurrentProofStatus.RecordCount);
  finally
    qryCurrentProofStatus.EnableControls;
  end;
end;

function TPBRSProofStatusFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' PHist.Purchase_Order, PHist.Line,';
  1:   Result := ' Customer.Name,';
  2:   Result := ' PHist.Proof_Status,';
  3:   Result := ' PHist.Proof_Date,';
  4:   Result := ' Customers_Desc,';
  5:   Result := ' Goods_Required,';
  6:   Result := ' Supplier_Name,';
  else Result := '';
  end;
end;

procedure TPBRSProofStatusFrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort1.ItemIndex then
      cbSort3.ItemIndex := -1;
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
  end
  else
  if cbSort2.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort3.ItemIndex >= 0) and (cbSort2.ItemIndex < 0) then
  begin
    cbSort2.ItemIndex := cbSort3.ItemIndex;
    cbSort3.ItemIndex := -1;
  end;
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
  FixQuery;
end;

procedure TPBRSProofStatusFrm.rgSupplierClick(Sender: TObject);
begin
  if (rgSupplier.ItemIndex = 0) then
  begin
    pnlSuppSearch.Visible := False;
    qryCurrentProofStatusCustomer_Name.visible := True;
  end
  else
  begin
    pnlSuppSearch.Visible := True;
  end;
  FixQuery;
end;

procedure TPBRSProofStatusFrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := False;
    PBLUSuppFrm.SelCode := SelSuppCode;
    PBLUSuppFrm.SelBranch := SelSuppBranch;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSuppCode := PBLUSuppFrm.SelCode;
      SelSuppBranch := PBLUSuppFrm.SelBranch;
      SelSuppText := PBLUSuppFrm.SelName + ' / ' + PBLUSuppFrm.SelBranchName;
    end;
    edtSupplier.Text := SelSuppText;
    FixQuery;
  finally
    PBLUSuppFrm.Free;
    qryCurrentProofStatusCustomer_Name.visible := False;
  end;
end;

procedure TPBRSProofStatusFrm.qryCurrentProofStatusPOLineGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qryCurrentProofStatusPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryCurrentProofStatusPurchase_Order.Asfloat,qryCurrentProofStatusLine.AsInteger);
end;

end.
