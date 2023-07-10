unit pbLUQuotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ImgList, ComCtrls, Buttons, StdCtrls, Grids,
  DBGrids, ToolWin, DB, DBTables, pbQuotesDM, IniFiles, pbJobBagDM;

type
  TfrmPBLUQuotes = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnPrint: TToolButton;
    ToolButton3: TToolButton;
    btnReports: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    btnSearch: TBitBtn;
    stsbrDetails: TStatusBar;
    imglstButtons: TImageList;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    pmnuCopy: TMenuItem;
    pmnuPrint: TMenuItem;
    N3: TMenuItem;
    ResetGrid1: TMenuItem;
    lblShowLive: TLabel;
    btnDelete: TToolButton;
    btnConvert: TToolButton;
    ToolButton1: TToolButton;
    btnRequote: TToolButton;
    pmnuReQuote: TMenuItem;
    pmnuDelete: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnReportsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure btnWonClick(Sender: TObject);
    procedure btnRequoteClick(Sender: TObject);
  private
    FActivated: boolean;
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    iMnuMaint: integer;
    iOperatorRep: Integer;
    FDisableNameChangeEvent: boolean;
    dtmdlAllQuotes : TdtmdlQuotes;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TQMode);
    function CheckInput: boolean;
    procedure ConvertToJob;
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUQuotes: TfrmPBLUQuotes;

implementation

uses pbDatabase, pbMainMenu, CCSCommon, pbluQuotesSearch, PBMaintQuote,
  PBRSQuote, PBMaintJobBag, pbLUQuoteRpts;

{$R *.dfm}

procedure TfrmPBLUQuotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'QuoteLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmPBLUQuotes.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUQuotes.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllQuotes.refreshdata;
end;

procedure TfrmPBLUQuotes.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowLive: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Quote Search Date', 'None');
      sShowLive := ReadString('Centrereed Broker', 'Show Live Quotes', 'None');
      Free;
    end;

  dtmdlAllQuotes := TdtmdlQuotes.create(self);

  if stempdate = 'None' then
    dtmdlAllQuotes.QuoteDate := Date - 365
  else
    dtmdlAllQuotes.QuoteDate := PBdatestr(stempdate);

  if sShowLive = 'None' then
    dtmdlAllQuotes.ShowLive := false
  else
    dtmdlAllQuotes.ShowLive := true;

  dtmdlAllQuotes.dsQHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllQuotes.dsQHeaderGrid;

  CCSCommon.SetDBGridCols('', 'QuoteLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmPBLUQuotes.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  if dtmdlAllQuotes.ShowLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Quote Search Date', pbdatestr(dtmdlAllQuotes.QuoteDate));
      WriteString('Centrereed Broker', 'Show Live Quotes', sShowLive);
      Free;
    end;

  dtmdlAllQuotes.free;
end;

procedure TfrmPBLUQuotes.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllQuotes do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnReQuote.Enabled := HeaderCount > 0;
    btnConvert.Enabled := HeaderCount > 0;
//    btnWon.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Quote').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblShowLive.Visible := ShowLive;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUQuotes.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUQuotes.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllQuotes.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUQuotes.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUQuotes.CallMaintScreen(aMode: TQMode);
var
  Key : real;
  frm : TPBMaintQuoteFrm;
  aQuote : TQuote;
  OrigAccCtrlMenu: integer;
begin
  if (aMode = qChange) and (dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status').asinteger >= 100) then
    begin
      if MessageDlg('This quote is ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status_Description').asstring +
        ' and can only be viewed - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := qView;
    end;

  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;

  if aMode = qAdd then
    Key := 0
  else
    begin
      Key := dbgDetails.DataSource.DataSet.fieldbyname('Quote').asfloat;
    end;

  try
    aQuote := TQuote.Create(dtmdlAllQuotes);
    try
      aQuote.DbKey := key;
      aQuote.qMode := aMode;
      aQuote.LoadFromDB;
      Frm := TPBMaintQuoteFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.OriginalQuoteFromReQuote := aQuote.dbKey;
        Frm.Quote := aQuote;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        if (dmBroker.iAccCtrlMenu <> 3) and (aMode = qChange) then
          begin
            case dmBroker.LockRecord(floattostr(aQuote.DbKey),'','','','','Quote',Frm.caption,frmPBMainMenu.Workstation,true) of
              0:;
              1: dmBroker.iAccCtrlMenu := 3;
              2: exit
            end
          end;

        Frm.ShowModal;
        if (Frm.ModalResult = mrok)
         then
          begin
            Key := aQuote.DbKey;
            dtmdlAllQuotes.RefreshData;
            dbgDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(Key)),[lopartialKey]) ;
          end;

      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(floattostr(aQuote.DbKey),'','','','','Quote',frmPBMainMenu.Workstation);
      aQuote.Free;
    end;
  finally
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;

