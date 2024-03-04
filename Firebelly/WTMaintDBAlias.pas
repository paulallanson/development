unit WTMaintDBAlias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Comp.Client;

type
  TWTMaintDBAliasFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    DelLabel: TLabel;
    edtAliasName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDatabaseName: TEdit;
    edtServerName: TEdit;
    OKbitBtn: TButton;
    Cancelbitbtn: TButton;
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
  WTMaintDBAliasFrm: TWTMaintDBAliasFrm;

implementation

uses UITypes;

{$R *.DFM}

procedure TWTMaintDBAliasFrm.FormActivate(Sender: TObject);
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
    var ConnectionName: string := 'Worktop';
    var ConnDef: IFDStanConnectionDef;
    var Params: TStrings;
    ConnDef := FDManager.ConnectionDefs.ConnectionDefByName(ConnectionName);

    if Assigned(ConnDef) then
    begin
      edtAliasName.Text := ConnDef.Name;
      Params := ConnDef.Params;
      for var i := 0 to Params.Count-1 do
      begin
        if Params.Names[i] = 'DATABASE' then
          edtDatabaseName.Text := Params.ValueFromIndex[i]
        else
        if Params.Names[i] = 'SERVER' then
          edtServerName.Text := Params.ValueFromIndex[i]
      end;
    end;
  end;

  {Enable or disable the buttons}
  edtAliasName.Enabled := (sFuncmode = 'A');
  edtdatabaseName.Enabled := (sFuncmode <> 'D');
  edtServerName.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
end;

procedure TWTMaintDBAliasFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtAliasName.Text <> '') and
                      (edtDatabaseName.Text <> '') and
                      (edtServerName.text <> '');
end;

procedure TWTMaintDBAliasFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TWTMaintDBAliasFrm.OKBitBtnClick(Sender: TObject);
var
  sgList: TStringList;
begin
  if sFuncMode = 'A' then
    begin
      sgList := TStringList.Create;
      try
        sgList.Add('DATABASE='+edtDatabaseName.text);
        sgList.Add('SERVER='+edtServerName.text);
        FDManager.AddConnectionDef(edtAliasName.text, 'MSSQL', sgList);
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
        sgList.Add('DATABASE='+edtDatabaseName.text);
        sgList.Add('SERVER='+edtServerName.text);
        FDManager.ModifyConnectionDef(edtAliasName.text,sgList);
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
        FDManager.DeleteConnectionDef(edtAliasName.text);
      end;
    end;
  FDManager.SaveConnectionDefFile;

  sCode := edtAliasName.Text;
end;

end.
