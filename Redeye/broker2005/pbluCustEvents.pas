unit pbluCustEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, Db, Variants, Menus, pbEventsDM, System.ImageList;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Eventsclosed   = WM_APP + 106; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}
  luProspects_Eventsclosed   = WM_APP + 106; {sent from child to parent}
  luProspects_parentclosed  = WM_APP + 103; {sent from parent to child}
type
  TfrmPBLUCustEvents = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    lblTitle: TLabel;
    PageScroller2: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnEnquiries: TToolButton;
    btnProduction: TToolButton;
    btnJobs: TToolButton;
    btnStock: TToolButton;
    dbgDetails: TDBGrid;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    btnSearch: TButton;
    Panel2: TPanel;
    btnClose: TButton;
    stsbrDetails: TStatusBar;
    imglstjobs: TImageList;
    tmrSearch: TTimer;
    btnCustomers: TToolButton;
    Panel5: TPanel;
    Panel6: TPanel;
    memText: TMemo;
    btnSalesInvoicing: TToolButton;
    btnAppointment: TToolButton;
    pmnFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuChange: TMenuItem;
    mnuDelete: TMenuItem;
    mnuAppointment: TMenuItem;
    N1: TMenuItem;
    btnQuotes: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure btnAppointmentClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FActivated: boolean;
    FDisableNameChangeEvent: boolean;
    FProspects: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure SetOperator(iTempOp: Integer);
    procedure SetProspects(const Value: boolean);
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  private
    DontSaveLayout: Boolean;
    FParentForm: TForm;
    FCustomer: integer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure SetParentForm(const Value: TForm);
    procedure SetCustomer(const Value: integer);
    { Private declarations }
  public
    bDatasetempty : ByteBool;
    CustomerName: string;
    dtmdlProspectEvents: TdtmdlEvents;
    dtmdlCustomerEvents: TdtmdlEvents;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
    property Prospects: boolean read FProspects write SetProspects;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure ClearSearchCriteria;
  end;

var
  frmPBLUCustEvents: TfrmPBLUCustEvents;

implementation

uses CCSCommon, pbluCustomers, PBMaintContactEvents, PBDBMemo,
  PBMaintContApp, pbDatabase, pbMainMenu;

{$R *.DFM}

{ TfrmPBLUCustEvents }

