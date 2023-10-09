unit PBRSFSCClaim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, OleCtnrs;

type
  TPBRSFSCClaimFrm = class(TForm)
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    btbtnExcel: TBitBtn;
    Panel2: TPanel;
    rgFSC: TRadioGroup;
    FSCPanel: TPanel;
    lblRep: TLabel;
    edtFSC: TEdit;
    btnFSC: TButton;
    rgProductType: TRadioGroup;
    pnlPTSearch: TPanel;
    lblCustBran: TLabel;
    edtProductType: TEdit;
    btnProductType: TButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    Label2: TLabel;
    RdGrpRepType: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpClaimType: TRadioGroup;
    procedure btnFSCClick(Sender: TObject);
    procedure rgFSCClick(Sender: TObject);
    procedure rgProductTypeClick(Sender: TObject);
    procedure btnProductTypeClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    SelCode, SelProductType: integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBRSFSCClaimFrm: TPBRSFSCClaimFrm;

implementation

uses UITypes,  CCSCommon, DateSelV5, PBLUFSCClaim, PBRPFSCClaim, CCSPrint,
  PBLUPrdTyp;

{$R *.dfm}

procedure TPBRSFSCClaimFrm.btnFSCClick(Sender: TObject);
begin
  PBLUFSCClaimFrm := TPBLUFSCClaimFrm.create(self);

  try
    PBLUFSCClaimFrm.bIs_Lookup := true;
    PBLUFSCClaimFrm.bAllow_Upd := true;
    PBLUFSCClaimFrm.showmodal;
    if PBLUFSCClaimFrm.Selected then
      begin
        edtFSC.Text := PBLUFSCClaimFrm.SelName;
        SelCode := PBLUFSCClaimFrm.SelCode;
      end;
  finally
    PBLUFSCClaimFrm.free;
  end;
end;

procedure TPBRSFSCClaimFrm.rgFSCClick(Sender: TObject);
begin
  if (rgFSC.ItemIndex = 0) then
  begin
    FSCPanel.Visible := False;
    EdtFSC.Text := '';
  end
  else
  begin
    FSCPanel.Visible := True;
  end;
end;

procedure TPBRSFSCClaimFrm.rgProductTypeClick(Sender: TObject);
begin
  if (rgProductType.ItemIndex = 0) then
  begin
    pnlPTSearch.Visible := False;
    EdtProductType.Text := '';
  end
  else
  begin
    pnlPTSearch.Visible := True;
  end;
end;

procedure TPBRSFSCClaimFrm.btnProductTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := False;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.selected then
      begin
        edtProductType.Text := PBLUPrdTypFrm.SelName;
        SelProductType := PBLUPrdTypFrm.SelCode;
      end;
  finally
    PBLUPrdTypFrm.Free;
  end;
end;

procedure TPBRSFSCClaimFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSFSCClaimFrm.DateToButtonClick(Sender: TObject);
begin
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSFSCClaimFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSFSCClaimFrm.DateFromEditExit(Sender: TObject);
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
end;

procedure TPBRSFSCClaimFrm.DateToEditExit(Sender: TObject);
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
end;

procedure TPBRSFSCClaimFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSFSCClaimFrm.CallReport(const bPreview: Boolean);
var
  PBRPFSCClaimFrm: TPBRPFSCClaimFrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPFSCClaimFrm := TPBRPFSCClaimFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPFSCClaimFrm.qrlblSelection.caption := '';

    if rdgrpClaimType.ItemIndex = 0 then
      begin
        PBRPFSCClaimFrm.sClaimType := 'FSC';
        PBRPFSCClaimFrm.qrlblTitle.caption := 'FSC Material Claim Report';
      end
    else
    if rdgrpClaimType.ItemIndex = 1 then
      begin
        PBRPFSCClaimFrm.sClaimType := 'PEFC';
        PBRPFSCClaimFrm.qrlblTitle.caption := 'PEFC Material Claim Report';
      end
    else
      begin
        PBRPFSCClaimFrm.sClaimType := 'BOTH';
        PBRPFSCClaimFrm.qrlblTitle.caption := 'FSC/PEFC Material Claim Report';
      end;

    if rgFSC.ItemIndex = 0 then
      begin
        PBRPFSCClaimFrm.iCode := 0;
        PBRPFSCClaimFrm.qrlblSelection.caption := '';
      end
    else
      begin
        PBRPFSCClaimFrm.iCode := SelCode;
        PBRPFSCClaimFrm.qrlblSelection.caption := 'FSC/PEFC CLaim: ' + edtFSC.text;
      end;


    if rgProductType.ItemIndex = 0 then
      begin
        PBRPFSCClaimFrm.iProductType := 0;
      end
    else
      begin
        PBRPFSCClaimFrm.iProductType := SelProductType;
        PBRPFSCClaimFrm.qrlblSelection.caption := PBRPFSCClaimFrm.qrlblSelection.caption + ' Product Type: ' + edtProductType.text;
      end;

    PBRPFSCClaimFrm.qrHeadFSC.ForceNewPage := chkbxPageBreak.checked;

    PBRPFSCClaimFrm.Datefrom := DateFrom;
    PBRPFSCClaimFrm.DateTo := DateTo;
    PBRPFSCClaimFrm.bSummary := (rdgrpRepType.itemindex = 0);
    if PBRPFSCClaimFrm.GetDetails = 0 then
      begin
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;
    PBRPFSCClaimFrm.qrlblDateSelection.caption := 'Deliveries between ' + DateFromEdit.Text + ' and ' + DateToEdit.text;
    if bPreview then
      PBRPFSCClaimFrm.qrpDetails.Preview
    else
    if SetupPrinter(PrinterSettings) then
      PBRPFSCClaimFrm.qrpDetails.Print;
  finally
    PrinterSettings.free;
    PBRPFSCClaimFrm.Free;

    Application.ProcessMessages;
  end;
end;
procedure TPBRSFSCClaimFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSFSCClaimFrm.FormCreate(Sender: TObject);
begin
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSFSCClaimFrm.btbtnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
begin
  PBRPFSCClaimFrm := TPBRPFSCClaimFrm.Create(Self);
  try
    if rgFSC.ItemIndex = 0 then
      PBRPFSCClaimFrm.iCode := 0
    else
      PBRPFSCClaimFrm.iCode := SelCode;

    if rgProductType.ItemIndex = 0 then
      PBRPFSCClaimFrm.iProductType := 0
    else
      PBRPFSCClaimFrm.iProductType := SelProductType;

    PBRPFSCClaimFrm.Datefrom := DateFrom;
    PBRPFSCClaimFrm.DateTo := DateTo;
    PBRPFSCClaimFrm.bSummary := (rdgrpRepType.itemindex = 0);
    reccount := PBRPFSCClaimFrm.GetDetails;
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPFSCClaimFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
  finally
    PBRPFSCClaimFrm.Free;

    Application.ProcessMessages;
  end;
end;

end.
