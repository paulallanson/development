unit wtLUOffer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUOffer = class(TForm)
    dbgDetails: TDBGrid;
    srcSaleOffer: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    tblSalesOffer: TFDTable;
    qryDelete: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    procedure DeleteFromDB(keyID: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLUOffer: TfrmwtLUOffer;

implementation

uses wtMain;

{$R *.dfm}

procedure TfrmwtLUOffer.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUOffer.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  if FuncMode = 'A' then
    iCode := 0
  else
    iCode := dbgDetails.datasource.dataset.fieldbyname('Sale_Offer').asinteger;
    
  try
    frmWTMaintOffer := TfrmWTMaintOffer.create(Application);
    frmWTMaintOffer.FunctionMode := FuncMode;
    frmWTMaintOffer.showmodal;
    Refresh;
    tblSaleOffer.Locate('Sale_Offer',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintOffer.free;
  end;
end;

procedure TfrmwtLUOffer.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUOffer.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DeleteFromDB(tblSaleOffer.fieldbyname('Sale_Offer').AsInteger);
        tblSaleOffer.Delete;
      except
        messagedlg(tblSaleOffer.fieldbyname('Importance_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;

end;

procedure TfrmwtLUOffer.DeleteFromDB(keyID: integer);
begin
  with qryDelete do
    begin
      close;
      parambyname('Sale_Offer').asinteger := keyID;
      execsql;
    end;
end;

procedure TfrmwtLUOffer.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  tblSaleOffer.active := true;
end;

procedure TfrmwtLUOffer.FormDestroy(Sender: TObject);
begin
  tblSaleOffer.active := false;
end;

procedure TfrmwtLUOffer.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUOffer.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUOffer.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUOffer.Refresh;
begin
  tblSaleOffer.Active := false;
  if not chkbxShowInactive.Checked then
    tblSaleOffer.Filter := ' ((inactive = ''N'')' + ' or (inactive is NULL) or (inactive = '' '')) '
  else
    tblSaleOffer.Filter := '';
  tblSaleOffer.Active := true;
  stsbrDetails.panels[0].text := inttostr(tblSaleOffer.recordcount) + ' records displayed';
end;

procedure TfrmwtLUOffer.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUOffer.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmwtLUOffer.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUOffer);
end;

end.
