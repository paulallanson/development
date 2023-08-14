unit PBDelivStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Math;

type
  TPBDelivStockFrm = class(TForm)
    CountGroupBox: TGroupBox;
    PBinLbl: TLabel;
    Label6: TLabel;
    LblPackSize: TLabel;
    BinEdit: TEdit;
    LblBox: TLabel;
    Label2: TLabel;
    MemoQty: TMemo;
    MemoPackSize: TMemo;
    MemoNoOfBoxes: TMemo;
    SearchBtn: TButton;
    Panel1: TPanel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    grpbxNumbered: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edtNumberFrom: TEdit;
    edtNumberTo: TEdit;
    Label4: TLabel;
    lblCount: TLabel;
    MemoCost: TMemo;
    Label5: TLabel;
    lblSetsQty: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CheckOk(Sender: TObject);
    procedure MemoQtyKeyPress(Sender: TObject; var Key: Char);
    procedure SearchBtnClick(Sender: TObject);
    procedure edtNumberFromChange(Sender: TObject);
    procedure edtNumberToChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MemoQtyChange(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure MemoPackSizeChange(Sender: TObject);
  private
    FNumbered: bytebool;
    sOldValue: string;
    FSetsPerPad: integer;
    procedure SetNumbered(const Value: bytebool);
    function CountNumbers: real;
    procedure CalcBoxes;
    procedure CalcPackCost;
    procedure SetSetsPerPad(const Value: integer);
    { Private declarations }

  public
    { Public declarations }
    funcmode : string;
    bOK : ByteBool;
    store : integer;
    rMaxqty : Real;
    rUnitCost: double;
    property Numbered: bytebool read FNumbered write SetNumbered;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
  end;

var
  PBDelivStockFrm: TPBDelivStockFrm;

implementation

uses PBStockDM, PBMntPrtBin, ccscommon, pbStockMoveDm;

{$R *.DFM}

procedure TPBDelivStockFrm.OKBtnClick(Sender: TObject);
begin
  if trim(MemoPackSize.text) = '0' then
    begin
      messagedlg('A zero pack size is not valid, please enter a value of 1 or greater', mterror,
        [mbOK], 0);
      MemoPackSize.setfocus;
      exit;
    end;

  if not dtmdlStockMove.validBin(Store,BinEdit.Text) then
      begin
        MessageDlg('This is not a valid Bin for this store', mterror,
          [mbOk], 0);
        BinEdit.setfocus;
        okBtn.enabled  := False;
        exit;
      end;
  if (strtoint(MemoQty.text) mod strtoint(MemoPackSize.text)) > 0 then
    begin
      messagedlg('The pack size entered results in incomplete packs, please alter the pack size or quantity for this delivery', mterror,
          [mbOK], 0);
      exit;
    end;

  if Numbered and ((trim(edtNumberFrom.text) = '') or (trim(edtNumberto.text) = '')) then
    if messagedlg('Number sequence has not been entered, continue?',
                  mtConfirmation, [mbYes, mbNo], 1) = mrNo then
      exit;

  if Numbered and ((trim(edtNumberFrom.text) <> '') and (trim(edtNumberto.text) <> '')) then
    if (length(edtNumberFrom.text) <> length(edtNumberTo.text)) then
      begin
        MessageDlg('The length of the serial numbers must be equal.', mtError,
          [mbOk], 0);
        exit;
      end;

  if Numbered and ((trim(edtNumberFrom.text) <> '') and (trim(edtNumberto.text) <> '')) then
    if strtoint(lblCount.caption) <> (PBDelivStockFrm.SetsperPad * strtoint(MemoQty.text)) then
      begin
        messagedlg('Total of number sequence is not equal to the movement quantity, check details',
                  mterror, [mbOK], 0);
        exit;
      end;
  bOk := True;
close;
end;

procedure TPBDelivStockFrm.CancelBtnClick(Sender: TObject);
begin
bOk := False;
end;

procedure TPBDelivStockFrm.CheckOk(Sender: TObject);
begin
  okBtn.enabled :=  (MemoQty.text <> '') and
                    (BinEdit.Text <> '') and
                    (MemoCost.text <> '') and
                    (MemoPackSize.text <> '');
end;

procedure TPBDelivStockFrm.MemoQtyKeyPress(Sender: TObject; var Key: Char);
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

procedure TPBDelivStockFrm.SearchBtnClick(Sender: TObject);
begin
  PBMntPrtBinFrm := TPBMntPrtBinFrm.Create(Self);
  try
    PBMntPrtBinFrm.bAllow_Upd := True;
    PBMntPrtBinFrm.iStore := Store;
    PBMntPrtBinFrm.ShowModal;
    if (PBMntPrtBinFrm.sSelBin <> '') then
       BinEdit.Text := PBMntPrtBinFrm.sSelBin;
  finally
    PBMntPrtBinFrm.Free;
  end;
end;

procedure TPBDelivStockFrm.SetNumbered(const Value: bytebool);
begin
  FNumbered := Value;
  if not FNumbered then
    begin
      grpbxNumbered.height := 0;
      PBDelivStockFrm.Height := 260;
    end;

end;

function TPBDelivStockFrm.CountNumbers: real;
var
  rCount: real;
begin
  if (trim(edtNumberTo.text) = '') or
     (trim(edtNumberFrom.text) = '') then
    begin
      rCount := 0;
    end
  else
    begin
      rCount := strtoint64(edtNumberTo.text)-strtoint64(edtNumberFrom.text)+1;
      if rCount < 0 then
        rCount := 0;
    end;
  result := rcount;
end;

procedure TPBDelivStockFrm.edtNumberFromChange(Sender: TObject);
begin
  lblCount.caption := formatfloat('###0',countNumbers);
end;

procedure TPBDelivStockFrm.edtNumberToChange(Sender: TObject);
begin
  lblCount.caption := formatfloat('###0',countNumbers);
end;

procedure TPBDelivStockFrm.FormActivate(Sender: TObject);
begin
  lblCount.caption := formatfloat('###0',countNumbers);
end;

procedure TPBDelivStockFrm.MemoQtyChange(Sender: TObject);
begin
  CalcBoxes;
  CheckOK(self);
end;

procedure TPBDelivStockFrm.CalcBoxes;
var
  iBoxes: integer;
begin
  try
    iBoxes := ceil(strtoint(memoQty.text) / strtoint(memoPackSize.text));
  except
    iBoxes := 0
  end;
  MemoNoofBoxes.text := inttostr(iBoxes);
end;

procedure TPBDelivStockFrm.CalcPackCost;
var
  rCost: real;
begin
  try
    rCost := StrToFloatDef(memoPackSize.text, 0, FormatSettings)*rUnitCost;
  except
    rcost := 0.000;
  end;
  MemoCost.text := formatfloat('##0.000',rCost);
end;

procedure TPBDelivStockFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBDelivStockFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyto3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    If (Sender as TMemo).Enabled then
        (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBDelivStockFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;
procedure TPBDelivStockFrm.MemoPackSizeChange(Sender: TObject);
begin
  CalcBoxes;
  CalcPackCost;
  CheckOK(self);
end;

procedure TPBDelivStockFrm.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
  lblSetsQty.visible := (FSetsPerPad > 1);
  lblSetsQty.caption := 'Sets per pad: ' + inttostr(FSetsPerPad);
end;

end.
