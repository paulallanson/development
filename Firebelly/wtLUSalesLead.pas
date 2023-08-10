unit wtLUSalesLead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUSalesLead = class(TForm)
    dbgDetails: TDBGrid;
    srcSalesLead: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qrySalesLeads: TFDQuery;
    qryDelete: TFDQuery;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcSalesLeadDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUSalesLead: TfrmWTLUSalesLead;

implementation

uses UITypes, wtMaintSalesLead, wtMain;

{$R *.dfm}

procedure TfrmWTLUSalesLead.Refresh;
begin
  qrySalesLeads.close;
  if not chkbxShowInactive.Checked then
    begin
      qrySalesLeads.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qrySalesLeads.parambyname('inactive').asstring := 'Y';
    end;

  qrySalesLeads.open;
  stsbrDetails.panels[0].text := inttostr(qrySalesLeads.recordcount) + ' records displayed';
end;


procedure TfrmWTLUSalesLead.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Sales_Lead_Source').asinteger;
  try
    frmWTMaintSalesLead := TfrmWTMaintSalesLead.create(Application);
    frmWTMaintSalesLead.FunctionMode := FuncMode;
    frmWTMaintSalesLead.showmodal;
    iCode := frmWTMaintSalesLead.iCode;
    refresh;
    qrySalesLeads.Locate('Sales_Lead_Source',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintSalesLead.free;
  end;
end;

procedure TfrmWTLUSalesLead.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesLead.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUSalesLead.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Sales_Lead_Source WHERE Sales_Lead_Source = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Sales_Lead_Source').asinteger);
            execsql;
          end;
        refresh;
      except messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Sales_Lead_Source_Descr').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUSalesLead.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUSalesLead.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUSalesLead.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUSalesLead.srcSalesLeadDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcSalesLead.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcSalesLead.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcSalesLead.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUSalesLead.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUSalesLead.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUSalesLead.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUSalesLead);
end;

end.
