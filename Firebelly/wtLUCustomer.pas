unit wtLUCustomer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, ToolWin, Grids, DBGrids, Menus, StdCtrls, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.Buttons,
  wtluCustQuotes, wtLuCustJobs, wtluCustInvoices, AllCommon,
  QrCtrls, Inifiles;

type
  TfrmWTLUCustomer = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    stsbrDetails: TStatusBar;
    imgLstHot: TImageList;
    pmnCustomer: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    N1: TMenuItem;
    Quotes1: TMenuItem;
    Jobs1: TMenuItem;
    N2: TMenuItem;
    mnItmShowTrade: TMenuItem;
    mnItmShowRetail: TMenuItem;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    tmrSearch: TTimer;
    Delete1: TMenuItem;
    btnContacts: TToolButton;
    qryCustomers: TFDQuery;
    dtsCustomers: TDataSource;
    dbgDetails: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Button1: TButton;
    chkbxShowInactive: TCheckBox;
    Panel1: TPanel;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    qryDelete: TFDQuery;
    qryDummy: TFDQuery;
    btnSearch: TBitBtn;
    chkbxShowProspects: TCheckBox;
    ToolButton1: TToolButton;
    mnItmShowAll: TMenuItem;
    cmbCustomerFilter: TComboBox;
    Label3: TLabel;
    btnWTGroups: TToolButton;
    btnEdgeCutoutGroups: TToolButton;
    btnSites: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure mnItmShowNonActiveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSearchClick(Sender: TObject);
    procedure chkbxShowProspectsClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnWTGroupsClick(Sender: TObject);
    procedure btnEdgeCutoutGroupsClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnSitesClick(Sender: TObject);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    frmwtluCustQuotes: TfrmwtLuCustQuotes;
    frmwtluCustJobs: TfrmwtLuCustJobs;
    frmwtluCustInvoices: TfrmwtLuCustInvoices;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    function UsingSearch: boolean;
  Protected
    procedure LUCustomersChildClosed(var Message: TMessage); message luCustomers_ChildClosed;
    procedure LUCustomersJobsClosed(var Message: TMessage); message luCustomers_jobsClosed;
    procedure LUCustomersInvoicesClosed(var Message: TMessage); message luCustomers_InvoicesClosed;
  private
    FChildLeft, FChildTop: integer;
    CustomerName: string;
    ShowInactive: boolean;
    SortType: string;
    SortOrder: string;
    procedure CallMaintScreen(FuncMode: string);
  public
    street, Townlocale, Town, Postcode, County, Phone, CustomerType: string;
    IncludeProspects, OnlyProspects: boolean;
    TradeRetail: integer;
    DateCreated: TdateTime;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure refreshData;
  end;

var
  frmWTLUCustomer: TfrmWTLUCustomer;

implementation

uses
  System.UITypes, System.Types,
  wtMaintCustomer, WTSrchCustContacts, WTCustomerSearch, wtDataModule,
  WTLUCustomerRpts, wtMaintCustomerConts, WTLUCustWTGroups,
  WTLUCustEdgeCutOutGroup, WTLUCustomerSite, wtMain;

{$R *.DFM}

