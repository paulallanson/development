unit PBMaintWOrderEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, PBWOrdersDM;

type
  TfrmPBMaintWOrderEvents = class(TForm)
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
    FWOEvent: TWOEvent;
    FMode: TwoevMode;
    FOperatorName: string;
    FOperator: integer;
    procedure SetWOEvent(const Value: TWOEvent);
    procedure SetMode(const Value: TwoevMode);
    procedure ShowDetails;
    procedure SetOperatorName(const Value: string);
    procedure SetOperator(const Value: integer);
  public
    property Mode: TwoevMode read FMode write SetMode;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property WOEvent: TWOEvent read FWOEvent write SetWOEvent;
  end;

var
  frmPBMaintWOrderEvents: TfrmPBMaintWOrderEvents;

implementation

{$R *.dfm}

{ TfrmWTMaintQEvents }

procedure TfrmPBMaintWOrderEvents.SetMode(const Value: TwoevMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> woevDelete);
  lblDelete.visible := (FMode = woevDelete);
end;

procedure TfrmPBMaintWOrderEvents.SetWOEvent(const Value: TWOEvent);
begin
  FWOEvent := Value;
end;

procedure TfrmPBMaintWOrderEvents.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    woevAdd     : Caption := 'Add notes';
    woevChange  : Caption := 'Change notes';
    woevDelete  : Caption := 'Delete notes';
    end;  { case }
    if Mode = woevAdd then
      sTemp := ' New notes '
    else
      sTemp := ' notes ' + IntToStr(WOEvent.Parent.DbKey) + ' ';

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmPBMaintWOrderEvents.ShowDetails;
begin
  if Mode <> woevAdd then
  begin
    edtOperator.text := WOEvent.OperatorName;
    dtpckdate.date := WOEvent.DateEntered;
    memDetails.text := WOEvent.Narrative.DataInfo;
  end
  else
  begin
    edtOperator.text := OperatorName;
    dtpckdate.date := date;
    memDetails.text := ''
  end;
end;

procedure TfrmPBMaintWOrderEvents.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memdetails.text <>'');
end;

procedure TfrmPBMaintWOrderEvents.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  WOEvent.Operator := Operator;
  WOEvent.OperatorName := OperatorName;
  WOEvent.DateEntered := dtpckDate.Date;
  WOEvent.Narrative.DataInfo := memDetails.text;
  if Mode = woevAdd then
  begin
    WOEvent.Narrative.dbkey := 0;
    WOEvent.EventNumber := WOEvent.Parent.Events.Count + 1;
    WOEvent.Parent.Events.Add(WOEvent);
  end
  else
  if Mode = woevDelete then
  begin
    inx := WOEvent.Parent.Events.IndexOf(WOEvent.EventNumber);
    WOEvent.Parent.Events.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmPBMaintWOrderEvents.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmPBMaintWOrderEvents.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

end.
