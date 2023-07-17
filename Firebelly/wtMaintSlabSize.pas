unit wtMaintSlabSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, QrCtrls;

type
  TfrmwtMaintSlabSize = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    edtLength: TDBEdit;
    edtDepth: TDBEdit;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    Label2: TLabel;
    Label4: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    { Private declarations }
  public
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmwtMaintSlabSize: TfrmwtMaintSlabSize;

implementation

uses wtLUSlabSizes;

{$R *.dfm}

procedure TfrmwtMaintSlabSize.btnOKClick(Sender: TObject);
begin
  if chkbxInactive.Checked then
    frmWtLUSlabSizes.tblSlabSize.FieldByName('inActive').asstring := 'Y'
  else
    frmWtLUSlabSizes.tblSlabSize.FieldByName('inActive').asstring := 'N';
  frmWtLUSlabSizes.tblSlabSize.FieldByName('Slab_Size_Description').asstring := frmWtLUSlabSizes.tblSlabSize.FieldByName('Length').asstring + 'mm x '
                                                                              + frmWtLUSlabSizes.tblSlabSize.FieldByName('Depth').asstring + 'mm';
  frmWtLUSlabSizes.tblSlabSize.Post;
end;

procedure TfrmwtMaintSlabSize.BitBtn2Click(Sender: TObject);
begin
  frmWtLUSlabSizes.tblSlabSize.Cancel;
end;

procedure TfrmwtMaintSlabSize.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;

  if Value = 'A' then
    begin
      frmWtLUSlabSizes.tblSlabSize.Insert;
    end
  else
  if Value = 'C' then
    begin
      frmWtLUSlabSizes.tblSlabSize.edit;
    end
end;

procedure TfrmwtMaintSlabSize.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtlength.Text) <> '') and
                    (trim(edtdepth.Text) <> '');
end;

procedure TfrmwtMaintSlabSize.FormActivate(Sender: TObject);
begin
  chkbxInactive.Checked := (frmWtLUSlabSizes.tblSlabSize.fieldbyname('inActive').asstring = 'Y');
  EnableOK(self);
end;

end.
