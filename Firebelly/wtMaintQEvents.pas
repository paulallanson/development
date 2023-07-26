unit wtMaintQEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, wtQuotesDM, QrCtrls;

type
  TfrmWTMaintQEvents = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtOperator: TEdit;
    Label2: TLabel;
    dtpckDate: TDateTimePicker;
    Label3: TLabel;
    dtpckTime: TDateTimePicker;
    lblDelete: TLabel;
    pnldetails: TPanel;
    memDetails: TMemo;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FActivated: Boolean;
    FQEvent: TQEvent;
    FMode: TqevMode;
    FOperatorName: string;
    FOperator: integer;
    procedure SetQEvent(const Value: TQEvent);
    procedure SetMode(const Value: TqevMode);
    procedure ShowDetails;
    procedure SetOperatorName(const Value: string);
    procedure SetOperator(const Value: integer);
  public
    property Mode: TqevMode read FMode write SetMode;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property QEvent: TQEvent read FQEvent write SetQEvent;
  end;

var
  frmWTMaintQEvents: TfrmWTMaintQEvents;

implementation

{$R *.dfm}

{ TfrmWTMaintQEvents }

procedure TfrmWTMaintQEvents.SetMode(const Value: TqevMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qevDelete);
  lblDelete.visible := (FMode = qevDelete);
end;

procedure TfrmWTMaintQEvents.SetQEvent(const Value: TQEvent);
begin
  FQEvent := Value;
end;

procedure TfrmWTMaintQEvents.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qevAdd     : Caption := 'Add notes';
    qevChange  : Caption := 'Change notes';
    qevDelete  : Caption := 'Delete notes';
    end;  { case }
    if Mode = qevAdd then
      sTemp := ' New notes '
    else
      sTemp := ' notes ' + IntToStr(QEvent.Parent.DbKey) + ' ';

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQEvents.ShowDetails;
begin
  if Mode <> qevAdd then
  begin
    edtOperator.text := QEvent.OperatorName;
    dtpckdate.date := QEvent.DateEntered;
    memDetails.text := QEvent.Narrative.DataInfo;
  end
  else
  begin
    edtOperator.text := OperatorName;
    dtpckdate.date := date;
    memDetails.text := ''
  end;
end;

procedure TfrmWTMaintQEvents.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memdetails.text <>'');
end;

procedure TfrmWTMaintQEvents.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  QEvent.Operator := Operator;
  QEvent.OperatorName := OperatorName;
  QEvent.DateEntered := dtpckDate.Date;
  QEvent.Narrative.DataInfo := memDetails.text;
  if Mode = qevAdd then
  begin
    QEvent.Narrative.dbkey := 0;
    QEvent.EventNumber := QEvent.Parent.Events.Count + 1;
    QEvent.Parent.Events.Add(QEvent);
  end
  else
  if Mode = qevDelete then
  begin
    inx := QEvent.Parent.Events.IndexOf(QEvent.EventNumber);
    QEvent.Parent.Events.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQEvents.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmWTMaintQEvents.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

end.
