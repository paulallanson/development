unit WTMaintTrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, ComCtrls, Buttons, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintTrade = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    srcTrade: TDataSource;
    tblTrade: TFDTable;
    Label8: TLabel;
    edtName: TDBEdit;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label28: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit24: TDBEdit;
    procedure EnableOK(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTMaintTrade: TfrmWTMaintTrade;

implementation

uses wtNotesDM;

{$R *.DFM}

procedure TfrmWTMaintTrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTMaintTrade.btnOKClick(Sender: TObject);
begin
  tblTrade.Post;
end;

procedure TfrmWTMaintTrade.FormCreate(Sender: TObject);
begin
  tblTrade.Active := true;

end;

procedure TfrmWTMaintTrade.FormDestroy(Sender: TObject);
begin
  tblTrade.Active := false;
end;

procedure TfrmWTMaintTrade.FormActivate(Sender: TObject);
begin
  tblTrade.Edit;
end;

procedure TfrmWTMaintTrade.EnableOK(Sender: TObject);
begin
  btnOK.Enabled :=  (edtName.Text <> '');
end;

end.
