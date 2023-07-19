unit WTMaintPromotions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Spin, Mask, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintPromotions = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    lstbxMembers: TListBox;
    lstbxMembersCodes: TListBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    lstbxNonMembersCodes: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryDeleteWT: TFDQuery;
    qryAddWT: TFDQuery;
    qryMembers: TFDQuery;
    qryNonMembers: TFDQuery;
    dtsNonMembers: TDataSource;
    qryDummy: TFDQuery;
    spnMaxEntries: TSpinEdit;
    Label2: TLabel;
    chkbxInactive: TCheckBox;
    edtPromotionDescription: TEdit;
    Label5: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    dtsMaterialType: TDataSource;
    qryMaterialType: TFDQuery;
    Label6: TLabel;
    edtSearch: TEdit;
    tmrRefresh: TTimer;
    qryUpdActive: TFDQuery;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
  private
    FGroupName: string;
    FMaterialType: integer;
    FGroupCode: integer;
    FMaterialTypeName: string;
    FfunctionMode: string;
    FPromotion: integer;
    procedure SetGroupName(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure DeleteFromDB;
    procedure SaveActive;
    procedure SaveWorktopsToDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    procedure SetGroupCode(const Value: integer);
    procedure SetMaterialTypeName(const Value: string);
    procedure SetfunctionMode(const Value: string);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property FunctionMode: string read FfunctionMode write SetfunctionMode;
    property GroupCode: integer read FGroupCode write SetGroupCode;
    property GroupName: string read FGroupName write SetGroupName;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property MaterialTypeName: string read FMaterialTypeName write SetMaterialTypeName;
  end;

var
  frmWTMaintPromotions: TfrmWTMaintPromotions;

implementation

uses wtLUPromotions;

{$R *.dfm}

procedure TfrmWTMaintPromotions.FormActivate(Sender: TObject);
begin
  qryMaterialType.Active := false;
  qryMaterialType.Active := true;

  dblkpMaterialType.KeyValue := qryMaterialType.fieldbyname('Material_Type').asinteger;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtPromotionDescription.Text := '';
      spnMaxEntries.Value := 6;
      chkbxInactive.Checked := false;

    end
  else
    with frmWtLUPromotions.qryPromotions do
      begin
        iCode := fieldbyname('Promotion_Code').asinteger;

        edtPromotionDescription.Text := fieldbyname('Promotion_Description').asstring;
        spnMaxEntries.Value := fieldbyname('Maximum_Entries').asinteger;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;

  edtSearch.text := '';
  edtSearch.setfocus;
  
  RefreshData;
  RefreshNonMemberData;
end;

procedure TfrmWTMaintPromotions.SetGroupName(const Value: string);
begin
  FGroupName := Value;
end;

procedure TfrmWTMaintPromotions.SetMaterialType(
  const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintPromotions.btnOKClick(Sender: TObject);
begin
  if lstbxMembers.Items.Count > spnMaxEntries.value then
      begin
          MessageDlg('The number of colours selected is greater than the maximum entries for this promotion. Reduce the worktops selected.',
                                                mtError,[mbOK],0) ;
          exit;
      end;

  SaveToDB;

  SaveWorktopstoDB;
  if not chkbxInactive.Checked then
    SaveActive;
  close;

end;

procedure TfrmWTMaintPromotions.SaveWorktopsToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAddWT do
      begin
        close;
        parambyname('Promotion_Code').asinteger := iCode;
        parambyname('Entry_Number').asinteger := i + 1;
        parambyname('Worktop').asinteger := strtoint(lstbxMembersCodes.items[i]);
        execsql;
      end;
    end;
end;

procedure TfrmWTMaintPromotions.DeleteFromDB;
begin
  with qryDeleteWT do
    begin
      close;
      parambyname('Promotion_Code').asinteger := iCode;
      execsql;
    end;
end;

procedure TfrmWTMaintPromotions.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Promotion_Code').asinteger := iCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Worktop_Description').asstring + ' (' + fieldbyname('Material_Type_Description').asstring +')');
          lstbxMembersCodes.Items.add(fieldbyname('Worktop').asstring);
          next;
        end;
    end;
end;

procedure TfrmWTMaintPromotions.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryNonMembers do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Worktop.Worktop NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
      sql.add(' and ');
      sql.add('Worktop.Worktop not in (select Worktop from Promotion_Worktops ');
      sql.add('where Promotion_Code = ' + inttostr(iCode) + ')');
      sql.Add('ORDER BY Worktop.Description');
      parambyname('Material_Type').asinteger := dblkpMaterialType.KeyValue;
      parambyname('Description').asstring :=  '%' + edtSearch.Text + '%';
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Worktop_Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Worktop').asstring);
          next;
        end;
    end;

end;

procedure TfrmWTMaintPromotions.SetGroupCode(const Value: integer);
begin
  FGroupCode := Value;
end;

procedure TfrmWTMaintPromotions.SetMaterialTypeName(
  const Value: string);
begin
  FMaterialTypeName := Value;
end;

procedure TfrmWTMaintPromotions.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonMembers.items.count) do
    begin
      if lstbxNonMembers.Selected[i] then
        begin
          lstbxMembers.Items.Add(lstbxNonMembers.items[i] + ' (' + dblkpMaterialType.text + ')');
          lstbxMembersCodes.Items.Add(lstbxNonMembersCodes.items[i]);
        end;
    end;
  RefreshNonMemberData;

end;

procedure TfrmWTMaintPromotions.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TfrmWTMaintPromotions.lstbxMembersClick(Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;

end;

procedure TfrmWTMaintPromotions.btnRemoveClick(Sender: TObject);
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

procedure TfrmWTMaintPromotions.lstbxNonMembersDblClick(
  Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TfrmWTMaintPromotions.lstbxMembersDblClick(
  Sender: TObject);
begin
  btnRemoveClick(self);
end;

procedure TfrmWTMaintPromotions.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintPromotions.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtPromotionDescription.Text) <> '');
end;

procedure TfrmWTMaintPromotions.dblkpMaterialTypeClick(Sender: TObject);
begin
  RefreshNonMemberData;
end;

procedure TfrmWTMaintPromotions.edtSearchChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTMaintPromotions.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  RefreshNonMemberData;
end;

procedure TfrmWTMaintPromotions.SaveActive;
begin
  with qryUpdActive do
    begin
      close;
      parambyname('Promotion_Code').asinteger := iCode;
      execsql;
    end;
end;

procedure TfrmWTMaintPromotions.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Promotion_Description').asstring := edtPromotionDescription.Text;
          parambyname('Maximum_Entries').asinteger := spnMaxEntries.value;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('Promotion_Code').asinteger := iCode;

          parambyname('Promotion_Description').asstring := edtPromotionDescription.Text;
          parambyname('Maximum_Entries').asinteger := spnMaxEntries.value;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmWTMaintPromotions.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Promotion_Code').AsInteger;
    end;
end;


end.
