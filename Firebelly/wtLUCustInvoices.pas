unit wtLUCustInvoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, QrCtrls;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Invoicesclosed   = WM_APP + 105; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmwtLUCustInvoices = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    btnPrint: TToolButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    edtSearch: TEdit;
    stsBrDetails: TStatusBar;
    imgLstHot: TImageList;
    tmrSearch: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    FCustomer: integer;
    FParentForm: TForm;
    procedure SetCustomer(const Value: integer);
    procedure SetParentForm(const Value: TForm);
    { Private declarations }
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  public
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmwtLUCustInvoices: TfrmwtLUCustInvoices;

implementation

{$R *.DFM}

{ TfrmwtLUCustInvoices }

procedure TfrmwtLUCustInvoices.luCustomersParentClosed(
  var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmwtLUCustInvoices.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmwtLUCustInvoices.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmwtLUCustInvoices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Invoicesclosed, left, Top);
  Action := caFree;
end;

procedure TfrmwtLUCustInvoices.Button1Click(Sender: TObject);
begin
  close;
end;

end.
