unit PBExcelOLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtnrs;

type
  TPBExcelOLEFrm = class(TForm)
    ocExcel: TOleContainer;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveAsDocument(docName: string);
  end;

var
  PBExcelOLEFrm: TPBExcelOLEFrm;

implementation

{$R *.DFM}

{ TPBExcelOLEFrm }

procedure TPBExcelOLEFrm.SaveAsDocument(docName: string);
begin
  ocExcel.SaveAsDocument(docName);
end;

end.
