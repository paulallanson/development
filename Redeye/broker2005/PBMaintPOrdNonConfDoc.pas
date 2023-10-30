unit PBMaintPOrdNonConfDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Buttons, ExtCtrls, PBPOObjects, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPOrdNonConfDocFrm = class(TForm)
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
  private
    FActivated: boolean;
    FOldValue: string;
    FNonConform: TNonConform;
    FMode: TpoNCMode;
    FSelectedLine: TorderLine;
    procedure SetNonConform(const Value: TNonConform);
    procedure ShowDetails;
    procedure SetMode(const Value: TpoNCMode);
    procedure SetSelectedLine(const Value: TorderLine);
    { Private declarations }
  public
    property NonConform: TNonConform read FNonConform write SetNonConform;
    property Mode: TPONCMode read FMode write SetMode;
    property SelectedLine: TorderLine read FSelectedLine write SetSelectedLine;
  end;

var
  PBMaintPOrdNonConfDocFrm: TPBMaintPOrdNonConfDocFrm;

implementation

uses
  System.UITypes,
  PBLUOps, PBLUNonConformType, PBLUNonConformDept, CCSCommon, DateSelV5,
  pbMainMenu, PBPODataMod;

{$R *.dfm}

{ TPBMaintJobBagNonConfDocFrm }

procedure TPBMaintPOrdNonConfDocFrm.SetNonConform(
  const Value: TNonConform);
begin
  FNonConform := Value;
end;

procedure TPBMaintPOrdNonConfDocFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
    if Mode = poncAdd then
      Caption := 'Add non conformance details';
    if Mode = poncChange then
      Caption := 'Change non conformance details ';
    if Mode = poncDelete then
      Caption := 'Delete non conformance details ';

    with qryQAOperator do
      begin
        close;
        parambyname('QA_Operator').asinteger := NonConform.QAOperator;
        open;
      end;

    with qryNCType do
      begin
        close;
        parambyname('Non_Conform_Type').asinteger := NonConform.NCType;
        open;
      end;

    with qryCategory do
      begin
        close;
        parambyname('Non_Conform_Category').asinteger := NonConform.NCCategory;
        open;
      end;

    with qryRaisingDept do
      begin
        close;
        parambyname('Non_Conform_Dept').asinteger := NonConform.RaisedBy;
        open;
      end;

    with qrySourceDept do
      begin
        close;
        parambyname('Non_Conform_Dept').asinteger := NonConform.NCDepartment;
        open;
      end;

    ShowDetails;

    DelLabel.Visible := (Mode = poncDelete);

    btnOK.Visible := not(Mode = poncView);

    CheckOK(Self);
    FActivated := true;
    end;
end;

