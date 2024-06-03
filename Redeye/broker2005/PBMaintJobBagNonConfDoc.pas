unit PBMaintJobBagNonConfDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Buttons, ExtCtrls, PBJobBagDM, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagNonConfDocFrm = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryNCType: TFDQuery;
    qryRaisingDept: TFDQuery;
    qrySourceDept: TFDQuery;
    qryQAOperator: TFDQuery;
    dtsNCType: TDataSource;
    dtsRaisingDept: TDataSource;
    dtsSourceDept: TDataSource;
    dtsQAOperator: TDataSource;
    DelLabel: TLabel;
    StatusBar1: TStatusBar;
    pnlNotes: TPanel;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    dblkpQAOperator: TDBLookupComboBox;
    memTotalCost: TMemo;
    BitBtn4: TBitBtn;
    edtQASignOff: TEdit;
    btnDate: TBitBtn;
    memCosttoClient: TMemo;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    edtRaisedBy: TEdit;
    BitBtn2: TBitBtn;
    dblkpRaisedByDept: TDBLookupComboBox;
    dblkpSourceDept: TDBLookupComboBox;
    dblkpNCType: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    edtDateRaised: TEdit;
    btnDateRaised: TBitBtn;
    edtNCANumber: TEdit;
    pnlNCAdetails: TPanel;
    Panel5: TPanel;
    memDetails: TMemo;
    pnlResponse: TPanel;
    Panel7: TPanel;
    pnlAction: TPanel;
    Panel6: TPanel;
    memAction: TMemo;
    memResponse: TMemo;
    pnlPrevent: TPanel;
    Panel9: TPanel;
    memPrevent: TMemo;
    btnClear: TBitBtn;
    rdgrpJobRePrinted: TRadioGroup;
    rdgrpSamples: TRadioGroup;
    Label22: TLabel;
    dblkpCategory: TDBLookupComboBox;
    BitBtn5: TBitBtn;
    qryCategory: TFDQuery;
    dtsCategory: TDataSource;
    pnlBody: TPanel;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure memDetailsChange(Sender: TObject);
    procedure memResponseChange(Sender: TObject);
    procedure memActionChange(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtQASignOffExit(Sender: TObject);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney3DP(Sender: TObject);
    procedure btnDateRaisedClick(Sender: TObject);
    procedure edtDateRaisedExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure memPreventChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dblkpQAOperatorClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TJBNCMode;
    FOldValue: string;
    FJobBagNonConform: TJobBagNonConform;
    procedure SetJobBagNonConform(const Value: TJobBagNonConform);
    procedure SetMode(const Value: TJBNCMode);
    procedure ShowDetails;
    { Private declarations }
  public
    property JobBagNonConform: TJobBagNonConform read FJobBagNonConform write SetJobBagNonConform;
    property Mode: TJBNCMode read FMode write SetMode;
  end;

var
  PBMaintJobBagNonConfDocFrm: TPBMaintJobBagNonConfDocFrm;

implementation

uses UITypes, PBLUOps, PBLUNonConformType, PBLUNonConformDept, CCSCommon, DateSelV5,
  pbMainMenu, PBLUNonConformCat;

{$R *.dfm}

{ TPBMaintJobBagNonConfDocFrm }

procedure TPBMaintJobBagNonConfDocFrm.SetJobBagNonConform(
  const Value: TJobBagNonConform);
begin
  FJobBagNonConform := Value;
end;

procedure TPBMaintJobBagNonConfDocFrm.SetMode(const Value: TJBNCMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagNonConfDocFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
    if Mode = jbncAdd then
      Caption := 'Add non conformance details';
    if Mode = jbncChange then
      Caption := 'Change non conformance details ';
    if Mode = jbncDelete then
      Caption := 'Delete non conformance details ';

    with qryQAOperator do
      begin
        close;
        parambyname('QA_Operator').asinteger := JobBagNonConform.QAOperator;
        open;
      end;

    with qryNCType do
      begin
        close;
        parambyname('Non_Conform_Type').asinteger := JobBagNonConform.NCType;
        open;
      end;

    with qryCategory do
      begin
        close;
        parambyname('Non_Conform_Category').asinteger := JobBagNonConform.NCCategory;
        open;
      end;

    with qryRaisingDept do
      begin
        close;
        parambyname('Non_Conform_Dept').asinteger := JobBagNonConform.RaisedBy;
        open;
      end;

    with qrySourceDept do
      begin
        close;
        parambyname('Non_Conform_Dept').asinteger := JobBagNonConform.NCDepartment;
        open;
      end;

    ShowDetails;

    DelLabel.Visible := (Mode = jbncDelete);

    btnOK.Visible := not(Mode = jbncView);

    CheckOK(Self);
    FActivated := true;
    end;
end;

procedure TPBMaintJobBagNonConfDocFrm.BitBtn2Click(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.create(self);
  try
    PBLUOpsFrm.bIs_Lookup := true;
    PBLUOpsFrm.bAllow_Upd := false;
    PBLUOpsFrm.showmodal;
    if PBLUOpsFrm.Selected then
      begin
        JobBagNonConform.Operator := PBLUOpsFrm.SelCode;
        JobBagNonConform.OperatorName := PBLUOpsFrm.SelName;
        edtRaisedby.Text := PBLUOpsFrm.SelName;
      end;
  finally
    PBLUOpsFrm.free;
    checkOK(self);
  end;
end;

procedure TPBMaintJobBagNonConfDocFrm.ShowDetails;
begin
  if Mode = jbncAdd then
    begin
      edtDateRaised.text := pbDatestr(now);
      dblkpNCType.keyvalue := 0;
      edtNCANumber.Text := '<New Number>';
      edtRaisedBy.text := '';
      dblkpRaisedByDept.keyvalue := 0;
      dblkpCategory.KeyValue := 0;
      dblkpSourceDept.keyvalue := 0;
      dblkpQAOperator.keyvalue := 0;
      edtQASignOff.text := '';
      memTotalCost.text := '0.00';
      memCostToClient.text := '0.00';
      memDetails.lines.clear;
      memResponse.lines.clear;
      memAction.lines.clear;
      memPrevent.lines.clear;
    end
  else
    begin
      edtNCANumber.Text := inttostr(JobBagNonConform.NCNumber);
      edtDateRaised.text := pbDateStr(JobBagNonConform.DatePoint);
      dblkpNCType.keyvalue := JobBagNonConform.NCType;
      edtRaisedBy.text := JobBagNonConform.OperatorName;
      dblkpRaisedByDept.keyvalue := JobBagNonConform.RaisedBy;
      dblkpCategory.keyvalue := JobBagNonConform.NCCategory;
      dblkpSourceDept.keyvalue := JobBagNonConform.NCDepartment;
      dblkpQAOperator.keyvalue := JobBagNonConform.QAOperator;
      edtQASignOff.text := pbdatestr(JobBagNonConform.QASignOffDate);
      memTotalCost.text := formatfloat('0.00',JobBagNonConform.totalCost);
      memCostToClient.text := formatfloat('0.00',JobBagNonConform.CosttoClient);
      memDetails.text := JobBagNonConform.NarrativeText;
      memResponse.Text := JobBagNonConform.ResponseNotes;
      memAction.Text := JobBagNonConform.CorrectiveNotes;
      memPrevent.Text := JobBagNonConform.PreventativeNotes;

      //Display Job Reprinted
      if JobBagNonConform.JobRePrinted = 'Y' then
        rdgrpJobRePrinted.ItemIndex := 0
      else
      if JobBagNonConform.JobRePrinted = 'N' then
        rdgrpJobRePrinted.ItemIndex := 1
      else
        rdgrpJobRePrinted.ItemIndex := 2;
      // Display Samples Availbale
      if JobBagNonConform.SamplesAvailable = 'Y' then
        rdgrpSamples.ItemIndex := 0
      else
      if JobBagNonConform.SamplesAvailable = 'N' then
        rdgrpSamples.ItemIndex := 1
      else
        rdgrpSamples.ItemIndex := 2;

    end;
  CheckOk(self);
end;

procedure TPBMaintJobBagNonConfDocFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  btnOK.Enabled := (Trim(edtRaisedBy.Text) <> '') and
    (dblkpNCType.Text <> '') and
    (dblkpRaisedByDept.Text <> '') and
    (dblkpSourceDept.Text <> '') and
    (Trim(edtDateRaised.Text) <> '') and
    (Trim(memDetails.Text) <> '');
end;

procedure TPBMaintJobBagNonConfDocFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUNonConformTypeFrm := TPBLUNonConformTypeFrm.create(self);
  try
    PBLUNonConformTypeFrm.bAllow_Upd := true;
    PBLUNonConformTypeFrm.bIs_lookup := true;
    PBLUNonConformTypeFrm.showmodal;
  finally
    PBLUNonConformTypeFrm.free;
  end;

  with qryNCType do
    begin
      close;
      parambyname('Non_Conform_Type').asinteger := dblkpNCType.KeyValue;
      open;
    end;

end;

procedure TPBMaintJobBagNonConfDocFrm.BitBtn3Click(Sender: TObject);
begin
  PBLUNonConformDeptFrm := TPBLUNonConformDeptFrm.create(self);
  try
    PBLUNonConformDeptFrm.bIs_Lookup := true;
    PBLUNonConformDeptFrm.bAllow_Upd := true;
    PBLUNonConformDeptFrm.showmodal;
  finally
    PBLUNonConformDeptFrm.free;
  end;

  with qryRaisingDept do
    begin
      close;
      parambyname('Non_Conform_Dept').asinteger := dblkpRaisedbyDept.KeyValue;
      open;
    end;

  with qrySourceDept do
    begin
      close;
      parambyname('Non_Conform_Dept').asinteger := dblkpSourceDept.KeyValue;
      open;
    end;
end;

procedure TPBMaintJobBagNonConfDocFrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  if Mode = jbncAdd then
  begin
    if (dblkpCategory.Text = '') then
      begin
        MessageDlg('Please specify a Non Conformance Category', mtInformation, [mbOk], 0);
        dblkpCategory.setfocus;
        exit;
      end;
  end;

  if (rdgrpJobReprinted.itemindex = -1) or (rdgrpSamples.itemindex = -1) then
    begin
      MessageDlg('Please specify whether the job has been reprinted and whether samples are available', mtInformation, [mbOk], 0);
      exit;
    end;

  if (dblkpQAOperator.KeyValue <> 0) then
    begin
      if (trim(memDetails.Text) = '') or (trim(memAction.Text) = '') or (trim(memResponse.Text) = '') or (trim(memPrevent.Text) = '') then
        begin
          MessageDlg('This Non Conformance cannot be signed off until all details have been completed', mtInformation, [mbOk], 0);
          exit;
        end;
    end;

  JobBagNonConform.DatePoint := pbDateStr(edtDateRaised.Text);
  JobBagNonConform.NCType := dblkpNCType.KeyValue;
  JobBagNonConform.NCTypeDescription := dblkpNCType.text;
  JobBagNonConform.RaisedBy := dblkpRaisedbyDept.KeyValue;
  JobBagNonConform.RaisedByName := dblkpRaisedbyDept.Text;
  JobBagNonConform.NCCategory := dblkpCategory.KeyValue;
  JobBagNonConform.NCCategoryDescription := dblkpCategory.Text;
  JobBagNonConform.NCDepartment := dblkpSourceDept.KeyValue;
  JobBagNonConform.NCDepartmentName := dblkpSourceDept.text;
  JobBagNonConform.QAOperator := dblkpQAOperator.KeyValue;
  JobBagNonConform.QAOperatorName := dblkpQAOperator.text;
  JobBagNonConform.QASignOffDate := pbdatestr(edtQASignOff.text);
  JobBagNonConform.TotalCost := StrToFloatDef(memTotalCost.Text, 0, FormatSettings);
  JobBagNonConform.CosttoClient := StrToFloatDef(memCosttoClient.Text, 0, FormatSettings);

  case rdgrpJobReprinted.itemindex of
    0: JobBagNonConform.JobRePrinted := 'Y';
    1: JobBagNonConform.JobRePrinted := 'N';
  else
    JobBagNonConform.JobRePrinted := 'X';
  end;

  case rdgrpSamples.itemindex of
    0: JobBagNonConform.SamplesAvailable := 'Y';
    1: JobBagNonConform.SamplesAvailable := 'N'
  else
    JobBagNonConform.SamplesAvailable := 'X';
  end;

  if Mode = jbncAdd then
  begin
    JobBagNonConform.status := 10;
    JobBagNonConform.JBNonConformNo := JobBagNonConform.Parent.NonConformDocs.Count + 1;
    JobBagNonConform.NCNumber := JobBagNonConform.Parent.GetNextJBNonConformNo;
    JobBagNonConform.Parent.NonConformDocs.Add(JobBagNonConform);
  end
  else
  if Mode = jbncChange then
  begin
    if dblkpQAOperator.keyvalue <> 0 then
      JobBagNonConform.status := 50
    else
    if trim(memAction.text) <> '' then
      JobBagNonConform.status := 30
    else
    if trim(memResponse.text) <> '' then
      JobBagNonConform.status := 20
    else
      JobBagNonConform.status := 10;
  end
  else
  if Mode = jbncDelete then
  begin
    inx := JobBagNonConform.Parent.Lines.IndexOf(JobBagNonConform.JBNonConformNo);
    JobBagNonConform.Parent.NonConformDocs.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagNonConfDocFrm.memDetailsChange(Sender: TObject);
begin
  JobBagNonConform.NarrativeText := (Sender as TMemo).text;
  checkok(self);
end;

procedure TPBMaintJobBagNonConfDocFrm.memResponseChange(Sender: TObject);
begin
  JobBagNonConform.ResponseNotes := (Sender as TMemo).text;
end;

procedure TPBMaintJobBagNonConfDocFrm.memActionChange(Sender: TObject);
begin
  JobBagNonConform.CorrectiveNotes := (Sender as TMemo).text;
end;

procedure TPBMaintJobBagNonConfDocFrm.btnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtQASignOff.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtQASignOff.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagNonConfDocFrm.edtQASignOffExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtQASignOff.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtQASignOff.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtQASignOff.SetFocus;
      Exit;
    end;
  end;

  edtQASignOff.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintJobBagNonConfDocFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagNonConfDocFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagNonConfDocFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;
procedure TPBMaintJobBagNonConfDocFrm.btnDateRaisedClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateRaised.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateRaised.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagNonConfDocFrm.edtDateRaisedExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtQASignOff.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtDateRaised.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateRaised.SetFocus;
      Exit;
    end;
  end;

  edtDateRaised.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintJobBagNonConfDocFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagNonConfDocFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagNonConfDocFrm.FormResize(Sender: TObject);
begin
  self.pnlNCADetails.height := trunc((self.pnlNotes.height/4));
  self.pnlAction.height := trunc((self.pnlNotes.height/4));
  self.pnlPrevent.height := trunc((self.pnlNotes.height/4));
end;

procedure TPBMaintJobBagNonConfDocFrm.memPreventChange(Sender: TObject);
begin
  JobBagNonConform.PreventativeNotes := (Sender as TMemo).text;
end;

procedure TPBMaintJobBagNonConfDocFrm.btnClearClick(Sender: TObject);
begin
  dblkpQAOperator.KeyValue := 0;
end;

procedure TPBMaintJobBagNonConfDocFrm.dblkpQAOperatorClick(
  Sender: TObject);
begin
  if edtQASignOff.Text = '' then
    edtQAsignOff.Text := pbdatestr(date);
end;

procedure TPBMaintJobBagNonConfDocFrm.BitBtn5Click(Sender: TObject);
var
  iCategory: integer;
begin
  PBLUNonConformCatFrm := TPBLUNonConformCatFrm.create(self);
  try
    PBLUNonConformCatFrm.bIs_Lookup := true;
    PBLUNonConformCatFrm.bAllow_Upd := true;
    PBLUNonConformCatFrm.showmodal;
  finally
    PBLUNonConformCatFrm.free;
  end;

  if dblkpCategory.text = '' then
    iCategory := 0
  else
    iCategory := dblkpCategory.KeyValue;

  with qryCategory do
    begin
      close;
      parambyname('Non_Conform_Category').asinteger := iCategory;
      open;
    end;
end;

end.
