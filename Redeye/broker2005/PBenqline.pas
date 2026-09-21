unit PBenqline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls;

type
  TPBEnqLineTmp = class(TForm)
    PartGrid: TStringGrid;
    AddGrid: TStringGrid;
    CapGrid: TStringGrid;
    QuestionGrid: TStringGrid;
    SupplierGrid: TStringGrid;
    NotesMemo: TMemo;
    OptionsGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iNarrative: Integer;
    sLineMode: string[1];
    iStatus: Integer;
    noOfParts: integer;
  end;

var
  PBEnqLineTmp: TPBEnqLineTmp;

implementation

{$R *.DFM}

procedure TPBEnqLineTmp.FormCreate(Sender: TObject);
begin
  iNarrative := 0;
  sLineMode := 'A';
  iStatus := 10;  
  noOfParts := 0;
end;

end.
