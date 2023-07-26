unit STPrtTransQty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, ExtCtrls, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPrtTransQtyFrm = class(TForm)
    CheckBinSQL: TFDQuery;
    PnlActn: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryCheckBinCount: TFDQuery;
    GroupBox1: TGroupBox;
    memoQty: TMemo;
    Label5: TLabel;
    Label1: TLabel;
    PackSizeMemo: TMemo;
    MemoNoofPacks: TMemo;
    QtyLabel: TLabel;
    BinLabel: TLabel;
    BinEdit: TEdit;
    BinBitBtn: TBitBtn;
    Label2: TLabel;
    CostMemo: TMemo;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    EdtStckDsc: TEdit;
    ChkBxInvUpfrnt: TCheckBox;
    Label4: TLabel;
    spnSets: TSpinEdit;
    Label6: TLabel;
    memPO: TMemo;
    Label7: TLabel;
    edtPalletID: TEdit;
    chkbxOvers: TCheckBox;
    pnlJobNumber: TPanel;
    grpbxJobNumber: TGroupBox;
    Label8: TLabel;
    edtJobNumber: TEdit;
    qryJobBag: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CostMemoExit(Sender: TObject);
    procedure BinBitBtnClick(Sender: TObject);
    procedure QtySpinEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure ValueMemoEnter(Sender: TObject);
    procedure MemoNoofPacksExit(Sender: TObject);
    procedure PackSizeMemoExit(Sender: TObject);
    procedure CostMemoChange(Sender: TObject);
    procedure PackSizeMemoChange(Sender: TObject);
    procedure memoQtyKeyPress(Sender: TObject; var Key: Char);
    procedure PackSizeMemoKeyPress(Sender: TObject; var Key: Char);
    procedure memoQtyChange(Sender: TObject);
    procedure CostMemoKeyPress(Sender: TObject; var Key: Char);
    procedure MemoNoofPacksKeyPress(Sender: TObject; var Key: Char);
    procedure MemoNoofPacksChange(Sender: TObject);
  private
    { Private declarations }
    sOldValue: String;
    procedure CheckBinCount;
    procedure CalcBoxes;
    procedure CalcPackCost;
    procedure CalcQuantity;
    function ValidJobBag(tmpJobNumber: integer): boolean;
  public
    { Public declarations }
    iQty, iPartStore: Integer ;
    sPartStoreName, sCost, sPart, sPartDescr, sPackSize: String;
    bAllowBin, bOK, bIsOpnBal, bIsAdjOut, bIsAdjIn: ByteBool ;
    rUnitCost: double;
  end;

var
  STPrtTransQtyFrm: TSTPrtTransQtyFrm;

implementation

uses STLUBinPrt, CCSCommon, pbMainMenu, pbdatabase, STRSPickingNote;

{$R *.DFM}

procedure TSTPrtTransQtyFrm.FormActivate(Sender: TObject);
begin
  {Don't show Job Number prompt unless production bin}
  pnlJobNumber.height := 0;
  self.height := 391;

  chkbxinvUpfrnt.enabled := dmBroker.IsSecurityUser(frmpbMainMenu.iOperator);
  EdtStckDsc.enabled := dmBroker.IsSecurityUser(frmpbMainMenu.iOperator);
  if dmBroker.IsSecurityUser(frmpbMainMenu.iOperator) then
    edtStckDsc.Color := clWindow
  else
    edtStckDsc.Color := clbtnFace;

  self.CheckBinCount;
  rUnitCost := strtofloat(sCost) / strtofloat(sPackSize);

  If sCost <> '' then
    CostMemo.Text := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,sCost)
  else
    CostMemo.Text := '' ;
  MemoQty.Text := inttostr(iQty);
  MemoNoofPacks.Text := ShowInPacks(iQty,StrToInt(sPackSize)) ;
  if spnSets.Value = 0 then
    spnSets.Value := 1;
(*if not bIsOpnBal then
  begin
    STPrtTransQtyFrm.Height := STPrtTransQtyFrm.Height - PnlOpnBal.height -5;
    PnlOpnBal.Height := 0;
  end;
*)

  PackSizeMemo.Text := sPackSize ;
  {PackSizeMemo.Enabled := Trim(sPackSize) = '' };
  CheckOK(Self) ;
  bOK := False ;
