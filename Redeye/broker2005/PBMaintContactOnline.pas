unit PBMaintContactOnline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintContactOnlineFrm = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryNextWebUserID: TFDQuery;
    qryInsWebUser: TFDQuery;
    qryGetContact: TFDQuery;
    UpdSQL: TFDQuery;
    qrySelWebUserID: TFDQuery;
    qryUpdWebUser: TFDQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtUserName: TEdit;
    edtPassword: TEdit;
    chkbxActive: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtConsumerID: TEdit;
    qryCheckUserName: TFDQuery;
    Label4: TLabel;
    dblkpWebRole: TDBLookupComboBox;
    qryWebRole: TFDQuery;
    dtsWebRole: TDataSource;
    chkbxCanEnterRetail: TCheckBox;
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    WebUserID: integer;
    function GetNextWebUserID: integer;
    function SaveWebUserInfo: integer;
    function UserExists(tmpName: string): boolean;
    { Private declarations }
  public
    iCode, iCust, iBranch: Integer;
  end;

var
  PBMaintContactOnlineFrm: TPBMaintContactOnlineFrm;

implementation

{$R *.dfm}

procedure TPBMaintContactOnlineFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  ((edtUserName.text <> '') and
                    (edtPassword.text <> '')) or
                    (edtConsumerID.Text <> '');
end;


function TPBMaintContactOnlineFrm.SaveWebUserInfo: integer;
begin
  if WebUserID = 0 then
  begin
    //insert account info
    WebUserID := GetNextWebUserID;
    if WebUserID <> -1 then
    begin
      qryInsWebUser.close;
      qryInsWebUser.ParamByName('Web_User_ID').asInteger := WebUserID;
      qryInsWebUser.ParamByName('User_Name').asString := edtUserName.Text;
      qryInsWebUser.ParamByName('Consumer_ID').asString := edtConsumerID.Text;
      qryInsWebUser.ParamByName('Password').asString := edtPassword.Text;
      qryInsWebUser.ParamByName('Web_User_Role').asInteger := dblkpWebRole.keyvalue;
      if chkbxActive.checked then
        qryInsWebUser.ParamByName('Active_User').asString := 'Y'
      else
        qryInsWebUser.ParamByName('Active_User').asString := 'N';

      if chkbxCanEnterRetail.checked then
        qryInsWebUser.ParamByName('Enter_Retail_Price').asString := 'Y'
      else
        qryInsWebUser.ParamByName('Enter_Retail_Price').asString := 'N';

      qryInsWebUser.ExecSQL;
    end
    else
    begin
      MessageDlg('Could not save account details.', mtWarning, [mbOK], 0);
    end;
  end
  else
  begin
    //update account info
    qryUpdWebUser.close;
    qryUpdWebUser.ParamByName('Web_User_ID').asInteger := WebUserID;
    qryUpdWebUser.ParamByName('User_Name').asString := edtUserName.Text;
    qryUpdWebUser.ParamByName('Password').asString := edtPassword.Text;
    qryUpdWebUser.ParamByName('Consumer_ID').asString := edtConsumerID.Text;
    qryUpdWebUser.ParamByName('Web_User_Role').asInteger := dblkpWebRole.keyvalue;

    if chkbxActive.checked then
      qryUpdWebUser.ParamByName('Active_User').asString := 'Y'
    else
      qryUpdWebUser.ParamByName('Active_User').asString := 'N';

    if chkbxCanEnterRetail.checked then
      qryUpdWebUser.ParamByName('Enter_Retail_Price').asString := 'Y'
    else
      qryUpdWebUser.ParamByName('Enter_Retail_Price').asString := 'N';

    qryUpdWebUser.ExecSQL;
  end;

  Result := WebUserID;
end;

function TPBMaintContactOnlineFrm.GetNextWebUserID: integer;
begin
  try
    qryNextWebUserID.Open;
    Result := qryNextWebUserID.FieldByName('Web_User_ID').AsInteger;

    if Result = 0 then
      Result := 1;
  except
    Result := -1;
  end;

  qryNextWebUserID.Close;
end;

procedure TPBMaintContactOnlineFrm.btnOKClick(Sender: TObject);
begin
  {Check if user name already exists}
  if trim(edtuserName.Text) <> '' then
    begin
      if UserExists(edtUserName.text) then
        begin
          edtusername.setfocus;
          exit;
        end;
    end;

  with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ParamByName('Web_User_id').asInteger := SaveWebUserInfo;
      ExecSQL;
    end;
  close;
end;

function TPBMaintContactOnlineFrm.UserExists(tmpName: string): boolean;
begin
  with qryCheckUserName do
    begin
      close;
      parambyname('User_Name').asstring := tmpname;
      parambyname('Customer').asinteger := iCust;
      open;
      if (recordcount > 0) then
        begin
          messagedlg('This user name already exists for ' + fieldbyname('Contact_Name').asstring
                      + ' at ' + fieldbyname('Customer_name').asstring, mtInformation, [mbOk], 0);
          result := true;
        end
      else
        result := false;
    end;
end;

procedure TPBMaintContactOnlineFrm.FormActivate(Sender: TObject);
begin
  with qryWebRole do
    begin
      close;
      open;
    end;

  with qryGetContact do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      open;

      WebUserID := fieldbyname('Web_User_ID').asinteger;

      if WebUserID <> 0 then
      begin
        qrySelWebUserID.close;
        qrySelWebUserID.ParamByName('Web_User_ID').asInteger := WebUserID;
        qrySelWebUserID.Open;

        edtConsumerID.Text := qrySelWebUserID.FieldByName('Consumer_ID').asString;
        edtUserName.Text := qrySelWebUserID.FieldByName('User_name').asString;
        edtPassword.Text := qrySelWebUserID.FieldByName('Password').asString;
        chkbxActive.checked := (qrySelWebUserID.FieldByName('Active_User').asString = 'Y');
        chkbxCanEnterRetail.checked := (qrySelWebUserID.FieldByName('Enter_Retail_Price').asString = 'Y');
        dblkpWebRole.keyvalue := qrySelWebUserID.FieldByName('Web_User_Role').asinteger;
      end;
    end;

end;

end.
