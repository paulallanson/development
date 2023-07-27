unit PBMaintDocument;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type
  TPBMaintDocumentFrm = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtTitle: TEdit;
    edtLocation: TEdit;
    DocOpenDialog: TOpenDialog;
    Label3: TLabel;
    lblDateCreated: TLabel;
    btnBrowse: TButton;
    Panel2: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnBrowseClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FActivated: Boolean;
    FDocType: string;
    FMode: string;
    procedure ShowDetails;
    procedure SetDocType(const Value: string);
    procedure SetMode(const Value: string);
    { Private declarations }
  public
    DocumentDate: TDateTime;
    DocumentNo: integer;
    DocumentTitle: string;
    DocumentPath: string;
    property Mode: string read FMode write SetMode;
    property DocType: string read FDocType write SetDocType;
  end;

var
  PBMaintDocumentFrm: TPBMaintDocumentFrm;

implementation

uses UITypes, pbMainMenu, pbDatabase, ccscommon;

{$R *.DFM}

{ TPBMaintPOLineDocFrm }

procedure TPBMaintDocumentFrm.btnBrowseClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  inx: integer;
begin
  if DocType = 'C' then
    docDir := dmBroker.GetCompanyCustomerDirectory
  else
  if DocType = 'S' then
    docDir := dmBroker.GetCompanySupplierDirectory;

  tempStr2 := docDir;

  tempStr := edtLocation.Text;
  inx := pos('\', tempStr);
  while inx <> 0 do
  begin
    tempStr2 := tempStr2 + copy(tempStr, 1, inx);
    tempStr := copy(tempStr, inx+1, length(tempStr));
    inx := pos('\', tempStr);
  end;

  {Find a document} ;
  With DocOpenDialog do
  begin
    InitialDir := tempStr2;
    FileName := tempStr ;

    If Execute then
    begin
      {Check that they have NOT gone out of document directory} ;
      If Lowercase(Copy(FileName,1, Length(docDir))) <> Lowercase(docDir) then
      begin
        MessageDlg('You can''t select a document outside the Document Directory', mtError,[mbOK],0) ;
      end
      else
      begin
        edtLocation.Text := Copy(FileName, Length(docDir)+1,100);
        if edtTitle.Text = '' then
          edtTitle.Text := edtLocation.Text;
        lblDateCreated.caption := PBDateStr(FileDateToDateTime(FileAge(FileName)));
      end;
    end;
  end;
end;

procedure TPBMaintDocumentFrm.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    if Mode = 'A' then
      Caption := 'Add a Document'
    else
    if mode = 'C' then
      Caption := 'Change a Document'
    else
    if mode = 'D' then
      Caption := 'Delete a Document';

    if Mode = 'A' then
      sTemp := ' New Document '
    else
    if Mode = 'C' then
      sTemp := ' Change a document'
    else
      sTemp := ' Delete a document';

    ShowDetails;

    btnOk.visible := (Mode <> 'V');
    lblDelete.Visible := (Mode = 'D');
    pnlDetails.Enabled := (Mode <> 'D');

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintDocumentFrm.ShowDetails;
begin
  if Mode = 'A' then
    begin
      lblDateCreated.Caption := '';
      edtTitle.Text := '';
      edtlocation.Text := '';
    end
  else
    begin
      lblDateCreated.Caption := pbdatestr(DocumentDate);
      edtTitle.Text := DocumentTitle;
      edtlocation.Text := DocumentPath;
    end;
end;

procedure TPBMaintDocumentFrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtTitle.text <> '') and
                    (edtLocation.text <> '');
end;

procedure TPBMaintDocumentFrm.btnOKClick(Sender: TObject);
var
  inx: integer;
begin
  DocumentPath := edtlocation.Text;
  DocumentTitle := edtTitle.Text;
  DocumentDate := pbdatestr(lblDateCreated.caption);

  ModalResult := mrOK;
end;

procedure TPBMaintDocumentFrm.SetDocType(const Value: string);
begin
  FDocType := Value;
end;

procedure TPBMaintDocumentFrm.SetMode(const Value: string);
begin
  FMode := Value;
end;

end.
