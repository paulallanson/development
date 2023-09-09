unit STStkTkItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, FireDAC.Stan.Param;

type
  TSTStkTkItemFrm = class(TForm)
    OKBtn: TBitBtn;                        
    CancelBtn: TBitBtn;
    Label1: TLabel;
    PartEdit: TEdit;
    DescriptionEdit: TEdit;
    Label3: TLabel;
    AllocGroupBox: TGroupBox;
    ABinLbl: TLabel;
    ABinEdit: TEdit;
    Label5: TLabel;
    CountGroupBox: TGroupBox;
    PBinLbl: TLabel;
    PBinEdit: TEdit;
    Label6: TLabel;
    PLotEdit: TEdit;
    ALotEdit: TEdit;
    ALotLbl: TLabel;
    PLotLbl: TLabel;
    AQtyEdit: TEdit;
    PQtyEdit: TEdit;
    PartBitBtn: TBitBtn;
    EditPackSize: TEdit;
    Label2: TLabel;
    LblPackSize: TLabel;
    EditCountPackSize: TEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PartEditExit(Sender: TObject);
    procedure PQtyEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ABinEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BuildLotList;
    procedure PQtyEditKeyPress(Sender: TObject; var Key: Char);
    procedure RePositionOKBtn;
    procedure PBinEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PLotEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PQtyEditClick(Sender: TObject);
    procedure PartBitBtnClick(Sender: TObject);
    procedure PQtyEditChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PLotEditExit(Sender: TObject);
    procedure EditCountPackSizeKeyPress(Sender: TObject; var Key: Char);
    procedure EditCountPackSizeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPartCode: string;
    FPriorBin: string;
    FCountQty: string;
    FPriorQty: string;
    FMaintMode: string;
    FCountList: string;
    FPartDesc: string;
    FCountListItems: TStringList;
    FIsJOb: boolean;
    FCountBin: string;
    FCountLot: string;
    FPriorLot: string;
    FSerialNoInUse: boolean;
    FBinsInUse: boolean;
    FLotsInUse: boolean;
    FSerialNoItems: TStringList;
    FPartStore: integer;
    FStockTakeNo: integer;
    fActionTkn: string;
    fStoreStock: integer;
    fPacksize: integer;
    fCountPacksize: integer;
    procedure SetPartCode(const Value: string);
    procedure SetPriorBin(const Value: string);
    procedure SetPriorQty(const Value: string);
    procedure SetCountQty(const Value: string);
    procedure SetMaintMode(const Value: string);
    procedure EnableOK;
    procedure SetCountList(const Value: string);
    procedure SetPartDesc(const Value: string);
    procedure SetCountListItems(const Value: TStringList);
    function ValidCountingItem: boolean;
    procedure SetIsJOb(const Value: boolean);
    procedure SetCountBin(const Value: string);
    procedure SetPriorLot(const Value: string);
    procedure SetCountLot(const Value: string);
    procedure SetBinsInUse(const Value: boolean);
    procedure SetLotsInUse(const Value: boolean);
    procedure SetSerialNoInUse(const Value: boolean);
    procedure SetSerialNoItems(const Value: TStringList);
    procedure SetPartStore(const Value: integer);
    procedure setActionTkn(const Value: string);
    procedure setStockTakeNo(const Value: integer);
    procedure setStoreStock(const Value: integer);
    procedure setPackSize(const Value: integer);
    procedure setCountPackSize(const Value: integer);
    { Private declarations }
  public
    property PartCode: string read FPartCode write SetPartCode;
    property PriorBin: string read FPriorBin write SetPriorBin;
    property PriorQty: string read FPriorQty write SetPriorQty;
    property CountQty: string read FCountQty write SetCountQty;
    property MaintMode: string read FMaintMode write SetMaintMode;
    property CountList: string read FCountList write SetCountList;
    property PartDesc: string read FPartDesc write SetPartDesc;
    property CountListItems: TStringList read FCountListItems write SetCountListItems;
    property IsJob: boolean read FIsJOb write SetIsJOb;
    property CountBin: string read FCountBin write SetCountBin;
    property PriorLot: string read FPriorLot write SetPriorLot;
    property CountLot: string read FCountLot write SetCountLot;
    property SerialNoInUse: boolean read FSerialNoInUse write SetSerialNoInUse;
    property BinsInUse: boolean read FBinsInUse write SetBinsInUse;
    property LotsInUse: boolean read FLotsInUse write SetLotsInUse;
    property SerialNoItems: TStringList read FSerialNoItems write SetSerialNoItems;
    property PartStore: integer read FPartStore write SetPartStore;
    property StockTakeNo: integer read FStockTakeNo write setStockTakeNo;
    property StoreStock: integer read fStoreStock write setStoreStock;
    property Packsize: integer read fPacksize write setPackSize;
    property CountPacksize: integer read fCountPacksize write setCountPackSize;
    property ActionTkn: string read fActionTkn write setActionTkn;
    { Public declarations }
  end;

