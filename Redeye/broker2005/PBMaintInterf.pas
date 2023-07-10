unit PBMaintInterf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, DB, DBTables, DBCtrls, ComCtrls;

type
  TPBMaintInterfFrm = class(TForm)
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    GetDetsSQL: TQuery;
    UpdDetsSQL: TQuery;
    AccPkgSQL: TQuery;
    AccPkgSRC: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AccPkgDBLookupComboBox: TDBLookupComboBox;
    ImportEdit: TEdit;
    ExportEdit: TEdit;
    BrowseBitBtn: TBitBtn;
    browse2BitBtn: TBitBtn;
    LastFileInvSpinEdit: TSpinEdit;
    LastFileAccSpinEdit: TSpinEdit;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    edtDataTransfer: TEdit;
    btnBrowse: TBitBtn;
    GroupBox3: TGroupBox;
    dblkpSchedule: TDBLookupComboBox;
    Label7: TLabel;
    qrySchedPackage: TQuery;
    dtsSchedPackage: TDataSource;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    LastFileDDSpinEdit: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure BrowseBitBtnClick(Sender: TObject);
    procedure browse2BitBtnClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBMaintInterfFrm: TPBMaintInterfFrm;

implementation

uses pbDatabase, CCSCommon, pbMainMenu;

{$R *.DFM}

procedure TPBMaintInterfFrm.FormActivate(Sender: TObject);
begin
  If dmBroker.iAccCtrl = 1 then
        begin
        if MessageDlg('Changing the settings on this screen can cause the ' +
                'interfaces to corrupt. ' +
                'Sure you want to continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                begin
                PostMessage(Handle, WM_Close, 0, 0);
                Exit;
                end;
        end;
  with AccPkgSQL do
  begin
    Close;
    Open;
  end;

  with qrySchedPackage do
  begin
    Close;
    Open;
  end;

  with GetDetsSQL do
  begin
    Close;
    Open;
    First;
    if EOF then
    begin
      MessageDlg('There are no Companies set-up', mtError, [mbOK], 0);
      Close;
      Exit;
    end;
    if RecordCount > 1 then
    begin
      MessageDlg('There is more than 1 Company set-up. ' +
        'ALL Companies will be updated.', mtWarning, [mbOK], 0);
    end;
    if FieldByName('Accounts_Package').AsString = '' then
      AccPkgDBLookupComboBox.KeyValue := 0
    else
      AccPkgDBLookupComboBox.KeyValue :=
        FieldByName('Accounts_Package').AsString;

    if FieldByName('Schedule_Package').AsString = '' then
      dblkpSchedule.KeyValue := 0
    else
      dblkpSchedule.KeyValue := FieldByName('Schedule_Package').AsString;

    ImportEdit.Text := FieldByName('Data_Import_Directory').AsString;
    ExportEdit.Text := FieldByName('Data_Export_Directory').AsString;
    edtDataTransfer.Text := FieldByName('Data_Transfer_Directory').AsString;
    LastFileInvSpinEdit.Value := FieldByName('Last_File_No_Inv').AsInteger;
    LastFileAccSpinEdit.Value := FieldByName('Last_File_No_Acc').AsInteger;
    LastFileDDSpinEdit.Value := FieldByName('Last_File_No_Direct_Debit').AsInteger;
  end;
  dmBroker.ScreenAccessControl(Self,'mnuSystem',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintInterfFrm.OKBitBtnClick(Sender: TObject);
begin
  with UpdDetsSQL do
  begin
    Close;
    ParamByName('Data_Import_Directory').AsString := ImportEdit.Text;
    ParamByName('Data_Export_Directory').AsString := ExportEdit.Text;
    ParamByName('Last_File_No_Direct_Debit').AsInteger := LastFileDDSpinEdit.Value;
    ParamByName('Last_File_No_Inv').AsInteger := LastFileInvSpinEdit.Value;
    ParamByName('Last_File_No_Acc').AsInteger := LastFileAccSpinEdit.Value;
    ParamByName('Data_Transfer_Directory').AsString := edtDataTransfer.text;
    if AccPkgDBLookupComboBox.text = '' then
      ParamByName('Accounts_Package').Clear
    else
      ParamByName('Accounts_Package').AsString :=
        AccPkgDBLookupComboBox.KeyValue;

    if dblkpSchedule.text = '' then
      ParamByName('Schedule_Package').Clear
    else
      ParamByName('Schedule_Package').AsString := dblkpSchedule.KeyValue;
    ExecSQL;
  end;
  Close;
end;

procedure TPBMaintInterfFrm.BrowseBitBtnClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := ImportEdit.Text;
    if DirDlg.Execute then
      ImportEdit.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintInterfFrm.browse2BitBtnClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := ExportEdit.Text;
    if DirDlg.Execute then
      ExportEdit.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintInterfFrm.EnableOK(Sender: TObject);
begin
  OKBitBtn.enabled := (AccPkgDBLookupComboBox.keyvalue <> '') and
      (ImportEdit.text <> '') and
      (ExportEdit.text <> '');
end;

procedure TPBMaintInterfFrm.FormShow(Sender: TObject);
begin
  enableOK(self);
end;

procedure TPBMaintInterfFrm.btnBrowseClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtDataTransfer.Text;
    if DirDlg.Execute then
      edtDataTransfer.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintInterfFrm.BitBtn3Click(Sender: TObject);
begin
  dblkpSchedule.KeyValue := -1;
end;

end.

