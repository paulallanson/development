unit STLUStkPurchases;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IniFiles, Menus, CCSCommon,
  PBStockDM;

type
  TSTLUStkPurchasesFrm = class(TForm)
    pnlGrid: TPanel;
    dbgrdPurchases: TDBGrid;
    pnlPart: TPanel;
    lblPartDesc: TLabel;
    lblPartCode: TLabel;
    lblPart: TLabel;
    pnlFooter: TPanel;
    pnlButton: TPanel;
    btbtnClose: TBitBtn;
    btnExcel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlStockEnquiry : TdtmdlStock;
  end;

var
  STLUStkPurchasesFrm: TSTLUStkPurchasesFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

{ TSTLUStkPurchasesFrm }

procedure TSTLUStkPurchasesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'PurchasesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdPurchases);
end;

procedure TSTLUStkPurchasesFrm.FormCreate(Sender: TObject);
begin
  dtmdlStockEnquiry := TdtmdlStock.create(self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'PurchasesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdPurchases);
end;

procedure TSTLUStkPurchasesFrm.FormShow(Sender: TObject);
begin
  dbgrdPurchases.datasource := dtmdlStockEnquiry.dtsrcPartPOs;
  btnExcel.Enabled := dtmdlStockEnquiry.dtsrcPartPOs.DataSet.RecordCount > 0;
end;

procedure TSTLUStkPurchasesFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(STLUStkPurchasesFrm);
end;

end.
