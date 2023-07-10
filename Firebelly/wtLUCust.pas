unit wtLUCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, ImgList, ToolWin, gtQrCtrls;

type
  TfrmWTLUCust = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    imgLstHot: TImageList;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    dbgdCustomers: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
  public
    { Public declarations }
  end;

var
  frmWTLUCust: TfrmWTLUCust;

implementation

uses wtDatabaseDM, wtCustomerDM, wtMaintCust;

{$R *.DFM}

procedure TfrmWTLUCust.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dtmdlCustomer.tblCustomer.active := false;
  dtmdlCustomer.free;
end;

procedure TfrmWTLUCust.FormCreate(Sender: TObject);
begin
  dtmdlCustomer := TdtmdlCustomer.create(self);
  dtmdlCustomer.tblCustomer.active:= true;
end;

procedure TfrmWTLUCust.FormShow(Sender: TObject);
begin
  dtmdlCustomer.qryCustomer.active := true;
end;

procedure TfrmWTLUCust.ToolButton1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCust.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintCust1 := TfrmWTMaintCust1.create(Application);
    frmWTMaintCust1.FunctionMode := FuncMode;
    frmWTMaintCust1.showmodal
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCust1.free;
  end;
end;

procedure TfrmWTLUCust.ToolButton2Click(Sender: TObject);
begin
  CallMaintScreen('C');
end;

end.
