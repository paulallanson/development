unit STPrtMntLvls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TSTPrtMntLvlsFrm = class(TForm)
    btbtnOK: TBitBtn;
    edtMin: TEdit;
    edtMax: TEdit;
    edtReOrder: TEdit;
    lblMin: TLabel;
    lblMax: TLabel;
    lblReOrder: TLabel;
    btnCancel: TBitBtn;
    procedure edtMinExit(Sender: TObject);
    procedure edtMaxExit(Sender: TObject);
    procedure edtReOrderExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtReOrderKeyPress(Sender: TObject; var Key: Char);
  private
    FReorderLevel: integer;
    FMinLevel: integer;
    FMaxLevel: integer;
    procedure SetMaxLevel(const Value: integer);
    procedure SetMinLevel(const Value: integer);
    procedure SetReorderLevel(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property MinLevel: integer read FMinLevel write SetMinLevel;
    property MaxLevel: integer read FMaxLevel write SetMaxLevel;
    property ReorderLevel: integer read FReorderLevel write SetReorderLevel;
  end;

var
  STPrtMntLvlsFrm: TSTPrtMntLvlsFrm;

implementation

{$R *.DFM}

uses
  System.UITypes;

{ TSTPrtMntLvlsFrm }

procedure TSTPrtMntLvlsFrm.SetMaxLevel(const Value: integer);
begin
  if (self.MinLevel > value) or (self.ReorderLevel > value) then
  begin
    messageDlg('Maximum level must be greater than (or equal to) both the minimum and reorder levels.', mtError, [mbOK], 0);
    self.edtMax.SetFocus;
  end
  else
  begin
    FMaxLevel := Value;
  end;
end;

procedure TSTPrtMntLvlsFrm.SetMinLevel(const Value: integer);
begin
  if (value > self.ReorderLevel) or (value > self.MaxLevel) then
  begin
    messageDlg('Minimum level must be less than (or equal to) both the maximum and reorder levels.', mtError, [mbOK], 0);
    self.edtMin.SetFocus;
  end
  else
  begin
    FMinLevel := Value;
  end;
end;

procedure TSTPrtMntLvlsFrm.SetReorderLevel(const Value: integer);
begin
  if (self.MinLevel > value) or (value > self.MaxLevel) then
  begin
    messageDlg('Reorder level must be between (or equal to both) the minimum and maximum levels.', mtError, [mbOK], 0);
    self.edtReOrder.SetFocus;
  end
  else
  begin
    FReorderLevel := Value;
  end;
end;

procedure TSTPrtMntLvlsFrm.edtMinExit(Sender: TObject);
begin
  self.MinLevel := StrToInt(edtMin.text);  
end;

procedure TSTPrtMntLvlsFrm.edtMaxExit(Sender: TObject);
begin
  self.MaxLevel := StrToInt(edtMax.text);
end;

procedure TSTPrtMntLvlsFrm.edtReOrderExit(Sender: TObject);
begin
  self.ReorderLevel := StrToInt(edtReOrder.text);
end;

procedure TSTPrtMntLvlsFrm.FormShow(Sender: TObject);
begin
  self.edtMin.text := IntToStr(self.MinLevel);
  self.edtMax.text := IntToStr(self.MaxLevel);
  self.edtReOrder.text := IntToStr(self.ReorderLevel);
end;

procedure TSTPrtMntLvlsFrm.FormCreate(Sender: TObject);
begin
  self.MaxLevel := 0;
  self.ReorderLevel := 0;
  self.MinLevel := 0;
end;

procedure TSTPrtMntLvlsFrm.edtReOrderKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
  else
    Key := #0;
  end;
end;

end.
