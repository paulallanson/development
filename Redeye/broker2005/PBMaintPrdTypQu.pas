(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Product Type Questions form.

VSS Info:
$Header: /PBL D5/PBMaintPrdTypQu.pas 12    20/06/03 9:53 Andrewh $
$History: PBMaintPrdTypQu.pas $
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
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
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:19
 * Updated in $/PBL D5
 * Apply new ENQUIRE/NOTES security settings.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 22/02/:2   Time: 15:31
 * Updated in $/PBL D5
 * Now prompts for a prompt type which can be a Checkbox, List box, combo,
 * edit box etc.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 29/06/:0   Time: 14:41
 * Updated in $/PBL D5
 * Introduced a Sequence reference number used to control the display of
 * the questions in Enquiry and PO
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 13:03
 * Updated in $/PBL D5
 * Use new insert method and GUIDs to ensure unique keys when adding.  Fix
 * bug in PBMaintPrdTyp where subsidiary records in Capabilities and
 * Questions weren't being deleted causing FK restraint violation.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintPrdTypQu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPrdTypQuFrm = class(TForm)
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
    Label4: TLabel;
    DBLUQuestionCat: TDBLookupComboBox;
    Label5: TLabel;
    DBLUPromptType: TDBLookupComboBox;
    lblItems: TLabel;
    BtnItems: TBitBtn;
    qryPromptType: TFDQuery;
    qryQuestionCat: TFDQuery;
    srcPromptType: TDataSource;
    srcQuestionCat: TDataSource;
    qryQuestionList: TFDQuery;
    qryDelQList: TFDQuery;
    qryAddQList: TFDQuery;
    Query1: TFDQuery;
    qryLastQList: TFDQuery;
    chkbxActive: TCheckBox;
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
    iCode, iPrdTyp: Integer;
    sPrdTypDesc: string;
  end;

var
  PBMaintPrdTypQuFrm: TPBMaintPrdTypQuFrm;

implementation

uses UITypes, PBLUPrdTypQu, ComObj, ActiveX, PBLUPrdTypQuList, PBDatabase,
  pbMainMenu;

{$R *.DFM}

procedure TPBMaintPrdTypQuFrm.FormActivate(Sender: TObject);
begin
  sQuestionList := TStringList.create;
  qryPromptType.Active := False;
  qryPromptType.Active := True;

  qryQuestionCat.Active := False;
  qryQuestionCat.Active := True;

  SequenceEdit.Text := '';
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new product type Question';
  if sFuncMode = 'C' then
    Caption := 'Change a product type Question';
  if sFuncMode = 'D' then
    Caption := 'Delete a product type Question';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    TextEdit.Text := '';
    SequenceEdit.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUPrdTypQuFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Question').AsInteger;
      TextEdit.Text := FieldByName('Question_Text').AsString;
      SequenceEdit.Text := FieldByName('Sequence_Reference').AsString;
      DBLUPromptType.keyvalue := fieldbyname('Prompt_type').asstring;
      DBLUQuestionCat.keyvalue := fieldbyname('Question_Category').asinteger;
      ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  PrdTypDescrEdit.Text := sPrdTypDesc;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');

  {Check whether items box needs displaying}
  GetQuestionList;
  DisplayItems;
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnUProductTypes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPrdTypQuFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (TextEdit.Text <> '');
end;

procedure TPBMaintPrdTypQuFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPrdTypQuFrm.GetQuestionList;
begin
  with qryQuestionList do
    begin
      close;
      parambyname('Product_Type').asinteger := iPrdTyp;
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

procedure TPBMaintPrdTypQuFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Product_Type').AsInteger := iPrdTyp;
      ParamByName('Question').AsInteger := iCode;
      ParamByName('Question_Text').AsString := TextEdit.Text + '';
      ParamByName('Sequence_Reference').AsString := SequenceEdit.Text + '';

      if (dbluPromptType.text = '') or
         (dbluPromptType.keyvalue = null)  then
        ParamByName('Prompt_Type').clear
      else
        ParamByName('Prompt_Type').AsString := dbluPromptType.keyvalue; 

      if (dbluQuestionCat.keyvalue = 0) or
         (dbluQuestionCat.keyvalue = null) then
        ParamByName('Question_Category').clear
      else
        ParamByName('Question_Category').AsString := dbluQuestionCat.keyvalue;

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';
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
      try
        with DelSQL do
          begin
            Close;
            ParamByName('Product_Type').AsInteger := iPrdTyp;
            ParamByName('Question').AsInteger := iCode;
            ExecSQL;
          end;
      except messagedlg('This question has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
  end;
  {If replicating details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(12, iPrdTyp, iCode, 0, sFuncMode);
    end;
end;

procedure TPBMaintPrdTypQuFrm.DeleteQuestionList;
begin
  with qryDelQList do
    begin
      close;
      parambyname('Product_Type').asinteger := iPrdtyp;
      parambyname('Question').asinteger := icode;
      execsql;
    end;
end;

procedure TPBMaintPrdTypQuFrm.UpdateQuestionList;
var
  i, iLast: integer;
begin
  for i := 0 to pred(sQuestionList.count) do
    begin
      with qryLastQList do
        begin
          close;
          parambyname('Product_Type').asinteger := iPrdtyp;
          parambyname('Question').asinteger := icode;
          open;
          first;
          iLast := fieldbyname('Last_Code').asinteger;

        end;

      with qryAddQList do
        begin
          close;
          parambyname('Product_Type').asinteger := iPrdtyp;
          parambyname('Question').asinteger := icode;
          parambyname('Question_List_no').asinteger := iLast;
          parambyname('Question_List_Descr').asstring := sQuestionList.Strings[i];
          execsql;
        end;
    end;
end;

procedure TPBMaintPrdTypQuFrm.DisplayItems;
begin
  btnItems.visible := ((DBLUPromptType.keyvalue = 'cbo') or
                      (DBLUPromptType.keyvalue = 'lst'));
  lblItems.visible := ((DBLUPromptType.keyvalue = 'cbo') or
                      (DBLUPromptType.keyvalue = 'lst'));

end;

procedure TPBMaintPrdTypQuFrm.TextEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPrdTypQuFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Product_TypeQuestion ' +
            '(Product_Type,Question,Question_Text) ' +
            'VALUES(' + IntToStr(iPrdTyp) + ', 0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPrdTypQuFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product_TypeQuestion Where Product_Type=' +
            IntToStr(iPrdTyp) + ' And Question=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPrdTypQuFrm.GetNextKey: integer;
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
      Result := FieldByName('Question').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintPrdTypQuFrm.DBLUPromptTypeClick(Sender: TObject);
begin
  DisplayItems;
end;

procedure TPBMaintPrdTypQuFrm.BtnItemsClick(Sender: TObject);
var
  i: integer;
begin
  PBLUPrdTypQuListFrm := TPBLUPrdTypQuListFrm.create(self);

  try
    for i := 0 to pred(sQuestionList.count) do
      PBLUPrdTypQuListFrm.memoList.Lines.add(sQuestionList[i]);

    PBLUPrdTypQuListFrm.showmodal;
    if PBLUPrdTypQuListFrm.modalresult = idOK then
      begin
        sQuestionList.clear;
        for i := 0 to pred(PBLUPrdTypQuListFrm.memoList.Lines.count) do
          begin
            if trim(PBLUPrdTypQuListFrm.memoList.Lines[i]) = '' then
              continue;
            sQuestionList.add(PBLUPrdTypQuListFrm.memoList.Lines[i]);
          end;
      end
  finally
    PBLUPrdTypQuListFrm.free
  end;
end;

procedure TPBMaintPrdTypQuFrm.FormDeactivate(Sender: TObject);
begin
  sQuestionList.free;
end;

end.
