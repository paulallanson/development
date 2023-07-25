unit STLUStkMvmnts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IniFiles, Menus, CCSCommon,
  pbStockDM, Data.DB;

type
  TSTLUStkMvmntsFrm = class(TForm)
    pnlGrid: TPanel;
    dbgrdMvmnts: TDBGrid;
    pnlPart: TPanel;
    lblPartDesc: TLabel;
    lblPartCode: TLabel;
    lblPart: TLabel;
    pnlFooter: TPanel;
    pnlButton: TPanel;
    btbtnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lblTotalStock: TLabel;
    lblFreeStock: TLabel;
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
  STLUStkMvmntsFrm: TSTLUStkMvmntsFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

procedure TSTLUStkMvmntsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'MvmntsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdMvmnts);
end;

procedure TSTLUStkMvmntsFrm.FormCreate(Sender: TObject);
begin
  dtmdlStockEnquiry := TdtmdlStock.create(self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'MvmntsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdMvmnts);
end;

procedure TSTLUStkMvmntsFrm.FormShow(Sender: TObject);
begin
  dbgrdMvmnts.datasource := dtmdlStockEnquiry.dtsrcPartMvmnts;
  btnExcel.Enabled := dtmdlStockEnquiry.dtsrcPartMvmnts.DataSet.RecordCount > 0;
end;

procedure TSTLUStkMvmntsFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(STLUStkMvmntsFrm);
end;

end.
