unit wtLUDiscounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUDiscounts = class(TForm)
    dbgDetails: TDBGrid;
    srcDiscounts: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryDiscounts: TFDQuery;
    qryDelete: TFDQuery;
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
    procedure FormCreate(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLUDiscounts: TfrmwtLUDiscounts;

implementation

uses
  System.UITypes, System.Types,
  wtMain, wtMaintDiscounts;

{$R *.dfm}

procedure TfrmwtLUDiscounts.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUDiscounts.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Discount').asinteger;
  try
    frmWTMaintDiscounts := TfrmWTMaintDiscounts.create(Application);
    frmWTMaintDiscounts.FunctionMode := FuncMode;
    frmWTMaintDiscounts.showmodal;
    iCode := frmWTMaintDiscounts.iCode;
    Refresh;
    qryDiscounts.Locate('Discount',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintDiscounts.free;
  end;
end;

procedure TfrmwtLUDiscounts.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUDiscounts.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Discount WHERE Discount = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Discount').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Discount_Label').asstring
                    + ' discount has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmwtLUDiscounts.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUDiscounts.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUDiscounts.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUDiscounts.Refresh;
begin
  qryDiscounts.close;
  if not chkbxShowInactive.Checked then
    begin
      qryDiscounts.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryDiscounts.parambyname('inactive').asstring := 'Y';
    end;

  qryDiscounts.open;
  stsbrDetails.panels[0].text := inttostr(qryDiscounts.recordcount) + ' records displayed';
end;

procedure TfrmwtLUDiscounts.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUDiscounts.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmwtLUDiscounts.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmwtLUDiscounts.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUDiscounts);
end;

end.
