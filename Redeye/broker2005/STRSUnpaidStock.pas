unit STRSUnpaidStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TSTRSUnpaidStockFrm = class(TForm)
    AllOrOneRadioGroup: TRadioGroup;
    RepGrpBox: TGroupBox;
    Label4: TLabel;
    RepLUSpeedButton: TSpeedButton;
    RepEdit: TEdit;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label5: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    grpbxDateRange: TGroupBox;
    Label1: TLabel;
    edtDateFrom: TEdit;
    btbtnDateFrom: TBitBtn;
    btbtnDateTo: TBitBtn;
    edtDateTo: TEdit;
    Label6: TLabel;
    CloseBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    procedure RepLUSpeedButtonClick(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure edtDateFromChange(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateFromKeyPress(Sender: TObject; var Key: Char);
    procedure edtDateToKeyPress(Sender: TObject; var Key: Char);
    procedure btbtnDateFromClick(Sender: TObject);
    procedure btbtnDateToClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    SelRep, SelCustomer, SelCustBranch: Integer;
    SelName, SelCustName: string;
    procedure DispCustBranch(Sender: TObject);
    procedure RunReport(preview: boolean);
  public
    { Public declarations }
  end;

var
  STRSUnpaidStockFrm: TSTRSUnpaidStockFrm;

implementation

uses
  System.UITypes,
  pbLURep, pbLUCust, STRPUnpaidStock, DateSelV5;

{$R *.DFM}

procedure TSTRSUnpaidStockFrm.RepLUSpeedButtonClick(Sender: TObject);
begin
 pbLURepFrm := TpbLURepFrm.Create(Self);
  try
    {CSLURepFrm.bODueEnqsOnly := True ;
    CSLURepFrm.dODueDate := ODueDate ;
    } pbLURepFrm.SelCode := SelRep;
    pbLURepFrm.bAllow_Upd := False;
    pbLURepFrm.bIs_Lookup := True;
    pbLURepFrm.ShowModal;
    if pbLURepFrm.Selected then
    begin
      SelRep := pbLURepFrm.SelCode;
      SelName := pbLURepFrm.SelName;
      RepEdit.Text := pbLURepFrm.SelName;
    end;
  finally
    pbLURepFrm.Free;
  end;
end;

procedure TSTRSUnpaidStockFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllorOneRadioGroup.ItemIndex = 0 then
  begin
    RepGrpBox.Visible := False;
    self.SelRep := -99;
  end
  else
  begin
    RepGrpBox.Visible := True;
  end;
end;

procedure TSTRSUnpaidStockFrm.CustRadioGroupClick(Sender: TObject);
begin
  if CustRadioGroup.ItemIndex = 0 then
  begin
    CustGrpBox.Visible := False;
    self.SelCustomer := -99;
  end
  else
  begin
    CustGrpBox.Visible := True;
  end;
end;

procedure TSTRSUnpaidStockFrm.CustLuSpeedButtonClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.ShowModal;
  begin
    SelCustomer := pbLUCustFrm.SelCode;
    SelCustBranch := pbLUCustFrm.SelBranch;
    SelCustName := pbLUCustFrm.SelName;
    DispCustBranch(Self);
  end;
  pbLUCustFrm.Free;
end;

procedure TSTRSUnpaidStockFrm.edtDateFromChange(Sender: TObject);
begin
  try
    StrToDate(edtDateFrom.Text);
    StrToDate(edtDateTo.Text);
    if StrToDate(edtDateFrom.Text) >= StrToDate(edtDateTo.Text) then
    begin
      PreviewBitBtn.Enabled := False;
      PrintBitBtn.Enabled := False;
    end
    else
    begin
      PreviewBitBtn.Enabled := True;
      PrintBitBtn.Enabled := True;
    end;
  except
    PreviewBitBtn.Enabled := False;
    PrintBitBtn.Enabled := False;
  end;
end;

procedure TSTRSUnpaidStockFrm.edtDateFromExit(Sender: TObject);
begin
  try
    StrToDate(edtDateFrom.Text);
    StrToDate(edtDateTo.Text);
    PreviewBitBtn.Enabled := True;
    PrintBitBtn.Enabled := True;
  except
    PreviewBitBtn.Enabled := False;
    PrintBitBtn.Enabled := False;
  end;
end;

procedure TSTRSUnpaidStockFrm.edtDateFromKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    try
      StrToDate(edtDateFrom.Text);
      StrToDate(edtDateTo.Text);
      PreviewBitBtn.Enabled := True;
      PrintBitBtn.Enabled := True;
      edtDateTo.SetFocus;
    except
      PreviewBitBtn.Enabled := False;
      PrintBitBtn.Enabled := False;
    end;
  end;
end;

procedure TSTRSUnpaidStockFrm.edtDateToKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    try
      StrToDate(edtDateFrom.Text);
      StrToDate(edtDateTo.Text);
      PreviewBitBtn.Enabled := True;
      PrintBitBtn.Enabled := True;
    except
      PreviewBitBtn.Enabled := False;
      PrintBitBtn.Enabled := False;
    end;
  end;
end;

procedure TSTRSUnpaidStockFrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TSTRSUnpaidStockFrm.RunReport(preview: boolean);
var
  STRPUnpaidStockFrm: TSTRPUnpaidStockFrm;
begin
  STRPUnpaidStockFrm := TSTRPUnpaidStockFrm.create(Self);
  try
    if not STRPUnpaidStockFrm.runReport(SelCustomer, SelCustBranch, SelRep,
         StrToDate(self.edtDateFrom.text), StrToDate(self.edtDateTo.text), preview) then
    begin
      MessageDlg('Nothing to Report.', mtInformation, [mbOK], 0);
    end;
  finally
    STRPUnpaidStockFrm.free;
  end;
end;

procedure TSTRSUnpaidStockFrm.btbtnDateFromClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(edtDateFrom.Text);
    DateSelV5Form.ShowModal;
    edtDateFrom.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTRSUnpaidStockFrm.btbtnDateToClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(edtDateTo.Text);
    DateSelV5Form.ShowModal;
    edtDateTo.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTRSUnpaidStockFrm.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TSTRSUnpaidStockFrm.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TSTRSUnpaidStockFrm.FormShow(Sender: TObject);
begin
  self.SelRep := -99;
  self.SelCustomer := -99;
  self.SelCustBranch := -99;
  self.edtDateFrom.text := DateToStr(trunc(now) - 30);
  self.edtDateTo.text := DateToStr(trunc(now));
end;

end.
