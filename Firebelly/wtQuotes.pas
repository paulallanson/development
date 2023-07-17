unit wtQuotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, Grids, DBGrids, ExtCtrls, QrCtrls;

type
  TfrmWTQuotes = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    imgLstHot: TImageList;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
  public
    { Public declarations }
  end;

var
  frmWTQuotes: TfrmWTQuotes;

implementation

uses wtMaintQuote, WTQuotesDM;

{$R *.DFM}

procedure TfrmWTQuotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dtmdlQuote.qryQuotes.active := false;
  dtmdlQuote.free;
end;

procedure TfrmWTQuotes.FormCreate(Sender: TObject);
begin
  dtmdlQuote := TdtmdlQuote.create(self);
end;

procedure TfrmWTQuotes.FormShow(Sender: TObject);
begin
  dtmdlQuote.qryQuotes.active := true;
end;

procedure TfrmWTQuotes.ToolButton1Click(Sender: TObject);
begin
  frmWTMaintQuote := TfrmWTMaintQuote.create(application);
  try
    frmWTMaintQuote.showmodal;
  finally
    frmWTMaintQuote.free;
  end;
end;

procedure TfrmWTQuotes.ToolButton2Click(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTQuotes.CallMaintScreen(FuncMode: string);
begin
  {};
end;

end.
