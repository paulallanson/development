unit STRSPord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, CCSPrint, ComCtrls, OleCtnrs;

type
  TSTRSPordFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtFrom: TEdit;
    edtTo: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
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
    RadioGroup1: TRadioGroup;
    RDGrpSumm: TRadioGroup;
    SuppRadioGroup: TRadioGroup;
    SuppGrpBox: TGroupBox;
    Label6: TLabel;
    SuppLuSpeedButton: TSpeedButton;
    EdtSupplier: TEdit;
    CheckBox1: TCheckBox;
    RadioGroup2: TRadioGroup;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label1: TLabel;
    CustLuSpeedButton: TSpeedButton;
    edtCustomer: TEdit;
    procedure edtFromChange(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SuppLuSpeedButtonClick(Sender: TObject);
    procedure SuppRadioGroupClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RDGrpSummClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
  private
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  public
    bChanging: boolean;
    DateFrom, DateTo: TDateTime;
    selsupplier, selCustomer: integer;
    procedure CallReport(const bPreview: Boolean);
  end;

var
  STRSPordFrm: TSTRSPordFrm;

implementation

uses UITypes, STPrtMnt, STRPPord, CCSCommon, DateSelV5, PBLUSupp, PBLUCust;

{$R *.DFM}

procedure TSTRSPordFrm.edtFromChange(Sender: TObject);
begin
  enableprint(self);
  if bChanging then exit;
  edtTo.Text := edtFrom.Text ;
end;

procedure TSTRSPordFrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled := (edtDateFrom.text <> '') and
                      (edtDateTo.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TSTRSPordFrm.CallReport(const bPreview: Boolean);
var
  STRPPordfrm: TSTRPPordfrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPPordfrm := TSTRPPordfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPPordfrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then edtFrom.Text := '000000000000';
      if edtTo.Text = '' then edtTo.Text := 'zzzzzzzzzzzz';
      bchanging := false;

      STRPPordfrm.supplier := selsupplier;
      STRPPordfrm.Customer := selCustomer;
      STRPPordfrm.PartFrom := edtFrom.Text;
      STRPPordfrm.PartTo := edtTo.Text;
 //     STRPPordfrm.NotinUse := chkbxExcProd.checked;
      STRPPordfrm.DateFrom := DateFrom;
      STRPPordfrm.DateTo := DateTo;


      if selsupplier <> 0 then
        STRPPordfrm.qrlblSelection.caption := 'supplier: '+edtsupplier.text
      else
        STRPPordfrm.qrlblSelection.caption := '';

      STRPPordfrm.qrlblDateSelection.caption := 'Period: '+edtDateFrom.text + ' to '
                                                          + edtDateTo.text;
      STRPPordfrm.QRLblPartSelection.Caption := 'Product: '+edtFrom.text + ' to '
                                                          +edtTo.text;
      STRPPordFrm.bIsSummary := RDGrpSumm.itemIndex = 0;
      STRPPordFrm.ByProduct := RadioGroup1.itemIndex = 0;
      STRPPordFrm.ByCustomer := RadioGroup1.itemIndex = 1;
      STRPPordFrm.BySupplier := RadioGroup1.itemIndex = 2;
      if RadioGroup1.itemIndex = 2 then
          STRPPordFrm.QRLabel9.Caption := 'Total Value for Supplier'
      else
      if RadioGroup1.itemIndex = 1 then
          STRPPordFrm.QRLabel9.Caption := 'Total Value for Customer'
      else
          STRPPordFrm.QRLabel9.Caption := 'Total Value for Product';
          
      if RadioGroup2.ItemIndex = 1 then
        begin
          STRPPordFrm.QRExpr1.Expression :=
          '(qryReport.Quantity_Ordered * qryReport.Purchase_Price) / qryReport.Purch_Pack_Quantity';
        end
      else
        STRPPordFrm.QRLabel2.caption := 'Total Value Delivered';
      if STRPPordfrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          if RDGrpSumm.itemIndex = 0 then
            STRPPordfrm.qrlblTitle.Caption :=
              STRPPordfrm.qrlblTitle.Caption  + '- Run Date:'+ DateToStr(Date())
          else
            begin
              STRPPordfrm.qrlblTitle.Caption :=
              STRPPordfrm.qrlblTitle.Caption  + '(Valued on '+RadioGroup2.Items.strings[RadioGroup2.itemindex]+') - Run Date:'+ DateToStr(Date());
              if RadioGroup2.itemindex = 1 then
                STRPPordFrm.QRLabel7.Caption := 'Total Value Ordered';
            end;
          if bPreview then
            STRPPordfrm.QuickReport.Preview
          else
            begin
              STRPPordfrm.QuickReport.PrinterSetup;
              if STRPPordfrm.QuickReport.Tag = 0 then
                STRPPordfrm.QuickReport.Print;
            end;
        end;
      STRPPordfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;
procedure TSTRSPordFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TSTRSPordFrm.SpeedButton1Click(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
end;

procedure TSTRSPordFrm.BitBtn2Click(Sender: TObject);
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

procedure TSTRSPordFrm.BitBtn3Click(Sender: TObject);
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

function TSTRSPordFrm.InputDate(TempDate: TDateTime): TDateTime;
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
procedure TSTRSPordFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSPordFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TSTRSPordFrm.edtDateFromExit(Sender: TObject);
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

procedure TSTRSPordFrm.edtDateToExit(Sender: TObject);
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

procedure TSTRSPordFrm.FormCreate(Sender: TObject);
begin
  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);

  EnablePrint(self);
  CheckBox1.caption := 'New Page on change of '+RadioGroup1.Items.strings[RadioGroup1.itemindex];
end;

procedure TSTRSPordFrm.RadioGroup1Click(Sender: TObject);
begin
  RdGrpSumm.visible := RadioGroup1.ItemIndex >= 1;
  Checkbox1.checked := RadioGroup1.itemindex >= 1;
  if RadioGroup1.ItemIndex = 0 then
    RDGrpSumm.ItemIndex := 1;
end;

procedure TSTRSPordFrm.SuppLuSpeedButtonClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  PBLUSuppFrm.bIs_Lookup := True;
  PBLUSuppFrm.bAllow_Upd := False;
  PBLUSuppFrm.SelCode := Selsupplier;
  PBLUSuppFrm.bSel_Branch := false;
  PBLUSuppFrm.ShowModal;
  if PBLUSuppFrm.Selected then
   begin
      Selsupplier := PBLUSuppFrm.SelCode;
      edtsupplier.Text := PBLUSuppFrm.SelName;
   end;
  PBLUSuppFrm.Free;
  enableprint(self);
end;

procedure TSTRSPordFrm.SuppRadioGroupClick(Sender: TObject);
begin
 if SuppRadioGroup.ItemIndex = 0 then
    begin
      SuppGrpBox.Visible := False;
      Selsupplier := 0;
    end
  else
    SuppGrpBox.Visible := True;
end;

procedure TSTRSPordFrm.RadioGroup2Click(Sender: TObject);
begin
  CheckBox1.caption := 'New Page on change of '+RadioGroup1.Items.strings[RadioGroup1.itemindex];
end;

procedure TSTRSPordFrm.RDGrpSummClick(Sender: TObject);
begin
RadioGroup2.visible := RDGrpSumm.ItemIndex = 1;
end;

procedure TSTRSPordFrm.btnExcelClick(Sender: TObject);
var
  STRPPordfrm: TSTRPPordfrm;
  PrinterSettings: TPrinterSettings;
  recCount: integer;
  tempfilename: string;
begin
  STRPPordfrm := TSTRPPordfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPPordfrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then edtFrom.Text := '000000000000';
      if edtTo.Text = '' then edtTo.Text := 'zzzzzzzzzzzz';
      bchanging := false;

      STRPPordfrm.supplier := selsupplier;
      STRPPordfrm.Customer := selCustomer;
      STRPPordfrm.PartFrom := edtFrom.Text;
      STRPPordfrm.PartTo := edtTo.Text;
 //     STRPPordfrm.NotinUse := chkbxExcProd.checked;
      STRPPordfrm.DateFrom := DateFrom;
      STRPPordfrm.DateTo := DateTo;


      STRPPordFrm.bIsSummary := RDGrpSumm.itemIndex = 0;
      STRPPordFrm.ByProduct := RadioGroup1.itemIndex = 0;
      STRPPordFrm.ByCustomer := RadioGroup1.itemIndex = 1;
      STRPPordFrm.BySupplier := RadioGroup1.itemIndex = 2;

      if RadioGroup2.ItemIndex = 1 then
        begin
          STRPPordFrm.QRExpr1.Expression :=
          '(qryReport.Quantity_Ordered * qryReport.Purchase_Price) / qryReport.Purch_Pack_Quantity';
        end
      else
        STRPPordFrm.QRLabel2.caption := 'Total Value Delivered';

      recCount := STRPPordFrm.GetDetails(Self);
      if recCount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPPordFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
      STRPPordFrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TSTRSPordFrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    begin
      CustGrpBox.Visible := False;
      SelCustomer := 0;
    end
  else
    CustGrpBox.Visible := True;

end;

procedure TSTRSPordFrm.CustLuSpeedButtonClick(Sender: TObject);
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

end.
