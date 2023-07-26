unit PBSendtoExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, OleCtnrs, Grids, DBGrids, CCSCommon,
  Buttons, DB;

type
  TfrmPBSendtoExcel = class(TForm)
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    procedure FormActivate(Sender: TObject);
  private
    procedure ExportQueryToExcel;
    procedure ExportToExcel;
    { Private declarations }
  public
    ExportDBGrid: TDBGrid;
    ExportStrGrid: TStringGrid;
    ExportFormCaption: string;
    ExportType: string;
  end;

var
  frmPBSendtoExcel: TfrmPBSendtoExcel;

implementation

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

{$R *.dfm}

procedure TfrmPBSendtoExcel.FormActivate(Sender: TObject);
begin
  if ExportType = 'S' then
    ExportToExcel
  else
    ExportQueryToExcel;
end;

procedure TfrmPBSendtoExcel.ExportQueryToExcel;
var
  icol, icolcount: integer;
  tmpQuery: TFDQuery;
  tmpDBField: TField;
  tempFileName: string;
  tempStr: string;
  tempField: string;
  exportFile: textFile;
  SavePlace: TBookmark;
  tmpDataSrc: TDataSource;
begin
//  tmpQuery := TFDQuery.Create(self);
  tmpQuery :=(ExportDBGrid.datasource.dataset as TFDQuery);
  tmpDataSrc := (ExportDBGrid.datasource as TDataSource);

  prgbrExport.Max := tmpQuery.RecordCount;
  tempFileName := getWinTempDir + ExportFormCaption + formatdatetime('yymmddhhmmss',now)+'.csv';

  pnlExportPrgrss.Visible := true;
  pnlExportPrgrss.Repaint;

  assignFile(exportFile, tempfileName);
  rewrite(exportFile);

  icolcount := exportDBGrid.Columns.Count;

  tempstr := '';
  for icol := 0 to pred(icolcount) do
    begin
      if icol = 0 then
        tempstr := tempStr + '"' + exportDBGrid.Columns.Items[icol].Title.caption + '"'
      else
        tempstr := tempStr + ',"' + exportDBGrid.Columns.Items[icol].Title.caption + '"';
    end;

  writeLn(exportFile, tempStr);

  // Set place in database to return back to
  SavePlace := tmpQuery.GetBookmark;
  tmpQuery.DisableControls;

  {Now export the data}
  with tmpQuery do
    begin
      first;
      while eof <> true do
        begin
          tempstr := '';
          for icol := 0 to pred(icolcount) do
            begin
//              tempField := exportDBGrid.Columns.Items[icol].FieldName;

              try
                if icol = 0 then
//                  tempstr := tempStr + '"' + fieldbyname(tempField).asstring + '"'
                  tempstr := tempStr + '"' + exportDBGrid.Columns.Items[icol].Field.text + '"'
                else
//                  tempstr := tempstr + ',"' + fieldbyname(tempField).asstring + '"'
                  tempstr := tempstr + ',"' + exportDBGrid.Columns.Items[icol].Field.text + '"'
              except
                if icol = 0 then
                  tempstr := tempstr + ',"' + '' + '"'
                else
                  tempstr := tempstr + ',"' + '' + '"';
              end;
            end;
          writeLn(exportFile, tempStr);
          prgbrExport.StepIt;
          next;
        end;
    end;

  tmpQuery.EnableControls;
  tmpQuery.GotoBookmark(SavePlace);

  CloseFile(exportFile);

  lblExporting.caption := 'Please wait, loading Excel .....';
  lblExporting.Repaint;
  OleContainer1.CreateLinkToFile(tempFileName, false);
  OleContainer1.DoVerb(0);
end;

procedure TfrmPBSendtoExcel.ExportToExcel;
var
  irow, icol, icolcount: integer;
  tempFileName: string;
  tempStr: string;
  tempField: string;
  exportFile: textFile;
begin

  prgbrExport.Max := exportStrGrid.RowCount - 1;
  tempFileName := getWinTempDir + ExportFormCaption + formatdatetime('yymmddhhmmss',now)+'.csv';

  pnlExportPrgrss.Visible := true;
  pnlExportPrgrss.Repaint;

  assignFile(exportFile, tempfileName);
  rewrite(exportFile);

  icolcount := exportStrGrid.ColCount;

  tempstr := '';
  for icol := 0 to pred(icolcount) do
    begin
      if icol = 0 then
        tempstr := tempStr + '"' + exportStrGrid.Cells[icol,0] + '"'
      else
        tempstr := tempStr + ',"' + exportStrGrid.Cells[icol,0] + '"';
    end;

  writeLn(exportFile, tempStr);

  {Now export the data}
  with exportStrGrid do
    begin
      for irow := 1 to rowcount -1 do
        begin
          tempstr := '';
          for icol := 0 to pred(icolcount) do
            begin
              try
                if icol = 0 then
                  tempstr := tempStr + '"' + exportStrGrid.Cells[icol,irow] + '"'
                else
                  tempstr := tempstr + ',"' + exportStrGrid.Cells[icol,irow] + '"'
              except
                if icol = 0 then
                  tempstr := tempstr + ',"' + '' + '"'
                else
                  tempstr := tempstr + ',"' + '' + '"';
              end;
            end;
          writeLn(exportFile, tempStr);
          prgbrExport.StepIt;
        end;
    end;

  CloseFile(exportFile);

  lblExporting.caption := 'Please wait, loading Excel .....';
  lblExporting.Repaint;
  OleContainer1.CreateLinkToFile(tempFileName, false);
  OleContainer1.DoVerb(0);
end;

end.
