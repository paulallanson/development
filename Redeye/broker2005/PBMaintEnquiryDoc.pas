unit PBMaintEnquiryDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, PBPOObjects, PBDocObjects;

type
  TPBMaintEnquiryDocFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtTitle: TEdit;
    edtLocation: TEdit;
    btnBrowse: TButton;
    btbtnOK: TBitBtn;
    btbtnCancel: TBitBtn;
    lblDelete: TLabel;
    DocOpenDialog: TOpenDialog;
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    dirext: string;
    function New: TDocument;
    procedure Edit(document: TDocument);
    procedure Delete(document: TDocument);
  end;

var
  PBMaintEnquiryDocFrm: TPBMaintEnquiryDocFrm;

implementation

uses pbMainMenu, pbDatabase;

{$R *.DFM}

{ TPBMaintPOLineDocFrm }

function TPBMaintEnquiryDocFrm.New: TDocument;
var
  document: TDocument;
begin
  result := nil;
  
  self.ShowModal;
  if self.ModalResult = mrOK then
  begin
    document := TDocument.Create;
    document.Title := self.edtTitle.Text;
    document.Path := self.edtLocation.Text;

    Result := document;
  end;
end;

procedure TPBMaintEnquiryDocFrm.Delete(document: TDocument);
begin
  self.lblDelete.Visible := true;
  self.btnBrowse.Visible := false;
  self.edtTitle.Text := document.Title;
  self.edtLocation.Text := document.Path;

  self.ShowModal;
end;

procedure TPBMaintEnquiryDocFrm.Edit(document: TDocument);
begin
  self.edtTitle.Text := document.Title;
  self.edtLocation.Text := document.Path;

  self.ShowModal;

  if self.ModalResult = mrOK then
  begin
    document.Title := self.edtTitle.Text;
    document.Path := self.edtLocation.Text;
  end;
end;

procedure TPBMaintEnquiryDocFrm.btnBrowseClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  inx: integer;
begin
  docDir := dmBroker.qryCompany.FieldByName('Enquiry_Document_Directory').AsString + dirext;
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
        MessageDlg('You can''t select a document outside the Enquiry Document Directory',
                                                mtError,[mbOK],0) ;
      end
      else
      begin
        edtLocation.Text := Copy(FileName, Length(docDir)+1,100);
        if edtTitle.Text = '' then
          edtTitle.Text := edtLocation.Text;
      end;
    end;
  end;
end;

procedure TPBMaintEnquiryDocFrm.FormCreate(Sender: TObject);
begin
  dirext := '';
end;

end.
