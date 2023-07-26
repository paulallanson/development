unit STMaintStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DB, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintStockFrm = class(TForm)
    pnlBottom: TPanel;
    btnClose: TBitBtn;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlCentre: TPanel;
    Panel5: TPanel;
    dbgDetailsFrom: TDBGrid;
    Panel6: TPanel;
    btnFromSingle: TBitBtn;
    btnFromMulti: TBitBtn;
    btnToSingle: TBitBtn;
    btnToMulti: TBitBtn;
    Label1: TLabel;
    edtPartFrom: TEdit;
    lblDescriptionFrom: TLabel;
    Label2: TLabel;
    edtPartTo: TEdit;
    lblDescriptionTo: TLabel;
    qryStockFrom: TFDQuery;
    dtsStockFrom: TDataSource;
    qryStockTo: TFDQuery;
    dtsStockTo: TDataSource;
    PartBitBtn: TBitBtn;
    BitBtn5: TBitBtn;
    dbgDetailsTo: TDBGrid;
    StatusBar1: TStatusBar;
    qryUpdStoreStock: TFDQuery;
    qryUpdMovements: TFDQuery;
    qryGetMovements: TFDQuery;
    qryUpdMovementBal: TFDQuery;
    procedure PartBitBtnClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnFromSingleClick(Sender: TObject);
    procedure btnToSingleClick(Sender: TObject);
    procedure dbgDetailsFromDblClick(Sender: TObject);
    procedure dbgDetailsToDblClick(Sender: TObject);
  private
    procedure LoadStockFrom(tmpProduct: string);
    procedure LoadStockTo(tmpProduct: string);
    procedure TransferStockToProduct(tmpCode: integer; tmpPartFrom, tmpPartTo, tmpLot: string; tmpDate: TDateTime);
    procedure UpdatePartMovementsBalance(tmpPart: string;
      tmpDate: TDateTime);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STMaintStockFrm: TSTMaintStockFrm;

implementation

