unit PBWordOLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtnrs;

type
  TPBWordOLEFrm = class(TForm)
    ocWord: TOleContainer;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveAsDocument(docName: string);
  end;

var
  PBWordOLEFrm: TPBWordOLEFrm;

implementation

{$R *.DFM}

{ TPBWordOLEFrm }

procedure TPBWordOLEFrm.SaveAsDocument(docName: string);
begin
  ocWord.SaveAsDocument(docName);
end;

end.
