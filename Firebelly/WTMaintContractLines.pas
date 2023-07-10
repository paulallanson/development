unit WTMaintContractLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons;

type
  TfrmWTMaintContractLines = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    spnLines: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FDrawingLines: integer;
    procedure SetDrawingLines(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    bOK: boolean;
    property DrawingLines: integer read FDrawingLines write SetDrawingLines;
  end;

var
  frmWTMaintContractLines: TfrmWTMaintContractLines;

implementation

{$R *.dfm}

procedure TfrmWTMaintContractLines.FormActivate(Sender: TObject);
begin
  bOK := false;
end;

procedure TfrmWTMaintContractLines.btnOKClick(Sender: TObject);
begin
  DrawingLines := spnLines.value;
  bOK := true
end;

procedure TfrmWTMaintContractLines.SetDrawingLines(const Value: integer);
begin
  FDrawingLines := Value;
end;

procedure TfrmWTMaintContractLines.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
end;

end.
