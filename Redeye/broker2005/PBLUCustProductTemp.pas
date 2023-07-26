unit PBLUCustProductTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCustProductTempFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SelectBitBtn: TBitBtn;
    CustLabel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
  private
    bDisableNameChangeEvent: ByteBool;
  public
    SelCode, iCust: Integer;
    SelName, sCustName: string;
    sPrefix: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUCustProductTempFrm: TPBLUCustProductTempFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintCustProductTemp;

{$R *.DFM}

procedure TPBLUCustProductTempFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  CustLabel.Caption := 'Customer: ' + sCustName;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Product Template';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Product Templates';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
end;

procedure TPBLUCustProductTempFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iCust;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUCustProductTempFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCustProductTempFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCustProductTempFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUCustProductTempFrm.DetsDBGridDblClick(Sender: TObject);
begin
  chgbitbtnclick(Self);
end;

procedure TPBLUCustProductTempFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Credit Note Reason}
  CallMaintScreen('A');
end;

procedure TPBLUCustProductTempFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUCustProductTempFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUCustProductTempFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: integer;
begin
  PBMaintCustProductTempFrm := TPBMaintCustProductTempFrm.Create(Self);
  try
    PBMaintCustProductTempFrm.sFuncMode := sTempFuncMode;
    PBMaintCustProductTempFrm.icust := icust;
    PBMaintCustProductTempFrm.sPrefix := sPrefix;
    PBMaintCustProductTempFrm.ShowModal;
    bTempOK := (PBMaintCustProductTempFrm.ModalResult = mrOK);
    iTempSel := PBMaintCustProductTempFrm.iCode;
  finally
    PBMaintCustProductTempFrm.Free;
  end;
  if bTempOK then
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

procedure TPBLUCustProductTempFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  DetsDbGrid.visible := false;
  try
    with GetDetsSQL do
    begin
      First;
      if iTempSel = 0 then Exit;
      while (not (EOF)) and (FieldByName('Template_No').AsInteger <> iTempSel) do
        Next;
    end;
  finally
    DetsDbGrid.visible := true;
  end;
end;

procedure TPBLUCustProductTempFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUCustProductTempFrm.SelectCode(Sender: TObject);
begin
  Selected := True;
  Close;
end;

end.
