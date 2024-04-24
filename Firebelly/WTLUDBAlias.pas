unit WTLUDBAlias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Data.DB, ExtCtrls, Buttons,
  FireDAC.Comp.Client;

type
  TWTLUDBAliasFrm = class(TForm)
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
  WTLUDBAliasFrm: TWTLUDBAliasFrm;

implementation

uses WTMaintDBAlias;

{$R *.DFM}

procedure TWTLUDBAliasFrm.FormActivate(Sender: TObject);
begin
  ShowGrid;
end;

procedure TWTLUDBAliasFrm.AddBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TWTLUDBAliasFrm.ChgBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TWTLUDBAliasFrm.DelBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TWTLUDBAliasFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  WTMaintDBAliasFrm := TWTMaintDBAliasFrm.Create(Self);
  try
    WTMaintDBAliasFrm.sFuncMode := ShortString(Copy(sTempFuncMode, 1, 1));
    if lstbxAliasList.Items.Count > 0 then
      WTMaintDBAliasFrm.sAlias := lstbxAliasList.Items[lstbxAliasList.itemindex];

    WTMaintDBAliasFrm.ShowModal;
    bTempOK := (WTMaintDBAliasFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        ShowGrid;
        sTempSel := WTMaintDBAliasFrm.sCode;
        if sTempFuncmode <> 'D' then
          lstbxAliasList.ItemIndex := lstbxAliasList.Items.IndexOf(stempSel);
      end;
  finally
    WTMaintDBAliasFrm.Free;
  end;
  if bTempOK then
  begin
  end;
end;

procedure TWTLUDBAliasFrm.ShowGrid;
var
  iAliasList: integer;
  sgList: TStringList;
begin
  lstbxAliasList.clear;
  sgList := TStringList.Create;
  try
    for var i := 0 to FDManager.ConnectionDefs.Count-1 do
      sgList.Add(FDManager.ConnectionDefs[i].Name);

    { fill a list box with alias names for the user to select from }
    for iAliasList := 0 to sgList.Count - 1 do
      if ((pos('Worktop',sgList[iAliasList]) > 0) or (pos('worktop',sgList[iAliasList]) > 0) or
          (pos('GSmart',sgList[iAliasList]) > 0) or (pos('Gsmart',sgList[iAliasList]) > 0)) then
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

procedure TWTLUDBAliasFrm.lstbxAliasListDblClick(Sender: TObject);
begin
  chgbitbtnclick(self);
end;

end.
