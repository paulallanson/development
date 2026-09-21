unit PBMaintGroups;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintGroupsFrm = class(TForm)
    DetsSRC: TDataSource;
    GetCustTypesSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    GetPTCatsSQL: TFDQuery;
    GetCountriesSQL: TFDQuery;
    GetCurrencySQL: TFDQuery;
    GetIntrastatsSQL: TFDQuery;
    GetContTypesSQL: TFDQuery;
    GetContLevelsSQL: TFDQuery;
    SelectBitBtn: TBitBtn;
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
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
    sDescrField, sKeyField, sDescrFieldName: string;
  public
    { Public declarations }
    SelCode: string;
    SelName: string;
    iFuncMode: Integer;
    iGroupSelect: Integer;
    bIs_Lookup, Selected: ByteBool;
  end;

var
  PBMaintGroupsFrm: TPBMaintGroupsFrm;

implementation

uses PBMaintGroupsDets, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintGroupsFrm.FormActivate(Sender: TObject);
begin
  {Load up the string grid};
  CountLabel.Caption := '';
  if (igroupselect > 0) and (igroupselect < 5) then
      TypeRadioGroup.ItemIndex := igroupselect -1;

  TypeRadioGroup.Enabled := not bIs_Lookup;
  FuncGrpBox.visible := not bIs_Lookup;
  SelectBitBtn.visible := bIs_Lookup;
  dmBroker.ScreenAccessControl(Self,'mnuGeneralCats',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintGroupsFrm.ShowGrid(Sender: TObject);
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

procedure TPBMaintGroupsFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBMaintGroupsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBMaintGroupsFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TPBMaintGroupsFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TPBMaintGroupsFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TPBMaintGroupsFrm.CallMaintScreen(sTempFuncMode: string);
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
    if sKeyField = 'Category' then
      PBMaintGroupsDetsFrm.sCommRt := DetsSRC.Dataset.fieldByName('Commission_Rate').Asstring
    else
      PBMaintGroupsDetsFrm.sCommRt := '';
    if sKeyField = 'Customer_Type' then
      begin
        PBMaintGroupsDetsFrm.Color := DetsSRC.DataSet.FieldByName('Color').AsInteger;
        PBMaintGroupsDetsFrm.FontColor := DetsSRC.DataSet.FieldByName('Font_Color').AsInteger;
      end
    else
      begin
        PBMaintGroupsDetsFrm.Color := 0;
        PBMaintGroupsDetsFrm.FontColor := 0;
      end ;

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

procedure TPBMaintGroupsFrm.FindInGrid(sTempSel: Integer);
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

procedure TPBMaintGroupsFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TPBMaintGroupsFrm.TypeRadioGroupClick(Sender: TObject);
begin
  GetCustTypesSQL.Close;
  GetPTCatsSQL.Close;
  GetContTypesSQL.Close;
  case TypeRadioGroup.ItemIndex of
    0:
      begin
        sDescrField := 'Description';
        sKeyField := 'Customer_Type';
        sDescrFieldname := 'Customer Type';
        DetsSRC.DataSet := GetCustTypesSQL;
        Caption := 'Maintain Customer Types';
      end;
    1:
      begin
        sDescrField := 'Description';
        sKeyField := 'Category';
        sDescrFieldname := 'Product Type Category';
        DetsSRC.DataSet := GetPTCatsSQL;
        Caption := 'Maintain Product Type Categories';
      end;
    2:
      begin
        sDescrField := 'Description';
        sKeyField := 'Contact_Type';
        sDescrFieldname := 'Description';
        DetsSRC.DataSet := GetContTypesSQL;
        Caption := 'Maintain Contact Types';
      end;
    3:
      begin
        sDescrField := 'Description';
        sKeyField := 'Contact_Level';
        sDescrFieldname := 'Description';
        DetsSRC.DataSet := GetContLevelsSQL;
        Caption := 'Maintain Contact Levels';
      end;
    {     4:  begin
             sDescrField := 'Currency_Code_Descr' ;
             sKeyField := 'Currency_Code' ;
             sDescrFieldname := 'Currency' ;
             DetsSRC.DataSet := GetCurrencySQL ;
             Caption := 'Maintain Currencies' ;
             end;
         5:  begin
             sDescrField := 'Intrastat_Id_Descr' ;
             sKeyField := 'Intrastat_Id' ;
             sDescrFieldname := 'Intrastat' ;
             DetsSRC.DataSet := GetIntrastatsSQL ;
             Caption := 'Maintain Intrastats' ;
             end;
        }
  end;
  FuncGrpBox.Enabled := True;
  ShowGrid(Self);
end;

procedure TPBMaintGroupsFrm.DetsDBGridDblClick(Sender: TObject);
begin
  chgbitbtnclick(Self);
end;

procedure TPBMaintGroupsFrm.SelectBitBtnClick(Sender: TObject);
begin
 SelectCode(Self);
 Close;
end;

procedure TPBMaintGroupsFrm.SelectCode(Sender: TObject);
begin
  case TypeRadioGroup.ItemIndex of
  0:
      begin
        SelCode := DetsSRC.DataSet.FieldByName('Customer_Type').AsString;
        SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
      end;
    1:
      begin
        SelCode := DetsSRC.DataSet.FieldByName('Category').AsString;
        SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
      end;
    2:
      begin
         SelCode := DetsSRC.DataSet.FieldByName('Contact_Type').AsString;
        SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
      end;
    3:
      begin
        SelCode := DetsSRC.DataSet.FieldByName('Contact_level').AsString;
        SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
      end;
    end;
  Selected := True;
  Close;
end;

end.