uses STPrtMnt, CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TSTMaintStockFrm.PartBitBtnClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartfrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
      begin
        edtPartfrom.Text := STPrtMntFrm.sCode ;
        lblDescriptionFrom.caption := STPrtMntFrm.sCodeDescr ;
        LoadStockFrom(edtPartFrom.text);
      end;
  finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTMaintStockFrm.BitBtn5Click(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  try
    STPrtMntFrm.bIs_LookUp := True ;
    if edtPartTo.Text = '' then
      STPrtMntFrm.sCode := edtPartFrom.Text
    else
      STPrtMntFrm.sCode := edtPartTo.Text;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
      begin
        edtPartTo.Text := STPrtMntFrm.sCode ;
        lblDescriptionTo.caption := STPrtMntFrm.sCodeDescr ;
        loadstockTo(edtPartTo.text);
      end;
  finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTMaintStockFrm.LoadStockFrom(tmpProduct: string);
begin
  with qryStockFrom do
    begin
      close;
      parambyname('Part').asstring := tmpProduct;
      open;

      btnFromSingle.enabled := (recordcount > 0);
      btnFromMulti.enabled := (recordcount > 0);
    end;
end;

procedure TSTMaintStockFrm.LoadStockTo(tmpProduct: string);
begin
  with qryStockTo do
    begin
      close;
      parambyname('Part').asstring := tmpProduct;
      open;

      btnToSingle.enabled := (recordcount > 0);
      btnToMulti.enabled := (recordcount > 0);
    end;
end;

procedure TSTMaintStockFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TSTMaintStockFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'MaintStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsFrom);
  CCSCommon.SaveDBGridCols('', 'MaintStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsTo);
end;

procedure TSTMaintStockFrm.FormCreate(Sender: TObject);
begin
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'MaintStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsFrom);
  CCSCommon.SetDBGridCols('', 'MaintStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsTo);

  lblDescriptionFrom.caption := '';
  lblDescriptionTo.caption := '';

end;

procedure TSTMaintStockFrm.FormResize(Sender: TObject);
begin
  pnlLeft.Width := trunc((pnlbottom.Width - pnlCentre.width)/ 2);
end;

procedure TSTMaintStockFrm.btnFromSingleClick(Sender: TObject);
var
  istorestock: integer;
  sLot: string;
  dateReceived: TDateTime;
begin
  if not btnFromSingle.Enabled then exit;
  if trim(edtPartTo.Text) = '' then
    begin
      messagedlg('The product you want to transfer the stock to, must be selected', mtError, [mbOk], 0);
      exit;
    end;

  if messagedlg('Confirm that the stock details for product ' + edtPartFrom.Text
              + ' will be transfered to ' + edtPartTo.text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      iStoreStock := dbgDetailsFrom.datasource.dataset.fieldbyname('Store_Stock').asinteger;
      sLot := dbgDetailsFrom.datasource.dataset.fieldbyname('Part_Store_Lot').asstring;
      DateReceived := dbgDetailsFrom.datasource.dataset.fieldbyname('Date_Received').asdatetime;
      TransferStockToProduct(istorestock, edtPartFrom.text, edtPartTo.text, slot, DateReceived);
    end;
end;

procedure TSTMaintStockFrm.TransferStockToProduct(tmpCode: integer; tmpPartFrom, tmpPartTo, tmpLot: string; tmpDate: TDateTime);
begin
  with qryUpdStoreStock do
    begin
      close;
      parambyname('store_stock').asinteger := tmpCode;
      parambyname('Part').asstring := tmpPartTo;
      execsql;
    end;

  with qryUpdMovements do
    begin
      close;
      parambyname('Part_From').asstring := tmpPartFrom;
      parambyname('Part_To').asstring := tmpPartTo;
      parambyname('Part_Store_Lot').asstring := tmpLot;
      parambyname('Date_Received').asdatetime := tmpDate;
      execsql;
    end;

  UpdatePartMovementsBalance(tmpPartFrom, tmpDate);
  UpdatePartMovementsBalance(tmpPartTo, tmpDate);

  LoadStockFrom(edtPartFrom.text);
  LoadStockTo(edtPartTo.text);
end;

procedure TSTMaintStockFrm.UpdatePartMovementsBalance(tmpPart: string; tmpDate: TDateTime);
begin
  with qryGetMovements do
    begin
      close;
      parambyname('Part').asstring := tmpPart;
      parambyname('Date_Received').asdatetime := tmpDate;
      open;

      while eof <> true do
        begin
          qryUpdMovementBal.close;
          qryUpdMovementBal.parambyname('Part_Movement').asinteger := fieldbyname('Part_Movement').asinteger;
          qryUpdMovementBal.execsql;
          next;
        end;
    end;
end;

procedure TSTMaintStockFrm.btnToSingleClick(Sender: TObject);
var
  istorestock: integer;
  sLot: string;
  DateReceived: TDateTime;
begin
  if not btnToSingle.Enabled then exit;

  if trim(edtPartTo.Text) = '' then
    begin
      messagedlg('The product you want to transfer the stock to, must be selected', mtError, [mbOk], 0);
      exit;
    end;

  if messagedlg('Confirm that the stock details for product ' + edtPartTo.Text
              + ' will be transfered to ' + edtPartFrom.text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      iStoreStock := dbgDetailsTo.datasource.dataset.fieldbyname('Store_Stock').asinteger;
      sLot := dbgDetailsTo.datasource.dataset.fieldbyname('Part_Store_Lot').asstring;
      DateReceived := dbgDetailsTo.datasource.dataset.fieldbyname('Date_Received').asdatetime;
      TransferStockToProduct(istorestock, edtPartTo.text, edtPartFrom.text, slot, DateReceived);
    end;
end;

procedure TSTMaintStockFrm.dbgDetailsFromDblClick(Sender: TObject);
begin
  btnFromSingle.OnClick(self);
end;

procedure TSTMaintStockFrm.dbgDetailsToDblClick(Sender: TObject);
begin
  btnToSingle.OnClick(self);
end;

end.