end;

procedure TSTPrtTransQtyFrm.OKBitBtnClick(Sender: TObject);
begin
  if BinEdit.Enabled then
    begin
      if (BinEdit.Text = '') then
        begin
          MessageDlg('You must enter a bin', mtError, [mbOK],0) ;
          exit ;
        end;
    end;

  if BinEdit.text <> 'OUTGOING STOCK' then
  begin
    With CheckBinSQL do
      begin
        Close ;
        ParamByName('Part_Store').AsInteger := iPartStore ;
        ParamByName('Part_Bin').AsString := BinEdit.Text ;
        Open ;
        First ;
        if EOF  then
          begin
            MessageDlg('Bin ' + BinEdit.Text + ' is not setup in this store', mtError, [mbOK],0) ;
            exit ;
          end;

        if (fieldbyname('Production_Bin').asstring = 'Y') and ((bIsAdjIn) or (bIsOpnBal)) and (edtJobNumber.Text = '') then
          begin
            MessageDlg('Bin ' + BinEdit.Text + ' is a production bin, you must specify a job number to move stock into a production bin.', mtError, [mbOK],0) ;
            pnlJobNumber.height := 38;
            self.height := 428;
            edtJobNumber.SetFocus;
            exit;
          end
        else
        if (fieldbyname('Production_Bin').asstring = 'Y') and chkbxOvers.checked then
          begin
            MessageDlg('Bin ' + BinEdit.Text + ' is a production bin, you cannot move overs into a production bin', mtError, [mbOK],0) ;
            exit;
          end
      end;
  end;

  if CostMemo.Text = ''  then
    begin
      MessageDlg('You must enter a cost', mtError, [mbOK],0) ;
      exit ;
    end;

  if not chkbxInvUpfrnt.Checked and bIsAdjOut then
    begin
      MessageDlg('Unpaid stock cannot be adjusted out', mtError, [mbOK],0) ;
      exit ;
    end;

  if (trim(edtJobNumber.Text) <> '') and not ValidJobBag(strtoint(trim(edtJobNumber.text))) then
    begin
      MessageDlg('The job number specified is not an existing number', mtError, [mbOK],0) ;
      exit ;
    end;

  bOK := True ;
  Close ;
end;

function TSTPrtTransQtyFrm.ValidJobBag(tmpJobNumber: integer): boolean;
begin
  with qryJobBag do
    begin
      close;
      parambyname('Job_Bag').asinteger := tmpJobNumber;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TSTPrtTransQtyFrm.CostMemoExit(Sender: TObject);
var
  TempVal: string[10];
begin
If CostMemo.Text <> '' then
  begin
  TempVal := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,CostMemo.Text);
  if TempVal = 'X' then
    CostMemo.Text := sOldValue
  else
    CostMemo.Text := TempVal;
  end;
end;

procedure TSTPrtTransQtyFrm.BinBitBtnClick(Sender: TObject);
begin
{Lookup bins in the selected store} ;
STLUBinPrtFrm := TSTLUBinPrtFrm.Create(Self) ;
Try
   STLUBinPrtFrm.iPartStore := iPartStore ;
   STLUBinPrtFrm.sPartStoreName := sPartStoreName ;
   STLUBinPrtFrm.sPart := sPart ;
   STLUBinPrtFrm.sPartDescr := sPartDescr ;
   STLUBinPrtFrm.ShowModal ;
   If STLUBinPrtFrm.bOK then
        BinEdit.Text := STLUBinPrtFrm.sSelBin ;
Finally
   STLUBinPrtFrm.Free ;
   end;
end;

procedure TSTPrtTransQtyFrm.QtySpinEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTPrtTransQtyFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := (Trim(MemoNoOfPacks.Text) <> '') and (Trim(CostMemo.Text) <> '') ;
end;

