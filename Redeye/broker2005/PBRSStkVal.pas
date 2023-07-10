unit PBRSStkVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, CCSCommon;

type
  TPBRSStkValFrm = class(TForm)
    qryReport: TQuery;
    dsReport: TDataSource;
    qryReportOrder_price: TCurrencyField;
    qryReportQty_In_Stock: TFloatField;
    qryReportOrder_Unit: TIntegerField;
    qryReportForm_Reference_Descr: TStringField;
    qryReportReorder_Level: TIntegerField;
    qryReportCustomer_Name: TStringField;
    qryReportForm_Reference_ID: TStringField;
    CustomerSQL: TQuery;
    rgCustomer: TRadioGroup;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    oldDummySQL: TQuery;
    RepRadioGroup: TRadioGroup;
    RepPanel: TPanel;
    Label1: TLabel;
    RepEdit: TEdit;
    RepButton: TButton;
    DummySQL: TQuery;
    OrdValChkBox: TCheckBox;
    chkbxCustomerVal: TCheckBox;
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure RepButtonClick(Sender: TObject);
    procedure RepRadioGroupClick(Sender: TObject);
  private
    { Private declarations }
    FActivated: boolean;
    SelCustCode, SelCustBranch, SelRepCode: integer;
    SelCustText, SelRepName: string;
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
  PBRSStkValFrm: TPBRSStkValFrm;

implementation

uses PBLUCust, PBDatabase, PBRPStkVal, CCSPrint, Printers, PBLURep;

{$R *.DFM}

procedure TPBRSStkValFrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSStkValFrm.btnCustomerClick(Sender: TObject);
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

procedure TPBRSStkValFrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSStkValFrm.FixQuery;
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

procedure TPBRSStkValFrm.DispSelection;
begin
  {Display selection}
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
  {Display selection}
end;

procedure TPBRSStkValFrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled := ((rgCustomer.ItemIndex = 0) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

function TPBRSStkValFrm.BuildQueryString: string;
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
//  Result := DummySQL.SQL.text;
  Result := DummySQL.SQL.text;


  if (RepRadioGroup.ItemIndex = 1) and (SelRepCode <> 0) then
  begin
    Result := Result + ' AND Rep.Rep = '+
      IntToStr(SelRepCode);
  end;

  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Customer_Branch.Customer = ' +
      IntToStr(SelCustCode) + ' AND Customer_Branch.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;

  Result := Result + ' Order By Rep.Name, Customer.Name, Form_Reference.Stock_Reference';
end;

procedure TPBRSStkValFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgCustomer.ItemIndex := 0;
    rgCustomerClick(nil);
    FActivated := true;
  end;

end;

procedure TPBRSStkValFrm.CallReport(const bPreview: Boolean);
var
  PBRPStkValfrm: TPBRPStkValfrm;
  PrinterSettings: TPrinterSettings;
begin
  FixQuery;
  qryReport.Close;
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      begin
        PBRPStkValFrm := TPBRPStkValFrm.Create(Self);
        try
          PBRPStkValFrm.PrinterSettings := PrinterSettings;
          PBRPStkValFrm.qryReport.SQL.Clear;
          PBRPStkValFrm.qryReport.SQL.Text := qryReport.SQL.Text;
          PBRPStkValFrm.qrlblTitle.Caption := PBRPStkValFrm.qrlblTitle.Caption + DateToStr(Now);
          case RepRadioGroup.ItemIndex of
            0:   PBRPStkValFrm.ReptypeQRLabel.Caption  := 'All Reps, ';
            1:   PBRPStkValFrm.RepTypeQRLabel.Caption  := 'Rep : '+RepEdit.text+', ';
          end;
          case rgCustomer.ItemIndex of
            0:   PBRPStkValFrm.ReptypeQRLabel.Caption  := PBRPStkValFrm.ReptypeQRLabel.Caption+'All Customers';
            1:   PBRPStkValFrm.RepTypeQRLabel.Caption  := PBRPStkValFrm.ReptypeQRLabel.Caption+'Customer: '+edtCustomer.text;
          end;
          if OrdValChkBox.checked then
            PBRPStkValFrm.bIncOrdVal := False
          else
            PBRPStkValFrm.bIncOrdVal := True;

          PBRPStkValFrm.bCustomerVal := chkbxCustomerVal.checked;
            
          if bPreview then
            PBRPStkValFrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPStkValFrm.QuickReport.Print;
        finally
          PBRPStkValFrm.Free;
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

procedure TPBRSStkValFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSStkValFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSStkValFrm.RepButtonClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelRepCode := PBLURepFrm.SelCode;
      SelRepName := PBLURepFrm.Selname;
      RepEdit.Text := SelRepName;
      SomethingChanged;
    end;
  finally
    PBLURepFrm.Free;
  end;
end;

procedure TPBRSStkValFrm.RepRadioGroupClick(Sender: TObject);
begin
  RepPanel.Visible := RepRadioGroup.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

end.
