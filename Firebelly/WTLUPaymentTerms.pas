unit WTLUPaymentTerms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUPaymentTerms = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    srcPaymentTerms: TDataSource;
    qryPaymentTerms: TFDQuery;
    qryDelete: TFDQuery;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcPaymentTermsDataChange(Sender: TObject; Field: TField);
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
  frmWTLUPaymentTerms: TfrmWTLUPaymentTerms;

implementation

uses
  WTMaintPaymentTerms, wtMain, System.UITypes;

{$R *.dfm}

procedure TfrmWTLUPaymentTerms.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Payment_Terms').asinteger;
  try
    frmWTMaintPaymentTerms := TfrmWTMaintPaymentTerms.create(Application);
    frmWTMaintPaymentTerms.FunctionMode := FuncMode;
    frmWTMaintPaymentTerms.showmodal;
    iCode := frmWTMaintPaymentTerms.iCode;
    refresh;
    qryPaymentTerms.Locate('Payment_Terms',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintPaymentTerms.free;
  end;
end;

procedure TfrmWTLUPaymentTerms.Refresh;
begin
  qryPaymentTerms.close;
  qryPaymentTerms.open;
  stsbrDetails.panels[0].text := inttostr(qryPaymentTerms.recordcount) + ' records displayed';
end;
procedure TfrmWTLUPaymentTerms.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUPaymentTerms.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUPaymentTerms.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Payment_Terms WHERE Payment_Terms = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Payment_Terms').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Payment_Terms_Description').asstring
                    + ' payment terms has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUPaymentTerms.BitBtn4Click(Sender: TObject);
begin
  close;

end;

procedure TfrmWTLUPaymentTerms.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUPaymentTerms.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUPaymentTerms.srcPaymentTermsDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.enabled := (srcPaymentTerms.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcPaymentTerms.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcPaymentTerms.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUPaymentTerms.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUPaymentTerms.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUPaymentTerms);
end;

end.
