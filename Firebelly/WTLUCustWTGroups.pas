unit WTLUCustWTGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUCustWTGroups = class(TForm)
    dbgDetails: TDBGrid;
    srcCustWTGroup: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    pnlHeader: TPanel;
    Label1: TLabel;
    lblCustomerName: TLabel;
    Panel2: TPanel;
    btnColours: TBitBtn;
    btnPrices: TBitBtn;
    qryCustWTGroup: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    btnPatch: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcCustWTGroupDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnColoursClick(Sender: TObject);
    procedure btnPricesClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure btnPatchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCustomer: integer;
    FCustomerName: string;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
  end;

var
  frmWTLUCustWTGroups: TfrmWTLUCustWTGroups;

implementation

uses WTMaintCustWTGroup, wtMain, WTMaintCustWTGroupColours,
  WTLUCustWTGroupPrices;

{$R *.dfm}

procedure TfrmWTLUCustWTGroups.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Group_Number').asinteger;
  frmWTMaintCustWTGroup := TfrmWTMaintCustWTGroup.create(Application);
  try
    frmWTMaintCustWTGroup.Customer := self.customer;
    frmWTMaintCustWTGroup.FunctionMode := FuncMode;
    frmWTMaintCustWTGroup.showmodal;
    iCode := frmWTMaintCustWTGroup.iCode;
    Refresh;
    qryCustWTGroup.locate('Customer; Group_Number',VarArrayOf([inttostr(Customer),inttostr(iCode)]),[lopartialKey]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustWTGroup.free;
  end;
end;

procedure TfrmWTLUCustWTGroups.Refresh;
begin
  qryCustWTGroup.close;
  qryCustWTGroup.parambyname('Customer').asinteger := self.Customer;
  qryCustWTGroup.parambyname('Group_Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryCustWTGroup.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryCustWTGroup.parambyname('inactive').asstring := 'Y';
    end;

  qryCustWTGroup.open;
  stsbrDetails.panels[0].text := inttostr(qryCustWTGroup.recordcount) + ' records displayed';
end;

procedure TfrmWTLUCustWTGroups.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustWTGroups.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustWTGroups.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Customer_Worktop_Group WHERE Customer = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Customer').asinteger) +
                        ' AND Group_Number = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Group_Number').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Group_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUCustWTGroups.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUCustWTGroups.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustWTGroups.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUCustWTGroups.srcCustWTGroupDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcCustWTGroup.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcCustWTGroup.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcCustWTGroup.DataSet.RecordCount > 0);
  btnColours.enabled := (srcCustWTGroup.DataSet.RecordCount > 0);
  btnPrices.enabled := (srcCustWTGroup.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUCustWTGroups.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustWTGroups.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUCustWTGroups.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUCustWTGroups);
end;

procedure TfrmWTLUCustWTGroups.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTLUCustWTGroups.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  lblCustomerName.Caption := CustomerName;
end;

procedure TfrmWTLUCustWTGroups.btnColoursClick(Sender: TObject);
begin
  frmWTMaintCustWTGroupColours := TfrmWTMaintCustWTGroupColours.create(self);
  try
    frmWTMaintCustWTGroupColours.Customer := self.Customer;
    frmWTMaintCustWTGroupColours.GroupCode := qryCustWTGroup.fieldbyname('Group_Number').asinteger;
    frmWTMaintCustWTGroupColours.GroupName := qryCustWTGroup.fieldbyname('Group_Description').asstring;
    frmWTMaintCustWTGroupColours.MaterialType := qryCustWTGroup.fieldbyname('Material_Type').asinteger;
    frmWTMaintCustWTGroupColours.showmodal
  finally
    frmWTMaintCustWTGroupColours.free;
  end;

end;

procedure TfrmWTLUCustWTGroups.btnPricesClick(Sender: TObject);
begin
  frmWTLUCustWTGroupPrices := TfrmWTLUCustWTGroupPrices.create(self);
  try
    frmWTLUCustWTGroupPrices.Customer := self.Customer;
    frmWTLUCustWTGroupPrices.GroupCode := qryCustWTGroup.fieldbyname('Group_Number').asinteger;
    frmWTLUCustWTGroupPrices.GroupName := qryCustWTGroup.fieldbyname('Group_Description').asstring;
    frmWTLUCustWTGroupPrices.MaterialType := qryCustWTGroup.fieldbyname('Material_Type').asinteger;
    frmWTLUCustWTGroupPrices.showmodal
  finally
    frmWTLUCustWTGroupPrices.free;
  end;
end;

procedure TfrmWTLUCustWTGroups.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUCustWTGroups.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUCustWTGroups.btnPatchClick(Sender: TObject);
begin
  CallMaintScreen('P');

end;

procedure TfrmWTLUCustWTGroups.FormCreate(Sender: TObject);
begin
  btnPatch.visible := (frmWTMain.OperatorName = 'firebelly') or (frmWTMain.OperatorName = 'Firebelly');
end;

end.
