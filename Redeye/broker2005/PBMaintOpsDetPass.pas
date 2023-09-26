unit PBMaintOpsDetPass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBMaintOpsDetPassFrm = class(TForm)
    OldPassEdit: TEdit;
    NewPassEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    ConfPassEdit: TEdit;
    Label3: TLabel;
    procedure OldPassEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure NewPassEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bOK: ByteBool;
  end;

var
  PBMaintOpsDetPassFrm: TPBMaintOpsDetPassFrm;

implementation

uses UITypes;
{$R *.DFM}

procedure TPBMaintOpsDetPassFrm.OldPassEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TPBMaintOpsDetPassFrm.CheckOK(Sender: TObject);
begin
OkBitBtn.Enabled := (OldPassEdit.Text <> '') and (NewPassEdit.Text <> '') ;
end;

procedure TPBMaintOpsDetPassFrm.NewPassEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TPBMaintOpsDetPassFrm.FormActivate(Sender: TObject);
begin
bOK := False ;
end;

procedure TPBMaintOpsDetPassFrm.OKBitBtnClick(Sender: TObject);
begin
If (NewPassEdit.Text <> ConfPassEdit.Text) then
        begin
        MessageDlg('"New Password" and "Confirm New" don''t match', mtError,[mbOK],0) ;
        end
else
        begin
        bOK := True ;
        Close ;
        end;
end;

end.
