unit STPrtTransRecv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPrtTransRecvFrm = class(TForm)
    BinLabel: TLabel;
    BinEdit: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    CheckBinSQL: TFDQuery;
    FRCheckBox: TCheckBox;
    BinBitBtn: TBitBtn;
    QtyMemo: TMemo;
    PackSizeMemo: TMemo;
    CostMemo: TMemo;
    QtyLabel: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckFullyReceived(Sender: TObject);
    procedure BinBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure ValueMemoEnter(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    procedure CostMemoExit(Sender: TObject);
    procedure PackSizeMemoExit(Sender: TObject);
    procedure QtyMemoChange(Sender: TObject);
  private
    { Private declarations }
    sOldValue: String;
    iFullQty: Integer ;
  public
    { Public declarations }
    iQty, iPack: Integer ;
    iPartStore: Integer;
    sPartStoreName, sPart, sPartDescr: String;
    bAllowBin, bOK, bFR, bStore_Ord: ByteBool ;
    fCost: Real ;
  end;

var
  STPrtTransRecvFrm: TSTPrtTransRecvFrm;

implementation

uses
  System.UITypes,
  STLUBinPrt, CCSCommon, pbMainMenu;

{$R *.DFM}

procedure TSTPrtTransRecvFrm.FormActivate(Sender: TObject);
begin
BinLabel.Enabled := bAllowBin ;
BinEdit.Enabled := bAllowBin ;
BinBitBtn.Enabled := bAllowBin ;
QtyMemo.Text := ShowInPacks(iQty,iPack) ;
PackSizeMemo.Text := IntToStr(iPack) ;
CostMemo.Text := CurrencyDisp(frmpbMainMEnu.sCurrencyMask,FloatToStr(fCost)) ;
iFullQty := iQty  ;
CheckFullyReceived(self) ;
CheckOK(Self) ;
bOK := False ;
end;

procedure TSTPrtTransRecvFrm.OKBitBtnClick(Sender: TObject);
begin
If InpToSing(QtyMemo.Text, StrToInt(PackSizeMemo.Text)) < 1 then
   begin
   MessageDlg('The quantity received can''t be less than 1', mtError, [mbOK],0) ;
   exit ;
   end;
If BinEdit.Enabled then
   begin
   If (BinEdit.Text = '') then
      begin
      MessageDlg('You must enter a bin', mtError, [mbOK],0) ;
      exit ;
      end;
   With CheckBinSQL do
        begin
        Close ;
        ParamByName('Part_Store').AsInteger := iPartStore ;
        ParamByName('Part_Bin').AsString := BinEdit.Text ;
        Open ;
        First ;
        If EOF  then
           begin
           MessageDlg('Bin ' + BinEdit.Text + ' is not setup in this store', mtError, [mbOK],0) ;
           exit ;
           end;
        end;
{   For iTempCount := 0 to (ClPrtTranForm.ToTreeView.Items.Count - 1) do
       If TStockDet(ClPrtTranForm.ToTreeView.Items[iTempCount].Data).Bin = BinEdit.Text then
          begin
          MessageDlg('Bin ' + BinEdit.Text + ' already has stock of this part. Drag the ' +
                     'stock you want to move ONTO the bin', mtError, [mbOK],0) ;
          exit ;
          end};
   end;
bOK := True ;
Close ;
end;

procedure TSTPrtTransRecvFrm.CheckFullyReceived(Sender: TObject);
begin
{Check if the fully received check box should be set} ;
If InpToSing(QtyMemo.Text,StrToInt(PackSizeMemo.Text)) >= iFullQty then
   FRCheckBox.Checked := True
else
   FRCheckBox.Checked := bFR ;
end;

procedure TSTPrtTransRecvFrm.BinBitBtnClick(Sender: TObject);
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

procedure TSTPrtTransRecvFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := (QtyMemo.Text <> '') and (CostMemo.Text <> '') and
                    (PackSizeMemo.Text <> '') ;
end;

procedure TSTPrtTransRecvFrm.ValueMemoEnter(Sender: TObject);
begin
sOldValue := (Sender as TMemo).Text;
end;


procedure TSTPrtTransRecvFrm.QtyMemoExit(Sender: TObject);
begin
If Trim((Sender as TMemo).Text) <> '' then
        If InpToSing((Sender as TMemo).Text, StrToInt(PackSizeMemo.Text)) = -99999 then
                (Sender as TMemo).Text := sOldValue
        else
                (Sender as TMemo).Text := ShowInPacks(InpToSing((Sender as TMemo).Text, StrToInt(PackSizeMemo.Text)),StrToInt(PackSizeMemo.Text)) ;
CheckFullyReceived(Self) ;
CheckOK(self) ;
end;

procedure TSTPrtTransRecvFrm.CostMemoExit(Sender: TObject);
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

procedure TSTPrtTransRecvFrm.PackSizeMemoExit(Sender: TObject);
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
CheckFullyReceived(Self) ;
end;

procedure TSTPrtTransRecvFrm.QtyMemoChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

end.
