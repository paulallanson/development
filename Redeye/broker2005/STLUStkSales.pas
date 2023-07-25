unit STLUStkSales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IniFiles, Menus, CCSCommon,
  PBStockDM, Data.DB;

type
  TSTLUStkSalesFrm = class(TForm)
    pnlGrid: TPanel;
    dbgrdSales: TDBGrid;
    pnlPart: TPanel;
    lblPartDesc: TLabel;
    lblPartCode: TLabel;
    lblPart: TLabel;
    pnlFooter: TPanel;
    pnlButton: TPanel;
    btbtnClose: TBitBtn;
    btnExcel: TBitBtn;
    pmnFunctions: TPopupMenu;
    ResetGrid1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
  private
    DontSaveLayout: Boolean;
  public
    dtmdlStockEnquiry : TdtmdlStock;
  end;

var
  STLUStkSalesFrm: TSTLUStkSalesFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

{ TSTLUStkSalesFrm }

procedure TSTLUStkSalesFrm.FormCreate(Sender: TObject);
begin
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'SalesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdSales);
end;

procedure TSTLUStkSalesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmdlStockEnquiry := TdtmdlStock.create(self);
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'SalesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdSales);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TSTLUStkSalesFrm.FormShow(Sender: TObject);
begin
  dbgrdSales.datasource := dtmdlStockEnquiry.dtsrcPartSales;
  btnExcel.Enabled := dtmdlStockEnquiry.dtsrcPartSales.DataSet.RecordCount > 0;
end;

procedure TSTLUStkSalesFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(STLUStkSalesFrm);
end;

procedure TSTLUStkSalesFrm.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('SalesLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

end.
