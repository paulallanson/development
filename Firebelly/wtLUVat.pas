unit wtLUVat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmwtLUVat = class(TForm)
    dbgDetails: TDBGrid;
    srcVat: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryVat: TQuery;
    qryDelete: TQuery;
    qryVatDescription: TStringField;
    qryVatVat_Rate: TFloatField;
    qryVatinactive: TStringField;
    qryVatVat: TIntegerField;
    qryVatVat_Code: TStringField;
    qryVatInvoice_Text: TStringField;
    qryVatReverse_Charge: TStringField;
    qryVatReverse_Charge_Vat_Rate: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  frmwtLUVat: TfrmwtLUVat;

implementation

uses wtMaintVat, wtMain;

{$R *.dfm}

procedure TfrmwtLUVat.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUVat.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('VAT').asinteger;
  try
    frmWTMaintVAT := TfrmWTMaintVAT.create(Application);
    frmWTMaintVAT.FunctionMode := FuncMode;
    frmWTMaintVAT.showmodal;
    iCode := frmWTMaintVAT.iCode;
    Refresh;
    qryVat.Locate('VAT',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintVAT.free;
  end;
end;

procedure TfrmwtLUVat.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUVat.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Vat WHERE Vat = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Vat').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Description').asstring
                    + ' VAT has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmwtLUVat.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUVat.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUVat.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUVat.Refresh;
begin
  qryVAT.close;
  if not chkbxShowInactive.Checked then
    begin
      qryVAT.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryVAT.parambyname('inactive').asstring := 'Y';
    end;

  qryVAT.open;
  stsbrDetails.panels[0].text := inttostr(qryVAT.recordcount) + ' records displayed';
end;

procedure TfrmwtLUVat.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUVat.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  StrPCopy(txt, Column.field.text);
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmwtLUVat.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUVAT);
end;

end.
