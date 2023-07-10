unit PBRSPOnotonJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, Db, DBTables, CCSPrint;

type
  TPBRSPOnotonJBfrm = class(TForm)
    stsDetails: TStatusBar;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    qryReport: TQuery;
    dtsReport: TDataSource;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Panel2: TPanel;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    chkbxIncCallOffs: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure chkbxIncCallOffsClick(Sender: TObject);
  private
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    procedure FixQuery(rep: Boolean);
    procedure CallReport(const bPreview: Boolean);
    function BuildQueryString(rep: Boolean): string;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  PBRSPOnotonJBfrm: TPBRSPOnotonJBfrm;

const
  SQLCore =
  'SELECT Purchase_OrderLine.Purchase_Order, '+
  '      Purchase_OrderLine.Line, '+
  '      Purchase_OrderLine.Customer, '+
  '      Purchase_OrderLine.Branch_no, '+
  '      Customer_Branch.Name as Branch_Name, '+
  '      Customer.Name as Customer_Name, '+
  '      Purchase_OrderLine.Cust_Order_No, '+
  '      Purchase_OrderLine.Customers_Desc, '+
  '      Purchase_OrderLine.Quantity, '+
  '      Purchase_OrderLine.Order_Price, '+
  '      Purchase_OrderLine.Selling_Price, '+
  '      Purchase_OrderLine.Sell_Unit, '+
  '      Purchase_OrderLine.Order_Unit, '+
  '      Rep.Name as Rep_Name, '+
  '      Price_Unit.Description as Cost_Unit_Description, '+
  '      Price_Unit.Price_Unit_Factor as Cost_Factor, '+
  '      Price_Unit_sell.Description as Sell_Unit_Description, '+
  '      Price_Unit_sell.Price_Unit_Factor as Sell_Factor, '+
  '      Purchase_Order.Date_Point, '+
  '      Supplier_Branch.Name as Supplier_branch_Name, '+
  '      Supplier.Name as Supplier_name, '+
  '      Job_Bag_Line_Dets.Job_Bag '+
  'FROM (Supplier  '+
  '    INNER JOIN Supplier_Branch ON  '+
  '      Supplier.Supplier = Supplier_Branch.Supplier) '+
  '    INNER JOIN (Rep '+
  '   INNER JOIN(Purchase_Order '+
  '    INNER JOIN ((Customer '+
  '    INNER JOIN Customer_Branch ON '+
  '      Customer.Customer = Customer_Branch.Customer) '+
  '    INNER JOIN ((Price_Unit AS Price_Unit_sell '+
  '    INNER JOIN (Price_Unit '+
  '    INNER JOIN Purchase_OrderLine ON '+
  '      Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) ON '+
  '      Price_Unit_sell.Price_Unit = Purchase_OrderLine.Sell_Unit) '+
  '    LEFT JOIN Job_Bag_Line_Dets ON '+
  '      (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND '+
  '      (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchase_Order)) ON '+
  '      (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND '+
  '      (Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON '+
  '      Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_Order) ON '+
  '      Rep.Rep = Purchase_OrderLine.Rep) ON '+
  '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND '+
  '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) ';

implementation

uses PBRPPOnotonJB, PBDatabase, PBLUCust;

{$R *.DFM}

procedure TPBRSPOnotonJBfrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  FixQuery(False);
end;

procedure TPBRSPOnotonJBfrm.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(rep);
    qryReport.Open;
    stsDetails.panels[0].text :=IntToStr(qryReport.RecordCount)+ ' records displayed';
  finally
    qryReport.EnableControls;
  end;
end;

procedure TPBRSPOnotonJBfrm.rgCustomerClick(Sender: TObject);
begin
  {hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSPOnotonJBfrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSPOnotonJBfrm.CallReport(const bPreview: Boolean);
var
  PBRPPOnotonJBfrm: TPBRPPOnotonJBfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryReport.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPPOnotonJBfrm := TPBRPPOnotonJBfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPOnotonJBfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPOnotonJBfrm.qryReport.SQL.Clear;
      PBRPPOnotonJBfrm.qryReport.SQL.Text := qryReport.Text;
      PBRPPOnotonJBfrm.qrlblTitle.caption := PBRPPOnotonJBfrm.qrlblTitle.caption + DateToStr(Date);
      if self.chkbxIncCallOffs.Checked then
      begin
        PBRPPOnotonJBfrm.qrlblIncCallOffs.Caption := '(Call Off Orders Included)';
      end
      else
      begin
        PBRPPOnotonJBfrm.qrlblIncCallOffs.Caption := '(Call Off Orders Excluded)';
      end;

      if bPreview then
        PBRPPOnotonJBfrm.qckrptPOnotonJB.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          PBRPPOnotonJBfrm.qckrptPOnotonJB.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qryReport.Open;
  end;
end;

procedure TPBRSPOnotonJBfrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

function TPBRSPOnotonJBfrm.BuildQueryString(rep: Boolean): string;
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
  sTemp := sTemp + ' WHERE Job_Bag is null ';

  if not self.chkbxIncCallOffs.Checked then
  begin
    if dmBroker.isSQL then
    begin
      sTemp := sTemp + ' AND (convert(int, purchase_orderline.purchase_order) = purchase_orderline.purchase_order) ';
    end
    else
    begin
      sTemp := sTemp + ' AND (int(purchase_orderline.purchase_order) = purchase_orderline.purchase_order) ';
    end;
  end;

  if (edtCustomer.Text <> '') then
  begin
    sTemp := sTemp + ' AND Purchase_orderLine.Customer = ' + IntToStr(SelCustCode);
    sTemp := sTemp + ' AND Purchase_orderLine.Branch_no = ' + IntToStr(SelCustBranch);
  end;
  sTemp := sTemp + ' AND ((Purchase_OrderLine.Inactive <> ''Y'') or (Purchase_OrderLine.Inactive is null))';
  sTemp := sTemp + ' ORDER BY Customer.Name, Purchase_OrderLine.Purchase_Order';
  Result := sTemp;
end;

procedure TPBRSPOnotonJBfrm.btnCustomerClick(Sender: TObject);
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
    FixQuery(False);
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBRSPOnotonJBfrm.chkbxIncCallOffsClick(Sender: TObject);
begin
  FixQuery(False);
end;

end.
