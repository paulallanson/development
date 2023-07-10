unit PBMaintQuoteDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, PBQuotesDM;

type
  TPBMaintQuoteDocFrm = class(TForm)
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
    FActivated: Boolean;
    FMode: TQDocMode;
    FQuoteDoc: TQuoteDoc;
    procedure ShowDetails;
    procedure SetMode(const Value: TQDocMode);
    procedure SetQuoteDoc(const Value: TQuoteDoc);
    { Private declarations }
  public
    property Mode: TQDocMode read FMode write SetMode;
    property QuoteDoc: TQuoteDoc read FQuoteDoc write SetQuoteDoc;
  end;

var
  PBMaintQuoteDocFrm: TPBMaintQuoteDocFrm;

implementation

uses pbMainMenu, pbDatabase, ccscommon;

{$R *.DFM}

{ TPBMaintPOLineDocFrm }

procedure TPBMaintQuoteDocFrm.btnBrowseClick(Sender: TObject);
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
        MessageDlg('You can''t select a document outside the Product Document Directory',
                                                mtError,[mbOK],0) ;
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

procedure TPBMaintQuoteDocFrm.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qdocAdd     : Caption := 'Add a Document';
    qdocChange  : Caption := 'Change a Document';
    qdocDelete  : Caption := 'Delete a Document';
    end;  { case }
    if Mode = qdocAdd then
      sTemp := ' New Document '
    else
      sTemp := ' Document ' + floatToStr(QuoteDoc.Parent.DbKey) + ' ';

    ShowDetails;

    btnOk.visible := (Mode <> qDocView);
    lblDelete.Visible := (Mode = qDocDelete);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintQuoteDocFrm.ShowDetails;
begin
  if Mode = qDocAdd then
    begin
      lblDateCreated.Caption := '';
      edtTitle.Text := '';
      edtlocation.Text := '';
    end
  else
    begin
      lblDateCreated.Caption := pbdatestr(QuoteDoc.DocumentDate);
      edtTitle.Text := QuoteDoc.DocumentTitle;
      edtlocation.Text := Quotedoc.DocumentPath;
    end;
end;

procedure TPBMaintQuoteDocFrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtTitle.text <> '') and
                    (edtLocation.text <> '');
end;

procedure TPBMaintQuoteDocFrm.btnOKClick(Sender: TObject);
var
  inx: integer;
begin
  QuoteDoc.DocumentPath := edtlocation.Text;
  QuoteDoc.DocumentTitle := edtTitle.Text;
  QuoteDoc.DocumentDate := pbdatestr(lblDateCreated.caption);

  if Mode = qDocAdd then
  begin
    QuoteDoc.QDocumentNo := QuoteDoc.Parent.Documents.Count + 1;
    QuoteDoc.Parent.Documents.Add(QuoteDoc);
  end
  else
  if Mode = qDocDelete then
  begin
    inx := QuoteDoc.Parent.Documents.IndexOf(QuoteDoc.QDocumentNo);
    QuoteDoc.Parent.Documents.Delete(inx);
    QuoteDoc.Parent.Documents.Renumber;
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintQuoteDocFrm.SetMode(const Value: TQDocMode);
begin
  FMode := Value;
end;

procedure TPBMaintQuoteDocFrm.SetQuoteDoc(const Value: TQuoteDoc);
begin
  FQuoteDoc := Value;
end;

end.