end;

procedure TfrmPBLUQuotes.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(qAdd);
end;

procedure TfrmPBLUQuotes.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(qView)
  else
    CallMaintScreen(qChange);
end;

function TfrmpbluQuotes.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Quote', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Quote '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLUQuotes.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBLUQuotes.btnReportsClick(Sender: TObject);
begin
  frmPBLUQuoteRpts := TfrmPBLUQuoteRpts.create(self);
  try
    frmPBLUQuoteRpts.showmodal;
  finally
    frmPBLUQuoteRpts.free;
  end;
end;

procedure TfrmPBLUQuotes.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUQuotes.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if  (Column.Title.Caption <> 'Quantity') and
      (Column.Title.Caption <> 'Total Cost Price') and
      (Column.Title.Caption <> 'Total Sales Price') then
  	begin
      StrPCopy(txt, Column.field.text);
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		StrPCopy(Txt, Column.field.text);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmPBLUQuotes.btnDeleteClick(Sender: TObject);
begin
  if (dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status').asinteger > 40) then
    begin
      MessageDlg('This quote is ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status_Description').asstring +
        ' and therefore cannot be deleted', mtError, [mbAbort], 0);
        Exit;
    end;
  CallMaintScreen(qDelete);
end;

procedure TfrmPBLUQuotes.btnSearchClick(Sender: TObject);
begin
  frmpbLuQuotesSearch := TfrmpbLuQuotesSearch.create(self);
  try
    frmpbLuQuotesSearch.dtmdlSearchQuotes := dtmdlAllQuotes;
    frmpbLuQuotesSearch.edtBranch.text := dtmdlAllQuotes.BranchName;
    frmpbLuQuotesSearch.edtCustOrderNo.Text := dtmdlAllQuotes.CustomerRef;
    frmpbLuQuotesSearch.edtStatus.Text := dtmdlAllQuotes.Status;
    frmpbLuQuotesSearch.edtQuantity.Text := dtmdlAllQuotes.Quantity;
    frmpbLuQuotesSearch.edtDescription.Text := dtmdlAllQuotes.Description;
    frmpbLuQuotesSearch.edtRep.Text := dtmdlAllQuotes.RepName;
    frmpbLuQuotesSearch.edtSubRep.Text := dtmdlAllQuotes.SubRepName;
    frmpbLuQuotesSearch.edtOperator.Text := dtmdlAllQuotes.OperatorName;
    frmpbLuQuotesSearch.edtEndUser.Text := dtmdlAllQuotes.EndUserName;
    frmpbLuQuotesSearch.chkbxShowInactive.checked := (dtmdlAllQuotes.ShowInactive = 'Y');
    frmpbLuQuotesSearch.chkbxShowLive.checked := dtmdlAllQuotes.ShowLive;

    frmpbLuQuotesSearch.edtDate.Text := pbDateStr(dtmdlAllQuotes.QuoteDate);
    frmpbLuQuotesSearch.showModal;
  finally
    frmpbLuQuotesSearch.free;
  end;
end;

procedure TfrmPBLUQuotes.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuQuotes') ;
  if not FActivated then
    begin
//      btnPrint.Visible := false;
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuQuotes') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlAllQuotes.Operator := frmpbMainMenu.iOperator;
      dtmdlAllQuotes.Rep := iOperatorRep;
      dtmdlAllQuotes.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      Factivated := true;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllQuotes.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(ActiveCode)),[lopartialKey]);

end;

procedure TfrmPBLUQuotes.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Quote').asinteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmPBLUQuotes.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('Quote Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmPBLUQuotes.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qCopy);
end;

