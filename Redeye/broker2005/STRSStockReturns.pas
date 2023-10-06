unit STRSStockReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TSTRSStockReturnsFrm = class(TForm)
    btnExcel: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    rdgrpLoc: TRadioGroup;
    pnlLocSearch: TPanel;
    Label3: TLabel;
    edtLoc: TEdit;
    btnLocLU: TButton;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    chkbxPageBreak: TCheckBox;
    procedure btnLocLUClick(Sender: TObject);
    procedure rdgrpLocClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    SelCode: integer;
    SelText: string;
    procedure canPrint;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  STRSStockReturnsFrm: TSTRSStockReturnsFrm;

implementation

uses UITypes, CCSCommon, PBLUProductionLoc, STRPStockReturns;

{$R *.dfm}

procedure TSTRSStockReturnsFrm.btnLocLUClick(Sender: TObject);
begin
  PBLUProductionLocFrm := TPBLUProductionLocFrm.Create(Self);
  try
    PBLUProductionLocFrm.bIs_Lookup := True;
    PBLUProductionLocFrm.bAllow_Upd := False;
    PBLUProductionLocFrm.SelCode := SelCode;
    PBLUProductionLocFrm.ShowModal;
    if PBLUProductionLocFrm.Selected then
    begin
      SelCode := PBLUProductionLocFrm.SelCode;
      SelText := PBLUProductionLocFrm.SelName;
    end;
    edtLoc.Text := SelText;
  finally
    PBLUProductionLocFrm.Free;
  end;
  self.canPrint;
end;

procedure TSTRSStockReturnsFrm.rdgrpLocClick(Sender: TObject);
begin
  pnlLocSearch.visible := rdgrpLoc.itemIndex = 1;
  if pnlLocSearch.visible = False then
  begin
    SelCode := 0;
    edtLoc.text := '';
  end;
  self.canPrint;
end;

procedure TSTRSStockReturnsFrm.canPrint;
begin
  if ((rdgrpLoc.ItemIndex = 1) and (SelCode = 0)) then
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

procedure TSTRSStockReturnsFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TSTRSStockReturnsFrm.CallReport(const bPreview: Boolean);
begin
  {add total order by clause to report query}

  STRPStockReturnsFrm := TSTRPStockReturnsFrm.Create(Self);
  try
    if SelCode <> 0 then
      STRPStockReturnsFrm.qrlblSelection.caption := STRPStockReturnsFrm.qrlblSelection.caption + edtLoc.text
    else
      STRPStockReturnsFrm.qrlblSelection.caption := STRPStockReturnsFrm.qrlblSelection.caption + 'All Locations';

    STRPStockReturnsFrm.qrGroup.ForceNewPage := chkbxPageBreak.checked;

    case rdgrpLoc.ItemIndex of
    0: STRPStockReturnsFrm.SelCode := 0;
    1: STRPStockReturnsFrm.SelCode := SelCode;
    end;

    if STRPStockReturnsFrm.GetDetails = 0 then
      MessageDlg('Nothing to print', mtError, [mbOK], 0)
    else
      begin
        if bPreview then
          STRPStockReturnsFrm.qrpDetails.Preview
        else
          begin
            STRPStockReturnsFrm.qrpDetails.PrinterSetup;
            if STRPStockReturnsFrm.qrpDetails.Tag = 0 then
              STRPStockReturnsFrm.qrpDetails.Print;
          end;
      end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TSTRSStockReturnsFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSStockReturnsFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempfilename: string;
begin
  {add total order by clause to report query}

  STRPStockReturnsFrm := TSTRPStockReturnsFrm.Create(Self);
  try
    case rdgrpLoc.ItemIndex of
    0: STRPStockReturnsFrm.SelCode := 0;
    1: STRPStockReturnsFrm.SelCode := SelCode;
    end;

    reccount := STRPStockReturnsFrm.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('Nothing to export', mtError, [mbOK], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tempFileName := getWinTempDir + self.Caption + formatdatetime('dd mm yy hhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    STRPStockReturnsFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
     Application.ProcessMessages;
  end;

end;

end.
