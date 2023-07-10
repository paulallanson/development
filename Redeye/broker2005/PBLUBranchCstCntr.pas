unit PBLUBranchCstCntr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, DBCtrls;

type
  TPBLUBranchCstCntrFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    CustLabel: TLabel;
    Label2: TLabel;
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
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool ;
  public
    { Public declarations }
    iCust, iBranch: Integer ;
    sSelCode, sSelName, sCustName: String ;
    bIs_Lookup, bAllow_Upd,Selected: ByteBool ;
  end;

var
  PBLUBranchCstCntrFrm: TPBLUBranchCstCntrFrm;

implementation

uses PBMaintBranchCstCntr, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBLUBranchCstCntrFrm.FormActivate(Sender: TObject);
begin
  Selected := False ;
  CustLabel.Caption := 'Customer: ' + sCustName;
  If bIs_Lookup = True then
   begin
   Caption := 'Lookup a Branch Cost Centre' ;
   SelectBitBtn.Visible := True ;
   end
  else
   begin
   Caption := 'Maintain Branch Cost Centres' ;
   SelectBitBtn.Visible := False ;
   end;
  {Load up the string grid} ;
  ShowGrid(Self) ;
  if (sSelCode <> '') then
    FindInGrid(sSelCode) ;
end;

procedure TPBLUBranchCstCntrFrm.ShowGrid(Sender: TObject);
begin
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Customer').AsInteger := iCust ;
     ParamByName('Branch_no').AsInteger := iBranch ;
     Open ;
     SelectBitBtn.Enabled := RecordCount > 0 ;
     ChgBitBtn.Enabled := RecordCount > 0 ;
     DelBitBtn.Enabled := RecordCount > 0 ;
     CountLabel.Caption := IntToStr(RecordCount) + ' items' ;
     end;
end;

procedure TPBLUBranchCstCntrFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button} ;
  SelectBitBtn.Enabled := True ;
end;

procedure TPBLUBranchCstCntrFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self) ;
  Close ;
end;

procedure TPBLUBranchCstCntrFrm.SelectCode(Sender: TObject);
begin
  sSelCode := DetsSRC.DataSet.FieldByName('Cost_Centre').AsString;
  sSelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  Selected := True ;
  Close ;
end;

procedure TPBLUBranchCstCntrFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup = True then
    begin
      SelectCode(Self)
    end
  else
    chgbitbtnclick(self);
end;

procedure TPBLUBranchCstCntrFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new cost centre} ;
  CallMaintScreen('A') ;
end;

procedure TPBLUBranchCstCntrFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a cost centre} ;
  CallMaintScreen('C');
end;

procedure TPBLUBranchCstCntrFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a cost centre} ;
  CallMaintScreen('D') ;
end;

procedure TPBLUBranchCstCntrFrm.CallMaintScreen(sTempFuncMode: String);
var
  bTempOK: ByteBool ;
  sTempsel: string ;
begin
  PBMaintBranchCstCntrFrm := TPBMaintBranchCstCntrFrm.Create(self) ;

  try
    PBMaintBranchCstCntrFrm.sFuncMode := sTempFuncMode ;
    PBMaintBranchCstCntrFrm.iCust := icust;
    PBMaintBranchCstCntrFrm.iBranch := iBranch;
    PBMaintBranchCstCntrFrm.ShowModal ;
    bTempOK := (PBMaintBranchCstCntrFrm.ModalResult = mrOK) ;
    sTempsel := PBMaintBranchCstCntrFrm.cstcntredit.text ;
  finally
    PBMaintBranchCstCntrFrm.Free ;
  end;

  if bTempOK = True then
    begin
      ShowGrid(Self) ;
      if sTempFuncMode <> 'D' then
        begin
          FindInGrid(sTempsel) ;
          If bIs_Lookup = True then
            SelectCode(Self) ;
        end;
    end;
end;

procedure TPBLUBranchCstCntrFrm.FindInGrid(sTempsel: String);
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

procedure TPBLUBranchCstCntrFrm.FormCreate(Sender: TObject);
begin
  sSelCode := '' ;
  bDisableNameChangeEvent := False ;
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
end;

end.
