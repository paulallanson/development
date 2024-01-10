unit wtMaintRevenueCentre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, jpeg, ExtCtrls, ExtDlgs,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, CRControls;

type
  TfrmWTMaintRevenueCentre = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryGetLast: TFDQuery;
    qryUpdate: TFDQuery;
    qryDelete: TFDQuery;
    DetsSRC: TDataSource;
    qryZero: TFDQuery;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    qryAdd: TFDQuery;
    chkbxInActive: TCheckBox;
    qryAccounts: TFDQuery;
    dtsAccounts: TDataSource;
    pcDetails: TPageControl;
    tbsGeneral: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label25: TLabel;
    Label6: TLabel;
    DescrEdit: TEdit;
    edtColor: TEdit;
    Button1: TButton;
    Button2: TButton;
    edtLogoPath: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    imgLogo: TImage;
    memRegistered: TMemo;
    memPayment: TMemo;
    edtVATRegistrationNo: TEdit;
    dblkpAccountsPackage: TDBLookupComboBox;
    edtCompanyRegNo: TEdit;
    tbsNumbers: TTabSheet;
    grpbxNumbers: TGroupBox;
    Label21: TLabel;
    Label50: TLabel;
    edtLastInvoiceNumber: TCREditInt;
    edtLastCreditNoteNumber: TCREditInt;
    chkbxUseSeparateInvoiceSeq: TCheckBox;
    Label8: TLabel;
    edtPrefixValue: TEdit;
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
    procedure chkbxUseSeparateInvoiceSeqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    iPaymentNarrative: integer;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    function GetNarrative(const iNarrative: integer): string;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    function GetLastKey: integer;
  public
    FunctionMode: string[1];
    iCode: integer;
  end;

var
  frmWTMaintRevenueCentre: TfrmWTMaintRevenueCentre;

implementation

uses ComObj, ActiveX, wtLURevenueCentre, wtDataModule, wtNotesDM;

{$R *.DFM}

procedure TfrmWTMaintRevenueCentre.FormActivate(Sender: TObject);
begin
  qryAccounts.active := false;
  qryAccounts.Active := true;

  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if FunctionMode = 'A' then
    Caption := 'Add a new Revenue Centre';
  if FunctionMode = 'C' then
    Caption := 'Change a Revenue Centre';
  if FunctionMode = 'D' then
    Caption := 'Delete a Revenue Centre';
  if FunctionMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    memPayment.clear;
    memRegistered.clear;
    ChkBxInActive.Checked := false;
    edtCompanyRegNo.Text := '';
    edtVATRegistrationNo.Text := '';
    dblkpAccountsPackage.keyvalue := '';

    chkbxUseSeparateInvoiceSeq.Checked := false;
    edtPrefixValue.text := '';
    edtLastInvoiceNumber.text := '0';
    edtLastCreditNoteNumber.text := '0';
  end
  else
  begin
    with frmWTLURevenueCentre.srcRevenueCentre.DataSet do
    begin
      iCode := FieldByName('Revenue_Centre').AsInteger;
      DescrEdit.Text := FieldByName('Revenue_Centre_Descr').AsString;

      iPaymentNarrative := FieldByName('Invoice_Payment_Notes').Asinteger;
      memPayment.Text := GetNarrative(iPaymentNarrative);
      memRegistered.Text := FieldByName('Registered_Address').AsString;

      if FieldByName('Color').Asinteger <> 0 then
        begin
          edtColor.color := FieldByName('Color').Asinteger;
          edtColor.font.color := FieldByName('Font_Color').Asinteger;
        end;
      ChkBxInActive.checked := (fieldByName('InActive').AsString = 'Y');

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

      edtCompanyRegNo.Text := fieldbyname('Company_Reg_Number').asstring;
      edtVATRegistrationNo.Text := fieldbyname('VAT_Registration_No').asstring;
      dblkpAccountsPackage.keyvalue := fieldByName('Accounts_Package').Asstring;

      chkbxUseSeparateInvoiceSeq.Checked := (fieldByName('Use_Separate_Invoice_Seq').Asstring = 'Y');
      edtLastInvoiceNumber.text := inttostr(fieldbyname('Last_Invoice_Number').asinteger);
      edtLastCreditNoteNumber.text := inttostr(fieldbyname('Last_Credit_Note_Number').asinteger);
      edtPrefixValue.text := fieldbyname('Prefix_Value').asstring;
      grpbxNumbers.Enabled := chkbxUseSeparateInvoiceSeq.Checked;
    end;
  end;

  pcDetails.Enabled := (FunctionMode <> 'D');
  CheckOK(Self);
end;

