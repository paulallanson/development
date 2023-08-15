unit PBRSSalesInvCost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, DateSelV5,  CCSPrint,
  OleCtnrs, ComCtrls, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesInvCostfrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlCustomer: TPanel;
    Label3: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    rdgrpCustomer: TRadioGroup;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    btnExcel: TBitBtn;
    lblYear: TLabel;
    dblkpFY: TDBLookupComboBox;
    Label2: TLabel;
    dblkpPeriods: TDBLookupComboBox;
    qryFY: TFDQuery;
    dtsFY: TDataSource;
    qryPeriods: TFDQuery;
    dtsPeriods: TDataSource;
    procedure rdgrpReasonClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edtCustomerChange(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FActivated: boolean;
    Customer: integer;
    dateFrom: TDateTime;
    dateTo: TDateTime;
    procedure canPrint;
    procedure RunReport(preview: boolean);
    procedure RuntoExcel;
    procedure GetPeriods;
  public
    { Public declarations }
  end;

var
  PBRSSalesInvCostfrm: TPBRSSalesInvCostfrm;

implementation

uses
  System.UITypes,
  PBDatabase, PBPOObjects, CCSCommon, PBLUCust, PBRPSalesInvCost;

{$R *.DFM}

procedure TPBRSSalesInvCostfrm.rdgrpReasonClick(Sender: TObject);
begin
  pnlCustomer.visible := rdgrpCustomer.itemIndex = 1;
  if pnlCustomer.visible = False then
  begin
    Customer := 0;
    edtCustomer.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSSalesInvCostfrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := Customer;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      Customer := PBLUCustFrm.SelCode;
      edtCustomer.Text := PBLUCustFrm.SelName ;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSSalesInvCostfrm.canPrint;
begin
  if ((rdgrpCustomer.itemIndex = 1) and (Customer = 0)) or
     ((rdgrpCustomer.ItemIndex = 1) and (edtCustomer.text = '')) then
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

procedure TPBRSSalesInvCostfrm.FormCreate(Sender: TObject);
begin
  self.Customer := 0;
end;

procedure TPBRSSalesInvCostfrm.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TPBRSSalesInvCostfrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
begin

  PBRPSalesInvCostFrm := TPBRPSalesInvCostFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPSalesInvCostFrm.PrinterSettings := PrinterSettings;
    PBRPSalesInvCostFrm.iPeriod := dblkpPeriods.keyvalue;
    PBRPSalesInvCostFrm.SelRepCode := Customer;
    PBRPSalesInvCostFrm.qrlblDateRange.caption :=
              PBRPSalesInvCostFrm.qrlblDateRange.caption + dblkpPeriods.Text;

    if PBRPSalesInvCostFrm.GetDetails(self) > 0 then
    begin
      if preview then
      begin
        PBRPSalesInvCostFrm.qrpDetails.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPSalesInvCostFrm.qrpDetails.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPSalesInvCostFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRSSalesInvCostfrm.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TPBRSSalesInvCostfrm.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TPBRSSalesInvCostfrm.btnExcelClick(Sender: TObject);
begin
  RuntoExcel;
end;

procedure TPBRSSalesInvCostfrm.RuntoExcel;
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  PBRPSalesInvCostFrm := TPBRPSalesInvCostFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPSalesInvCostFrm.PrinterSettings := PrinterSettings;
    PBRPSalesInvCostFrm.iPeriod := dblkpPeriods.keyvalue;
    PBRPSalesInvCostFrm.SelRepCode := Customer;

    reccount := PBRPSalesInvCostFrm.GetDetails(self);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPSalesInvCostFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end
    else
      begin
        messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
      end;
  finally
    PrinterSettings.free;
    PBRPSalesInvCostFrm.Free;
    self.visible := true;
  end;

end;

procedure TPBRSSalesInvCostfrm.edtCustomerChange(Sender: TObject);
begin
  CanPrint;
end;

procedure TPBRSSalesInvCostfrm.rdgrpCustomerClick(Sender: TObject);
begin
  pnlCustomer.visible := rdgrpCustomer.itemIndex = 1;
  if pnlCustomer.visible = False then
  begin
    Customer := 0;
    edtCustomer.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSSalesInvCostfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryFY.Active := false;
      qryFY.Active := true;

      dblkpFY.keyvalue := dmBroker.GetCurrentYear;

      GetPeriods;
      FActivated := true;
    end;
  CanPrint;

end;

procedure TPBRSSalesInvCostfrm.GetPeriods;
begin
  with qryPeriods do
    begin
      close;
      open;
    end;
  dblkpPeriods.KeyValue := dmBroker.GetCurrentPeriod - 1;  
end;


end.
