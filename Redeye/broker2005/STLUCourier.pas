unit STLUCourier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUCourierFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    btnServices: TBitBtn;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    BitBtn1: TBitBtn;
    SearchTimer: TTimer;
    chkbxActiveOnly: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnServicesClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool ;
  public
    AddressReq: boolean;
    ReturnAddressReq: boolean;
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  STLUCourierFrm: TSTLUCourierFrm;

implementation

uses UITypes, STMaintCourier, STLUCourierServ, pbDatabase, pbMainMenu, STLUCourierSort, STLUCourierSpeed;

{$R *.DFM}

procedure TSTLUCourierFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Courier';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Couriers';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  btnServices.Visible := (bAllow_Upd);

  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuCouriers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TSTLUCourierFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%' ;
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;

    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    btnServices.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TSTLUCourierFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False ;
  ShowGrid(Self) ;
end;

procedure TSTLUCourierFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TSTLUCourierFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TSTLUCourierFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Courier').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Courier_Name').AsString;
  AddressReq := DetsSRC.DataSet.FieldByName('Delivery_Address_Req').AsString = 'Y';
  ReturnAddressReq := DetsSRC.DataSet.FieldByName('Return_Address_Required').AsString = 'Y';
  Selected := True;
  Close;
end;

procedure TSTLUCourierFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
  end
  else
    chgbitbtnclick(Self);
end;

procedure TSTLUCourierFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Courier};
  CallMaintScreen('A');
end;

procedure TSTLUCourierFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Courier};
  CallMaintScreen('C');
end;

procedure TSTLUCourierFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Courier};
  CallMaintScreen('D');
end;

procedure TSTLUCourierFrm.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
begin
  STMaintCourierFrm := TSTMaintCourierFrm.Create(Self);
  try
    STMaintCourierFrm.sFuncMode := sTempFuncMode;
    STMaintCourierFrm.iCode := DetsSRC.DataSet.FieldByName('Courier').AsInteger;
    STMaintCourierFrm.NameEdit.Text := DetsSRC.DataSet.FieldByName('Courier_Name').AsString;
    STMaintCourierFrm.AccountEdit.Text := DetsSRC.DataSet.FieldByName('Our_Account_Code').AsString;
    STMaintCourierFrm.edtFileType.text := DetsSRC.DataSet.FieldByName('courier_file_type').AsString;
    STMaintCourierFrm.chkbxAddressRequired.checked := (DetsSRC.DataSet.FieldByName('Delivery_Address_Req').AsString = 'Y');
    STMaintCourierFrm.chkbxReturnAddress.checked := (DetsSRC.DataSet.FieldByName('Return_Address_Required').AsString = 'Y');
    STMaintCourierFrm.chkbxAccountCodeMandatory.checked := (DetsSRC.DataSet.FieldByName('Customer_Account_Mandatory').AsString = 'Y');
    STMaintCourierFrm.chkbxActive.checked := (DetsSRC.DataSet.FieldByName('inactive').AsString = 'N') or (DetsSRC.DataSet.FieldByName('inactive').AsString = '');

    STMaintCourierFrm.sFuncMode := sTempFuncMode;
    STMaintCourierFrm.ShowModal;
    iTempSel := STMaintCourierFrm.iSelCode;
  finally
    STMaintCourierFrm.Free;
  end;
  if iTempSel <> 0 then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TSTLUCourierFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Courier').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TSTLUCourierFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  AddressReq := false;
end;

procedure TSTLUCourierFrm.btnServicesClick(Sender: TObject);
var
  STLUCourierServFrm: TSTLUCourierServFrm;
begin
  STLUCourierServFrm := TSTLUCourierServFrm.Create(Self);
  try
    STLUCourierServFrm.bIs_Lookup := False;
    STLUCourierServFrm.bAllow_Upd := True;
    STLUCourierServFrm.CourierCode := DetsSRC.DataSet.FieldByName('courier').AsInteger;
    STLUCourierServFrm.CourierName := DetsSRC.DataSet.FieldByName('courier_name').AsString;
    STLUCourierServFrm.ShowModal;
  finally
    STLUCourierServFrm.Free;
  end;
end;

procedure TSTLUCourierFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent = True then exit ;
  SearchTimer.Enabled := False ;
  SearchTimer.Enabled := True ;
end;

procedure TSTLUCourierFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TSTLUCourierFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(detsDBgrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TSTLUCourierFrm.BitBtn2Click(Sender: TObject);
var
  STLUCourierSortFrm: TSTLUCourierSortFrm;
begin
  STLUCourierSortFrm := TSTLUCourierSortFrm.Create(Self);
  try
    STLUCourierSortFrm.bIs_Lookup := False;
    STLUCourierSortFrm.bAllow_Upd := True;
    STLUCourierSortFrm.CourierCode := DetsSRC.DataSet.FieldByName('courier').AsInteger;
    STLUCourierSortFrm.CourierName := DetsSRC.DataSet.FieldByName('courier_name').AsString;
    STLUCourierSortFrm.ShowModal;
  finally
    STLUCourierSortFrm.Free;
  end;
end;

procedure TSTLUCourierFrm.BitBtn3Click(Sender: TObject);
var
  STLUCourierSpeedFrm: TSTLUCourierSpeedFrm;
begin
  STLUCourierSpeedFrm := TSTLUCourierSpeedFrm.Create(Self);
  try
    STLUCourierSpeedFrm.bIs_Lookup := False;
    STLUCourierSpeedFrm.bAllow_Upd := True;
    STLUCourierSpeedFrm.CourierCode := DetsSRC.DataSet.FieldByName('courier').AsInteger;
    STLUCourierSpeedFrm.CourierName := DetsSRC.DataSet.FieldByName('courier_name').AsString;
    STLUCourierSpeedFrm.ShowModal;
  finally
    STLUCourierSpeedFrm.Free;
  end;
end;

end.
