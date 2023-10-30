unit STMaintCustStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DB, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintCustStockFrm = class(TForm)
    pnlBottom: TPanel;
    btnClose: TBitBtn;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlCentre: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    btnFromSingle: TBitBtn;
    btnFromMulti: TBitBtn;
    btnToSingle: TBitBtn;
    btnToMulti: TBitBtn;
    Label1: TLabel;
    edtCustomerFrom: TEdit;
    Label2: TLabel;
    edtCustomerTo: TEdit;
    qryProductsFrom: TFDQuery;
    dtsProductsFrom: TDataSource;
    qryProductsTo: TFDQuery;
    dtsProductsTo: TDataSource;
    btnLUCustomerFrom: TBitBtn;
    btnLUCustomerTo: TBitBtn;
    StatusBar1: TStatusBar;
    qryUpdPart: TFDQuery;
    dbgDetailsFrom: TDBGrid;
    dbgDetailsTo: TDBGrid;
    qryUpdFormRef: TFDQuery;
    Panel1: TPanel;
    Label3: TLabel;
    edtSearchFrom: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    edtSearchTo: TEdit;
    lblRecordsFrom: TLabel;
    lblRecordsTo: TLabel;
    tmrSearch: TTimer;
    procedure btnLUCustomerFromClick(Sender: TObject);
    procedure btnLUCustomerToClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnFromSingleClick(Sender: TObject);
    procedure btnToSingleClick(Sender: TObject);
    procedure dbgDetailsFromDblClick(Sender: TObject);
    procedure dbgDetailsToDblClick(Sender: TObject);
    procedure btnFromMultiClick(Sender: TObject);
    procedure btnToMultiClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchFromChange(Sender: TObject);
    procedure edtSearchToChange(Sender: TObject);
  private
    bFrom, bTo: boolean;
    CustomerFrom, CustomerTo: integer;
    procedure LoadProductsFrom(tmpCode: integer; tmpDesc: string);
    procedure LoadProductsTo(tmpCode: integer; tmpDesc: string);
    procedure TransferToCustomer(tmpCode: string; tmpFrom, tmpTo: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STMaintCustStockFrm: TSTMaintCustStockFrm;

implementation

uses
  System.UITypes,
  PBLUCust, CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TSTMaintCustStockFrm.btnLUCustomerFromClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self) ;
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.SelCode := CustomerFrom ;
    PBLUCustFrm.ShowModal ;
    If PBLUCustFrm.Selected = True then
      begin
        CustomerFrom := PBLUCustFrm.SelCode ;
        edtCustomerFrom.text := PBLUCustFrm.SelName ;
        LoadProductsFrom(CustomerFrom, edtSearchFrom.text);
      end;
  finally
    PBLUCustFrm.Free ;
  end;
end;

procedure TSTMaintCustStockFrm.btnLUCustomerToClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self) ;
  try
    PBLUCustFrm.bIs_LookUp := True ;
    if edtCustomerTo.Text = '' then
      PBLUCustFrm.SelCode := CustomerFrom
    else
      PBLUCustFrm.SelCode := CustomerTo;
    PBLUCustFrm.ShowModal ;
    If PBLUCustFrm.selected = True then
      begin
        CustomerTo := PBLUCustFrm.SelCode ;
        edtCustomerTo.text := PBLUCustFrm.SelName ;
        LoadProductsTo(CustomerTo, edtSearchTo.text);
      end;
  finally
    PBLUCustFrm.Free ;
  end;
end;

procedure TSTMaintCustStockFrm.LoadProductsFrom(tmpCode: integer; tmpDesc: string);
begin
  with qryProductsFrom do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      parambyname('Description').asstring := '%' + tmpDesc + '%';
      open;

      btnFromSingle.enabled := (recordcount > 0);
      btnFromMulti.enabled := (recordcount > 0);

      lblRecordsFrom.caption := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TSTMaintCustStockFrm.LoadProductsTo(tmpCode: integer; tmpDesc: string);
