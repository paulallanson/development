unit pbluContacts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, CCSCommon,
  Buttons, Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmpbluContacts = class(TForm)
    dbgDetails: TDBGrid;
    dtsContacts: TDataSource;
    qryCContacts: TFDQuery;
    qrySContacts: TFDQuery;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnClose: TButton;
    chkbxShowInactive: TCheckBox;
    edtName: TEdit;
    Label1: TLabel;
    SearchTimer: TTimer;
    qryGetCContactDetails: TFDQuery;
    qryGetSContactDetails: TFDQuery;
    qrySetCContactInactive: TFDQuery;
    qrySetSContactInactive: TFDQuery;
    Panel2: TPanel;
    btnAdd: TButton;
    btnChange: TButton;
    btnDelete: TButton;
    btnOnline: TButton;
    btnMove: TButton;
    btnExcel: TBitBtn;
    Button2: TButton;
    qryAddContact: TFDQuery;
    qrySetCContactActive: TFDQuery;
    qryCheckName: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOnlineClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
  private
    ContactName: string;
    FCodeType: string;
    function GetHeaderCount: integer;
    procedure CallMaintCustScreen(sTempFuncMode: string);
    procedure CallMaintSuppScreen(sTempFuncMode: string);
    procedure SetCodeType(const Value: string);
    function CustomerContactOrdersExist: boolean;
    procedure SetCustomerContactInactive;
    procedure SetSupplierContactInactive;
    function SupplierContactOrdersExist: boolean;
  private
    procedure Refreshdata;
    property HeaderCount: integer read GetHeaderCount;
  public
    SomethingChanged: boolean;
    MainName: string;
    Code: integer;
    BranchType: string;
    property CodeType: string read FCodeType write SetCodeType;
  end;

var
  frmpbluContacts: TfrmpbluContacts;

implementation

uses UITypes, PBMaintCConta, PBMaintSConta, pbDatabase, pbMainMenu,
  PBMaintContactOnline, PBMaintContactMulti;

{$R *.DFM}

{ TfrmpbluContacts }

function TfrmpbluContacts.GetHeaderCount: integer;
begin
  if CodeType = 'C' then
    result := qryCContacts.recordcount
  else
    result := qrySContacts.recordcount
end;

procedure TfrmpbluContacts.Refreshdata;
begin
  if CodeType = 'C' then
    begin
    with qryCContacts do
      begin
        close;
        parambyname('Customer').asinteger := Code;
        if chkbxShowInActive.checked then
          parambyname('Inactive').asstring := 'Y'
        else
          parambyname('Inactive').asstring := 'N';
        parambyname('Name').asstring := '%'+ContactName+'%';
        open;
      end;
    dtsContacts.DataSet := qryCContacts;
    end
  else
    begin
    with qrySContacts do
      begin
        close;
        parambyname('Supplier').asinteger := Code;
        if chkbxShowInActive.checked then
          parambyname('Inactive').asstring := 'Y'
        else
          parambyname('Inactive').asstring := 'N';
        parambyname('Name').asstring := '%'+ContactName+'%';
        open;
      end;
    dtsContacts.DataSet := qrySContacts;
    end
end;

procedure TfrmpbluContacts.FormShow(Sender: TObject);
begin
  Refreshdata;
end;

procedure TfrmpbluContacts.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluContacts.SetButtons(Sender: TObject; Field: TField);
begin
  btnChange.enabled := HeaderCount > 0;
  btnDelete.enabled := HeaderCount > 0;
  btnExcel.enabled := HeaderCount > 0;
  btnMove.enabled := HeaderCount > 0;
  if btnOnline.Visible then
    btnOnline.Enabled := HeaderCount > 0;
end;

procedure TfrmpbluContacts.btnChangeClick(Sender: TObject);
begin
  if CodeType = 'C' then
    CallMaintCustScreen('C')
  else
    CallMaintSuppScreen('C')

end;

procedure TfrmpbluContacts.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

