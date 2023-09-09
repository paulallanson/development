unit STPickItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, StPacks;

type
  TSTPickItemFrm = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    PartEdit: TEdit;
    DescriptionEdit: TEdit;
    Label3: TLabel;
    SerialGrid: TStringGrid;
    SerialNoLbl: TLabel;
    AllocGroupBox: TGroupBox;
    ABinLbl: TLabel;
    ABinEdit: TEdit;
    Label5: TLabel;
    PickGroupBox: TGroupBox;
    PBinLbl: TLabel;
    PBinEdit: TEdit;
    Label6: TLabel;
    PLotEdit: TEdit;
    ALotEdit: TEdit;
    ALotLbl: TLabel;
    PLotLbl: TLabel;
    AQtyEdit: TEdit;
    PQtyEdit: TEdit;
    EdtPackSize: TEdit;
    Label2: TLabel;
    btnLUPartBinLot: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PartEditExit(Sender: TObject);
    procedure PQtyEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ABinEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SerialGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuildLotList;
    procedure BuildSerialGrid;
    procedure SerialGridDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PQtyEditKeyPress(Sender: TObject; var Key: Char);
    procedure RePositionOKBtn;
    procedure PBinEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PLotEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLUPartBinLotClick(Sender: TObject);
  private
    FPartCode: string;
    FAllocatedBin: string;
    FPickQty: integer;
    FAllocatedQty: integer;
    FMaintMode: string;
    FPickList: string;
    FPartDesc: string;
    FPickListItems: TStringList;
    FIsJOb: boolean;
    FPickBin: string;
    FPickLot: string;
    FAllocatedLot: string;
    FSerialNoInUse: boolean;
    FBinsInUse: boolean;
    FLotsInUse: boolean;
    FSerialNoItems: TStringList;
    FPartStore: integer;
    fPacksize: integer;
    fAllocatedQtyinPacks: string;
    fPickQtyinPacks: string;
    FPaidStock: boolean;
    procedure SetPartCode(const Value: string);
    procedure SetAllocatedBin(const Value: string);
    procedure SetAllocatedQty(const Value: integer);
    procedure SetPickQty(const Value: integer);
    procedure SetMaintMode(const Value: string);
    procedure EnableOK;
    procedure SetPickList(const Value: string);
    procedure SetPartDesc(const Value: string);
    procedure SetPickListItems(const Value: TStringList);
    function DuplicateLots: boolean;
    procedure SetIsJOb(const Value: boolean);
    procedure SetPickBin(const Value: string);
    procedure SetAllocatedLot(const Value: string);
    procedure SetPickLot(const Value: string);
    procedure SetBinsInUse(const Value: boolean);
    procedure SetLotsInUse(const Value: boolean);
    procedure SetSerialNoInUse(const Value: boolean);
    procedure SetSerialNoItems(const Value: TStringList);
    procedure SetPartStore(const Value: integer);
    procedure setAllocatedQtyinPacks(const Value: string);
    procedure setPacksize(const Value: integer);
    procedure setPickQtyinPacks(const Value: string);
    procedure SetPaidStock(const Value: boolean);
    { Private declarations }
  public
    property PartCode: string read FPartCode write SetPartCode;
    property PaidStock: boolean read FPaidStock write SetPaidStock;
    property AllocatedBin: string read FAllocatedBin write SetAllocatedBin;
    property AllocatedQty: integer read FAllocatedQty write SetAllocatedQty;
    property AllocatedQtyinPacks: string read fAllocatedQtyinPacks write setAllocatedQtyinPacks;
    property PickQtyinPacks: string read fPickQtyinPacks write setPickQtyinPacks;
    property Packsize : integer read fPacksize write setPacksize;
    property PickQty: integer read FPickQty write SetPickQty;
    property MaintMode: string read FMaintMode write SetMaintMode;
    property PickList: string read FPickList write SetPickList;
    property PartDesc: string read FPartDesc write SetPartDesc;
    property PickListItems: TStringList read FPickListItems write SetPickListItems;
    property IsJob: boolean read FIsJOb write SetIsJOb;
    property PickBin: string read FPickBin write SetPickBin;
    property AllocatedLot: string read FAllocatedLot write SetAllocatedLot;
    property PickLot: string read FPickLot write SetPickLot;
    property SerialNoInUse: boolean read FSerialNoInUse write SetSerialNoInUse;
    property BinsInUse: boolean read FBinsInUse write SetBinsInUse;
    property LotsInUse: boolean read FLotsInUse write SetLotsInUse;
    property SerialNoItems: TStringList read FSerialNoItems write SetSerialNoItems;
    property PartStore: integer read FPartStore write SetPartStore;
    { Public declarations }
  end;

