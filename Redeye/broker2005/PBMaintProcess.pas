unit PBMaintProcess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, Mask, ComCtrls;

type
  TPBMaintProcessFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    qryZero: TQuery;
    qryPriceUnit: TQuery;
    qryCategory: TQuery;
    dtsPriceUnit: TDataSource;
    dtsCategory: TDataSource;
    qryProcessGroup: TQuery;
    dtsprocessGroup: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DetsGrpBox: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    dblkpProductCat: TDBLookupComboBox;
    edtProductType: TEdit;
    btnProdType: TButton;
    ShortEdit: TEdit;
    dblkpProcessGroup: TDBLookupComboBox;
    chkbxDefault: TCheckBox;
    chkbxInactive: TCheckBox;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    lstbxMembers: TListBox;
    lstbxMembersCodes: TListBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Label9: TLabel;
    lstbxNonMembersCodes: TListBox;
    qryMembers: TQuery;
    qryDummy: TQuery;
    qryPapers: TQuery;
    qryDelete: TQuery;
    qryAdd: TQuery;
    chkbxSimplexDuplex: TCheckBox;
    Label7: TLabel;
    qryNumberType: TQuery;
    dtsNumberType: TDataSource;
    dblkpNumberType: TDBLookupComboBox;
    chkbxPaperSize: TCheckBox;
    Label1: TLabel;
    DescrEdit: TEdit;
    Label10: TLabel;
    edtPaperPrompt: TEdit;
    TabSheet4: TTabSheet;
    chkbxSFDCSimplexDuplex: TCheckBox;
    chkbxSFDCPaperSize: TCheckBox;
    chkbxSFDCNumberUp: TCheckBox;
    Label11: TLabel;
    edtShortDescription: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure ShortDescrEditChange(Sender: TObject);
    procedure btnProdTypeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DoDelete;
    procedure DeleteFromDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    procedure SavePaperSizes;
  public
    sFuncMode: string[1];
    iCode: Integer;
    iProductType: integer;
  end;

var
  PBMaintProcessFrm: TPBMaintProcessFrm;

implementation

uses pbDatabase, pbMainMenu, ComObj, ActiveX, PBLUProcess, PBLUPrdTyp;

{$R *.DFM}

procedure TPBMaintProcessFrm.FormActivate(Sender: TObject);
begin
  with qryPriceUnit do
    begin
      close;
      open;
    end;

  with qryNumberType do
    begin
      close;
      open;
    end;

  with qryProcessGroup do
    begin
      close;
      open;
    end;

  with qryCategory do
    begin
      close;
      open;
    end;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new process';
  if sFuncMode = 'C' then
    Caption := 'Change a process';
  if sFuncMode = 'D' then
    Caption := 'Delete a process';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    ShortEdit.Text := '';
    edtShortDescription.Text := '';
//    NomAccEdit.Text := '';
//    EmailEdit.Text := '';
//    ccEmailEdit.Text := '';
    dblkpPriceUnit.KeyValue := 0;
    dblkpProductCat.KeyValue := 0;
    edtProductType.Text := '';
    edtPaperPrompt.Text := '';
  end
  else
  begin
    with PBLUProcessFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Process').AsInteger;
      iProductType := Fieldbyname('Product_Type').asinteger;
      DescrEdit.Text := FieldByName('Process_Description').AsString;
      ShortEdit.Text := FieldByName('Short_Desc').AsString;
      edtShortDescription.Text := FieldByName('Short_Description').AsString;
//      NomAccEdit.Text := FieldByName('Nominal').AsString;
//      EmailEdit.Text := FieldByName('Email').AsString;
//      ccEmailEdit.Text := FieldByName('cc_Email').AsString;
      dblkpPriceUnit.KeyValue := Fieldbyname('Price_unit').asinteger;
      dblkpProductCat.KeyValue := Fieldbyname('Category').asinteger;
      dblkpProcessGroup.KeyValue := Fieldbyname('Process_Group').asinteger;
      dblkpNumberType.KeyValue := Fieldbyname('Number_Type').asinteger;
      edtProductType.Text := Fieldbyname('Product_Type_Description').asstring;
      edtPaperPrompt.Text := Fieldbyname('Paper_Prompt_Narrative').asstring;
      chkbxDefault.Checked := (fieldbyname('Use_as_Default').asstring = 'Y');
      chkbxInactive.Checked := (fieldbyname('Inactive').asstring = 'Y');
      chkbxSimplexDuplex.Checked := (fieldbyname('Prompt_for_laser_format').asstring = 'Y');
      chkbxPaperSize.Checked := (fieldbyname('Prompt_for_Paper_Size').asstring = 'Y');

      chkbxSFDCSimplexDuplex.Checked := (fieldbyname('SFDC_Prompt_for_laser_format').asstring = 'Y');
      chkbxSFDCPaperSize.Checked := (fieldbyname('SFDC_Prompt_for_Paper_Size').asstring = 'Y');
      chkbxSFDCNumberUp.Checked := (fieldbyname('SFDC_Prompt_for_Number_Up').asstring = 'Y');
    end;
  end;

  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');

  RefreshData;
  RefreshNonMemberData;

  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProcesses',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProcessFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
                      (edtProductType.Text <> '') and
                      (dblkpPriceUnit.Text <> '') and
                      (dblkpProcessGroup.text <> '');