procedure TfrmWTLUCustomer.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
(*
  if assigned(frmwtluCustQuotes) then
    PostMessage(frmwtluCustQuotes.Handle, luCustomers_ParentClosed, 0, 0);
  if assigned(frmwtluCustInvoices) then
    PostMessage(frmwtluCustInvoices.Handle, luCustomers_ParentClosed, 0, 0);
  if assigned(frmwtluCustJobs) then
    PostMessage(frmwtluCustJobs.Handle, luCustomers_ParentClosed, 0, 0);
*)
  AllCommon.SaveDBGridCols('', 'CustomerLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmWTLUCustomer.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      if (ReadString('Customer', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Customer', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Customer', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Customer', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;
    end;
  finally
    IniFile.Free;
  end;

  dtsCustomers.OnDataChange := SetButtons;
  FChildLeft := -1;
  FChildTop := -1;
  includeprospects := true;
  AllCommon.SetDBGridCols('', 'CustomerLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUCustomer.btnAddClick(Sender: TObject);
var
  OldCursor : TCursor;
  iCustomer: Integer;
begin
//  CallMaintScreen('A');
  OldCursor := Screen.Cursor;

  {Add a new customer}
  try
    frmWTMaintCustomer := TfrmWTMaintCustomer.create(Application);
    iCustomer := 0;
    frmWTMaintCustomer.getRecord(iCustomer);
    frmWTMaintCustomer.FunctionMode := 'A';

    if cmbCustomerFilter.itemindex > 0 then
      begin
        if messagedlg('You are currently viewing only ' + cmbCustomerFilter.text + ' customers. ' +
                        'Do you want to add a new ' + cmbCustomerFilter.text + ' customer?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          frmWTMaintCustomer.DefaultCustomerCategory := (cmbCustomerFilter.itemindex -1)
        else
          frmWTMaintCustomer.DefaultCustomerCategory := -1;
      end;

    frmWTMaintCustomer.showmodal;
    if frmWTMaintCustomer.ModalResult = idOK then
      begin
        edtSearch.text := frmWTMaintCustomer.qryOneCustomer.fieldbyname('Customer_Name').asstring;
        iCustomer := frmWTMaintCustomer.Customer;

        {Add the customer contact}
        frmWTSrchCustContacts := TfrmWTSrchCustContacts.create(self);
        try
          frmWTMaintCustomerConts := TfrmWTMaintCustomerConts.create(Application);
          frmwtSrchCustContacts.Customer := iCustomer;
          try
            frmWTMaintCustomerConts.FunctionMode := 'A';
            frmWTMaintCustomerConts.Customer := iCustomer;
            frmWTMaintCustomerConts.showmodal;
          finally
            Screen.Cursor := OldCursor;
            frmWTMaintCustomerConts.free;
          end;
        finally
          frmWTSrchCustContacts.Free;
        end;

        refreshData;
        dtsCustomers.DataSet.Locate('Customer', Variant(inttostr(iCustomer)),[lopartialKey]) ;
      end;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustomer.free;
  end;
end;

procedure TfrmWTLUCustomer.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintCustomer := TfrmWTMaintCustomer.create(nil);
    if FuncMode <> 'A' then
      begin
        iCode := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
      end
    else
      iCode := 0;
    frmWTMaintCustomer.getRecord(iCode);
    frmWTMaintCustomer.FunctionMode := FuncMode;
    frmWTMaintCustomer.showmodal;
    if frmWTMaintCustomer.ModalResult = idOK then
      begin
        if FuncMode = 'A' then
          begin
            edtSearch.text := frmWTMaintCustomer.qryOneCustomer.fieldbyname('Customer_Name').asstring;
            iCode := frmWTMaintCustomer.Customer;
          end;
        refreshData;
        dtsCustomers.DataSet.Locate('Customer', Variant(inttostr(iCode)),[lopartialKey]);
      end;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustomer.free;
  end;
end;

procedure TfrmWTLUCustomer.refreshData;
var
  stemp: string;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  with qryCustomers do
    begin
      close;
      sql.Clear;
      sTemp := qryDummy.sql.text;
      if CustomerName <> '' then
        sTemp := sTemp + ' AND ((Customer.Customer_name LIKE ''%' + CustomerName + '%'')'
                       + ' OR  (Customer.Account_Code LIKE ''%' + CustomerName + '%''))';
      if Street <> '' then
        sTemp := sTemp + ' AND Customer.Street LIKE ''%' + Street + '%''';
      if Town <> '' then
        sTemp := sTemp + ' AND Customer.Town_City LIKE ''%' + Town + '%''';
      if TownLocale <> '' then
        sTemp := sTemp + ' AND Customer.Locale LIKE ''%' + TownLocale + '%''';
      if County <> '' then
        sTemp := sTemp + ' AND Customer.County_State LIKE ''%' + County + '%''';
      if Postcode <> '' then
        sTemp := sTemp + ' AND Customer.Postcode LIKE ''' + Postcode + '%''';
      if Phone <> '' then
        sTemp := sTemp + ' AND Customer.telephone_number LIKE ''' + phone + '%''';
      if CustomerType <> '' then
        sTemp := sTemp + ' AND Customer_Type.Description LIKE ''%' + CustomerType + '%''';

      if TradeRetail = 1 then
        sTemp := sTemp + ' AND (((Customer.Is_Retail_Customer <> ''Y'') AND ((Customer.Is_Commercial_Customer <> ''Y'') OR (Customer.Is_Commercial_Customer IS NULL))))'
      else
      if TradeRetail = 2 then
        sTemp := sTemp + ' AND (Customer.Is_Retail_Customer = ''Y'')'
      else
      if TradeRetail = 3 then
        sTemp := sTemp + ' AND (Customer.Is_Commercial_Customer = ''Y'')' ;

      if OnlyProspects then
        sTemp := sTemp + ' AND ((Customer.Prospect = ''Y''))'
      else
      if not IncludeProspects then
        sTemp := sTemp + ' AND ((Customer.Prospect is NULL) or (Customer.Prospect = ''N''))';

      if DateCreated > 0 then
        sTemp := sTemp + ' AND Customer.Date_Created >= ' + qDate(DateCreated);

      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Customer.Customer_Name'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

//      stemp := sTemp + 'ORDER BY Customer.Customer_Name';

      sql.Text := stemp;
      if ShowInactive then
        parambyname('Not_Active').asstring := 'Y'
      else
        parambyname('Not_Active').asstring := 'N';
      open;
    end;

end;

procedure TfrmWTLUCustomer.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustomer.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUCustomer.mnItmShowNonActiveClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  ShowInactive := chkbxShowInactive.checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUCustomer.FormShow(Sender: TObject);
begin
  ShowInactive := false;
  edtSearch.setfocus;
  FormActivate(Sender);
end;

procedure TfrmWTLUCustomer.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUCustomer.tmrSearchTimer(Sender: TObject);
begin
  TradeRetail := cmbCustomerFilter.itemindex;
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TfrmWTLUCustomer.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUCustomer.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUCustomer.LUCustomersChildClosed(var Message: TMessage);
begin
  FChildLeft := message.WParam;
  FChildTop := message.LParam;
  frmwtLUCustQuotes := nil;
  message.result := 1;
end;

procedure TfrmWTLUCustomer.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsCustomers.dataset do
  begin
    btnChange.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
    btnContacts.Enabled := recordCount > 0;
    btnSites.Enabled := recordCount > 0;
    btnWTGroups.Enabled := recordCount > 0;
    btnEdgeCutoutGroups.enabled := recordcount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
    stsBrDetails.panels[0].text := inttostr(recordCount) + ' records displayed';
  end;
end;

function TfrmWTLUCustomer.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (Street <> '') or
            (Town <> '') or
            (TownLocale <> '') or
            (Postcode <> '') or
            (County <> '') or
            (Phone <> '') or
            (CustomerType <> '') or
            (IncludeProspects) then
    result := true
  else
    result := false;
end;

procedure TfrmWTLUCustomer.chkbxShowInactiveClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  ShowInactive := chkbxShowInactive.checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUCustomer.btnDeleteClick(Sender: TObject);
begin
  if (dbgDetails.datasource.DataSet.fieldbyname('Customer').asinteger = 1) then
    begin
        messagedlg('This customer is a system record an cannot be deleted', mtInformation, [mbOk], 0);
        exit;
    end;
    
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            parambyname('Customer').asinteger := dbgDetails.datasource.DataSet.fieldbyname('Customer').asinteger;
            execsql;
          end;
        Refreshdata;
      except
        messagedlg('Customer '+ dbgDetails.datasource.DataSet.fieldbyname('Customer_name').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUCustomer.LUCustomersJobsClosed(var Message: TMessage);
begin
  FChildLeft := message.WParam;
  FChildTop := message.LParam;
  frmwtLUCustJobs := nil;
  message.result := 1;
end;

procedure TfrmWTLUCustomer.LUCustomersInvoicesClosed(
  var Message: TMessage);
begin
  FChildLeft := message.WParam;
  FChildTop := message.LParam;
  frmwtLUCustInvoices := nil;
  message.result := 1;
end;

procedure TfrmWTLUCustomer.btnContactsClick(Sender: TObject);
begin
  frmWTSrchCustContacts := TfrmWTSrchCustContacts.create(self);
  try
    frmwtSrchCustContacts.Customer := dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    frmwtSrchCustContacts.isLookup := false;
    frmWTSrchCustContacts.showmodal
  finally
    frmWTSrchCustContacts.free;
  end;
end;

procedure TfrmWTLUCustomer.FormActivate(Sender: TObject);
begin
  TradeRetail := cmbCustomerFilter.itemindex;
  refreshdata;
  dbgDetails.datasource.DataSet.locate('customer', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmWTLUCustomer.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('customer').asinteger;
  except
    Activecode := 0
  end;

end;

procedure TfrmWTLUCustomer.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Not_Active').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if(dbgDetails.datasource.dataset.fieldByName('Prospect').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clRed;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Total Cost') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmWTLUCustomer.btnSearchClick(Sender: TObject);
begin
  frmWTCustomerSearch := TfrmWTCustomerSearch.create(self);
  try
    frmWTCustomerSearch.edtStreet.text := Street;
    frmWTCustomerSearch.edtLocale.Text := TownLocale;
    frmWTCustomerSearch.edtTown.Text := Town;
    frmWTCustomerSearch.edtPostcode.Text := postcode;
    frmWTCustomerSearch.edtPhone.Text := Phone;
    frmWTCustomerSearch.edtCounty.Text := County;
    frmWTCustomerSearch.edtType.Text := CustomerType;
    frmWTCustomerSearch.edtDate.Text := paDateStr(DateCreated);
    frmWTCustomerSearch.chkbxIncludeProspects.checked := IncludeProspects;
    frmWTCustomerSearch.showModal;
  finally
    frmWTCustomerSearch.free;
  end;

end;

procedure TfrmWTLUCustomer.chkbxShowProspectsClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  OnlyProspects := chkbxShowProspects.checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUCustomer.ToolButton1Click(Sender: TObject);
begin
  frmWTLUCustomerRpts := TfrmWTLUCustomerRpts.create(self);
  try
    frmWTLUCustomerRpts.showmodal;
  finally
    frmWTLUCustomerRpts.free;
  end;
end;

procedure TfrmWTLUCustomer.cmbCustomerFilterChange(Sender: TObject);
begin
  TradeRetail := (Sender as TComboBox).itemindex;
  refreshdata;
end;

procedure TfrmWTLUCustomer.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    IniFile.WriteString('Customer', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTLUCustomer.btnWTGroupsClick(Sender: TObject);
begin
  frmWTLUCustWTGroups := TfrmWTLUCustWTGroups.create(self);
  try
    frmWTLUCustWTGroups.Customer := dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    frmWTLUCustWTGroups.CustomerName := dbgDetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmWTLUCustWTGroups.showmodal
  finally
    frmWTLUCustWTGroups.free;
  end;
end;

procedure TfrmWTLUCustomer.btnEdgeCutoutGroupsClick(Sender: TObject);
begin
  frmWTLUCustEdgeCutOutGroup := TfrmWTLUCustEdgeCutOutGroup.create(self);
  try
    frmWTLUCustEdgeCutOutGroup.Customer := dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    frmWTLUCustEdgeCutOutGroup.CustomerName := dbgDetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmWTLUCustEdgeCutOutGroup.showmodal
  finally
    frmWTLUCustEdgeCutOutGroup.free;
  end;

end;

procedure TfrmWTLUCustomer.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
//  SortType: string;
  SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsUnderline, fsBold] then
    SortType := ' ASC'
  else if SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [fsBold];
  Column.Title.Font.Style := [fsUnderline, fsBold];

  SortOrder := SortField + SortType;
  SortType := SortType;

  refreshdata;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUCustomer.btnSitesClick(Sender: TObject);
begin
  frmWTLUCustomerSite := TfrmWTLUCustomerSite.create(self);
  try
    frmWTLUCustomerSite.Customer := dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    frmWTLUCustomerSite.CustomerName := dbgDetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmWTLUCustomerSite.isLookup := false;
    frmWTLUCustomerSite.showmodal
  finally
    frmWTLUCustomerSite.free;
  end;

end;

end.
