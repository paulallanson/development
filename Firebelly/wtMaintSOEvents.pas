unit wtMaintSOEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, wtSalesOrderDM;

type
  TfrmWTMaintSOEvents = class(TForm)
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
    FOperatorName: string;
    FOperator: integer;
    FSOEvent: TSOEvent;
    FMode: TsoevMode;
    procedure ShowDetails;
    procedure SetOperatorName(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetSOEvent(const Value: TSOEvent);
    procedure SetMode(const Value: TsoevMode);
  public
    property Mode: TsoevMode read FMode write SetMode;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property SOEvent: TSOEvent read FSOEvent write SetSOEvent;
  end;

var
  frmWTMaintSOEvents: TfrmWTMaintSOEvents;

implementation

{$R *.dfm}

{ TfrmWTMaintQEvents }

procedure TfrmWTMaintSOEvents.SetMode(const Value: TsoevMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> soevDelete);
  lblDelete.visible := (FMode = soevDelete);
end;

procedure TfrmWTMaintSOEvents.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    soevAdd     : Caption := 'Add notes';
    soevChange  : Caption := 'Change notes';
    soevDelete  : Caption := 'Delete notes';
    end;  { case }
    if Mode = soevAdd then
      sTemp := ' New notes '
    else
      sTemp := ' notes ' + IntToStr(SOEvent.Parent.DbKey) + ' ';

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintSOEvents.ShowDetails;
begin
  if Mode <> soevAdd then
  begin
    edtOperator.text := SOEvent.OperatorName;
    dtpckdate.date := SOEvent.DateEntered;
    memDetails.text := SOEvent.Narrative.Data;
  end
  else
  begin
    edtOperator.text := OperatorName;
    dtpckdate.date := date;
    memDetails.text := ''
  end;
end;

procedure TfrmWTMaintSOEvents.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memdetails.text <>'');
end;

procedure TfrmWTMaintSOEvents.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SOEvent.Operator := Operator;
  SOEvent.OperatorName := OperatorName;
  SOEvent.DateEntered := dtpckDate.Date;
  SOEvent.Narrative.data := memDetails.text;
  if Mode = soevAdd then
  begin
    SOEvent.Narrative.dbkey := 0;
    SOEvent.EventNumber := SOEvent.Parent.Events.Count + 1;
    SOEvent.Parent.Events.Add(SOEvent);
  end
  else
  if Mode = soevDelete then
  begin
    inx := SOEvent.Parent.Events.IndexOf(SOEvent.EventNumber);
    SOEvent.Parent.Events.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintSOEvents.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmWTMaintSOEvents.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TfrmWTMaintSOEvents.SetSOEvent(const Value: TSOEvent);
begin
  FSOEvent := Value;
end;

end.
