unit WTMaintPurchaseOrderGRN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmWTMaintPurchaseOrderGRN = class(TForm)
    Panel1: TPanel;
    pnlHeader: TPanel;
    pnlFunctions: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    edtDateRequired: TEdit;
    btnDateRequired: TBitBtn;
    Label4: TLabel;
    Edit3: TEdit;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    dblkpOperator: TDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTMaintPurchaseOrderGRN: TfrmWTMaintPurchaseOrderGRN;

implementation

{$R *.dfm}

end.
