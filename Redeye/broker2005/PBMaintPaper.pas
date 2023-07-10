(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Select A Category

VSS Info:
$Header: /PBL D5/PBMaintPaper.pas 7     20/06/03 9:53 Andrewh $
$History: PBMaintPaper.pas $
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 15/02/:0   Time: 13:22
 * Created in $/PBL D5
 * Initial take on of Paper Details maintenance
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintPaper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TPBMaintPaperFrm = class(TForm)
    DetsSRC: TDataSource;
    GetWeightSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    GetBrandSQL: TQuery;
    GetMaterialSQL: TQuery;
    GetColourSQL: TQuery;
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
