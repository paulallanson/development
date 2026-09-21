unit PBEnvSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfrmpbEnvSel = class(TForm)
    DBRadioGroup: TRadioGroup;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    FaxSystemRadioGroup: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpbEnvSel: TfrmpbEnvSel;

implementation

{$R *.DFM}

end.
