unit PBRSNCAClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, StdCtrls, ExtCtrls, Db, ComCtrls, Spin,
  OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSNCAClientfrm = class(TForm)
    rgSelection: TRadioGroup;
    pnlSelection: TPanel;
    lblSelection: TLabel;
    edtSelection: TEdit;
    btnCustomer: TButton;
    Label1: TLabel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    qryGetDateRange: TFDQuery;
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
    rdgrpReportType: TRadioGroup;
    procedure rgSelectionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
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
    procedure GetDateRange;
  public
    { Public declarations }
  end;

var
  PBRSNCAClientfrm: TPBRSNCAClientfrm;

implementation

uses PBLURep, PBDatabase, CCSPrint, CCSCommon,
  pbMainMenu, PBLUCust, PBRPNCAClient, PBLUNonConformType;

{$R *.DFM}

procedure TPBRSNCAClientfrm.rgSelectionClick(Sender: TObject);
begin
{hide rep selection edit box all rep selected and re-formulate query if anything changes}
  if (rgSelection.ItemIndex = 0) then
  begin
    pnlSelection.Visible := False;
    edtSelection.Text := '';
  end
  else
  begin
    pnlSelection.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSNCAClientfrm.FormActivate(Sender: TObject);
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

procedure TPBRSNCAClientfrm.btnCustomerClick(Sender: TObject);
begin
  case rdgrpReportType.ItemIndex of
    0:
      begin
        PBLUCustfrm := TPBLUCustfrm.Create(Self);
        try
          PBLUCustfrm.bIs_Lookup := True;
          PBLUCustfrm.bAllow_Upd := False;
          PBLUCustfrm.SelCode := SelRepCode;
          PBLUCustfrm.ShowModal;
          if PBLUCustfrm.Selected then
          begin
            SelrepCode := PBLUCustfrm.SelCode;
            SelrepText := PBLUCustfrm.SelName;
            edtSelection.Text := SelRepText;
          end;
        finally
          PBLUCustfrm.Free;
        end;
      end;
  else
    begin
      PBLUNonConformTypeFrm := TPBLUNonConformTypeFrm.Create(Self);
      try
        PBLUNonConformTypeFrm.bIs_Lookup := True;
        PBLUNonConformTypeFrm.bAllow_Upd := False;
        PBLUNonConformTypeFrm.SelCode := SelRepCode;
        PBLUNonConformTypeFrm.ShowModal;
        if PBLUNonConformTypeFrm.Selected then
          begin
            SelrepCode := PBLUNonConformTypeFrm.SelCode;
            SelrepText := PBLUNonConformTypeFrm.SelName;
            edtSelection.Text := SelRepText;
          end;
      finally
        PBLUNonConformTypeFrm.Free;
      end;
    end;
  end;
  enableprint(self);
end;

procedure TPBRSNCAClientfrm.EnablePrint(Sender: TObject);
begin
  if (rgSelection.itemindex = 0) and (dblkpPeriod.keyvalue <> 0) then
    PrintBitBtn.enabled := true
  else
    PrintBitBtn.enabled :=  (edtSelection.Text <> '') and
                            (dblkpPeriod.keyvalue <> 0);
                            
  previewbitbtn.enabled := PrintBitbtn.enabled;
  btnExcel.enabled := PreviewBitBtn.enabled;
end;

