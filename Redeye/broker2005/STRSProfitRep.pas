unit STRSProfitRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TSTRSProfitRepfrm = class(TForm)
    CustBranchLabel: TLabel;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    CustRadioGroup: TRadioGroup;
    CustEdit: TEdit;
    LUCustButton: TButton;
    radgrpRepType: TRadioGroup;
    GroupBox1: TGroupBox;
    dtpckrFrom: TDateTimePicker;
    dtpckrTo: TDateTimePicker;
    chkExCalloffs: TCheckBox;
    procedure LUCustButtonClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CustCode: integer;
    procedure RunReport(bPreview: boolean);
  public
    { Public declarations }
  end;

var
  STRSProfitRepfrm: TSTRSProfitRepfrm;

implementation

uses PBLUCust, STRPProfitRep;

{$R *.DFM}

procedure TSTRSProfitRepfrm.LUCustButtonClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.ShowModal;
    CustCode := PBLUCustFrm.SelCode;
    CustEdit.Text := PBLUCustFrm.GetDetsSQL.FieldByName('Name').AsString;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TSTRSProfitRepfrm.CustRadioGroupClick(Sender: TObject);
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
  end;
end;

procedure TSTRSProfitRepfrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TSTRSProfitRepfrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TSTRSProfitRepfrm.RunReport(bPreview: boolean);
begin
  {Setup and print the report}
  {Create the report form}
  try
    STRPProfitRepfrm := TSTRPProfitRepfrm.Create(Self);
    STRPProfitRepfrm.DateFrom := dtpckrFrom.Date;
    STRPProfitRepfrm.DateTo := dtpckrTo.Date;
    STRPProfitRepfrm.lblSortSequence.caption := radgrpRepType.Items[radgrpRepType.itemindex];
    STRPProfitRepfrm.qryProfitRepAll.ParamByName('Date_From').AsDateTime := dtpckrFrom.Date;
    STRPProfitRepfrm.qryProfitRepAll.ParamByName('Date_To').AsDateTime := dtpckrTo.Date;

    if CustRadioGroup.ItemIndex = 0 then
    begin
      STRPProfitRepfrm.CustomerCode := -1;
    end
    else
    begin
      STRPProfitRepfrm.CustomerCode := CustCode;
    end;

    if radgrpRepType.ItemIndex = 0 then
    begin
      STRPProfitRepfrm.SortFieldName := 'Customer_Name';
    end
    else
    if radgrpRepType.ItemIndex = 1 then
    begin
      STRPProfitRepfrm.SortFieldName := 'Rep_Name';
    end
    else
    begin
      STRPProfitRepfrm.SortFieldName := 'Customer_type';
    end;

    if chkExCalloffs.checked then
      STRPProfitRepfrm.ExcludeCallOffs := 'Y'
    else
      STRPProfitRepfrm.ExcludeCallOffs := 'N';

    if STRPProfitRepfrm.GetDetails(Self) = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
      Exit;
    end;

    {Actually print or preview the report}
    if bPreview then
      STRPProfitRepfrm.qrProfitRep.Preview
    else
      STRPProfitRepfrm.qrProfitRep.Print;
  finally
    Application.ProcessMessages;
    STRPProfitRepfrm.Free;
  end;
end;

procedure TSTRSProfitRepfrm.FormShow(Sender: TObject);
begin
  self.dtpckrTo.date := now();
  self.dtpckrFrom.DateTime := incMonth(now(), -1);
end;

end.
