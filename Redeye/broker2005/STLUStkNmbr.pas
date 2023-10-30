unit STLUStkNmbr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IniFiles, ComCtrls, Menus, CCSCommon,
  PBStockDM, Data.DB;

type
  TSTLUStkNmbrFrm = class(TForm)
    pnlGrid: TPanel;
    pnlFooter: TPanel;
    pnlButton: TPanel;
    btbtnClose: TBitBtn;
    pnlPart: TPanel;
    lblPartDesc: TLabel;
    lblPartCode: TLabel;
    lblPart: TLabel;
    StatusBar1: TStatusBar;
    dbgrdLocations: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlStockEnquiry : TdtmdlStock;
  end;

var
  STLUStkNmbrFrm: TSTLUStkNmbrFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

procedure TSTLUStkNmbrFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'NmbrsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdLocations);
end;

procedure TSTLUStkNmbrFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  dtmdlStockEnquiry := TdtmdlStock.create(self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'NmbrsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgrdLocations);
end;

procedure TSTLUStkNmbrFrm.FormShow(Sender: TObject);
begin
  dbgrdLocations.datasource := dtmdlStockEnquiry.dtsrcPartNumbers;
end;

end.
