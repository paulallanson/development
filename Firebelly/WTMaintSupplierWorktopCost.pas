unit WTMaintSupplierWorktopCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, CRControls, ExtCtrls;

type
  TfrmWTMaintSupplierWorktopCost = class(TForm)
    BasisGroup: TRadioGroup;
    lblPriceChange: TLabel;
    edtChange: TCREditFloat;
    Label2: TLabel;
    dtpckEffective: TDateTimePicker;
    Label5: TLabel;
    edtTime: TMaskEdit;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BasisGroupClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtChangeChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    bOK: boolean;
  end;

var
  frmWTMaintSupplierWorktopCost: TfrmWTMaintSupplierWorktopCost;

implementation

{$R *.dfm}

procedure TfrmWTMaintSupplierWorktopCost.BasisGroupClick(Sender: TObject);
begin
  case BasisGroup.ItemIndex of
    2,1:  lblPriceChange.caption := 'Cost Change %';
    0:    lblPriceChange.caption := 'New Cost'
  end;

end;

procedure TfrmWTMaintSupplierWorktopCost.FormActivate(Sender: TObject);
begin
  dtpckEffective.Date := date;
  EnableOK(Self);
end;

procedure TfrmWTMaintSupplierWorktopCost.edtChangeChange(Sender: TObject);
begin
  EnableOK(self);
end;

procedure TfrmWTMaintSupplierWorktopCost.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtChange.Text <> '') and
                    (edtTime.text <> '') and
                    (dtpckEffective.date <> 0);
end;

procedure TfrmWTMaintSupplierWorktopCost.btnOKClick(Sender: TObject);
begin
  bOK := true;
  close;
end;

procedure TfrmWTMaintSupplierWorktopCost.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
end;

end.