procedure TfrmWTMaintRevenueCentre.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TfrmWTMaintRevenueCentre.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWTMaintRevenueCentre.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmWTMaintRevenueCentre.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmWTMaintRevenueCentre.OKBitBtnClick(Sender: TObject);
var
  iTempNarr: integer;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          ParamByName('Revenue_Centre_Descr').AsString := DescrEdit.Text + '';
          ParamByName('Color').Asinteger := edtColor.color;
          ParamByName('Font_Color').Asinteger := edtColor.font.color;
          if ChkBxInActive.checked then
            ParamByName('InActive').AsString := 'Y'
          else
            ParamByName('InActive').AsString := 'N';

          ParamByName('Logo_Path').AsString := edtLogoPath.text;

          iTempNarr := iPaymentNarrative;
          SaveNarrative(iTempNarr,memPayment.Text);
          iPaymentNarrative := iTempNarr;
          if iPaymentNarrative = 0 then
            ParambyName('Invoice_Payment_Notes').clear
          else
            ParambyName('Invoice_Payment_Notes').Asinteger := iPaymentNarrative;

          ParambyName('Registered_address').asstring := memRegistered.Text;
          ParambyName('Company_Reg_Number').asstring := edtCompanyRegNo.Text;
          ParambyName('VAT_Registration_No').asstring := edtVATRegistrationNo.Text;
          if dblkpAccountsPackage.text = '' then
            ParambyName('Accounts_Package').clear
          else
            ParambyName('Accounts_Package').asstring := dblkpAccountsPackage.KeyValue;

          if chkbxUseSeparateInvoiceSeq.Checked then
            parambyname('Use_Separate_Invoice_Seq').asstring := 'Y'
          else
            parambyname('Use_Separate_Invoice_Seq').asstring := 'N';

          parambyname('Last_Invoice_Number').asinteger := strtoint(edtLastInvoiceNumber.text);
          parambyname('Last_Credit_Note_Number').asinteger := strtoint(edtLastCreditNoteNumber.text);

          parambyname('Prefix_Value').asstring := edtPrefixValue.text;
          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          ParamByName('Revenue_Centre').AsInteger := iCode;
          ParamByName('Revenue_Centre_Descr').AsString := DescrEdit.Text + '';
          ParamByName('Color').Asinteger := edtColor.color;
          ParamByName('Font_Color').Asinteger := edtColor.font.color;
          if ChkBxInActive.checked then
            ParamByName('InActive').AsString := 'Y'
          else
            ParamByName('InActive').AsString := 'N';

          ParamByName('Logo_Path').AsString := edtLogoPath.text;

          iTempNarr := iPaymentNarrative;
          SaveNarrative(iTempNarr,memPayment.Text);
          iPaymentNarrative := iTempNarr;
          if iPaymentNarrative = 0 then
            ParambyName('Invoice_Payment_Notes').clear
          else
            ParambyName('Invoice_Payment_Notes').Asinteger := iPaymentNarrative;

          ParambyName('Registered_address').asstring := memRegistered.Text;
          ParambyName('Company_Reg_Number').asstring := edtCompanyRegNo.Text;
          ParambyName('VAT_Registration_No').asstring := edtVATRegistrationNo.Text;
          if dblkpAccountsPackage.text = '' then
            ParambyName('Accounts_Package').clear
          else
            ParambyName('Accounts_Package').asstring := dblkpAccountsPackage.KeyValue;

          if chkbxUseSeparateInvoiceSeq.Checked then
            parambyname('Use_Separate_Invoice_Seq').asstring := 'Y'
          else
            parambyname('Use_Separate_Invoice_Seq').asstring := 'N';

          parambyname('Last_Invoice_Number').asinteger := strtoint(edtLastInvoiceNumber.text);
          parambyname('Last_Credit_Note_Number').asinteger := strtoint(edtLastCreditNoteNumber.text);

          parambyname('Prefix_Value').asstring := edtPrefixValue.text;
          ExecSQL;
        end;
    end;
  end;
end;

procedure TfrmWTMaintRevenueCentre.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmWTMaintRevenueCentre.UnitFactorEditKeyPress(Sender: TObject;
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

procedure TfrmWTMaintRevenueCentre.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Revenue_Centre ' +
            '(Revenue_Centre,Revenue_Centre_Descr) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintRevenueCentre.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Revenue_Centre Where Revenue_Centre=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TfrmWTMaintRevenueCentre.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with qryAdd do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Revenue_Centre').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintRevenueCentre.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;
end;

procedure TfrmWTMaintRevenueCentre.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;

end;

procedure TfrmWTMaintRevenueCentre.Button3Click(Sender: TObject);
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

function TfrmWTMaintRevenueCentre.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TfrmWTMaintRevenueCentre.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

function TfrmWTMaintRevenueCentre.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Revenue_Centre').AsInteger;
    end;
end;


procedure TfrmWTMaintRevenueCentre.chkbxUseSeparateInvoiceSeqClick(
  Sender: TObject);
begin
  self.grpbxNumbers.Enabled := (Sender as TCheckbox).checked;
end;

procedure TfrmWTMaintRevenueCentre.FormCreate(Sender: TObject);
begin
  pcDetails.ActivePage := tbsGeneral;
end;

end.
