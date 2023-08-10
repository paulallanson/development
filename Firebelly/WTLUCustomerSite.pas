unit WTLUCustomerSite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, QrCtrls, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUCustomerSite = class(TForm)
    dbgDetails: TDBGrid;
    srcCustomerSite: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn4: TBitBtn;
    qryCustomerBranch: TFDQuery;
    qryDelete: TFDQuery;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExcel: TBitBtn;
    btnSelect: TBitBtn;
    pnlTop: TPanel;
    Label1: TLabel;
    lblCustomerName: TLabel;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure srcCustomerSiteDataChange(Sender: TObject; Field: TField);
    procedure btnSelectClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
  private
    FisLookup: boolean;
    FSelected: boolean;
    FSelectedName: string;
    FSelectedCode: integer;
    FSelectedAddress: integer;
    FCustomerName: string;
    FSelectedInstallMobile: string;
    FSelectedInstallEmail: string;
    FSelectedInstallName: string;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure SetisLookup(const Value: boolean);
    procedure SetSelected(const Value: boolean);
    procedure SetSelectedName(const Value: string);
    procedure SetSelectedCode(const Value: integer);
    procedure SetSelectedAddress(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetSelectedInstallEmail(const Value: string);
    procedure SetSelectedInstallMobile(const Value: string);
    procedure SetSelectedInstallName(const Value: string);
  public
    Customer: integer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property isLookup: boolean read FisLookup write SetisLookup;
    property Selected: boolean read FSelected write SetSelected;
    property SelectedAddress: integer read FSelectedAddress write SetSelectedAddress;
    property SelectedCode: integer read FSelectedCode write SetSelectedCode;
    property SelectedName: string read FSelectedName write SetSelectedName;
    property SelectedInstallName: string read FSelectedInstallName write SetSelectedInstallName;
    property SelectedInstallEmail: string read FSelectedInstallEmail write SetSelectedInstallEmail;
    property SelectedInstallMobile: string read FSelectedInstallMobile write SetSelectedInstallMobile;
  end;
var
  frmWTLUCustomerSite: TfrmWTLUCustomerSite;

implementation

uses wtMain, WTMaintBranch, wtDataModule;

{$R *.DFM}

procedure TfrmWTLUCustomerSite.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  qryCustomerBranch.close;
end;

procedure TfrmWTLUCustomerSite.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustomerSite.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustomerSite.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Branch_No').asinteger;
  frmWTMaintBranch := TfrmWTMaintBranch.create(Application);
  try
    frmWTMaintBranch.sFuncMode := FuncMode;

    if FuncMode = 'A' then
      begin
        frmWTMaintBranch.iCustomer := Customer;
      end
    else
      begin
        frmWTMaintBranch.iCustomer := Customer;
        frmWTMaintBranch.CustomerName := lblCustomerName.Caption;
        frmWTMaintBranch.iBranch := qryCustomerBranch.fieldbyname('Branch_no').asinteger;
        frmWTMaintBranch.sName := qryCustomerBranch.fieldbyname('Branch_Name').asstring;
      end;

    frmWTMaintBranch.showmodal;
    if frmWTMaintBranch.bOK then
      begin
        iCode := frmWTMaintBranch.iBranch;
        refresh;
        if frmWTMaintBranch.sFuncMode <> 'D' then
          begin
            qryCustomerBranch.Locate('Branch_no', Variant(inttostr(frmWTMaintBranch.iBranch)),[lopartialKey]) ;
          end;
      end;

  finally
    Screen.Cursor := OldCursor;
    frmWTMaintBranch.free;
  end;
end;

procedure TfrmWTLUCustomerSite.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Customer_Branch WHERE Branch_No = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Branch_No').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Branch_Name').asstring
                    + ' site has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUCustomerSite.dbgDetailsDblClick(Sender: TObject);
begin
  if self.isLookup then
    btnSelectClick(self)
  else
    btnEditClick(self);
end;

procedure TfrmWTLUCustomerSite.Refresh;
begin
  qryCustomerBranch.close;
  qryCustomerBranch.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryCustomerBranch.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryCustomerBranch.parambyname('inactive').asstring := 'Y';
    end;

  qryCustomerBranch.parambyname('Customer').asinteger := Customer;
  qryCustomerBranch.open;
  stsbrDetails.panels[0].text := inttostr(qryCustomerBranch.recordcount) + ' records displayed';
end;

procedure TfrmWTLUCustomerSite.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUCustomerSite.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustomerSite.FormActivate(Sender: TObject);
begin
  dtmdlWorktops.CreateCustomerDocDirectory(lblCustomerName.caption);
  refresh;
end;

procedure TfrmWTLUCustomerSite.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUCustomerSite);
end;

procedure TfrmWTLUCustomerSite.srcCustomerSiteDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.enabled := (srcCustomerSite.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcCustomerSite.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcCustomerSite.DataSet.RecordCount > 0);
  btnSelect.enabled := (srcCustomerSite.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUCustomerSite.SetisLookup(const Value: boolean);
begin
  FisLookup := Value;
  btnSelect.Visible := FisLookup;
end;

procedure TfrmWTLUCustomerSite.btnSelectClick(Sender: TObject);
begin
  Selected := true;
  SelectedAddress := qryCustomerBranch.fieldbyname('Address').asinteger;
  SelectedCode := qryCustomerBranch.fieldbyname('Branch_No').asinteger;
  SelectedName := qryCustomerBranch.fieldbyname('Branch_Name').asstring;
  SelectedInstallName := qryCustomerBranch.fieldbyname('Install_Contact_Name').asstring;
  SelectedInstallEmail := qryCustomerBranch.fieldbyname('Install_Email_Address').asstring;
  SelectedInstallMobile := qryCustomerBranch.fieldbyname('Install_Mobile_Number').asstring;
  close;
end;

procedure TfrmWTLUCustomerSite.SetSelected(const Value: boolean);
begin
  FSelected := Value;
end;

procedure TfrmWTLUCustomerSite.SetSelectedName(const Value: string);
begin
  FSelectedName := Value;
end;

procedure TfrmWTLUCustomerSite.SetSelectedCode(const Value: integer);
begin
  FSelectedCode := Value;
end;

procedure TfrmWTLUCustomerSite.SetSelectedAddress(const Value: integer);
begin
  FSelectedAddress := Value;
end;

procedure TfrmWTLUCustomerSite.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  lblCustomerName.caption := FCustomerName;
end;

procedure TfrmWTLUCustomerSite.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUCustomerSite.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUCustomerSite.SetSelectedInstallEmail(
  const Value: string);
begin
  FSelectedInstallEmail := Value;
end;

procedure TfrmWTLUCustomerSite.SetSelectedInstallMobile(
  const Value: string);
begin
  FSelectedInstallMobile := Value;
end;

procedure TfrmWTLUCustomerSite.SetSelectedInstallName(const Value: string);
begin
  FSelectedInstallName := Value;
end;

end.
