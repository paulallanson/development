unit STRSSOProdReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSTRSSOProdReturnsFrm = class(TForm)
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    OrderGroupBox: TGroupBox;
    Label5: TLabel;
    lblJobBag: TLabel;
    Label1: TLabel;
    lblDescription: TLabel;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    bOK: boolean;
    AccountMgr: integer;
    Customer: integer;
    procedure RunReport(Preview: boolean);
  public
    { Public declarations }
  end;

var
  STRSSOProdReturnsFrm: TSTRSSOProdReturnsFrm;

implementation

uses STRPSOReturns;

{$R *.dfm}

procedure TSTRSSOProdReturnsFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TSTRSSOProdReturnsFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
  if bOK then close;
end;

procedure TSTRSSOProdReturnsFrm.RunReport(Preview: boolean);
begin
  STRPSOReturnsfrm := TSTRPSOReturnsfrm.create(self);
  try
    STRPSOReturnsfrm.AccountMgr := 0;
    STRPSOReturnsfrm.Customer := 0;
    STRPSOReturnsfrm.JobBag := strtoint(lblJobBag.caption);

    if (STRPSOReturnsfrm.GetDetails = 0) then
      MessageDlg('There are no details to print for the required selection.', mtError, [mbAbort], 0)
    else
      begin
        bOK := false;
        if not Preview then
          begin
            STRPSOReturnsfrm.bPreview := false;
            STRPSOReturnsfrm.qrpDetails.PrinterSetup;
            if STRPSOReturnsfrm.qrpDetails.tag = 0 then
              begin
                STRPSOReturnsfrm.qrpDetails.Print;
                bOK := true;
              end
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
procedure TSTRSSOProdReturnsFrm.FormCreate(Sender: TObject);
begin
  AccountMgr := 0;
  Customer := 0;
end;

end.
