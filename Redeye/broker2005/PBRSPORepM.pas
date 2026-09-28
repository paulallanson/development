unit PBRSPORepM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, PBPOObjects, Spin;

type
  TPBRSPORepMFrm = class(TForm)
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
    sort2RadioGroup: TRadioGroup;
    Panel1: TPanel;
    AddCostsCheckBox: TCheckBox;
    ExCallOffsChkBox: TCheckBox;
    ChkBxCnclld: TCheckBox;
    rdgrpInclude: TRadioGroup;
    ExJobBagsChkBox: TCheckBox;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    procedure DispCustBranch(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LUSuppButtonClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure LUCustButtonClick(Sender: TObject);
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
  PBRSPORepMFrm: TPBRSPORepMFrm;

implementation

uses UITypes, PBLUSupp, PBRPPORepM, PBRDPORep, DateSelV5, CCSPrint, PBLUCust;

{$R *.DFM}

procedure TPBRSPORepMFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '')) and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
  PreviewBitBtn.Enabled := (((AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> ''))and ((CustRadioGroup.ItemIndex=0) or
    (CustEdit.Text <> '')));
end;

procedure TPBRSPORepMFrm.AllOrOneRadioGroupClick(Sender: TObject);
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

procedure TPBRSPORepMFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSPORepMFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSPORepMFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  if (RepTypeRadioGroup.ItemIndex = 0) and
     (Sort2RadioGroup.ItemIndex = 1) then
     begin
      MessageDlg('Invalid sort selection, each sort selection must be different.', mterror,
      [mbOk], 0);
      exit;
     end;

  {Setup and print the report}
  {Create the form with the report on}
  PBRPPORepMFrm := TPBRPPORepMFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPORepMFrm.PrinterSettings := PrinterSettings;
      {Create the form with the 8 SQLs on}
      PBRDPORepDataMod := TPBRDPORepDataMod.Create(Self);
      try
        PBRPPORepMFrm.Preview := Preview;
        PBRPPORepMFrm.DateFrom := DateFrom;
        PBRPPORepMFrm.DateTo := DateTo;
        PBRPPORepMFrm.Additcosts := AddCostsCheckBox.checked;
        PBRPPORepMFrm.ExcludeCallOffs := ExCallOffsChkBox.checked;
        PBRPPORepMFrm.ExcludeJobBags := ExJobBagsChkBox.checked;
        PBRPPoRepMFrm.bActive := not ChkBxCnclld.Checked;

        case rdgrpInclude.ItemIndex of
          0: PBRPPORepMFrm.OnlyInvOnCallOff := false;
          1: PBRPPORepMFrm.OnlyInvOnCallOff := true;
        end;

        if Sort2RadioGroup.ItemIndex > 0 then
          begin
          PBRPPORepMFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]) + ' + ' +
            trim(Sort2RadioGroup.Items[Sort2RadioGroup.ItemIndex]);
          end
        else
          begin
          PBRPPORepMFrm.SeqName :=
            trim(RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex]);
          end;

        PBRPPORepMFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
        PBRPPORepMFrm.SeqNo2 := Sort2RadioGroup.ItemIndex;
        if AllOrOneRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepMFrm.SupplierNo := 0;
          PBRPPORepMFrm.BranchNo := 0;
        end
        else
        begin
          PBRPPORepMFrm.SupplierNo := SelSupplier;
          PBRPPORepMFrm.BranchNo := SelBranch;
          PBRPPORepMFrm.SupplierName := SelName;
        end;
       if CustRadioGroup.ItemIndex = 0 then
        begin
          PBRPPORepMFrm.CustomerNo := 0;
          PBRPPORepMFrm.CustBranchNo := 0;
        end
        else
        begin
          PBRPPORepMFrm.CustomerNo := SelCustomer;
          PBRPPORepMFrm.CustBranchNo := SelCustBranch;
          PBRPPORepMFrm.CustomerName := SelCustName;
        end;
        if PBRPPORepMFrm.GetDetails(Self) = 0 then
        begin
          {Record count is zero - nothing to print}
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
          Exit;
        end;
        {Actually print or preview the report}
        if Preview then
          PBRPPORepMFrm.PrintPOsQuickReport.Preview
        else
          if SetupPrinter(PrinterSettings) then
            PBRPPORepMFrm.PrintPOsQuickReport.Print;
        {Free up the report form and the form with the SQLs}
      finally
        PBRDPORepDataMod.Free;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPORepMFrm.Free;
  end;
end;

procedure TPBRSPORepMFrm.FormActivate(Sender: TObject);
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

procedure TPBRSPORepMFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

function TPBRSPORepMFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSPORepMFrm.LUSuppButtonClick(Sender: TObject);
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

procedure TPBRSPORepMFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSPORepMFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSPORepMFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateFromEdit.Text = '' then
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

procedure TPBRSPORepMFrm.DateToEditExit(Sender: TObject);
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

  DateToEdit.Text := PBdatestr(NewDate);
  DateTo := NewDate;
end;



procedure TPBRSPORepMFrm.CustRadioGroupClick(Sender: TObject);
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

procedure TPBRSPORepMFrm.DispCustBranch(Sender: TObject);
begin
 {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TPBRSPORepMFrm.LUCustButtonClick(Sender: TObject);
begin
 PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.SelCode := SelCustomer;
    PBLUCustFrm.SelBranch := SelCustBranch;
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

end.

