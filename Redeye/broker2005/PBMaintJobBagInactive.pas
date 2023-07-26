unit PBMaintJobBagInactive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagInactiveFrm = class(TForm)
    Panel2: TPanel;
    btnOK: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    lblJobBag: TLabel;
    lblDescription: TLabel;
    Label2: TLabel;
    lblCustomer: TLabel;
    lblTitle: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    dblkpReason: TDBLookupComboBox;
    BitBtn4: TBitBtn;
    lblDate: TLabel;
    chkbxReactivate: TCheckBox;
    lblOperator: TLabel;
    qryReason: TFDQuery;
    srcReason: TDataSource;
    qryGetDetails: TFDQuery;
    qryUpJobBag: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dblkpReasonClick(Sender: TObject);
  private
    iInactiveOperator: integer;
    procedure SetupDetails;
    procedure GetData;
    procedure EnableOK;
    { Private declarations }
  public
    iJobBag: integer;
  end;

var
  PBMaintJobBagInactiveFrm: TPBMaintJobBagInactiveFrm;

implementation

uses PBLUReasCode, CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TPBMaintJobBagInactiveFrm.FormActivate(Sender: TObject);
begin
  GetData;
  SetupDetails;
end;

procedure TPBMaintJobBagInactiveFrm.SetupDetails;
begin
  with qryGetdetails do
    begin
      close;
      parambyname('Job_Bag').asfloat := iJobBag;
      open;
      if recordcount <> 0 then
        begin
        if fieldbyname('Inactive').asstring = 'Y' then
          begin
            dblkpReason.keyvalue := fieldbyname('Inactive_reason').asinteger;
            chkbxReactivate.visible := true;
            lblDate.caption := 'Date Cancelled: '+PBDateStr(fieldbyname('Inactive_Date').asdatetime);
            lblOperator.caption := 'Cancelled By: ' + fieldbyname('Operator_Name').asstring;
          end
        else
          begin
            chkbxReactivate.visible := false;
            lblDate.caption := 'Date Cancelled: '+PBDateStr(date);
            lblOperator.caption := 'Cancelled By: ' + frmPBMainMenu.sOperator_Name;
          end;

        iInactiveOperator :=  fieldbyname('Inactive_Operator').asinteger
        end;
    end;
  enableOK;
end;

procedure TPBMaintJobBagInactiveFrm.BitBtn4Click(Sender: TObject);
begin
  PBLUReasCodeFrm := TPBLUReasCodeFrm.Create(self) ;
  try
    PBLUReasCodeFrm.bIs_Lookup := False ;
    PBLUReasCodeFrm.bAllow_Upd := True ;
    PBLUReasCodeFrm.SelCode := 0 ;
    PBLUReasCodeFrm.iGroupSelect := 2 ;
    PBLUReasCodeFrm.ShowModal ;
  finally
    PBLUReasCodeFrm.Free ;
  end;
  GetData;
end;

procedure TPBMaintJobBagInactiveFrm.GetData;
begin
  with qryReason do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintJobBagInactiveFrm.EnableOK;
begin
  btnOK.enabled := false;
  if (dblkpReason.keyvalue = 0) or
    (dblkpReason.text = '') then
    exit;
  btnOK.enabled := true;
end;

procedure TPBMaintJobBagInactiveFrm.btnOKClick(Sender: TObject);
begin
  with qryUpJobBag do
    begin
      close;
      parambyname('Job_Bag').asinteger := iJobBag;
      if chkbxReactivate.checked then
        begin
          parambyname('Inactive').asstring := 'N';
          parambyname('Inactive_Reason').clear;
          parambyname('Inactive_Date').clear;
          parambyname('Inactive_Operator').clear;
        end
      else
        begin
          parambyname('Inactive').asstring := 'Y';
          parambyname('Inactive_Reason').asinteger := dblkpReason.keyvalue;
          parambyname('Inactive_Date').asdatetime := date;

          if iInactiveOperator > 0 then
            parambyname('Inactive_Operator').asinteger := iInactiveOperator
          else
            parambyname('Inactive_Operator').asinteger := frmPBMainMenu.iOperator;
        end;
      execsql;
    end;
end;

procedure TPBMaintJobBagInactiveFrm.dblkpReasonClick(Sender: TObject);
begin
  enableok;
end;

end.
