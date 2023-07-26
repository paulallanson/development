unit PBRS4CastInvs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, DateSelV5,  CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRS4CastInvsFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    CancelBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDateFrom: TEdit;
    btbtnDateFrom: TBitBtn;
    Label2: TLabel;
    edtDateTo: TEdit;
    btbtnDateTo: TBitBtn;
    rdgrpRep: TRadioGroup;
    pnlCustSearch: TPanel;
    Label3: TLabel;
    edtCust: TEdit;
    btnCustLU: TButton;
    rdgrpCust: TRadioGroup;
    chkbxShowzero: TCheckBox;
    chkbxShow2bInvoiced: TCheckBox;
    chkbxExcludeCosts: TCheckBox;
    TotByRadioGroup: TRadioGroup;
    chkbxRepPageBreak: TCheckBox;
    SQLRep: TFDQuery;
    procedure btnRepClick(Sender: TObject);
    procedure rdgrpRepClick(Sender: TObject);
    procedure btnCustLUClick(Sender: TObject);
    procedure rdgrpCustClick(Sender: TObject);
    procedure btbtnDateFromClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btbtnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
  private
    repCode: integer;
    repText: string;
    custCode: integer;
    branchCode: integer;
    custText: string;
    dateFrom: TDateTime;
    dateTo: TDateTime;
    procedure canPrint;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure RunReport(preview: boolean);
  public
    { Public declarations }
  end;

var
  PBRS4CastInvsFrm: TPBRS4CastInvsFrm;

implementation

uses PBLURep, PBDatabase, PBLUCust, PBPOObjects, PBRP4CastInvs, pbMainMenu;

{$R *.DFM}

procedure TPBRS4CastInvsFrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := repCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      repCode := PBLURepFrm.SelCode;
      repText := PBLURepFrm.SelName;
    end;
    edtRep.Text := repText;
  finally
    PBLURepFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRS4CastInvsFrm.rdgrpRepClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpRep.itemIndex = 1;
  if PnlRepSearch.visible = False then
  begin
    repCode := 0;
    edtRep.text := '';
  end;
  self.canPrint;
end;

procedure TPBRS4CastInvsFrm.btnCustLUClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := custCode;
    PBLUCustFrm.SelBranch := branchCode;
    PBLUCustFrm.bSel_Branch := True;    
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      custCode := PBLUCustFrm.SelCode;
      branchCode := PBLUCustFrm.SelBranch;
      custText := PBLUCustFrm.SelName +' / '+ PBLUCustFrm.SelBranchName;
    end;
    edtCust.Text := custText;
  finally
    PBLUCustFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRS4CastInvsFrm.rdgrpCustClick(Sender: TObject);
begin
  pnlCustSearch.visible := rdgrpCust.itemIndex = 1;
  if pnlCustSearch.visible = False then
  begin
    custCode := 0;
    branchCode := 0;
    edtCust.text := '';
  end;
  self.canPrint;
end;

procedure TPBRS4CastInvsFrm.canPrint;
begin
  if ((rdgrpRep.itemIndex = 1) and (repCode = 0)) or
     ((rdgrpCust.ItemIndex = 1) and (custCode = 0)) then
  begin
    PreviewBitBtn.Enabled := false;
    PrintBitBtn.Enabled := false;
  end
  else
  begin
    PreviewBitBtn.Enabled := true;
    PrintBitBtn.Enabled := true;
  end;
end;

procedure TPBRS4CastInvsFrm.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  canprint;
end;

function TPBRS4CastInvsFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRS4CastInvsFrm.FormCreate(Sender: TObject);
begin
  self.custCode := 0;
  self.branchCode := 0;
  self.custText := '';
  self.repCode := 0;
  self.dateFrom := 0;
  self.dateTo := 0;

  If dmBroker.iAccCtrlMenu = 4 then
    begin
      rdgrpRep.ItemIndex := 2;
      rdgrpRep.Enabled := false;
      pnlRepSearch.Enabled := false;
      RepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      with sqlRep do
      begin
        close;
        paramByName('Rep').asInteger := repcode;
        open;
        if not eof then
          begin
            self.caption := 'Customer Turnover Report (Rep Access) - ' + sqlRep.fieldByName('Name').asString;
            edtRep.Text := sqlRep.fieldByName('Name').asString;
          end;
      end;

     end
  else
    begin
      RepCode := 0 ;
    end;
end;

procedure TPBRS4CastInvsFrm.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TPBRS4CastInvsFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRP4CastInvsFrm := TPBRP4CastInvsFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRP4CastInvsFrm.Totalby := TotByRadioGroup.itemindex;
    PBRP4CastInvsFrm.qrbndgrphdr.ForceNewPage := chkbxRepPageBreak.checked;
    PBRP4CastInvsFrm.PrinterSettings := PrinterSettings;
    if PBRP4CastInvsFrm.PrepareReport(dateFrom, dateTo, self.custCode,
      self.branchCode, self.repCode, chkbxShowZero.checked,
      chkbxShow2bInvoiced.checked, chkbxExcludeCosts.Checked) then
    begin
//      self.visible := false;
      if preview then
      begin
        PBRP4CastInvsFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRP4CastInvsFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRP4CastInvsFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRS4CastInvsFrm.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TPBRS4CastInvsFrm.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TPBRS4CastInvsFrm.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;
    
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(dateTo);
  canprint;
end;

procedure TPBRS4CastInvsFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateFrom.Text <> '' then
  begin
    try
      NewDate := StrToDate(edtDatefrom.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateFrom.SetFocus;
        Exit;
      end;
    end;
    edtDateFrom.Text := PBDatestr(NewDate);
    DateFrom := NewDate;
  end;
end;

procedure TPBRS4CastInvsFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateTo.Text <> '' then
  begin
  try
    NewDate := StrToDate(edtDateTo.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateTo.SetFocus;
        Exit;
      end;
    end;
    edtDateTo.Text := PBDatestr(NewDate);
    DateTo := NewDate;
  end;
end;

end.
