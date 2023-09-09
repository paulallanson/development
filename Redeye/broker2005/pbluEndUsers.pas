unit pbluEndUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, ExtCtrls, ImgList, ComCtrls, ToolWin,
  StdCtrls, Buttons, DB, pbCustomerDM, Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList;

type
  TfrmPBLUEndUsers = class(TForm)
    stsbrdetails: TStatusBar;
    Panel1: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    btnClose: TButton;
    btnSweep: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    lblTitle: TLabel;
    Panel5: TPanel;
    Label2: TLabel;
    cmbColourCoding: TComboBox;
    PageScroller1: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnEvents: TToolButton;
    imglstMaint: TImageList;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuChange: TMenuItem;
    mnuDelete: TMenuItem;
    mnuLabels: TMenuItem;
    N1: TMenuItem;
    mnuBranches: TMenuItem;
    mnuContacts: TMenuItem;
    mnuAccMgrs: TMenuItem;
    mnuCustReps: TMenuItem;
    N2: TMenuItem;
    mnuReset: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnLabels: TToolButton;
    ToolButton1: TToolButton;
    btnBranches: TToolButton;
    btnContacts: TToolButton;
    btnAccMgrs: TToolButton;
    btnCustReps: TToolButton;
    ToolButton4: TToolButton;
    btnConvert: TToolButton;
    ToolButton2: TToolButton;
    btnReports: TToolButton;
    dbgDetails: TDBGrid;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuResetClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure btnBranchesClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure cmbColourCodingChange(Sender: TObject);
    procedure btnCustRepsClick(Sender: TObject);
    procedure btnAccMgrsClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetOperator(iTempOp: Integer);
    procedure ShowColumns;
    procedure CallMaintScreen(Mode: string);
    function ProspectOrdersExist: boolean;
    procedure SetProspectInactive;
    procedure MultiSQLAdd(sTempStr: String; tmpQuery: TFDQuery;
      bBranch: boolean);
  protected
    procedure LUEndUsersEventsClosed(var Message: TMessage);
  private
    ActiveCode: integer;
    bSQLAdd, bSQLAddBranch: boolean;
    dtmdlEndUsers: TdtmdlCustomers;
    FActivated: Boolean;
    DontSaveLayout: boolean;
    iOperatorRep: integer;
    FEventsLeft, FEventsTop: integer;
    sAnalysis1, sAnalysis2, sAnalysis3, sAnalysis4: string;
    procedure SetButtons(Sender: TObject; Field: TField);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmPBLUEndUsers: TfrmPBLUEndUsers;

implementation

uses
  System.UITypes, System.Types,
  pbMainMenu, pbDatabase, CCSCommon, PBMaintCust, pbLuBranches,
  pbluContacts, pbluCustomerSearch, PBMaintCConta, PBMaintCRep, PBLUReps,
  PBMaintCustAccMgr, PBRSCusSupLabs, PBMaintCustMulti;

{$R *.dfm}

