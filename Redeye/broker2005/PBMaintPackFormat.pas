unit PBMaintPackFormat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPackFormatFrm = class(TForm)
    grpbxDetails: TGroupBox;
    lblDelete: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryInsPackFormat: TFDQuery;
    qryUpdPackFormat: TFDQuery;
    qryDelPackFormat: TFDQuery;
    lblDescription: TLabel;
    edtDescription: TEdit;
    qryGetLastID: TFDQuery;
    chkbxInactive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
  private
  public
    sFuncMode: string[1];
    SelCode: integer;
  end;

var
  PBMaintPackFormatFrm: TPBMaintPackFormatFrm;

implementation

uses PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintPackFormatFrm.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
    Caption := 'Add a new Pack Format';
  if sFuncMode = 'C' then
    Caption := 'Change a Pack Format';
  if sFuncMode = 'D' then
    Caption := 'Delete a Pack Format';

  {Enable or disable the buttons}
  grpbxDetails.Enabled := (sFuncMode <> 'D');
  lblDelete.Visible := (sFuncMode = 'D');
  dmBroker.ScreenAccessControl(Self,'mnuPackFormats',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPackFormatFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode = 'A' then
  begin
    with Self.qryInsPackFormat do
    begin
      ParamByName('Pack_Format_Description').asString := edtDescription.Text;
      if chkbxInactive.Checked then
        ParamByName('inactive').asString := 'Y'
      else
        ParamByName('inactive').asString := 'N';
      ExecSQL;
    end;
    with Self.qryGetLastID do
    begin
      close;
      open;
      SelCode := fieldbyname('Last_ID').AsInteger
    end;
  end
  else
  if sFuncMode = 'C' then
  begin
    with Self.qryUpdPackFormat do
    begin
      ParamByName('ID').asinteger := SelCode;
      ParamByName('Pack_Format_Description').asString := edtDescription.Text;
      if chkbxInactive.Checked then
        ParamByName('inactive').asString := 'Y'
      else
        ParamByName('inactive').asString := 'N';
      ExecSQL;
    end;
  end
  else
  begin
    with Self.qryDelPackFormat do
    begin
      ParamByName('ID').asInteger := SelCode;
      ExecSQL;
    end;
  end;
end;

procedure TPBMaintPackFormatFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtDescription.Text <> '');
end;

end.
