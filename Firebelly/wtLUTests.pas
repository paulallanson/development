unit wtLUTests;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, Grids, DBGrids, WTJobsDM, QrCtrls;

type
  TfrmwtLUTests = class(TForm)
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
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TjMode);
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmwtLUTests: TfrmwtLUTests;
  dtmdlAllJobs: TdtmdlJob;

implementation

uses WtMaintJobs;

{$R *.DFM}

{ TfrmLUQuotes }

procedure TfrmwtLUTests.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUTests.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmwtLUTests.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUTests.FormCreate(Sender: TObject);
begin
  dtmdlAllJobs := TdtmdlJob.create(Application);
  dbgDetails.DataSource := dtmdlAllJobs.dtsAllJobs;
  dtmdlAllJobs.dtsAllJobs.OnDataChange := SetButtons;
end;

procedure TfrmwtLUTests.FormDestroy(Sender: TObject);
begin
  dtmdlAllJobs.free;
end;

procedure TfrmwtLUTests.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllJobs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUTests.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllJobs.refreshAlldata;
end;

procedure TfrmwtLUTests.FormShow(Sender: TObject);
begin
  dtmdlAllJobs.RefreshAlldata;
  edtSearch.setfocus;
end;

procedure TfrmwtLUTests.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllJobs do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmwtLUTests.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(jChange);
end;

procedure TfrmwtLUTests.CallMaintScreen(aMode : TjMode);
var
  Key : integer;
  frm : TfrmWtMaintJobs;
  aJob : TJob;
begin
  if aMode = jAdd then
    Key := 0
  else
    Key := dtmdlAllJobs.CurrentJob;

  try
    aJob := TJob.Create(dtmdlAllJobs);
    try
      aJob.DbKey := key;
      aJob.LoadFromDB;
      Frm := TfrmwtMaintJobs.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Job := aJob;
        Frm.ShowModal;
        Key := aJob.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;
  end;
end;

procedure TfrmwtLUTests.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(jAdd);
end;

procedure TfrmwtLUTests.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

end.
