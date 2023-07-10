(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Select A Category

VSS Info:
$Header: /CCSCommon/CSMaintGroups.pas 1     10/01/:1 13:01 Paul $
$History: CSMaintGroups.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:01
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 18/10/00   Time: 10:49
 * Updated in $/PBL D5
 * Extended range check on iGroupselect to account for extra radiogroup
 * option of maintain contact levels. Parent forms modify iGroupselect to
 * set at  creation which of the data types is being maintained.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:06
 * Updated in $/PBL D5
 * Expanded the radio group box to allow for the selection of maintainance
 * of Contact Levels
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 3/10/:0    Time: 15:35
 * Updated in $/PBL D5
 * Fault in igroups range 0 - 4 not 0 - 3.
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 27/09/:0   Time: 15:47
 * Updated in $/PBL D5
 * Allow setting of default group, from other maintenance forms. i.e.
 * customer types from customer maint etc.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 15/02/:0   Time: 12:31
 * Updated in $/PBL D5
 * Changed to set the sDescription paramter on the PBMaintGroupsDetail
 * form
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintGroups;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TCSMaintGroupsFrm = class(TForm)
    DetsSRC: TDataSource;
    GetCustTypesSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    GetPTCatsSQL: TQuery;
    GetCountriesSQL: TQuery;
    GetCurrencySQL: TQuery;
    GetIntrastatsSQL: TQuery;
    GetContTypesSQL: TQuery;
    GetContLevelsSQL: TQuery;
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
    iGroupSelect: Integer;
  end;

var
  CSMaintGroupsFrm: TCSMaintGroupsFrm;

implementation

uses CSMaintGroupsDets;

{$R *.DFM}

procedure TCSMaintGroupsFrm.FormActivate(Sender: TObject);
begin
  {Load up the string grid};
  CountLabel.Caption := '';
  if (igroupselect > 0) and (igroupselect < 5) then
      TypeRadioGroup.ItemIndex := igroupselect -1;
end;

procedure TCSMaintGroupsFrm.ShowGrid(Sender: TObject);
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

procedure TCSMaintGroupsFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TCSMaintGroupsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSMaintGroupsFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type};
  CallMaintScreen('A');
end;

procedure TCSMaintGroupsFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type};
  CallMaintScreen('C');
end;

procedure TCSMaintGroupsFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type};
  CallMaintScreen('D');
end;

procedure TCSMaintGroupsFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  TempCode: Integer;
begin
  CSMaintGroupsDetsFrm := TCSMaintGroupsDetsFrm.Create(Self);
  try
    CSMaintGroupsDetsFrm.sFuncMode := sTempFuncMode;
    CSMaintGroupsDetsFrm.sDescrField := sDescrField;
    CSMaintGroupsDetsFrm.sDescrFieldName := sDescrFieldName;
    CSMaintGroupsDetsFrm.sKeyField := sKeyField;
    CSMaintGroupsDetsFrm.iCode :=
      DetsSRC.DataSet.FieldByName(sKeyField).AsInteger;
    CSMaintGroupsDetsFrm.sDescription :=
      DetsSRC.DataSet.Fields[1].asstring;
    CSMaintGroupsDetsFrm.ShowModal;
    bTempOK := (CSMaintGroupsDetsFrm.ModalResult = mrOK);
    TempCode := CSMaintGroupsDetsFrm.iCode;
  finally
    CSMaintGroupsDetsFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
      FindInGrid(TempCode);
  end;
end;

procedure TCSMaintGroupsFrm.FindInGrid(sTempSel: Integer);
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

procedure TCSMaintGroupsFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
end;

procedure TCSMaintGroupsFrm.TypeRadioGroupClick(Sender: TObject);
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

procedure TCSMaintGroupsFrm.DetsDBGridDblClick(Sender: TObject);
begin
  chgbitbtnclick(Self);
end;

end.