end;

procedure TPBMaintProcessFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProcessFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with UpdSQL do
    begin
      Close;
      ParamByName('Process').AsInteger := iCode;
      ParamByName('Process_Description').AsString := DescrEdit.Text + '';
      ParamByName('Short_Desc').AsString := ShortEdit.Text + '';
      ParamByName('Short_Description').AsString := edtShortDescription.Text + '';
      ParamByName('Paper_Prompt_Narrative').AsString := edtPaperPrompt.Text + '';
//      ParamByName('Nominal').AsString := NomAccEdit.Text + '';
//      ParamByName('Email').AsString := EmailEdit.Text + '';
//      ParamByName('cc_Email').AsString := ccEmailEdit.Text + '';
      Parambyname('Price_unit').asinteger := dblkpPriceUnit.KeyValue;
      Parambyname('Product_Type').asinteger := iProductType;
      Parambyname('Process_Group').asinteger := dblkpProcessGroup.keyvalue;
      if dblkpNumberType.text = '' then
        Parambyname('Number_Type').clear
      else
        Parambyname('Number_Type').asinteger := dblkpNumberType.keyvalue;
      if chkbxDefault.checked then
        ParamByName('Use_as_Default').AsString := 'Y'
      else
        ParamByName('Use_as_Default').AsString := 'N';

      if chkbxInactive.checked then
        ParamByName('Inactive').AsString := 'Y'
      else
        ParamByName('Inactive').AsString := 'N';

      if chkbxSimplexDuplex.checked then
        ParamByName('Prompt_For_Laser_Format').AsString := 'Y'
      else
        ParamByName('Prompt_For_Laser_Format').AsString := 'N';

      if chkbxPaperSize.checked then
        ParamByName('Prompt_For_Paper_Size').AsString := 'Y'
      else
        ParamByName('Prompt_For_Paper_Size').AsString := 'N';

      if chkbxSFDCSimplexDuplex.checked then
        ParamByName('SFDC_Prompt_For_Laser_Format').AsString := 'Y'
      else
        ParamByName('SFDC_Prompt_For_Laser_Format').AsString := 'N';

      if chkbxSFDCPaperSize.checked then
        ParamByName('SFDC_Prompt_For_Paper_Size').AsString := 'Y'
      else
        ParamByName('SFDC_Prompt_For_Paper_Size').AsString := 'N';

      if chkbxSFDCNumberUp.checked then
        ParamByName('SFDC_Prompt_For_Number_Up').AsString := 'Y'
      else
        ParamByName('SFDC_Prompt_For_Number_Up').AsString := 'N';
      ExecSQL;
    end;
    SavePaperSizes;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;
end;

procedure TPBMaintProcessFrm.SavePaperSizes;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Process').asinteger := iCode;
        parambyname('Paper_Size').asinteger := strtoint(lstbxMembersCodes.items[i]);
        parambyname('Inactive').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintProcessFrm.DeleteFromDB;
begin
  with qryDelete do
    begin
      close;
      parambyname('Process').asinteger := iCode;
      execsql;
    end;
end;

procedure TPBMaintProcessFrm.ShortDescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Process ' +
            '(Process,Process_Description, Nominal) ' +
            'VALUES(0, ''Dummy'', '' '')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProcessFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process Where Process=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintProcessFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Process').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintProcessFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process_Paper_Size ' +
            'Where Process=' + IntToStr(iCode));
    ExecSQL;
    SQL.Add('Delete From Process_Question ' +
            'Where Process=' + IntToStr(iCode));
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete From Process ' +
            'Where Process=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TPBMaintProcessFrm.btnProdTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := iProductType;
    PBLUPrdTypFrm.Category := dblkpProductCat.KeyValue;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      iProductType := PBLUPrdTypFrm.SelCode;
      edtProductType.Text := PBLUPrdTypFrm.SelName;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintProcessFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Process').asinteger := iCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Paper_Size_Description').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Paper_Size').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintProcessFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryPapers do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Paper_Size.Paper_Size NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');

      sql.Add('ORDER BY Paper_Size_Description');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Paper_Size_Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Paper_Size').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintProcessFrm.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonMembers.items.count) do
    begin
      if lstbxNonMembers.Selected[i] then
        begin
          lstbxMembers.Items.Add(lstbxNonMembers.items[i]);
          lstbxMembersCodes.Items.Add(lstbxNonMembersCodes.items[i]);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TPBMaintProcessFrm.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxMembers.items.count) downto 0 do
    begin
      if lstbxMembers.Selected[i] then
        begin
          lstbxMembers.Items.Delete(i);
          lstbxMembersCodes.Items.Delete(i);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TPBMaintProcessFrm.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintProcessFrm.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

procedure TPBMaintProcessFrm.lstbxNonMembersClick(Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintProcessFrm.lstbxMembersClick(Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

end.
