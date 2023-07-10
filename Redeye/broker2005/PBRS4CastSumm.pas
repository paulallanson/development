unit PBRS4CastSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DateSelV5, PBPOObjects, CCSPrint;

type
  TPBRS4CastSummfrm = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromBitBtn: TBitBtn;
    qrySalesComm: TQuery;
    CancelBitBtn: TBitBtn;
    procedure btnRepClick(Sender: TObject);
    procedure DateFromEditChange(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateFromBitBtnClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CanPrint;
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
    SelRepCode: integer;
    SelRepText : string;
    DateFrom: TDateTime;
    procedure FixQuery(rep: Boolean);
    procedure CallReport(const bPreview : Boolean);
    function BuildQueryString(rep: Boolean): string;
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  PBRS4CastSummfrm: TPBRS4CastSummfrm;

implementation

uses PBLURep, PBDatabase, PBRP4CastSumm;

{$R *.DFM}

const
  SQLCore =
  'SELECT Delivery_Detail.Purchase_Order, Delivery_Detail.Line, Delivery_Detail.Delivery_no, '+
	'Delivery_Detail.Qty_to_Deliver, Delivery_Detail.Delivery_to_Stock, Delivery_Detail.Date_Point, '+
	'Purchase_OrderLine.Order_Price, Purchase_OrderLine.Selling_Price, Sell_Unit.Price_Unit_Factor, '+
	'Order_Unit.Price_Unit_Factor, Rep.Rep, Rep.Name,'+
	'Delivery_Detail.Qty_Delivered,	Delivery_Detail.Date_Deliv_Actual, Purchase_OrderLine.Inactive '+
  'FROM Rep '+
	'INNER JOIN (((Price_Unit AS Order_Unit '+
	'INNER JOIN (Price_Unit AS Sell_Unit '+
	'INNER JOIN Purchase_OrderLine ON '+
		'Sell_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON '+
		'Order_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) '+
	'INNER JOIN (Customer '+
	'INNER JOIN Delivery_Detail ON '+
		'Customer.Customer = Delivery_Detail.Customer) ON '+
		'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '+
		'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)) '+
	'INNER JOIN Customer_Branch ON '+
		'(Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND '+
		'(Customer_Branch.Customer = Purchase_OrderLine.Customer) AND '+
		'(Customer.Customer = Customer_Branch.Customer)) ON '+
		'Rep.Rep = Purchase_OrderLine.Rep '+
    'WHERE (Delivery_Detail.Date_Deliv_Actual Is Null) AND ((Purchase_OrderLine.Inactive<>''Y'') Or '+
    '(Purchase_OrderLine.Inactive Is Null))' ;

procedure TPBRS4CastSummfrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
    FixQuery(False);
  finally
    PBLURepFrm.Free;
  end;
  canprint;
end;

procedure TPBRS4CastSummfrm.DateFromEditChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRS4CastSummfrm.DateFromEditExit(Sender: TObject);
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
  FixQuery(False);
end;

procedure TPBRS4CastSummfrm.DateFromBitBtnClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
  canprint;
end;

procedure TPBRS4CastSummfrm.FixQuery(rep: Boolean);
begin
  qrySalesComm.DisableControls;
  try
    qrySalesComm.Close;
    qrySalesComm.SQL.Clear;
    qrySalesComm.SQL.text := BuildQueryString(rep);
    qrySalesComm.Open;
  finally
    qrySalesComm.EnableControls;
  end;
end;

function TPBRS4CastSummfrm.BuildQueryString(rep: Boolean): string;
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
  if (edtRep.Text <> '') then
  begin
    sTemp := sTemp + ' AND Purchase_OrderLine.Rep = ' + IntToStr(SelRepCode) + ' ';
  end;
  if (Rep) then
    begin
    sTemp := sTemp + 'ORDER BY Rep.Name, Delivery_Detail.Date_Point';
  end;
  Result := sTemp;
end;

function TPBRS4CastSummfrm.InputDate(TempDate: TDateTime): TDateTime;
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

end;

procedure TPBRS4CastSummfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRS4CastSummfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRS4CastSummfrm.CallReport(const bPreview: Boolean);
var
  PBRP4CastSummFrm: TPBRP4CastSummFrm;
  PrinterSettings: TPrinterSettings;
begin
  qrySalesComm.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRP4CastSummFrm := TPBRP4CastSummFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRP4CastSummFrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRP4CastSummFrm.qrySalesComm.SQL.Clear;
          PBRP4CastSummFrm.TotalByRep := True;
          PBRP4CastSummFrm.qrySalesComm.SQL.Text := qrySalesComm.Text;
          PBRP4CastSummFrm.qrlblTitle.caption := PBRP4CastSummFrm.qrlblTitle.caption + DateToStr(Date);
          PBRP4CastSummFrm.qrlblDateRange.caption :=
          PBRP4CastSummFrm.qrlblDateRange.caption + DateFromEdit.Text;
          PBRP4CastSummFrm.fcstDate := StrToDate(DateFromEdit.Text);
          PBRP4CastSummFrm.byMonth := RadioGroup2.ItemIndex = 1;
          if bPreview then
            PBRP4CastSummFrm.qckrp4CastSumm.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRP4CastSummFrm.qckrp4CastSumm.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesComm.Open;
  end;

end;

procedure TPBRS4CastSummfrm.FormCreate(Sender: TObject);
begin
 DateFrom := Date;
 DateFromEdit.Text := PBDatestr(DateFrom);
 FixQuery(False);
end;

procedure TPBRS4CastSummfrm.RadioGroup1Click(Sender: TObject);
begin
PnlRepsearch.visible := RadioGroup1.itemIndex = 1;
if PnlRepSearch.visible = False then
  begin
    selrepcode := 0;
    edtRep.text := '';
  end;
fixQuery(False);
canprint;
end;

procedure TPBRS4CastSummfrm.CanPrint;
begin
 {Check if can print}
  PrintBitBtn.Enabled :=
    ((radiogroup1.ItemIndex = 0) or
    ((radiogroup1.ItemIndex = 1) and (edtRep.Text <> '')) and
    (dateFromEdit.text <> '')
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRS4CastSummfrm.RadioGroup2Click(Sender: TObject);
begin
canprint;
end;

end.
