unit PBMaintRevenueLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, jpeg, ExtCtrls, ExtDlgs,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRevenueLocFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    DetsSRC: TDataSource;
    qryZero: TFDQuery;
    chkbxActive: TCheckBox;
    chkbxDefault: TCheckBox;
    Label2: TLabel;
    edtColor: TEdit;
    Button1: TButton;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    Label7: TLabel;
    edtLogoPath: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    imgLogo: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Label3: TLabel;
    Label4: TLabel;
    memRegistered: TMemo;
    memPayment: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    iPaymentNarrative: integer;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintRevenueLocFrm: TPBMaintRevenueLocFrm;

implementation

uses UITypes, ComObj, ActiveX, PBDatabase, pbMainMenu, PBLURevenueLoc;

{$R *.DFM}

procedure TPBMaintRevenueLocFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Revenue Centre';
  if sFuncMode = 'C' then
    Caption := 'Change a Revenue Centre';
  if sFuncMode = 'D' then
    Caption := 'Delete a Revenue Centre';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    memPayment.clear;
    memRegistered.clear;
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLURevenueLocFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Invoice_Location').AsInteger;
      DescrEdit.Text := FieldByName('Invoice_Location_Descr').AsString;

      iPaymentNarrative := FieldByName('Invoice_Payment_Notes').Asinteger;
      memPayment.Text := dmBroker.GetNarrative(iPaymentNarrative);
      memRegistered.Text := FieldByName('Registered_Address').AsString;

      if FieldByName('Color').Asinteger <> 0 then
        begin
          edtColor.color := FieldByName('Color').Asinteger;
          edtColor.font.color := FieldByName('Font_Color').Asinteger;
        end;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
      ChkBxDefault.checked := (fieldByName('Default_PM_Revenue_Centre').AsString = 'Y');

      {Load image}
      try
        imgLogo.Picture.LoadFromFile(fieldbyname('Logo_Path').asstring);
        edtLogoPath.Text := fieldbyname('Logo_Path').asstring;
      except
        imgLogo.Picture.LoadFromFile('');
        edtLogoPath.Text := '';
      end;

      if fieldbyname('Logo_Path').asstring = '' then
        edtLogoPath.Text := '';
    end;
  end;

  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuRevenueCentres',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintRevenueLocFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintRevenueLocFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintRevenueLocFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRevenueLocFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRevenueLocFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNarr: integer;
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Invoice_Location').AsInteger := iCode;
      ParamByName('Invoice_Location_Descr').AsString := DescrEdit.Text + '';
      ParamByName('Color').Asinteger := edtColor.color;
      ParamByName('Font_Color').Asinteger := edtColor.font.color;
      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      if ChkBxDefault.checked then
        ParamByName('Default_PM_Revenue_Centre').AsString := 'Y'
      else
        ParamByName('Default_PM_Revenue_Centre').AsString := 'N';

      ParamByName('Logo_Path').AsString := edtLogoPath.text;

      iTempNarr := iPaymentNarrative;
      dmBroker.SaveNarrative(iTempNarr,memPayment.Text);
      iPaymentNarrative := iTempNarr;
      if iPaymentNarrative = 0 then
        ParambyName('Invoice_Payment_Notes').clear
      else
        ParambyName('Invoice_Payment_Notes').Asinteger := iPaymentNarrative;

      ParambyName('Registered_address').asstring := memRegistered.Text;
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Invoice_Location').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintRevenueLocFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRevenueLocFrm.UnitFactorEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintRevenueLocFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Invoice_Location ' +
            '(Invoice_Location,Invoice_Location_Descr) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintRevenueLocFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Invoice_Location Where Invoice_Location=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintRevenueLocFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
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
      Result := FieldByName('Invoice_Location').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintRevenueLocFrm.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;
end;

procedure TPBMaintRevenueLocFrm.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;

end;

procedure TPBMaintRevenueLocFrm.Button3Click(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
    try
      Options := [ofPathMustExist, ofFileMustExist];
      if Execute then
        begin
          imgLogo.Picture.LoadFromFile(FileName);
          edtLogoPath.text := filename;
        end;
    finally
      Free;
    end;
end;

end.
