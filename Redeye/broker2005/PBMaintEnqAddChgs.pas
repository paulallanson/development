unit PBMaintEnqAddChgs;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TPBMaintEnqAddChgsfrm = class(TForm)
    OKBtn: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DescriptionEdit: TEdit;
    CostLbl: TLabel;
    CostMemo: TMemo;
    PriceMemo: TMemo;
    PriceLbl: TLabel;
    procedure DescriptionEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CostMemoExit(Sender: TObject);
    procedure CostMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    { Private declarations }
    procedure EnableOK;
  public
    { Public declarations }
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  PBMaintEnqAddChgsfrm: TPBMaintEnqAddChgsfrm;

implementation

uses pbDatabase, pbMainMenu;

{$R *.DFM}

{ TPBMaintInvAddChgsfrm }

procedure TPBMaintEnqAddChgsfrm.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TPBMaintEnqAddChgsfrm.EnableOK;
begin
  OKBtn.Enabled := false;
  if (DescriptionEdit.text = '') or
    (PriceMemo.lines[0] = '') or
    (CostMemo.lines[0] = '') then
    exit;
  OKBtn.Enabled := true;
end;

procedure TPBMaintEnqAddChgsfrm.DescriptionEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EnableOK;
end;

procedure TPBMaintEnqAddChgsfrm.CostMemoExit(Sender: TObject);
begin
  with Sender as TMemo do
  begin
    Lines[0] := formatfloat('0.00', StrToFloat(Lines[0]));
  end;
end;

procedure TPBMaintEnqAddChgsfrm.CostMemoKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TMemo do
  begin
    P := Pos('.', Text);
  end;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintEnqAddChgsfrm.FormShow(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBMaintEnqAddChgsfrm.FormActivate(Sender: TObject);
begin
  dmBroker.ScreenAccessControl(Self,'',frmpbMainMenu.iOperator,0,0) ;
end;

end.
