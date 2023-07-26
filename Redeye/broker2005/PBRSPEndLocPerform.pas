unit PBRSPEndLocPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, ExtCtrls, Db, ComCtrls, Spin,
  OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPEndLocPerformfrm = class(TForm)
    rgRevenueLoc: TRadioGroup;
    pnlRevenueLocSearch: TPanel;
    lblCustBran: TLabel;
    edtRevenueLoc: TEdit;
    btnRevenueLoc: TButton;
    Label1: TLabel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    qryGetFYPeriods: TFDQuery;
    Label2: TLabel;
    dblkpPeriod: TDBLookupComboBox;
    qryPeriod: TFDQuery;
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
    procedure rgRevenueLocClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRevenueLocClick(Sender: TObject);
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
  PBRSPEndLocPerformfrm: TPBRSPEndLocPerformfrm;

implementation

uses PBLURep, PBDatabase, CCSPrint, CCSCommon,
  pbMainMenu, PBLURevenueLoc, PBRPPEndLocPerform;

{$R *.DFM}

procedure TPBRSPEndLocPerformfrm.rgRevenueLocClick(Sender: TObject);
begin
{hide rep selection edit box all rep selected and re-formulate query if anything changes}
  if (rgRevenueLoc.ItemIndex = 0) then
  begin
    pnlRevenueLocSearch.Visible := False;
    EdtRevenueLoc.Text := '';
  end
  else
  begin
    pnlRevenueLocSearch.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSPEndLocPerformfrm.FormActivate(Sender: TObject);
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

procedure TPBRSPEndLocPerformfrm.btnRevenueLocClick(Sender: TObject);
begin
  PBLURevenueLocFrm := TPBLURevenueLocFrm.Create(Self);
  try
    PBLURevenueLocFrm.bIs_Lookup := True;
    PBLURevenueLocFrm.bAllow_Upd := False;
    PBLURevenueLocFrm.SelCode := inttostr(SelRepCode);
    PBLURevenueLocFrm.ShowModal;
    if PBLURevenueLocFrm.Selected then
    begin
      SelrepCode := strtoint(PBLURevenueLocFrm.SelCode);
      SelrepText := PBLURevenueLocFrm.SelName;
    end;
    edtRevenueLoc.Text := SelRepText;
  finally
    PBLURevenueLocFrm.Free;
  end;
  enableprint(self);
end;

procedure TPBRSPEndLocPerformfrm.EnablePrint(Sender: TObject);
begin
  if (rgRevenueLoc.itemindex = 0) and (dblkpPeriod.keyvalue <> 0) then
    PrintBitBtn.enabled := true
  else
    PrintBitBtn.enabled :=  (edtRevenueLoc.Text <> '') and
                            (dblkpPeriod.keyvalue <> 0);
                            
  previewbitbtn.enabled := PrintBitbtn.enabled;
  btnExcel.enabled := PreviewBitBtn.enabled;
end;

procedure TPBRSPEndLocPerformfrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  PBRPPEndLocPerformfrm := TPBRPPEndLocPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndLocPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPEndLocPerformfrm.qrlblDateRange.caption := inttostr(spnPeriods.value) + ' periods from ' + dblkpPeriod.Text;

      PBRPPEndLocPerformfrm.selrepcode := selrepcode;
      PBRPPEndLocPerformfrm.bShowRep := chkbxShowRep.checked;
      PBRPPEndLocPerformfrm.bConsolidate := chkbxConsolidate.checked;

      case rdgrpReportType.itemindex of
        0: PBRPPEndLocPerformfrm.TotbyCat := true;
        1: PBRPPEndLocPerformfrm.TotbyCust := true;
      end;

      PBRPPEndLocPerformfrm.StartPeriod := dblkpPeriod.KeyValue;
      PBRPPEndLocPerformfrm.FinishPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      PBRPPEndLocPerformfrm.GetDetails(Self);

      if bPreview then
        PBRPPEndLocPerformfrm.quickreport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPPEndLocPerformfrm.quickreport.Print;
    finally
      PrinterSettings.Free;
      PBRPPEndLocPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSPEndLocPerformfrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rgRevenueLoc.itemindex = 0 then
    SelrepCode := 0;

  CallReport(True)
end;

procedure TPBRSPEndLocPerformfrm.PrintBitBtnClick(Sender: TObject);
begin
  if rgRevenueLoc.itemindex = 0 then
    SelrepCode := 0;

  CallReport(False)
end;

procedure TPBRSPEndLocPerformfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBroker.DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSPEndLocPerformfrm.FormCreate(Sender: TObject);
begin
  selRepCode := 0 ;
  btnRevenueLoc.enabled := True;
end;

procedure TPBRSPEndLocPerformfrm.dblkpFYClick(Sender: TObject);
begin
  EnablePrint(self);
end;

procedure TPBRSPEndLocPerformfrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSPEndLocPerformfrm.btnExcelClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  PBRPPEndLocPerformfrm := TPBRPPEndLocPerformfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPEndLocPerformfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPEndLocPerformfrm.qrlblDateRange.caption := inttostr(spnPeriods.value) + ' periods from ' + dblkpPeriod.Text;

      PBRPPEndLocPerformfrm.selrepcode := selrepcode;
      PBRPPEndLocPerformfrm.bShowRep := chkbxShowRep.checked;
      PBRPPEndLocPerformfrm.bConsolidate := chkbxConsolidate.checked;

      case rdgrpReportType.itemindex of
        0: PBRPPEndLocPerformfrm.TotbyCat := true;
        1: PBRPPEndLocPerformfrm.TotbyCust := true;
      end;

      PBRPPEndLocPerformfrm.StartPeriod := dblkpPeriod.KeyValue;
      PBRPPEndLocPerformfrm.FinishPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      reccount := PBRPPEndLocPerformfrm.GetSalesDetails(Self);
      if reccount > 0 then
      begin
        PBRPPEndLocPerformfrm.GetDetails(Self);
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPEndLocPerformfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
      PBRPPEndLocPerformfrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSPEndLocPerformfrm.rdgrpReportTypeClick(Sender: TObject);
begin
  chkbxConsolidate.caption := 'Consolidate by ' + (sender as TRadioGroup).Items[(sender as TRadioGroup).itemindex];
//  chkbxShowRep.visible := ((sender as TRadioGroup).itemindex = 1);
end;

end.
