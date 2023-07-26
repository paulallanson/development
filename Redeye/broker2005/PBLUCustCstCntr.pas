unit PBLUCustCstCntr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCustCstCntrFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    CustLabel: TLabel;
    SearchTimer: TTimer;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: String);
    procedure FindInGrid(sTempsel: string);
    procedure FormCreate(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool ;
  public
    { Public declarations }
    iCust: Integer ;
    sCustName,sSelCode: String ;
    bIs_Lookup, bAllow_Upd,Selected: ByteBool ;
  end;

  var
  PBLUCustCstCntrFrm: TPBLUCustCstCntrFrm;

implementation

uses PBMaintCustCstCntr, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBLUCustCstCntrFrm.FormActivate(Sender: TObject);
begin
  Selected := False ;
  CustLabel.Caption := 'Customer: ' + sCustName;
  If bIs_Lookup = True then
   begin
   Caption := 'Lookup a Customer Cost Centre' ;
   SelectBitBtn.Visible := True ;
   end
  else
   begin
   Caption := 'Maintain Customer Cost Centres' ;
   SelectBitBtn.Visible := False ;
   end;
  NameEdit.Text := '';
  {Load up the string grid} ;
  ShowGrid(Self) ;
  NameEdit.SetFocus;
  if (sSelCode <> '') then
    FindInGrid(sSelCode) ;
end;

procedure TPBLUCustCstCntrFrm.ShowGrid(Sender: TObject);
begin
  With GetDetsSQL do
    begin
      Close ;
      ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
      ParamByName('Customer').AsInteger := iCust ;
      Open ;
      SelectBitBtn.Enabled := RecordCount > 0 ;
      ChgBitBtn.Enabled := RecordCount > 0 ;
      DelBitBtn.Enabled := RecordCount > 0 ;
      CountLabel.Caption := IntToStr(RecordCount) + ' items' ;
    end;
end;

procedure TPBLUCustCstCntrFrm.DetsDBGridColEnter(Sender: TObject);
begin
{Item selected, enable OK button} ;
SelectBitBtn.Enabled := True ;
end;

procedure TPBLUCustCstCntrFrm.SelectBitBtnClick(Sender: TObject);
begin
SelectCode(Self) ;
Close ;
end;

procedure TPBLUCustCstCntrFrm.SelectCode(Sender: TObject);
begin
sSelCode := DetsSRC.DataSet.FieldByName('Cost_Centre').AsString;
Selected := True ;
Close ;
end;

procedure TPBLUCustCstCntrFrm.DetsDBGridDblClick(Sender: TObject);
begin
If bIs_Lookup = True then
   begin
   SelectCode(Self)
   end
   else
      chgbitbtnclick(self);
end;

procedure TPBLUCustCstCntrFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a new Rep} ;
CallMaintScreen('A') ;
end;

procedure TPBLUCustCstCntrFrm.ChgBitBtnClick(Sender: TObject);
begin
{Change a Rep} ;
CallMaintScreen('C');
end;

procedure TPBLUCustCstCntrFrm.DelBitBtnClick(Sender: TObject);
begin
{Delete a Rep} ;
CallMaintScreen('D') ;
end;

procedure TPBLUCustCstCntrFrm.CallMaintScreen(sTempFuncMode: String);
Var
bTempOK: ByteBool ;
sTempsel: string ;
begin
PBMaintCustCstCntrFrm := TPBMaintCustCstCntrFrm.Create(self) ;
PBMaintCustCstCntrFrm.sFuncMode := sTempFuncMode ;
PBMaintCustCstCntrFrm.Icode := icust;
PBMaintCustCstCntrFrm.ShowModal ;
bTempOK := (PBMaintCustCstCntrFrm.ModalResult = mrOK) ;
sTempsel := PBMaintCustCstCntrFrm.cstcntredit.text ;
PBMaintCustCstCntrFrm.Free ;
If bTempOK = True then
   begin
   ShowGrid(Self) ;
   If sTempFuncMode <> 'D' then
      begin
      FindInGrid(sTempsel) ;
      If bIs_Lookup = True then
         SelectCode(Self) ;
      end;
    NameEdit.SetFocus;
   end;
end;

procedure TPBLUCustCstCntrFrm.FindInGrid(sTempsel: String);
begin
{Find the item you just changed} ;
With DetsSRC.DataSet do
     begin
     First ;
     If sTempsel = '' then exit ;
     While (EOF = False) and (FieldByName('Cost_Centre').AsString <> sTempsel) do
           Next ;
     end;
end;

procedure TPBLUCustCstCntrFrm.FormCreate(Sender: TObject);
begin
  sSelCode := '' ;
  bDisableNameChangeEvent := False ;
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUCustCstCntrFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCustCstCntrFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

end.
