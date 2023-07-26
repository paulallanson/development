unit PBRSStkHold;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Db, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSStkHoldFrm = class(TForm)
    qryReport: TFDQuery;
    dsReport: TDataSource;
    CustomerSQL: TFDQuery;
    rgCustomer: TRadioGroup;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    DummySQL: TFDQuery;
    chkbxExcludezero: TCheckBox;
    qryReportdescription: TStringField;
    qryReportquantity: TIntegerField;
    qryReportquantity_allocated: TIntegerField;
    qryReportdelivery_to_Stock: TStringField;
    qryReportForm_reference: TIntegerField;
    qryReportform_reference_id: TStringField;
    qryReportform_reference_descr: TStringField;
    qryReportPurchase_order: TFloatField;
    qryReportstock_location_desc: TStringField;
    qryReportForms_per_Box: TStringField;
    qryReportCust_Order_no: TStringField;
    qryReportcustomer: TIntegerField;
    qryReportbranch_no: TIntegerField;
    qryReportQty_in_stock: TIntegerField;
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    FActivated: boolean;
    SelCustCode, SelCustBranch: integer;
    SelCustText: string;
    procedure SomethingChanged;
    procedure FixQuery;
    procedure DispSelection;
    procedure CanPrint;
    function BuildQueryString : string;
    procedure CallReport(const bPreview : Boolean);
  public
    { Public declarations }
  end;

var
  PBRSStkHoldFrm: TPBRSStkHoldFrm;

implementation

uses PBLUCust, PBDatabase, PBRPStkHold, CCSPrint, Printers;

{$R *.DFM}

procedure TPBRSStkHoldFrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSStkHoldFrm.btnCustomerClick(Sender: TObject);
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

procedure TPBRSStkHoldFrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSStkHoldFrm.FixQuery;
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

procedure TPBRSStkHoldFrm.DispSelection;
begin
  {Display selection}
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
  {Display selection}
end;

procedure TPBRSStkHoldFrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled := 
    ((rgCustomer.ItemIndex = 0) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

function TPBRSStkHoldFrm.BuildQueryString: string;
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


  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Form_Reference.Customer = ' +
      IntToStr(SelCustCode) + ' AND Form_Reference.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;
  if chkbxExcludeZero.checked then
    result := result + ' AND ((delivery_location.quantity - delivery_location.quantity_allocated) > 0) ';

  Result := Result + ' Order By delivery_detail.stock_location_desc, Delivery_location.description';
end;

procedure TPBRSStkHoldFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgCustomer.ItemIndex := 0;
    rgCustomerClick(nil);
    FActivated := true;
  end;

end;

procedure TPBRSStkHoldFrm.CallReport(const bPreview: Boolean);
var
  PBRPStkHoldfrm: TPBRPStkHoldfrm;
  PrinterSettings: TPrinterSettings;
begin
  FixQuery;
  qryReport.Close;
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      begin
        PBRPStkHoldFrm := TPBRPStkHoldFrm.Create(Self);
        try
          PBRPStkHoldFrm.PrinterSettings := PrinterSettings;
          PBRPStkHoldFrm.qryReport.SQL.Clear;
          PBRPStkHoldFrm.qryReport.SQL.Text := qryReport.SQL.Text;
          PBRPStkHoldFrm.qrlblTitle.Caption := PBRPStkHoldFrm.qrlblTitle.Caption + DateToStr(Now);
          case rgCustomer.ItemIndex of
            0:   PBRPStkHoldFrm.ReptypeQRLabel.Caption  := 'All Customers';
            1:   PBRPStkHoldFrm.RepTypeQRLabel.Caption  := 'Customer: '+edtCustomer.text;
          end;

          if bPreview then
            PBRPStkHoldFrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPStkHoldFrm.QuickReport.Print;
        finally
          PBRPStkHoldFrm.Free;
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

procedure TPBRSStkHoldFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSStkHoldFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

end.
