unit PBRSPEndCatPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, ExtCtrls, Db, DBTables, ComCtrls, Spin,
  OleCtnrs;

type
  TPBRSPEndCatPerformfrm = class(TForm)
    rgSelection: TRadioGroup;
    pnlSelectionSearch: TPanel;
    lblCustBran: TLabel;
    edtRevenueLoc: TEdit;
    btnSelection: TButton;
    Label1: TLabel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    qryGetFYPeriods: TQuery;
    Label2: TLabel;
    dblkpPeriod: TDBLookupComboBox;
    qryPeriod: TQuery;
    dtsPeriod: TDataSource;
    spnPeriods: TSpinEdit;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnExcel: TBitBtn;
    chkbxConsolidate: TCheckBox;
    rdgrpReportType: TRadioGroup;
    chkbxShowRep: TCheckBox;
    procedure rgSelectionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSelectionClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpFYClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure rdgrpReportTypeClick(Sender: TObject);
  private
    FChanged: boolean;
    FinancialYear: integer;
    RepCode: integer;
    RepRadGrpCode: integer;
    FActivated: boolean;
    DateFrom, DateTo: TDateTime;
    StartPeriod, FinishPeriod: integer;
    iIntselcode: Integer;
    selrepcode: integer;
    selrepText: string;
    CategoryRpt: boolean;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSPEndCatPerformfrm: TPBRSPEndCatPerformfrm;

implementation

uses PBLURep, PBDatabase, CCSPrint, CCSCommon,
  pbMainMenu, PBLUCategory,
  PBRPPEndCatPerform;

{$R *.DFM}

procedure TPBRSPEndCatPerformfrm.rgSelectionClick(Sender: TObject);
begin
{hide rep selection edit box all rep selected and re-formulate query if anything changes}
  if (rgSelection.ItemIndex = 0) then
  begin
    pnlSelectionSearch.Visible := False;
    EdtRevenueLoc.Text := '';
  end
  else
  begin
    pnlSelectionSearch.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSPEndCatPerformfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryPeriod.close;
      qryPeriod.Open;

      dblkpPeriod.keyvalue := dmBroker.GetCurrentperiod - spnPeriods.Value;

      FActivated := true;
    end;
  enablePrint(self);
end;

procedure TPBRSPEndCatPerformfrm.btnSelectionClick(Sender: TObject);
begin
  PBLUCategoryFrm := TPBLUCategoryFrm.Create(Self);
  try
    PBLUCategoryFrm.bIs_Lookup := True;
    PBLUCategoryFrm.bAllow_Upd := False;
    PBLUCategoryFrm.SelCode := SelRepCode;
    PBLUCategoryFrm.ShowModal;
    if PBLUCategoryFrm.Selected then
    begin
      SelrepCode := PBLUCategoryFrm.SelCode;
      SelrepText := PBLUCategoryFrm.SelName;
    end;
    edtRevenueLoc.Text := SelRepText;
  finally
    PBLUCategoryFrm.Free;
  end;
  enableprint(self);
end;

procedure TPBRSPEndCatPerformfrm.EnablePrint(Sender: TObject);
begin
  if (rgSelection.itemindex = 0) and (dblkpPeriod.keyvalue <> 0) then
    PrintBitBtn.enabled := true
  else
    PrintBitBtn.enabled :=  (edtRevenueLoc.Text <> '') and
                            (dblkpPeriod.keyvalue <> 0);
                            
  previewbitbtn.enabled := PrintBitbtn.enabled;
  btnExcel.enabled := PreviewBitBtn.enabled;
end;

procedure TPBRSPEndCatPerformfrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if (rdgrpReportType.ItemIndex <> 0) and (SelRepCode = 0) and not chkbxConsolidate.checked then
    begin
      messagedlg('Selecting All Categories and reporting by Customer will produce a VERY long running report, please select one category or the consolidate option', mtWarning,[mbOk], 0);
      exit;
    end;

  PBRPPEndCatPerformfrm := TPBRPPEndCatPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndCatPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPEndCatPerformfrm.qrlblDateRange.caption := inttostr(spnPeriods.value) + ' periods from ' + dblkpPeriod.Text;

      PBRPPEndCatPerformfrm.selrepcode := selrepcode;
      PBRPPEndCatPerformfrm.bShowRep := chkbxShowRep.checked;
      PBRPPEndCatPerformfrm.bConsolidate := chkbxConsolidate.checked;

      case rdgrpReportType.itemindex of
        0: PBRPPEndCatPerformfrm.TotbyLoc := true;
        1: PBRPPEndCatPerformfrm.TotbyCust := true;
      end;

      PBRPPEndCatPerformfrm.StartPeriod := dblkpPeriod.KeyValue;
      PBRPPEndCatPerformfrm.FinishPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      PBRPPEndCatPerformfrm.GetDetails(Self);

      if bPreview then
        PBRPPEndCatPerformfrm.quickreport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPPEndCatPerformfrm.quickreport.Print;
    finally
      PrinterSettings.Free;
      PBRPPEndCatPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSPEndCatPerformfrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rgSelection.itemindex = 0 then
    SelrepCode := 0;

  CallReport(True)
end;

procedure TPBRSPEndCatPerformfrm.PrintBitBtnClick(Sender: TObject);
begin
  if rgSelection.itemindex = 0 then
    SelrepCode := 0;

  CallReport(False)
end;

procedure TPBRSPEndCatPerformfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBroker.DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSPEndCatPerformfrm.FormCreate(Sender: TObject);
begin
  selRepCode := 0 ;
  btnSelection.enabled := True;
end;

procedure TPBRSPEndCatPerformfrm.dblkpFYClick(Sender: TObject);
begin
  EnablePrint(self);
end;

procedure TPBRSPEndCatPerformfrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSPEndCatPerformfrm.btnExcelClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  if (rdgrpReportType.ItemIndex <> 0) and (SelRepCode = 0) and not chkbxConsolidate.checked then
    begin
      messagedlg('Selecting All Categories and reporting by Customer will produce a VERY long running report, please select one category or the consolidate option', mtWarning,[mbOk], 0);
      exit;
    end;

  PBRPPEndCatPerformfrm := TPBRPPEndCatPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndCatPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPEndCatPerformfrm.qrlblDateRange.caption := inttostr(spnPeriods.value) + ' periods from ' + dblkpPeriod.Text;

      PBRPPEndCatPerformfrm.selrepcode := selrepcode;
      PBRPPEndCatPerformfrm.bShowRep := chkbxShowRep.checked;
      PBRPPEndCatPerformfrm.bConsolidate := chkbxConsolidate.checked;

      case rdgrpReportType.itemindex of
        0: PBRPPEndCatPerformfrm.TotbyLoc := true;
        1: PBRPPEndCatPerformfrm.TotbyCust := true;
      end;

      PBRPPEndCatPerformfrm.StartPeriod := dblkpPeriod.KeyValue;
      PBRPPEndCatPerformfrm.FinishPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      reccount := PBRPPEndCatPerformfrm.GetSalesDetails(Self);
      if reccount > 0 then
      begin
        PBRPPEndCatPerformfrm.GetDetails(Self);
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPEndCatPerformfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
      PBRPPEndCatPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSPEndCatPerformfrm.rdgrpReportTypeClick(Sender: TObject);
begin
  chkbxConsolidate.caption := 'Consolidate by ' + (sender as TRadioGroup).Items[(sender as TRadioGroup).itemindex];
//  chkbxShowRep.visible := ((sender as TRadioGroup).itemindex = 1);
end;

end.
