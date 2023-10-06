unit STRSStkVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, OleCtnrs, ComCtrls;

type
  TSTRSStkValfrm = class(TForm)
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
    AllOrOneRadioGroup: TRadioGroup;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label5: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    RepGrpBox: TGroupBox;
    Label4: TLabel;
    RepLUSpeedButton: TSpeedButton;
    RepEdit: TEdit;
    RadioGroup1: TRadioGroup;
    StoresGrpBox: TGroupBox;
    Label3: TLabel;
    LUSpdBttnStr: TSpeedButton;
    EdtStore: TEdit;
    RadioGroup2: TRadioGroup;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    EdtBinFrm: TEdit;
    RDGrpPdFor: TRadioGroup;
    Label6: TLabel;
    EDTBinTo: TEdit;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
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
    procedure RepLUSpeedButtonClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure LUSpdBttnStrClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure EdtStoreChange(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtBinFrmChange(Sender: TObject);
    procedure EDTBinToChange(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    bchanging: bytebool;
  public
    { Public declarations }
    bIs_StockTake: Bytebool;
    bIs_Varianceprint : Bytebool;
    StockTakeRef: string;
    SelRep, SelBranch, SelCustomer, SelCustBranch, selStore: Integer;
    SelName, SelCustName, selStoreName, selFrmBin, selToBin: string;
    procedure DispCustBranch(Sender: TObject);
    end;

var
  STRSStkValfrm: TSTRSStkValfrm;

implementation

uses UITypes, STStkValRep, STStkVarRep, STPrtMnt, STLUPrtStor, STMntPrtBin, PBLURep,
  PBLUCust, CCSCommon, printers, ccsprint;

{$R *.DFM}


procedure TSTRSStkValfrm.CallPrintPreview(TempPreview: ByteBool);
begin
  If bIs_Varianceprint then
    begin
      CallVarPrintPreview(TempPreview);
      exit;
    end;
  STStkValRepFrm := TSTStkValRepFrm.Create(Self);
  STStkValRepFrm.qrlblCust.enabled := true;
  STStkValRepFrm.qrlblRange.enabled := true;
  If SeqBYRadioGroup.ItemIndex <> 1 then
    STStkValRepFrm.ByStore := True
  else
    STStkValRepFrm.ByStore := False;
  STStkValRepFrm.ByBin := seqbyRadioGroup.ItemIndex = 2;

  If CostRadioGroup.ItemIndex = 0 then
    STStkValRepFrm.AtActual := True
  else
    STStkValRepFrm.AtActual := False;
  { Store wether report run at current cost or actual cost}

  bChanging := true;
  Case RDGrpPdfor.Itemindex of
  0:  stStkValRepfrm.paidfor := '';
  1:  stSTkValRepfrm.paidfor := 'P';
  2:  STStkValRepfrm.paidfor := 'U';
  end;

  STStkValRepFrm.selstore := selstore;
  STStkValRepFrm.selFrmbin := selFrmBin;
  STStkValRepFrm.selToBin := selToBin;

  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;
  STStkValRepFrm.bExcProd := ChkBxExcProd.Checked;

  with STStkValRepFrm do
  try
    if CHkBxExcProd.checked then
   qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
  else
    qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
    PartFrom := edtPartFrom.Text;
    PartTo := edtPartTo.Text;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        RepNo := 0;
        QRLblCust.Caption := 'All Reps, ';
      end
      else
      begin
        RepNo := SelRep;
        RepName := SelName;
        QRLblCust.Caption := 'Rep - '+SelName+', ';
      end;
      if seqbyradiogroup.itemindex = 2 then
        STStkValRepFrm.QRgroup2.enabled := true;
      if custradiogroup.ItemIndex = 0 then
      begin
        CustNo := 0;
        CustBranchNo := 0;
        QRLblCust.Caption := QRLblCust.Caption +'All Customers';
      end
      else
      begin
        CustNo := SelCustomer;
        CustBranchNo := SelCustBranch;
        CustomerName := SelCustName;
        QRLblCust.Caption := QRLblCust.Caption+'Customer - '+SelCustName;
      end;
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

procedure TSTRSStkValfrm.BitBtn2Click(Sender: TObject);
begin
  CallPrintPreview(True);
end;

procedure TSTRSStkValfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(False);
end;

procedure TSTRSStkValfrm.FormShow(Sender: TObject);
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

procedure TSTRSStkValfrm.CallVarPrintPreview(TempPreview: ByteBool);
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

procedure TSTRSStkValfrm.FormCreate(Sender: TObject);
begin
  If bIs_Varianceprint then
    STRSStkValfrm.Caption := 'Stock Variance Report';
end;

procedure TSTRSStkValfrm.btbtnPartFromClick(Sender: TObject);
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

procedure TSTRSStkValfrm.btbtnPartToClick(Sender: TObject);
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

procedure TSTRSStkValfrm.edtPartFromChange(Sender: TObject);
begin
  if bChanging then exit;
  edtPartTo.Text := edtPartFrom.Text ;
end;

procedure TSTRSStkValfrm.RepLUSpeedButtonClick(Sender: TObject);
begin
  pbLURepFrm := TpbLURepFrm.Create(Self);
  try
    {CSLURepFrm.bODueEnqsOnly := True ;
    CSLURepFrm.dODueDate := ODueDate ;
    } pbLURepFrm.SelCode := SelRep;
    pbLURepFrm.bAllow_Upd := False;
    pbLURepFrm.bIs_Lookup := True;
    pbLURepFrm.ShowModal;
    if pbLURepFrm.Selected then
    begin
      SelRep := pbLURepFrm.SelCode;
      SelName := pbLURepFrm.SelName;
      RepEdit.Text := pbLURepFrm.SelName;
    end;
  finally
    pbLURepFrm.Free;
  end;
end;

procedure TSTRSStkValfrm.CustLuSpeedButtonClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.ShowModal;
  begin
    SelCustomer := pbLUCustFrm.SelCode;
    SelCustBranch := pbLUCustFrm.SelBranch;
    SelCustName := pbLUCustFrm.SelName;
    DispCustBranch(Self);
  end;
  pbLUCustFrm.Free;
end;

procedure TSTRSStkValfrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TSTRSStkValfrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllorOneRadioGroup.ItemIndex = 0 then
    RepGrpBox.Visible := False
  else
    RepGrpBox.Visible := True;
end;

procedure TSTRSStkValfrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    CustGrpBox.Visible := False
  else
    CustGrpBox.Visible := True;
end;

procedure TSTRSStkValfrm.LUSpdBttnStrClick(Sender: TObject);
begin
 STLUPrtStorFrm := TSTLUPrtStorFrm.Create(Self);
  try
    STLUPrtStorFrm.iSelCode := Selstore;
    STLUPrtStorFrm.bAllow_Upd := False;
    STLUPrtStorFrm.bIs_Lookup := True;
    STLUPrtStorFrm.ShowModal;
    if STLUPrtStorFrm.Selected then
    begin
      Selstore := STLUPrtStorFrm.iSelCode;
      SelstoreName := STLUPrtStorFrm.SelName;
      EdtStore.Text := STLUPrtStorFrm.SelName;
    end;
  finally
    STLUPrtStorFrm.Free;
  end;
end;

procedure TSTRSStkValfrm.SpeedButton2Click(Sender: TObject);
begin
STMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
Try
   STMntPrtBinFrm.iStore := selstore ;
   STMntPrtBinFrm.sStoreName := selstorename ;
   STMntPrtBinFrm.bAllow_Upd := False ;
   STMntPrtBinFrm.ShowModal ;
   Selfrmbin := STMntPrtBinFrm.sSelBin;
   EdtbinFrm.Text := STMntPrtBinFrm.sSelBin;
Finally
       STMntPrtBinFrm.Free ;
   end;
end;

procedure TSTRSStkValfrm.RadioGroup1Click(Sender: TObject);
begin
  if radioGroup1.ItemIndex = 0 then
    begin
      EdtStore.Text := '';
      RadioGroup2.visible := false;
      RadioGroup2.itemindex := 0;
      GroupBox2.visible := false;
      EdtBinFrm.Text := '';
      EdtBinTo.Text := '';
      selstore := 0;
      StoresGrpBox.Visible := false;
      StoresGrpBox.enabled := false;
    end
  else
    begin
      StoresGrpBox.enabled := true;
      RadioGroup2.visible := true;
      StoresGrpBox.Visible := true;
    end;
end;

procedure TSTRSStkValfrm.EdtStoreChange(Sender: TObject);
begin
if Edtstore.text = '' then
begin
  Groupbox2.visible := false;
  radiogroup2.Visible := false;
end;

end;

procedure TSTRSStkValfrm.RadioGroup2Click(Sender: TObject);
begin
if RadioGroup2.ItemIndex = 0 then
    begin
      GroupBox2.visible := False;
      selfrmBin := '';
      selToBin := '';
    end
  else
    GroupBox2.Visible := True;
end;

procedure TSTRSStkValfrm.SpeedButton1Click(Sender: TObject);
begin
STMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
Try
   STMntPrtBinFrm.iStore := selstore ;
   STMntPrtBinFrm.sStoreName := selstorename ;
   STMntPrtBinFrm.bAllow_Upd := False ;
   STMntPrtBinFrm.ShowModal ;
   SelTobin := STMntPrtBinFrm.sSelBin;
   EdtbinTo.Text := STMntPrtBinFrm.sSelBin;
Finally
       STMntPrtBinFrm.Free ;
   end;
end;

procedure TSTRSStkValfrm.EdtBinFrmChange(Sender: TObject);
begin
edtBinTo.text := edtBinFrm.Text;
selFrmBin := edtBinTo.Text
end;

procedure TSTRSStkValfrm.EDTBinToChange(Sender: TObject);
begin
selToBin := edtBinTo.text;
end;

procedure TSTRSStkValfrm.btbtnExcelClick(Sender: TObject);
var
  STStkValRepFrm: TSTStkValRepFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  STStkValRepFrm := TSTStkValRepFrm.Create(Self);
  try
    If SeqBYRadioGroup.ItemIndex <> 1 then
      STStkValRepFrm.ByStore := True
    else
      STStkValRepFrm.ByStore := False;

    STStkValRepFrm.ByBin := seqbyRadioGroup.ItemIndex = 2;

    If CostRadioGroup.ItemIndex = 0 then
      STStkValRepFrm.AtActual := True
    else
      STStkValRepFrm.AtActual := False;

    { Store wether report run at current cost or actual cost}

    bChanging := true;
    Case RDGrpPdfor.Itemindex of
      0:  stStkValRepfrm.paidfor := '';
      1:  stSTkValRepfrm.paidfor := 'P';
      2:  STStkValRepfrm.paidfor := 'U';
    end;

    STStkValRepFrm.selstore := selstore;
    STStkValRepFrm.selFrmbin := selFrmBin;
    STStkValRepFrm.selToBin := selToBin;

    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bchanging := false;
    STStkValRepFrm.bExcProd := ChkBxExcProd.Checked;

    STStkValRepFrm.PartFrom := edtPartFrom.Text;
    STStkValRepFrm.PartTo := edtPartTo.Text;

    if AllOrOneRadioGroup.ItemIndex = 0 then
      STStkValRepFrm.RepNo := 0
    else
      STStkValRepFrm.RepNo := SelRep;

    if seqbyradiogroup.itemindex = 2 then
      STStkValRepFrm.QRgroup2.enabled := true;

    if custradiogroup.ItemIndex = 0 then
      begin
        STStkValRepFrm.CustNo := 0;
        STStkValRepFrm.CustBranchNo := 0;
      end
    else
      begin
        STStkValRepFrm.CustNo := SelCustomer;
        STStkValRepFrm.CustBranchNo := SelCustBranch;
      end;

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

end.
