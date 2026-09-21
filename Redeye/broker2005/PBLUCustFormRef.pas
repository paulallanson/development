unit PBLUCustFormRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCustFormRefFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    RefDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    BranchLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DispPanel: TPanel;
    DBContactText: TDBText;
    LabelName: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure RefDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure RefDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iCust, iBranch, iCode: Integer;
    SelName, SelDescr, StockCode, sCustName, sBranchName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  PBLUCustFormRefFrm: TPBLUCustFormRefFrm;

implementation

uses PBMaintFormRef;

{$R *.DFM}

procedure TPBLUCustFormRefFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Form Reference';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Form Reference';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
//  dmBroker.ScreenAccessControl(Self,'PBMaintCustBitBtn',PBMenuMainfrm.iOperator) ;
end;

procedure TPBLUCustFormRefFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUCustFormRefFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCustFormRefFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCustFormRefFrm.RefDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUCustFormRefFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TPBLUCustFormRefFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString;
  SelDescr := DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString;
  StockCode := DetsSRC.DataSet.FieldByName('Stock_Reference').AsString;
  bSelected := True;
  Close;
end;

procedure TPBLUCustFormRefFrm.RefDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    ChgBitBtnClick(Self);
end;

procedure TPBLUCustFormRefFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TPBLUCustFormRefFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TPBLUCustFormRefFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TPBLUCustFormRefFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintFormRefFrm := TPBMaintFormRefFrm.Create(Self);
  try
    PBMaintFormRefFrm.sFuncMode := sTempFuncMode;
    PBMaintFormRefFrm.iCust := iCust;
    PBMaintFormRefFrm.iBranch := iBranch;
    PBMaintFormRefFrm.sCustName := sCustName;
    PBMaintFormRefFrm.sBranchName := sBranchName;
    if sTempFuncMode <> 'A' then
      begin
        PBMaintFormRefFrm.iCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
        PBMaintFormRefFrm.iCust := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
        PBMaintFormRefFrm.iBranch := DetsSRC.DataSet.FieldByName('Branch_no').AsInteger;
        PBMaintFormRefFrm.sCustName := DetsSRC.DataSet.FieldByName('Customer_Name').Asstring;
        PBMaintFormRefFrm.sBranchName := DetsSRC.DataSet.FieldByName('Branch_Name').Asstring;
        PBMaintFormRefFrm.RefDescrEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString);
        PBMaintFormRefFrm.RefIDEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        PBMaintFormRefFrm.edtReorder.Text := Trim(DetsSRC.DataSet.FieldByName('Reorder_Level').AsString);
        PBMaintFormRefFrm.sFormRef := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        PBMaintFormRefFrm.StockRefEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Stock_Reference').AsString);
        PBMaintFormRefFrm.ChkBoxStockedItem.Checked := (DetsSRC.DataSet.FieldByName('Stocked_Item').AsString) = 'Y';
      end
    else
      PBMaintFormRefFrm.iCode := 0;

    PBMaintFormRefFrm.ShowModal;
    bTempOK := (PBMaintFormRefFrm.ModalResult = mrOK);
    iTempSel := PBMaintFormRefFrm.iCode;
  finally
    PBMaintFormRefFrm.Free;
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
    NameEdit.SetFocus;
  end;
end;

procedure TPBLUCustFormRefFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  RefDBGrid.visible := false;
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then
      begin
      RefDBGrid.visible := true;
      Exit;
      end;
    while (not (EOF)) and (FieldByName('Form_Reference').AsInteger <> iTempSel)
      do
      Next;
    if EOF then
      First;
  end;
  RefDBGrid.visible := true;
end;

procedure TPBLUCustFormRefFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

end.