begin
  with qryProductsTo do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      parambyname('Description').asstring := '%' + tmpDesc + '%';
      open;

      btnToSingle.enabled := (recordcount > 0);
      btnToMulti.enabled := (recordcount > 0);

      lblRecordsTo.caption := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TSTMaintCustStockFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TSTMaintCustStockFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'MaintCustomerStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsFrom);
  CCSCommon.SaveDBGridCols('', 'MaintCustomerStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsTo);
end;

procedure TSTMaintCustStockFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'MaintCustomerStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsFrom);
  CCSCommon.SetDBGridCols('', 'MaintCustomerStock Col Order', frmPBMainMenu.AppIniFile, self.dbgDetailsTo);

  edtCustomerFrom.text := '';
  edtCustomerTo.text := '';

  lblrecordsFrom.caption := '';
  lblrecordsTo.caption := '';
end;

procedure TSTMaintCustStockFrm.FormResize(Sender: TObject);
begin
  pnlLeft.Width := trunc((pnlbottom.Width - pnlCentre.width)/ 2);
end;

procedure TSTMaintCustStockFrm.btnFromSingleClick(Sender: TObject);
var
  tmpPart: string;
  icount: integer;
begin
  if not btnFromSingle.Enabled then exit;

  if trim(edtCustomerTo.Text) = '' then
    begin
      messagedlg('The customer to which you want to transfer the products must be selected', mtError, [mbOk], 0);
      exit;
    end;

  if messagedlg('Confirm you want to transfer the products for ' + edtCustomerFrom.Text
              + ' to ' + edtCustomerTo.text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for icount := 0 to (dbgDetailsFrom.SelectedRows.Count - 1) do
        begin
          dtsProductsFrom.DataSet.GotoBookmark(TBookmark(dbgDetailsFrom.SelectedRows[iCount])) ;
            with dtsProductsFrom.DataSet do
              begin
                tmpPart := fieldbyname('Part').asstring;
                TransferToCustomer(tmpPart, CustomerFrom, CustomerTo);
              end;
        end;
      LoadProductsFrom(CustomerFrom, edtSearchFrom.text);
      LoadProductsTo(CustomerTo, edtSearchTo.text);
    end;
end;

procedure TSTMaintCustStockFrm.TransferToCustomer(tmpCode: string; tmpFrom, tmpTo: integer);
begin
  with qryUpdPart do
    begin
      close;
      parambyname('Customer').asinteger := tmpTo;
      parambyname('Branch_no').asinteger := 0;
      parambyname('Part').asstring := tmpCode;
      execsql;
    end;

  with qryUpdFormRef do
    begin
      close;
      parambyname('Customer').asinteger := tmpTo;
      parambyname('Branch_no').asinteger := 0;
      parambyname('Stock_Reference').asstring := tmpCode;
      execsql;
    end;
end;

procedure TSTMaintCustStockFrm.btnToSingleClick(Sender: TObject);
var
  tmpPart: string;
  icount: integer;
begin
  if not btnToSingle.Enabled then exit;

  if trim(edtCustomerTo.Text) = '' then
    begin
      messagedlg('The customer to which you want to transfer products must be selected', mtError, [mbOk], 0);
      exit;
    end;

  if messagedlg('Confirm you want to transfer the selected product for ' + edtCustomerTo.Text
              + ' to ' + edtCustomerFrom.text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for icount := 0 to (dbgDetailsTo.SelectedRows.Count - 1) do
        begin
          dtsProductsTo.DataSet.GotoBookmark(TBookmark(dbgDetailsTo.SelectedRows[iCount])) ;
            with dtsProductsTo.DataSet do
              begin
                tmpPart := fieldbyname('Part').asstring;
                TransferToCustomer(tmpPart,CustomerTo, CustomerFrom);
              end;
        end;
      LoadProductsFrom(CustomerFrom, edtSearchFrom.text);
      LoadProductsTo(CustomerTo, edtSearchTo.text);
    end;
end;

procedure TSTMaintCustStockFrm.dbgDetailsFromDblClick(Sender: TObject);
begin
  btnFromSingle.OnClick(self);
end;

procedure TSTMaintCustStockFrm.dbgDetailsToDblClick(Sender: TObject);
begin
  btnToSingle.OnClick(self);
end;

procedure TSTMaintCustStockFrm.btnFromMultiClick(Sender: TObject);
var
  icount: integer;
  tmpPart: string;
begin
  if messagedlg('Confirm you want to transfer all displayed products for ' + edtCustomerFrom.Text
              + ' to ' + edtCustomerTo.text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {Select ALL products}
      with dtsProductsFrom.DataSet do
        begin
          First ;
          while eof <> true do
            begin
              dbgDetailsFrom.SelectedRows.CurrentRowSelected := True ;
              next ;
            end;
        end;
      {}
      for icount := 0 to (dbgDetailsFrom.SelectedRows.Count - 1) do
        begin
          dtsProductsFrom.DataSet.GotoBookmark(TBookmark(dbgDetailsFrom.SelectedRows[iCount])) ;
            with dtsProductsFrom.DataSet do
              begin
                tmpPart := fieldbyname('Part').asstring;
                TransferToCustomer(tmpPart, CustomerFrom, CustomerTo);
              end;
        end;
      LoadProductsFrom(CustomerFrom, edtSearchFrom.text);
      LoadProductsTo(CustomerTo, edtSearchTo.text);
    end;

end;

procedure TSTMaintCustStockFrm.btnToMultiClick(Sender: TObject);
var
  icount: integer;
  tmpPart: string;
begin
  if messagedlg('Confirm you want to transfer all displayed products for ' + edtCustomerTo.Text
              + ' to ' + edtCustomerFrom.text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {Select ALL products}
      with dtsProductsTo.DataSet do
        begin
          First ;
          while eof <> true do
            begin
              dbgDetailsTo.SelectedRows.CurrentRowSelected := True ;
              next ;
            end;
        end;
      {}
      for icount := 0 to (dbgDetailsTo.SelectedRows.Count - 1) do
        begin
          dtsProductsTo.DataSet.GotoBookmark(TBookmark(dbgDetailsTo.SelectedRows[iCount])) ;
            with dtsProductsTo.DataSet do
              begin
                tmpPart := fieldbyname('Part').asstring;
                TransferToCustomer(tmpPart,CustomerTo, CustomerFrom);
              end;
        end;
      LoadProductsFrom(CustomerFrom, edtSearchFrom.text);
      LoadProductsTo(CustomerTo, edtSearchTo.text);
    end;

end;

procedure TSTMaintCustStockFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  if bFrom then
    LoadProductsFrom(CustomerFrom, edtSearchFrom.text)
  else
    LoadProductsTo(CustomerTo, edtSearchTo.text);
end;

procedure TSTMaintCustStockFrm.edtSearchFromChange(Sender: TObject);
begin
  bFrom := true;
  bTo := false;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTMaintCustStockFrm.edtSearchToChange(Sender: TObject);
begin
  bFrom := false;
  bTo := true;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

end.
