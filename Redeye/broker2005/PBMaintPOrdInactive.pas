unit PBMaintPOrdInactive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ExtCtrls, Db, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPOrdInactiveFrm = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    dbluReason: TDBLookupComboBox;
    Label3: TLabel;
    edtDate: TEdit;
    BitBtn1: TBitBtn;
    btnOK: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lblPOrder: TLabel;
    lblDescription: TLabel;
    lblSupplier: TLabel;
    lblCustomer: TLabel;
    BitBtn4: TBitBtn;
    GetHeadDtlsSQL: TFDQuery;
    qryReason: TFDQuery;
    srcReason: TDataSource;
    qryUpPorder: TFDQuery;
    reActiveChk: TCheckBox;
    qryCountJBLines: TFDQuery;
    qryUpJBInactive: TFDQuery;
    Label4: TLabel;
    lblOperatorName: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbluReasonClick(Sender: TObject);
    procedure edtDateChange(Sender: TObject);
  private
    { Private declarations }
    iInactiveOperator: integer;
    procedure SetupDetails;
    procedure GetData;
    procedure EnableOK;
  public
    { Public declarations }
    rPurchaseOrder: real;
    iLine, iJobBag: integer;
  end;

var
  PBMaintPOrdInactiveFrm: TPBMaintPOrdInactiveFrm;

implementation

uses DateSelV5, PBLUReasCode, pbMainMenu;

{$R *.DFM}

procedure TPBMaintPOrdInactiveFrm.EnableOK;
begin
  btnOK.enabled := false;
  if (edtDate.text = '') or
    (dbLUReason.keyvalue = 0) or
    (dbLUReason.keyvalue = 0) then
    exit;
  btnOK.enabled := true;
end;

procedure TPBMaintPOrdInactiveFrm.GetData;
begin
  with qryReason do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintPOrdInactiveFrm.SetupDetails;
begin
  with GetHeadDtlsSQl do
    begin
      close;
      parambyname('Purchase_order').asfloat := rPurchaseOrder;
      parambyname('Line').asinteger := iLine;
      open;
      if recordcount <> 0 then
        begin
        lblCustomer.Caption := 'Customer  '+FieldByName('Cust_Name').AsString;
        lblSupplier.Caption := 'Supplier  '+FieldByName('Supp_Name').AsString;
        lblDescription.Caption := 'Supplier Desc. '+fieldbyname('Suppliers_desc').Asstring;

        if fieldbyname('Inactive').asstring = 'Y' then
          begin
            DBLUReason.keyvalue := fieldbyname('Inactive_reason').asinteger;
            Reactivechk.visible := true;
            edtDate.text := PBDateStr(fieldbyname('Inactive_Date').asdatetime);
            lblOperatorName.caption := fieldbyname('Operator_Name').asstring;
          end
        else
          begin
            DBLUReason.keyvalue := 0;
            Reactivechk.visible := false;
            edtDate.text := '';
            lblOperatorName.caption := frmPBMainMenu.sOperator_Name;
          end;

        iInactiveOperator :=  fieldbyname('Inactive_Operator').asinteger
        end
      else
        begin
          lblCustomer.caption := '';
          lblSupplier.Caption := '';
          lblDescription.Caption := '';
          lblOperatorName.caption := frmPBMainMenu.sOperator_Name;
        end;
    end;
    lblPOrder.Caption := floatToStr(rPurchaseOrder)+'/'+IntToStr(iLine);

    if trim(edtDate.text) = '' then
      edtDate.text := PBDAteStr(date);
    enableOK;
end;

procedure TPBMaintPOrdInactiveFrm.FormActivate(Sender: TObject);
begin
  GetData;
  SetupDetails;
end;

procedure TPBMaintPOrdInactiveFrm.btnOKClick(Sender: TObject);
var
  JBLines: integer;
begin
  with qryUpPorder do
    begin
      close;
      parambyname('Purchase_order').asfloat := rPurchaseOrder;
      parambyname('Line').asinteger := iLine;
      if reactivechk.checked then
        begin
          parambyname('Inactive').asstring := 'N';
          parambyname('Inactive_Reason').clear;
          parambyname('Inactive_Date').clear;
          parambyname('Inactive_Operator').clear;
        end
      else
        begin
          parambyname('Inactive').asstring := 'Y';
          parambyname('Inactive_Reason').asinteger := dbluReason.keyvalue;
          parambyname('Inactive_Date').asdatetime := PBDateStr(edtDate.text);
          if iInactiveOperator > 0 then
            parambyname('Inactive_Operator').asinteger := iInactiveOperator
          else
            parambyname('Inactive_Operator').asinteger := frmPBMainMenu.iOperator;
        end;
      execsql;
    end;

//  Check not in job bag then exit
  if iJobBag = 0 then exit;

// Check for number of lines in job bag
  with qryCountJBLines do
    begin
      close;
      parambyname('Job_Bag').asinteger := iJobBag;
      open;
      JBLines := fieldbyname('Line_Count').asinteger;
    end;

  if JBLines = 1 then
    begin
      with qryUpJBInactive do
        begin
          close;
          parambyname('Job_Bag').asinteger := iJobBag;
          if reactivechk.checked then
            parambyname('Inactive').asstring := 'N'
          else
            parambyname('Inactive').asstring := 'Y';
          execsql;
        end;
    end;

end;

procedure TPBMaintPOrdInactiveFrm.edtDateExit(Sender: TObject);
begin
  if edtDate.Text = '' then Exit;
  {Check for valid Date}
  try
    StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDate.SetFocus;
      Exit;
    end;
  end;

end;

procedure TPBMaintPOrdInactiveFrm.BitBtn1Click(Sender: TObject);
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
    EnableOK;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdInactiveFrm.BitBtn4Click(Sender: TObject);
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

procedure TPBMaintPOrdInactiveFrm.dbluReasonClick(Sender: TObject);
begin
  enableOK;
end;

procedure TPBMaintPOrdInactiveFrm.edtDateChange(Sender: TObject);
begin
  enableOK;
end;

end.
