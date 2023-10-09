unit PBMaintProcessQstn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintProcessQstnFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    TextEdit: TEdit;
    PrdTypDescrEdit: TEdit;
    Label2: TLabel;
    qryZero: TFDQuery;
    Label3: TLabel;
    SequenceEdit: TEdit;
    Label5: TLabel;
    DBLUPromptType: TDBLookupComboBox;
    lblItems: TLabel;
    BtnItems: TBitBtn;
    qryPromptType: TFDQuery;
    srcPromptType: TDataSource;
    qryQuestionList: TFDQuery;
    qryDelQList: TFDQuery;
    qryAddQList: TFDQuery;
    qryLastQList: TFDQuery;
    chkbxMandatory: TCheckBox;
    chkbxInactive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure TextEditChange(Sender: TObject);
    procedure DBLUPromptTypeClick(Sender: TObject);
    procedure BtnItemsClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    sQuestionList: TStringList;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DisplayItems;
    procedure GetQuestionList;
    procedure DeleteQuestionList;
    procedure UpdateQuestionList;
  public
    sFuncMode: string[1];
    iCode, iProcess: Integer;
    sProcessDesc: string;
  end;

var
  PBMaintProcessQstnFrm: TPBMaintProcessQstnFrm;

implementation

uses UITypes, ComObj, ActiveX, PBLUProcessQstn, pbDatabase, pbMainMenu,
  PBLUProcessQstnList;

{$R *.DFM}

procedure TPBMaintProcessQstnFrm.FormActivate(Sender: TObject);
begin
  sQuestionList := TStringList.create;
  qryPromptType.Active := False;
  qryPromptType.Active := True;

  SequenceEdit.Text := '';
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new process Question';
  if sFuncMode = 'C' then
    Caption := 'Change a process Question';
  if sFuncMode = 'D' then
    Caption := 'Delete a process Question';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    TextEdit.Text := '';
    SequenceEdit.Text := '';
    dbLUPromptType.KeyValue := 'edt';
  end
  else
  begin
    with PBLUProcessQstnFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Question').AsInteger;
      TextEdit.Text := FieldByName('Question_Text').AsString;
      SequenceEdit.Text := FieldByName('Sequence_no').AsString;
      DBLUPromptType.keyvalue := fieldbyname('Prompt_type').asstring;
      chkbxMandatory.Checked := (fieldbyname('is_mandatory').asstring = 'Y');
      chkbxInactive.Checked := (fieldbyname('Inactive').asstring = 'Y');
    end;
  end;
  PrdTypDescrEdit.Text := sProcessDesc;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');

  {Check whether items box needs displaying}
  GetQuestionList;
  DisplayItems;
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProcesses',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProcessQstnFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (TextEdit.Text <> '');
end;

procedure TPBMaintProcessQstnFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProcessQstnFrm.GetQuestionList;
begin
  with qryQuestionList do
    begin
      close;
      parambyname('Process').asinteger := iProcess;
      parambyname('Question').asinteger := iCode;
      open;
      first;
      sQuestionList.clear;
      while not EOF do
        begin
          sQuestionList.Add(fieldbyname('Question_List_descr').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintProcessQstnFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Process').AsInteger := iProcess;
      ParamByName('Question').AsInteger := iCode;
      ParamByName('Question_Text').AsString := TextEdit.Text + '';
      try
        ParamByName('Sequence_no').asinteger := strtoint(SequenceEdit.Text)
      except
        ParamByName('Sequence_no').asinteger := 0
      end;

      if (dbluPromptType.text = '') or
         (dbluPromptType.keyvalue = null)  then
        ParamByName('Prompt_Type').clear
      else
        ParamByName('Prompt_Type').AsString := dbluPromptType.keyvalue; 

      if chkbxMandatory.checked then
        parambyname('is_mandatory').asstring := 'Y'
      else
        parambyname('is_mandatory').asstring := 'N';

      if chkbxInactive.checked then
        ParamByName('Inactive').AsString := 'Y'
      else
        ParamByName('Inactive').AsString := 'N';

      ExecSQL;

      {Now update any Question lists}
      DeleteQuestionList;
      UpdateQuestionList;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      DeleteQuestionList;
      with DelSQL do
      begin
        Close;
        ParamByName('Process').AsInteger := iProcess;
        ParamByName('Question').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintProcessQstnFrm.DeleteQuestionList;
begin
  with qryDelQList do
    begin
      close;
      parambyname('Process').asinteger := iProcess;
      parambyname('Question').asinteger := icode;
      execsql;
    end;
end;

procedure TPBMaintProcessQstnFrm.UpdateQuestionList;
var
  i, iLast: integer;
begin
  for i := 0 to pred(sQuestionList.count) do
    begin
      with qryLastQList do
        begin
          close;
          parambyname('Process').asinteger := iProcess;
          parambyname('Question').asinteger := icode;
          open;
          first;
          iLast := fieldbyname('Last_Code').asinteger;

        end;

      with qryAddQList do
        begin
          close;
          parambyname('Process').asinteger := iProcess;
          parambyname('Question').asinteger := icode;
          parambyname('Question_List_no').asinteger := iLast;
          parambyname('Question_List_Descr').asstring := sQuestionList.Strings[i];
          execsql;
        end;
    end;
end;

procedure TPBMaintProcessQstnFrm.DisplayItems;
begin
  btnItems.visible := ((DBLUPromptType.keyvalue = 'cbo') or
                      (DBLUPromptType.keyvalue = 'lst'));
  lblItems.visible := ((DBLUPromptType.keyvalue = 'cbo') or
                      (DBLUPromptType.keyvalue = 'lst'));

end;

procedure TPBMaintProcessQstnFrm.TextEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessQstnFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Process_Question ' +
            '(Process,Question,Question_Text) ' +
            'VALUES(' + IntToStr(iProcess) + ', 0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProcessQstnFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process_Question Where Process=' +
            IntToStr(iProcess) + ' And Question=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintProcessQstnFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Process').AsInteger := iProcess;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Question').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintProcessQstnFrm.DBLUPromptTypeClick(Sender: TObject);
begin
  DisplayItems;
end;

procedure TPBMaintProcessQstnFrm.BtnItemsClick(Sender: TObject);
var
  i: integer;
begin
  PBLUProcessQstnListFrm := TPBLUProcessQstnListFrm.create(self);

  try
    for i := 0 to pred(sQuestionList.count) do
      PBLUProcessQstnListFrm.memoList.Lines.add(sQuestionList[i]);

    PBLUProcessQstnListFrm.showmodal;
    if PBLUProcessQstnListFrm.modalresult = idOK then
      begin
        sQuestionList.clear;
        for i := 0 to pred(PBLUProcessQstnListFrm.memoList.Lines.count) do
          begin
            if trim(PBLUProcessQstnListFrm.memoList.Lines[i]) = '' then
              continue;
            sQuestionList.add(PBLUProcessQstnListFrm.memoList.Lines[i]);
          end;
      end
  finally
    PBLUProcessQstnListFrm.free
  end;
end;

procedure TPBMaintProcessQstnFrm.FormDeactivate(Sender: TObject);
begin
  sQuestionList.free;
end;

end.

