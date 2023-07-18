unit wtLUCustJobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, Db, QrCtrls,
  System.ImageList;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Jobsclosed   = WM_APP + 104; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmwtLUCustJobs = class(TForm)
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
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FParentForm: TForm;
    FCustomer: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetParentForm(const Value: TForm);
    procedure SetCustomer(const Value: integer);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    { Private declarations }
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmwtLUCustJobs: TfrmwtLUCustJobs;

implementation

uses WTCustJobsDM;

{$R *.DFM}

{ TfrmwtLUCustJobs }

procedure TfrmwtLUCustJobs.luCustomersParentClosed(var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmwtLUCustJobs.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlCustJobs.Customer := FCustomer;
  dtmdlCustJobs.RefreshData;
end;

procedure TfrmwtLUCustJobs.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUCustJobs.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmwtLUCustJobs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Jobsclosed, left, Top);
  Action := caFree;
end;

procedure TfrmwtLUCustJobs.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUCustJobs.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustJobs.refreshdata;
end;

procedure TfrmwtLUCustJobs.FormCreate(Sender: TObject);
begin
  dtmdlCustJobs := TdtmdlCustJobs.create(self);
  dtmdlCustJobs.dtsJobs.OnDataChange := SetButtons;
end;

procedure TfrmwtLUCustJobs.FormDestroy(Sender: TObject);
begin
  dtmdlCustJobs.free;
end;

procedure TfrmwtLUCustJobs.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustJobs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUCustJobs.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmwtLUCustJobs.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustJobs do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;
end.
