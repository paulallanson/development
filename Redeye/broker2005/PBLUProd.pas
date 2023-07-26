unit PBLUProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, ImgList, ToolWin, Db, ExtCtrls,
  StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUProdFrm = class(TForm)
    stBrDetails: TStatusBar;
    DetsDBGrid: TDBGrid;
    qrySelParts: TFDQuery;
    dtsrcParts: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    edtProduct: TEdit;
    pnlCloseBtn: TPanel;
    ChkBxExcProd: TCheckBox;
    GridTimer: TTimer;
    btnSelect: TBitBtn;
    CloseBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridTimerTimer(Sender: TObject);
    procedure edtProductChange(Sender: TObject);
    procedure ChkBxExcProdClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowGrid;
  public
    { Public declarations }
    part: string;
    partDesc: string;
    iCust, iCustBranch: Integer;
  end;

var
  PBLUProdFrm: TPBLUProdFrm;

implementation

{$R *.DFM}

procedure TPBLUProdFrm.ShowGrid;
begin
  self.qrySelParts.close;
  self.qrySelParts.ParamByName('cust').asInteger := iCust;

  if edtProduct.Text = '' then
    self.qrySelParts.ParamByName('part').asString := ''
  else
    self.qrySelParts.ParamByName('part').asString := '%' + edtProduct.Text + '%';

  if ChkBxExcProd.Checked then
    self.qrySelParts.ParamByName('all_parts').asString := 'N'
  else
    self.qrySelParts.ParamByName('all_parts').asString := 'Y';

  self.qrySelParts.open;

  self.btnSelect.Enabled := (self.qrySelParts.RecordCount > 0);
end;

procedure TPBLUProdFrm.FormShow(Sender: TObject);
begin
  self.ShowGrid;
end;

procedure TPBLUProdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.qrySelParts.close;
end;

procedure TPBLUProdFrm.GridTimerTimer(Sender: TObject);
begin
  GridTimer.Enabled := False;
  ShowGrid;
end;

procedure TPBLUProdFrm.edtProductChange(Sender: TObject);
begin
  GridTimer.Enabled := False;
  GridTimer.Enabled := True;
end;

procedure TPBLUProdFrm.ChkBxExcProdClick(Sender: TObject);
begin
  GridTimer.Enabled := False;
  GridTimer.Enabled := True;
end;

procedure TPBLUProdFrm.btnSelectClick(Sender: TObject);
begin
  if DetsDBGrid.DataSource.DataSet.RecordCount > 0 then
  begin
    self.part := DetsDBGrid.DataSource.DataSet.FieldByName('part').asString;
    self.partDesc := DetsDBGrid.DataSource.DataSet.FieldByName('part_description').asString;
  end;
  self.ModalResult := mrOK;
end;

procedure TPBLUProdFrm.CloseBitBtnClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TPBLUProdFrm.DetsDBGridDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

end.
