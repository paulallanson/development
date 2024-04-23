unit PBAboutOps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAboutOpsFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    lblName: TLabel;
    lblPOCost: TLabel;
    lblMinSales: TLabel;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryOperatoroperator: TIntegerField;
    qryOperatorName: TWideStringField;
    qryOperatorcan_authorise_po: TWideStringField;
    qryOperatormax_unauthorised_po_value: TCurrencyField;
    qryOperatormin_po_sales_Value: TCurrencyField;
    qryOperatormin_po_sales_value_type: TWideStringField;
    qryOperatordelete_po_from_job_bag: TWideStringField;
    qryOperatoroverride_paid_stock: TWideStringField;
    qryOperatorCan_Authorise_Desc: TWideStringField;
    qryOperatorSales_Value_Type_Desc: TWideStringField;
    lblAuthoriseLevel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure qryOperatorCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBAboutOpsFrm: TPBAboutOpsFrm;

implementation

uses pbMainMenu, PBDatabase;

{$R *.dfm}

procedure TPBAboutOpsFrm.FormActivate(Sender: TObject);
begin
  lblName.caption := 'Name: ' + frmPBMainMenu.sOperator_Name;
  lblPOCost.caption := 'Max Unauthorised PO Cost: ' + formatfloat('£#,###,##0',dmBroker.AuthorisedOrderLimit(frmPBMainMenu.iOperator));

  if dmBroker.CanAuthorise(frmPBMainMenu.iOperator) = 'N' then
    lblAuthoriseLevel.caption := 'Authorisation Level: None'
  else
  if dmBroker.CanAuthorise(frmPBMainMenu.iOperator) = 'P' then
    lblAuthoriseLevel.caption := 'Authorisation Level: Partial'
  else
    lblAuthoriseLevel.caption := 'Authorisation Level: Full';

  if dmBroker.MinimumSalesValueType(frmPBMainMenu.iOperator) = 'C' then
    lblMinSales.caption := 'Minimum Uplift on Cost: ' + formatfloat('#,###,##0%',dmBroker.MinimumSalesValue(frmPBMainMenu.iOperator))
  else
    lblMinSales.caption := 'Minimum Sales Value: ' + formatfloat('£#,###,##0',dmBroker.MinimumSalesValue(frmPBMainMenu.iOperator));

  with qryOperator do
    begin
      close;
      open;
    end;
end;

procedure TPBAboutOpsFrm.qryOperatorCalcFields(DataSet: TDataSet);
begin
  if qryOperator.fieldbyname('Can_Authorise_PO').asstring = 'F' then
    qryOperatorCan_Authorise_Desc.AsString := 'Full'
  else
    qryOperatorCan_Authorise_Desc.AsString := 'Partial';

  if qryOperator.fieldbyname('Min_PO_Sales_Value_Type').asstring = 'F' then
    qryOperatorSales_Value_Type_Desc.AsString := 'Fixed Value'
  else
    qryOperatorSales_Value_Type_Desc.AsString := '% Uplift on Cost';

end;

end.
