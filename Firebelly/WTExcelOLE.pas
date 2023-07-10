unit WTExcelOLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtnrs;

type
  TWTExcelOLEFrm = class(TForm)
    ocExcel: TOleContainer;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveAsDocument(docName: string);
  end;

var
  WTExcelOLEFrm: TWTExcelOLEFrm;

implementation

{$R *.DFM}

{ TPBExcelOLEFrm }

procedure TWTExcelOLEFrm.SaveAsDocument(docName: string);
begin
  ocExcel.SaveAsDocument(docName);
end;

end.
