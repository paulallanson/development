unit STLUCourierServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUCourierServFrm = class(TForm)
    lblCourier: TLabel;
    DetsDBGrid: TDBGrid;
    CloseBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    SearchTimer: TTimer;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    chkbxActiveOnly: TCheckBox;
    CountLabel: TLabel;
    procedure ShowGrid(sender: TObject);
    procedure FindInGrid(service: integer);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure SelectCode;
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool ;
  public
    courierName, serviceDesc, serviceDescShort, serviceCode: string;
    courierCode, serviceNo: integer;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  STLUCourierServFrm: TSTLUCourierServFrm;

implementation

uses STMaintCourierServ;

{$R *.DFM}

procedure TSTLUCourierServFrm.FindInGrid(service: integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    while (not (EOF)) and (FieldByName('service_no').AsInteger <> service) do
      Next;
  end;
end;

procedure TSTLUCourierServFrm.ShowGrid(sender: TObject);
begin
  GetDetsSQL.Close;
  DetsSRC.DataSet := GetDetsSQL;
  with GetDetsSQL do
    begin
      Close;
      parambyname('courier').asinteger := CourierCode;
      ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%' ;
      if chkbxActiveOnly.Checked then
        ParamByName('inactive').AsString := 'N'
      else
        ParamByName('inactive').AsString := 'Y';
      open;

      ChgBitBtn.Enabled := RecordCount > 0;
      DelBitBtn.Enabled := RecordCount > 0;
      CountLabel.Caption := IntToStr(RecordCount) + ' items';
    end;

end;

procedure TSTLUCourierServFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  lblCourier.Caption := 'Courier: ' + courierName;
  {Load up the string grid};
  ShowGrid(Self);
end;

procedure TSTLUCourierServFrm.FormCreate(Sender: TObject);
begin
 serviceCode := '';
end;

procedure TSTLUCourierServFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
begin
  STMaintCourierServFrm := TSTMaintCourierServFrm.Create(Self);
  try
    STMaintCourierServFrm.sFuncMode := sTempFuncMode;
    STMaintCourierServFrm.courierCode := courierCode;
    STMaintCourierServFrm.courierName := courierName;
    STMaintCourierServFrm.serviceNo := serviceNo;
    STMaintCourierServFrm.serviceDesc := serviceDesc;
    STMaintCourierServFrm.serviceCode := serviceCode;
    STMaintCourierServFrm.serviceDescShort := serviceDescShort;
    STMaintCourierServFrm.chkbxactive.checked := (DetsSRC.DataSet.FieldByName('inactive').asString = 'N') or (DetsSRC.DataSet.FieldByName('inactive').asString = '');
    STMaintCourierServFrm.bDeferred := (DetsSRC.DataSet.FieldByName('Deferred_Service').asString = 'Y');

    STMaintCourierServFrm.ShowModal;
    bTempOK := (STMaintCourierServFrm.ModalResult = mrOK);
    self.serviceNo := STMaintCourierServFrm.serviceNo;
  finally
    STMaintCourierServFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(self.serviceNo);
      if bIs_Lookup then
        SelectCode;
    end;
  end;
end;

procedure TSTLUCourierServFrm.SelectCode;
begin
  self.courierCode := DetsSRC.DataSet.FieldByName('courier').asInteger;
  self.serviceNo := DetsSRC.DataSet.FieldByName('service_no').asInteger;
  self.serviceDesc := DetsSRC.DataSet.FieldByName('Service_Description').asString;
  self.serviceCode := DetsSRC.DataSet.FieldByName('Service_code').asString;
  self.serviceDescShort := DetsSRC.DataSet.FieldByName('Service_Short_Description').asString;
  bSelected := True;
  Close;
end;

procedure TSTLUCourierServFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode
  else
    chgbitbtnclick(Self);
end;

procedure TSTLUCourierServFrm.ChgBitBtnClick(Sender: TObject);
begin
  self.serviceNo := DetsSRC.DataSet.FieldByName('service_no').asInteger;
  self.serviceDesc := DetsSRC.DataSet.FieldByName('Service_Description').asString;
  self.serviceCode := DetsSRC.DataSet.FieldByName('Service_code').asString;
  self.serviceDescShort := DetsSRC.DataSet.FieldByName('Service_Short_Description').asString;

  CallMaintScreen('C');
end;

procedure TSTLUCourierServFrm.AddBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TSTLUCourierServFrm.DelBitBtnClick(Sender: TObject);
begin
  self.serviceNo := DetsSRC.DataSet.FieldByName('service_no').asInteger;
  self.serviceDesc := DetsSRC.DataSet.FieldByName('Service_Description').asString;
  self.serviceCode := DetsSRC.DataSet.FieldByName('Service_code').asString;
  self.serviceDescShort := DetsSRC.DataSet.FieldByName('Service_Short_Description').asString;

  CallMaintScreen('D');
end;

procedure TSTLUCourierServFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False ;
  ShowGrid(Self) ;
end;

procedure TSTLUCourierServFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent = True then exit ;
  SearchTimer.Enabled := False ;
  SearchTimer.Enabled := True ;
end;

procedure TSTLUCourierServFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TSTLUCourierServFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(detsDBgrid.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

end.
