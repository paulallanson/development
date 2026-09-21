Unit PBMaintDelivBin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, PBPOObjects, ExtCtrls;

type
  TPBMaintDelivBinfrm = class(TForm)
    grpBxBins: TGroupBox;
    Label1: TLabel;
    edtBinLocation: TEdit;
    memQty: TMemo;
    memQtyAlloc: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlAdjustment: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtAdjust: TEdit;
    procedure memQtyKeyPress(Sender: TObject; var Key: Char);
    procedure ValidateQty(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    sOldValue: string;
    FFuncMode: Char;
    procedure SetFuncMode(const Value: Char);
    { Private declarations }
  public
    { Public declarations }
    bOK: Boolean;
    rMaxQty: integer;
    property FuncMode: Char read FFuncMode write SetFuncMode;
  end;

var
  PBMaintDelivBinfrm: TPBMaintDelivBinfrm;

implementation

uses UITypes;
{$R *.DFM}

{ TPBMaintDelivBinfrm }

procedure TPBMaintDelivBinfrm.SetFuncMode(const Value: Char);
begin
  FFuncMode := Value;
  if FFuncMode = 'A' then
    caption := 'Add Delivery Bin details'
  else
  if FFuncMode = 'C' then
    caption := 'Change Delivery Bin details'
  else
  if FFuncMode = 'D' then
    caption := 'Delete Delivery Bin details'
  else
  if FFuncMode = 'T' then
    caption := 'Adjust Delivery Bin Quantitites';

  grpBxBins.enabled := (FFuncMode <> 'T');
  if FFuncMode <> 'T' then
    begin
      pnlAdjustment.height := 0;
      height := 153;
    end
end;

procedure TPBMaintDelivBinfrm.memQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintDelivBinfrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintDelivBinfrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintDelivBinFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  btnOK.Enabled := (edtBinLocation.Text <> '') and
    (memQty.Text <> '');
end;

procedure TPBMaintDelivBinfrm.btnOKClick(Sender: TObject);
begin
  if strtoint(memQty.text) > rMaxQty then
    begin
      if MessageDlg('Quantity specified is greater than unallocated quantity of ' + inttostr(rMaxQty) + ' do you want to continue?', mtwarning,
        [mbYes, mbNo], 1) <> mrYes then
      begin
        memQty.setfocus;
        exit;
      end;
    end;

  if strtoint(memQty.text) < strtoint(memQtyAlloc.text) then
    begin
      MessageDlg('Quantity in the bin cannot be less than the allocated quantity', mterror,
        [mbOk], 0);
      memQty.setfocus;
      exit;
    end;

  bOK := true;
  Modalresult := MROK;
end;

end.
