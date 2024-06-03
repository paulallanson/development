unit PBMaintJobBagSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, PBJobBagDm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagSchedFrm = class(TForm)
    Panel1: TPanel;
    pnlControls: TPanel;
    pnlArtwork: TPanel;
    Panel15: TPanel;
    chkbxArtRequired: TCheckBox;
    scrlArtwork: TScrollBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtArtDueInDate: TEdit;
    edtArtProofReqDate: TEdit;
    edtArtApprovalDate: TEdit;
    Panel12: TPanel;
    memScheduleNotes: TMemo;
    pnlDataServices: TPanel;
    Panel16: TPanel;
    chkbxDSRequired: TCheckBox;
    pnlSamples: TPanel;
    Panel17: TPanel;
    chkbxSamples: TCheckBox;
    scrlSamples: TScrollBox;
    Label27: TLabel;
    Label28: TLabel;
    edtSEPClientDate: TEdit;
    edtSEPApprovalDate: TEdit;
    Panel14: TPanel;
    lblRevision: TLabel;
    Label1: TLabel;
    cmbRevision: TComboBox;
    BitBtn1: TBitBtn;
    qrySchedules: TFDQuery;
    lblScheduleDate: TLabel;
    lblScheduleOp: TLabel;
    Label26: TLabel;
    cmbApprovalType: TComboBox;
    scrlDataServices: TScrollBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtDataDueInDate: TEdit;
    edtClientBriefInDate: TEdit;
    edtTextDueInDate: TEdit;
    edtBriefToDSDate: TEdit;
    edtTextToDSDate: TEdit;
    edtTextProofReqDate: TEdit;
    edtLiveProofReqDate: TEdit;
    edtLiveProofAppDate: TEdit;
    edtDataToDSDate: TEdit;
    edtPDFProofReqDate: TEdit;
    edtPDFProofAppDate: TEdit;
    edtPDFProofArtDate: TEdit;
    pnlBody: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbRevisionClick(Sender: TObject);
  private
    FActivated: boolean;
    FJobBag: TJobBag;
    procedure SetJobBag(const Value: TJobBag);
    { Private declarations }
  public
    property JobBag: TJobBag read FJobBag write SetJobBag;
  end;

var
  PBMaintJobBagSchedFrm: TPBMaintJobBagSchedFrm;

implementation

uses CCSCommon;

{$R *.dfm}

procedure TPBMaintJobBagSchedFrm.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TPBMaintJobBagSchedFrm.SetJobBag(const Value: TJobBag);
begin
  FJobBag := Value;
end;

procedure TPBMaintJobBagSchedFrm.FormActivate(Sender: TObject);
var
  i: integer;
begin
  if not FActivated then
    begin
      cmbRevision.Clear;
      for i := 0 to pred(JobBag.Schedules.count) do
        begin
          cmbRevision.Items.add(inttostr(JobBag.Schedules[i].JBScheduleNo) + ' - ' + formatdatetime('dd"/"mm"/"yy hh:mm',JobBag.Schedules[i].ScheduleDate));
        end;
      cmbRevision.ItemIndex := 0;
      cmbRevisionClick(self);
    end;
end;

procedure TPBMaintJobBagSchedFrm.cmbRevisionClick(Sender: TObject);
var
  inx: integer;
  jobbagSched: TJobbagSched;
begin
  inx := cmbRevision.itemindex + 1;
  inx := JobBag.Schedules.IndexOf(inx);
  jobbagSched := JobBag.Schedules[inx];

  chkbxArtRequired.checked := jobbagSched.ArtRequired;
  edtArtDueInDate.text := pbDatestr(jobbagSched.ArtDueDate);
  edtArtProofReqDate.text := pbDatestr(jobbagSched.ArtProofDate);
  edtArtApprovalDate.text := pbDatestr(jobbagSched.ArtApprovalDate);

  chkbxDSRequired.checked := jobbagSched.DSRequired;
  edtDataDueInDate.text := pbDatestr(jobbagSched.DataRequiredDate);
  edtClientBriefInDate.text := pbDatestr(jobbagSched.BriefRequiredDate);
  edtTextDueInDate.text := pbDatestr(jobbagSched.TextRequiredDate);

  edtBriefToDSDate.text := pbDatestr(jobbagSched.BriefAvailableDate);
  edtDataToDSDate.text := pbDatestr(jobbagSched.DataAvailableDate);
  edtTextToDSDate.text := pbDatestr(jobbagSched.TextAvailableDate);
  edtTextProofReqDate.text := pbDatestr(jobbagSched.TextProofDate);

  edtPDFProofArtDate.text := pbDatestr(jobbagSched.PDFProofArtworkDate);
  edtPDFProofReqDate.text := pbDatestr(jobbagSched.PDFProofRequiredDate);
  edtPDFProofAppDate.text := pbDatestr(jobbagSched.PDFProofApprovalDate);

  edtLiveProofReqDate.text := pbDatestr(jobbagSched.ProofRequiredDate);
  edtLiveProofAppDate.text := pbDatestr(jobbagSched.ProofApprovalDate);

  if jobbagsched.ApprovalType = 'C' then
    cmbApprovalType.ItemIndex := 0
  else
    cmbApprovalType.ItemIndex := 1;

  memScheduleNotes.text := jobbagsched.NarrativeText;

  chkbxSamples.checked := jobbagSched.SamplesRequired;
  edtSepClientDate.text := pbDatestr(jobbagSched.SampleToClientDate);
  edtSepApprovalDate.text := pbDatestr(jobbagSched.SampleApprovalDate);

  lblRevision.caption := 'Revision No: '+ inttostr(JobBagSched.JBScheduleNo);
  lblScheduleDate.caption := 'Date: '+ pbdatestr(JobBagSched.ScheduleDate);
  lblScheduleOp.caption := 'Operator: '+ JobBagSched.OperatorName;

end;

end.
