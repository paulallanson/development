unit wtLUQuoteSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, WTQuotesDM;

type
  TfrmWTLUQuoteSQL = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    edtNumber: TEdit;
    Button1: TButton;
    btnSearch: TBitBtn;
    chkbxHighImportance: TCheckBox;
    dbgDetails: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ActiveCode: integer;
  public
    { Public declarations }
  end;

var
  frmWTLUQuoteSQL: TfrmWTLUQuoteSQL;
  dtmdlAllQuote: TdtmdlQuote;

implementation

{$R *.dfm}

procedure TfrmWTLUQuoteSQL.FormActivate(Sender: TObject);
begin
  dtmdlAllQuote.RefreshAlldata;

(*  dbgDetails.datasource.DataSet.locate('Quote', Variant(inttostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
*)
end;

procedure TfrmWTLUQuoteSQL.FormCreate(Sender: TObject);
begin
  dtmdlAllQuote := TdtmdlQuote.create(Application);
end;

procedure TfrmWTLUQuoteSQL.FormDestroy(Sender: TObject);
begin
  dtmdlAllQuote.free;

end;

end.
