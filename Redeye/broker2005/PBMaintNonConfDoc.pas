unit PBMaintNonConfDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB, PBJobBagDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintNonConfDocFrm = class(TForm)
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
    pnlJobBag: TPanel;
    labJobBagInfo: TLabel;
    edtJobBag: TEdit;
    Label25: TLabel;
    edtStartDate: TEdit;
    Label3: TLabel;
    edtDateReq: TEdit;
    Label2: TLabel;
    edtCustomer: TEdit;
    Label1: TLabel;
    edtRep: TEdit;
    edtAccountManager: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    edtDescription: TEdit;
    qryGetNonConform: TFDQuery;
    qryGetJobBag: TFDQuery;
    qryGetLastNC: TFDQuery;
    qryUpdateLastNC: TFDQuery;
    qryUpdate: TFDQuery;
    qryDelete: TFDQuery;
    qryAdd: TFDQuery;
    pnlNotes: TPanel;
    pnlQASignOff: TPanel;
    Label14: TLabel;
    Label6: TLabel;
    memTotalCost: TMemo;
    memCosttoClient: TMemo;
    pnlNCAHead: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtRaisedBy: TEdit;
    BitBtn2: TBitBtn;
    dblkpRaisedByDept: TDBLookupComboBox;
    dblkpSourceDept: TDBLookupComboBox;
    dblkpNCType: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    edtDateRaised: TEdit;
    btnDateRaised: TBitBtn;
    stsbrDetails: TStatusBar;
    pnlNCADetails: TPanel;
    Panel5: TPanel;
    memDetails: TMemo;
    pnlResponse: TPanel;
    Panel6: TPanel;
    memResponse: TMemo;
    pnlAction: TPanel;
    pnlActionLabel: TPanel;
    memAction: TRichEdit;
    pnlPrevent: TPanel;
    Panel3: TPanel;
    memPrevent: TRichEdit;
    pnlPO: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtPurchaseOrder: TEdit;
    edtPOStartDate: TEdit;
    edtPODateReq: TEdit;
    edtPOCustomer: TEdit;
    edtPORep: TEdit;
    edtPOAccountManager: TEdit;
    edtPODescription: TEdit;
    qryGetPO: TFDQuery;
    rdgrpJobRePrinted: TRadioGroup;
    rdgrpSamples: TRadioGroup;
    Label12: TLabel;
    dblkpQAOperator: TDBLookupComboBox;
    BitBtn4: TBitBtn;
    btnClear: TBitBtn;
    Label13: TLabel;
    edtQASignOff: TEdit;
    btnDate: TBitBtn;
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
    procedure btnDateClick(Sender: TObject);
    procedure edtQASignOffExit(Sender: TObject);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney3DP(Sender: TObject);
    procedure edtJobBagExit(Sender: TObject);
    procedure edtJobBagKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnDateRaisedClick(Sender: TObject);
    procedure edtDateRaisedExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dblkpQAOperatorClick(Sender: TObject);
    procedure edtPurchaseOrderExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    FActivated: boolean;
    FOldValue: string;
    iOperator, iNarrative, iResponse, iPreventative, iCorrective, iStatus: integer;
    dtResponse, dtCorrective, dtPreventative: TDateTime;
    FMode: TjbncMode;
    procedure ShowDetails;
    procedure SetMode(const Value: TjbncMode);
    function GetNarrative(const iNarrative: integer): string;
    function GetNextJBNonConformNo: integer;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    function GetNonConformStatus: integer;
    { Private declarations }
  public
    bJobBagType: boolean;
    iCode: integer;
    property Mode: TjbncMode read FMode write SetMode;
  end;

var
  PBMaintNonConfDocFrm: TPBMaintNonConfDocFrm;

implementation

uses PBLUOps, PBLUNonConformType, PBLUNonConformDept, CCSCommon, DateSelV5, PBNarrativeDM,
  pbDatabase, pbMainMenu, PBLUNonConformCat;

{$R *.dfm}

{ TPBMaintNonConfDocFrm }

procedure TPBMaintNonConfDocFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
    if Mode = jbncAdd then
      Caption := 'Add non conformance details';
    if Mode = jbncChange then
      Caption := 'Change non conformance details ';
    if Mode = jbncdelete then
      Caption := 'Delete non conformance details ';

    ShowDetails;

    DelLabel.Visible := (Mode = jbncDelete);
    pnlJobBag.enabled := (Mode <> jbncDelete);
    pnlNCAHead.Enabled := (Mode <> jbncDelete);
    memdetails.Enabled := (Mode <> jbncDelete);
    memResponse.Enabled := (Mode <> jbncDelete);
    memAction.Enabled := (Mode <> jbncDelete);
    pnlQAsignOff.Enabled := (Mode <> jbncDelete);

    btnOK.Visible := not(Mode = jbncView);

    CheckOK(Self);
    FActivated := true;
    end;
end;

procedure TPBMaintNonConfDocFrm.BitBtn2Click(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.create(self);
  try
    PBLUOpsFrm.bIs_Lookup := true;
    PBLUOpsFrm.bAllow_Upd := false;
    PBLUOpsFrm.showmodal;
    if PBLUOpsFrm.Selected then
      begin
        iOperator := PBLUOpsFrm.SelCode;
        edtRaisedby.Text := PBLUOpsFrm.SelName;
      end;
  finally
    PBLUOpsFrm.free;
    checkOK(self);
  end;
end;

procedure TPBMaintNonConfDocFrm.ShowDetails;
begin
  if Mode = jbncAdd then
    begin
      with qryQAOperator do
      begin
        close;
        parambyname('QA_Operator').asinteger := 0;
        open;
      end;

      with qryNCType do
      begin
        close;
        parambyname('Non_Conform_Type').asinteger := 0;
        open;
      end;

      with qryRaisingDept do
      begin
        close;
        parambyname('Non_Conform_Dept').asinteger := 0;
        open;
      end;

      with qryCategory do
      begin
        close;
        parambyname('Non_Conform_Category').asinteger := 0;
        open;
      end;

      with qrySourceDept do
      begin
        close;
        parambyname('Non_Conform_Dept').asinteger := 0;
        open;
      end;

      iStatus := 10;
      iNarrative := 0;
      iResponse := 0;
      iCorrective := 0;
      iPreventative := 0;
      edtJobBag.Text := '';
      edtStartdate.text := '';
      edtDateReq.Text := '';
      edtCustomer.text := '';
      edtRep.Text := '';
      edtAccountManager.text := '';
      edtDescription.Text := '';

      edtDateRaised.text := pbdatestr(now);
      dblkpNCType.keyvalue := 0;
      edtRaisedBy.text := '';
      dblkpCategory.keyvalue := 0;
      dblkpRaisedByDept.keyvalue := 0;
      dblkpSourceDept.keyvalue := 0;
      dblkpQAOperator.keyvalue := 0;
      edtQASignOff.text := '';
      memTotalCost.text := '0.00';
      memCosttoClient.text := '0.00';
      memDetails.lines.clear;
      memResponse.lines.clear;
      memAction.lines.clear;
      memPrevent.lines.clear;
    end
  else
    begin
      with qryGetNonConform do
        begin
          close;
          parambyname('Job_Bag_Non_Conform').asinteger := iCode;
          open;

          qryQAOperator.close;
          qryQAOperator.parambyname('QA_Operator').asinteger := fieldbyname('QA_Operator').asinteger;
          qryQAOperator.open;

          qryNCType.close;
          qryNCType.parambyname('Non_Conform_Type').asinteger := fieldbyname('Non_conform_Type').asinteger;
          qryNCType.open;

          qryRaisingDept.close;
          qryRaisingDept.parambyname('Non_Conform_Dept').asinteger := fieldbyname('Raised_By_Dept').asinteger;
          qryRaisingDept.open;

          qryCategory.close;
          qryCategory.parambyname('Non_Conform_Category').asinteger := fieldbyname('Non_Conform_Category').asinteger;
          qryCategory.open;

          qrySourceDept.close;
          qrySourceDept.parambyname('Non_Conform_Dept').asinteger := fieldbyname('Non_Conform_Dept').asinteger;
          qrySourceDept.open;

          iStatus := fieldbyname('Non_Conform_Status').asinteger;
          edtJobBag.Text := fieldbyname('Job_Bag').asstring;
          edtStartdate.text := pbDateStr(fieldbyname('Date_Start').asdatetime);
          edtDateReq.Text := pbDateStr(fieldbyname('Goods_Required').asdatetime);
          edtCustomer.text := fieldbyname('Customer_Name').asstring;
          edtRep.Text := fieldbyname('Rep_Name').asstring;
          edtAccountManager.text := fieldbyname('Account_Manager').asstring;
          edtDescription.Text := fieldbyname('Job_Bag_Descr').asstring;

          edtPurchaseOrder.Text := fieldbyname('Purchase_Order').asstring;
          edtPOStartdate.text := pbDateStr(fieldbyname('Date_Start').asdatetime);
          edtPODateReq.Text := pbDateStr(fieldbyname('PO_Goods_Required').asdatetime);
          edtPOCustomer.text := fieldbyname('Customer_Name').asstring;
          edtPORep.Text := fieldbyname('Rep_Name').asstring;
          edtPOAccountManager.text := fieldbyname('Account_Manager').asstring;
          edtPODescription.Text := fieldbyname('Customers_Desc').asstring;

          iNarrative := fieldbyname('Non_Conform_Notes').asinteger;
          iResponse := fieldbyname('Response_Notes_id').asinteger;
          iCorrective := fieldbyname('Corrective_Notes_id').asinteger;
          iPreventative := fieldbyname('Preventative_Notes_id').asinteger;
          edtDateRaised.text := pbDateStr(fieldbyname('Date_Point').asdatetime);
          dblkpNCType.keyvalue := fieldbyname('Non_Conform_Type').asinteger;
          edtRaisedBy.text := fieldbyname('Operator_Name').asstring;
          dblkpCategory.keyvalue := fieldbyname('Non_Conform_Category').asinteger;
          dblkpRaisedByDept.keyvalue := fieldbyname('Raised_By_Dept').asinteger;
          dblkpSourceDept.keyvalue := fieldbyname('Non_Conform_Dept').asinteger;
          dblkpQAOperator.keyvalue := fieldbyname('QA_Operator').asinteger;
          edtQASignOff.text := pbdatestr(fieldbyname('QA_Sign_Off_Date').asdatetime);
          memTotalCost.text := formatfloat('0.00',fieldbyname('Total_Cost').asfloat);
          memCosttoClient.text := formatfloat('0.00',fieldbyname('Total_Cost_to_Client').asfloat);
          memDetails.text := GetNarrative(fieldbyname('Non_Conform_Notes').asinteger);
          memResponse.Text := GetNarrative(fieldbyname('Response_Notes_id').asinteger);
//          memResponse.Text := fieldbyname('Response_Notes').asstring;
//          memAction.Text := fieldbyname('Corrective_Notes').asstring;
          if iCorrective = 0 then
            memAction.Text := fieldbyname('Corrective_Notes').asstring
          else
            memAction.Text := GetNarrative(fieldbyname('Corrective_Notes_id').asinteger);
          memPrevent.Text := GetNarrative(fieldbyname('Preventative_Notes_id').asinteger);
          dtResponse := fieldbyname('Response_Date').asdatetime;
          dtCorrective := fieldbyname('Corrective_Date').asdatetime;
          dtPreventative := fieldbyname('Preventative_Date').asdatetime;

          if fieldbyname('Job_Reprinted').asstring = 'Y' then
            rdgrpJobReprinted.ItemIndex := 0
          else
          if fieldbyname('Job_Reprinted').asstring = 'N' then
            rdgrpJobReprinted.ItemIndex := 1
          else
            rdgrpJobReprinted.ItemIndex := 2;

          if fieldbyname('Samples_Available').asstring = 'Y' then
            rdgrpSamples.ItemIndex := 0
          else
          if fieldbyname('Samples_Available').asstring = 'N' then
            rdgrpSamples.ItemIndex := 1
          else
            rdgrpSamples.ItemIndex := 2;

          if Mode = jbncChange then
            Caption := 'Change non conformance details: '+ fieldbyname('Job_Bag_Non_Conform').asstring;
          if Mode = jbncdelete then
            Caption := 'Delete non conformance details: '+ fieldbyname('Job_Bag_Non_Conform').asstring;
        end;
    end;
  CheckOk(self);
end;

function TPBMaintNonConfDocFrm.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TPBMaintNonConfDocFrm.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

procedure TPBMaintNonConfDocFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  btnOK.Enabled := (Trim(edtRaisedBy.Text) <> '') and
    (dblkpNCType.Text <> '') and
    (dblkpRaisedByDept.Text <> '') and
    (dblkpSourceDept.Text <> '') and
    ((trim(edtJobBag.Text) <> '') or (trim(edtPurchaseOrder.Text) <> '')) and
    (trim(edtDateRaised.Text) <> '') and
    (Trim(memDetails.Text) <> '');
end;

procedure TPBMaintNonConfDocFrm.BitBtn1Click(Sender: TObject);
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

procedure TPBMaintNonConfDocFrm.BitBtn3Click(Sender: TObject);
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

procedure TPBMaintNonConfDocFrm.btnOKClick(Sender: TObject);
var
  iTempNarr: integer;
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

  if Mode = jbncAdd then
  begin
    iCode := GetNextJBNonConformNo;
    with qryAdd do
    begin
      Close;
      parambyname('Job_Bag_Non_Conform').asinteger := iCode;
      if trim(edtJobBag.text) = '' then
        parambyname('Job_Bag').clear
      else
        parambyname('Job_Bag').asinteger := strtoint(trim(edtJobBag.text));

      if trim(edtPurchaseOrder.text) = '' then
        begin
          parambyname('Purchase_order').clear;
          parambyname('Line').clear;
        end
      else
        begin
          parambyname('Purchase_order').asfloat := StrToFloatDef(trim(edtPurchaseOrder.text), 0, FormatSettings);
          parambyname('Line').asinteger := 1;
        end;

      parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
      parambyname('Date_Point').asdatetime := pbdatestr(edtDateRaised.text);
      if dblkpCategory.KeyValue = 0 then
        parambyname('Non_Conform_Category').clear
      else
        parambyname('Non_Conform_Category').asinteger := dblkpCategory.KeyValue;
      parambyname('Non_Conform_Type').asinteger := dblkpNCType.KeyValue;
      parambyname('Raised_by_Dept').asinteger := dblkpRaisedbyDept.KeyValue;
      parambyname('Non_Conform_Dept').asinteger := dblkpSourceDept.KeyValue;
      parambyname('Non_Conform_Notes').asinteger := 0;
//      parambyname('Corrective_Notes').asstring := memAction.text;
      if dblkpQAOperator.KeyValue = 0 then
        parambyname('QA_Operator').clear
      else
        parambyname('QA_Operator').asinteger := dblkpQAOperator.KeyValue;
      parambyname('QA_Sign_Off_Date').asdatetime := pbdatestr(edtQASignOff.text);
      parambyname('Total_Cost').asfloat := StrToFloatDef(memTotalCost.Text, 0, FormatSettings);
      parambyname('Total_Cost_to_Client').asfloat := StrToFloatDef(memCosttoClient.Text, 0, FormatSettings);

      iTempNarr := iNarrative;
      SaveNarrative(iTempNarr,memDetails.text);
      iNarrative := iTempNarr;
      if iNarrative = 0 then
        ParamByName('Non_Conform_Notes').clear
      else
        ParamByName('Non_Conform_Notes').Asinteger := iNarrative;

      iTempNarr := iResponse;
      SaveNarrative(iTempNarr,memResponse.text);
      iResponse := iTempNarr;
      if iResponse = 0 then
        ParamByName('Response_Notes_id').clear
      else
        ParamByName('Response_Notes_id').Asinteger := iResponse;

      iTempNarr := iCorrective;
      SaveNarrative(iTempNarr,memAction.text);
      iCorrective := iTempNarr;
      if iCorrective = 0 then
        ParamByName('Corrective_Notes_id').clear
      else
        ParamByName('Corrective_Notes_id').Asinteger := iCorrective;

      iTempNarr := iPreventative;
      SaveNarrative(iTempNarr,memPrevent.text);
      iPreventative := iTempNarr;
      if iPreventative = 0 then
        ParamByName('Preventative_Notes_id').clear
      else
        ParamByName('Preventative_Notes_id').Asinteger := iPreventative;

      {Set the response date}
      if (dtResponse = 0) and (iResponse <> 0) then
        Parambyname('Response_Date').asdatetime := now
      else
        begin
          if dtResponse = 0 then
            Parambyname('Response_Date').clear
          else
            Parambyname('Response_Date').asdatetime := dtResponse;
        end;

      {Set the corrective date}
      if (dtCorrective = 0) and (iCorrective <> 0) then
        Parambyname('Corrective_Date').asdatetime := now
      else
        begin
          if dtCorrective = 0 then
            Parambyname('Corrective_Date').clear
          else
            Parambyname('Corrective_Date').asdatetime := dtCorrective;
        end;

      {Set the preventative date}
      if (dtPreventative = 0) and (iPreventative <> 0) then
        Parambyname('Preventative_Date').asdatetime := now
      else
        begin
          if dtPreventative = 0 then
            Parambyname('Preventative_Date').clear
          else
            Parambyname('Preventative_Date').asdatetime := dtPreventative;
        end;

      case rdgrpJobReprinted.itemindex of
        0: parambyname('Job_Reprinted').AsString := 'Y';
        1: parambyname('Job_Reprinted').asstring := 'N'
      else
        parambyname('Job_Reprinted').asstring := 'X';
      end;

      case rdgrpSamples.itemindex of
        0: parambyname('Samples_Available').AsString := 'Y';
        1: parambyname('Samples_Available').asstring := 'N'
      else
        parambyname('Samples_Available').asstring := 'X';
      end;

      ParamByName('Non_Conform_Status').Asinteger := 10;
      ExecSQL;
    end;
  end;
  if Mode = jbncChange then
  begin
    with qryUpdate do
    begin
      Close;
      parambyname('Job_Bag_Non_Conform').asinteger := iCode;

      if trim(edtJobBag.text) = '' then
        parambyname('Job_Bag').clear
      else
        parambyname('Job_Bag').asinteger := strtoint(trim(edtJobBag.text));

      if trim(edtPurchaseOrder.text) = '' then
        begin
          parambyname('Purchase_order').clear;
          parambyname('Line').clear;
        end
      else
        begin
          parambyname('Purchase_order').asfloat := StrToFloatDef(trim(edtPurchaseOrder.text), 0, FormatSettings);
          parambyname('Line').asinteger := 1;
        end;

      parambyname('Date_Point').asdatetime := pbdatestr(edtDateraised.text);
      if dblkpCategory.KeyValue = 0 then
        parambyname('Non_Conform_Category').clear
      else
        parambyname('Non_Conform_Category').asinteger := dblkpCategory.KeyValue;
      parambyname('Non_Conform_Type').asinteger := dblkpNCType.KeyValue;
      parambyname('Raised_by_Dept').asinteger := dblkpRaisedbyDept.KeyValue;
      parambyname('Non_Conform_Dept').asinteger := dblkpSourceDept.KeyValue;
      parambyname('Non_Conform_Notes').asinteger := 0;
//      parambyname('Response_Notes').asstring := memResponse.text;
//      parambyname('Corrective_Notes').asstring := memAction.text;
      if dblkpQAOperator.KeyValue = 0 then
        parambyname('QA_Operator').clear
      else
        parambyname('QA_Operator').asinteger := dblkpQAOperator.KeyValue;
      parambyname('QA_Sign_Off_Date').asdatetime := pbdatestr(edtQASignOff.text);
      parambyname('Total_Cost').asfloat := StrToFloatDef(memTotalCost.Text, 0, FormatSettings);
      parambyname('Total_Cost_to_Client').asfloat := StrToFloatDef(memCosttoClient.Text, 0, FormatSettings);

      iTempNarr := iNarrative;
      SaveNarrative(iTempNarr,memDetails.text);
      iNarrative := iTempNarr;
      if iNarrative = 0 then
        ParamByName('Non_Conform_Notes').clear
      else
        ParamByName('Non_Conform_Notes').Asinteger := iNarrative;

      if dblkpQAOperator.KeyValue = 0 then
        parambyname('QA_Operator').clear
      else
        parambyname('QA_Operator').asinteger := dblkpQAOperator.KeyValue;
      parambyname('QA_Sign_Off_Date').asdatetime := pbdatestr(edtQASignOff.text);
      parambyname('Total_Cost').asfloat := StrToFloatDef(memTotalCost.Text, 0, FormatSettings);
      parambyname('Total_Cost_to_Client').asfloat := StrToFloatDef(memCosttoClient.Text, 0, FormatSettings);

      iTempNarr := iNarrative;
      SaveNarrative(iTempNarr,memDetails.text);
      iNarrative := iTempNarr;
      if iNarrative = 0 then
        ParamByName('Non_Conform_Notes').clear
      else
        ParamByName('Non_Conform_Notes').Asinteger := iNarrative;

      iTempNarr := iResponse;
      SaveNarrative(iTempNarr,memResponse.text);
      iResponse := iTempNarr;
      if iResponse = 0 then
        ParamByName('Response_Notes_id').clear
      else
        ParamByName('Response_Notes_id').Asinteger := iResponse;

      iTempNarr := iCorrective;
      SaveNarrative(iTempNarr,memAction.text);
      iCorrective := iTempNarr;
      if iCorrective = 0 then
        ParamByName('Corrective_Notes_id').clear
      else
        ParamByName('Corrective_Notes_id').Asinteger := iCorrective;

      iTempNarr := iPreventative;
      SaveNarrative(iTempNarr,memPrevent.text);
      iPreventative := iTempNarr;
      if iPreventative = 0 then
        ParamByName('Preventative_Notes_id').clear
      else
        ParamByName('Preventative_Notes_id').Asinteger := iPreventative;

      {Set the response date}
      if (dtResponse = 0) and (iResponse <> 0) then
        Parambyname('Response_Date').asdatetime := now
      else
        begin
          if dtResponse = 0 then
            Parambyname('Response_Date').clear
          else
            Parambyname('Response_Date').asdatetime := dtResponse;
        end;

      {Set the corrective date}
      if (dtCorrective = 0) and (iCorrective <> 0) then
        Parambyname('Corrective_Date').asdatetime := now
      else
        begin
          if dtCorrective = 0 then
            Parambyname('Corrective_Date').clear
          else
            Parambyname('Corrective_Date').asdatetime := dtCorrective;
        end;

      {Set the preventative date}
      if (dtPreventative = 0) and (iPreventative <> 0) then
        Parambyname('Preventative_Date').asdatetime := now
      else
        begin
          if dtPreventative = 0 then
            Parambyname('Preventative_Date').clear
          else
            Parambyname('Preventative_Date').asdatetime := dtPreventative;
        end;
      case rdgrpJobReprinted.itemindex of
        0: parambyname('Job_Reprinted').AsString := 'Y';
        1: parambyname('Job_Reprinted').asstring := 'N'
      else
        parambyname('Job_Reprinted').asstring := 'X';
      end;

      case rdgrpSamples.itemindex of
        0: parambyname('Samples_Available').AsString := 'Y';
        1: parambyname('Samples_Available').asstring := 'N'
      else
        parambyname('Samples_Available').asstring := 'X';
      end;

      ParamByName('Non_Conform_Status').Asinteger := GetNonConformStatus;
      ExecSQL;
    end;
  end;
  if Mode = jbncDelete then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with qryDelete do
      begin
        Close;
        ParamByName('Job_Bag_Non_Conform').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
  ModalResult := mrOK;
end;

function TPBMaintNonConfDocFrm.GetNonConformStatus: integer;
begin
  if dblkpQAOperator.keyvalue <> 0 then
    result := 50
  else
  if trim(memAction.text) <> '' then
    result := 30
  else
  if trim(memResponse.text) <> '' then
    result := 20
  else
    result := 10;
end;

procedure TPBMaintNonConfDocFrm.memDetailsChange(Sender: TObject);
begin
  checkok(self);
end;

procedure TPBMaintNonConfDocFrm.btnDateClick(Sender: TObject);
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

procedure TPBMaintNonConfDocFrm.edtQASignOffExit(Sender: TObject);
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

procedure TPBMaintNonConfDocFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintNonConfDocFrm.ValidateMoney3DP(Sender: TObject);
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

procedure TPBMaintNonConfDocFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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

procedure TPBMaintNonConfDocFrm.SetMode(const Value: TjbncMode);
begin
  FMode := Value;
end;

procedure TPBMaintNonConfDocFrm.edtJobBagExit(Sender: TObject);
begin
  if btnCancel.focused or btnOK.focused then
    begin
      exit;
    end;

  if (trim(edtJobBag.text) = '') then
    exit;

  try
    with qryGetJobBag do
    begin
      close;
      parambyname('Job_bag').asinteger := strtoint(edtJobBag.text);
      open;
      if recordcount = 0 then
        begin
          messagedlg('Job number doesn''t exist', mtError, [mbOk], 0);
          edtJobBag.SetFocus;
          exit;
        end
      else
        begin
          edtCustomer.Text := fieldbyname('Customer_Name').asstring;
          edtDescription.Text := fieldbyname('Job_bag_Descr').asstring;
          edtStartDate.Text := pbDateStr(fieldbyname('Date_Start').asdatetime);
          edtDateReq.Text := pbDateStr(fieldbyname('Goods_Required').asdatetime);
          edtAccountManager.Text := fieldbyname('Account_Manager').asstring;
          edtRep.Text := fieldbyname('Rep_Name').asstring;
        end;
    end;
  except
  end;
  checkok(self);
end;

procedure TPBMaintNonConfDocFrm.edtJobBagKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      Key := #0; { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
    end;
end;

function TPBMaintNonConfDocFrm.GetNextJBNonConformNo: integer;
begin
  dmBroker.LockCompanyRecord;
  try
    try
      with qryGetLastNC do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Non_Conform_Number').AsInteger + 1;
        Close;
      end;
      with qryUpdateLastNC do
      begin
        ParamByName('Last_Non_Conform_Number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Non Conformance number:' + #13 + E.Message);
    end;
    end;
  finally
    dmBroker.FreeCompanyRecord;
  end;
end;

procedure TPBMaintNonConfDocFrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if (ActiveControl is TMemo) then
        begin
          exit
        end
      else
        begin
          Key := #0; { eat enter key }
          Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
        end;
    end;
end;

procedure TPBMaintNonConfDocFrm.btnDateRaisedClick(Sender: TObject);
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

procedure TPBMaintNonConfDocFrm.edtDateRaisedExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDateRaised.Text = '' then
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

procedure TPBMaintNonConfDocFrm.FormCreate(Sender: TObject);
begin
  pnlJobBag.Visible := dmBroker.UseJobBags;
  pnlPO.Visible := not pnlJobBag.Visible;

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintNonConfDocFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintNonConfDocFrm.FormResize(Sender: TObject);
begin
  self.pnlNCADetails.height := trunc((self.pnlNotes.height/4));
  self.pnlAction.height := trunc((self.pnlNotes.height/4));
  self.pnlPrevent.height := trunc((self.pnlNotes.height/4));
end;

procedure TPBMaintNonConfDocFrm.btnClearClick(Sender: TObject);
begin
  dblkpQAOperator.keyvalue := 0;
end;

procedure TPBMaintNonConfDocFrm.dblkpQAOperatorClick(Sender: TObject);
begin
  if edtQASignOff.Text = '' then
    edtQAsignOff.Text := pbdatestr(date);
end;

procedure TPBMaintNonConfDocFrm.edtPurchaseOrderExit(Sender: TObject);
begin
  if btnCancel.focused or btnOK.focused then
    begin
      exit;
    end;

  if (trim(edtPurchaseOrder.text) = '') then
    exit;

  try
    with qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asinteger := strtoint(edtPurchaseOrder.text);
      open;
      if recordcount = 0 then
        begin
          messagedlg('Order doesn''t exist', mtError, [mbOk], 0);
          edtPurchaseOrder.SetFocus;
          exit;
        end
      else
        begin
          edtPOCustomer.Text := fieldbyname('Customer_Name').asstring;
          edtPODescription.Text := fieldbyname('Customers_Desc').asstring;
          edtPOStartDate.Text := pbDateStr(fieldbyname('Date_Point').asdatetime);
          edtPODateReq.Text := pbDateStr(fieldbyname('Goods_Required').asdatetime);
          edtPOAccountManager.Text := fieldbyname('Account_Manager').asstring;
          edtPORep.Text := fieldbyname('Rep_Name').asstring;
        end;
    end;
  except
  end;
  checkok(self);
end;

procedure TPBMaintNonConfDocFrm.BitBtn5Click(Sender: TObject);
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
