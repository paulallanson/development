unit wtRSSalesInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, gtQrCtrls, IniFiles, AllCommon;

type
  TfrmwtRSSalesInvoice = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    SelectionGroup: TRadioGroup;
    btnPreview: TButton;
    rdgrpType: TRadioGroup;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RunReport(const bPreview: Boolean);
    { Private declarations }
  public
    iCode: integer;
    InvoicePrint: boolean;
  end;

var
  frmwtRSSalesInvoice: TfrmwtRSSalesInvoice;

implementation

uses wtRPSalesInvoice;

{$R *.dfm}

procedure TfrmwtRSSalesInvoice.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtRSSalesInvoice.RunReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  frmWTRPSalesInvoice := TfrmWTRPSalesInvoice.Create(Self);

  try
    PrinterSettings := TPrinterSettings.Create;
    try
      frmWTRPSalesInvoice.bInvoice := InvoicePrint;
      {Extract the relevant data}
      if bPreview then
        frmWTRPSalesInvoice.bUpdate := False
      else
        frmWTRPSalesInvoice.bUpdate := true;

      if selectiongroup.itemindex = 0 then
        frmWTRPSalesInvoice.bAll := False
      else
        frmWTRPSalesInvoice.bAll := True;

      if rdgrpType.itemindex = 0 then
        frmWTRPSalesInvoice.bDetailed := False
      else
        frmWTRPSalesInvoice.bDetailed := True;

      frmWTRPSalesInvoice.SelCode := iCode;

      frmWTRPSalesInvoice.GetInvoiceData;
      if bPreview then
        frmWTRPSalesInvoice.InvoiceReport.Preview
      else
        begin
(*          frmWTRPSalesInvoice.InvoiceReport.PrinterSetup;
          if frmWTRPSalesInvoice.InvoiceReport.tag = 0 then
            frmWTRPSalesInvoice.InvoiceReport.Print;
*)
          if SetUpPrinter(PrinterSettings) then
            frmWTRPSalesInvoice.InvoiceReport.Print;
        end;
    finally
      PrinterSettings.free;
    end;
  finally
    frmWTRPSalesInvoice.Free;
  end;
  close;
end;

procedure TfrmwtRSSalesInvoice.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmwtRSSalesInvoice.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmwtRSSalesInvoice.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      if rdgrpType.ItemIndex = 1 then
        WriteString('Sales Invoice', 'Detailed Print', 'Y')
      else
        WriteString('Sales Invoice', 'Detailed Print', 'N');
      Free;
    end;
end;

procedure TfrmwtRSSalesInvoice.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      if ReadString('Sales Invoice', 'Detailed Print', 'N') = 'Y' then
        rdgrpType.itemindex := 1
      else
        rdgrpType.itemindex := 0
    end;
  finally
    IniFile.Free;
  end;
end;

end.