var
  STStkTkItemFrm: TSTStkTkItemFrm;

implementation

uses
  System.UITypes,
  STStkTakeDM, STStockDM, STPrtMnt, StPacks;


{$R *.DFM}

procedure TSTStkTkItemFrm.SetPriorBin(const Value: string);
begin
  FPriorBin := Value;
  ABinEdit.text := FPriorBin;
end;

procedure TSTStkTkItemFrm.SetPriorQty(const Value: string);
begin
  FPriorQty := Value;
  if fpriorqty = '0' then
    AQtyEdit.text := fPriorQty
  else
    AQtyEdit.text := ShowinPacks(strtoint(FPriorQty), Packsize);
end;

procedure TSTStkTkItemFrm.SetPartCode(const Value: string);
begin
  FPartCode := Value;

  if FPartCode <> '' then
  begin
    with STStkTkDM.PartSQL do
    begin
      close;
      parambyname('Part').asstring := FPartCode;
      open;

      if recordcount = 0 then
        begin
          MessageDlg('Invalid Product Code', mterror,
            [mbOk], 0);
          PartEdit.setfocus;
        end;

      PartDesc := fieldbyname('Part_Description').asstring;
      DescriptionEdit.Text := fieldbyname('Part_Description').asstring;
      packsize := fieldByname('Purch_Pack_Quantity').Asinteger;
 //     Countpacksize := fieldByname('Purch_Pack_Quantity').Asinteger;
    end;
  PartEdit.Text := FPartCode;
  end;
end;

procedure TSTStkTkItemFrm.SetCountQty(const Value: string);
begin
  FCountQty := Value;
  if fCountqty = '0' then
    pQtyEdit.text := fcountqty
  else
    PQtyEdit.text := ShowinPacks(StrToInt(FCountQty), CountPacksize);
end;

procedure TSTStkTkItemFrm.OKBtnClick(Sender: TObject);
var
  icount: integer;
  sText: string;
  Index: integer;
begin

  sText := PartCode + ';'+PriorBin;

  if MaintMode = 'A' then {Check that this item has not been added before}
    begin
