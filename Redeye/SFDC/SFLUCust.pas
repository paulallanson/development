unit SFLUCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons, DBCtrls;

type
  TSFLUCustFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    dbgDetails: TDBGrid;
    SearchGrpBox: TGroupBox;
    edtName: TEdit;
    tmrSearch: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    SelectedSQL: TQuery;
    NullSRC: TDataSource;
    DispPanel: TPanel;
    DBCustText: TDBText;
    DBPhoneText: TDBText;
    DBFaxText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    RepLabel: TLabel;
    DBRepText: TDBText;
    chkbxShowInactive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure dbgDetailsColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    DisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName, SelAccount, SelPrefix: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  SFLUCustFrm: TSFLUCustFrm;

implementation

uses pbDatabase;

{$R *.DFM}

procedure TSFLUCustFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customers';
    SelectBitBtn.Visible := False;
  end;
  {Load up the string grid}
  ShowGrid(Self);
  edtName.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
end;

procedure TSFLUCustFrm.ShowGrid(Sender: TObject);
begin
  with getdetssql do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + edtName.Text + '%';
    if chkbxShowInactive.Checked then
      ParamByName('Active_Only').AsString := 'Y'
    else
      ParamByName('Active_Only').AsString := 'N';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TSFLUCustFrm.edtNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSFLUCustFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  ShowGrid(Self);
end;

procedure TSFLUCustFrm.dbgDetailsColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TSFLUCustFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TSFLUCustFrm.SelectCode(Sender: TObject);
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
  SelName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
  SelAccount := dbgDetails.datasource.DataSet.FieldByName('Account_Code').AsString;
  with SelectedSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := SelCode;
    Open;
    First;
  end;
  Selected := True;
end;

procedure TSFLUCustFrm.dbgDetailsDblClick(Sender: TObject);
begin
   If bIs_Lookup then
     begin
        SelectCode(Self);
        Close;
     end;
end;

procedure TSFLUCustFrm.FindInGrid(iTempSel: Integer);
begin
  dbgDetails.datasource := NullSRC;
  {Find the item you just changed}
  with dbgDetails.datasource.DataSet do
  begin
    First;
    if iTempSel <> 0 then
    begin
      while (not (EOF)) and (FieldByName('Customer').AsInteger <> iTempSel) do
        Next;
    end;
  end;
  dbgDetails.datasource := DetsSRC;
end;

procedure TSFLUCustFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  dbgDetails.datasource := detsSRC;
  dbCustText.DataSource := dbgDetails.DataSource;
  dbPhoneText.DataSource := dbgDetails.DataSource;
  dbFaxText.DataSource := dbgDetails.DataSource;
  dbRepText.DataSource := dbgDetails.DataSource;
  DisableNameChangeEvent := False;
end;

procedure TSFLUCustFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSFLUCustFrm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
