unit PBMaintContApp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, CCSCommon;

type
  TPBMaintContAppfrm = class(TForm)
    dtpckAppTime: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBMaintContAppfrm: TPBMaintContAppfrm;

implementation

{$R *.DFM}

procedure TPBMaintContAppfrm.FormShow(Sender: TObject);
begin
  datetimepicker.date := now;
  dtpckAppTime.Time := Time;
end;

end.
