unit CCSProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, OleCtnrs;

type
  TfrmCCSProgressBar = class(TForm)
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    Label1: TLabel;
    OleContainer1: TOleContainer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCCSProgressBar: TfrmCCSProgressBar;

implementation

{$R *.dfm}

end.
