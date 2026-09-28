unit PBRSPORep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, PBPOObjects, Spin, ComCtrls,
  OleCtnrs, CCSCommon;

type
  TPBRSPORepFrm = class(TForm)
    AllOrOneRadioGroup: TRadioGroup;
    SupplierLabel: TLabel;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SuppEdit: TEdit;
    RepTypeRadioGroup: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    DateFromEdit: TEdit;
    DateToEdit: TEdit;
    LUSuppButton: TButton;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    CustRadioGroup: TRadioGroup;
    CustBranchLabel: TLabel;
    CustEdit: TEdit;
    LUCustButton: TButton;
    Sort2RadioGroup: TRadioGroup;
    Panel1: TPanel;
    exCallOffsChkBox: TCheckBox;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btbtnExcel: TBitBtn;
    ExJobBagsChkBox: TCheckBox;
    rdgrpInclude: TRadioGroup;
    AddCostsCheckBox: TCheckBox;
    ChkBxCnclld: TCheckBox;
    chkbxExcludeCosts: TCheckBox;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LUSuppButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure LUCustButtonClick(Sender: TObject);
    procedure DispCustBranch(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    Preview: ByteBool;
    DateFrom, DateTo: TDateTime;
    SelSupplier, SelBranch, SelCustomer, SelCustBranch: Integer;
    SelName, SelCustName: string;
  public
    { Public declarations }
  end;

var
  PBRSPORepFrm: TPBRSPORepFrm;

implementation

uses UITypes, PBLUSupp, PBLUCust, ccsprint, PBRPPORep, PBRDPORep, DateSelV5;

{$R *.DFM}

procedure TPBRSPORepFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '')) and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
  PreviewBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> ''))and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
end;

procedure TPBRSPORepFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    SupplierLabel.Visible := False;
    SuppEdit.Visible := False;
    LUSuppButton.Visible := False;
    SuppEdit.Text := '';
  end
  else
  begin
    SupplierLabel.Visible := True;
    SuppEdit.Visible := True;
    LUSuppButton.Visible := True;
    DispSuppBranch(Self);
    end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
 end;

procedure TPBRSPORepFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSPORepFrm.PrintReport(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
  if (RepTypeRadioGroup.ItemIndex = 0) and
     (Sort2RadioGroup.ItemIndex = 1) then
     begin
      MessageDlg('Invalid sort selection, each sort selection must be different.', mterror,
      [mbOk], 0);
      exit;
     end;

  {Setup and print the report}
  {Create the report form}
  PBRPPORepFrm := TPBRPPORepFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPORepFrm.PrinterSettings := PrinterSettings;
    {Create the SQL form}
    PBRDPORepDataMod := TPBRDPORepDataMod.Create(Self);
    try
      PBRPPORepFrm.Preview := Preview;
      PBRPPORepFrm.DateFrom := DateFrom;
      PBRPPORepFrm.DateTo := DateTo;
      PBRPPORepFrm.Additcosts := AddCostsCheckBox.checked;
      PBRPPORepFrm.ExcludeCallOffs := ExCallOffsChkBox.checked;
      PBRPPORepFrm.ExcludeJobBags := ExJobBagsChkBox.checked;
      PBRPPORepFrm.ExcludeCosts := chkbxExcludeCosts.checked;

      case rdgrpInclude.ItemIndex of
        0: PBRPPORepFrm.OnlyInvOnCallOff := false;
        1: PBRPPORepFrm.OnlyInvOnCallOff := true;
      end;

      PBRPPoRepFrm.bActive := not ChkBxCnclld.Checked;

      if Sort2RadioGroup.ItemIndex > 0 then
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]) + ' + ' +
            trim(Sort2RadioGroup.Items[Sort2RadioGroup.ItemIndex]);
        end
      else
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]);
        end;

      PBRPPORepFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
      PBRPPORepFrm.SeqNo2 := Sort2RadioGroup.ItemIndex;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPPORepFrm.SupplierNo := 0;
        PBRPPORepFrm.BranchNo := 0;
      end
      else
      begin
        PBRPPORepFrm.SupplierNo := SelSupplier;
        PBRPPORepFrm.BranchNo := SelBranch;
        PBRPPORepFrm.SupplierName := SelName;
      end;
       if CustRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepFrm.CustomerNo := 0;
          PBRPPORepFrm.CustBranchNo := 0;
        end
        else
        begin
          PBRPPORepFrm.CustomerNo := SelCustomer;
          PBRPPORepFrm.CustBranchNo := SelCustBranch;
          PBRPPORepFrm.CustomerName := SelCustName;
        end;
      if PBRPPORepFrm.GetDetails(Self) = 0 then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;
      {Actually print or preview the report}
      if Preview then
        PBRPPORepFrm.PrintPOsQuickReport.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPPORepFrm.PrintPOsQuickReport.Print;
    finally
      PBRDPORepDataMod.Free;
    end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPORepFrm.Free;
  end;
