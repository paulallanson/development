unit WTMaintContractMarkup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CRControls, Buttons;

type
  TfrmWTMaintContractMarkup = class(TForm)
    Label15: TLabel;
    pnlFooter: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    rdgrpMarkupType: TRadioGroup;
    chkbxMarkupCutOuts: TCheckBox;
    chkbxMarkupEdges: TCheckBox;
    chkbxMarkupMaterials: TCheckBox;
    chkbxMarkupFitting: TCheckBox;
    edtMarkup: TMemo;
    chkbxMarkupCharges: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateDouble(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sOldValue: string;
    FMarkupType: string;
    FMarkupCutOuts: boolean;
    FMarkupFitting: boolean;
    FMarkupEdges: boolean;
    FMarkupMaterials: boolean;
    FMarkupCharges: boolean;
    procedure SetMarkupType(const Value: string);
    procedure SetMarkupCutOuts(const Value: boolean);
    procedure SetMarkupEdges(const Value: boolean);
    procedure SetMarkupFitting(const Value: boolean);
    procedure SetMarkupMaterials(const Value: boolean);
    procedure SetMarkupCharges(const Value: boolean);
    { Private declarations }
  public
    property MarkupCharges: boolean read FMarkupCharges write SetMarkupCharges;
    property MarkupCutOuts: boolean read FMarkupCutOuts write SetMarkupCutOuts;
    property MarkupEdges: boolean read FMarkupEdges write SetMarkupEdges;
    property MarkupMaterials: boolean read FMarkupMaterials write SetMarkupMaterials;
    property MarkupFitting: boolean read FMarkupFitting write SetMarkupFitting;
    property MarkupType: string read FMarkupType write SetMarkupType;
  end;

var
  frmWTMaintContractMarkup: TfrmWTMaintContractMarkup;

implementation

uses Allcommon;

{$R *.dfm}

{ TfrmWTMaintContractMarkup }

procedure TfrmWTMaintContractMarkup.SetMarkupType(const Value: string);
begin
  FMarkupType := Value;
  if FMarkupType = 'C' then
    rdgrpMarkupType.ItemIndex := 0
  else
  if FMarkupType = 'R' then
    rdgrpMarkupType.ItemIndex := 1
  else
    rdgrpMarkupType.ItemIndex := 2;
end;

procedure TfrmWTMaintContractMarkup.btnOKClick(Sender: TObject);
begin
  MarkupCharges := chkbxMarkupCharges.checked;
  MarkupCutOuts := chkbxMarkupCutOuts.checked;
  MarkupEdges := chkbxMarkupEdges.checked;
  MarkupMaterials := chkbxMarkupMaterials.checked;
  MarkupFitting := chkbxMarkupFitting.checked;
end;

procedure TfrmWTMaintContractMarkup.SetMarkupCutOuts(const Value: boolean);
begin
  FMarkupCutOuts := Value;
end;

procedure TfrmWTMaintContractMarkup.SetMarkupEdges(const Value: boolean);
begin
  FMarkupEdges := Value;
end;

procedure TfrmWTMaintContractMarkup.SetMarkupFitting(const Value: boolean);
begin
  FMarkupFitting := Value;
end;

procedure TfrmWTMaintContractMarkup.SetMarkupMaterials(
  const Value: boolean);
begin
  FMarkupMaterials := Value;
end;

procedure TfrmWTMaintContractMarkup.ValidateDouble(Sender: TObject);
var
  TempStr: string;
begin
  {Validate double on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmWTMaintContractMarkup.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintContractMarkup.FormCreate(Sender: TObject);
begin
  edtMarkup.Text := '0.00';
end;

procedure TfrmWTMaintContractMarkup.SetMarkupCharges(const Value: boolean);
begin
  FMarkupCharges := Value;
end;

end.
