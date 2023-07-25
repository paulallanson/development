unit STLUStkBinLots;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, IniFiles, Menus, ComCtrls,
  PBStockDM, Data.DB;

type
  TSTLUStkBinLotsFrm = class(TForm)
    Panel1: TPanel;
    pnlGrid: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    dbgrdBinLots: TDBGrid;
    pnlPart: TPanel;
    lblPartCode: TLabel;
    lblPart: TLabel;
    lblStore: TLabel;
    lblStoreName: TLabel;
    lblQuantities: TLabel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdBinLotsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    userPrefExist: Boolean;
    procedure SetFormLayout;
    procedure SaveFormLayout;
  public
    dtmdlStockEnquiry: TdtmdlStock;
  end;

var
  STLUStkBinLotsFrm: TSTLUStkBinLotsFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

procedure TSTLUStkBinLotsFrm.SaveFormLayout;
var
  icount, colWidth : integer;
  colOrder : String;
  colName, colCaption : String;
  IniFile : TIniFile;
begin
  begin
    IniFile := TIniFile.Create (frmPBMainMenu.AppIniFile);
    IniFile.WriteBool('BinLotsLU Col Order', 'UserPrefs', true);
    for icount := 0 to Pred(dbgrdBinLots.columns.count) do
    begin
      colOrder := 'Col' + IntToStr(icount);
      colName := dbgrdBinLots.columns[icount].fieldname;
      colCaption := dbgrdBinLots.columns[icount].Title.caption;
      colWidth :=  dbgrdBinLots.columns[icount].width;

      IniFile.WriteString('BinLotsLU Col Order', colOrder + 'Field', colName);
      IniFile.WriteString('BinLotsLU Col Order', colOrder + 'Caption', colCaption);
      IniFile.WriteInteger('BinLotsLU Col Order', colOrder + 'Width', colWidth);
    end;

    IniFile.WriteInteger('FormPositions', Self.Name + 'Top', Self.Top);
    IniFile.WriteInteger('FormPositions', Self.Name + 'Left', Self.Left);
    IniFile.WriteInteger('FormPositions', Self.Name + 'Height', Self.Height);
    IniFile.WriteInteger('FormPositions', Self.Name + 'Width', Self.Width);

    IniFile.Free;
  end;
end;

procedure TSTLUStkBinLotsFrm.SetFormLayout;
var
  icount, colCount, colWidth : integer;
  colOrder, colName, colCaption : String;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  userPrefExist := IniFile.ReadBool('BinLotsLU Col Order', 'UserPrefs', false);
  if (userPrefExist=true) then
  begin
    colCount := Pred(dbgrdBinLots.columns.count);
    for icount := 0 to colCount do
    begin
      colOrder := 'Col'+IntToStr(icount);
      colName := IniFile.ReadString('BinLotsLU Col Order', colOrder + 'Field', '');
      colCaption := IniFile.ReadString('BinLotsLU Col Order', colOrder + 'Caption', '');
      colWidth := IniFile.ReadInteger('BinLotsLU Col Order', colOrder + 'Width', 40);

      dbgrdBinLots.columns[icount].fieldname := colName;
      dbgrdBinLots.columns[icount].Title.caption := colCaption;
      dbgrdBinLots.columns[icount].width := colWidth;
    end;
  end;

  if IniFile.ReadInteger('FormPositions', Self.Name+'Top', -1) <> -1 then
  begin
    Self.Position := poDesigned;
    Self.Top := IniFile.ReadInteger('FormPositions', Self.Name+'Top', Self.Top);
    Self.Left := IniFile.ReadInteger('FormPositions', Self.Name+'Left', Self.Left);
    Self.Height := IniFile.ReadInteger('FormPositions', Self.Name+'Height', Self.Height);
    Self.Width := IniFile.ReadInteger('FormPositions', Self.Name+'Width', Self.Width);
  end;

  IniFile.Free;
end;

procedure TSTLUStkBinLotsFrm.FormCreate(Sender: TObject);
begin
//  dtmdlStockEnquiry := TdtmdlStock.create(self);
  SetFormLayout();
end;

procedure TSTLUStkBinLotsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveFormLayout();
end;

procedure TSTLUStkBinLotsFrm.dbgrdBinLotsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if state = [gdSelected] then
  begin
    dbgrdBinLots.Canvas.Font.Color := clwhite;
    dbgrdBinLots.canvas.brush.Color := clNavy;
  end
  else
  begin
    dbgrdBinLots.Canvas.Font.Color := clblack;
    dbgrdBinLots.canvas.brush.Color := clwhite;
  end;
  dbgrdBinLots.DefaultDrawColumnCell(rect, datacol, column, state);
end;

procedure TSTLUStkBinLotsFrm.FormShow(Sender: TObject);
begin
//  dbgrdBinLots.datasource := dtmdlStockEnquiry.dtsrcStoreStockNumberedItems;
end;

end.
