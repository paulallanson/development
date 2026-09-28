unit PBLUSupOrdType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, CCSCommon,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSupOrdTypeFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    SuppLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    stsBrDets: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    iSupp: Integer;
    SelCode, SelName, sSuppName: string;
    bIs_Lookup, bAllow_Upd, bSelected, bODueEnqsOnly: ByteBool;
    dODueDate: TDateTime;
  end;

var
  PBLUSupOrdTypeFrm: TPBLUSupOrdTypeFrm;

implementation

uses PBMaintSupOrdType, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBLUSupOrdTypeFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  SuppLabel.Caption := 'Supplier: ' + sSuppName;
  {Load up the string grid};
  ShowGrid(Self);
  FindInGrid(SelCode);
end;

procedure TPBLUSupOrdTypeFrm.ShowGrid(Sender: TObject);
begin
  GetDetsSQL.Close;
  DetsSRC.DataSet := GetDetsSQL;
  with GetDetsSQL do
    begin
      Close;
      parambyname('Supplier').asinteger := iSupp;
    end;
  with DetsSRC.DataSet do
  begin
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    stsBrDets.Panels[0].text := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUSupOrdTypeFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUSupOrdTypeFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Supp_Order_type').asstring;
  SelName := DetsSRC.DataSet.FieldByName('Supp_Order_Desc').AsString;
  bSelected := True;
  Close;
end;

procedure TPBLUSupOrdTypeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUSupOrdTypeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Supplier};
  CallMaintScreen('A');
end;

procedure TPBLUSupOrdTypeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier};
  CallMaintScreen('C');
end;

procedure TPBLUSupOrdTypeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier};
  CallMaintScreen('D');
end;

procedure TPBLUSupOrdTypeFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  PBMaintSupOrdTypeFrm := TPBMaintSupOrdTypeFrm.Create(Self);
  try
    PBMaintSupOrdTypeFrm.sFuncMode := sTempFuncMode;
    PBMaintSupOrdTypeFrm.iSupp := iSupp;
    PBMaintSupOrdTypeFrm.sSuppName := sSuppName;
    PBMaintSupOrdTypeFrm.ShowModal;
    bTempOK := (PBMaintSupOrdTypeFrm.ModalResult = mrOK);
    sTempSel := PBMaintSupOrdTypeFrm.sCode;
  finally
    PBMaintSupOrdTypeFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(sTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUSupOrdTypeFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Supp_Order_type').Asstring <> sTempSel) do
      Next;
  end;
end;

procedure TPBLUSupOrdTypeFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
  stsBrDets.Top := Screen.Height - stsBrDets.Height;

  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmPBMainMenu.iOperator,0,0) ;
end;

end.