end;

procedure TPBRSPORepFrm.FormActivate(Sender: TObject);
begin
  if DateFromEdit.Text = '' then
  begin
    DateFrom := Date;
    DateFromEdit.Text := PBDatestr(DateFrom);
  end;
  if DateToEdit.Text = '' then
  begin
    DateTo := Date + 30;
    DateToEdit.Text := PBDatestr(DateTo);
  end;
end;

procedure TPBRSPORepFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

function TPBRSPORepFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSPORepFrm.LUSuppButtonClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.SelCode := SelSupplier;
    PBLUSuppFrm.SelBranch := SelBranch;
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSupplier := PBLUSuppFrm.SelCode;
      SelBranch := PBLUSuppFrm.SelBranch;
      SelName := PBLUSuppFrm.SelName;
      DispSuppBranch(Self);
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSPORepFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSPORepFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DatefromEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
end;


procedure TPBRSPORepFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
end;


procedure TPBRSPORepFrm.LUCustButtonClick(Sender: TObject);
begin
 PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.SelCode := SelCustomer;
    PBLUCustFrm.SelBranch := 0;
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bSel_Branch := False;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustomer := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustName := PBLUCustFrm.SelName;
      DispCustBranch(Self);
    end;
  finally
    PBLUCustFrm.Free;
  end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.DispCustBranch(Sender: TObject);
begin
 {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TPBRSPORepFrm.CustRadioGroupClick(Sender: TObject);
begin
if CustRadioGroup.ItemIndex = 0 then
  begin
    CustBranchLabel.Visible := False;
    CustEdit.Visible := False;
    LUCustButton.Visible := False;
    CustEdit.Text := '';
  end
  else
  begin
    CustBranchLabel.Visible := True;
    CustEdit.Visible := True;
    LUCustButton.Visible := True;
    DispCustBranch(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSPORepFrm.btbtnExcelClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  if (RepTypeRadioGroup.ItemIndex = 0) and
     (Sort2RadioGroup.ItemIndex = 1) then
     begin
      MessageDlg('Invalid sort selection, each sort selection must be different.', mterror,
      [mbOk], 0);
      exit;
     end;

  {Setup and print the report}
  {Create the report form}
  PBRPPORepFrm := TPBRPPORepFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPORepFrm.PrinterSettings := PrinterSettings;
    
    PBRDPORepDataMod := TPBRDPORepDataMod.Create(Self);
    try
      PBRPPORepFrm.DateFrom := DateFrom;
      PBRPPORepFrm.DateTo := DateTo;
      PBRPPORepFrm.Additcosts := AddCostsCheckBox.checked;
      PBRPPORepFrm.ExcludeCallOffs := ExCallOffsChkBox.checked;
      PBRPPORepFrm.ExcludeJobBags := ExJobBagsChkBox.checked;
      PBRPPORepFrm.ExcludeCosts := chkbxExcludeCosts.checked;
      PBRPPoRepFrm.bActive := not ChkBxCnclld.Checked;

      case rdgrpInclude.ItemIndex of
        0: PBRPPORepFrm.OnlyInvOnCallOff := false;
        1: PBRPPORepFrm.OnlyInvOnCallOff := true;
      end;

      if Sort2RadioGroup.ItemIndex > 0 then
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]) + ' + ' +
            trim(Sort2RadioGroup.Items[Sort2RadioGroup.ItemIndex]);
        end
      else
        begin
        PBRPPORepFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]);
        end;

      PBRPPORepFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
      PBRPPORepFrm.SeqNo2 := Sort2RadioGroup.ItemIndex;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPPORepFrm.SupplierNo := 0;
        PBRPPORepFrm.BranchNo := 0;
      end
      else
      begin
        PBRPPORepFrm.SupplierNo := SelSupplier;
        PBRPPORepFrm.BranchNo := SelBranch;
        PBRPPORepFrm.SupplierName := SelName;
      end;
       if CustRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepFrm.CustomerNo := 0;
          PBRPPORepFrm.CustBranchNo := 0;
        end
        else
        begin
          PBRPPORepFrm.CustomerNo := SelCustomer;
          PBRPPORepFrm.CustBranchNo := SelCustBranch;
          PBRPPORepFrm.CustomerName := SelCustName;
        end;

      reccount := PBRPPORepFrm.GetDetails(Self);
      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPORepFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end
      else
      begin
        {Record count is zero - nothing to print}
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;

    finally
      PBRDPORepDataMod.Free;
    end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPORepFrm.Free;
  end;

end;

end.
