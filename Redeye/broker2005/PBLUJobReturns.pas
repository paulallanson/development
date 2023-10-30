unit PBLUJobReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, pbJobsDM, DB, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBLUJobReturns = class(TForm)
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    Panel3: TPanel;
    btnReturns: TButton;
    Panel4: TPanel;
    dbgDetails: TDBGrid;
    Label1: TLabel;
    lblProduct: TLabel;
    Label3: TLabel;
    lblDescription: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    lblQtyOrdered: TLabel;
    lblQtyDespatched: TLabel;
    Label7: TLabel;
    lblQtyOvers: TLabel;
    Label6: TLabel;
    lblCustomer: TLabel;
    qryPart: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnReturnsClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FPart: string;
    FDescription: string;
    FCustomer: integer;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetPart(const Value: string);
    procedure SetDescription(const Value: string);
    procedure LoadProductionQtys;
    procedure CallMoveScreen(TempMoveType: String);
    procedure SetCustomer(const Value: integer);
  private
    dtmdlJBReturns: TdtmdlJobs;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure SetButtons(Sender: TObject; Field: TField);
  public
    property Part: string read FPart write SetPart;
    property Description: string read FDescription write SetDescription;
    property Customer: integer read FCustomer write SetCustomer;
  end;

var
  frmPBLUJobReturns: TfrmPBLUJobReturns;

implementation

uses PBMaintJobReturns, PBPartTransfer, pbMainMenu;

{$R *.dfm}

procedure TfrmPBLUJobReturns.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
  dtmdlJBReturns := TdtmdlJobs.create(self);
  dtmdlJBReturns.dtsJobReturns.OnDataChange := SetButtons;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmPBLUJobReturns.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'JobReturnsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmPBLUJobReturns.FormActivate(Sender: TObject);
begin
  dbgDetails.datasource := dtmdlJBReturns.dtsJobReturns;

  with qryPart do
    begin
      close;
      parambyname('part').asstring := Part;
      open;
      customer := fieldbyname('customer').asinteger;
      lblCustomer.Caption := fieldbyname('customer_name').asstring;
    end;

  LoadProductionQtys;

  dtmdlJBReturns.ReturnName := Part;
  dtmdlJBReturns.RefreshReturns;
end;

procedure TfrmPBLUJobReturns.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlJBReturns do
  begin
    btnReturns.Enabled := ReturnCount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Job_Bag').asstring;
    stsBrDetails.panels[0].text := inttostr(ReturnCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUJobReturns.LoadProductionQtys;
begin
  with dtmdlJBReturns.qryJBPartQtys do
    begin
      close;
      parambyname('Part').asstring := Part;
      open;

      lblQtyOrdered.caption := formatfloat('#,##0', fieldbyname('Qty_Ordered').Asfloat);
      lblQtyDespatched.caption := formatfloat('#,##0', fieldbyname('Qty_Despatched').Asfloat);
      lblQtyOvers.caption := formatfloat('#,##0',fieldbyname('Qty_Overs').Asfloat);
    end;
end;

procedure TfrmPBLUJobReturns.FormDestroy(Sender: TObject);
begin
  dtmdlJBReturns.free;
end;

procedure TfrmPBLUJobReturns.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUJobReturns.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUJobReturns.btnReturnsClick(Sender: TObject);
begin
  CallMoveScreen('P');
(*  frmPBMaintJobReturns := TfrmPBMaintJobReturns.create(self);
  try
    frmPBMaintJobReturns.LoadtheScreen(dbgDetails.DataSource.DataSet.FieldByName('Job_Bag').asinteger, dbgDetails.DataSource.DataSet.FieldByName('Part').asstring);
    frmPBMaintJobReturns.showmodal;
  finally
    frmPBMaintJobReturns.free;
  end;
*)
end;

procedure TfrmPBLUJobReturns.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  tempPart := lblProduct.caption;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := lblDescription.Caption;
//    PBPartTransferFrm.edtFormReference.Text := dbgLineDetails.dataSource.DataSet.FieldByName('Form_Reference_ID').AsString;
    PBPartTransferFrm.Customer := Customer;
    PBPartTransferFrm.sMoveType := TempMoveType ;
    PBPartTransferFrm.iJobBag := dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;

    PBPartTransferFrm.ShowModal;
    bTempOK := PBPartTransferFrm.bOK;
    if bTempOK then
      begin
        dtmdlJBReturns.RefreshReturns;
      end;
  finally
    PBPartTransferFrm.Free;
  end;
end;

procedure TfrmPBLUJobReturns.SetPart(const Value: string);
begin
  FPart := Value;
  lblProduct.caption := FPart;
end;

procedure TfrmPBLUJobReturns.SetDescription(const Value: string);
begin
  FDescription := Value;
  lblDescription.Caption := FDescription;
end;

procedure TfrmPBLUJobReturns.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

end.
