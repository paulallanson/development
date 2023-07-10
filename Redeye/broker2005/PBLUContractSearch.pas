unit PBLUContractSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PBContractDm, Buttons;

type
  TfrmPBLUContractSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtQuantity: TEdit;
    chkbxShowInactive: TCheckBox;
    SearchButton: TButton;
    lblDescription: TLabel;
    edtDescription: TEdit;
    Label2: TLabel;
    edtStatus: TEdit;
    Label1: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    Label4: TLabel;
    edtRep: TEdit;
    Label5: TLabel;
    edtAccountMgr: TEdit;
    Label7: TLabel;
    edtOperator: TEdit;
    ClearButton: TButton;
    chkbxShowWIP: TCheckBox;
    Label10: TLabel;
    edtDateReq: TEdit;
    btnDateReq: TBitBtn;
    Label14: TLabel;
    edtSubRep: TEdit;
    Label3: TLabel;
    edtMinimumQuantity: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure btnDateReqClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchContracts: TdtmdlContract;
  end;

var
  frmPBLUContractSearch: TfrmPBLUContractSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmPBLUContractSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchContracts.Status := Trim(edtStatus.Text);
  dtmdlSearchContracts.QuantityDesc := Trim(edtQuantity.Text);
  dtmdlSearchContracts.MinimumQuantityDesc := Trim(edtMinimumQuantity.Text);
  if edtDate.text = '' then
    dtmdlSearchContracts.ContractDate := PBDatestr('01/01/1990')
  else
    dtmdlSearchContracts.ContractDate := PBDateStr(edtDate.Text);

  if edtDateReq.text = '' then
    dtmdlSearchContracts.DateRequired := 0
  else
    dtmdlSearchContracts.DateRequired := PBDateStr(edtDateReq.Text);

  if chkbxShowInactive.checked then
    dtmdlSearchContracts.ShowInactive := 'Y'
  else
    dtmdlSearchContracts.ShowInactive := 'N';

  dtmdlSearchContracts.Description := Trim(edtDescription.Text);
  dtmdlSearchContracts.RepName := Trim(edtRep.text);
  dtmdlSearchContracts.SubRepName := Trim(edtSubRep.text);
  dtmdlSearchContracts.AccountMgr := Trim(edtAccountMgr.text);
  dtmdlSearchContracts.OperatorName := Trim(edtOperator.text);

  dtmdlSearchContracts.ShowWIP := chkbxShowWIP.checked;
  dtmdlSearchContracts.refreshdata;
  close;
end;

procedure TfrmPBLUContractSearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchContracts.Customer <> 0 then
    begin
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;

end;

procedure TfrmPBLUContractSearch.btnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmPBLUContractSearch.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDate.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if edtDate.Enabled then
        edtDate.SetFocus;
      exit;
    end;
  end;

  edtDate.Text := PBDatestr(NewDate);
end;

procedure TfrmPBLUContractSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

procedure TfrmPBLUContractSearch.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDateReq.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtDateReq.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if edtDateReq.Enabled then
        edtDateReq.SetFocus;
      exit;
    end;
  end;

  edtDateReq.Text := PBDatestr(NewDate);
end;

procedure TfrmPBLUContractSearch.btnDateReqClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateReq.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateReq.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

end.