var
  STPickItemFrm: TSTPickItemFrm;

implementation

uses
  System.UITypes,
  stPickingDM, STLUPartBinLot;

{$R *.DFM}

procedure TSTPickItemFrm.SetAllocatedBin(const Value: string);
begin
  FAllocatedBin := Value;
  ABinEdit.text := FAllocatedBin;
end;

procedure TSTPickItemFrm.SetAllocatedQty(const Value: integer);
begin
  FAllocatedQty := Value;
 end;

procedure TSTPickItemFrm.SetPartCode(const Value: string);
begin
  FPartCode := Value;

  with stPickDM.PartSQL do
    begin
      close;
      parambyname('Part').asstring := FPartCode;
      open;

      if recordcount = 0 then
        begin
          MessageDlg('Invalid Part Code', mterror,
            [mbOk], 0);
          PartEdit.setfocus;
        end;

      PartDesc := fieldbyname('Part_Description').asstring;
      DescriptionEdit.Text := fieldbyname('Part_Description').asstring;
    end;
  PartEdit.Text := FPartCode;
end;

procedure TSTPickItemFrm.SetPickQty(const Value: integer);
var
  icount: integer;
begin
  FPickQty := Value;
  if (PickQtyinPacks = '') or (AllocatedQtyinPacks = '') then exit;
  if not fserialNoInuse then exit;
  if PickQty > AllocatedQty then exit;

  if PickQty =0 then
    begin
      for icount := 0 to pred(SerialGrid.rowcount) do
      begin
        SerialGrid.cells[0,icount] := '';
        SerialGrid.cells[1,icount] := '';
      end;
      SerialGrid.rowcount := 1;
      SerialGrid.options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect];
    end
  else
    begin
      SerialGrid.options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goEditing];