procedure TfrmPBLUEndUsers.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUEndUsers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
(*  if MessageDlg('Do you want to close all the end user details ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      if assigned(frmPBLUEndUserEvents) then
        PostMessage(frmPBLUEndUserEvents.Handle, luProspects_ParentClosed, 0, 0);

      if Self.dontSaveLayout then
      begin
      //dont do anything
      end
      else
      begin
        CCSCommon.SaveDBGridCols('', 'EndUserLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
        CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
      end;
      Action := caFree
    end
  else
    Action := caNone;
*)

end;

procedure TfrmPBLUEndUsers.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlEndUsers.refreshEndUserdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmPBLUEndUsers.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      if (ReadString('End User', 'Colour Coding', '0') = '0') then
        cmbColourCoding.itemindex := 0
      else
      if (ReadString('End User', 'Colour Coding', '1') = '1') then
        cmbColourCoding.itemindex := 1
      else
      if (ReadString('End User', 'Colour Coding', '2') = '2') then
        cmbColourCoding.itemindex := 2
      else
      if (ReadString('End User', 'Colour Coding', '3') = '3') then
        cmbColourCoding.itemindex := 3;
    end;
  finally
    IniFile.Free;
  end;

  dtmdlEndUsers := TdtmdlCustomers.create(self);
  dtmdlEndUsers.dtsEndUsers.OnDataChange := SetButtons;

  FEventsLeft := -1;
  FEventsTop := -1;

  CCSCommon.SetDBGridCols('', 'EndUserLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);

  {Decide which columns to show}
  ShowColumns;

  dmBroker.ScreenAccessControl(Self,'mnuEndUsers',frmPBMainMenu.iOperator,0,0) ;
  SetOperator(frmPBMainMenu.iOperator);
end;

procedure TfrmPBLUEndUsers.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlEndUsers do
  begin
    btnAdd.Enabled := true;
    btnChange.Enabled := HeaderCountEndUser > 0;
    btnDelete.Enabled := HeaderCountEndUser > 0;
    btnBranches.Enabled := HeaderCountEndUser > 0;
    btnContacts.Enabled := HeaderCountEndUser > 0;
    btnCustReps.Enabled := HeaderCountEndUser > 0;
    btnAccMgrs.Enabled := HeaderCountEndUser > 0;
    btnEvents.Enabled := HeaderCountEndUser > 0;
    btnLabels.Enabled := HeaderCountEndUser > 0;
    btnConvert.Enabled := HeaderCountEndUser > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCountEndUser) + ' records displayed';
  end;
end;

procedure TfrmPBLUEndUsers.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUEndUsers.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name = 'ToolBar2' then
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
end;

procedure TfrmPBLUEndUsers.mnuResetClick(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('EndUserLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;

end;

procedure TfrmPBLUEndUsers.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEndUsers') ;
  if not FActivated then
  begin
    dbgDetails.DataSource := dtmdlEndUsers.dtsEndUsers;

    {Check if the operator REP is needed} ;
    If dmBroker.iAccCtrlMenu = 4 then
      iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
    else
      iOperatorRep := 0 ;
    dtmdlEndUsers.Rep := iOperatorRep;
    dtmdlEndUsers.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

    FActivated := True;
  end;

  dtmdlEndUsers.RefreshEndUserData;
  dbgDetails.datasource.DataSet.locate('Customer', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
        except
        end;
    end;

end;

procedure TfrmPBLUEndUsers.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUEndUsers.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Customer').asinteger;
  except
    Activecode := 0
  end;

end;

procedure TfrmPBLUEndUsers.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('End User', 'Colour Coding', inttostr(cmbColourCoding.itemindex));
  finally
    IniFile.Free;
  end;

  dtmdlEndUsers.free;
end;

procedure TfrmPBLUEndUsers.ShowColumns;
var
  icount: integer;
  bUseCreditChecking: boolean;
begin
  bUseCreditChecking := dmBroker.UseCreditChecking;

  {Get Analysis Codes}
  sAnalysis1 := dmBroker.GetAnalysisCode1;
  sAnalysis2 := dmBroker.GetAnalysisCode2;
  sAnalysis3 := dmBroker.GetAnalysisCode3;
  sAnalysis4 := dmBroker.GetAnalysisCode4;

  for icount := 0 to pred(dbgDetails.columns.count) do
    begin
      if (dbgDetails.columns[icount].Title.Caption = 'Credit Score') or
         (dbgDetails.columns[icount].Title.Caption = 'Credit Limit') or
         (dbgDetails.columns[icount].Title.Caption = 'SIC Code') or
         (dbgDetails.columns[icount].Title.Caption = 'Credit Rating') then
            dbgDetails.Columns[icount].Visible := bUseCreditChecking
      else
        dbgDetails.Columns[icount].Visible := true;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 1') and (sAnalysis1 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis1;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 2') and (sAnalysis2 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis2;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 3') and (sAnalysis3 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis3;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 4') and (sAnalysis4 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis4;
    end;
end;

procedure TfrmPBLUEndUsers.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlEndUsers.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUEndUsers.CallMaintScreen(Mode: string);
var
  bTempOK: ByteBool;
  iTemp: integer;
begin
  if Mode = 'D' then
    begin
      if ProspectOrdersExist then
        begin
          if MessageDlg('Cannot delete this end user, contacts, enquiries or activities may exist in the system. ' +
                    'Do you want to make this prospect inactive?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
          begin
            SetProspectInactive;
            dtmdlEndUsers.refreshEndUserdata;
          end;
          exit;
        end;
    end;

  PBMaintCustFrm := TPBMaintCustFrm.Create(self);
  try
    PBMaintCustFrm.dtmdlOneCustomer := dtmdlEndUsers;
    if Mode = 'A' then
      PBMaintCustFrm.iCustomer := 0
    else
      PBMaintCustFrm.iCustomer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;

    PBMaintCustFrm.sFuncMode := ShortString(Mode);
    PBMaintCustFrm.Prospect := (dbgDetails.datasource.dataset.fieldbyname('Customer_Status').asinteger = 80);
    PBMaintCustFrm.EndUser := (dbgDetails.datasource.dataset.fieldbyname('Customer_Status').asinteger = 200);
    PBMaintCustFrm.CreditCheck := false;

    PBMaintCustFrm.ShowModal;
    bTempOK := (PBMaintCustFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintCustFrm.iCode;
        if Mode = 'A' then
          edtSearch.text := PBMaintCustFrm.NameEdit.text
        else
          begin
            dtmdlEndUsers.refreshEndUserdata;
            dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

            with dbgDetails do
              begin
                try
                  if datasource.dataset.recordcount > 0 then
                    SelectedRows.CurrentRowSelected := true ;
                  except
                  end;
              end;
          end;

      end;
  finally
    PBMaintCustFrm.Free;
  end;
end;

function TfrmPBLUEndUsers.ProspectOrdersExist: boolean;
begin
  with dtmdlEndUsers.qryGetCustomerOrders do
    begin
      close;
      parambyname('Customer').asinteger := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TfrmPBLUEndUsers.SetProspectInactive;
begin
  with dtmdlEndUsers.qrySetCustomerInactive do
    begin
      close;
      parambyname('Customer').asinteger := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
      execsql;
    end;
end;

procedure TfrmPBLUEndUsers.btnDeleteClick(Sender: TObject);
begin
  if dbgDetails.datasource.dataset.fieldbyname('Rep_Name').asstring <> '' then
    begin
      MessageDlg('This end user cannot be deleted, a Rep is associated with this customer', mtInformation,
        [mbOk], 0);
      exit;
    end;
  CallMaintScreen('D');

end;

procedure TfrmPBLUEndUsers.btnLabelsClick(Sender: TObject);
begin
  PBRSCusSupLabsFrm := TPBRSCusSupLabsFrm.Create(Self);
  try
    {Select mode as customer/supplier} ;
    PBRSCusSupLabsFrm.bCustomer := True;
    {Feed in the supplier code} ;
    PBRSCusSupLabsFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBRSCusSupLabsFrm.sName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBRSCusSupLabsFrm.ShowModal;
  finally
    PBRSCusSupLabsFrm.Free;
  end;

end;

procedure TfrmPBLUEndUsers.btnBranchesClick(Sender: TObject);
begin
  frmpbluBranches := TfrmpbluBranches.create(self);
  try
    frmpbluBranches.Code := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluBranches.CodeType := 'C';
    frmpbluBranches.CostCentreLevel := dbgDetails.datasource.dataset.fieldbyname('Cost_Centre_Level').asstring;
    frmpbluBranches.Caption := 'Customer '+ frmpbluBranches.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluBranches.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;

    frmpbluBranches.showmodal;
  finally
    frmpbluBranches.free;
  end;

end;

procedure TfrmPBLUEndUsers.btnContactsClick(Sender: TObject);
var
  iTemp: integer;
begin
  frmpbluContacts := TfrmpbluContacts.create(self);
  try
    iTemp := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluContacts.Code := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluContacts.CodeType := 'C';
    frmpbluContacts.Caption := 'Customer '+ frmpbluContacts.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluContacts.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluContacts.showmodal;
    if frmpbluContacts.somethingChanged then
      begin
        dtmdlEndUsers.refreshEndUserdata;
        dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
              except
              end;
          end;
      end;
  finally
    frmpbluContacts.free;
  end;
end;

procedure TfrmPBLUEndUsers.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUEndUsers.btnSearchClick(Sender: TObject);
begin
  frmpbluCustomerSearch := TfrmpbluCustomerSearch.create(self);
  try
    frmpbluCustomerSearch.prospect := false;
    frmpbluCustomerSearch.EndUser := true;

    if sAnalysis1 <> '' then
      frmpbluCustomerSearch.lblAnalysis1.caption := sAnalysis1;
    if sAnalysis2 <> '' then
      frmpbluCustomerSearch.lblAnalysis2.caption := sAnalysis2;
    if sAnalysis3 <> '' then
      frmpbluCustomerSearch.lblAnalysis3.caption := sAnalysis3;
    if sAnalysis4 <> '' then
      frmpbluCustomerSearch.lblAnalysis4.caption := sAnalysis4;

    frmpbluCustomerSearch.dtmdlSearchCustomers := dtmdlEndUsers;
    frmpbluCustomerSearch.edtTown.text := dtmdlEndUsers.Town;
    frmpbluCustomerSearch.edtPostcode.Text := dtmdlEndUsers.Postcode;
    frmpbluCustomerSearch.edtCounty.Text := dtmdlEndUsers.County;
    frmpbluCustomerSearch.edtTelephone.Text := dtmdlEndUsers.Telephone;
    frmpbluCustomerSearch.edtFax.Text := dtmdlEndUsers.Fax;
    frmpbluCustomerSearch.edtRep.Text := dtmdlEndUsers.RepName;
    frmpbluCustomerSearch.edtCustomerStatus.Text := dtmdlEndUsers.CustomerStatus;
    frmpbluCustomerSearch.edtCustomerType.Text := dtmdlEndUsers.CustomerType;
    frmpbluCustomerSearch.edtAccountManager.Text := dtmdlEndUsers.AccountManager;
    frmpbluCustomerSearch.edtTerms.Text := dtmdlEndUsers.Terms;
    frmpbluCustomerSearch.edtRevenueCentre.Text := dtmdlEndUsers.RevenueCentre;
    frmpbluCustomerSearch.edtImportance.Text := dtmdlEndUsers.Importance;
    frmpbluCustomerSearch.edtAnalysis1.Text := dtmdlEndUsers.Analysis1;
    frmpbluCustomerSearch.edtAnalysis2.Text := dtmdlEndUsers.Analysis2;
    frmpbluCustomerSearch.edtAnalysis3.Text := dtmdlEndUsers.Analysis3;
    frmpbluCustomerSearch.edtAnalysis4.Text := dtmdlEndUsers.Analysis4;

    frmpbluCustomerSearch.edtDate.Text := pbDateStr(dtmdlEndUsers.DateCreated);

    frmpbluCustomerSearch.chkbxShowInactive.checked := dtmdlEndUsers.ShowInactive;
    frmpbluCustomerSearch.showModal;
  finally
    frmpbluCustomerSearch.free;
  end;

end;

procedure TfrmPBLUEndUsers.btnAddClick(Sender: TObject);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  {Add a new customer}
  PBMaintCustFrm := TPBMaintCustFrm.Create(Self);
  try
    PBMaintCustFrm.sFuncMode := 'A';
    PBMaintCustFrm.Prospect := false;
    PBMaintCustFrm.EndUser := true;
    PBMaintCustFrm.ShowModal;
    bTempOK := (PBMaintCustFrm.ModalResult = mrOK);
    iTempSel := PBMaintCustFrm.iCode;

    if bTempOK then
    begin
      PBMaintCContaFrm := TPBMaintCContaFrm.Create(Self);
      try
        PBMaintCContaFrm.sFuncMode := 'A';
        PBMaintCContaFrm.iCust := iTempSel;
        PBMaintCContaFrm.iBranch := 0;

        PBMaintCContaFrm.iCode := 0;
        PBMaintCContaFrm.sCustName := PBMaintCustFrm.NameEdit.Text;
        PBMaintCContaFrm.sBranchName := 'Head Office';
        PBMaintCContaFrm.PhoneEdit.text := PBMaintCustFrm.PhoneEdit.Text;
        PBMaintCContaFrm.FaxEdit.text := PBMaintCustFrm.FaxEdit.Text;

        PBMaintCContaFrm.ShowModal;
      finally
        PBMaintCContaFrm.Free;
      end;
    end;
  finally
    PBMaintCustFrm.Free;
  end;

  if bTempOK then
  begin
    edtSearch.text := PBMaintCustFrm.NameEdit.text;
    dtmdlEndUsers.refreshEndUserdata;
    dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTempSel)),[lopartialKey]) ;

    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
          except
          end;
      end;
  end;

end;

procedure TfrmPBLUEndUsers.LUEndUsersEventsClosed(var Message: TMessage);
begin
(*  FEventsLeft := message.WParam;
  FEventsTop := message.LParam;
  frmpbLUEndUserEvents := nil;
  message.result := 1;
*)
end;

procedure TfrmPBLUEndUsers.btnSweepClick(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;

end;

procedure TfrmPBLUEndUsers.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cmbColourCoding.itemindex = 0 then
    begin
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 10) then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := clGreen;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end
      else
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 20) then
        begin
          (Sender as TDBGrid).Canvas.font.color := clblue;
          (Sender as TDBGrid).Canvas.Brush.color := clyellow;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end
      else
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 30) then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := $000080FF;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end
      else
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 40) then
      begin
        (Sender as TDBGrid).Canvas.Brush.color := clRed;
        (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
      end;
    end
  else
  if cmbColourCoding.itemindex = 1 then
    begin
      if dbgDetails.datasource.dataset.fieldByName('Customer_Type_Color').asinteger <> 0 then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Customer_Type_Color').asinteger;
          (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Customer_Type_Font_Color').asinteger;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end
    end
  else
  if cmbColourCoding.itemindex = 2 then
    begin
      if dbgDetails.datasource.dataset.fieldByName('Importance_Color').asinteger <> 0 then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Importance_Color').asinteger;
          (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Importance_Font_Color').asinteger;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end;
    end
  else
  if cmbColourCoding.itemindex = 3 then
    begin
      if dbgDetails.datasource.dataset.fieldByName('Invoice_location_Color').asinteger <> 0 then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Invoice_location_Color').asinteger;
          (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Invoice_location_Font_Color').asinteger;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if dbgDetails.datasource.dataset.fieldByName('Customer_Status').asinteger = 90 then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmPBLUEndUsers.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlEndUsers.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlEndUsers.SortOrder := SortField + SortType;
  dtmdlEndUsers.SortType := SortType;

  dtmdlEndUsers.refreshEndUserdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUEndUsers.cmbColourCodingChange(Sender: TObject);
begin
  dtmdlEndUsers.refreshEndUserdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmPBLUEndUsers.btnCustRepsClick(Sender: TObject);
var
  iTemp: integer;
begin
  frmpbluReps := TfrmpbluReps.create(self);
  try
    iTemp := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluReps.bProspect := false;
    frmpbluReps.bEndUser := true;
    frmpbluReps.OperatorRep := self.iOperatorRep;
    frmpbluReps.Code := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluReps.Caption := 'Customer '+ frmpbluReps.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluReps.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluReps.bViewMode := dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator);
    frmpbluReps.showmodal;
    if frmpbluReps.somethingChanged then
      begin
        dtmdlEndUsers.refreshEndUserdata;
        dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    frmpbluReps.free;
  end;

end;

procedure TfrmPBLUEndUsers.btnAccMgrsClick(Sender: TObject);
var
  iTemp: integer;
begin
  PBMaintCustAccMgrFrm := TPBMaintCustAccMgrFrm.create(self);
  try
    iTemp := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBMaintCustAccMgrFrm.CustomerCode := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBMaintCustAccMgrFrm.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    PBMaintCustAccMgrFrm.showmodal;
    if PBMaintCustAccMgrFrm.bOK and PBMaintCustAccMgrFrm.bRefresh then
      begin
        dtmdlEndUsers.refreshEndUserdata;
        dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBMaintCustAccMgrFrm.free;
  end;
end;

procedure TfrmPBLUEndUsers.pmnFunctionsPopup(Sender: TObject);
begin
//  mnuCalls.enabled := btnCustomers.enabled;
  mnuAdd.enabled := btnAdd.enabled;
  mnuChange.enabled := btnChange.enabled;
  mnuDelete.enabled := btnDelete.enabled;
  mnuLabels.enabled := btnLabels.enabled;
//  mnuCreditTerms.enabled := btnCreditTerms.enabled;
  mnuBranches.enabled := btnBranches.enabled;
  mnuContacts.enabled := btnContacts.enabled;
  mnuCustReps.enabled := btnCustReps.enabled;
  mnuAccMgrs.enabled := btnAccMgrs.enabled;

end;

procedure TfrmPBLUEndUsers.btnChangeClick(Sender: TObject);
var
  bTempAskDets, bSQLAdd: boolean;
  bChangeRep, bChangeSecondaryRep, bChangeAccManager: boolean;
  iTempCount, iTempCode, iFirstCode: Integer;
  iNewRep, iNewSecondaryRep, iNewAccManager: integer;
begin
  if (dbgDetails.SelectedRows.Count = 1) or (pos('View',btnChange.Caption) > 0) then
    CallMaintScreen('C')
  else
    begin
      bChangeRep := false;
      bChangeSecondaryRep := false;
      bChangeAccManager := false;
      bTempAskDets := False ;
      for iTempCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iTempCount])) ;
          iTempCode := dbgDetails.datasource.DataSet.fieldbyname('Customer').asinteger;
          if iTempCount = 0 then
            iFirstCode := iTempCode;
          if bTempAskDets = False then
            begin
              PBMaintCustMultiFrm := TPBMaintCustMultiFrm.Create(Self);
              try
                with dtmdlEndUsers.qryGetOneCustomer do
                  begin
                    Close ;
                    ParamByName('Customer').Asinteger := iTempCode;
                    Open ;
                    First ;

                    PBMaintCustMultiFrm.CustomerCount := dbgDetails.SelectedRows.Count;
                    PBMaintCustMultiFrm.edtTown.text := fieldbyname('Town').asstring;
                    PBMaintCustMultiFrm.edtCounty.text := fieldbyname('County').asstring;
                    PBMaintCustMultiFrm.edtVatRate.text := fieldbyname('Vat_Description').asstring;
                    PBMaintCustMultiFrm.edtType.text := fieldbyname('Customer_Type_Description').asstring;
                    PBMaintCustMultiFrm.edtAccManager.text := fieldbyname('Account_Manager_Name').asstring;
                    PBMaintCustMultiFrm.edtRep.text := fieldbyname('Rep_Name').asstring;
                    PBMaintCustMultiFrm.edtSecondaryRep.text := fieldbyname('Sub_Rep_Name').asstring;
                    PBMaintCustMultiFrm.edtImportance.text := fieldbyname('Importance_Description').asstring;
                    PBMaintCustMultiFrm.edtAnalysis1.text := fieldbyname('Analysis_Code_1').asstring;
                    PBMaintCustMultiFrm.edtAnalysis2.text := fieldbyname('Analysis_Code_2').asstring;
                    PBMaintCustMultiFrm.edtAnalysis3.text := fieldbyname('Analysis_Code_3').asstring;
                    PBMaintCustMultiFrm.edtAnalysis4.text := fieldbyname('Analysis_Code_4').asstring;
                    PBMaintCustMultiFrm.edtRevenueCentre.text := fieldbyname('Invoice_Location_Descr').asstring;
                    PBMaintCustMultiFrm.edtStatus.text := fieldbyname('Customer_Status_Descr').asstring;
                    PBMaintCustMultiFrm.edtPaymentTerms.text := fieldbyname('Payment_Terms_Description').asstring;

                    PBMaintCustMultiFrm.chkbxActive.Checked := (fieldbyname('Acc_Active').asstring = 'Y');
                    PBMaintCustMultiFrm.chkbxInvUpfront.checked := (fieldbyname('Invoice_Upfront').asstring = 'Y');
                  end;

                PBMaintCustMultiFrm.showmodal;

                if PBMaintCustMultiFrm.OK = false then
                  exit;

                with dtmdlEndUsers.qryUpdMulti do
                  begin
                    bSQLAdd := True ;

                    SQL.Clear;
                    SQL.Add('Update Customer') ;
                    SQL.Add('Set Date_Created = Date_Created ') ;
                  end;

                with dtmdlEndUsers.qryUpdMultiBranch do
                  begin
                    bSQLAddBranch := True ;
                    
                    SQL.Clear;
                    SQL.Add('Update Customer_Branch') ;
                    SQL.Add('Set Account_Code_on_Ledger = Account_Code_on_Ledger ') ;
                  end;

                {Change of Town}
                if (PBMaintCustMultiFrm.edtTownTo.Text <> '') then
                  begin
                    MultiSQLAdd('Town = ''' + PBMaintCustMultiFrm.edtTownTo.text + '''', dtmdlEndUsers.qryUpdMultiBranch, true);
                  end;

                {Change of County}
                if (PBMaintCustMultiFrm.edtCountyTo.Text <> '') then
                  begin
                    MultiSQLAdd('County = ''' + PBMaintCustMultiFrm.edtCountyTo.text + '''', dtmdlEndUsers.qryUpdMultiBranch, true);
                  end;

                {Change of Vat Rate}
                if (PBMaintCustMultiFrm.dblkpVatRate.Text <> '') then
                  begin
                    MultiSQLAdd('Vat_Code_Def = ''' + inttostr(PBMaintCustMultiFrm.dblkpVatRate.keyvalue) + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Customer Type}
                if (PBMaintCustMultiFrm.dblkpType.Text <> '') then
                  begin
                    MultiSQLAdd('Customer_Type = ''' + inttostr(PBMaintCustMultiFrm.dblkpType.keyvalue) + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Level of Importance}
                if (PBMaintCustMultiFrm.dblkpImportance.Text <> '') then
                  begin
                    MultiSQLAdd('Level_of_Importance = ''' + inttostr(PBMaintCustMultiFrm.dblkpImportance.keyvalue) + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Revenue Centre}
                if (PBMaintCustMultiFrm.dblkpRevenueCentre.Text <> '') then
                  begin
                    MultiSQLAdd('Invoice_Location = ''' + inttostr(PBMaintCustMultiFrm.dblkpRevenueCentre.keyvalue) + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 1}
                if (PBMaintCustMultiFrm.edtAnalysisTo1.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_1 = ''' + PBMaintCustMultiFrm.edtAnalysisTo1.text + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 2}
                if (PBMaintCustMultiFrm.edtAnalysisTo2.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_2 = ''' + PBMaintCustMultiFrm.edtAnalysisTo2.text + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 3}
                if (PBMaintCustMultiFrm.edtAnalysisTo3.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_3 = ''' + PBMaintCustMultiFrm.edtAnalysisTo3.text + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 4}
                if (PBMaintCustMultiFrm.edtAnalysisTo4.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_4 = ''' + PBMaintCustMultiFrm.edtAnalysisTo4.text + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Customer Status}
                if (PBMaintCustMultiFrm.dblkpStatus.Text <> '') then
                  begin
                    MultiSQLAdd('Customer_Status = ''' + inttostr(PBMaintCustMultiFrm.dblkpStatus.keyvalue) + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Payment Terms}
                if (PBMaintCustMultiFrm.dblkpPaymentTerms.Text <> '') then
                  begin
                    MultiSQLAdd('Payment_Terms = ''' + inttostr(PBMaintCustMultiFrm.dblkpPaymentTerms.keyvalue) + '''', dtmdlEndUsers.qryUpdMulti, true);
                  end;

                {Change of Invoice Upfront}
                if (PBMaintCustMultiFrm.chkbxInvUpFrontTo.state <> cbGrayed) then
                  begin
                    if PBMaintCustMultiFrm.chkbxInvUpFrontTo.checked then
                      MultiSQLAdd('Invoice_Upfront = ''' + 'Y' + '''', dtmdlEndUsers.qryUpdMulti, true)
                    else
                      MultiSQLAdd('Invoice_Upfront = ''' + 'N' + '''', dtmdlEndUsers.qryUpdMulti, true)
                  end;

                {Change of Active}
                if (PBMaintCustMultiFrm.chkbxActiveTo.state <> cbGrayed) then
                  begin
                    if PBMaintCustMultiFrm.chkbxActiveTo.checked then
                      MultiSQLAdd('Acc_Active = ''' + 'Y' + '''', dtmdlEndUsers.qryUpdMulti, true)
                    else
                      MultiSQLAdd('Acc_Active = ''' + 'N' + '''', dtmdlEndUsers.qryUpdMulti, true)
                  end;

                {Change of Rep}
                if (PBMaintCustMultiFrm.dblkpRep.Text <> '') then
                  begin
                    bChangeRep := true;
                    iNewRep := PBMaintCustMultiFrm.dblkpRep.keyvalue;
                  end;

                {Change of Secondary Rep}
                if (PBMaintCustMultiFrm.dblkpSecondaryRep.Text <> '') then
                  begin
                    bChangeSecondaryRep := true;
                    iNewSecondaryRep := PBMaintCustMultiFrm.dblkpSecondaryRep.keyvalue;
                  end;

                {Change of Account Manager/Operator}
                if (PBMaintCustMultiFrm.dblkpAccManager.Text <> '') then
                  begin
                    bChangeAccManager := true;
                    iNewAccManager := PBMaintCustMultiFrm.dblkpAccManager.keyvalue;
                  end;

                dtmdlEndUsers.qryUpdMulti.SQL.Add(' Where Customer = :Customer') ;
                dtmdlEndUsers.qryUpdMultiBranch.SQL.Add(' Where Customer = :Customer and Branch_no = :Branch_no') ;
                bTempAskDets := True ;
              finally
                PBMaintCustMultiFrm.free;
              end;

            end;
          {Run the update for each Customer selected}
          with dtmdlEndUsers.qryUpdMulti do
            begin
              close ;
              ParamByName('Customer').Asinteger := iTempCode ;
              execSQL ;
            end;

          {Run the update of Branch}
          with dtmdlEndUsers.qryUpdMultiBranch do
            begin
              close ;
              ParamByName('Customer').Asinteger := iTempCode ;
              ParamByName('Branch_no').Asinteger := 0 ;
              execSQL ;
            end;

          {Has the Rep been changed}
          if bChangeRep then
            begin
              with dtmdlEndUsers.qryDelRepBranch do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  execsql;
                end;

              with dtmdlEndUsers.qryAddRepBranch do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  ParamByName('Rep').Asinteger := iNewRep;
                  ParamByName('Is_Main_Rep').Asstring := 'Y';
                  execsql;
                end;
            end;
          {Has the Secondary Rep been changed}
          if bChangeSecondaryRep then
            begin
              with dtmdlEndUsers.qryDelSecondRep do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  execsql;
                end;

              with dtmdlEndUsers.qryAddRepBranch do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  ParamByName('Rep').Asinteger := iNewSecondaryRep;
                  ParamByName('Is_Main_Rep').clear;
                  execsql;
                end;
            end;

          {Has the Acc Manager been changed}
          if bChangeAccManager then
            begin
              with dtmdlEndUsers.qryDelAccManager do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  execsql;
                end;

              with dtmdlEndUsers.qryAddAccManager do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Operator').Asinteger := iNewAccManager;
                  execsql;
                end;
            end;
        end;

        {Refresh the data and find the first product}
        dtmdlEndUsers.RefreshEndUserdata;
        dbgDetails.datasource.DataSet.locate('Customer', Variant(iFirstCode),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
    end;
end;

procedure TfrmPBLUEndUsers.MultiSQLAdd(sTempStr: String; tmpQuery: TFDQuery; bBranch: boolean);
begin
  if bBranch then
    begin
      if bSQLAddBranch = False then
        begin
          tmpQuery.SQL.Add(sTempStr) ;
          bSQLAddBranch := True ;
        end
      else
        tmpQuery.SQL.Add(', ' + sTempStr)
    end
  else
    begin
      if bSQLAdd = False then
        begin
          tmpQuery.SQL.Add(sTempStr) ;
          bSQLAdd := True ;
        end
      else
        tmpQuery.SQL.Add(', ' + sTempStr)
    end;
end;
end.
