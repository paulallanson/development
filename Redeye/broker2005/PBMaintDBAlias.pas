unit PBMaintDBAlias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TPBMaintDBAliasFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    edtAliasName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDatabaseName: TEdit;
    edtServerName: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
  public
    sFuncMode: string[1];
    sCode, sAlias, sDatabase, sServer: string;
  end;

var
  PBMaintDBAliasFrm: TPBMaintDBAliasFrm;

implementation

uses PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintDBAliasFrm.FormActivate(Sender: TObject);
var
  sgList: TStringList;
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new alias';
  if sFuncMode = 'C' then
    Caption := 'Change an alias';
  if sFuncMode = 'D' then
    Caption := 'Delete an alias';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtAliasName.Text := '';
    edtDatabaseName.Text := '';
    edtServerName.Text := '';
  end
  else
  begin
    sgList := TStringList.Create;
    try
      session.GetAliasParams(sAlias,sgList);
      edtAliasName.Text := sAlias;
      edtDatabaseName.Text := sgList.Values['DATABASE NAME'];
      edtServerName.Text := sgList.Values['SERVER NAME'];
    finally
      sgList.free;
    end;
  end;
  {Enable or disable the buttons}
  edtAliasName.Enabled := (sFuncmode = 'A');
  edtdatabaseName.Enabled := (sFuncmode <> 'D');
  edtServerName.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuDatabaseTools',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintDBAliasFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtAliasName.Text <> '') and
                      (edtDatabaseName.Text <> '') and
                      (edtServerName.text <> '');
end;

procedure TPBMaintDBAliasFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintDBAliasFrm.OKBitBtnClick(Sender: TObject);
var
  sgList: TStringList;
begin
  if sFuncMode = 'A' then
    begin
      sgList := TStringList.Create;
      try
        sgList.Add('DATABASE NAME='+edtDatabaseName.text);
        sgList.Add('SERVER NAME='+edtServerName.text);
        Session.AddAlias(edtAliasName.text, 'MSSQL', sgList);
      finally
        sgList.Free;
      end;
    end
  else
  if sFuncMode = 'C' then
    begin
      sgList := TStringList.Create;
      try
        sgList.Clear;
        sgList.Add('DATABASE NAME='+edtDatabaseName.text);
        sgList.Add('SERVER NAME='+edtServerName.text);
        Session.ModifyAlias(edtAliasName.text,sgList);
      finally
        sgList.Free;
      end;
    end
  else
  if sFuncMode = 'D' then
    begin
      DetsGrpBox.Refresh;
      if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
        mbYes], 0) = mrYes then
      begin
        Session.DeleteAlias(edtAliasName.text);
      end;
    end;
  Session.SaveConfigFile;

  sCode := edtAliasName.Text;
end;

end.