(*      {Don't display more than 10 rows}
      if strtoint(PickQty) > 10 then
        SerialGrid.Rowcount := 10
      else
*)
      SerialGrid.RowCount := PickQty;

      {Set the numbers for the Grid}
      for icount := 0 to pred(SerialGrid.rowcount) do
        begin
          SerialGrid.cells[0,icount] := inttostr(icount+1);
        end;
    end;
end;

procedure TSTPickItemFrm.OKBtnClick(Sender: TObject);
var
  icount: integer;
  sText: string;
  Index: integer;
begin

  sText := PartCode + ';'+AllocatedBin;

  if MaintMode = 'A' then {Check that this item has not been added before}
    begin
(*      {Check that Part and bin exist on picking list}
      if not ValidPickingItem then
        begin
          MessageDlg('Invalid Part and Bin picking combination, please review the details', mterror,
            [mbOk], 0);
          exit;
        end;
*)
      {Check that Part and Bin have not been entered before}
      for icount := 0 to FPickListItems.count -1 do
        begin
          if FPickListItems.Find(stext,Index) then
            begin
              MessageDlg('This Part and Bin combination has already been entered as a picking exception, please review the details', mtError,
                [mbOk], 0);
              exit;
            end;
        end;
    end;

  {Check for valid PickingBin}
  if (PickBin <> '') and (PickLot <> '') then
    begin
      if not stpickDM.validPickBinLot(PartStore,PickBin,PickLot,PartCode) then
      begin
        MessageDlg('Invalid Picking Bin/Lot combination', mterror, [mbok], 0);
        PLotEdit.setfocus;
        exit;
      end;
    end;

  if (PickBin <> '') and (Picklot = '') then
    if not stPickDm.ValidPickBin(PartStore,PickBin) then
      begin
        MessageDlg('Invalid Picking Bin', mterror,
          [mbOk], 0);
        PBinEdit.setfocus;
        exit;
      end;

  {Check for valid Picking Lot}
  if (PickLot <> '') and (PickBin = '') then
    if not stPickDm.ValidPickLot(PartCode,PickLot) then
      begin
        MessageDlg('Invalid Lot Number for this part', mterror,
          [mbOk], 0);
        PLotEdit.setfocus;
        exit;
      end;

  {Check for valid quantity}
{  if PickQty > AllocatedQty then
    begin
      MessageDlg('Picked Quantity cannot be greater than the Allocated Quantity', mterror,
        [mbOk], 0);
      PQtyEdit.setfocus;
      exit;
    end; }

  {Check for valid quantity}
  if IsJob then
    if (PickQty <> AllocatedQty) and
       (PickQty <> 0) then
    begin
      MessageDlg('Picked Quantity must be the Allocated Quantity or a zero quantity', mterror,
        [mbOk], 0);
      PQtyEdit.setfocus;
      exit;
    end;

  {Check that no duplicate Serial numbers exist}
  if (FSerialNoInUSe) then
    begin
      if DuplicateLots = true then
      begin
        MessageDlg('Duplicate '+SerialNoLbl.Caption + ' exist, please check the numbers entered', mterror,
          [mbOk], 0);
        SerialGrid.setfocus;
        exit;
      end;
    end;

  {Build the Serial number List}
  BuildLotList;

  modalresult := mrOK;
  PickQtyinPacks := PQtyEdit.text;
  PickQty := inpToSing(PickQtyinPacks,Packsize);
end;

procedure TSTPickItemFrm.FormShow(Sender: TObject);
begin
  if MaintMode = 'A' then
    PartEdit.Setfocus
  else
    begin
      BuildSerialGrid;
      PQtyEdit.Setfocus;
    end;
  EnableOK;
end;

procedure TSTPickItemFrm.SetMaintMode(const Value: string);
begin
  FMaintMode := Value;

  btnLUPartBinLot.visible := FMaintMode = 'A';

  if FMaintMode = 'A' then
    begin
      Caption := 'Add Picking Details';
    end
  else
  if FMaintMode = 'C' then
    begin
      PartEdit.ReadOnly := true;
      ABinEdit.ReadOnly := true;
      Caption := 'Change Picking Details';
    end;
end;

procedure TSTPickItemFrm.EnableOK;
var
  icount: integer;
begin
  OKBtn.Enabled := false;
  if (PartEdit.text = '') or
    (PQtyEdit.text = '') or
    (PBinEdit.text = '') and
    (BinsInUse) or
    (PLotEdit.text = '') and
    (LotsInUse)then
    exit;

  if (FSerialNoInUSe) and (PickQty > 0) then
    with SerialGrid do
      for icount := 0 to rowcount - 1 do
        begin
          if cells[1,icount] = '' then exit;
        end;

  OKBtn.Enabled := true;
end;

procedure TSTPickItemFrm.PartEditExit(Sender: TObject);
begin
  if (CancelBtn.focused = true) or
      (PartEdit.text = '') then exit;
  if MaintMode = 'C' then exit;
  PartCode := PartEdit.text;
  EnableOK;
end;

procedure TSTPickItemFrm.PQtyEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var iSlashPos: integer;
begin
iSlashPos := Pos(':',PQtyEdit.text);
if iSlashPos = length(PQtyEdit.text) then
  exit;
PickQtyinPacks := PQtyEdit.text;
  if pickqtyinpacks = '0' then
    Pickqty := 0
else
    Pickqty := InpToSing(PickQtyinPacks,Packsize);
  EnableOK;
end;

procedure TSTPickItemFrm.SetPickList(const Value: string);
begin
  FPickList := Value;
  with stPickDM.PickDtlsSQl do
    begin
      close;
      parambyname('Picking_List_Ref').asstring := FPickList;
      open;
    end;
end;

procedure TSTPickItemFrm.ABinEditExit(Sender: TObject);
begin
  if CancelBtn.focused = true then exit;
  if MaintMode = 'C' then exit;
  AllocatedBin := ABinEdit.text;
end;

procedure TSTPickItemFrm.SetPartDesc(const Value: string);
begin
  FPartDesc := Value;
end;

procedure TSTPickItemFrm.FormCreate(Sender: TObject);
begin
  {Create lot string list}
(*  FLotItems := TStringList.create;
  FLotItems.Duplicates := dupError;
*)
  FSerialNoItems := TStringList.create;
  FSerialNoItems.Duplicates := dupError;

  FPickListItems := TStringList.create;
end;

procedure TSTPickItemFrm.SetPickListItems(const Value: TStringList);
begin
  FPickListItems := Value;
end;

procedure TSTPickItemFrm.SerialGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EnableOK;
end;

procedure TSTPickItemFrm.BuildLotList;
var
  icount: integer;
begin
  if not (FSerialNoInUSe) then
    exit;
  SerialNoItems.Clear;

  {Don't add to list if nothing to pick}
  if PickQty = 0 then exit;
  with SerialGrid do
    for icount := 0 to rowcount -1 do
      begin
        if cells[1,icount] = '' then continue;
        SerialNoItems.Add(cells[1,icount]);
      end;
end;

procedure TSTPickItemFrm.BuildSerialGrid;
var
  icount: integer;
begin
  if not (FSerialNoInUSe) then
    exit;
  SerialGrid.rowcount := PickQty;
  with SerialGrid do
    for icount := 0 to pred(SerialNoItems.count) do
      begin
        cells[1,icount] := SerialNoItems.strings[icount];
      end;
end;

procedure TSTPickItemFrm.SerialGridDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
begin
	{Code extracted from the Delphi Info base No 609}
	IF Sender = ActiveControl THEN Exit;
    IF NOT (gdSelected IN State) THEN Exit;
    WITH Sender AS TStringGrid DO
      BEGIN
        Canvas.Brush.Color := Color;
        Canvas.Font.Color  := Font.Color;
        Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
          Cells[vCol, vRow]);
      END;

end;

function TSTPickItemFrm.DuplicateLots: boolean;
var
  icount: integer;
begin
  Result := false;  {No duplicates}
  SerialNoItems.Clear;
  SerialNoItems.Sorted := true;

  {Don't add to list if nothing to pick}
  if PickQty = 0 then exit;
  with SerialGrid do
    for icount := 0 to rowcount -1 do
      begin
        if cells[1,icount] = '' then continue;
        {Don't allow duplicate entries}
        try
          SerialNoItems.Add(cells[1,icount]);
        except
          on EStringListError do
            Result := true;
        end;
      end;
end;

procedure TSTPickItemFrm.PQtyEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39,58: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TSTPickItemFrm.SetIsJOb(const Value: boolean);
begin
  FIsJOb := Value;
end;

procedure TSTPickItemFrm.SetPickBin(const Value: string);
begin
  FPickBin := Value;
  PBinEdit.Text := FPickBin;
end;

procedure TSTPickItemFrm.SetAllocatedLot(const Value: string);
begin
  FAllocatedLot := Value;
  ALotEdit.Text := FAllocatedLot;
end;

procedure TSTPickItemFrm.SetPickLot(const Value: string);
begin
  FPickLot := Value;
  PLotEdit.Text := FPickLot;
end;

procedure TSTPickItemFrm.SetBinsInUse(const Value: boolean);
begin
  FBinsInUse := Value;
  ABinEdit.Visible := FBinsInUse;
  PBinEdit.Visible := FBinsInUse;
  ABinLbl.Visible := FBinsInUse;
  PBinLbl.Visible := FBinsInUse;

  {Set the height of the Allocated and Picking Group Boxes}
  if BinsInUse then
    begin
      AllocGroupBox.Height := 81;
      PickGroupBox.Height := 81;
    end
  else
    begin
      AllocGroupBox.Height := 48;
      PickGroupBox.Height := 48;
    end;
end;

procedure TSTPickItemFrm.SetLotsInUse(const Value: boolean);
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

  {Set the height of the Allocated and Picking Group Boxes}
  if LotsInUse then
    begin
      AllocGroupBox.Height := ALotEdit.Top + ALotEdit.Height + 8;
      PickGroupBox.Height := ALotEdit.Top + ALotEdit.Height + 8;
    end
  else
    begin
      AllocGroupBox.Height := ALotEdit.Top;
      PickGroupBox.Height := ALotEdit.Top;
    end;
end;

procedure TSTPickItemFrm.SetSerialNoInUse(const Value: boolean);
var
  iheight: integer;
  icount: integer;
begin
  FSerialNoInUse := Value;

  if not SerialNoInUse then
    begin
      stPickItemFrm.Height := AllocGroupBox.Top + AllocGroupBox.Height + 75;
    end
  else
    begin
      LotsInUse := false;

      with SerialGrid do
        begin
          Visible := true;
          colwidths[0] := 30;
          colwidths[1] := 210;
          Rowcount := PickQty;
          if AllocatedQty > 10 then
            iHeight := 10
          else
            iHeight := AllocatedQty;

          Height := (23*iHeight)+3;
          Top := AllocGroupBox.Top + AllocGroupBox.Height + 16;

          for icount := 0 to pred(rowcount) do
            begin
              cells[0,icount] := inttostr(icount+1);
            end;
        end;

      SerialNoLbl.Visible := true;
      SerialNoLbl.Top := SerialGrid.Top;
      stPickItemFrm.Height := SerialGrid.Top + 16
                         + SerialGrid.Height+76;
    end;
  RePositionOKBtn;
end;

procedure TSTPickItemFrm.SetSerialNoItems(const Value: TStringList);
begin
  FSerialNoItems := Value;
end;

procedure TSTPickItemFrm.RePositionOKBtn;
begin
  OKBtn.Top := Height-66;
  CancelBtn.top := Height-66;
end;

procedure TSTPickItemFrm.PBinEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PickBin := PBinEdit.Text;
  EnableOK;
end;

procedure TSTPickItemFrm.PLotEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PickLot := PLotEdit.Text;
  EnableOK;
end;

procedure TSTPickItemFrm.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
end;

procedure TSTPickItemFrm.setAllocatedQtyinPacks(const Value: string);
begin
  fAllocatedQtyinPacks := Value;
   AQtyEdit.text := FAllocatedQtyinPacks;
end;

procedure TSTPickItemFrm.setPacksize(const Value: integer);
begin
  fPacksize := Value;
  EdtPackSize.Text := IntToStr(Packsize);
end;

procedure TSTPickItemFrm.setPickQtyinPacks(const Value: string);
begin
  fPickQtyinPacks := Value;
  PQtyEdit.text := FPickQtyinPacks;
end;

procedure TSTPickItemFrm.btnLUPartBinLotClick(Sender: TObject);
begin
  STLUPartBinLotFrm := TSTLUPartBinLotFrm.create(self);
  try
    STLUPartBinLotFrm.bIs_Lookup := true;
    STLUPartBinLotFrm.Part := self.PartCode;
    STLUPartBinLotFrm.PartBin := self.PickBin;
    STLUPartBinLotFrm.sPartLot := PLotEdit.Text;
    STLUPartBinLotFrm.showmodal;
    if STLUPartBinLotFrm.Selected then
      begin
        PlotEdit.Text := STLUPartBinLotFrm.sPartLot;
        PaidStock := STLUPartBinLotFrm.PaidStock;
        PickLot := PLotEdit.Text;

        enableok;
      end;
  finally
    STLUPartBinLotFrm.free;
  end;
end;

procedure TSTPickItemFrm.SetPaidStock(const Value: boolean);
begin
  FPaidStock := Value;
end;

end.