function TfrmpbluContacts.SupplierContactOrdersExist: boolean;
begin
  with qryGetSContactDetails do
    begin
      close;
      parambyname('Supplier').asinteger := code;
      parambyname('Branch_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
      parambyname('Contact_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Contact_no').asinteger;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TfrmpbluContacts.SetSupplierContactInactive;
begin
  with qrySetSContactInactive do
    begin
      close;
      parambyname('Supplier').asinteger := code;
      parambyname('Branch_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
      parambyname('Contact_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Contact_no').asinteger;
      execsql;
    end;
end;

function TfrmpbluContacts.CustomerContactOrdersExist: boolean;
begin
  with qryGetCContactDetails do
    begin
      close;
      parambyname('Customer').asinteger := code;
      parambyname('Branch_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
      parambyname('Contact_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Contact_no').asinteger;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TfrmpbluContacts.SetCustomerContactInactive;
begin
  with qrySetCContactInactive do
    begin
      close;
      parambyname('Customer').asinteger := code;
      parambyname('Branch_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
      parambyname('Contact_no').asinteger := dbgDetails.DataSource.DataSet.fieldbyname('Contact_no').asinteger;
      execsql;
    end;
end;

procedure TfrmpbluContacts.CallMaintCustScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTemp: Integer;
begin
  if sTempFuncMode = 'D' then
    begin
      if CustomerContactOrdersExist then
        begin
          if MessageDlg('Cannot delete this contact, orders, jobs or enquiries exist in the system for this person. ' +
                    'Do you want to make them inactive?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
          begin
            SetCustomerContactInactive;
            Refreshdata;
          end;
          exit;
        end;
    end;

  PBMaintCContaFrm := TPBMaintCContaFrm.Create(Self);
  try
    PBMaintCContaFrm.sFuncMode := sTempFuncMode;

    PBMaintCContaFrm.iCust := Code;
    PBMaintCContaFrm.iBranch := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    if sTempFuncMode <> 'A' then
      PBMaintCContaFrm.iCode :=
        dbgDetails.datasource.DataSet.FieldByName('Contact_No').AsInteger
    else
      PBMaintCContaFrm.iCode := 0;
    PBMaintCContaFrm.sCustName := MainName;
    PBMaintCContaFrm.sBranchName := dbgDetails.DataSource.DataSet.fieldbyname('Branch_name').asstring;
    PBMaintCContaFrm.ShowModal;
    bTempOK := (PBMaintCContaFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        somethingchanged := true;
        iTemp := PBMaintCContaFrm.iCode;
        refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Customer;Branch_no;Contact_no', VarArrayOf([Code,PBMaintCContaFrm.iBranch, iTemp]),[lopartialKey]) ;
      end;
  finally
    PBMaintCContaFrm.Free;
  end;
end;

procedure TfrmpbluContacts.CallMaintSuppScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTemp: Integer;
begin
  if sTempFuncMode = 'D' then
    begin
      if SupplierContactOrdersExist then
        begin
          if MessageDlg('Cannot delete this contact, orders, jobs or enquiries exist in the system for this person. ' +
                    'Do you want to make them inactive?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
          begin
            SetSupplierContactInactive;
            Refreshdata;
          end;
          exit;
        end;
    end;

  PBMaintSContaFrm := TPBMaintSContaFrm.Create(Self);
  try
    PBMaintSContaFrm.sFuncMode := sTempFuncMode;

    PBMaintSContaFrm.iSupp := Code;
    PBMaintSContaFrm.iBranch := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    if sTempFuncMode <> 'A' then
      PBMaintSContaFrm.iCode :=
        dbgDetails.datasource.DataSet.FieldByName('Contact_No').AsInteger
    else
      PBMaintSContaFrm.iCode := 0;
    PBMaintSContaFrm.sSuppName := MainName;
    PBMaintSContaFrm.sBranchName := dbgDetails.DataSource.DataSet.fieldbyname('Branch_name').asstring;
    PBMaintSContaFrm.ShowModal;
    bTempOK := (PBMaintSContaFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        somethingchanged := true;
        iTemp := PBMaintSContaFrm.iCode;
        refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Supplier;Branch_no;Contact_no', VarArrayOf([Code, PBMaintSContaFrm.iBranch, iTemp]),[lopartialKey]) ;
      end;
  finally
    PBMaintSContaFrm.Free;
  end;
end;
procedure TfrmpbluContacts.btnAddClick(Sender: TObject);
begin
  if CodeType = 'C' then
    CallMaintCustScreen('A')
  else
    CallMaintSuppScreen('A')

end;

procedure TfrmpbluContacts.btnDeleteClick(Sender: TObject);
begin
  if CodeType = 'C' then
    CallMaintCustScreen('D')
  else
    CallMaintSuppScreen('D')
end;

procedure TfrmpbluContacts.chkbxShowInactiveClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmpbluContacts.SetCodeType(const Value: string);
begin
  FCodeType := Value;
  btnOnline.visible := FCodeType = 'C';
  btnMove.visible := FCodeType = 'C';
(*  if FCodeType = 'C' then
    dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0)
  else
    dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmPBMainMenu.iOperator,0,0)
*)
end;

procedure TfrmpbluContacts.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  somethingChanged := false;
  ContactName := '';
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmpbluContacts.btnOnlineClick(Sender: TObject);
begin
  PBMaintContactOnlineFrm := TPBMaintContactOnlineFrm.create(self);
  try
    PBMaintContactOnlineFrm.iCust := Code;
    PBMaintContactOnlineFrm.iBranch := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    PBMaintContactOnlineFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Contact_No').AsInteger;
    PBMaintContactOnlineFrm.showmodal;
  finally
    PBMaintContactOnlineFrm.free;
  end;
end;

procedure TfrmpbluContacts.edtNameChange(Sender: TObject);
begin
  ContactName := edtName.Text;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TfrmpbluContacts.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  refreshdata;
end;

procedure TfrmpbluContacts.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmpbluContacts.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(frmpbluContacts);
end;

procedure TfrmpbluContacts.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmpbluContacts.Button2Click(Sender: TObject);
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

procedure TfrmpbluContacts.btnMoveClick(Sender: TObject);
var
  iTempCount, iTempContact, iTempBranch, iFirstCode: integer;
  bTempAskDets: boolean;
  iNewCust, iNewBranch: integer;
  sName: string;
begin
  bTempAskDets := false;

  for iTempCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
    begin
      dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iTempCount])) ;
      iTempContact := dbgDetails.datasource.DataSet.fieldbyname('Contact_no').asinteger;
      iTempBranch := dbgDetails.datasource.DataSet.fieldbyname('Branch_no').asinteger;
      sName := dbgDetails.datasource.DataSet.fieldbyname('Contact_Name').asstring;
      if iTempCount = 0 then
        iFirstCode := iTempContact;

      if bTempAskDets = False then
        begin
          PBMaintContactMultiFrm := TPBMaintContactMultiFrm.create(self);
          try
            PBMaintContactMultiFrm.iCustomer := Code;
            PBMaintContactMultiFrm.iBranchNo := iTempBranch;
            PBMaintContactMultiFrm.edtCustomerName.text := MainName;
            PBMaintContactMultiFrm.showmodal;
            if PBMaintContactMultiFrm.bOK = false then
              exit;

            iNewCust := PBMaintContactMultiFrm.iCustomer;
            iNewBranch := PBMaintContactMultiFrm.iBranchNo;
            
            bTempAskDets := True ;
          finally
            PBMaintContactMultiFrm.free;
          end;
        end;

      {Run the update for each Contact selected}
      with qrySetCContactInactive do
        begin
          close ;
          ParamByName('Customer').Asinteger := Code ;
          ParamByName('Branch_no').Asinteger := iTempBranch ;
          ParamByName('Contact_no').Asinteger := iTempContact ;
          execSQL ;
        end;

      {Before adding make sure thsi contact hasn't been here before}
      with qryCheckName do
        begin
          close;
          ParamByName('Customer').Asinteger := iNewCust ;
          ParamByName('Branch_no').Asinteger := iNewBranch ;
          ParamByName('Name').Asstring := sName;
          open;
        end;

      {If operator focund then set them to active}
      if qryCheckName.recordcount > 0 then
        begin
          iTempContact := qryCheckName.fieldbyname('Contact_no').asinteger;

          with qrySetCContactActive do
            begin
              close ;
              ParamByName('Customer').Asinteger := iNewCust ;
              ParamByName('Branch_no').Asinteger := iNewBranch ;
              ParamByName('Contact_no').Asinteger := iTempContact ;
              execSQL ;
            end;
        end
      else
        begin
          with qryAddContact do
            begin
              close ;
              ParamByName('Customer').Asinteger := iNewCust ;
              ParamByName('Branch_no').Asinteger := iNewBranch ;
              ParamByName('OldCustomer').Asinteger := Code ;
              ParamByName('OldBranch').Asinteger := iTempBranch ;
              ParamByName('OldContact').Asinteger := iTempContact ;
              execSQL ;
            end;
        end;
    end;

  {Refresh the data and find the first product}
  Refreshdata;
//  dbgDetails.datasource.DataSet.locate('Customer, Contact_no', Variant(Code, iFirstCode),[lopartialKey]) ;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

end.
