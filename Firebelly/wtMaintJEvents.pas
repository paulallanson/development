unit wtMaintJEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, wtJobsDM, QrCtrls;

type
  TfrmWTMaintJEvents = class(TForm)
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
    FJEvent: TJEvent;
    FMode: TjevMode;
    FOperatorName: string;
    FOperator: integer;
    procedure SetJEvent(const Value: TJEvent);
    procedure SetMode(const Value: TjevMode);
    procedure ShowDetails;
    procedure SetOperatorName(const Value: string);
    procedure SetOperator(const Value: integer);
  public
    property Mode: TjevMode read FMode write SetMode;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property JEvent: TJEvent read FJEvent write SetJEvent;
  end;

var
  frmWTMaintJEvents: TfrmWTMaintJEvents;

implementation

{$R *.dfm}

{ TfrmWTMaintJEvents }

procedure TfrmWTMaintJEvents.SetMode(const Value: TjevMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> jevDelete);
  lblDelete.visible := (FMode = jevDelete);
end;

procedure TfrmWTMaintJEvents.SetJEvent(const Value: TJEvent);
begin
  FJEvent := Value;
end;

procedure TfrmWTMaintJEvents.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jevAdd     : Caption := 'Add notes';
    jevChange  : Caption := 'Change notes';
    jevDelete  : Caption := 'Delete notes';
    end;  { case }
    if Mode = jevAdd then
      sTemp := ' New notes '
    else
      sTemp := ' notes ' + IntToStr(JEvent.Parent.DbKey) + ' ';

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintJEvents.ShowDetails;
begin
  if Mode <> jevAdd then
  begin
    edtOperator.text := JEvent.OperatorName;
    dtpckdate.date := JEvent.DateEntered;
    memDetails.text := JEvent.Narrative.DataInfo;
  end
  else
  begin
    edtOperator.text := OperatorName;
    dtpckdate.date := date;
    memDetails.text := ''
  end;
end;

procedure TfrmWTMaintJEvents.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memdetails.text <>'');
end;

procedure TfrmWTMaintJEvents.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  JEvent.Operator := Operator;
  JEvent.OperatorName := OperatorName;
  JEvent.DateEntered := dtpckDate.Date;
  JEvent.Narrative.DataInfo := memDetails.text;
  if Mode = jevAdd then
  begin
    JEvent.Narrative.dbkey := 0;
    JEvent.EventNumber := JEvent.Parent.Events.Count + 1;
    JEvent.Parent.Events.Add(JEvent);
  end
  else
  if Mode = jevDelete then
  begin
    inx := JEvent.Parent.Events.IndexOf(JEvent.EventNumber);
    JEvent.Parent.Events.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJEvents.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmWTMaintJEvents.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

end.
