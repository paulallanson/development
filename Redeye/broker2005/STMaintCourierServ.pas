unit STMaintCourierServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintCourierServFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edtCourrierName: TEdit;
    edtDescShort: TEdit;
    edtDesc: TEdit;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    edtServiceCode: TEdit;
    lblServiceCode: TLabel;
    qryGetNextServiceNo: TFDQuery;
    chkbxDeferred: TCheckBox;
    chkbxActive: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure edtDescShortChange(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure edtServiceCodeChange(Sender: TObject);
  private
    procedure AddService;
    procedure UpdateService;
    procedure DeleteService;
    function GetNextServiceNo: integer;
    procedure CheckOK;
  public
    sFuncMode: string[1];
    courierName, serviceDesc, serviceDescShort, serviceCode: string;
    courierCode, serviceNo: integer;
    bDeferred: boolean;
  end;

var
  STMaintCourierServFrm: TSTMaintCourierServFrm;

implementation

uses UITypes;
{$R *.DFM}

procedure TSTMaintCourierServFrm.FormShow(Sender: TObject);
begin
  self.edtCourrierName.text := self.courierName;

  if sFuncMode = 'A' then
  begin
    self.edtDescShort.text := '';
    self.edtDesc.text := '';
    self.edtServiceCode.text := '';
    chkbxDeferred.checked := false;
    chkbxactive.checked := true;
    Caption := 'Add a new Courier Service Type';
  end;

  if sFuncMode = 'C' then
  begin
    self.edtDescShort.text := self.serviceDescShort;
    self.edtDesc.text := self.serviceDesc;
    self.edtServiceCode.text := serviceCode;
    chkbxDeferred.checked := bDeferred;
    Caption := 'Change a Courier Service Type';
  end;
  self.CheckOK;

  if sFuncMode = 'D' then
  begin
    self.edtDescShort.text := self.serviceDescShort;
    self.edtDesc.text := self.serviceDesc;
    self.edtServiceCode.text := serviceCode;
    self.edtDescShort.Enabled := false;
    self.edtDesc.Enabled := false;
    chkbxDeferred.checked := bDeferred;
    self.edtServiceCode.Enabled := false;
    Caption := 'Delete a Courier Service Type';
    DelLabel.visible := true;
    OKBitBtn.Enabled := true;
  end;
end;

procedure TSTMaintCourierServFrm.OKBitBtnClick(Sender: TObject);
begin
  if self.sFuncMode = 'A' then
  begin
    self.serviceNo := self.GetNextServiceNo;
    self.addService;
  end
  else if self.sFuncMode = 'C' then
  begin
    self.UpdateService;
  end
  else
  begin
    self.DeleteService;
  end;
  ModalResult := mrOK;
end;

procedure TSTMaintCourierServFrm.AddService;
begin
  with self.AddSQL do
  begin
    ParamByName('courier').asInteger := self.courierCode;
    ParamByName('service_no').asInteger := self.serviceNo;
    ParamByName('service_description').asString := self.serviceDesc;
    ParamByName('service_code').asString := self.serviceCode;
    ParamByName('Service_Short_Description').asString := self.serviceDescShort;
    if chkbxDeferred.Checked then
      ParamByName('Deferred_Service').asString := 'Y'
    else
      ParamByName('Deferred_Service').asString := 'N';

    if chkbxactive.Checked then
      ParamByName('inactive').asString := 'N'
    else
      ParamByName('inactive').asString := 'Y';
    ExecSQL;
  end;
end;

procedure TSTMaintCourierServFrm.DeleteService;
begin
  if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
    mbYes], 0) = mrYes then
  begin
    with self.DelSQL do
    begin
      ParamByName('courier').asInteger := self.courierCode;
      ParamByName('service_no').asInteger := self.serviceNo;

      ExecSQL;
    end;
  end;
end;

procedure TSTMaintCourierServFrm.UpdateService;
begin
  with self.UpdSQL do
  begin
    ParamByName('courier').asInteger := self.courierCode;
    ParamByName('service_no').asInteger := self.serviceNo;
    ParamByName('service_description').asString := self.serviceDesc;
    ParamByName('service_code').asString := self.serviceCode;
    ParamByName('Service_Short_Description').asString := self.serviceDescShort;
    if chkbxDeferred.Checked then
      ParamByName('Deferred_Service').asString := 'Y'
    else
      ParamByName('Deferred_Service').asString := 'N';

    if chkbxactive.Checked then
      ParamByName('inactive').asString := 'N'
    else
      ParamByName('inactive').asString := 'Y';
    ExecSQL;
  end;
end;

function TSTMaintCourierServFrm.GetNextServiceNo: integer;
begin
  with self.qryGetNextServiceNo do
  begin
    close;
    ParamByName('courier').asInteger := self.courierCode;

    Open;
    Result := FieldByName('max_serv_no').asInteger + 1;
    close;
  end;
end;

procedure TSTMaintCourierServFrm.edtDescShortChange(Sender: TObject);
begin
  self.serviceDescShort := edtDescShort.text;
  self.CheckOK;
end;

procedure TSTMaintCourierServFrm.edtDescChange(Sender: TObject);
begin
  self.serviceDesc := edtDesc.text;
  self.CheckOK;
end;

procedure TSTMaintCourierServFrm.edtServiceCodeChange(Sender: TObject);
begin
  self.serviceCode := edtServiceCode.text;
  self.CheckOK;
end;

procedure TSTMaintCourierServFrm.CheckOK;
begin
  if (edtDesc.text <> '') and (edtDescShort.Text <> '')
    and (edtServiceCode.text <> '')then
  begin
    OKBitBtn.Enabled := true;
  end
  else
  begin
    OKBitBtn.Enabled := false;
  end;
end;

end.
