unit WTMaintStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, QrCtrls, DBCtrls, ComCtrls,
  ExtCtrls, ToolWin, ImgList, SHELLAPI, taoMapi, Activex, AxCtrls, Clipbrd, ComObj, Menus,
  CRControls, System.ImageList;

type
  TfrmWTMaintStore = class(TForm)
    lblName: TLabel;
    edtName: TEdit;
    qryGetLastNo: TQuery;
    qryAdd: TQuery;
    qryUpd: TQuery;
    qryDel: TQuery;
    Label34: TLabel;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    Label35: TLabel;
    Label37: TLabel;
    edtPostcode: TEdit;
    Label39: TLabel;
    edtCounty: TEdit;
    qryGetAddress: TQuery;
    qryAddAddress: TQuery;
    qryUpAddress: TQuery;
    qryGetNextAdd: TQuery;
    imgDocuments: TImageList;
    imgIcons: TImageList;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryGetStore: TQuery;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    iInstallationNotes: integer;
    FCustomerName: string;
    procedure GetAddress(iAddress: integer);
    procedure SetCustomerName(const Value: string);
    { Private declarations }
  public
    bOK: boolean;
    iCode, iAddress: integer;
    sFuncMode: string;
    sName: string;
    property CustomerName: string read FCustomerName write SetCustomerName;
  end;

var
  frmWTMaintStore: TfrmWTMaintStore;

implementation

uses wtDataModule, AllCommon;

{$R *.dfm}

procedure TfrmWTMaintStore.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
    begin
      {Empty details};
      edtName.Text := '';
      edtName.SetFocus;
      iAddress := 0;
      chkbxInactive.Checked := false;
    end
  else
    begin
      with qryGetStore do
        begin
          close;
          parambyname('Store').asinteger := iCode;
          open;
          edtName.Text := fieldbyname('Address_Name').asstring;
          iAddress := fieldbyname('Address').asinteger;

          chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');

          GetAddress(iAddress);
        end;

      edtName.setfocus;
    end;

  edtName.Enabled := (sFuncMode <> 'D');
  enableok(self);
end;

procedure TfrmWTMaintStore.btnOKClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A'] then
    begin
      if iCode = 0 then
        begin
          with qryGetLastNo do
            begin
              close;
              open;
              iCode := fieldbyname('Last_no').asinteger + 1
            end;
        end;

      with qryGetNextAdd do
        begin
          close;
          open;
          iAddress := fieldbyname('Last_Address').asinteger + 1;
        end;

      with qryAddAddress do
        begin
          close;
          parambyname('Address').asinteger := iAddress;
          parambyname('Address_Name').asstring := edtName.text;
          parambyname('Street').asstring := edtStreet.text;
          parambyname('Locale').asstring := edtlocale.text;
          parambyname('Town_City').asstring := edtTown.text;
          parambyname('Postcode').asstring := edtPostcode.text;
          parambyname('County_State').asstring := edtCounty.text;
          parambyname('Email_address').asstring := '';
          parambyname('Telephone_number').asstring:= '';
          parambyname('Installation_Address').asstring := 'Y';
          execsql;
        end;

      with qryAdd do
        begin
          close;
          parambyname('Store').asinteger := iCode;
          parambyname('Address').asinteger := iAddress;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';
          execsql;
        end;
    end
  else
  if sFuncMode[1] in ['C'] then
    begin
      if iAddress = 0 then
        begin
          with qryGetNextAdd do
            begin
              close;
              open;
              iAddress := fieldbyname('Last_Address').asinteger + 1;
            end;
          with qryAddAddress do
            begin
              close;
              parambyname('Address').asinteger := iAddress;
              parambyname('Address_Name').asstring := edtName.text;
              parambyname('Street').asstring := edtStreet.text;
              parambyname('Locale').asstring := edtlocale.text;
              parambyname('Town_City').asstring := edtTown.text;
              parambyname('Postcode').asstring := edtPostcode.text;
              parambyname('County_State').asstring := edtCounty.text;
              parambyname('Email_address').asstring := '';
              parambyname('Telephone_number').asstring:= '';
              parambyname('Installation_Address').asstring := 'Y';
              execsql;
            end;
        end
      else
        begin
          with qryUpAddress do
            begin
              close;
              parambyname('Address').asinteger := iAddress;
              parambyname('Address_Name').asstring := edtName.text;
              parambyname('Street').asstring := edtStreet.text;
              parambyname('Locale').asstring := edtlocale.text;
              parambyname('Town_City').asstring := edtTown.text;
              parambyname('Postcode').asstring := edtPostcode.text;
              parambyname('County_State').asstring := edtCounty.text;
              parambyname('Email_address').asstring := '';
              parambyname('Telephone_number').asstring := '';
              execsql;
            end;
        end;
      with qryUpd do
        begin
          close;
          parambyname('Store').asinteger := iCode;
          parambyname('Address').asinteger := iAddress;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';
          execsql;
        end;
    end
  else
    begin
      with qryDel do
        begin
          close;
          parambyname('Site').asinteger := iCode;
          execsql;
        end;
    end;

  bOK := true;
end;

procedure TfrmWTMaintStore.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtName.Text <> '') and
                    (edtStreet.Text <> '') and
                    (edtPostcode.Text <> '');
end;

procedure TfrmWTMaintStore.GetAddress(iAddress: integer);
begin
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := iAddress;
      open;

      edtstreet.text := fieldbyname('Street').asstring;
      edtlocale.text := fieldbyname('Locale').asstring;
      edttown.text := fieldbyname('Town_City').asstring;
      edtpostcode.text := fieldbyname('Postcode').asstring;
      edtcounty.text := fieldbyname('County_State').asstring;
    end;
end;

procedure TfrmWTMaintStore.SetCustomerName(const Value: string);
begin
end;

procedure TfrmWTMaintStore.FormCreate(Sender: TObject);
begin
  AllCommon.LoadFormLayout('myWorktops.ini', self);
end;

procedure TfrmWTMaintStore.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout('myWorktops.ini', self);
end;

end.
