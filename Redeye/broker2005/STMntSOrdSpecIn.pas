unit STMntSOrdSpecIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TSTMntSOrdSpecInFrm = class(TForm)
    DispMemo: TMemo;
    ClearBitBtn: TBitBtn;
    OkBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    procedure OkBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClearBitBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    bOK: boolean;
  end;

var
  STMntSOrdSpecInFrm: TSTMntSOrdSpecInFrm;

implementation

{$R *.DFM}

procedure TSTMntSOrdSpecInFrm.OkBitBtnClick(Sender: TObject);
begin
  bOK := true;
end;

procedure TSTMntSOrdSpecInFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
end;

procedure TSTMntSOrdSpecInFrm.ClearBitBtnClick(Sender: TObject);
begin
  dispMemo.Text := '';
end;

procedure TSTMntSOrdSpecInFrm.CloseBitBtnClick(Sender: TObject);
begin
  close;
end;

end.
