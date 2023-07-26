unit wtMaintJobComplete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, wtJobsDm, DBCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintJobComplete = class(TForm)
    Label1: TLabel;
    edtJobNumber: TEdit;
    Label2: TLabel;
    edtDescription: TMemo;
    Label3: TLabel;
    edtCustomerName: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    Label4: TLabel;
    Label5: TLabel;
    edtFittingDate: TEdit;
    dtpckFitting: TDateTimePicker;
    Label6: TLabel;
    edtReference: TEdit;
    Label7: TLabel;
    memInstallAdd: TMemo;
    Label8: TLabel;
    edtDate: TEdit;
    Label9: TLabel;
    dblkpOperator: TDBLookupComboBox;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FJob: TJob;
    procedure SetJob(const Value: TJob);
    procedure ShowDetails;
    function ShowNotes(TempNotes: integer): string;
    { Private declarations }
  public
    property Job: TJob read FJob write SetJob;
  end;

var
  frmWTMaintJobComplete: TfrmWTMaintJobComplete;

implementation

uses wtMain, allCommon, wtNotesDM;

{$R *.dfm}

{ TfrmWTMaintJobComplete }

procedure TfrmWTMaintJobComplete.SetJob(const Value: TJob);
begin
  FJob := Value;
end;

procedure TfrmWTMaintJobComplete.FormActivate(Sender: TObject);
begin
  qryOperator.Close;
  qryOperator.open;

  ShowDetails;
end;

procedure TfrmWTMaintJobComplete.ShowDetails;
begin
  edtJobNumber.text := inttostr(Job.dbKey);
  edtDate.text := paDateStr(Job.JDate);
  dtpckfitting.Date := date;
  edtFittingDate.text := paDateStr(Job.InstallDate);

  edtReference.text := Job.Reference;
  dblkpOperator.KeyValue := frmwtMain.operator;
  edtCustomerName.text := Job.CustomerName;
  edtDescription.text := Job.description;

  memInstallAdd.Text := ShowNotes(Job.InstallAddress);

end;

function TfrmWTMaintJobComplete.ShowNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.DataInfo;
  finally
    Notes.free;
  end;
end;

procedure TfrmWTMaintJobComplete.btnOKClick(Sender: TObject);
begin
  Job.Status := 50;
  Job.ActInstallDate := dtpckFitting.Date;
  job.SaveStatustoDB;
end;

end.
