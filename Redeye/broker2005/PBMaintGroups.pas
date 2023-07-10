(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Select A Category

VSS Info:
$Header: /PBL D5/PBMaintGroups.pas 12    20/06/03 9:53 Andrewh $
$History: PBMaintGroups.pas $
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:28
 * Updated in $/PBL D5
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
unit PBMaintGroups;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBMaintGroupsFrm = class(TForm)
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
