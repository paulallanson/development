unit STRSStockVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, CCSPrint, OleCtnrs, ComCtrls;

type
  TSTRSStockValFrm = class(TForm)
    btnClose: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtDateFrom: TEdit;
    DateFromButton: TSpeedButton;
    edtDateTo: TEdit;
    SpeedButton1: TSpeedButton;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    GroupBox1: TGroupBox;
    memProduct: TMemo;
    Memo1: TMemo;
    rdgrpStore: TRadioGroup;
    StoresGrpBox: TGroupBox;
    Label3: TLabel;
    LUSpdBttnStr: TSpeedButton;
    EdtStore: TEdit;
    rdgrpCustomer: TRadioGroup;
    CustomerGrpBox: TGroupBox;
    Label2: TLabel;
    CustLuSpeedButton: TSpeedButton;
    edtCustomer: TEdit;
    ChkBxExcProd: TCheckBox;
    chkbxNewPage: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure memProductKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure LUSpdBttnStrClick(Sender: TObject);
    procedure rdgrpStoreClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
  private
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure ExcelReport;
    { Private declarations }
  public
    bChanging: boolean;
    DateFrom, DateTo: TDateTime;
    selcustomer, selcustbranch, selStore: integer;
    selCustName, selbranchname, selStoreName: string;
    procedure CallReport(const bPreview: Boolean);
  end;

var
  STRSStockValFrm: TSTRSStockValFrm;

implementation

uses PBLUCust, STPrtMnt, CCSCommon, DateSelV5, STRPStockVal,
  CCSProgressBar, STLUPrtStor;

{$R *.DFM}

procedure TSTRSStockValFrm.BitBtn1Click(Sender: TObject);
begin
 pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.ShowModal;
  if pbLUCustFrm.Selected then
   begin
      SelCustomer := pbLUCustFrm.SelCode;
      SelCustBranch := pbLUCustFrm.SelBranch;
      edtCustomer.Text := pbLUCustFrm.SelName + '/'+ pbLUCustFrm.SelBranchName;
      selCustName := pbLUCustFrm.SelName;
      selbranchname := pbLUCustFrm.SelBranchName;
   end;
  pbLUCustFrm.Free;
  enableprint(self);
end;

procedure TSTRSStockValFrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled := (edtDateFrom.text <> '') and
                        (edtDateTo.text <> '') and
                        (((rdgrpCustomer.itemindex = 0) and (edtCustomer.Text = '')) or ((rdgrpCustomer.itemindex = 1) and (edtCustomer.Text <> ''))) and
                        (((rdgrpStore.itemindex = 0) and (edtStore.Text = '')) or ((rdgrpStore.itemindex = 1) and (edtStore.Text <> '')));

  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TSTRSStockValFrm.CallReport(const bPreview: Boolean);
var
  STRPStockValfrm: TSTRPStockValfrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPStockValFrm := TSTRPStockValFrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
//      STRPStockValFrm.PrinterSettings := PrinterSettings;

      STRPStockValFrm.Customer := selCustomer;

      STRPStockValFrm.Product := memProduct.Text;

      STRPStockValFrm.NotinUse := chkbxExcProd.checked;
      STRPStockValFrm.Store := selStore;
      STRPStockValFrm.DateFrom := DateFrom;
      STRPStockValFrm.DateTo := DateTo;
      STRPStockValFrm.qrbGroupHeader.ForceNewPage := chkbxNewPage.checked ;

      if selCustomer <> 0 then
        begin
          STRPStockValFrm.qrlblSelection.caption := 'Customer: '+selCustName;
        end
      else
        STRPStockValFrm.qrlblSelection.caption := '';

      if selStore <> 0 then
        begin
          STRPStockValFrm.qrlblSelection.caption := STRPStockValFrm.qrlblSelection.caption + ' Store: '+ SelStoreName;
        end
      else
        STRPStockValFrm.qrlblSelection.caption := STRPStockValFrm.qrlblSelection.caption + ' All Stores';

      STRPStockValFrm.qrlblDateSelection.caption := 'Period: '+edtDateFrom.text + ' to '
                                                          + edtDateTo.text;
      if STRPStockValFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          if bPreview then
            STRPStockValFrm.qrpDetails.Preview
          else
            begin
            if SetupPrinter(PrinterSettings) then
              STRPStockValFrm.qrpDetails.Print;
            end;
        end;
      STRPStockValFrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockValFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TSTRSStockValFrm.SpeedButton1Click(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
end;

function TSTRSStockValFrm.InputDate(TempDate: TDateTime): TDateTime;
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
procedure TSTRSStockValFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true)
end;

