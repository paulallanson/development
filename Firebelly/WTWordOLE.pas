unit WTWordOLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtnrs;

type
  TWTWordOLEFrm = class(TForm)
    ocWord: TOleContainer;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveAsDocument(docName: string);
  end;

var
  WTWordOLEFrm: TWTWordOLEFrm;

implementation

{$R *.DFM}

{ TPBWordOLEFrm }

procedure TWTWordOLEFrm.SaveAsDocument(docName: string);
begin
  ocWord.SaveAsDocument(docName);
end;

end.
