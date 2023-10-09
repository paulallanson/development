unit STStkValSl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, OleCtnrs, ComCtrls, CCSCommon, printers, CCSPrint;

type
  TSTStkValSlfrm = class(TForm)
    PrintBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SeqByRadioGroup: TRadioGroup;
    CostRadioGroup: TRadioGroup;
    grpbxRange: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    ChkBxExcProd: TCheckBox;
    btbtnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure CallPrintPreview (TempPreview: ByteBool);
    procedure CallVarPrintPreview (TempPreview: ByteBool);
    procedure BitBtn2Click(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure edtPartFromChange(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    bchanging: bytebool;
    procedure ExportVariance;
  public
    { Public declarations }
    bIs_StockTake: Bytebool;
    bIs_Varianceprint : Bytebool;
    StockTakeRef: string;
  end;

var
  STStkValSlfrm: TSTStkValSlfrm;

implementation

uses UITypes, STStkValRep, STStkVarRep, STPrtMnt;

{$R *.DFM}

{ TClStkValSlform }

procedure TSTStkValSlfrm.CallPrintPreview(TempPreview: ByteBool);
begin
  If bIs_Varianceprint then
    begin
      CallVarPrintPreview(TempPreview);
      exit;
    end;
  STStkValRepFrm := TSTStkValRepFrm.Create(Self);
  If SeqBYRadioGroup.ItemIndex = 0 then
    STStkValRepFrm.ByStore := True
  else
    STStkValRepFrm.ByStore := False;

  If CostRadioGroup.ItemIndex = 0 then
    STStkValRepFrm.AtActual := True
  else
    STStkValRepFrm.AtActual := False;
  { Store wether report run at current cost or actual cost}

  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;
  STStkValRepFrm.bExcProd := ChkBxExcProd.Checked;

  with STStkValRepFrm do
  try
    PartFrom := edtPartFrom.Text;
    PartTo := edtPartTo.Text;
    bIs_Stocktake := True;
    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        StkValQuickReport.Preview
      else
      begin
        StkValQuickReport.PrinterSetup;
        if StkValQuickReport.Tag = 0 then
          StkValQuickReport.Print;
      end;
    end;
  finally;
    STStkValRepFrm.Free;
  end;
end;

procedure TSTStkValSlfrm.BitBtn2Click(Sender: TObject);
begin
  CallPrintPreview(True);
end;

procedure TSTStkValSlfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(False);
end;

procedure TSTStkValSlfrm.FormShow(Sender: TObject);
begin
If bIs_Varianceprint then
    Caption := 'Stock Variance Report';
if not bIs_Varianceprint then
  CostRadioGroup.Visible := True
else
  begin
    CostRadioGroup.Visible := False;
    CostRadioGroup.ItemIndex := 0;
  end;
  chkBxExcProd.Visible := not bIs_Stocktake
end;

procedure TSTStkValSlfrm.CallVarPrintPreview(TempPreview: ByteBool);
begin
  STStkVarRepFrm := TSTStkVarRepFrm.Create(Self);
  If SeqBYRadioGroup.ItemIndex = 0 then
    STStkVarRepFrm.ByStore := True
  else
    STStkVarRepFrm.ByStore := False;

  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;
  with STStkVarRepFrm do
  try
    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        StkVarQuickReport.Preview
      else
      begin
        StkVarQuickReport.PrinterSetup;
        if StkVarQuickReport.Tag = 0 then
          StkVarQuickReport.Print;
      end;
    end;
  finally;
    STStkVarRepFrm.Free;
  end;
end;

procedure TSTStkValSlfrm.FormCreate(Sender: TObject);
begin
  If bIs_Varianceprint then
    STStkValSlFrm.Caption := 'Stock Variance Report';
end;

procedure TSTStkValSlfrm.btbtnPartFromClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartFrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTStkValSlfrm.btbtnPartToClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;

end;

procedure TSTStkValSlfrm.edtPartFromChange(Sender: TObject);
begin
  if bChanging then exit;
  edtPartTo.Text := edtPartFrom.Text ;
end;

procedure TSTStkValSlfrm.btbtnExcelClick(Sender: TObject);
var
  STStkValRepFrm: TSTStkValRepFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  If bIs_Varianceprint then
    begin
      ExportVariance;
      exit;
    end;

  STStkValRepFrm := TSTStkValRepFrm.Create(Self);
  try
    if SeqBYRadioGroup.ItemIndex = 0 then
      STStkValRepFrm.ByStore := True
    else
      STStkValRepFrm.ByStore := False;

    if CostRadioGroup.ItemIndex = 0 then
      STStkValRepFrm.AtActual := True
    else
      STStkValRepFrm.AtActual := False;
  { Store wether report run at current cost or actual cost}

    bChanging := true;
    stStkValRepfrm.paidfor := '';

    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bchanging := false;
    STStkValRepFrm.bExcProd := ChkBxExcProd.Checked;

    STStkValRepFrm.PartFrom := edtPartFrom.Text;
    STStkValRepFrm.PartTo := edtPartTo.Text;

    STStkValRepFrm.bIs_Stocktake := True;

    recCount := STStkValRepFrm.GetDetails(Self);
    if recCount <> 0 then
    begin
      self.prgbrExport.Max := recCount;
      tempFileName := getWinTempDir + 'temp.csv';
      self.pnlExportPrgrss.BringToFront;
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      STStkValRepFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;
      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    end
    else
    begin
      MessageDlg('There are no records to print', mtError, [mbOK], 0);
    end;

  finally
    STStkValRepFrm.Free;
  end;
end;

procedure TSTStkValSlfrm.ExportVariance;
var
  STStkVarRepFrm: TSTStkVarRepFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;

begin
  STStkVarRepFrm := TSTStkVarRepFrm.Create(Self);
  try
    If SeqBYRadioGroup.ItemIndex = 0 then
      STStkVarRepFrm.ByStore := True
    else
      STStkVarRepFrm.ByStore := False;

    if CostRadioGroup.ItemIndex = 0 then
      STStkVarRepFrm.AtActual := True
    else
      STStkVarRepFrm.AtActual := False;

    bChanging := true;

    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bchanging := false;

    recCount := STStkVarRepFrm.GetDetails(Self);
    if recCount <> 0 then
    begin
      self.prgbrExport.Max := recCount;
      tempFileName := getWinTempDir + 'temp.csv';
      self.pnlExportPrgrss.BringToFront;
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      STStkVarRepFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;
      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    end
    else
    begin
      MessageDlg('There are no records to print', mtError, [mbOK], 0);
    end;
  finally;
    STStkVarRepFrm.Free;
  end;
end;

end.
