unit wtLUAddChgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUAddChgs = class(TForm)
    dbgDetails: TDBGrid;
    srclkpExtras: TDataSource;
    lkpExtras: TFDQuery;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    lkpExtrasExtra_Charge: TIntegerField;
    lkpExtrasDescription: TWideStringField;
    lkpExtrasPrice_pointer: TIntegerField;
    lkpExtrasinactive: TWideStringField;
    lkpExtrasDo_Not_Discount: TWideStringField;
    lkpExtrasAllow_Bespoke_Detail: TWideStringField;
    lkpExtrasUnit_Price: TCurrencyField;
    lkpExtrasUnit_Cost: TCurrencyField;
    lkpExtrasPrice_Unit_Description: TWideStringField;
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure tblExtrasBeforePost(DataSet: TDataSet);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure srclkpExtrasDataChange(Sender: TObject; Field: TField);
    procedure btnExcelClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  frmWTLUAddChgs: TfrmWTLUAddChgs;

implementation

uses wtMaintAddChgs, wtDataModule, wtMain;

{$R *.DFM}

procedure TfrmWTLUAddChgs.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUAddChgs.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  iCode := dbgDetails.datasource.dataset.fieldbyname('Extra_Charge').asinteger;

  try
    frmWTMaintAddChgs := TfrmWTMaintAddChgs.create(Application);
    if FuncMode <> 'A' then
    begin
      frmWTMaintAddChgs.iCode := iCode;
      frmWTMaintAddChgs.PricePointer := srclkpExtras.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintAddChgs.SellPrice := srclkpExtras.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintAddChgs.CostPrice := srclkpExtras.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintAddChgs.iCode := 0;
      frmWTMaintAddChgs.PricePointer := 0;
      frmWTMaintAddChgs.SellPrice := 0.00;
      frmWTMaintAddChgs.CostPrice := 0.00;
    end;
    frmWTMaintAddChgs.FunctionMode := FuncMode;
    frmWTMaintAddChgs.showmodal;
    icode := frmWTMaintAddChgs.iCode;
    refresh;
    lkpExtras.Locate('Extra_Charge',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintAddChgs.free;
  end;
end;

procedure TfrmWTLUAddChgs.Refresh;
var
  sText: string;
begin
  with lkpExtras do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Description').asstring :=  '%' + edtName.Text + '%';
      if not chkbxShowInactive.Checked then
        parambyname('inactive').asstring := 'N'
      else
        parambyname('inactive').asstring := 'Y';
      open;
      stsbrDetails.panels[0].text := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TfrmWTLUAddChgs.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUAddChgs.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Extra_Charge WHERE Extra_Charge = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Extra_Charge').asinteger);
            execsql;
          end;
        dtmdlWorktops.DeletePrices(PPointer);
        dtmdlWorktops.DeletePointer(PPointer);
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUAddChgs.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUAddChgs.FormShow(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUAddChgs.FormCreate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUAddChgs.dblkpMaterialTypeClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUAddChgs.tblExtrasBeforePost(DataSet: TDataSet);
begin
(*  if tblExtras.FieldbyName('Price_Pointer').asinteger <> 0 then
    exit;
	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  tblExtras.FieldbyName('Price_Pointer').asinteger := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := tblExtras.FieldbyName('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'A';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tblExtras.Fieldbyname('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;

*)
end;

procedure TfrmWTLUAddChgs.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh
end;

procedure TfrmWTLUAddChgs.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('Do_Not_Discount').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clred;
    end;

  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
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

procedure TfrmWTLUAddChgs.srclkpExtrasDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srclkpExtras.DataSet.recordcount > 0);
  btnDelete.Enabled := (srclkpExtras.DataSet.recordcount > 0);
  btnExcel.Enabled := (srclkpExtras.DataSet.recordcount > 0);
end;

procedure TfrmWTLUAddChgs.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUAddChgs);
end;

procedure TfrmWTLUAddChgs.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUAddChgs.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

end.
