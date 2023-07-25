unit STLUStkProduction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IniFiles, Menus, CCSCommon,
  pbStockDM, Data.DB;

type
  TSTLUStkProductionFrm = class(TForm)
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
    dtmdlStockEnquiry: TdtmdlStock;
  end;

var
  STLUStkProductionFrm: TSTLUStkProductionFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

{ TSTLUStkPurchasesFrm }

procedure TSTLUStkProductionFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'ProductionLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdPurchases);
end;

procedure TSTLUStkProductionFrm.FormCreate(Sender: TObject);
begin
  dtmdlStockEnquiry := TdtmdlStock.create(self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'ProductionLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdPurchases);
end;

procedure TSTLUStkProductionFrm.FormShow(Sender: TObject);
begin
  dbgrdPurchases.DataSource := dtmdlStockEnquiry.dtsrcPartProduction;
  btnExcel.Enabled := dtmdlStockEnquiry.dtsrcPartProduction.DataSet.RecordCount > 0;
end;

procedure TSTLUStkProductionFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(STLUStkProductionFrm);
end;

end.
