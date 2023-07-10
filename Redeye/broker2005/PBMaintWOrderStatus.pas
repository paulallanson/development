unit PBMaintWOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TPBMaintWOrderStatusFrm = class(TForm)
    Label1: TLabel;
    dblkpWOStatus: TDBLookupComboBox;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryWOStatus: TQuery;
    dtsWOStatus: TDataSource;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FNewStatus: integer;
    procedure SetNewStatus(const Value: integer);
    { Private declarations }
  public
    property NewStatus: integer read FNewStatus write SetNewStatus;
  end;

var
  PBMaintWOrderStatusFrm: TPBMaintWOrderStatusFrm;

implementation

{$R *.dfm}

procedure TPBMaintWOrderStatusFrm.FormActivate(Sender: TObject);
begin
  with qryWOStatus do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintWOrderStatusFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWOStatus.text <> '');
end;

procedure TPBMaintWOrderStatusFrm.btnOKClick(Sender: TObject);
begin
  NewStatus := dblkpWOStatus.keyvalue;
end;

procedure TPBMaintWOrderStatusFrm.SetNewStatus(const Value: integer);
begin
  FNewStatus := Value;
end;

end.
