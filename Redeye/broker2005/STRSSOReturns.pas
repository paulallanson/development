unit STRSSOReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSTRSSOReturnsFrm = class(TForm)
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    AllorOneRadioGroup: TRadioGroup;
    grpbxAccountMgr: TGroupBox;
    Label4: TLabel;
    btnAccountMgr: TSpeedButton;
    edtAccountMgr: TEdit;
    CustRadioGroup: TRadioGroup;
    grpbxCustomer: TGroupBox;
    Label5: TLabel;
    btnCustomer: TSpeedButton;
    edtCustomer: TEdit;
    EmailBitBtn: TBitBtn;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAccountMgrClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure AllorOneRadioGroupClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
  private
    AccountMgr: integer;
    Customer: integer;
    procedure RunReport(Preview: boolean);
  public
    { Public declarations }
  end;

var
  STRSSOReturnsFrm: TSTRSSOReturnsFrm;

implementation

uses UITypes, STRPSOReturns, PBLUAccountManager, PBLUCust;

{$R *.dfm}

procedure TSTRSSOReturnsFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TSTRSSOReturnsFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TSTRSSOReturnsFrm.RunReport(Preview: boolean);
begin
  STRPSOReturnsfrm := TSTRPSOReturnsfrm.create(self);
  try
    case AllorOneRadioGroup.ItemIndex of
      0: STRPSOReturnsfrm.AccountMgr := 0;
      1: STRPSOReturnsfrm.AccountMgr := AccountMgr;
    end;

    case CustRadioGroup.ItemIndex of
      0: STRPSOReturnsfrm.Customer := 0;
      1: STRPSOReturnsfrm.Customer := Customer;
    end;

    STRPSOReturnsfrm.JobBag := 0;

    if (STRPSOReturnsfrm.GetDetails = 0) then
      MessageDlg('There are no details to print for the required selection.', mtError, [mbAbort], 0)
    else
      begin
        if not Preview then
          begin
            STRPSOReturnsfrm.bPreview := false;
            STRPSOReturnsfrm.qrpDetails.PrinterSetup;
            if STRPSOReturnsfrm.qrpDetails.tag = 0 then
              STRPSOReturnsfrm.qrpDetails.Print;
          end
        else
          begin
            STRPSOReturnsfrm.bPreview := true;
            STRPSOReturnsfrm.qrpDetails.Preview;
          end;
      end;
  finally
    STRPSOReturnsfrm.free;
  end;
end;
procedure TSTRSSOReturnsFrm.FormCreate(Sender: TObject);
begin
  AccountMgr := 0;
  Customer := 0;
end;

procedure TSTRSSOReturnsFrm.btnAccountMgrClick(Sender: TObject);
begin
 PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Self);
  try
    PBLUAccountManagerFrm.SelCode := AccountMgr;
    PBLUAccountManagerFrm.bAllow_Upd := False;
    PBLUAccountManagerFrm.bIs_Lookup := True;
    PBLUAccountManagerFrm.ShowModal;
    if PBLUAccountManagerFrm.Selected then
    begin
      AccountMgr := PBLUAccountManagerFrm.SelCode;
      edtAccountMgr.Text := PBLUAccountManagerFrm.SelName;
    end;
  finally
    PBLUAccountManagerFrm.Free;
  end;
end;

procedure TSTRSSOReturnsFrm.btnCustomerClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := Customer;
  pbLUCustFrm.ShowModal;
  begin
    Customer := pbLUCustFrm.SelCode;
    edtCustomer.text := pbLUCustFrm.SelName;
  end;
  pbLUCustFrm.Free;
end;

procedure TSTRSSOReturnsFrm.AllorOneRadioGroupClick(Sender: TObject);
begin
  if AllorOneRadioGroup.ItemIndex = 0 then
    grpbxAccountMgr.Visible := False
  else
    grpbxAccountMgr.Visible := True;
end;

procedure TSTRSSOReturnsFrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    grpbxCustomer.Visible := False
  else
    grpbxCustomer.Visible := True;

end;

end.
