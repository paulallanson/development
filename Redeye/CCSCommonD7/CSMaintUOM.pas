(*******************************************************************************

Copyright (c) Centrereed Ltd 2004

Comments
--------
  Maintain UOM Description.

VSS Info:
$Header: $
$History: $
 *

*******************************************************************************)
unit CSMaintUOM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB;

type
  TCSMaintUOMFrm = class(TForm)
    DetsGroupBox: TGroupBox;
    edtDescription: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DeleteLabel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode: string;
    sDescription, skeyField: string;
    iCode: Integer;
  end;

var
  CSMaintUOMFrm: TCSMaintUOMFrm;

implementation

uses CSGroupsDM;

{$R *.DFM}

procedure TCSMaintUOMFrm.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
    Caption := 'Add a new unit of measure'
  else
  if sFuncMode = 'C' then
    Caption := 'Change a unit of measure'
  else
  if sFuncMode = 'D' then
    Caption := 'Delete a unit of measure';
  DetsGroupBox.Enabled := (sFuncMode <> 'D');
  DeleteLabel.Visible := (sFuncMode = 'D');
  if sFuncMode = 'A' then
    edtDescription.Text := ''
  else
  begin
    edtDescription.Text := sDescription;
  end;
  CheckOK(Self);
end;

procedure TCSMaintUOMFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (Trim(edtDescription.Text) <> '');
end;

procedure TCSMaintUOMFrm.edtDescriptionChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintUOMFrm.OKBitBtnClick(Sender: TObject);
begin
  with dmGroups do
  begin
    if sKeyField = 'UOM' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextUOM;
      if sFuncMode = 'D' then
        DeleteUOM(iCode)
      else
        SaveUOM(iCode, edtDescription.Text);
    end;
  end;
end;

procedure TCSMaintUOMFrm.FormCreate(Sender: TObject);
begin
  dmGroups := TdmGroups.Create(Self);
end;

procedure TCSMaintUOMFrm.FormDestroy(Sender: TObject);
begin
  dmGroups.Free;
end;

end.
