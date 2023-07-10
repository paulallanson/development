unit wtMaintCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Buttons, ComCtrls, gtQrCtrls;

type
  TfrmWTMaintCust = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    chkbxActive: TDBCheckBox;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWTMaintCust: TfrmWTMaintCust;

implementation

uses
  wtCustomerDM, wtDatabaseDM;

{$R *.DFM}

{ TfrmwtMaintCust }

procedure TfrmWTMaintCust.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  if Value = 'A' then
    begin
    chkbxactive.checked := true;
    dtmdlCustomer.tblCustomer.Insert;
    end
  else
  if Value = 'C' then
    begin
    chkbxactive.checked := not (dtmdlCustomer.tblCustomer.fieldbyname('Live_Status').asstring = 'Y') or
                          not (dtmdlCustomer.tblCustomer.fieldbyname('live_status').asstring = 'y');
    dtmdlCustomer.tblCustomer.edit;
    end;
end;

procedure TfrmWTMaintCust.BitBtn1Click(Sender: TObject);
begin
  if (chkbxactive.checked = true) then
    dtmdlCustomer.tblCustomer.FieldByName('Live_Status').asstring := 'N'
  else
    dtmdlCustomer.tblCustomer.FieldByName('Live_Status').asstring := 'Y';

  dtmdlCustomer.tblCustomer.Post;

  dtmdlCustomer.tblCustomer.refresh;
end;

procedure TfrmWTMaintCust.BitBtn2Click(Sender: TObject);
begin
  dtmdlCustomer.tblCustomer.cancel;
end;

end.
