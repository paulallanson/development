unit PBMaintJobBagDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, PBJobBagDM;

type
  TPBMaintJobBagDocFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtTitle: TEdit;
    edtLocation: TEdit;
    btnBrowse: TButton;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblDelete: TLabel;
    DocOpenDialog: TOpenDialog;
    Label3: TLabel;
    lblDateCreated: TLabel;
    procedure btnBrowseClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FMode: TJBDocMode;
    FJobBagDoc: TJobBagDoc;
    FActivated: Boolean;
    procedure SetMode(const Value:TJBDocMode);
    procedure SetJobBagDoc(const Value: TJobBagDoc);
    procedure ShowDetails;
    { Private declarations }
  public
    property Mode: TJBDocMode read FMode write SetMode;
    property JobBagDoc: TJobBagDoc read FJobBagDoc write SetJobBagDoc;
  end;

var
  PBMaintJobBagDocFrm: TPBMaintJobBagDocFrm;

implementation

uses UITypes, pbMainMenu, pbDatabase, ccscommon;

{$R *.DFM}

{ TPBMaintPOLineDocFrm }

procedure TPBMaintJobBagDocFrm.btnBrowseClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  inx: integer;
begin
  docDir := dmBroker.qryCompany.FieldByName('Job_bag_Document_Directory').AsString;
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
        MessageDlg('You can''t select a document outside the Product Document Directory', mtError,[mbOK],0) ;
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

procedure TPBMaintJobBagDocFrm.SetJobBagDoc(const Value: TJobBagDoc);
begin
  FJobBagDoc := Value;
end;

procedure TPBMaintJobBagDocFrm.SetMode(const Value: TJBDocMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagDocFrm.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jbdocAdd     : Caption := 'Add a Document';
    jbdocChange  : Caption := 'Change a Document';
    jbdocDelete  : Caption := 'Delete a Document';
    end;  { case }
    if Mode = jbdocAdd then
      sTemp := ' New Document '
    else
      sTemp := ' Document ' + IntToStr(JobBagDoc.Parent.DbKey) + ' ';

    ShowDetails;

    btnOk.visible := (Mode <> jbDocView);
    lblDelete.Visible := (Mode = jbDocDelete);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagDocFrm.ShowDetails;
begin
  if Mode = jbDocAdd then
    begin
      lblDateCreated.Caption := '';
      edtTitle.Text := '';
      edtlocation.Text := '';
    end
  else
    begin
      lblDateCreated.Caption := pbdatestr(JobBagDoc.DocumentDate);
      edtTitle.Text := JobBagDoc.DocumentTitle;
      edtlocation.Text := JobBagdoc.DocumentPath;
    end;
end;

procedure TPBMaintJobBagDocFrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtTitle.text <> '') and
                    (edtLocation.text <> '');
end;

procedure TPBMaintJobBagDocFrm.btnOKClick(Sender: TObject);
var
  inx: integer;
begin
  JobBagDoc.DocumentPath := edtlocation.Text;
  JobBagDoc.DocumentTitle := edtTitle.Text;
  JobBagDoc.DocumentDate := pbdatestr(lblDateCreated.caption);

  if Mode = jbDocAdd then
  begin
    JobBagDoc.JBDocumentNo := JobBagDoc.Parent.Documents.Count + 1;
    JobBagDoc.Parent.Documents.Add(JobBagDoc);
  end
  else
  if Mode = jbDocDelete then
  begin
    inx := JobBagDoc.Parent.Documents.IndexOf(JobBagDoc.JBDocumentNo);
    JobBagDoc.Parent.Documents.Delete(inx);
    JobBagDoc.Parent.Documents.Renumber;
  end;
  ModalResult := mrOK;
end;

end.