procedure TPBRSNCAClientfrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  GetdateRange;
  PBRPNCAClientFrm := TPBRPNCAClientFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPNCAClientFrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPNCAClientFrm.qrlblDateRange.caption := inttostr(spnPeriods.value) + ' periods from ' + dblkpPeriod.Text;

      PBRPNCAClientFrm.qrlblTitle.caption := PBRPNCAClientFrm.qrlblTitle.caption + ' - ' + rgSelection.Caption;

      PBRPNCAClientFrm.selrepcode := selrepcode;

      case rdgrpReportType.itemindex of
        0: PBRPNCAClientFrm.TotbyCust := true;
        1: PBRPNCAClientFrm.TotbyType := true;
      end;

      PBRPNCAClientFrm.StartPeriod := dblkpPeriod.KeyValue;
      PBRPNCAClientFrm.FinishPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      PBRPNCAClientFrm.DateFrom := DateFrom;
      PBRPNCAClientFrm.DateTo := DateTo;

      if PBRPNCAClientFrm.GetDetails(Self) = 0 then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;

      if bPreview then
        PBRPNCAClientFrm.quickreport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPNCAClientFrm.quickreport.Print;
    finally
      PrinterSettings.Free;
      PBRPNCAClientFrm.free
    end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSNCAClientfrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rgSelection.itemindex = 0 then
    SelrepCode := 0;
  CallReport(True)
end;

procedure TPBRSNCAClientfrm.GetDateRange;
var
  icount: integer;
begin
  DateFrom := date;
  DateTo := date+365;

  with qryGetDateRange do
    begin
      close;
      parambyname('First_Period').asinteger := dblkpPeriod.KeyValue;
      parambyname('Last_Period').asinteger := dblkpPeriod.KeyValue + pred(spnPeriods.value);
      open;

      icount := 1;
      while eof <> true do
        begin
          if icount = 1 then
            DateFrom := fieldbyname('Last_Period_End_Date').asdatetime + 1
          else
            DateTo := fieldbyname('Period_End_Date').asdatetime;
          icount := icount + 1;
          next;
        end;
    end;
end;

procedure TPBRSNCAClientfrm.PrintBitBtnClick(Sender: TObject);
begin
  if rgSelection.itemindex = 0 then
    SelrepCode := 0;

  CallReport(False)
end;

procedure TPBRSNCAClientfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBroker.DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSNCAClientfrm.FormCreate(Sender: TObject);
begin
  selRepCode := 0 ;
  btnCustomer.enabled := True;
end;

procedure TPBRSNCAClientfrm.dblkpFYClick(Sender: TObject);
begin
  EnablePrint(self);
end;

procedure TPBRSNCAClientfrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBRSNCAClientfrm.btnExcelClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  GetdateRange;
  PBRPNCAClientFrm := TPBRPNCAClientFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPNCAClientFrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPNCAClientFrm.qrlblDateRange.caption := inttostr(spnPeriods.value) + ' periods from ' + dblkpPeriod.Text;

      PBRPNCAClientFrm.selrepcode := selrepcode;

      case rdgrpReportType.itemindex of
        0: PBRPNCAClientFrm.TotbyCust := true;
        1: PBRPNCAClientFrm.TotbyType := true;
      end;

      PBRPNCAClientFrm.StartPeriod := dblkpPeriod.KeyValue;
      PBRPNCAClientFrm.FinishPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      PBRPNCAClientFrm.DateFrom := DateFrom;
      PBRPNCAClientFrm.DateTo := DateTo;

      reccount := PBRPNCAClientFrm.GetDetails(Self);
      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPNCAClientFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
      PBRPNCAClientFrm.free
    end;
  finally
     Application.ProcessMessages;
  end;

end;

procedure TPBRSNCAClientfrm.rdgrpReportTypeClick(Sender: TObject);
begin
  case rdgrpReportType.ItemIndex of
    0:
    begin
      rgselection.items.clear;
      rgselection.Caption := 'By Customer';
      rgselection.items.Add('All Customers');
      rgselection.items.Add('One Customer');
      lblSelection.caption := 'Customer';
    end
  else
    begin
      rgselection.items.clear;
      rgselection.Caption := 'By Reason Type';
      rgselection.items.Add('All Reason Types');
      rgselection.items.Add('One Reason Type');
      lblSelection.caption := 'Reason Type';
    end;
  end;
  rgSelection.itemindex := 0;
  edtSelection.Text := '';
end;

end.
