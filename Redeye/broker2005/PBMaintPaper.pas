unit PBMaintPaper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPaperFrm = class(TForm)
    DetsSRC: TDataSource;
    GetWeightSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    GetBrandSQL: TFDQuery;
    GetMaterialSQL: TFDQuery;
    GetColourSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(sTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure TypeRadioGroupClick(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
    sDescrField, sKeyField, sDescrFieldName: string;
  public
    { Public declarations }
    SelCode: string;
    SelName: string;
    iFuncMode: Integer;
  end;

var
  PBMaintPaperFrm: TPBMaintPaperFrm;

implementation

uses PBMaintGroupsDets, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintPaperFrm.FormActivate(Sender: TObject);
begin
  {Load up the string grid};
  CountLabel.Caption := '';
  dmBroker.ScreenAccessControl(Self,'mnuPaperDetails',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPaperFrm.ShowGrid(Sender: TObject);
begin
  DetsDBGrid.Columns.Clear;
  DetsDBGrid.Columns.Add;
  DetsDBGrid.Columns[0].FieldName := sDescrField;
  DetsDBGrid.Columns[0].Title.Caption := sDescrFieldName;
  DetsDBGrid.Columns[0].Width := 300;
  with DetsSRC.DataSet do
  begin
    Close;
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBMaintPaperFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBMaintPaperFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBMaintPaperFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TPBMaintPaperFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TPBMaintPaperFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TPBMaintPaperFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  TempCode: Integer;
begin
  PBMaintGroupsDetsFrm := TPBMaintGroupsDetsFrm.Create(Self);
  try
    PBMaintGroupsDetsFrm.sFuncMode := sTempFuncMode;
    PBMaintGroupsDetsFrm.sDescrField := sDescrField;
    PBMaintGroupsDetsFrm.sDescrFieldName := sDescrFieldName;
    PBMaintGroupsDetsFrm.sKeyField := sKeyField;
    PBMaintGroupsDetsFrm.iCode :=
      DetsSRC.DataSet.FieldByName(sKeyField).AsInteger;
    PBMaintGroupsDetsFrm.sDescription :=
      DetsSRC.DataSet.Fields[1].asstring;
    PBMaintGroupsDetsFrm.ShowModal;
    bTempOK := (PBMaintGroupsDetsFrm.ModalResult = mrOK);
    TempCode := PBMaintGroupsDetsFrm.iCode;
  finally
    PBMaintGroupsDetsFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
      FindInGrid(TempCode);
  end;
end;

procedure TPBMaintPaperFrm.FindInGrid(sTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName(sKeyField).AsInteger <> sTempSel) do
      Next;
  end;
end;

procedure TPBMaintPaperFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBMaintPaperFrm.TypeRadioGroupClick(Sender: TObject);
begin
  GetColourSQL.Close;
  GetWeightSQL.Close;
  GetBrandSQL.Close;
  GetMaterialSQL.Close;
  case TypeRadioGroup.ItemIndex of
    0:
      begin
        sDescrField := 'Paper_Colour_Description';
        sKeyField := 'Paper_Colour';
        sDescrFieldname := 'Paper Colour';
        DetsSRC.DataSet := GetColourSQL;
        Caption := 'Maintain Paper Colours';
      end;
    1:
      begin
        sDescrField := 'Paper_Weight_Description';
        sKeyField := 'Paper_Weight';
        sDescrFieldname := 'Paper Weight';
        DetsSRC.DataSet := GetWeightSQL;
        Caption := 'Maintain Paper Weights';
      end;
    2:
      begin
        sDescrField := 'Paper_Brand_Description';
        sKeyField := 'Paper_Brand';
        sDescrFieldname := 'Paper Brand';
        DetsSRC.DataSet := GetBrandSQL;
        Caption := 'Maintain Paper Brands';
      end;
    3:
      begin
        sDescrField := 'Paper_Material_Description' ;
        sKeyField := 'Paper_Material' ;
        sDescrFieldname := 'Paper Material' ;
        DetsSRC.DataSet := GetMaterialSQL ;
        Caption := 'Maintain Paper Materials' ;
      end;
  end;
  FuncGrpBox.Enabled := True;
  ShowGrid(Self);
end;

procedure TPBMaintPaperFrm.DetsDBGridDblClick(Sender: TObject);
begin
  chgbitbtnclick(Self);
end;

end.
