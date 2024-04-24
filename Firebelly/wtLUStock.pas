unit wtLUStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, wtStockDM,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList;

type
  TfrmWTLUStock = class(TForm)
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    edtSearch: TEdit;
    stsBrDetails: TStatusBar;
    imgLstHot: TImageList;
    tmrSearch: TTimer;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    btnPrint: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    dtmdlAllStock: TdtmdlStock;
    FDisableNameChangeEvent: boolean;
    procedure CallMaintScreen(aMode: TstkMode);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmWTLUStock: TfrmWTLUStock;

implementation

{$R *.dfm}

procedure TfrmWTLUStock.CallMaintScreen(aMode : TstkMode);
var
  Key : integer;
//  frm : TfrmWtMaintSalesOrder;
//  aSOrder : TSOrder;
//  sWarning: string;
begin
(*  if aMode = sopAdd then
    Key := 0
  else
    Key := dtmdlAllSales.CurrentSOrder;

  try
    aSOrder := TSOrder.Create(dtmdlAllSales);
    try
      aSOrder.DbKey := key;
      aSOrder.LoadFromDB;
      Frm := TfrmwtMaintSalesOrder.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SOrder := aSOrder;
        Frm.ShowModal;
        Key := aSOrder.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aSOrder.Free;
    end;
  finally
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
//    dbgdetails.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(Key)),[lopartialKey]) ;
  end;
*)
end;

procedure TfrmWTLUStock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTLUStock.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUStock.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  dtmdlAllStock := TdtmdlStock.create(Application);
  dbgDetails.DataSource := dtmdlAllStock.dtsAllStock;
  dtmdlAllStock.dtsAllStock.OnDataChange := SetButtons;
end;

procedure TfrmWTLUStock.FormDestroy(Sender: TObject);
begin
  dtmdlAllStock.free;
end;

procedure TfrmWTLUStock.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllStock.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUStock.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllStock.refreshAlldata;
end;

procedure TfrmWTLUStock.FormShow(Sender: TObject);
begin
  dtmdlAllStock.RefreshAlldata;
  edtSearch.setfocus;
end;

procedure TfrmWTLUStock.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllStock do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;
procedure TfrmWTLUStock.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(stkChange);
end;

procedure TfrmWTLUStock.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(stkAdd);
end;

procedure TfrmWTLUStock.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUStock.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUStock.FormActivate(Sender: TObject);
begin
  dtmdlAllStock.RefreshAlldata;
end;

end.
