unit PBLUPrdTypQuList;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TPBLUPrdTypQuListfrm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    memoList: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBLUPrdTypQuListfrm: TPBLUPrdTypQuListfrm;

implementation

{$R *.DFM}

end.
