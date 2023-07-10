unit wtMaintPOEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, wtPurchasesDM, gtQrCtrls;

type
  TfrmWTMaintPOEvents = class(TForm)
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
    FPOEvent: TPOEvent;
    FMode: TpoevMode;
    procedure ShowDetails;
    procedure SetOperatorName(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetPOEvent(const Value: TPOEvent);
    procedure SetMode(const Value: TpoevMode);
  public
    property Mode: TpoevMode read FMode write SetMode;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property POEvent: TPOEvent read FPOEvent write SetPOEvent;
  end;

var
  frmWTMaintPOEvents: TfrmWTMaintPOEvents;

implementation

{$R *.dfm}

{ TfrmWTMaintQEvents }

procedure TfrmWTMaintPOEvents.SetMode(const Value: TpoevMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> poevDelete);
  lblDelete.visible := (FMode = poevDelete);
end;

procedure TfrmWTMaintPOEvents.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    poevAdd     : Caption := 'Add notes';
    poevChange  : Caption := 'Change notes';
    poevDelete  : Caption := 'Delete notes';
    end;  { case }
    if Mode = poevAdd then
      sTemp := ' New notes '
    else
      sTemp := ' notes ' + IntToStr(POEvent.Parent.DbKey) + ' ';

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintPOEvents.ShowDetails;
begin
  if Mode <> poevAdd then
  begin
    edtOperator.text := POEvent.OperatorName;
    dtpckdate.date := POEvent.DateEntered;
    memDetails.text := POEvent.Narrative.Data;
  end
  else
  begin
    edtOperator.text := OperatorName;
    dtpckdate.date := date;
    memDetails.text := ''
  end;
end;

procedure TfrmWTMaintPOEvents.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memdetails.text <>'');
end;

procedure TfrmWTMaintPOEvents.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  POEvent.Operator := Operator;
  POEvent.OperatorName := OperatorName;
  POEvent.DateEntered := dtpckDate.Date;
  POEvent.Narrative.data := memDetails.text;
  if Mode = poevAdd then
  begin
    POEvent.Narrative.dbkey := 0;
    POEvent.EventNumber := POEvent.Parent.Events.Count + 1;
    POEvent.Parent.Events.Add(POEvent);
  end
  else
  if Mode = poevDelete then
  begin
    inx := POEvent.Parent.Events.IndexOf(POEvent.EventNumber);
    POEvent.Parent.Events.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintPOEvents.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmWTMaintPOEvents.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TfrmWTMaintPOEvents.SetPOEvent(const Value: TPOEvent);
begin
  FPOEvent := Value;
end;

end.
