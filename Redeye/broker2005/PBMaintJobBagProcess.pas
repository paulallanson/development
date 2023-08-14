unit PBMaintJobBagProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PBJoBBagDM, StdCtrls, DBCtrls, Spin, Buttons, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagProcessFrm = class(TForm)
    pnlFoot: TPanel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlProcess: TPanel;
    Process: TLabel;
    edtProcess: TEdit;
    pnlProductSize: TPanel;
    edtProductSize: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    dblkpWorkCentreGroup: TDBLookupComboBox;
    pnlDetails: TPanel;
    cmbSimplexDuplex: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    spnElements: TSpinEdit;
    Label6: TLabel;
    memQuantity: TMemo;
    Label7: TLabel;
    memHours: TMemo;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryWCGroups: TFDQuery;
    dtsWCGroups: TDataSource;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure memHoursKeyPress(Sender: TObject; var Key: Char);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateMoney3DP(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
  private
    FOldValue : string;
    FActivated: boolean;
    FJobBagProcess: TJobBagProcess;
    FMode: TjbprMode;
    procedure SetJobBagProcess(const Value: TJobBagProcess);
    procedure SetMode(const Value: TjbprMode);
    procedure ShowDetails;
    procedure GetWorkCentreGroups;
    { Private declarations }
  public
    property JobBagProcess: TJobBagProcess read FJobBagProcess write SetJobBagProcess;
    property Mode: TjbprMode read FMode write SetMode;
  end;

var
  PBMaintJobBagProcessFrm: TPBMaintJobBagProcessFrm;

implementation

uses PBLUProcess, PBLUStandSize, PBLUWorkCentreGroup, CCSCommon;

{$R *.dfm}

{ TPBMaintJobBagProcessFrm }

procedure TPBMaintJobBagProcessFrm.SetJobBagProcess(
  const Value: TJobBagProcess);
begin
  FJobBagProcess := Value;
end;

procedure TPBMaintJobBagProcessFrm.SetMode(const Value: TjbprMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagProcessFrm.BitBtn4Click(Sender: TObject);
begin
  PBLUProcessFrm := TPBLUProcessFrm.Create(Self);
  try
    PBLUProcessFrm.SelCode := JobBagProcess.Process;
    PBLUProcessFrm.SelName := JobBagProcess.ProcessName;
    PBLUProcessFrm.bIs_Lookup := true;
    PBLUProcessFrm.bAllow_Upd := true;
    PBLUProcessFrm.showmodal;
    if PBLUProcessFrm.Selected then
      begin
        JobBagProcess.Process := PBLUProcessFrm.selcode;
        JobBagProcess.ProcessName := PBLUProcessFrm.selName;
        edtProcess.Text := JobbagProcess.Processname;
        GetWorkCentreGroups;
        checkok(self);
      end;
  finally
    PBLUProcessFrm.free;
  end;
end;

procedure TPBMaintJobBagProcessFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUStandSizeFrm := TPBLUStandSizeFrm.Create(Self);
  try
    PBLUStandSizeFrm.SelCode := JobBagProcess.PaperSize;
    PBLUStandSizeFrm.bIs_Lookup := true;
    PBLUStandSizeFrm.bAllow_Upd := true;
    PBLUStandSizeFrm.showmodal;
    if PBLUStandSizeFrm.Selected then
      begin
        JobBagProcess.PaperSize := PBLUStandSizeFrm.selcode;
        JobBagProcess.PaperSizeDescription := PBLUStandSizeFrm.SelName;
        
        edtProductSize.Text := PBLUStandSizeFrm.SelName;
        JobBagProcess.PaperDepth := PBLUStandSizeFrm.seldepth;
        JobBagProcess.PaperWidth := PBLUStandSizeFrm.selwidth;

        GetWorkCentreGroups;
        checkok(self);
      end;
  finally
    PBLUStandSizeFrm.free;
  end;
end;

procedure TPBMaintJobBagProcessFrm.BitBtn2Click(Sender: TObject);
begin
  PBLUWorkCentreGroupfrm := TPBLUWorkCentreGroupfrm.Create(Self);
  try
    PBLUWorkCentreGroupfrm.bIs_Lookup := true;
    PBLUWorkCentreGroupfrm.bAllow_Upd := true;
    PBLUWorkCentreGroupfrm.showmodal;
  finally
    PBLUWorkCentreGroupfrm.free;
  end;
end;

procedure TPBMaintJobBagProcessFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    if Mode = jbprAdd then
      Caption := 'Add a production process ';
    if Mode = jbprChange then
      Caption := 'Change a production process ';
    if Mode = jbprDelete then
      Caption := 'Delete a production process ';

    ShowDetails;

    pnlProcess.Enabled := (Mode <> jbprDelete) and (Mode <> jbprView);
    pnlProductSize.Enabled := (Mode <> jbprDelete) and (Mode <> jbprView);
    pnlDetails.Enabled := (Mode <> jbprDelete) and (Mode <> jbprView);

    DelLabel.Visible := (Mode = jbprDelete);

    OKBitBtn.Visible := not(Mode = jbprView);

    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TPBMaintJobBagProcessFrm.ShowDetails;
begin
  if Mode = jbprAdd then
  begin
    edtProcess.Text := '';
    edtProductSize.Text := '';
    dblkpWorkCentreGroup.KeyValue := 0;
    cmbSimplexDuplex.ItemIndex := 0;
    spnelements.Value := 1;
    memQuantity.Text := '1';
    memHours.text := '0.00';
  end
  else
  begin
    edtProcess.Text := JobBagProcess.ProcessName;
    edtProductSize.Text := JobBagProcess.PaperSizeDescription;

    dblkpWorkCentreGroup.KeyValue := JobBagProcess.WorkCentreGroup;

    if jobBagProcess.SimplexDuplex = 'S' then
      cmbSimplexDuplex.ItemIndex := 1
    else
    if jobBagProcess.SimplexDuplex = 'D' then
      cmbSimplexDuplex.ItemIndex := 2
    else
      cmbSimplexDuplex.ItemIndex := 0;

    spnelements.Value := JobBagProcess.NoOfElements;
    memQuantity.Text := formatfloat('0',JobBagProcess.Quantity);
    memHours.text := formatfloat('0.00',JobBagProcess.NoOfHours);
    self.GetWorkCentreGroups;
  end;
end;

procedure TPBMaintJobBagProcessFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagProcessFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintJobBagProcessFrm.ValidateMoney(Sender: TObject);
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

procedure TPBMaintJobBagProcessFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagProcessFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (edtProcess.text <> '') and
                      (edtProductSize.text <> '') and
                      (dblkpWorkCentreGroup.text <> '') and
                      (Trim(memQuantity.Text) <> '');
end;

procedure TPBMaintJobBagProcessFrm.GetWorkCentreGroups;
begin
  with qryWCGroups do
    begin
      close;
      parambyname('Process').asinteger := JobBagProcess.Process;
      parambyname('Paper_Size').asinteger := JobBagProcess.PaperSize;
      open;
    end;
end;

procedure TPBMaintJobBagProcessFrm.OKBitBtnClick(Sender: TObject);
var
  inx: integer;
begin
  case cmbSimplexDuplex.itemindex of
    0: JobBagProcess.SimplexDuplex := 'N';
    1: JobBagProcess.SimplexDuplex := 'S';
    2: JobBagProcess.SimplexDuplex := 'D';
  end;

  JobBagProcess.NoOfHours := StrToFloatDef(memHours.text, 0, FormatSettings) ;
  JobBagProcess.Quantity := strtoint(memQuantity.text) ;
  JobBagProcess.NoOfElements := spnElements.value ;
  JobBagProcess.WorkCentreGroup := dblkpWorkCentreGroup.KeyValue;
  JobBagProcess.WorkCentreGroupName := dblkpWorkCentreGroup.Text;

  if Mode = jbprAdd then
  begin
    JobBagProcess.JBProcessNo := JobBagProcess.Parent.Processes.Count + 1;
    JobBagProcess.Parent.Processes.Add(JobBagProcess);
  end
  else
  if Mode = jbprDelete then
  begin
    inx := JobBagProcess.Parent.Processes.IndexOf(JobBagProcess.JBProcessNo);
    JobBagProcess.Parent.Processes.Delete(inx);
    JobBagProcess.Parent.Processes.Renumber;
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagProcessFrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintJobBagProcessFrm.memHoursKeyPress(Sender: TObject;
  var Key: Char);
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
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
