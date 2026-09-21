unit PBFaxToOne;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBFaxToOneFrm = class(TForm)
    FaxDescrLabel: TLabel;
    FaxNoEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    procedure FaxNoEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBFaxToOneFrm: TPBFaxToOneFrm;

implementation

uses PBSendFax;

{$R *.DFM}

procedure TPBFaxToOneFrm.FaxNoEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TPBFaxToOneFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := FaxNoEdit.Text <> '' ;
end;

procedure TPBFaxToOneFrm.OKBitBtnClick(Sender: TObject);
begin
PBSendFaxFrm.OutToFax(FaxNoEdit.Text, FaxDescrLabel.Caption, '');
end;

end.
