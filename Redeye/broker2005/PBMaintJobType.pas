unit PBMaintJobType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobTypeFrm = class(TForm)
    grpbxDetails: TGroupBox;
    lblDelete: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    lblDescription: TLabel;
    edtDescription: TEdit;
    qryInsJobType: TFDQuery;
    qryUpdJobType: TFDQuery;
    qryDelJobType: TFDQuery;
    qrySelNextJobType: TFDQuery;
    chkbxOneDelivery: TCheckBox;
    chkbxDeliverToStock: TCheckBox;
    chkbxRepCanConvert: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
  private
    function getNextJobType():integer;
  public
    sFuncMode: string[1];
    SelCode: integer;
  end;

var
  PBMaintJobTypeFrm: TPBMaintJobTypeFrm;

implementation

uses PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintJobTypeFrm.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
    Caption := 'Add a new Job Type';
  if sFuncMode = 'C' then
    Caption := 'Change a Job Type';
  if sFuncMode = 'D' then
    Caption := 'Delete a Job Type';

  {Enable or disable the buttons}
  grpbxDetails.Enabled := (sFuncMode <> 'D');
  lblDelete.Visible := (sFuncMode = 'D');
  dmBroker.ScreenAccessControl(Self,'mnuJobTypes',frmPBMainMenu.iOperator,0,0) ;
end;

function TPBMaintJobTypeFrm.getNextJobType: integer;
begin
  with Self.qrySelNextJobType do
  begin
    Close;
    Open;
    Result := FieldByName('Last_job_type_No').asInteger + 1;
    Close;
  end;
end;

procedure TPBMaintJobTypeFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode = 'A' then
  begin
    with Self.qryInsJobType do
    begin
      SelCode := GetNextJobType();
      ParamByName('job_type').asInteger := SelCode;
      ParamByName('Job_Type_Description').asString := edtDescription.Text;

      if self.chkbxOneDelivery.Checked then
        ParamByName('One_Delivery_only').asString := 'Y'
      else
        ParamByName('One_Delivery_only').asString := 'N';

      if self.chkbxDeliverToStock.Checked then
        ParamByName('Can_Deliver_to_Stock').asString := 'Y'
      else
        ParamByName('Can_Deliver_to_Stock').asString := 'N';

      if self.chkbxRepCanConvert.Checked then
        ParamByName('Rep_Can_Convert_Enquiry').asString := 'Y'
      else
        ParamByName('Rep_Can_Convert_Enquiry').asString := 'N';

      ExecSQL;
    end;
  end
  else if SFuncMode = 'C' then
  begin
    with Self.qryUpdJobType do
    begin
      ParamByName('job_type').asInteger := SelCode;
      ParamByName('Job_Type_Description').asString := edtDescription.Text;

      if self.chkbxOneDelivery.Checked then
        ParamByName('One_Delivery_only').asString := 'Y'
      else
        ParamByName('One_Delivery_only').asString := 'N';

      if self.chkbxDeliverToStock.Checked then
        ParamByName('Can_Deliver_to_Stock').asString := 'Y'
      else
        ParamByName('Can_Deliver_to_Stock').asString := 'N';

      if self.chkbxRepCanConvert.Checked then
        ParamByName('Rep_Can_Convert_Enquiry').asString := 'Y'
      else
        ParamByName('Rep_Can_Convert_Enquiry').asString := 'N';
      
      ExecSQL;
    end;
  end
  else
  begin
    with Self.qryDelJobType do
    begin
      ParamByName('job_type').asInteger := SelCode;
      ExecSQL;
    end;
  end;
end;

procedure TPBMaintJobTypeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtDescription.Text <> '');
end;

end.
