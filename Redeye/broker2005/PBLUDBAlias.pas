unit PBLUDBAlias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBLUDBAliasFrm = class(TForm)
    CloseBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    lstbxAliasList: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure ShowGrid;
    procedure lstbxAliasListDblClick(Sender: TObject);
  private
  public
    SelCode: string;
    SelName: string;
  end;

var
  PBLUDBAliasFrm: TPBLUDBAliasFrm;

implementation

uses pbMainMenu, pbDatabase, PBMaintDBAlias;

{$R *.DFM}

procedure TPBLUDBAliasFrm.FormActivate(Sender: TObject);
begin
  ShowGrid;
  dmBroker.ScreenAccessControl(Self,'mnuDatabaseTools',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUDBAliasFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUDBAliasFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUDBAliasFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUDBAliasFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  PBMaintDBAliasFrm := TPBMaintDBAliasFrm.Create(Self);
  try
    PBMaintDBAliasFrm.sFuncMode := sTempFuncMode;
    if lstbxAliasList.Items.Count > 0 then
      PBMaintDBAliasFrm.sAlias := lstbxAliasList.Items[lstbxAliasList.itemindex];

    PBMaintDBAliasFrm.ShowModal;
    bTempOK := (PBMaintDBAliasFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        ShowGrid;
        sTempSel := PBMaintDBAliasFrm.sCode;
        if sTempFuncmode <> 'D' then
          lstbxAliasList.ItemIndex := lstbxAliasList.Items.IndexOf(stempSel);
      end;
  finally
    PBMaintDBAliasFrm.Free;
  end;
  if bTempOK then
  begin
  end;
end;

procedure TPBLUDBAliasFrm.ShowGrid;
var
  iAliasList: integer;
  sgList: TStringList;
begin
  lstbxAliasList.clear;
  sgList := TStringList.Create;
  try
    Session.GetAliasNames(sgList);
    { fill a list box with alias names for the user to select from }
    for iAliasList := 0 to sgList.Count - 1 do
      if ((pos('Redeye',sgList[iAliasList]) > 0) or (pos('redeye',sgList[iAliasList]) > 0) or
          (pos('emails',sgList[iAliasList]) > 0) or
          (pos('Broker',sgList[iAliasList]) > 0) or (pos('broker',sgList[iAliasList]) > 0) or
          (pos('Emails',sgList[iAliasList]) > 0)) and
          (pos('ADO',sgList[iAliasList]) = 0) then
        lstbxAliasList.Items.Add(sgList[iAliasList]);

    lstbxAliasList.Sorted := true;
    lstbxAliasList.ItemIndex := lstbxAliasList.items.indexof(selCode);
    if lstbxAliasList.ItemIndex < 0 then
      lstbxAliasList.ItemIndex := 0;
  finally
    sgList.Free;
  end;

  ChgBitBtn.Enabled := lstbxAliasList.Items.count > 0;
  DelBitBtn.Enabled := lstbxAliasList.Items.count > 0;

end;

procedure TPBLUDBAliasFrm.lstbxAliasListDblClick(Sender: TObject);
begin
  chgbitbtnclick(self);
end;

end.
