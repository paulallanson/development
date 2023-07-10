unit wtMaintContractEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, gtQrCtrls, wtContractsDM;

type
  TfrmWTMaintContractEvents = class(TForm)
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
    FMode: TcqevMode;
    FOperatorName: string;
    FOperator: integer;
    FContractEvent: TContractEvent;
    procedure SetMode(const Value: TcqevMode);
    procedure ShowDetails;
    procedure SetOperatorName(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetContractEvent(const Value: TContractEvent);
  public
    property Mode: TcqevMode read FMode write SetMode;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property ContractEvent: TContractEvent read FContractEvent write SetContractEvent;
  end;

var
  frmWTMaintContractEvents: TfrmWTMaintContractEvents;

implementation

{$R *.dfm}

{ TfrmWTMaintQEvents }

procedure TfrmWTMaintContractEvents.SetMode(const Value: TcqevMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> cqevDelete);
  lblDelete.visible := (FMode = cqevDelete);
end;

procedure TfrmWTMaintContractEvents.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    cqevAdd     : Caption := 'Add notes';
    cqevChange  : Caption := 'Change notes';
    cqevDelete  : Caption := 'Delete notes';
    end;  { case }
    if Mode = cqevAdd then
      sTemp := ' New notes '
    else
      sTemp := ' notes ' + IntToStr(ContractEvent.Parent.DbKey) + ' ';

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintContractEvents.ShowDetails;
begin
  if Mode <> cqevAdd then
  begin
    edtOperator.text := ContractEvent.OperatorName;
    dtpckdate.date := ContractEvent.DateEntered;
    memDetails.text := ContractEvent.Narrative.Data;
  end
  else
  begin
    edtOperator.text := OperatorName;
    dtpckdate.date := date;
    memDetails.text := ''
  end;
end;

procedure TfrmWTMaintContractEvents.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memdetails.text <>'');
end;

procedure TfrmWTMaintContractEvents.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  ContractEvent.Operator := Operator;
  ContractEvent.OperatorName := OperatorName;
  ContractEvent.DateEntered := dtpckDate.Date;
  ContractEvent.Narrative.data := memDetails.text;
  if Mode = cqevAdd then
  begin
    ContractEvent.Narrative.dbkey := 0;
    ContractEvent.EventNumber := ContractEvent.Parent.Events.Count + 1;
    ContractEvent.Parent.Events.Add(ContractEvent);
  end
  else
  if Mode = cqevDelete then
  begin
    inx := ContractEvent.Parent.Events.IndexOf(ContractEvent.EventNumber);
    ContractEvent.Parent.Events.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintContractEvents.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmWTMaintContractEvents.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TfrmWTMaintContractEvents.SetContractEvent(
  const Value: TContractEvent);
begin
  FContractEvent := Value;
end;

end.
