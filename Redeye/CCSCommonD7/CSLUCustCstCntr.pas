unit CSLUCustCstCntr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, DBCtrls;

type
  TCSLUCustCstCntrFrm = class(TForm)
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
    iCust: Integer ;
    sCustName,sSelCode: String ;
    bIs_Lookup, bAllow_Upd,Selected: ByteBool ;
  end;

  var
  CSLUCustCstCntrFrm: TCSLUCustCstCntrFrm;

implementation

uses CSMaintCustCstCntr;

{$R *.DFM}

procedure TCSLUCustCstCntrFrm.FormActivate(Sender: TObject);
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
{Load up the string grid} ;
ShowGrid(Self) ;
if (sSelCode <> '') then FindInGrid(sSelCode) ;
end;

procedure TCSLUCustCstCntrFrm.ShowGrid(Sender: TObject);
begin
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Customer').AsInteger := iCust ;
     Open ;
     SelectBitBtn.Enabled := RecordCount > 0 ;
     ChgBitBtn.Enabled := RecordCount > 0 ;
     DelBitBtn.Enabled := RecordCount > 0 ;
     CountLabel.Caption := IntToStr(RecordCount) + ' items' ;
     end;
end;

procedure TCSLUCustCstCntrFrm.DetsDBGridColEnter(Sender: TObject);
begin
{Item selected, enable OK button} ;
SelectBitBtn.Enabled := True ;
end;

procedure TCSLUCustCstCntrFrm.SelectBitBtnClick(Sender: TObject);
begin
SelectCode(Self) ;
Close ;
end;

procedure TCSLUCustCstCntrFrm.SelectCode(Sender: TObject);
begin
sSelCode := DetsSRC.DataSet.FieldByName('Cost_Centre').AsString;
Selected := True ;
Close ;
end;

procedure TCSLUCustCstCntrFrm.DetsDBGridDblClick(Sender: TObject);
begin
If bIs_Lookup = True then
   begin
   SelectCode(Self)
   end
   else
      chgbitbtnclick(self);
end;

procedure TCSLUCustCstCntrFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a new Rep} ;
CallMaintScreen('A') ;
end;

procedure TCSLUCustCstCntrFrm.ChgBitBtnClick(Sender: TObject);
begin
{Change a Rep} ;
CallMaintScreen('C');
end;

procedure TCSLUCustCstCntrFrm.DelBitBtnClick(Sender: TObject);
begin
{Delete a Rep} ;
CallMaintScreen('D') ;
end;

procedure TCSLUCustCstCntrFrm.CallMaintScreen(sTempFuncMode: String);
Var
bTempOK: ByteBool ;
sTempsel: string ;
begin
CSMaintCustCstCntrFrm := TCSMaintCustCstCntrFrm.Create(self) ;
CSMaintCustCstCntrFrm.sFuncMode := sTempFuncMode ;
CSMaintCustCstCntrFrm.Icode := icust;
CSMaintCustCstCntrFrm.ShowModal ;
bTempOK := (CSMaintCustCstCntrFrm.ModalResult = mrOK) ;
sTempsel := CSMaintCustCstCntrFrm.cstcntredit.text ;
CSMaintCustCstCntrFrm.Free ;
If bTempOK = True then
   begin
   ShowGrid(Self) ;
   If sTempFuncMode <> 'D' then
      begin
      FindInGrid(sTempsel) ;
      If bIs_Lookup = True then
         SelectCode(Self) ;
      end;
   end;
end;

procedure TCSLUCustCstCntrFrm.FindInGrid(sTempsel: String);
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

procedure TCSLUCustCstCntrFrm.FormCreate(Sender: TObject);
begin
sSelCode := '' ;
bDisableNameChangeEvent := False ;
end;

end.