procedure TPBMaintPOrdNonConfDocFrm.BitBtn2Click(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.create(self);
  try
    PBLUOpsFrm.bIs_Lookup := true;
    PBLUOpsFrm.bAllow_Upd := false;
    PBLUOpsFrm.showmodal;
    if PBLUOpsFrm.Selected then
      begin
        NonConform.Operator := PBLUOpsFrm.SelCode;
        NonConform.OperatorName := PBLUOpsFrm.SelName;
        edtRaisedby.Text := PBLUOpsFrm.SelName;
      end;
  finally
    PBLUOpsFrm.free;
    checkOK(self);
  end;
end;

procedure TPBMaintPOrdNonConfDocFrm.ShowDetails;
begin
  if Mode = poncAdd then
    begin
      edtDateRaised.text := pbDatestr(now);
      dblkpNCType.keyvalue := 0;
      edtNCANumber.Text := '<New Number>';
      edtRaisedBy.text := '';
      dblkpRaisedByDept.keyvalue := 0;
      dblkpCategory.keyvalue := 0;
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
      edtNCANumber.Text := inttostr(NonConform.NCNumber);
      edtDateRaised.text := pbDateStr(NonConform.DatePoint);
      dblkpNCType.keyvalue := NonConform.NCType;
      edtRaisedBy.text := NonConform.OperatorName;
      dblkpRaisedByDept.keyvalue := NonConform.RaisedBy;
      dblkpCategory.keyvalue := NonConform.NCCategory;
      dblkpSourceDept.keyvalue := NonConform.NCDepartment;
      dblkpQAOperator.keyvalue := NonConform.QAOperator;
      edtQASignOff.text := pbdatestr(NonConform.QASignOffDate);
      memTotalCost.text := formatfloat('0.00',NonConform.totalCost);
      memCostToClient.text := formatfloat('0.00',NonConform.CosttoClient);
      memDetails.text := NonConform.NarrativeText;
      memResponse.Text := NonConform.ResponseNotes;
      memAction.Text := NonConform.CorrectiveNotes;
      memPrevent.Text := NonConform.PreventativeNotes;

      //Display Job Reprinted
      if NonConform.JobRePrinted = 'Y' then
        rdgrpJobRePrinted.ItemIndex := 0
      else
      if NonConform.JobRePrinted = 'N' then
        rdgrpJobRePrinted.ItemIndex := 1
      else
        rdgrpJobRePrinted.ItemIndex := 2;
      // Display Samples Availbale
      if NonConform.SamplesAvailable = 'Y' then
        rdgrpSamples.ItemIndex := 0
      else
      if NonConform.SamplesAvailable = 'N' then
        rdgrpSamples.ItemIndex := 1
      else
        rdgrpSamples.ItemIndex := 2;

    end;
  CheckOk(self);
end;

procedure TPBMaintPOrdNonConfDocFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  btnOK.Enabled := (Trim(edtRaisedBy.Text) <> '') and
    (dblkpNCType.Text <> '') and
    (dblkpRaisedByDept.Text <> '') and
    (dblkpSourceDept.Text <> '') and
    (Trim(edtDateRaised.Text) <> '') and
    (Trim(memDetails.Text) <> '');
end;

procedure TPBMaintPOrdNonConfDocFrm.BitBtn1Click(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.BitBtn3Click(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  if Mode = poncAdd then
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

  NonConform.DatePoint := pbDateStr(edtDateRaised.Text);
  NonConform.NCType := dblkpNCType.KeyValue;
  NonConform.NCTypeDescription := dblkpNCType.text;
  NonConform.RaisedBy := dblkpRaisedbyDept.KeyValue;
  NonConform.RaisedByName := dblkpRaisedbyDept.Text;
  NonConform.NCCategory := dblkpCategory.KeyValue;
  NonConform.NCDepartment := dblkpSourceDept.KeyValue;
  NonConform.NCDepartmentName := dblkpSourceDept.text;
  NonConform.QAOperator := dblkpQAOperator.KeyValue;
  NonConform.QAOperatorName := dblkpQAOperator.text;
  NonConform.QASignOffDate := pbdatestr(edtQASignOff.text);
  NonConform.TotalCost := StrToFloatDef(memTotalCost.Text, 0, FormatSettings);
  NonConform.CosttoClient := StrToFloatDef(memCosttoClient.Text, 0, FormatSettings);

  case rdgrpJobReprinted.itemindex of
    0: NonConform.JobRePrinted := 'Y';
    1: NonConform.JobRePrinted := 'N';
  else
    NonConform.JobRePrinted := 'X';
  end;

  case rdgrpSamples.itemindex of
    0: NonConform.SamplesAvailable := 'Y';
    1: NonConform.SamplesAvailable := 'N'
  else
    NonConform.SamplesAvailable := 'X';
  end;

  if Mode = poncAdd then
  begin
    NonConform.status := 10;
    NonConform.NonConformNo := selectedline.NonConformDocs.Count + 1;
    NonConform.NCNumber := PBPODM.GetNextJBNonConformNo;
    SelectedLine.NonConformDocs.Add(NonConform);
  end
  else
  if Mode = poncChange then
  begin
    if dblkpQAOperator.keyvalue <> 0 then
      NonConform.status := 50
    else
    if trim(memAction.text) <> '' then
      NonConform.status := 30
    else
    if trim(memResponse.text) <> '' then
      NonConform.status := 20
    else
      NonConform.status := 10;
  end
  else
  if Mode = poNCDelete then
  begin
    inx := SelectedLine.NonConformDocs.IndexOf(NonConform.NonConformNo);
    SelectedLine.NonConformDocs.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintPOrdNonConfDocFrm.memDetailsChange(Sender: TObject);
begin
  NonConform.NarrativeText := (Sender as TMemo).text;
  checkok(self);
end;

procedure TPBMaintPOrdNonConfDocFrm.memResponseChange(Sender: TObject);
begin
  NonConform.ResponseNotes := (Sender as TMemo).text;
end;

procedure TPBMaintPOrdNonConfDocFrm.memActionChange(Sender: TObject);
begin
  NonConform.CorrectiveNotes := (Sender as TMemo).text;
end;

procedure TPBMaintPOrdNonConfDocFrm.btnDateClick(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.edtQASignOffExit(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdNonConfDocFrm.ValidateMoney3DP(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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
procedure TPBMaintPOrdNonConfDocFrm.btnDateRaisedClick(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.edtDateRaisedExit(Sender: TObject);
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

procedure TPBMaintPOrdNonConfDocFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintPOrdNonConfDocFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintPOrdNonConfDocFrm.FormResize(Sender: TObject);
begin
  self.pnlNCADetails.height := trunc((self.pnlNotes.height/4));
  self.pnlAction.height := trunc((self.pnlNotes.height/4));
  self.pnlPrevent.height := trunc((self.pnlNotes.height/4));
end;

procedure TPBMaintPOrdNonConfDocFrm.memPreventChange(Sender: TObject);
begin
  NonConform.PreventativeNotes := (Sender as TMemo).text;
end;

procedure TPBMaintPOrdNonConfDocFrm.btnClearClick(Sender: TObject);
begin
  dblkpQAOperator.KeyValue := 0;
end;

procedure TPBMaintPOrdNonConfDocFrm.dblkpQAOperatorClick(
  Sender: TObject);
begin
  if edtQASignOff.Text = '' then
    edtQAsignOff.Text := pbdatestr(date);
end;

procedure TPBMaintPOrdNonConfDocFrm.SetMode(const Value: TpoNCMode);
begin
  FMode := Value;
end;

procedure TPBMaintPOrdNonConfDocFrm.SetSelectedLine(
  const Value: TorderLine);
begin
  FSelectedLine := Value;
end;

end.