procedure TfrmPBLUCustEvents.luCustomersParentClosed(
  var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmPBLUCustEvents.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmPBLUCustEvents.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Prospects then
    PostMessage(ParentForm.Handle, luProspects_Eventsclosed, left, Top)
  else
    PostMessage(ParentForm.Handle, luCustomers_Eventsclosed, left, Top);

  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerEventLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;

end;

procedure TfrmPBLUCustEvents.FormCreate(Sender: TObject);
begin
  btnStock.visible := frmPBMainMenu.btnStock.visible;
  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  CCSCommon.SetDBGridCols('', 'CustomerEventLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
  SetOperator(frmPBMainMenu.iOperator);
end;

procedure TfrmPBLUCustEvents.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUCustEvents.SetButtons(Sender: TObject; Field: TField);
begin
  if Prospects then
    begin
      with dtmdlProspectEvents do
        begin
          btnChange.Enabled := HeaderCount > 0;
          btnDelete.Enabled := HeaderCount > 0;
          stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
        end;
    end
  else
    begin
      with dtmdlCustomerEvents do
        begin
          btnChange.Enabled := HeaderCount > 0;
          btnDelete.Enabled := HeaderCount > 0;
          stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
        end;
    end;

  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBDBMemoFrm.bAllow_Upd := False;
    PBDBMemoFrm.LoadMemoData(dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    memText.Text := PBDBMemoFrm.DispMemo.Text ;
  finally
    PBDBMemoFrm.Free;
  end;

end;

procedure TfrmPBLUCustEvents.SetCustomer(const Value: integer);
begin
  if Prospects then
    begin
      FCustomer := Value;
      dtmdlProspectEvents.Customer := FCustomer;
      dtmdlProspectEvents.RefreshData;
    end
  else
    begin
      FCustomer := Value;
      dtmdlCustomerEvents.Customer := FCustomer;
      dtmdlCustomerEvents.RefreshData;
    end;
end;

procedure TfrmPBLUCustEvents.FormDestroy(Sender: TObject);
begin
  if Prospects then
    begin
      try
        dtmdlProspectEvents.free
      except
      end;
    end
  else
    begin
      try
        dtmdlCustomerEvents.free;
      except
      end;
    end;
end;

procedure TfrmPBLUCustEvents.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;

  if Prospects then
    dtmdlProspectEvents.Description := edtSearch.Text
  else
    dtmdlCustomerEvents.Description := edtSearch.Text;

  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUCustEvents.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  if Prospects then
    dtmdlProspectEvents.refreshdata
  else
    dtmdlCustomerEvents.refreshdata;

end;

procedure TfrmPBLUCustEvents.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUCustEvents.ClearSearchCriteria;
begin
  edtSearch.text := '';
end;

procedure TfrmPBLUCustEvents.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmPBLUCustEvents.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLUCustEvents.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUCustEvents.btnEnquiriesClick(Sender: TObject);
begin
  frmpbluCustomers.btnEnquiriesClick(self);

end;

procedure TfrmPBLUCustEvents.btnProductionClick(Sender: TObject);
begin
  frmpbluCustomers.btnProductionClick(self);

end;

procedure TfrmPBLUCustEvents.btnJobsClick(Sender: TObject);
begin
  frmpbluCustomers.btnJobsClick(self);

end;

procedure TfrmPBLUCustEvents.btnStockClick(Sender: TObject);
begin
  frmpbluCustomers.btnStockClick(self);
end;

procedure TfrmPBLUCustEvents.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TfrmPBLUCustEvents.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iCustomer, iBranch, iContact, iTempSel: Integer;
begin
  frmPBMaintContactEvents := TfrmPBMaintContactEvents.Create(Self);
  try
    {Set the relevant datamodule}
    if Prospects then
      frmPBMaintContactEvents.dtmdlAllEvents := dtmdlProspectEvents
    else
      frmPBMaintContactEvents.dtmdlAllEvents := dtmdlCustomerEvents;

    frmPBMaintContactEvents.sFuncMode := sTempFuncMode;
    frmPBMaintContactEvents.iCust := Customer;
    if sTempFuncMode <> 'A' then
      begin
        frmPBMaintContactEvents.iCode :=
          dbgDetails.datasource.DataSet.FieldByName('Customer_Cont_Event_No').AsInteger;
        frmPBMaintContactEvents.iBranch :=
          dbgDetails.datasource.DataSet.FieldByName('Branch_No').AsInteger;
        frmPBMaintContactEvents.iContact :=
          dbgDetails.datasource.DataSet.FieldByName('Contact_no').AsInteger;
      end
    else
      begin
        frmPBMaintContactEvents.iCode := 0;
        frmPBMaintContactEvents.iBranch := 0;
        frmPBMaintContactEvents.iContact := 0;
      end;
    frmPBMaintContactEvents.sCustName := CustomerName;
    frmPBMaintContactEvents.ShowModal;
    bTempOK := (frmPBMaintContactEvents.ModalResult = mrOK);

    iCustomer := frmPBMaintContactEvents.iCust;
    iBranch := frmPBMaintContactEvents.iBranch;
    iContact := frmPBMaintContactEvents.iContact;
    iTempSel := frmPBMaintContactEvents.iCode;
  finally
    frmPBMaintContactEvents.Free;
  end;
  if bTempOK then
  begin
    if Prospects then
      dtmdlProspectEvents.RefreshData
    else
      dtmdlCustomerEvents.refreshdata;

    if sTempFuncMode <> 'D' then
      dbgDetails.datasource.DataSet.locate('Customer;Branch_no;Contact_no;Customer_Cont_Event_No', VarArrayOf([inttostr(iCustomer),inttostr(iBranch),inttostr(iContact),inttostr(iTempSel)]),[lopartialKey]) ;

  end;
end;

procedure TfrmPBLUCustEvents.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUCustEvents.btnSalesInvoicingClick(Sender: TObject);
begin
  frmpbluCustomers.btnSalesInvoicingClick(self);
end;

procedure TfrmPBLUCustEvents.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name <> 'ToolBar1' then
        TToolButton(Components[icount]).Enabled := False;
    end;
  end;
  {Set buttons according to file}
  try
    with dmBroker.qryGetButtons do
    begin
      Close;
      ParamByName('Operator').AsInteger := iTempOp;
      Open;
      First;
      while not EOF do
      begin
        cTempComp :=
          self.FindComponent(stringreplace((FieldByName('Button_Name').AsString),'mnu','btn',[rfReplaceAll,rfIgnoreCase]));
        if Assigned(cTempComp) then
          if cTempComp is TToolButton then
            try
            (cTempComp as TToolButton).Enabled := (FieldByName('Button_Status').AsString <> 'B');
            except
            end;
        Next;
      end;
    end;
  except
  end;
  btnCustomers.Enabled := false;
end;

procedure TfrmPBLUCustEvents.btnAppointmentClick(Sender: TObject);
var
  sSubject, sBody: string;
  AppDateTime: TDateTime;
  Hour, Min, Sec, MSec: Word;
  PBAppMemoFrm: TPBDBMemoFrm;
begin
  PBMaintContAppfrm := TPBMaintContAppfrm.create(self);
  try
    PBMaintContAppfrm.showmodal;
    if PBMaintContAppfrm.modalresult = idOK then
      begin
        sSubject := 'Call ' + dbgDetails.DataSource.dataset.fieldbyname('Contact_Name').asstring + ' at ' + CustomerName;

        sBody := 'Phone no: ' + dbgDetails.DataSource.dataset.fieldbyname('Contact_Phone').asstring + #13#10 + #13#10;

        {Get the details for the memo display} ;
        PBAppMemoFrm := TPBDBMemoFrm.Create(Self);
        try
          PBAppMemoFrm.bAllow_Upd := False;
//          GetDetsSQL.First;
          PBAppMemoFrm.LoadMemoData(dbgDetails.DataSource.Dataset.FieldByName('Narrative').AsInteger);
          if trim(PBAppMemoFrm.DispMemo.Text) = '' then
            sBody := sBody + ''
          else
            sBody := sBody + 'Last event details: ' + #13#10 + #13#10 + PBAppMemoFrm.DispMemo.Text ;
        finally
          PBAppMemoFrm.Free;
        end;
        decodetime(PBMaintContAppfrm.dtpckAppTime.time,Hour,Min,Sec,Msec);
//        AppDatetime := PBMaintContAppFrm.mnthCalApp.date + encodetime(Hour,Min,Sec,Msec);
        AppDatetime := PBMaintContAppFrm.DateTimePicker.date + encodetime(Hour,Min,Sec,Msec);
        AddAppViaOutLook('',sSubject,sBody,AppDateTime,true,20);
      end;
  finally
    PBMaintContAppfrm.free;
  end;
end;

procedure TfrmPBLUCustEvents.pmnFunctionsPopup(Sender: TObject);
begin
  mnuAdd.enabled := btnAdd.enabled;
  mnuChange.enabled := btnChange.enabled;
  mnuDelete.enabled := btnDelete.enabled;
  mnuAppointment.enabled := btnAppointment.Enabled;
end;

procedure TfrmPBLUCustEvents.btnQuotesClick(Sender: TObject);
begin
  frmpbluCustomers.btnQuotesClick(self);
end;

procedure TfrmPBLUCustEvents.SetProspects(const Value: boolean);
begin
  FProspects := Value;
  btnQuotes.visible := not FProspects;
  btnJobs.Visible := not FProspects;
  btnEnquiries.visible := not FProspects;
  btnProduction.Visible := not FProspects;
  btnStock.visible := not FProspects;
  btnSalesInvoicing.Visible := not FProspects;
end;

procedure TfrmPBLUCustEvents.FormActivate(Sender: TObject);
begin
(*  if not Factivated then
    begin
      if Prospects then
        begin
          dtmdlProspectEvents := TdtmdlEvents.create(self);
          dtmdlProspectEvents.dtsEvents.OnDataChange := SetButtons;
          dbgDetails.DataSource := dtmdlProspectEvents.dtsEvents;
        end
      else
        begin
          dtmdlCustomerEvents := TdtmdlEvents.create(self);
          dtmdlCustomerEvents.dtsEvents.OnDataChange := SetButtons;
          dbgDetails.DataSource := dtmdlCustomerEvents.dtsEvents;
        end;
      FActivated := true;
    end;
*)
end;

end.
