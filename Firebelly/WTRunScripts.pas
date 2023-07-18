unit WTRunScripts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRunScripts = class(TForm)
    memQuery: TMemo;
    Button1: TButton;
    Button4: TButton;
    qryRun: TFDQuery;
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTRunScripts: TfrmWTRunScripts;

implementation

{$R *.dfm}

procedure TfrmWTRunScripts.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRunScripts.FormActivate(Sender: TObject);
begin
  memQuery.Clear;
end;

procedure TfrmWTRunScripts.Button1Click(Sender: TObject);
begin
  with qryRun do
    begin
      close;
      sql.Text := memQuery.Text;
      execsql;
    end;
end;

end.
