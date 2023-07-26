unit PBMaintProductionProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBMaintProductionProcess = class(TForm)
    lstbxPProcesses: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxProcesses: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryProcesses: TFDQuery;
    dtsProcesses: TDataSource;
    lstbxPProcessesCodes: TListBox;
    lstbxProcessesCodes: TListBox;
    Label3: TLabel;
    lblProduction: TLabel;
    qryAdd: TFDQuery;
    qryDummy: TFDQuery;
    qryProdProcess: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxProcessesClick(Sender: TObject);
    procedure lstbxPProcessesClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    procedure SaveToDB;
    procedure DeleteFromDB;
    procedure RefreshData;
    procedure RefreshProcessData;
    { Private declarations }
  public
    productionType: integer;
    productionDesc: string;
  end;

var
  frmPBMaintProductionProcess: TfrmPBMaintProductionProcess;

implementation

{$R *.dfm}

procedure TfrmPBMaintProductionProcess.FormActivate(Sender: TObject);
begin
  lblProduction.caption := productionDesc;
  RefreshData;
  RefreshProcessData;
end;

procedure TfrmPBMaintProductionProcess.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TfrmPBMaintProductionProcess.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxPProcesses.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Production_Type').asinteger := ProductionType;
        parambyname('Process_no').asinteger := i+1;
        parambyname('Process').asinteger := strtoint(lstbxPProcessesCodes.items[i]);
        execsql;
      end;
    end;
end;

procedure TfrmPBMaintProductionProcess.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Production_Type').asinteger := ProductionType;
      execsql;
    end;
end;

procedure TfrmPBMaintProductionProcess.RefreshData;
begin
  with qryProdProcess do
    begin
      close;
      parambyname('Production_type').asinteger := ProductionType;
      open;
      lstbxPProcesses.clear;
      lstbxPProcesses.clear;

      while eof <> true do
        begin
          lstbxPProcesses.Items.add(fieldbyname('Process_Description').asstring);
          lstbxPProcessesCodes.Items.add(fieldbyname('Process').asstring);
          next;
        end;
    end;
end;

procedure TfrmPBMaintProductionProcess.RefreshProcessData;
var
  i: integer;
begin
  lstbxProcesses.clear;
  lstbxProcessesCodes.clear;

  with qryProcesses do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add('WHERE Process NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxPProcessesCodes.items.count) do
        begin
          sql.add(', ' + lstbxPProcessesCodes.items[i]);
        end;
      sql.add(')');
      open;
      while eof <> true do
        begin
          lstbxProcesses.Items.Add(fieldbyname('Process_Description').asstring);
          lstbxProcessesCodes.Items.Add(fieldbyname('Process').asstring);
          next;
        end;
    end;

end;

procedure TfrmPBMaintProductionProcess.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxProcesses.items.count) do
    begin
      if lstbxProcesses.Selected[i] then
        begin
          lstbxPProcesses.Items.Add(lstbxProcesses.items[i]);
          lstbxPProcessesCodes.Items.Add(lstbxProcessesCodes.items[i]);
        end;
    end;
  RefreshProcessData;
end;

procedure TfrmPBMaintProductionProcess.lstbxProcessesClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxProcesses.SelCount > 0)
end;

procedure TfrmPBMaintProductionProcess.lstbxPProcessesClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxPProcesses.SelCount > 0)

end;

procedure TfrmPBMaintProductionProcess.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxPProcesses.items.count) downto 0 do
    begin
      if lstbxPProcesses.Selected[i] then
        begin
          lstbxPProcesses.Items.Delete(i);
          lstbxPProcessesCodes.Items.Delete(i);
        end;
    end;
  RefreshProcessData;

end;

end.
