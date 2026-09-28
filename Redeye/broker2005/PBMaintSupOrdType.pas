unit PBMaintSupOrdType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSupOrdTypeFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    SuppNameEdit: TEdit;
    GetBranchNameSQL: TFDQuery;
    Label6: TLabel;
    OrdTypeEdit: TEdit;
    DescriptionEdit: TEdit;
    Label8: TLabel;
    GetOrderTypesSQL: TFDQuery;
    CheckOrderTypeSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OrdTypeEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure DescriptionEditChange(Sender: TObject);
  private
  public
    sFuncMode: string[1];
    iSupp: Integer;
    sCode, sSuppName, sBranchName: string;
  end;

var
  PBMaintSupOrdTypeFrm: TPBMaintSupOrdTypeFrm;
  sFormRef: string[20];

implementation

uses UITypes, ComObj, ActiveX, PBLUSupOrdType;

{$R *.DFM}

procedure TPBMaintSupOrdTypeFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  GetOrderTypesSQL.Close;
  GetOrderTypesSQL.Open;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Order Type';
  if sFuncMode = 'C' then
    Caption := 'Change a Order Type Description';
  if sFuncMode = 'D' then
    Caption := 'Delete a Order Type';

  OrdTypeEdit.ReadOnly := (sFuncMode = 'C') or
                          (sFuncMode = 'D');
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescriptionEdit.Text := '';
    OrdTypeEdit.Text := '';
  end
  else
  begin
    with PBLUSupOrdTypeFrm.DetsSRC.DataSet do
    begin
      sCode := FieldByName('Supp_Order_type').Asstring;
      DescriptionEdit.Text := Trim(FieldByName('Supp_order_Desc').AsString);
      OrdTypeEdit.Text := Trim(FieldByName('Supp_Order_type').AsString);
    end;
  end;
  SuppNameEdit.Text := sSuppName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if sFuncMode <> 'D' then
    OrdTypeEdit.SetFocus;
end;

procedure TPBMaintSupOrdTypeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (Trim(DescriptionEdit.Text) <> '') and
    (Trim(OrdTypeEdit.Text) <> '');
end;

procedure TPBMaintSupOrdTypeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintSupOrdTypeFrm.DescriptionEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSupOrdTypeFrm.OKBitBtnClick(Sender: TObject);
begin
  sCode := Trim(OrdTypeEdit.Text);
  if sFuncMode[1] in ['A','C'] then
  begin
    with CheckOrderTypeSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Supp_order_type').AsString := sCode + '';
      Open;
      if RecordCount > 0 then
      begin
        if (scode <> fieldbyname('Supp_Order_type').asstring) then
           begin
           MessageDlg('There is already an Order Type for this ' +
           'Supplier', mtConfirmation, [mbOK], 0);
           Exit;
           end;
      end;
    end;

    if sFuncMode = 'A' then
    begin
      with AddSQL do
      begin
        ParamByName('Supplier').AsInteger := iSupp;
        ParamByName('Supp_Order_type').Asstring := sCode + '';
        ParamByName('Supp_Order_Desc').AsString :=
          Trim(DescriptionEdit.Text) + ' ';
        ExecSQL;
      end;
    end
    else
    if sFuncMode = 'C' then
    begin
      with UpdSQL do
      begin
        close;
        ParamByName('Supplier').AsInteger := iSupp;
        ParamByName('Supp_Order_type').Asstring := sCode;
        ParamByName('Supp_Order_Desc').AsString :=
          Trim(DescriptionEdit.Text) + ' ';
        ExecSQL;
      end;
    end;
  end
  else
    if sFuncMode = 'D' then
    begin
      if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
        mbYes], 0) <> mrYes then
      begin
        Close;
        Exit;
      end;
      with DelSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := iSupp;
        ParamByName('Supp_Order_type').Asstring := sCode;
        ExecSQL;
      end;
    end;
  ModalResult := mrOK;
end;

procedure TPBMaintSupOrdTypeFrm.OrdTypeEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

end.
