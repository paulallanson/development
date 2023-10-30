unit wtLUCustQuotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, Grids, DBGrids,
  wtQuotesDM, QrCtrls, System.ImageList;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_childclosed   = WM_APP + 102; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmwtLUCustQuotes = class(TForm)
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
    Button1: TButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    imgLstHot: TImageList;
    btnPrint: TToolButton;
    Label1: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    btnCopy: TToolButton;
    dbgDetails: TDBGrid;
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
  private
    FCustomer: integer;
    FParentForm: TForm;
    FDisableNameChangeEvent: boolean;
    FCustomerName: string;
    procedure SetCustomer(const Value: integer);
    procedure SetParentForm(const Value: TForm);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TqMode);
    procedure SetCustomerName(const Value: string);
    { Private declarations }
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmwtLUCustQuotes: TfrmwtLUCustQuotes;

implementation

uses WtMaintQuote;

{$R *.DFM}

{ TfrmLUQuotes }

procedure TfrmwtLUCustQuotes.luCustomersParentClosed(var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmwtLUCustQuotes.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlQuote.Customer := FCustomer;
  dtmdlQuote.RefreshAllData;
end;

procedure TfrmwtLUCustQuotes.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUCustQuotes.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmwtLUCustQuotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Childclosed, left, Top);
  Action := caFree;
end;

procedure TfrmwtLUCustQuotes.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUCustQuotes.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  dtmdlQuote := TdtmdlQuote.create(self);
  dbgDetails.Datasource := dtmdlQuote.dtsAllQuotes;
  dtmdlQuote.dtsAllQuotes.OnDataChange := SetButtons;
end;

procedure TfrmwtLUCustQuotes.FormDestroy(Sender: TObject);
begin
  dtmdlQuote.free;
end;

procedure TfrmwtLUCustQuotes.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlQuote.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUCustQuotes.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlQuote.refreshAlldata;
end;

procedure TfrmwtLUCustQuotes.FormShow(Sender: TObject);
begin
  dtmdlQuote.RefreshAlldata;
  edtSearch.setfocus;
end;

procedure TfrmwtLUCustQuotes.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlQuote do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;
procedure TfrmwtLUCustQuotes.CallMaintScreen(aMode : TqMode);
var
  Key : integer;
  frm : TfrmWtMaintQuote;
  aQuote : TQuote;
//  sWarning: string;
begin
  if aMode = qAdd then
    Key := 0
  else
    Key := dtmdlQuote.CurrentCQuote;

  try
    aQuote := TQuote.Create(dtmdlQuote);
    try
      aQuote.DbKey := key;
      aQuote.LoadFromDB;
      Frm := TfrmwtMaintQuote.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Quote := aQuote;
        Frm.ShowModal;
        Key := aQuote.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aQuote.Free;
    end;
  finally
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(Key)),[lopartialKey]) ;
  end;
end;

procedure TfrmwtLUCustQuotes.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(qChange);
end;

procedure TfrmwtLUCustQuotes.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(qAdd);
end;

procedure TfrmwtLUCustQuotes.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmwtLUCustQuotes.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  dtmdlQuote.CustomerName := FCustomerName;
end;

end.
