unit WTMaintContApp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, AllCommon;

type
  TWTMaintContAppfrm = class(TForm)
    dtpckAppTime: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WTMaintContAppfrm: TWTMaintContAppfrm;

implementation

{$R *.DFM}

procedure TWTMaintContAppfrm.FormCreate(Sender: TObject);
begin
  datetimepicker.date := now;
  dtpckAppTime.Time := Time;
end;

end.
