unit PBLUInvFactoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, Menus, ImgList, ComCtrls, ToolWin, Grids, INIFiles,
  DBGrids, StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList;

type
  TPBLUInvFactoringFrm = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    cmbFactorFiles: TComboBox;
    Panel3: TPanel;
    DetsDBGrid: TDBGrid;
    SIStatusBar: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnExport: TToolButton;
    ToolButton2: TToolButton;
    btnClose: TToolButton;
    ImgHot: TImageList;
    ImgCool: TImageList;
    qrySelFactorFileList: TFDQuery;
    qrySelInvs: TFDQuery;
    dtsrcGrid: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure cmbFactorFilesChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuildFactorFileList;
    procedure RefreshGrid;
    procedure ReCreateFactorFile;
    function GetPath: string;
    function ParsePathName(path: string): string;
  public
    { Public declarations }
  end;

var
  PBLUInvFactoringFrm: TPBLUInvFactoringFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

procedure TPBLUInvFactoringFrm.BuildFactorFileList;
begin
  cmbFactorFiles.Items.Clear;
  self.qrySelFactorFileList.Active := false;
  self.qrySelFactorFileList.Active := true;

  while not self.qrySelFactorFileList.Eof do
  begin
    cmbFactorFiles.Items.Add(
          self.qrySelFactorFileList.FieldByName('factoring_date').asString+
          ' - ' +
          self.qrySelFactorFileList.FieldByName('factoring_filename').asString);
    self.qrySelFactorFileList.next;
  end;
end;

procedure TPBLUInvFactoringFrm.FormShow(Sender: TObject);
begin
  self.BuildFactorFileList;
end;

procedure TPBLUInvFactoringFrm.cmbFactorFilesChange(Sender: TObject);
begin
  self.RefreshGrid;
end;

procedure TPBLUInvFactoringFrm.RefreshGrid;
begin
  self.qrySelInvs.Active := false;

  self.qrySelFactorFileList.First;
  self.qrySelFactorFileList.MoveBy(self.cmbFactorFiles.ItemIndex);

  self.qrySelInvs.ParamByName('factoring_filename').asString :=
    self.qrySelFactorFileList.FieldByName('factoring_filename').asString;
  self.qrySelInvs.active := true;

  self.btnExport.Enabled := (self.qrySelInvs.RecordCount > 0);
end;

procedure TPBLUInvFactoringFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUInvFactoringFrm.btnExportClick(Sender: TObject);
begin
  self.ReCreateFactorFile;
end;

procedure TPBLUInvFactoringFrm.ReCreateFactorFile;
var
  factorFile: TextFile;
  tempStr: string;
begin
  tempStr := self.GetPath;
  tempStr := self.ParsePathName(tempStr);

  self.qrySelFactorFileList.First;
  self.qrySelFactorFileList.MoveBy(self.cmbFactorFiles.ItemIndex);

  tempStr := tempStr + self.qrySelFactorFileList.FieldByName('factoring_filename').asString;

  try
    deleteFile(tempStr)
  except

  end;

  assignFile(factorFile, tempStr);
  rewrite(factorFile);

  self.qrySelInvs.first;
  while not self.qrySelInvs.eof do
  begin
    tempStr := self.qrySelInvs.fieldByName('Sales_Invoice_No').asString;
    tempStr := tempStr + ',' +self.qrySelInvs.fieldByName('Invoice_Date').asString;
    tempStr := tempStr + ',' +self.qrySelInvs.fieldByName('Customer_Name').asString;
    tempStr := tempStr + ',' +self.qrySelInvs.fieldByName('Goods_Value').asString;
    tempStr := tempStr + ',' +self.qrySelInvs.fieldByName('Vat_Value').asString;
    tempStr := tempStr + ',' +self.qrySelInvs.fieldByName('Total_Value').asString;

    WriteLn(factorFile, tempStr);

    self.qrySelInvs.next;
  end;
  CloseFile(factorFile);

  messageDlg('Factor File created containing ' + IntToStr(self.qrySelInvs.recordCount) + ' invoice(s).', mtInformation, [mbOK], 0);
end;

function TPBLUInvFactoringFrm.GetPath: string;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    Result := IniFile.ReadString('Invoice Factoring', 'File Path', '');
  finally
    IniFile.Free;
  end;
end;

function TPBLUInvFactoringFrm.ParsePathName(path: string): string;
var
  inx: integer;
  tempStr: string;
begin
  tempStr := '';
  inx := pos('\', path);

  while inx <> 0 do
  begin
    tempStr := tempStr + copy(path, 1, inx);
    delete(path, 1, inx);
    inx := pos('\', path);
  end;
  result := tempStr;
end;

end.