procedure TSTPrtTransQtyFrm.ValueMemoEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTPrtTransQtyFrm.MemoNoofPacksExit(Sender: TObject);
begin
If Trim((Sender as TMemo).Text) <> '' then
        If InpToSing((Sender as TMemo).Text, StrToInt(PackSizeMemo.Text)) = -99999 then
                (Sender as TMemo).Text := sOldValue
        else
                (Sender as TMemo).Text := ShowInPacks(InpToSing((Sender as TMemo).Text, StrToInt(PackSizeMemo.Text)),StrToInt(PackSizeMemo.Text)) ;
end;

procedure TSTPrtTransQtyFrm.PackSizeMemoExit(Sender: TObject);
begin
  If Trim(PackSizeMemo.Text) = '' then
    exit ;
  Try
    PackSizeMemo.Text := IntToStr(StrToInt(PackSizeMemo.Text)) ;
    If StrToInt(PackSizeMemo.Text) < 1 then
      begin
        MessageDlg('Pack size must be > 0',mtError,[mbOK],0) ;
        (Sender as TMemo).Text := sOldValue ;
      end;
  Except
    MessageDlg('Invalid pack size',mtError,[mbOK],0) ;
    (Sender as TMemo).Text := sOldValue
  end;
end;

procedure TSTPrtTransQtyFrm.CostMemoChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTPrtTransQtyFrm.PackSizeMemoChange(Sender: TObject);
begin
  CalcBoxes;
  CalcPackCost;
  CheckOK(self);
end;

procedure TSTPrtTransQtyFrm.CheckBinCount;
begin
  qryCheckBinCount.close;
  qryCheckBinCount.ParamByName('part_store').asInteger := iPartStore;
  qryCheckBinCount.Open;

  if qryCheckBinCount.RecordCount = 1 then
  begin
    //only one bin so default to that bin and disable the bin lookup button
    BinEdit.Text := qryCheckBinCount.FieldByName('Part_Bin').asString;
    BinBitBtn.Visible := false;
    //BinLabel.Enabled := false ;
    BinEdit.Enabled := false ;
    BinBitBtn.Enabled := false ;
  end
  else
  begin
    //more than one bin so allow the user to lookup the bin they want.
    BinBitBtn.Visible := bAllowBin;
    //BinLabel.Enabled := bAllowBin ;
    BinEdit.Enabled := bAllowBin ;
    BinBitBtn.Enabled := bAllowBin ;
  end;
  qryCheckBinCount.close;
end;

procedure TSTPrtTransQtyFrm.CalcBoxes;
var
  iBoxes: integer;
begin
  try
    iBoxes := ceil(strtoint(memoQty.text) / strtoint(PackSizememo.text));
  except
    iBoxes := 0
  end;
  MemoNoofPacks.text := inttostr(iBoxes);
end;

procedure TSTPrtTransQtyFrm.CalcQuantity;
var
  iQty: integer;
begin
  try
    iQty := strtoint(memoNoofPacks.text) * strtoint(PackSizememo.text);
  except
    iQty := 0
  end;
  MemoQty.text := inttostr(iQty);
end;

procedure TSTPrtTransQtyFrm.CalcPackCost;
var
  rCost: real;
begin
  try
    rCost := strtoint(PackSizememo.text)*rUnitCost;
  except
    rcost := 0.00;
  end;
  CostMemo.text := formatfloat('##0.000',rCost);
end;

procedure TSTPrtTransQtyFrm.memoQtyKeyPress(Sender: TObject;
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

procedure TSTPrtTransQtyFrm.PackSizeMemoKeyPress(Sender: TObject;
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

procedure TSTPrtTransQtyFrm.memoQtyChange(Sender: TObject);
begin
  if not (Sender as TMemo).Focused then exit;
  CalcBoxes;
  checkok(self);
end;

procedure TSTPrtTransQtyFrm.CostMemoKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TSTPrtTransQtyFrm.MemoNoofPacksKeyPress(Sender: TObject;
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

procedure TSTPrtTransQtyFrm.MemoNoofPacksChange(Sender: TObject);
begin
  if not (Sender as TMemo).Focused then exit;
  CalcQuantity;
  CheckOK(self);
end;

end.
