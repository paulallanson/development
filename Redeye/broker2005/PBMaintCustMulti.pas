unit PBMaintCustMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, pbCustomerDM;

type
  TPBMaintCustMultiFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtTown: TEdit;
    edtCounty: TEdit;
    chkbxInvUpfront: TCheckBox;
    edtTownTo: TEdit;
    edtCountyTo: TEdit;
    edtVatRate: TEdit;
    edtType: TEdit;
    edtRevenuecentre: TEdit;
    edtStatus: TEdit;
    edtPaymentTerms: TEdit;
    chkbxActive: TCheckBox;
    Label10: TLabel;
    edtRep: TEdit;
    chkbxInvUpfrontTo: TCheckBox;
    chkbxActiveTo: TCheckBox;
    btnVat: TBitBtn;
    btnType: TBitBtn;
    btnRevCentre: TBitBtn;
    btnPaymentTerms: TBitBtn;
    dblkpVatRate: TDBLookupComboBox;
    dblkpType: TDBLookupComboBox;
    dblkpRevenueCentre: TDBLookupComboBox;
    dblkpStatus: TDBLookupComboBox;
    dblkpPaymentTerms: TDBLookupComboBox;
    dblkpRep: TDBLookupComboBox;
    btnReps: TBitBtn;
    btbtnClearAccInfo: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label11: TLabel;
    edtImportance: TEdit;
    dblkpImportance: TDBLookupComboBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    edtAnalysis1: TEdit;
    edtAnalysis2: TEdit;
    lblAnalysis1: TLabel;
    lblAnalysis2: TLabel;
    edtAnalysisTo1: TEdit;
    edtAnalysisTo2: TEdit;
    Label12: TLabel;
    edtAccManager: TEdit;
    Label13: TLabel;
    edtSecondaryRep: TEdit;
    dblkpAccManager: TDBLookupComboBox;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    dblkpSecondaryRep: TDBLookupComboBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    edtAnalysis3: TEdit;
    edtAnalysis4: TEdit;
    lblAnalysis3: TLabel;
    lblAnalysis4: TLabel;
    edtAnalysisTo3: TEdit;
    edtAnalysisTo4: TEdit;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVatClick(Sender: TObject);
    procedure btnTypeClick(Sender: TObject);
    procedure btnRevCentreClick(Sender: TObject);
    procedure btnPaymentTermsClick(Sender: TObject);
    procedure btnRepsClick(Sender: TObject);
    procedure btbtnClearAccInfoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    FCustomerCount: integer;
    FOK: boolean;
    FDetailsChanged: boolean;
    procedure SetCustomerCount(const Value: integer);
    procedure SetOK(const Value: boolean);
    procedure SetDetailsChanged(const Value: boolean);
    { Private declarations }
  public
    dtmdlOneCustomer: TdtmdlCustomers;
    property CustomerCount: integer read FCustomerCount write SetCustomerCount;
    property DetailsChanged: boolean read FDetailsChanged write SetDetailsChanged;
    property OK: boolean read FOK write SetOK;
  end;

var
  PBMaintCustMultiFrm: TPBMaintCustMultiFrm;

implementation

uses UITypes, PBLUVATCode, PBMaintGroups, PBLURevenueLoc, PBLUPaymentTerms, PBLURep,
  PBLULevelOfImportance, pbDatabase, PBLUAccountManager, PBLUOps;

{$R *.dfm}

{ TPBMaintCustMultiFrm }

procedure TPBMaintCustMultiFrm.SetCustomerCount(const Value: integer);
begin
  FCustomerCount := Value;
end;

procedure TPBMaintCustMultiFrm.SetOK(const Value: boolean);
begin
  FOK := Value;
end;

procedure TPBMaintCustMultiFrm.FormActivate(Sender: TObject);
var
  icount: integer;
