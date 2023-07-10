unit PBLUProcessQstnList;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TPBLUProcessQstnListFrm = class(TForm)
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
  PBLUProcessQstnListFrm: TPBLUProcessQstnListFrm;

implementation

{$R *.DFM}

end.
