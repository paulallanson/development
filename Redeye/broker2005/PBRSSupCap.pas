unit PBRSSupCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, PBPOObjects, Spin, CCSPrint ;

type
  TPBRSSupCapFrm = class(TForm)
    AllOrOneSuppRadioGroup: TRadioGroup;
    SupplierLabel: TLabel;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SuppEdit: TEdit;
    RepTypeRadioGroup: TRadioGroup;
    LUSuppButton: TButton;
    AllOrOnePrdGrpRadioGroup: TRadioGroup;
    PrdTypLabel: TLabel;
    PrdTypEdit: TEdit;
    LUPrdTypButton: TButton;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneSuppRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LUSuppButtonClick(Sender: TObject);
    procedure AllOrOnePrdGrpRadioGroupClick(Sender: TObject);
    procedure LUPrdTypButtonClick(Sender: TObject);
    procedure DispPrdTyp(Sender: TObject);
  private
    { Private declarations }
    Preview: ByteBool;
    DateFrom, DateTo: TDateTime;
    SelSupplier, SelBranch, SelPrdTyp: Integer;
    SelName, SelCustName, SelPrdTypName: string;
  public
    { Public declarations }
  end;

var
  PBRSSupCapFrm: TPBRSSupCapFrm;

implementation

uses UITypes, DateSelV5, PBRPSupCap, PBRDPORep, PBLUSupp, PBLUCust, PBLUPrdTyp;

{$R *.DFM}

procedure TPBRSSupCapFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (((AllOrOneSuppRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '')) and ((AllOrOnePrdGrpRadioGroup.ItemIndex=0) or
    (PrdTypEdit.Text <> '')));
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled ;
end;

procedure TPBRSSupCapFrm.AllOrOneSuppRadioGroupClick(Sender: TObject);
begin
  if AllOrOneSuppRadioGroup.ItemIndex = 0 then
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

procedure TPBRSSupCapFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSSupCapFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSSupCapFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  {Create the form with the report on}
  PBRPSupCapFrm := TPBRPSupCapFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
      PBRPSupCapFrm.PrinterSettings := PrinterSettings;
      try
        PBRPSupCapFrm.Preview := Preview;
        PBRPSupCapFrm.SeqNo := RepTypeRadioGroup.ItemIndex;
        PBRPSupCapFrm.SeqName := RepTypeRadioGroup.Items[RepTypeRadioGroup.ItemIndex] ;
        if AllOrOneSuppRadioGroup.ItemIndex = 0 then
        begin
          PBRPSupCapFrm.SupplierNo := 0;
          PBRPSupCapFrm.BranchNo := 0;
        end
        else
        begin
          PBRPSupCapFrm.SupplierNo := SelSupplier;
          PBRPSupCapFrm.BranchNo := SelBranch;
          PBRPSupCapFrm.SupplierName := SelName;
        end;
       if AllOrOnePrdGrpRadioGroup.ItemIndex = 0 then
        begin
          PBRPSupCapFrm.PrdTyp := 0;
        end
        else
        begin
          PBRPSupCapFrm.PrdTyp := SelPrdTyp;
          PBRPSupCapFrm.PrdTypName := SelPrdTypName;
        end;
        if PBRPSupCapFrm.GetDetails(Self) = 0 then
        begin
          {Record count is zero - nothing to print}
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
          Exit;
        end;
        {Actually print or preview the report}
        if Preview then
          PBRPSupCapFrm.SupCapQuickReport.Preview
        else
          if SetupPrinter(PrinterSettings) then
            PBRPSupCapFrm.SupCapQuickReport.Print;
        {Free up the report form and the form with the SQLs}
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPSupCapFrm.Free;
  end;
end;

procedure TPBRSSupCapFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

function TPBRSSupCapFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSupCapFrm.LUSuppButtonClick(Sender: TObject);
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

procedure TPBRSSupCapFrm.AllOrOnePrdGrpRadioGroupClick(Sender: TObject);
begin
  if AllOrOnePrdGrpRadioGroup.ItemIndex = 0 then
  begin
    PrdTypLabel.Visible := False;
    PrdTypEdit.Visible := False;
    LUPrdTypButton.Visible := False;
    PrdTypEdit.Text := '';
  end
  else
  begin
    PrdTypLabel.Visible := True;
    PrdTypEdit.Visible := True;
    LUPrdTypButton.Visible := True;
    DispPrdTyp(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSSupCapFrm.LUPrdTypButtonClick(Sender: TObject);
begin
  PBLUPrdTypfrm := TPBLUPrdTypfrm.Create(Owner);
  PBLUPrdTypfrm.bIs_Lookup := True;
  PBLUPrdTypfrm.bAllow_Upd := False;
  PBLUPrdTypfrm.Selcode := SelPrdTyp;
  PBLUPrdTypfrm.ShowModal;
  if PBLUPrdTypfrm.selected then
  begin
    SelPrdTyp := PBLUPrdTypfrm.Selcode;
    SelPrdTypName := PBLUPrdTypfrm.SelName;
    DispPrdTyp(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSSupCapFrm.DispPrdTyp(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelPrdTyp <> 0 then
    PrdTypEdit.Text := SelPrdTypName
  else
    PrdTypEdit.Text := '';
end;


end.