begin
  self.Caption := 'Changing ' + IntToStr(CustomerCount) + ' customers';

  {Clear the To fields}
  for icount := 0 to pred(ComponentCount) do
    begin
    if Components[icount] is TEdit then
      begin
        if TEdit(Components[icount]).tag = 1 then
          TEdit(Components[icount]).text := '';
      end;
    if Components[icount] is TDBLookupComboBox then
      begin
        if TDBLookupComboBox(Components[icount]).tag = 1 then
          TDBLookupComboBox(Components[icount]).keyvalue := null;
      end;
    end;

  {Set the datasources of the lookups}
  dblkpPaymentTerms.listsource := dtmdlOneCustomer.dtsTerms;
  dblkpVatRate.listsource := dtmdlOneCustomer.VATSRC;
  dblkpType.listsource := dtmdlOneCustomer.TypesSRC;
  dblkpStatus.listsource := dtmdlOneCustomer.StatusDataSource;
  dblkpRevenueCentre.listsource := dtmdlOneCustomer.dtsRevenueCentre;
  dblkpRep.listsource := dtmdlOneCustomer.dtsReps;
  dblkpSecondaryRep.listsource := dtmdlOneCustomer.dtsReps;
  dblkpAccManager.listsource := dtmdlOneCustomer.dtsOperators;
  dblkpImportance.listsource := dtmdlOneCustomer.dtsGetImportance;

  {Re-activate the lookup SQLs}
  dtmdlOneCustomer.qryRevenueCentre.active := false;
  dtmdlOneCustomer.qryRevenueCentre.active := true;
  dtmdlOneCustomer.qryTerms.active := false;
  dtmdlOneCustomer.qryTerms.active := true;
  dtmdlOneCustomer.GetTypesSQL.Active := False;
  dtmdlOneCustomer.GetTypesSQL.Active := True;
  dtmdlOneCustomer.GetStatusSQL.Active := False;
  dtmdlOneCustomer.GetStatusSQL.Active := True;
  dtmdlOneCustomer.GetVATSQL.Active := False;
  dtmdlOneCustomer.GetVATSQL.Active := True;
  dtmdlOneCustomer.qryReps.Active := False;
  dtmdlOneCustomer.qryReps.Active := True;

  dtmdlOneCustomer.qryOperators.Active := False;
  dtmdlOneCustomer.qryOperators.Active := True;

  dtmdlOneCustomer.qryGetImportance.Active := False;
  dtmdlOneCustomer.qryGetImportance.Active := True;

  DetailsChanged := False ;
  OK := False;
end;

procedure TPBMaintCustMultiFrm.SetDetailsChanged(const Value: boolean);
begin
  FDetailsChanged := Value;
end;

procedure TPBMaintCustMultiFrm.OKBitBtnClick(Sender: TObject);
begin
  if ((dblkpRep.KeyValue = dblkpSecondaryRep.keyvalue) and ((dblkpRep.text <> '') and (dblkpSecondaryRep.text <> ''))) then
    begin
      MessageDlg('You cannot select the same primary and secondary rep', mtError, [mbAbort], 0);
      exit;
    end;

  OK := true;
  close;
end;

procedure TPBMaintCustMultiFrm.CheckOK(Sender: TObject);
begin
  {Check if anything has changed} ;
  OKBitBtn.Enabled := (edtTownTo.Text <> '')  or
                      (edtCountyTo.Text <> '') or
                      (edtAnalysisTo1.Text <> '') or
                      (edtAnalysisTo2.Text <> '') or
                      (edtAnalysisTo3.Text <> '') or
                      (edtAnalysisTo4.Text <> '') or
                      (dblkpAccManager.Text <> '') or
                      (dblkpRep.Text <> '') or
                      (dblkpSecondaryRep.Text <> '') or
                      (dblkpVatRate.Text <> '') or
                      (dblkpType.Text <> '') or
                      (dblkpImportance.Text <> '') or
                      (dblkpRevenueCentre.Text <> '') or
                      (dblkpStatus.Text <> '') or
                      (dblkpPaymentTerms.Text <> '') or
                      (chkbxInvUpFrontTo.state <> cbGrayed)  or
                      (chkbxActiveTo.state <> cbGrayed);
end;

procedure TPBMaintCustMultiFrm.FormCreate(Sender: TObject);
var
  sAnalysis: string;
begin
  {set analysis code 1}
  sAnalysis := dmBroker.GetAnalysisCode1;
  if sAnalysis <> '' then
    lblAnalysis1.caption := sAnalysis;

  {set analysis code 2}
  sAnalysis := dmBroker.GetAnalysisCode2;
  if sAnalysis <> '' then
    lblAnalysis2.caption := sAnalysis;

  {set analysis code 3}
  sAnalysis := dmBroker.GetAnalysisCode3;
  if sAnalysis <> '' then
    lblAnalysis3.caption := sAnalysis;

  {set analysis code 4}
  sAnalysis := dmBroker.GetAnalysisCode4;
  if sAnalysis <> '' then
    lblAnalysis4.caption := sAnalysis;

  dtmdlOneCustomer := TdtmdlCustomers.create(self);
end;

procedure TPBMaintCustMultiFrm.btnVatClick(Sender: TObject);
begin
  PBLUVatCodefrm := TPBLUVatCodefrm.Create(self) ;
  try
    PBLUVatCodefrm.bIs_Lookup := False ;
    PBLUVatCodefrm.bAllow_Upd := True ;
    PBLUVatCodefrm.iSelCode := 0 ;
    PBLUVatCodefrm.ShowModal ;
  finally
  PBLUVatCodefrm.Free ;

  end;

  dtmdlOneCustomer.GetVATSQL.Active := False;
  dtmdlOneCustomer.GetVATSQL.Active := True;

end;

procedure TPBMaintCustMultiFrm.btnTypeClick(Sender: TObject);
begin
  PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(self) ;
  try
    PBMaintGroupsFrm.iGroupselect := 1;
    PBMaintGroupsFrm.ShowModal ;
  Finally;
  PBMaintGroupsFrm.Free ;
  end;
  dtmdlOneCustomer.GetTypesSQL.Active := False;
  dtmdlOneCustomer.GetTypesSQL.Active := True;

