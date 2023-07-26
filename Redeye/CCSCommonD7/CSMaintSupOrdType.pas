(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Order Type.

VSS Info:
$Header: /CCSCommon/CSMaintSupOrdType.pas 1     14/03/:2 9:50 Paul $
$History: CSMaintSupOrdType.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 14/03/:2   Time: 9:50
 * Created in $/CCSCommon
 * Added new units to maintain Supplier file transfer order types
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:01
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 17/02/:0   Time: 11:51
 * Updated in $/PBL D5
 * Changed to correctly check whether the Order Type ID  currently
 * exists
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 3/02/:0    Time: 16:45
 * Updated in $/PBL D5
 * New insert method to ensure unique keys when adding records.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintSupOrdType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintSupOrdTypeFrm = class(TForm)
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
  CSMaintSupOrdTypeFrm: TCSMaintSupOrdTypeFrm;
  sFormRef: string[20];

implementation

uses ComObj, ActiveX, CSLUSupOrdType;

{$R *.DFM}

procedure TCSMaintSupOrdTypeFrm.FormActivate(Sender: TObject);
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
    with CSLUSupOrdTypeFrm.DetsSRC.DataSet do
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

procedure TCSMaintSupOrdTypeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (Trim(DescriptionEdit.Text) <> '') and
    (Trim(OrdTypeEdit.Text) <> '');
end;

procedure TCSMaintSupOrdTypeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintSupOrdTypeFrm.DescriptionEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSupOrdTypeFrm.OKBitBtnClick(Sender: TObject);
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

procedure TCSMaintSupOrdTypeFrm.OrdTypeEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

end.

