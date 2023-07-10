unit PBMaintCRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Spin, DBCtrls;

type
  TpbMaintCRepFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CustNameEdit: TEdit;
    RepsDBLCB: TDBLookupComboBox;
    spnPercentage: TSpinEdit;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    GetRepsSQL: TQuery;
    CancelBitBtn: TBitBtn;
    RepsSRC: TDataSource;
    DelSQL: TQuery;
    UpdSQL: TQuery;
    AddSQL: TQuery;
    qryGetRep: TQuery;
    qryBranches: TQuery;
    dtsBranches: TDataSource;
    dblkpBranches: TDBLookupComboBox;
    qryAllBranches: TQuery;
    qryGetBranches: TQuery;
    chkbxIsMainRep: TCheckBox;
    qryGetRepBranches: TQuery;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure RepsDBLCBClick(Sender: TObject);
    procedure dblkpBranchesClick(Sender: TObject);
  private
    FProspect: boolean;
    FEndUser: boolean;
    function IsMainRep: boolean;
    function IsRepInactive(tempCode: integer): boolean;
    procedure SetProspect(const Value: boolean);
    procedure SetEndUser(const Value: boolean);
    { Private declarations }
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    OperatorRep: integer;
    sCustName, sBranchName: string;
    property EndUser: boolean read FEndUser write SetEndUser;
    property Prospect: boolean read FProspect write SetProspect;
  end;

var
  pbMaintCRepFrm: TpbMaintCRepFrm;

implementation

uses pbDatabase, pbMainMenu, PBLUReps;

{$R *.dfm}

procedure TpbMaintCRepFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL};
  with GetRepsSQL do
  begin
    Close;
    if sFuncMode = 'A' then
      begin
        ParamByName('Inactive').Asstring := 'N';
      end
    else
      begin
        ParamByName('Inactive').Asstring := 'Y';
      end;
    Parambyname('Rep').asinteger := OperatorRep;
    Open;
  end;

  if sFuncMode = 'A' then
    begin
        qryGetBranches.sql := qryBranches.sql;
        qryGetBranches.Close;
        qryGetBranches.ParamByName('Customer').AsInteger := iCust;
        qryGetBranches.ParamByName('Inactive').Asstring := 'N';
        qryGetBranches.open;
      end
    else
      begin
        qryGetBranches.sql := qryAllBranches.sql;
        qryGetBranches.Close;
        qryGetBranches.ParamByName('Customer').AsInteger := iCust;
        qryGetBranches.ParamByName('Inactive').Asstring := 'Y';
        qryGetBranches.open;
      end;

  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new rep to this branch';
  if sFuncMode = 'C' then
    Caption := 'Change a rep on this branch';
  if sFuncMode = 'D' then
    Caption := 'Delete a rep from this branch';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    spnPercentage.Value := 100;
    RepsDBLCB.KeyValue := 0;
    RepsDBLCB.Enabled := True;
    dblkpBranches.KeyValue := 0;
    dblkpBranches.enabled := true;
(*    if frmPBLUReps.dtsReps.DataSet.RecordCount = 0 then
      chkbxIsMainRep.checked := true
    else
*)
    chkbxIsMainRep.checked := self.IsMainRep;
  end
  else
  begin
    with frmPBLUReps.dtsReps.dataset do
    begin
      iCode := FieldByName('Rep').AsInteger;
      spnPercentage.Value := FieldByName('Percentage').Asinteger;
      chkbxIsMainRep.checked := (fieldbyname('Is_Main_Rep').asstring = 'Y');
      iCode := FieldByName('Rep').AsInteger;
      iBranch := fieldbyname('Branch_no').asinteger;
      dblkpBranches.KeyValue := fieldbyname('Branch_no').asinteger;
      dblkpBranches.enabled := false;
      RepsDBLCB.KeyValue := FieldByName('Rep').AsInteger;
      RepsDBLCB.Enabled := False;

    end;
  end;
  CustNameEdit.Text := sCustName;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if sFuncMode = 'A' then
    dblkpBranches.SetFocus;

  {Depending on type of view then use relevant operator permissions}
  if Prospect then
    dmBroker.ScreenAccessControl(Self,'mnuProspects',frmPBMainMenu.iOperator,0,0)
  else
    dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCRepFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (RepsDBLCB.text <> '');
end;

procedure TpbMaintCRepFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TpbMaintCRepFrm.OKBitBtnClick(Sender: TObject);
begin
  iBranch := dblkpBranches.KeyValue;
  if sFuncMode = 'A' then
  begin
    if ((frmPBLUReps.totalpercentage + spnPercentage.value) > 100) then
      begin
        MessageDlg('The total of all reps responsibility cannot be greater than 100%', mtInformation,
          [mbOk], 0);
        exit;
      end;
    if IsRepInactive(repsdblcb.KeyValue) then
      begin
        MessageDlg('Cannot allocate the selected rep, this rep is inactive', mtInformation,
          [mbOk], 0);
        exit;
      end;
    {Add a new code};
    {Get Next code};
    with AddSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := dblkpBranches.KeyValue;
      ParamByName('Rep').AsInteger := RepsDBLCB.KeyValue;
      ParamByName('Percentage').AsFloat := spnPercentage.value;

      if self.IsMainRep then
        ParamByName('Is_Main_Rep').asstring := 'Y'
      else
        begin
          if chkbxIsMainRep.checked then
            ParamByName('Is_Main_Rep').asstring := 'Y'
          else
            ParamByName('Is_Main_Rep').clear;
        end;

      ExecSQL;
    end;
    iCode := RepsDBLCB.KeyValue;
  end;
  if sFuncMode = 'C' then
  begin
    if ((frmPBLUReps.totalpercentage
        - frmPBLUReps.dtsReps.dataset.fieldbyname('Percentage').asfloat
        + spnPercentage.value) > 100) then
      begin
        MessageDlg('The total of all reps responsibility cannot be greater than 100%', mtInformation,
          [mbOk], 0);
        exit;
      end;
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Rep').AsInteger := iCode;
      ParamByName('Percentage').AsFloat := spnPercentage.Value;
      if self.IsMainRep then
        ParamByName('Is_Main_Rep').asstring := 'Y'
      else
        begin
          if chkbxIsMainRep.checked then
            ParamByName('Is_Main_Rep').asstring := 'Y'
          else
            ParamByName('Is_Main_Rep').clear;
        end;
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete this rep from the customer/branch ?',
      mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Rep').AsInteger := iCode;
      ExecSQL;
    end;
  end;
  ModalResult := mrOK;
end;

procedure TpbMaintCRepFrm.RepsDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

function TpbMaintCRepFrm.IsRepInactive(tempCode: integer): boolean;
begin
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempcode;
      open;
      result := (fieldbyname('Inactive').asstring = 'Y');
    end;
end;

function TpbMaintCRepFrm.IsMainRep: boolean;
begin
  with qryGetRepBranches do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_No').asinteger := iBranch;
      open;
      result := (recordcount = 0);
    end;
end;

procedure TpbMaintCRepFrm.dblkpBranchesClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TpbMaintCRepFrm.SetProspect(const Value: boolean);
begin
  FProspect := Value;
end;

procedure TpbMaintCRepFrm.SetEndUser(const Value: boolean);
begin
  FEndUser := Value;
end;

end.