procedure TfrmPBLUQuotes.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: real;
begin
  if not CheckInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSQuote := TfrmPBRSQuote.Create( Application );
    Key := dbgdetails.DataSource.DataSet.fieldbyname('Quote').asfloat;

    frmPBRSQuote.memSelection.text := floattostr(Key);
    frmPBRSQuote.bProspect := (dbgdetails.DataSource.DataSet.fieldbyname('Ad_hoc_Address').asinteger <> 0);
    frmPBRSQuote.edtCustomer.text := dbgdetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmPBRSQuote.memDescription.text := dbgdetails.DataSource.DataSet.fieldbyname('Description').asstring;
    frmPBRSQuote.memQuantity.text := dbgdetails.DataSource.DataSet.fieldbyname('Quantity').asstring;
    frmPBRSQuote.chkbxEndUSer.Visible := (dbgdetails.DataSource.DataSet.fieldbyname('End_user_Name').asstring <> '');
    frmPBRSQuote.showmodal;
  finally
    frmPBRSQuote.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(Key)),[lopartialKey]) ;
end;

procedure TfrmPBLUQuotes.btnConvertClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  ConvertToJob;

end;

procedure TfrmPBLUQuotes.ConvertToJob;
var
  Key: integer;
  QuoteNo: real;
  frm : TPBMaintJobBagFrm;
  aJob : TJobBag;
  dtmdlJob: TdmJobBag;
  tempDate: TDateTime;
  tempFileName: string;
begin
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger <= 20 then
    begin
      MessageDlg('This is a request for quote and requires an estimate before it can be converted to a job bag', mtError,
        [mbAbort], 0);
      exit;
    end
  else
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >=100 then
    begin
      MessageDlg('Cannot convert this quote, this quote has already been converted to a job bag', mtError,
        [mbAbort], 0);
      exit;
    end;

  if dbgdetails.DataSource.DataSet.FieldByName('inactive').asstring = 'Y' then
    begin
      MessageDlg('Cannot convert this quote, this quote has been declined', mtError,
        [mbAbort], 0);
      exit;
    end;

  if (dbgdetails.DataSource.dataset.fieldbyname('Estimate_File').asstring <> '') then
    begin
      try
        tempDate := dbgdetails.DataSource.dataset.fieldbyname('Date_Last_Estimated').asdatetime;

        tempFileName := dbgdetails.DataSource.dataset.fieldbyname('Estimate_File').asstring;
        if (FileDateToDateTime(FileAge(tempFileName)) > tempDate) then
          begin
            if messagedlg('There is a possibility that the estimate is different to the quote, do you want to go back into the quote and recalculate', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;
            CallMaintScreen(qChange);
            exit;
          end;
      except
      end;
    end;

  if (dbgdetails.DataSource.DataSet.FieldByName('Ad_Hoc_Address').asinteger <> 0) or (dtmdlAllQuotes.IsProspect(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger)) then
    begin
      MessageDlg('This quote is for a prospect, in order to convert this to a job, the prospect must be set up as a customer', mtError,
        [mbAbort], 0);
      exit;
    end;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Quotes cannot be converted for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  if MessageDlg('Do you want to convert quote ' + edtNumber.text + ', to a new job bag?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  dtmdlJob := TdmJobBag.create(application);
  QuoteNo := 0;
  Key := 0;
  try
    aJob := TJobBag.Create(dtmdlJob);
    try
      QuoteNo := dbgdetails.DataSource.DataSet.FieldByName('Quote').asfloat;
      aJob.DataModule.QuoteNo := QuoteNo;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := jbConvert;
        Frm.JobBag := aJob;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          begin
            dtmdlAllQuotes.UpdateQuoteStatus(aJob.DataModule.QuoteNo,100);
          end;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dtmdlJob.free;
    dtmdlAllQuotes.RefreshData;
    dbgDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(QuoteNo)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUQuotes.btnWonClick(Sender: TObject);
begin
(*  if not CheckInput then
    exit;

  SelQuote := dbgDetails.datasource.DataSet.FieldByName('Quote').asinteger;

  if MessageDlg('Confirm this quote has been won!', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    Exit
  else
    begin
      with dtmdlAllQuotes.qryQuoteWon do
        begin
          close;
          parambyname('Quote').asinteger := selQuote ;
          execsql;
        end;
      dtmdlAllQuotes.RefreshData;
      dbgDetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(SelQuote)),[lopartialKey]) ;
    end;
*)
end;

procedure TfrmPBLUQuotes.btnRequoteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qReQuote);
end;

end.