procedure TSTRSStockValFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false)
end;

procedure TSTRSStockValFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDatefrom.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateFrom.SetFocus;
      Exit;
    end;
  end;

  edtDateFrom.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
end;

procedure TSTRSStockValFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDateto.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateto.SetFocus;
      Exit;
    end;
  end;

  edtDateto.Text := PBDatestr(NewDate);
  Dateto := NewDate;
end;

procedure TSTRSStockValFrm.FormCreate(Sender: TObject);
begin
  TEdit(memProduct).charcase := ecUpperCase;
  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);

  selStore := 0;
  EnablePrint(self);
end;

procedure TSTRSStockValFrm.ExcelReport;
var
  STRPStockValFrm: TSTRPStockValFrm;
  tempFileName: string;
  recCount: integer;
begin

  STRPStockValFrm := TSTRPStockValFrm.Create(Self);
    try
      STRPStockValFrm.Customer := selCustomer;
      STRPStockValFrm.Product := memProduct.Text;
      STRPStockValFrm.NotinUse := chkbxExcProd.checked;
      STRPStockValFrm.DateFrom := DateFrom;
      STRPStockValFrm.DateTo := DateTo;

      recCount := STRPStockValFrm.GetDetails(Self);
      if recCount > 0 then
        begin
          prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          pnlExportPrgrss.BringToFront;
          pnlExportPrgrss.Visible := true;
          pnlExportPrgrss.Repaint;
          STRPStockValFrm.ExportToFile(tempFileName);
          pnlExportPrgrss.visible := false;
          Repaint;
          prgbrExport.Position := 0;
          OleContainer1.CreateLinkToFile(tempFileName, false);
          OleContainer1.DoVerb(0);
        end
      else
        MessageDlg('Nothing to print', mtError, [mbOK], 0);

  finally
    STRPStockValFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockValFrm.memProductKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	$41..$86:;
  	Ord('>'):;
  	Ord('-'):;
  	Ord(','):;
  	Ord(':'):;
  	Ord('/'):;
  	Ord('&'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;
end;

procedure TSTRSStockValFrm.FormShow(Sender: TObject);
begin
  memProduct.SetFocus;
end;

procedure TSTRSStockValFrm.btnExcelClick(Sender: TObject);
begin
  ExcelReport
end;

procedure TSTRSStockValFrm.LUSpdBttnStrClick(Sender: TObject);
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
  enablePrint(self);
end;

procedure TSTRSStockValFrm.rdgrpStoreClick(Sender: TObject);
begin
  if rdgrpStore.ItemIndex = 0 then
    begin
      EdtStore.Text := '';
      selstore := 0;
      StoresGrpBox.Visible := false;
      StoresGrpBox.enabled := false;
    end
  else
    begin
      StoresGrpBox.enabled := true;
      StoresGrpBox.Visible := true;
    end;
  enablePrint(self);
end;

procedure TSTRSStockValFrm.rdgrpCustomerClick(Sender: TObject);
begin
 if rdgrpCustomer.ItemIndex = 0 then
    CustomerGrpBox.Visible := False
  else
    CustomerGrpBox.Visible := True;
  enableprint(self);
end;

procedure TSTRSStockValFrm.CustLuSpeedButtonClick(Sender: TObject);
begin
  try
    pbLUCustFrm := TpbLUCustFrm.Create(Self);
    pbLUCustFrm.bIs_Lookup := True;
    pbLUCustFrm.bAllow_Upd := False;
    pbLUCustFrm.SelCode := SelCustomer;
    pbLUCustFrm.SelBranch := SelCustBranch;
    pbLUCustFrm.bSel_Branch := True;
    pbLUCustFrm.ShowModal;
    if pbLUCustFrm.Selected then
      begin
        SelCustomer := pbLUCustFrm.SelCode;
        SelCustBranch := pbLUCustFrm.SelBranch;
        SelCustName := pbLUCustFrm.SelName;
        if SelCustomer <> 0 then
          edtCustomer.text := SelCustName
        else
          edtCustomer.Text := '';
      end;
  finally
    pbLUCustFrm.Free;
  end;
  enablePrint(self);
end;

end.
