unit STRSCustStkBal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CCSPrint, ComCtrls, OleCtnrs, CCSCommon;

type
  TSTRSCustStkBalfrm = class(TForm)
    Label1: TLabel;
    edtCustomer: TEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtFrom: TEdit;
    edtTo: TEdit;
    btnClose: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnFax: TBitBtn;
    btnEmail: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    ChkBxExcProd: TCheckBox;
    BitBtn4: TBitBtn;
    chkbxNumbers: TCheckBox;
    btbtnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    RdGrpRptTyp: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure edtFromChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    bChanging: boolean;
    selcustomer: integer;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  STRSCustStkBalfrm: TSTRSCustStkBalfrm;

implementation

uses UITypes, PBLUCust, STPrtMnt, STRPCustStkBal, STRPCustStkBalDet;

{$R *.DFM}

procedure TSTRSCustStkBalfrm.BitBtn1Click(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  PBLUCustFrm.bIs_Lookup := True;
  PBLUCustFrm.bAllow_Upd := False;
  PBLUCustFrm.SelCode := SelCustomer;
  PBLUCustFrm.bSel_Branch := false;
  PBLUCustFrm.ShowModal;
  if PBLUCustFrm.Selected then
   begin
      SelCustomer := PBLUCustFrm.SelCode;
      edtCustomer.Text := PBLUCustFrm.SelName;
   end;
  PBLUCustFrm.Free;
  enableprint(self);
end;

procedure TSTRSCustStkBalfrm.edtFromChange(Sender: TObject);
begin
  enableprint(self);
  if bChanging then exit;
  edtTo.Text := edtFrom.Text ;
end;

procedure TSTRSCustStkBalfrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') or
                      ((edtFrom.text <> '') and(edtTo.text <> ''));
  btnPreview.enabled := btnPrint.enabled;
  btnFax.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled;
end;

procedure TSTRSCustStkBalfrm.BitBtn2Click(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
  enableprint(self);
end;

procedure TSTRSCustStkBalfrm.BitBtn3Click(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
  enableprint(self);
end;

procedure TSTRSCustStkBalfrm.CallReport(const bPreview: Boolean);
var
  STRPCustStkBalfrm: TSTRPCustStkBalfrm;
  PrinterSettings: TPrinterSettings;
begin
  if RdGrpRptTyp.itemindex = 0 then
  begin
  STRPCustStkBalfrm := TSTRPCustStkBalfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPCustStkBalfrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then
      begin
        edtFrom.Text := '000000000000';
        edtFrom.Repaint;
      end;
      if edtTo.Text = '' then
      begin
        edtTo.Text := 'zzzzzzzzzzzz';
        edtTo.Repaint;
      end;
      bchanging := false;

      STRPCustStkBalfrm.Customer := selCustomer;
      STRPCustStkBalfrm.PartFrom := edtFrom.Text;
      STRPCustStkBalfrm.PartTo := edtTo.Text;
      STRPCustStkBalfrm.NotinUse := chkbxExcProd.checked;
      STRPCustStkBalfrm.qrsdtlNumbers.enabled := chkbxNumbers.checked ;

      if selCustomer <> 0 then
        STRPCustStkBalfrm.qrlblSelection.caption := 'Customer: '+edtCustomer.text
      else
        STRPCustStkBalfrm.qrlblSelection.caption := '';

      if STRPCustStkBalfrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          STRPCustStkBalfrm.qrlblTitle.Caption :=
              STRPCustStkBalfrm.qrlblTitle.Caption + DateToStr(Date());
          if bPreview then
            STRPCustStkBalfrm.QuickReport.Preview
          else
          if SetupPrinter(PrinterSettings) then
            STRPCustStkBalfrm.QuickReport.Print;
        end;
      STRPCustStkBalfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
  end
  else
  begin
  STRPCustStkBalDetfrm := TSTRPCustStkBalDetfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPCustStkBalDetfrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then
      begin
        edtFrom.Text := '000000000000';
        edtFrom.Repaint;
      end;
      if edtTo.Text = '' then
      begin
        edtTo.Text := 'zzzzzzzzzzzz';
        edtTo.Repaint;
      end;
      bchanging := false;

      STRPCustStkBalDetfrm.Customer := selCustomer;
      STRPCustStkBalDetfrm.PartFrom := edtFrom.Text;
      STRPCustStkBalDetfrm.PartTo := edtTo.Text;
      STRPCustStkBalDetfrm.NotinUse := chkbxExcProd.checked;
      STRPCustStkBalDetfrm.qrsdtlNumbers.enabled := chkbxNumbers.checked ;

{      if selCustomer <> 0 then
        STRPCustStkBalDetfrm.qrlblSelection.caption := 'Customer: '+edtCustomer.text
      else
        STRPCustStkBalDetfrm.qrlblSelection.caption := ''; }

      if STRPCustStkBalDetfrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          STRPCustStkBalDetfrm.qrlblTitle.Caption :=
              STRPCustStkBalDetfrm.qrlblTitle.Caption + DateToStr(Date());
          if bPreview then
            STRPCustStkBalDetfrm.QuickReport.Preview
          else
          if SetupPrinter(PrinterSettings) then
            STRPCustStkBalDetfrm.QuickReport.Print;
        end;
      STRPCustStkBalDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;
end;

procedure TSTRSCustStkBalfrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TSTRSCustStkBalfrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSCustStkBalfrm.FormShow(Sender: TObject);
begin
  selcustomer := 0;
end;

procedure TSTRSCustStkBalfrm.BitBtn4Click(Sender: TObject);
begin
  edtCustomer.text := '';
  selCustomer := 0;
end;

procedure TSTRSCustStkBalfrm.btbtnExcelClick(Sender: TObject);
var
  STRPCustStkBalfrm: TSTRPCustStkBalfrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
if RDGrpRptTyp.itemindex = 0 then
begin
  STRPCustStkBalfrm := TSTRPCustStkBalfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPCustStkBalfrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then
      begin
        edtFrom.Text := '000000000000';
        edtFrom.Repaint;
      end;
      if edtTo.Text = '' then
      begin
        edtTo.Text := 'zzzzzzzzzzzz';
        edtTo.Repaint;
      end;
      bchanging := false;

      STRPCustStkBalfrm.Customer := selCustomer;
      STRPCustStkBalfrm.PartFrom := edtFrom.Text;
      STRPCustStkBalfrm.PartTo := edtTo.Text;
      STRPCustStkBalfrm.NotinUse := chkbxExcProd.checked;
      STRPCustStkBalfrm.qrsdtlNumbers.enabled := chkbxNumbers.checked ;

      if selCustomer <> 0 then
        STRPCustStkBalfrm.qrlblSelection.caption := 'Customer: '+edtCustomer.text
      else
        STRPCustStkBalfrm.qrlblSelection.caption := '';

      recCount := STRPCustStkBalfrm.GetDetails(Self);
      if recCount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPCustStkBalfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
      STRPCustStkBalfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
 end
else
 begin
    STRPCustStkBalDetfrm := TSTRPCustStkBalDetfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPCustStkBalDetfrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then
      begin
        edtFrom.Text := '000000000000';
        edtFrom.Repaint;
      end;
      if edtTo.Text = '' then
      begin
        edtTo.Text := 'zzzzzzzzzzzz';
        edtTo.Repaint;
      end;
      bchanging := false;

      STRPCustStkBalDetfrm.Customer := selCustomer;
      STRPCustStkBalDetfrm.PartFrom := edtFrom.Text;
      STRPCustStkBalDetfrm.PartTo := edtTo.Text;
      STRPCustStkBalDetfrm.NotinUse := chkbxExcProd.checked;
      STRPCustStkBalDetfrm.qrsdtlNumbers.enabled := chkbxNumbers.checked ;

{      if selCustomer <> 0 then
        STRPCustStkBalDetfrm.qrlblSelection.caption := 'Customer: '+edtCustomer.text
      else
        STRPCustStkBalDetfrm.qrlblSelection.caption := '';  }

      recCount := STRPCustStkBalDetfrm.GetDetails(Self);
      if recCount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPCustStkBalDetfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
      STRPCustStkBalDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
 end;
end;

end.
