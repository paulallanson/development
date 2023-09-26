unit wtMaintOffer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, jpeg, ExtCtrls, ExtDlgs, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtMaintOffer = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    edtImagePath: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    imgOffer: TImage;
    Label7: TLabel;
    btnEffectiveDate: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    edtEffectiveDate: TEdit;
    edtInEffectiveDate: TEdit;
    edtDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    edtShortDescription: TMemo;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnEffectiveDateClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtEffectiveDateExit(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    function InputDate(TempDate: TDateTime): TDateTime;
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmwtMaintOffer: TfrmwtMaintOffer;

implementation

uses
  System.UITypes,
  wtLUOffer, DateSelV5, Allcommon;

{$R *.dfm}

procedure TfrmwtMaintOffer.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TfrmwtMaintOffer.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmwtMaintOffer.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtDescription.Text) <> '') and
                    (edtEffectiveDate.Text <> '');
end;

procedure TfrmwtMaintOffer.FormActivate(Sender: TObject);
begin
  if functionMode <> 'A' then
    begin
      iCode := frmWtLUOffer.qrySalesOffer.fieldbyname('Sale_Offer').asinteger;
      
      edtDescription.Text := frmWtLUOffer.qrySalesOffer.fieldbyname('Description').asstring;
      edtShortDescription.Text := frmWtLUOffer.qrySalesOffer.fieldbyname('Short_Description').asstring;
      chkbxInactive.Checked := (frmWtLUOffer.qrySalesOffer.fieldbyname('inActive').asstring = 'Y');

      {Load dates}
      edtEffectiveDate.text := padatestr(frmWtLUOffer.qrySalesOffer.fieldbyname('effective_date').asdatetime);
      edtInEffectiveDate.text := padatestr(frmWtLUOffer.qrySalesOffer.fieldbyname('Ineffective_date').asdatetime);

      {Load image}
      try
        imgOffer.Picture.LoadFromFile(frmWtLUOffer.qrySalesOffer.fieldbyname('Image_Path').asstring);
        edtImagePath.Text := frmWtLUOffer.qrySalesOffer.fieldbyname('Image_Path').asstring;
      except
        imgOffer.Picture.LoadFromFile('');
        edtImagePath.Text := '';
      end;
      EnableOK(self);
    end
  else
    begin
      edtDescription.Text := '';
      edtShortDescription.Text := '';

      edtEffectiveDate.text := '';
      edtInEffectiveDate.text := '';

      imgOffer.Picture.LoadFromFile('');
      edtImagePath.Text := '';
    end;
end;

procedure TfrmwtMaintOffer.Button3Click(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
    try
//      Caption := 'Open Image';
      Options := [ofPathMustExist, ofFileMustExist];
      if Execute then
        begin
          imgOffer.Picture.LoadFromFile(FileName);
          edtImagePath.text := filename;
        end;
    finally
      Free;
    end;
end;

procedure TfrmwtMaintOffer.btnEffectiveDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtEffectiveDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtEffectiveDate.text;

  edtEffectiveDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmwtMaintOffer.BitBtn1Click(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtInEffectiveDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtEffectiveDate.text;

  edtInEffectiveDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmwtMaintOffer.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmwtMaintOffer.BitBtn5Click(Sender: TObject);
begin
  edtEffectiveDate.Clear;
end;

procedure TfrmwtMaintOffer.BitBtn3Click(Sender: TObject);
begin
  edtInEffectiveDate.Clear;
end;

procedure TfrmwtMaintOffer.edtEffectiveDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmwtMaintOffer.SaveToDB;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Description').asstring := edtDescription.Text;
          parambyname('Short_Description').asstring := edtShortDescription.Text;

          if chkbxInactive.Checked then
            parambyname('inActive').asstring := 'Y'
          else
            parambyname('inActive').asstring := 'N';

          if edtIneffectiveDate.Text = '' then
            parambyname('Ineffective_Date').clear
          else
            parambyname('Ineffective_Date').asdatetime := padatestr(edtIneffectiveDate.Text);

          parambyname('effective_Date').asdatetime := padatestr(edteffectiveDate.Text);

          parambyname('Image_Path').asstring := edtImagePath.text;

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('Sale_Offer').asinteger := iCode;

          parambyname('Description').asstring := edtDescription.Text;
          parambyname('Short_Description').asstring := edtShortDescription.Text;

          if chkbxInactive.Checked then
            parambyname('inActive').asstring := 'Y'
          else
            parambyname('inActive').asstring := 'N';

          if edtIneffectiveDate.Text = '' then
            parambyname('Ineffective_Date').clear
          else
            parambyname('Ineffective_Date').asdatetime := padatestr(edtIneffectiveDate.Text);

          parambyname('effective_Date').asdatetime := padatestr(edteffectiveDate.Text);

          parambyname('Image_Path').asstring := edtImagePath.text;
          ExecSQL;
        end;
    end;
  end;
end;

function TfrmwtMaintOffer.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Sale_Offer').AsInteger;
    end;
end;

end.
