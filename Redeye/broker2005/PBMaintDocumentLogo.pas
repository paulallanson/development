unit PBMaintDocumentLogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, ExtDlgs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBMaintDocumentLogos = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtLogoName: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    Label7: TLabel;
    edtLogoPath: TEdit;
    Button3: TButton;
    chkbxInactive: TCheckBox;
    cmbDocumentType: TComboBox;
    Label2: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmPBMaintDocumentLogos: TfrmPBMaintDocumentLogos;

implementation

uses PBLUDocumentLogos;

{$R *.dfm}

procedure TfrmPBMaintDocumentLogos.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmPBMaintDocumentLogos.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmPBMaintDocumentLogos.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtLogoName.Text) <> '') AND
                    (trim(edtLogoPath.Text) <> '') AND
                    (cmbDocumentType.Text <> '');
end;

procedure TfrmPBMaintDocumentLogos.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtLogoName.Text := '';
      edtLogoPath.Text := '';

      cmbDocumentType.itemindex := -1;
      chkbxInactive.Checked := false;

    end
  else
    with frmPBLUDocumentLogos.qryDocumentLogo do
      begin
        iCode := fieldbyname('ID').asinteger;

        edtLogoName.Text := fieldbyname('Logo_Name').asstring;

        {Load image}
        edtLogoPath.Text := fieldbyname('Logo_Path').asstring;

        cmbDocumentType.Itemindex := 1;

        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmPBMaintDocumentLogos.SaveToDB;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Logo_Name').asstring := edtLogoName.Text;
          parambyname('Logo_Path').asstring := edtLogoPath.Text;
          parambyname('Document_Type').asstring := 'L';

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
          parambyname('ID').asinteger := iCode;

          parambyname('Logo_Name').asstring := edtLogoName.Text;

          parambyname('Logo_Path').asstring := edtLogoPath.Text;
          parambyname('Document_Type').asstring := 'L';

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmPBMaintDocumentLogos.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Last_ID').AsInteger;
    end;
end;

procedure TfrmPBMaintDocumentLogos.Button3Click(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
    try
//      Caption := 'Open Image';
      Options := [ofPathMustExist, ofFileMustExist];
      if Execute then
        begin
          edtLogoPath.text := filename;
        end;
    finally
      Free;
    end;
end;

end.