(*      {Check that Part and bin exist on Counting list}
      if not ValidCountingItem then
        begin
          MessageDlg('Invalid Product and Bin Counting combination, please review the details', mterror,
            [mbOk], 0);
          exit;
        end;
*)
      {Check that Part and Bin have not been entered before}
      for icount := 0 to FCountListItems.count -1 do
        begin
          if FCountListItems.Find(stext,Index) then
            begin
              MessageDlg('This Product and Bin combination has already been entered as a Counting exception, please review the details', mtError,
                [mbOk], 0);
              exit;
            end;
        end;
    end;

  {Check for valid CountingBin}
  if CountBin <> '' then
    if not STStkTkDM.validBin(PartStore,CountBin) then
      begin
        MessageDlg('This is not a valid Bin for this store', mterror,
          [mbOk], 0);
        PBinEdit.setfocus;
        exit;
      end;

  {Check for valid Counting Lot}
  if flotsinuse then
    begin
      if (CountLot <> '') and (priorLot <> '') and(fmaintmode <> 'A') and not (fserialnoinuse) then
        if not STStkTkDM.validlot(PartCode,CountLot) then
        begin
          MessageDlg('Invalid Lot Number for this product', mterror,
            [mbOk], 0);
          PLotEdit.setfocus;
          exit;
        end;
    end;
  {Check that no duplicate Serial numbers exist}
  {need to check if prior lot is null then this doesn't have a store stock value and therefore cannot be checked.}
  {Build the Serial number List}
  BuildLotList;

  modalresult := mrOK;
  CountPacksize := StrToInt(EditCountPacksize.text);
  if pqtyedit.text = '0' then
    countqty := pqtyedit.text
  else
    CountQty := IntToStr(InpToSing(PQtyEdit.text, CountPacksize));
end;

procedure TSTStkTkItemFrm.FormShow(Sender: TObject);
begin
  if (MaintMode = 'A') or (partedit.text = '') then
    begin
      AllocGroupBox.enabled := False;
      PartBitBtn.enabled := True;
      PartEdit.Setfocus;
    end
  else
    begin
      EditPacksize.Text := IntToStr(Packsize);
      EditCountPackSize.Text := IntToStr(CountPacksize);
      PartBitBtn.enabled := False;
      PQtyEdit.Setfocus;
    end;
  if fSerialNoInUse then
    begin
      PlotLbl.Caption := 'Ser. No';
      ALotLbl.Caption := 'Ser. No';
    end;
  EnableOK;

end;

procedure TSTStkTkItemFrm.SetMaintMode(const Value: string);
begin
  FMaintMode := Value;

  if FMaintMode = 'A' then
    begin
      Caption := 'Add Counting Details';
    end
  else
  if FMaintMode = 'C' then
    begin
      PartEdit.ReadOnly := true;
      ABinEdit.ReadOnly := true;
      PBinEdit.ReadOnly := true;
      Caption := 'Change Counting Details';
    end;
end;

procedure TSTStkTkItemFrm.EnableOK;
begin
  OKBtn.Enabled := false;
  if (PartEdit.text = '') or
    (PQtyEdit.text = '') or
    (pQtyEdit.Text = '') or
    (PBinEdit.text = '') and
    (BinsInUse) or
    (PLotEdit.text = '') and
    (LotsInUse)then
    exit;      
  OKBtn.Enabled := true;
end;

procedure TSTStkTkItemFrm.PartEditExit(Sender: TObject);
begin
  if (CancelBtn.focused = true) or
      (PartEdit.text = '') then exit;
  if MaintMode = 'C' then exit;
  PartCode := PartEdit.text;
  EnableOK;
end;

procedure TSTStkTkItemFrm.PQtyEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  EnableOK;
end;

procedure TSTStkTkItemFrm.SetCountList(const Value: string);
begin
  FCountList := Value;
  with STStkTkDM.CountDtlsSQl do
    begin
      close;
      parambyname('Stock_Take_Ref').asstring := FCountList;
      open;
    end;
end;

procedure TSTStkTkItemFrm.ABinEditExit(Sender: TObject);
begin
  if CancelBtn.focused = true then exit;
  if MaintMode = 'C' then exit;
  PriorBin := ABinEdit.text;
end;

procedure TSTStkTkItemFrm.SetPartDesc(const Value: string);
begin
  FPartDesc := Value;
end;

function TSTStkTkItemFrm.ValidCountingItem: boolean;
begin

  with STStkTkDM.CountPartDtlsSQL do
    begin
      close;
      parambyname('Stock_Take_Ref').asstring := Countlist;
      parambyname('Part').asstring := PartCode;
      parambyname('Part_Bin').asstring := CountBin;
      parambyName('Part_Lot').asString := CountLot;
      open;

      if recordcount = 0 then
        begin
          result := false;
          exit;
        end;
    end;
  result := true;
end;

procedure TSTStkTkItemFrm.FormCreate(Sender: TObject);
begin
  {Create lot string list}
(*  FLotItems := TStringList.create;
  FLotItems.Duplicates := dupError;
*)
  FSerialNoItems := TStringList.create;
  FSerialNoItems.Duplicates := dupError;

  FCountListItems := TStringList.create;
  STStockDataMod := TSTStockDataMod.Create(Self);
  end;

procedure TSTStkTkItemFrm.SetCountListItems(const Value: TStringList);
begin
  FCountListItems := Value;
end;

procedure TSTStkTkItemFrm.BuildLotList;
begin
  SerialNoItems.Clear;

  {Don't add to list if nothing to Count}
  if strtoint(CountQty) = 0 then exit;
end;

procedure TSTStkTkItemFrm.PQtyEditKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'9':;
    ':':;
    #8:
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TSTStkTkItemFrm.SetIsJOb(const Value: boolean);
begin
  FIsJOb := Value;
end;

procedure TSTStkTkItemFrm.SetCountBin(const Value: string);
begin
  FCountBin := Value;
  PBinEdit.Text := FCountBin;
end;

procedure TSTStkTkItemFrm.SetPriorLot(const Value: string);
begin
  FPriorLot := Value;
  ALotEdit.Text := FPriorLot;
end;

procedure TSTStkTkItemFrm.SetCountLot(const Value: string);
begin
  FCountLot := Value;
  PLotEdit.Text := FCountLot;
end;

procedure TSTStkTkItemFrm.SetBinsInUse(const Value: boolean);
begin
  FBinsInUse := Value;
  ABinEdit.Visible := FBinsInUse;
  PBinEdit.Visible := FBinsInUse;
  ABinLbl.Visible := FBinsInUse;
  PBinLbl.Visible := FBinsInUse;

  {Set the height of the Prior and Counting Group Boxes}
  if BinsInUse then
    begin
      AllocGroupBox.Height := 81;
      CountgroupBox.Height := 81;
    end
  else
    begin
      AllocGroupBox.Height := 48;
      CountgroupBox.Height := 48;
    end;
end;

procedure TSTStkTkItemFrm.SetLotsInUse(const Value: boolean);
begin
  FLotsInUse := Value;
  AlotEdit.Visible := FLotsInUse;
  PlotEdit.Visible := FLotsInUse;
  ALotLbl.Visible := FLotsInUse;
  PlotLbl.Visible := FLotsInUse;

  {Re-position Lot Edit box and label}
  if BinsInUse then
    begin
      AlotEdit.Top := ABinEdit.Top + 31;
      PlotEdit.Top := PBinEdit.Top + 31;
      ALotLbl.Top := ABinLbl.Top + 31;
      PLotLbl.Top := PBinLbl.Top + 31;
    end;

  {Set the height of the Prior and Counting Group Boxes}
  if LotsInUse then
    begin
      AllocGroupBox.Height := ALotEdit.Top + ALotEdit.Height + 8;
      CountgroupBox.Height := ALotEdit.Top + ALotEdit.Height + 8;
    end
  else
    begin
      AllocGroupBox.Height := ALotEdit.Top;
      CountgroupBox.Height := ALotEdit.Top;
    end;
end;

procedure TSTStkTkItemFrm.SetSerialNoInUse(const Value: boolean);
begin
  FSerialNoInUse := Value;
  if SerialNoInUse then
    begin
    LotsInUse := True;
    Plotedit.ReadOnly := False;
    PLotedit.Maxlength := 20;
    end;

      STStkTkItemFrm.Height := AllocGroupBox.Top + AllocGroupBox.Height + 75;
repositionokbtn;
end;

procedure TSTStkTkItemFrm.SetSerialNoItems(const Value: TStringList);
begin
  FSerialNoItems := Value;
end;

procedure TSTStkTkItemFrm.RePositionOKBtn;
begin
  OKBtn.Top := Height-66;
  CancelBtn.top := Height-66;
end;

procedure TSTStkTkItemFrm.PBinEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CountBin := PBinEdit.Text;
  EnableOK;
end;

procedure TSTStkTkItemFrm.PLotEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CountLot := PLotEdit.Text;
  EnableOK;
end;

procedure TSTStkTkItemFrm.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
end;

procedure TSTStkTkItemFrm.setActionTkn(const Value: string);
begin
  fActionTkn := Value;
end;

procedure TSTStkTkItemFrm.setStockTakeNo(const Value: integer);
begin
  FStockTakeNo := Value;
end;

procedure TSTStkTkItemFrm.PQtyEditClick(Sender: TObject);
begin
{if (SerialNoInUse) and (maintmode <>'A' )then
 begin
 MessageDlg('Cannot amend quantity for serialised parts', mterror,
            [mbOk], 0);
 if okbtn.enabled then
  OkBtn.setfocus;
end; }
end;

procedure TSTStkTkItemFrm.PartBitBtnClick(Sender: TObject);
begin
STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
Try
   STPrtMntFrm.bIs_LookUp := True ;
   STPrtMntFrm.sCode := PartEdit.Text ;
   STPrtMntFrm.ShowModal ;
   If STPrtMntFrm.bOK = True then
      begin
      PartEdit.Text := STPrtMntFrm.sCode ;
      PartCode := STPrtMntFrm.sCode;
      DescriptionEdit.Text := STPrtMntFrm.sCodeDescr ;
      PartDesc := DescriptionEdit.text;
      Packsize := StSTkTkDM.GetPacksize(Partcode);
      CountPackSize := Packsize;
//      PriorQty := '1' ;
//      CountQty := '1' ;
      SerialNoInUse := STStkTkDM.GetSerial(PartCode);
      EditPacksize.Text := IntToStr(Packsize);
      EditCountPackSize.Text := IntToStr(CountPacksize);
      end;
Finally
   STPrtMntFrm.Free ;
   end;
   If (fLotsInUse) and (not SerialNoInUse) then
      begin
        CountLot := STStockDataMod.GetNextLot(PartEdit.Text);
        PLotEdit.Text := CountLot;
        Enableok;
      end;
  If SerialNoInUse then
    begin
      PLotEdit.Enabled := True;
      Enableok;
    end;
Enableok;
end;

procedure TSTStkTkItemFrm.PQtyEditChange(Sender: TObject);
begin
//if (SerialNoInUse) and (maintmode ='A' ) then
//  begin
//    Countqty := IntToStr(inpToSing(pQtyEdit.text, packsize)) ;
//  end;
{if (SerialNoInUse) and (maintmode ='A' ) and (PQtyEdit.Text > '1')then
 begin
 MessageDlg('Quantity must be 1 for serialised parts', mterror,
            [mbOk], 0);  }
end;

procedure TSTStkTkItemFrm.FormDestroy(Sender: TObject);
begin
  STStockDataMod.Free
end;

procedure TSTStkTkItemFrm.PLotEditExit(Sender: TObject);
begin
     If SerialNoInUse then
      begin
      If ValidCountingItem then
      begin
        MessageDlg('This Serial No already exists please check the number entered', mterror,
          [mbOk], 0);
        PLotEdit.setfocus;
        exit;
      end;
    end;
end;

procedure TSTStkTkItemFrm.setStoreStock(const Value: integer);
begin
  fStoreStock := Value;
end;

procedure TSTStkTkItemFrm.setPackSize(const Value: integer);
begin
  fPacksize := Value;
end;

procedure TSTStkTkItemFrm.EditCountPackSizeKeyPress(Sender: TObject;
  var Key: Char);
begin
  case key of
    '0'..'9':
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TSTStkTkItemFrm.EditCountPackSizeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EnableOK;
end;

procedure TSTStkTkItemFrm.setCountPackSize(const Value: integer);
begin
  fCountPacksize := Value;
end;

end.
