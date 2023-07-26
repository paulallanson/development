(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
 *
*******************************************************************************)
unit PBMaintPrdTypOChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPrdTypOChgFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    PrdTypDescrEdit: TEdit;
    Label2: TLabel;
    qryZero: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;    
  public
    sFuncMode: string[1];
    iCode, iPrdTyp: Integer;
    sPrdTypDesc: string;
  end;

var
  PBMaintPrdTypOChgFrm: TPBMaintPrdTypOChgFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUPrdTypOChg;

{$R *.DFM}

procedure TPBMaintPrdTypOChgFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new product type optional charge';
  if sFuncMode = 'C' then
    Caption := 'Change a product type optional charge';
  if sFuncMode = 'D' then
    Caption := 'Delete a product type optional charge';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
  end
  else
  begin
    with PBLUPrdTypOChgFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Optional_Charge').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
    end;
  end;
  PrdTypDescrEdit.Text := sPrdTypDesc;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProductTypes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPrdTypOChgFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintPrdTypOChgFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPrdTypOChgFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Product_Type').AsInteger := iPrdTyp;
      ParamByName('Optional_Charge').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Product_Type').AsInteger := iPrdTyp;
        ParamByName('Optional_Charge').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
  {If replicating details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(13, iPrdTyp, iCode, 0, sFuncMode);
    end;
end;

procedure TPBMaintPrdTypOChgFrm.DescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPrdTypOChgFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Product_TypeOChg ' +
            '(Product_Type,Optional_Charge,Description) ' +
            'VALUES(' + IntToStr(iPrdTyp) + ', 0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPrdTypOChgFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product_TypeOChg ' +
            'Where Product_Type=' + IntToStr(iPrdTyp) +
            'And Optional_Charge=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPrdTypOChgFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Product_Type').AsInteger := iPrdTyp;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Optional_Charge').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.