end;

procedure TPBMaintCustMultiFrm.btnRevCentreClick(Sender: TObject);
begin
  PBLURevenueLocFrm := TPBLURevenuelocFrm.Create(self) ;
  try
    PBLURevenueLocFrm.bIs_Lookup := False ;
    PBLURevenueLocFrm.bAllow_Upd := True ;
    PBLURevenueLocFrm.SelCode := '';
    PBLURevenueLocFrm.ShowModal ;
  Finally;
    PBLURevenueLocFrm.Free ;
  end;

  dtmdlOneCustomer.qryRevenueCentre.Active := False;
  dtmdlOneCustomer.qryRevenueCentre.Active := True;

end;

procedure TPBMaintCustMultiFrm.btnPaymentTermsClick(Sender: TObject);
begin
  PBLUPaymentTermsFrm := TPBLUPaymentTermsFrm.Create(self) ;
  try
    PBLUPaymentTermsFrm.bIs_Lookup := False ;
    PBLUPaymentTermsFrm.bAllow_Upd := True ;
    PBLUPaymentTermsFrm.SelCode := dblkpPaymentTerms.keyvalue ;
    PBLUPaymentTermsFrm.ShowModal ;
  Finally;
    PBLUPaymentTermsFrm.Free ;
  end;

  dtmdlOneCustomer.qryTerms.Active := False;
  dtmdlOneCustomer.qryTerms.Active := True;
end;

procedure TPBMaintCustMultiFrm.btnRepsClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(self) ;
  try
    PBLURepFrm.bIs_Lookup := False ;
    PBLURepFrm.bAllow_Upd := True ;
    PBLURepFrm.SelCode := 0;
    PBLURepFrm.ShowModal ;
  Finally;
    PBLURepFrm.Free ;
  end;

  dtmdlOneCustomer.qryReps.Active := False;
  dtmdlOneCustomer.qryReps.Active := True;
end;

procedure TPBMaintCustMultiFrm.btbtnClearAccInfoClick(Sender: TObject);
begin
  dblkpRep.KeyValue := null;
end;

procedure TPBMaintCustMultiFrm.BitBtn1Click(Sender: TObject);
begin
  dblkpVatRate.KeyValue := null;

end;

procedure TPBMaintCustMultiFrm.BitBtn2Click(Sender: TObject);
begin
  dblkpType.KeyValue := null;

end;

procedure TPBMaintCustMultiFrm.BitBtn3Click(Sender: TObject);
begin
  dblkpRevenueCentre.KeyValue := null;

end;

procedure TPBMaintCustMultiFrm.BitBtn4Click(Sender: TObject);
begin
  dblkpPaymentTerms.KeyValue := null;
end;

procedure TPBMaintCustMultiFrm.BitBtn5Click(Sender: TObject);
begin
  dblkpStatus.KeyValue := null;
end;

procedure TPBMaintCustMultiFrm.BitBtn6Click(Sender: TObject);
begin
  PBLULevelOfImportanceFrm := TPBLULevelOfImportanceFrm.Create(self) ;
  try
    PBLULevelOfImportanceFrm.ShowModal ;
  Finally;
    PBLULevelOfImportanceFrm.Free ;
  end;
  dtmdlOneCustomer.qryGetImportance.Active := False;
  dtmdlOneCustomer.qryGetImportance.Active := True;
end;

procedure TPBMaintCustMultiFrm.BitBtn7Click(Sender: TObject);
begin
  dblkpImportance.KeyValue := null;

end;

procedure TPBMaintCustMultiFrm.BitBtn11Click(Sender: TObject);
begin
  dblkpSecondaryRep.KeyValue := null;
end;

procedure TPBMaintCustMultiFrm.BitBtn9Click(Sender: TObject);
begin
  dblkpAccManager.KeyValue := null;
end;

procedure TPBMaintCustMultiFrm.BitBtn8Click(Sender: TObject);
begin
  if dmBroker.UseAccountManagers then
    begin
      PBLUOpsFrm := TPBLUOpsFrm.Create(self) ;
      try
        PBLUOpsFrm.bIs_Lookup := False ;
        PBLUOpsFrm.bAllow_Upd := True ;
        PBLUOpsFrm.SelCode := 0;
        PBLUOpsFrm.ShowModal ;
      Finally;
        PBLUOpsFrm.Free ;
      end;
    end
  else
    begin
      PBLUOpsFrm := TPBLUOpsFrm.Create(self) ;
      try
        PBLUOpsFrm.bIs_Lookup := False ;
        PBLUOpsFrm.bAllow_Upd := True ;
        PBLUOpsFrm.SelCode := 0 ;
        PBLUOpsFrm.ShowModal ;
      Finally;
        PBLUOpsFrm.Free ;
      end;
    end ;
    
  dtmdlOneCustomer.qryOperators.Active := False;
  dtmdlOneCustomer.qryOperators.Active := True;
end;

end.
