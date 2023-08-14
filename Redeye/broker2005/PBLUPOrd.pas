(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look up a Purchase Order form.

VSS Info:
$Header: /PBL D5/PBLUPOrd.pas 47    17/07/03 10:08 Paul $
$History: PBLUPOrd.pas $
 * 
 * *****************  Version 47  *****************
 * User: Paul         Date: 17/07/03   Time: 10:08
 * Updated in $/PBL D5
 * corrected problem when Proof History option was not enabled
 * 
 * *****************  Version 46  *****************
 * User: Paul         Date: 27/06/:3   Time: 15:51
 * Updated in $/PBL D5
 * Changed to display the correct buttons when first going into the lookup
 * screens.
 * 
 * *****************  Version 45  *****************
 * User: Andrewh      Date: 27/06/03   Time: 13:14
 * Updated in $/PBL D5
 * Improve performance
 *
 * *****************  Version 44  *****************
 * User: Paul         Date: 27/06/:3   Time: 9:56
 * Updated in $/PBL D5
 * 
 * *****************  Version 43  *****************
 * User: Andrewh      Date: 26/06/03   Time: 10:41
 * Updated in $/PBL D5
 * 
 * *****************  Version 42  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 41  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 *
 * *****************  Version 40  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 *
 * *****************  Version 39  *****************
 * User: Paul         Date: 8/11/:2    Time: 13:18
 * Updated in $/PBL D5
 * Added Event maintenance to the list of available functions
 *
 * *****************  Version 38  *****************
 * User: Janiner      Date: 7/11/:2    Time: 14:00
 * Updated in $/PBL D5
 * add goods required date to column list
 *
 * *****************  Version 37  *****************
 * User: Paul         Date: 30/08/:2   Time: 17:01
 * Updated in $/PBL D5
 * corrected problem
 * 
 * *****************  Version 36  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 35  *****************
 * User: Paul         Date: 16/08/:2   Time: 14:37
 * Updated in $/PBL D5
 * Changed to check whether Period End has been run.
 * Also to allow the update of Current Period Additonal Charges.
 * 
 * *****************  Version 34  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 33  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 32  *****************
 * User: Paul         Date: 24/01/:2   Time: 10:24
 * Updated in $/PBL D5
 * Changed to display the correct Popup Menus on the grid depending on the
 * function of the lookup.
 * 
 * *****************  Version 31  *****************
 * User: Paul         Date: 17/01/:2   Time: 16:04
 * Updated in $/PBL D5
 * Changed to allow the setting and unsetting of On Hold
 * 
 * *****************  Version 30  *****************
 * User: Paul         Date: 17/01/:2   Time: 14:37
 * Updated in $/PBL D5
 * Updated lookup to show the status of ON Hold in the Status Description
 * 
 * *****************  Version 29  *****************
 * User: Janiner      Date: 17/01/:2   Time: 10:20
 * Updated in $/PBL D5
 * Add new pop-up menu for right click on grid, and load hot keys. Also
 * new hot button for putting an order on hold.
 * 
 * *****************  Version 28  *****************
 * User: Janiner      Date: 15/01/:2   Time: 9:43
 * Updated in $/PBL D5
 * Ensure that when 'display all' button is clicked the search criteria is
 * cleared down and the grid is refreshed.
 * 
 * *****************  Version 27  *****************
 * User: Paul         Date: 29/11/:1   Time: 13:02
 * Updated in $/PBL D5
 * Changed to display warning if Proof has already been printed
 *
 * *****************  Version 26  *****************
 * User: Paul         Date: 26/11/:1   Time: 15:58
 * Updated in $/PBL D5
 * Changed Proof Selection Hot buttons - now uses drop down buttons
 * 
 * *****************  Version 25  *****************
 * User: Paul         Date: 15/11/:1   Time: 11:22
 * Updated in $/PBL D5
 * Changed to allow the entry of a purchase order number with up to 2
 * decimal places
 * 
 * *****************  Version 24  *****************
 * User: Janiner      Date: 2/10/:1    Time: 11:03
 * Updated in $/PBL D5
 * Get selection criteria right for my/all purchase orders/Acks.
 * 
 * *****************  Version 23  *****************
 * User: Paul         Date: 2/10/:1    Time: 9:54
 * Updated in $/PBL D5
 * Added Repeat order option
 * 
 * *****************  Version 22  *****************
 * User: Janiner      Date: 31/07/:1   Time: 14:01
 * Updated in $/PBL D5
 * Add new routine for multi-select range
 * 
 * *****************  Version 21  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:16
 * Updated in $/PBL D5
 * Changed to allow the displaying of Inactive/Active orders depending on
 * selection criteria
 * 
 * *****************  Version 19  *****************
 * User: Paul         Date: 19/03/:1   Time: 11:08
 * Updated in $/PBL D5
 * Changed to introduce a Cool bar and Tool buttons for selection, also to
 * bring most of the standard buttons onto one form.
 * 
 * *****************  Version 18  *****************
 * User: Paul         Date: 6/12/:0    Time: 15:54
 * Updated in $/PBL D5
 * Changed to allow selection of the Purchase Order through the Search
 * button. Only 1000 records are selected from the Query therefore to get
 * a sepecific PO type it in the search screen.
 *
 * *****************  Version 17  *****************
 * User: Davidn       Date: 12/10/00   Time: 12:01
 * Updated in $/PBL D5
 * Allowing the storage of user preferences of dbgrid layout, col order
 * and width, by writing to/reading from sections of the broker.ini file.
 * 
 * *****************  Version 16  *****************
 * User: Davidn       Date: 6/10/00    Time: 13:19
 * Updated in $/PBL D5
 * Set minimum size for form, Added panels to allow form contents to
 * utilise the full form when resized.
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 2/05/:0    Time: 14:06
 * Updated in $/PBL D5
 * Changed to allow the View mode from the PO Lookup screen.
 * 
 * *****************  Version 14  *****************
 * User: Roddym       Date: 16/03/:0   Time: 17:05
 * Updated in $/PBL D5
 * Cosmetic changes to size and layout of forms and lookups.  Refresh data
 * after an add.
 * 
 * *****************  Version 13  *****************
 * User: Roddym       Date: 16/03/:0   Time: 15:09
 * Updated in $/PBL D5
 * New dynamic selection screens for enquiry and purchase order lookups.
 *
 * *****************  Version 12  *****************
 * User: Paul         Date: 18/02/:0   Time: 17:03
 * Updated in $/PBL D5
 * Changed to correct for selecting a PO from Proof History
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 18/02/:0   Time: 16:00
 * Updated in $/PBL D5
 * Changed the Close button to correctly close the form and to set the
 * SELECTED variable to false
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 14/02/:0   Time: 13:33
 * Updated in $/PBL D5
 * Changed to tidy up the display of the Purchase order grid. The new
 * version has the field columns pre-defined in the DBGrid and depending
 * on the check boxes selected determines whether the column is displayed
 * or not. This works with moving the columns around and re-sizing as
 * well. Changes mainly made to the ashowagrid procedure and made the
 * AddtoDBGrid procedure redundant.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 11/02/:0   Time: 16:06
 * Updated in $/PBL D5
 * Changed to standardise on the Query and to show the Enquiry and Line
 * number
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 11/02/:0   Time: 10:41
 * Updated in $/PBL D5
 * Changed to show the PO Line numbers and to sequence in PO/Line order
 *
 * *****************  Version 7  *****************
 * User: Paul         Date: 11/01/:0   Time: 16:11
 * Updated in $/PBL D5
 * Changed to allow the entering of the Purchase Order number directly
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 17/12/99   Time: 10:58
 * Updated in $/PBL D5
 * Changes made to display the correct series of buttons when selecting PO
 * Maint, Delete PO's and PO selection
 *
 * *****************  Version 5  *****************
 * User: Debbies      Date: 16/12/99   Time: 16:48
 * Updated in $/PBL D5
 * Add SelectBtn to LUFrm
 * 
 * *****************  Version 4  *****************
 * User: Debbies      Date: 16/12/99   Time: 14:34
 * Updated in $/PBL D5
 *
 * *****************  Version 3  *****************
 * User: Debbies      Date: 16/12/99   Time: 10:53
 * Updated in $/PBL D5
 * Disable SelectBtn on MaintScreen
 *
 * *****************  Version 2  *****************
 * User: Debbies      Date: 9/12/99    Time: 16:47
 * Updated in $/PBL D5
 * Add New FunctionGroupBox
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 16  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:32
 * Updated in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBLUPOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  IniFiles, ComCtrls, ToolWin, Menus, ImgList, CCSCommon;

type
  TPBLUPOrdFrm = class(TForm)
    pnlDetail: TPanel;
    pnlCoolBar: TPanel;
    CoolBar1: TCoolBar;
    EditBar: TToolBar;
    EditImageList: TImageList;
    EditHotImageList: TImageList;
    AddBitBtn: TToolButton;
    ChgBitBtn: TToolButton;
    CopyBitBtn: TToolButton;
    searchbtn: TToolButton;
    PrintBitBtn: TToolButton;
    CloseBitBtn: TToolButton;
    DeleteBar: TToolBar;
    DelBitBtn: TToolButton;
    DelImageList: TImageList;
    DelHotImageList: TImageList;
    ViewBitBtn: TToolButton;
    SearchToolButton: TToolButton;
    ToolButton12: TToolButton;
    SelectBar: TToolBar;
    SelectBitBtn: TToolButton;
    ToolButton10: TToolButton;
    ToolButton13: TToolButton;
    SearchImageList: TImageList;
    SearchHotImageList: TImageList;
    POstatusbar: TStatusBar;
    pnlControl: TPanel;
    pnlUpperControl: TPanel;
    pnlSelectPO: TPanel;
    Label6: TLabel;
    PONumEdit: TEdit;
    AllRecordsChk: TCheckBox;
    ProofBtn: TToolButton;
    ToolButton1: TToolButton;
    CancelToolButton: TToolButton;
    RepeatBitBtn: TToolButton;
    pMnuProof: TPopupMenu;
    PrintApprovalForm1: TMenuItem;
    ProofHistory1: TMenuItem;
    ToolButton3: TToolButton;
    MaintOrdPopupMenu: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Repeat1: TMenuItem;
    Copy1: TMenuItem;
    Search1: TMenuItem;
    Print1: TMenuItem;
    Proofs1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    DetsDBGrid: TDBGrid;
    OnHold1: TMenuItem;
    DelPopupMenu: TPopupMenu;
    Delete1: TMenuItem;
    View1: TMenuItem;
    N3: TMenuItem;
    Cancel1: TMenuItem;
    Search2: TMenuItem;
    PrintApprovalForm2: TMenuItem;
    ProofHistory2: TMenuItem;
    N4: TMenuItem;
    HoldBitBtn: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    pMnuSearch: TPopupMenu;
    Select1: TMenuItem;
    Search3: TMenuItem;
    Close2: TMenuItem;
    N5: TMenuItem;
    Currentperiodcharges1: TMenuItem;
    ToolButtonDeliv: TToolButton;
    ToolButton7: TToolButton;
    Deliveries1: TMenuItem;
    N6: TMenuItem;
    EventBitbtn: TToolButton;
    tlbtnHistory: TToolButton;
    ResetGrid1: TMenuItem;
    JustMyChkBox: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DetsSRCDataChange(Sender: TObject; Field: TField);
    procedure CopyBitBtnClick(Sender: TObject);
    procedure ViewBitBtnClick(Sender: TObject);
    procedure PONumEditChange(Sender: TObject);
    procedure DetsDBGridExit(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure SearchBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetsDBGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure AllRecordsChkClick(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure CancelToolButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButtonDelivClick(Sender: TObject);
    procedure EventBitbtnClick(Sender: TObject);
    procedure searchbtnClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PONumEditKeyPress(Sender: TObject; var Key: Char);
    procedure RepeatBitBtnClick(Sender: TObject);
    procedure PrintApprovalForm1Click(Sender: TObject);
    procedure ProofHistory1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Change1Click(Sender: TObject);
    procedure Repeat1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Proofs1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure DetsDBGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OnHold1Click(Sender: TObject);
    procedure HoldBitBtnClick(Sender: TObject);
    procedure MaintOrdPopupMenuPopup(Sender: TObject);
    procedure Currentperiodcharges1Click(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure tlbtnHistoryClick(Sender: TObject);
    procedure JustMyChkBoxClick(Sender: TObject);
  published
    procedure FixUpDBGrid(const TempFld, TempTitle: string;
      const TempWidth: Integer; const ShowIt: Boolean);
  private
    FActivated: Boolean;
    FChildLeft, FChildTop : integer;
    bDisableNameChangeEvent: Boolean;
    iPOrdHeadStatus: Integer;
    gridColsMoved: Boolean;
    iOperatorRep: Integer;
    iMnuBtnPOMaint, iMnuBtnPOSend, iMnuBtnDeliv, iMnuBtnProof, iMnuBtnProofHist: Integer ;
    dontSaveLayout: boolean;
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure DisplayDBGridColumns(const sFieldName: string; const ShowIt : Boolean);
    procedure FindInGrid(rTempSel: real; iTempSelLine: integer);
    function SelectLine(Sender: TObject): Boolean;
    procedure ShowPONo(Sender: TObject);
    function FindOrder(rOrderNo: real; iOrderLine: integer):boolean;
    procedure BuildFunctionBox;
    procedure ShowGrid;
  protected
    procedure POLUChildClosed(var Message: TMessage); message POLU_ChildClosed;
    procedure POLUSelectionChanged(var Message: TMessage); message POLU_SelectionChanged;
  public
    SelCode: real;
    SelLine, iCust, iCustBranch, iOperator: Integer;
    sCustBranchName: string;
    bIs_Lookup, bAllow_Upd, bSel_Line, bNot_In_JB,
      bCopy_PO, Selected, bMaintScreen, bMulti_select, bShowAllBrnchs: Boolean;
  end;

var
  PBLUPOrdFrm: TPBLUPOrdFrm;
  rLastOrder: real;

implementation

uses
  PBMaintPOrd, PBMenuMain, PBLUPOrdLine, PBPOObjects, PBPOToEnq,
  PBLUPOrdDM, PBRSPOrdN, PBLUCust, PBRSProofN, PBLUProofHistN,
  PBMaintPOrdInactive, PBDatabase, PBLUPOLAddChgs, PBLUDeliv, PBLUDelivDM,
  PBLUCConta, PBLUEnqDM, PBPOrdHist, PBPODataMod;

{$R *.DFM}

procedure TPBLUPOrdFrm.FormActivate(Sender: TObject);
begin
{Check if the operator REP is needed} ;
  If dmBroker.iAccCtrlMenu = 4 then
    iOperatorRep := dmBroker.GetOperatorRep(PBMenuMainfrm.iOperator)
  else
    iOperatorRep := 0 ;
  {Get the button statuses} ;
  iMnuBtnPOMaint := dmBroker.GetButtonStatus(PBMenuMainfrm.iOperator, 'POMaintBitBtn') ;
  iMnuBtnPOSend := dmBroker.GetButtonStatus(PBMenuMainfrm.iOperator, 'POSendBitBtn') ;
  iMnuBtnDeliv := dmBroker.GetButtonStatus(PBMenuMainfrm.iOperator, 'DeliveriesBitBtn') ;
  iMnuBtnProof := dmBroker.GetButtonStatus(PBMenuMainfrm.iOperator, 'ProofSendBitBtn') ;
  iMnuBtnProofHist :=dmBroker.GetButtonStatus(PBMenuMainfrm.iOperator, 'ProofHistMaintBitBtn') ;

  if not FActivated then { I shall say thees only wonce }
  begin
    {NOTE: If iCust is not 0, enquiry is locked to show purchase orders with
     lines for the designated customer ONLY. Name should be set to customer name
     Also, if bNot_In_JB is selected, don't select any PO lines on in a Job Bag }
    SelectBitBtn.Visible := false;
    Selected := False;
    dmLookUpPOrd.CustomerNo := iCust;
    dmLookUpPOrd.CustomerBranch := iCustBranch;
    dmLookUpPOrd.ShowAllBranches := bShowAllBrnchs;
    dmLookUpPOrd.NotInJobBag := bNot_In_JB;
    if ioperator = 0 then
      dmLookUpPOrd.Justmine := False
    else
      dmLookUpPOrd.justmine := True;
    if not (bAllow_Upd or bMaintscreen) then
    begin
      if iCust = 0 then
        Caption := 'Lookup a Purchase Order'
      else
        Caption := 'Lookup Purchase Orders For Customer/Branch: ' +
          sCustBranchName;
      SelectBitBtn.Visible := true;
     if bmulti_select then
        DetsDBGrid.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgMultiSelect,dgCancelOnExit]
      else
        DetsDBGrid.Options:=  [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
     end
    else
    begin
      Caption := 'Maintain Purchase Orders';
    end;
    if bCopy_PO then
      if bSel_Line then
        Caption := 'Select a purchase order line to copy'
      else
        Caption := 'Select a purchase order to copy';

    {Load up the string grid}
    ShowGrid;
    if (SelCode <> 0) then
      FindInGrid(SelCode,1);
    DetsDBGrid.DataSource := dmLookUpPOrd.DetsSRC;
    BuildFunctionBox;
    PONumEdit.SetFocus;
    FActivated := true;
  end;
end;

procedure TPBLUPOrdFrm.ShowGrid;
begin
  dmLookUpPOrd.RefreshData;
  with dmLookUpPOrd do
  begin
    DetsSRC.DataSet.Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    HoldBitBtn.Enabled := RecordCount > 0;
    EventBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CopyBitBtn.Enabled := RecordCount > 0;
    ViewBitBtn.Enabled := RecordCount > 0;
    POStatusBar.panels[0].text := IntToStr(RecordCount) + ' purchase orders displayed';
    DetsDBGrid.selectedRows.CurrentRowSelected := Recordcount > 0 ;
    if (recordcount > 0) and (detsDBGrid.SelectedRows.count = 1) then
      ShowPONo(Self);
  end;
end;

procedure TPBLUPOrdFrm.DisplayDBGridColumns(const sFieldName: string;
  const ShowIt : Boolean);
var
  icount: integer;
begin
  for icount := 0 to DetsDBGrid.columns.count - 1 do
  begin
    if DetsDBGrid.columns[icount].fieldname = sFieldName then
    begin
      DetsDBGrid.columns[icount].visible := ShowIt;
      break;
    end;
  end
end;

procedure TPBLUPOrdFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
  SelectCode(Self);
end;

procedure TPBLUPOrdFrm.SelectBitBtnClick(Sender: TObject);
begin
  {Find the Purchase Order initially entered}
  if not bmulti_select then
  begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;
  {If the bCopy_PO flag is TRUE but the bSel_Line flasg is FALSE the lookup assumes};
  {we're copying entire purchase orders to new purchase orders}
  {}
  {If the bCopy_PO and bSel_Line flags are both TRUE the lookup assumes we're};
  {copying purchase order lines to enquiries}
  if (not SelectLine(Self)) then Exit;
  SelectCode(Self);
  if bCopy_PO then
  begin
    CallMaintScreen('P');
    Exit;
  end;
  if bIs_LookUp then
    Close
  else
    CallMaintScreen('S');
  end
  else
  close;
end;

procedure TPBLUPOrdFrm.SelectCode(Sender: TObject);
begin
  SelCode := dmLookUpPOrd.DetsSRC.DataSet.FieldByName('Purchase_Order').asfloat;
  SelLine := dmLookUpPOrd.DetsSRC.DataSet.FieldByName('Line').AsInteger;
  with dmLookUpPOrd.SelectedSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := SelCode;
    Open;
    First;
  end;
  with dmLookUpPOrd.GetContactSQL do
  begin
    Close;
    ParamByName('Contact_No').AsInteger :=
      dmLookUpPOrd.SelectedSQL.FieldByName('Contact_No').AsInteger;
    ParamByName('Supplier').AsInteger :=
      dmLookUpPOrd.SelectedSQL.FieldByName('Supplier').AsInteger;
    ParamByName('Branch_No').AsInteger :=
      dmLookUpPOrd.SelectedSQL.FieldByName('Branch_No').AsInteger;
    Open;
    First;
  end;
  Selected := True;
  iPOrdHeadStatus :=
    dmLookUpPOrd.SelectedSQl.FieldByName('Purch_Ord_Head_Status').AsInteger;
end;

procedure TPBLUPOrdFrm.DetsDBGridDblClick(Sender: TObject);
begin
  SelectCode(Self);
  if bAllow_Upd then
    ChgBitBtnClick(Self)
  else
    SelectBitBtnClick(Self);
end;

function TPBLUPOrdFrm.FindOrder(rOrderNo: real; iOrderLine: integer):boolean;
var
  rNOrderNo: real;
begin
  result := true;
  rNOrderNo := StrToFloatDef(formatfloat('0.00',rOrderNo), 0, FormatSettings) ;
  FindinGrid(rNOrderNo, iOrderLine);
  if floattostr(rNOrderNo) <> PONumEdit.text then
    begin
     FindinGrid(rLastOrder,selline);
     result := false;
     MessageDlg('Purchase Order '+floattostr(rNOrderNo)+' not found within this list, use the Search button to refine the list', mterror,
      [mbOk], 0);
    end;
end;

procedure TPBLUPOrdFrm.ChgBitBtnClick(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
        SearchBtnClick(self);
       exit;
     end;

  SelectCode(Self);
  {Change a Supplier}
  CallMaintScreen('C');
end;

procedure TPBLUPOrdFrm.DelBitBtnClick(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  SelectCode(Self);
  {Delete a Supplier}
  CallMaintScreen('D');
end;

procedure TPBLUPOrdFrm.CallMaintScreen(sTempFuncMode: Char);
var
  bTempOK, createPO, selectCust: Boolean;
  rTempSel: real;
begin
  {for the view, set the access level to view. Otherwise, give full access} ;
  If sTempFuncMode = 'V' then
        dmBroker.iAccCtrlMenu := 3
  else
        dmBroker.iAccCtrlMenu := 1 ;
  if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'D') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    MessageDlg('This order has been ' +
      dmLookUpPOrd.SelectedSQL.FieldByName('Status_Descr').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the Purchase Order has been included in a invoice Period End}
  if dmLookupPord.PeriodEndRun(dmLookUpPOrd.SelectedSQL.FieldByName('Purchase_order').Asinteger,selline) and
                        (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
    begin
    if MessageDlg('This order has been included in a Period end, the cost and sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'T';
    end
  else
  if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    if MessageDlg('This order has been ' +
      dmLookUpPOrd.SelectedSQL.FieldByName('Status_Descr').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  {Call NEW Purchase Order Maintenance}
  PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
  try
    if (sTempFuncMode = 'P') or (sTempFuncMode = 'M') then
    begin
      if not PBPODM.IsCustomerActive(dmLookUpPOrd.GetDetsSQL.FieldByName('Customer').asInteger) then
      begin
        if sTempFuncMode = 'M' then
        begin
          messageDlg('Customer is inactive. The order cannot be repeated.', mtInformation, [mbOK], 0);
          createPO := false;
        end
        else
        begin
          messageDlg('Customer is inactive. You must select an active customer.', mtInformation, [mbOK], 0);
          createPO := true;
          selectCust := true;
        end;
      end
      else
      begin
        createPO := true;
        selectCust := false;
      end;
    end
    else
    begin
      createPO := true;
      selectCust := false;
    end;

    rTempSel := self.SelCode;
    if createPO then
    begin
      PBMaintPOrdfrm.FuncMode := sTempFuncMode;
      PurchaseOrder.POHeadStatus := iPOrdHeadStatus;
      PBMaintPOrdfrm.SetupDetails(Self);
      PBMaintPOrdfrm.reselectCust := selectCust;

      PBMaintPOrdfrm.ShowModal;
      bTempOK := PBMaintPOrdfrm.bOK;
      rTempSel := PurchaseOrder.PONumber;
    end;
  finally
    PBMaintPOrdfrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid;
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(rTempSel,1);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUPOrdFrm.FindInGrid(rTempSel: real; iTempSelLine: integer);
begin
  DetsDBGrid.DataSource := dmLookUpPOrd.NullSRC;
  {Find the item you just changed}
  with dmLookUpPOrd.DetsSRC.DataSet do
  begin
    First;
    if rTempSel <> 0 then
    begin
      while (not EOF) do
        begin
           if (FieldByName('Purchase_Order').asfloat = rTempSel) and
              (FieldByName('Line').AsInteger = iTempSelLine) then
              break;
           Next;
        end;
    end;
    if not EOF then
       rLastOrder := dmLookUpPOrd.GetDetsSQl.fieldbyname('Purchase_Order').asfloat;
  end;

  DetsDBGrid.DataSource := dmLookUpPOrd.DetsSRC;
end;

procedure TPBLUPOrdFrm.FormCreate(Sender: TObject);
begin
  FChildLeft := -1;
  FChildTop := -1;
  dmLookUpPOrd := TdmLookUpPOrd.Create(Self);
  dmLookUpPOrd.DetsSRC.OnDataChange := DetsSRCDataChange;
  {Set this if a purch order has already been selected}
  SelCode := 0;
  {Set this if a line has already been selected}
  SelLine := 0;
  {Set this if this is a lookup to show the SELECT button etc}
  bIs_Lookup := False;
  {Set this if this to allow ADD/CHANGE/DELETE}
  bAllow_Upd := False;
  {Set this to force the user to select a line}
  bSel_Line := False;
  {Set this to the overdue date - only has effect if above switch is TRUE}
  bDisableNameChangeEvent := False;
  {Set this if Delete option}
  bMaintscreen := false;
  //include all branches in lookups 
  bShowAllBrnchs := true;
                                                                         
  CCSCommon.SetDBGridCols('', 'PurchaseOrderLU Col Order',frmPBMainMenu.AppIniFile, self.DetsDBGrid);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

function TPBLUPOrdFrm.SelectLine(Sender: TObject): Boolean;
begin
  Result := True;
  if bSel_Line then
  begin
    {Copying a purchase order to an enquiry};
    if bCopy_PO then
    begin
      with dmLookUpPOrd.SelectedLineSQl do
      begin
        close;
        parambyname('Purchase_Order').asfloat :=
          dmLookUpPOrd.DetsSrc.dataset.fieldbyname('Purchase_Order').asfloat;
        parambyname('Line').asinteger :=
          dmLookUpPOrd.DetsSrc.dataset.fieldbyname('Line').asinteger;
        open;
      end;
      PBPOToEnqFrm := TPBPOToEnqFrm.Create(Self);
      try
        PBPOToEnqFrm.ShowModal;
        Result := false;
      finally
       PBPOToEnqFrm.Free;
      end;
      if Result then
      begin
        SelCode := dmLookUpPOrd.DetsSrc.dataset.fieldbyname('Purchase_Order').asfloat;
        SelLine := dmLookUpPOrd.DetsSrc.dataset.fieldbyname('Line').asinteger;
      end;
    end;
  end;
end;

procedure TPBLUPOrdFrm.ShowPONo(Sender: TObject);
var
bTempCanUpd, bTempCanAdd: ByteBool;
iTempAccCtrl: Integer ;
begin
  with dmLookUpPOrd do
  begin
    if RecordCount < 1 then
      PONumEdit.Text := ''
    else
      PONumEdit.Text :=
        floatToStr(DetsSRC.DataSet.FieldByName('Purchase_Order').asfloat);
  end;
{They can UPDATE this enquiry if:} ;
{    they have FULL access OR} ;
{    they have REP access and the enquiry is for the operator's rep OR} ;
{    they have OPERATOR access and the enquiry is for the operator} ;
{Use the setting for the PO Maint button on the menu} ;
iTempAccCtrl := iMnuBtnPOMaint ;
bTempCanUpd := ((iTempAccCtrl = 1) or
               ((iTempAccCtrl = 4) and
                        (dmLookUpPOrd.GetDetsSQL.FieldByName('Rep').AsInteger = iOperatorRep)) or
                ((iTempAccCtrl = 5) and
                        (dmLookUpPOrd.GetDetsSQL.FieldByName('Operator').AsInteger = PBMenuMainfrm.iOperator)));
{They can ADD enquiries IF} ;
{    they have FULL, REP or OPERATOR access} ;
bTempCanAdd := ((iTempAccCtrl = 1) or (iTempAccCtrl = 4) or
                                        (iTempAccCtrl = 5)) ;
AddBitBtn.Visible := bTempCanAdd ;
ChgBitBtn.Visible := bTempCanUpd ;
CopyBitBtn.Visible := bTempCanUpd ;
RepeatBitBtn.Visible := bTempCanUpd ;
HoldBitBtn.Visible := bTempCanUpd ;
{Deal with the "Print POs" permissions} ;
PrintBitBtn.Visible := (dmBroker.AccessControlOpRep(iMnuBtnPOSend,PBMenuMainfrm.iOperator,
        dmLookUpPOrd.GetDetsSQL.FieldByName('Operator').AsInteger, dmLookUpPOrd.GetDetsSQL.FieldByName('Rep').AsInteger) = 1) ;
{Deal with the "Deliveries" permissions} ;
ToolButtonDeliv.Visible := (dmBroker.AccessControlOpRep(iMnuBtnDeliv,PBMenuMainfrm.iOperator,
        dmLookUpPOrd.GetDetsSQL.FieldByName('Operator').AsInteger, dmLookUpPOrd.GetDetsSQL.FieldByName('Rep').AsInteger) = 1) ;
CopyBitBtn.Visible := bTempCanUpd ;
EventBitBtn.Visible := bTempCanUpd ;
{Deal with the "Proofs" permissions} ;
PrintApprovalForm1.Enabled := (dmBroker.AccessControlOpRep(iMnuBtnProof,PBMenuMainfrm.iOperator,
            dmLookUpPOrd.GetDetsSQL.FieldByName('Operator').AsInteger, dmLookUpPOrd.GetDetsSQL.FieldByName('Rep').AsInteger) = 1) ;
ProofHistory1.Enabled := (dmBroker.AccessControlOpRep(iMnuBtnProofHist,PBMenuMainfrm.iOperator,
            dmLookUpPOrd.GetDetsSQL.FieldByName('Operator').AsInteger, dmLookUpPOrd.GetDetsSQL.FieldByName('Rep').AsInteger) = 1) ;
ProofBtn.Visible := (PrintApprovalForm1.Enabled) or (ProofHistory1.Enabled) ;
end;

procedure TPBLUPOrdFrm.DetsSRCDataChange(Sender: TObject; Field: TField);
begin
   if (not bMulti_Select) or (detsDBGrid.SelectedRows.Count = 1) then
    ShowPONo(Self);
end;

procedure TPBLUPOrdFrm.CopyBitBtnClick(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  SelectCode(Self);
  {Copy a Purchase Order}
  CallMaintScreen('P');
end;

procedure TPBLUPOrdFrm.ViewBitBtnClick(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  SelectCode(Self);
  {Copy a Purchase Order}
  CallMaintScreen('S');
end;

procedure TPBLUPOrdFrm.PONumEditChange(Sender: TObject);
begin
 {If entering PO number directly then default line to 1}
 selline := 1;
end;

procedure TPBLUPOrdFrm.DetsDBGridExit(Sender: TObject);
begin
  SelectBitBtn.Enabled := True;
  SelectCode(Self);
end;

procedure TPBLUPOrdFrm.CloseBitBtnClick(Sender: TObject);
begin
  if Assigned(PBLUPordSelFrm) then
    PostMessage(PBLUPordSelFrm.Handle, POLU_ParentClosed, 0, 0);
  Selected := False;
  Close;
end;

procedure TPBLUPOrdFrm.BuildFunctionBox;
var
  CanDo1, CanDo2 : Boolean;
begin
  { Decide which buttons/group boxes to show and resize FuncGrpBox
    accordingly. }
  CanDo1 := (bAllow_Upd) ;

  CanDo2 := (bMaintScreen) ;

(*  FuncGrpBox.Visible := CanDo1;
  DeleteGrpBox.Visible := CanDo2;
*)
  Coolbar1.Bands[0].visible := Cando1;
  Coolbar1.Bands[1].visible := Cando2;
  if Coolbar1.Bands[0].visible then
    DetsDBGrid.PopupMenu := MaintOrdPopUpMenu
  else
  if Coolbar1.Bands[1].visible then
    DetsDBGrid.PopUpMenu := DelPopUpMenu
  else
    DetsDBGrid.PopUpMenu := pMnuSearch;

end;

procedure TPBLUPOrdFrm.SearchBitBtnClick(Sender: TObject);
begin
  if Assigned(PBLUPordSelFrm) then
    PBLUPordSelFrm.BringToFront
  else
  begin
    PBLUPordSelFrm:= TPBLUPordSelFrm.Create(Self);
    PBLUPordSelFrm.ParentForm := Self;
    PBLUPordSelFrm.Customer := iCust;
    if FChildLeft >= 0 then
    begin
      PBLUPordSelFrm.Position := poDesigned;
      PBLUPordSelFrm.Left := FChildLeft;
      PBLUPordSelFrm.Top := FChildTop;
    end;
    PBLUPordSelFrm.Show;
  end;
end;

procedure TPBLUPOrdFrm.POLUChildClosed(var Message: TMessage);
begin
  FChildLeft := Message.WParam;
  FChildTop := Message.LParam;
  PBLUPordSelFrm := nil;
  Message.Result := 1;
end;

procedure TPBLUPOrdFrm.POLUSelectionChanged(var Message: TMessage);
begin
  DisplayDBGridColumns('Purchase_Order', dmLookUpPOrd.ShowPONumber);
  DisplayDBGridColumns('Line', dmLookUpPOrd.ShowPONumber);
  DisplayDBGridColumns('Enquiry', dmLookUpPOrd.ShowEnquiryNo);
  DisplayDBGridColumns('Line0', dmLookUpPOrd.ShowEnquiryNo);
  DisplayDBGridColumns('Status_Descr', dmLookUpPOrd.ShowOrderStatus);
  DisplayDBGridColumns('Supp_Name', dmLookUpPOrd.ShowSupplier);
  DisplayDBGridColumns('Suppliers_Desc', dmLookUpPOrd.ShowSupplierDesc);
  DisplayDBGridColumns('Cust_Name', dmLookUpPOrd.ShowCustomer);
  DisplayDBGridColumns('Customers_Desc', dmLookUpPOrd.ShowCustomerDesc);
  DisplayDBGridColumns('Form_reference_ID', dmLookUpPOrd.ShowFormRef);
  DisplayDBGridColumns('Cust_Order_No', dmLookUpPOrd.ShowCustomerRef);
  ShowGrid;
  Message.Result := 1;
end;

procedure TPBLUPOrdFrm.FormDestroy(Sender: TObject);
begin
  dmLookUpPOrd.Free;
end;

procedure TPBLUPOrdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);

begin
  if Self.dontSaveLayout then
  begin
    //dont do anything
  end
  else
  begin
    CCSCommon.SaveDBGridCols('', 'PurchaseOrderLU Col Order', frmPBMainMenu.AppIniFile, self.DetsDBGrid);
    CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  end;
end;

procedure TPBLUPOrdFrm.DetsDBGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  gridColsMoved := true;
end;

procedure TPBLUPOrdFrm.FixUpDBGrid(const TempFld, TempTitle: string;
  const TempWidth: Integer; const ShowIt: Boolean);
var
  icount: integer;
begin
  for icount := 0 to Pred(DetsDBGrid.columns.count) do
  begin
    if DetsDBGrid.columns[icount].fieldname = TempFld then
    begin
      DetsDBGrid.columns[icount].visible := ShowIt;
      DetsDBGrid.Columns[icount].Title.Caption := TempTitle;
      { Only set widths on first call, user may change them }
      if not FActivated then
        DetsDBGrid.Columns[icount].Width := TempWidth * 5;
      break;
    end;
  end;
end;

procedure TPBLUPOrdFrm.AllRecordsChkClick(Sender: TObject);
begin
{  justMyChkBox.checked := not AllRecordschk.checked;
  with Sender as TCheckbox do
    begin
      if checked then
        begin   }
        {If the Search screen has been created then clear the fields}
{        if Assigned(PBLUPordSelFrm) then
          begin
            PBLUPordSelfrm.StatusEdit.clear;
            PBLUPordSelfrm.SuppEdit.Clear;
            PBLUPordSelfrm.SuppDescEdit.Clear;
            PBLUPordSelfrm.CustEdit.Clear;
            PBLUPordSelfrm.CustDescEdit.Clear;
            PBLUPordSelfrm.FormRefEdit.Clear;
            PBLUPordSelfrm.CustRefEdit.Clear;
            PBLUPordSelfrm.PONumberEdit.Clear;
            PBLUPordSelfrm.SearchButtonClick(Self);
          end
        else
          begin
            dmLookUpPOrd.OrderStatus := '';
            dmLookUpPOrd.Supplier := '';
            dmLookUpPOrd.SupplierDesc := '';
            dmLookUpPOrd.Customer := '';
            dmLookUpPOrd.CustomerDesc := '';
            dmLookUpPOrd.FormReference := '';
            dmLookUpPOrd.CustomerRef := '';
            dmLookUpPOrd.PONumber := '';
            dmLookupPord.Refreshdata;
          end;
        end;
    end;}
end;

procedure TPBLUPOrdFrm.Find1Click(Sender: TObject);
begin
  if Assigned(PBLUPordSelFrm) then
    PBLUPordSelFrm.BringToFront
  else
  begin
    PBLUPordSelFrm:= TPBLUPordSelFrm.Create(Self);
    PBLUPordSelFrm.ParentForm := Self;
    PBLUPordSelFrm.Customer := iCust;
    if FChildLeft >= 0 then
    begin
      PBLUPordSelFrm.Position := poDesigned;
      PBLUPordSelFrm.Left := FChildLeft;
      PBLUPordSelFrm.Top := FChildTop;
    end;
    PBLUPordSelFrm.Show;
  end;
end;
procedure TPBLUPOrdFrm.CancelToolButtonClick(Sender: TObject);
var
  btempok: boolean;
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  SelectCode(Self);

  if (iPOrdHeadStatus >= 25) then
  begin
    MessageDlg('This order has been ' +
      dmLookUpPOrd.SelectedSQL.FieldByName('Status_Descr').AsString +
      ', you cannot cancel it', mtError, [mbOK], 0);
    Exit;
  end;

  PBMaintPOrdInactivefrm := TPBMaintPOrdInactivefrm.create(self);

  try
    PBMaintPOrdInactivefrm.rPurchaseOrder := selcode;
    PBMaintPOrdInactiveFrm.iLine := selLine;
    PBMaintPOrdInactivefrm.showmodal;
    if PBMaintPOrdInactivefrm.modalresult = idOK then
      bTempOK := true
    else
      bTempOK := false;
  finally
    PBMaintPOrdInactivefrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid;
  end;
end;

procedure TPBLUPOrdFrm.ToolButton3Click(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  SelectCode(Self);
  {Copy a Purchase Order}
  CallMaintScreen('P');

end;

procedure TPBLUPOrdFrm.ToolButtonDelivClick(Sender: TObject);
var
  tempPONum: double;
begin
   if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  if PONumEdit.Text = '' then exit;

  PBLUDelivFrm := TPBLUDelivFrm.Create(Self);
  PBLUDelivFrm.SearchBitBtn.Visible := False;

  dmLookUpDeliv.DetsSRC.DataSet := dmLookUpDeliv.GetPODelivsSQL;
  dmLookUpDeliv.GetPODelivsSQL.Params[0].AsFloat := StrToFloatDef(PONumEdit.text, 0, FormatSettings);
  dmLookUpDeliv.GetPODelivsSQL.open;
  try
    PBLUDelivFrm.ShowModal;
  finally
    dmLookUpDeliv.GetPODelivsSQL.close;
    PBLUDelivFrm.Free;
  end;

  tempPONum := StrToFloatDef(PONumEdit.text, 0, FormatSettings);
  ShowGrid;

  FindInGrid(tempPONum,1);
  if bIs_Lookup then
    SelectCode(Self);
end;

procedure TPBLUPOrdFrm.EventBitbtnClick(Sender: TObject);
begin
  {Allow entry of events for the selected Customer and Branch}
  PBLUCContaFrm := TPBLUCContaFrm.create(self);
  try
    PBLUCContaFrm.bIs_Lookup := False;
    PBLUCContaFrm.bAllow_Upd := True;
    PBLUCContaFrm.iCust := DetsDBGrid.Datasource.DataSet.FieldByName('Customer').Asinteger;
    PBLUCContaFrm.sCustName := DetsDBGrid.Datasource.DataSet.FieldByName('Cust_Name').Asstring;
    PBLUCContaFrm.iBranch := DetsDBGrid.Datasource.dataset.FieldByName('Branch_No').AsInteger;
    PBLUCContaFrm.sBranchName := DetsDBGrid.Datasource.DataSet.FieldByName('Branch_Name').Asstring;
    PBLUCContaFrm.showmodal;
  finally
    PBLUCContaFrm.free;
  end;
end;

procedure TPBLUPOrdFrm.searchbtnClick(Sender: TObject);
begin
  if Assigned(PBLUPordSelFrm) then
    PBLUPordSelFrm.BringToFront
  else
  begin
    PBLUPordSelFrm:= TPBLUPordSelFrm.Create(Self);
    PBLUPordSelFrm.ParentForm := Self;
    PBLUPordSelFrm.Customer := iCust;
    if FChildLeft >= 0 then
    begin
      PBLUPordSelFrm.Position := poDesigned;
      PBLUPordSelFrm.Left := FChildLeft;
      PBLUPordSelFrm.Top := FChildTop;
    end;
    PBLUPordSelFrm.Show;
  end;

end;

procedure TPBLUPOrdFrm.ToolButton6Click(Sender: TObject);
begin
  if Assigned(PBLUPordSelFrm) then
    PostMessage(PBLUPordSelFrm.Handle, POLU_ParentClosed, 0, 0);
  Selected := False;
  Close;

end;

procedure TPBLUPOrdFrm.PrintBitBtnClick(Sender: TObject);
var
  bTempOK: Boolean;
  rTempSel: real;
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  {Purchase order Print/Fax}
  PBRSPOrdNFrm := TPBRSPOrdNFrm.Create(Self);
  try
    PBRSPOrdNFrm.EnquiryMemo.text := PONumEdit.Text;
    PBRSPOrdNFrm.ShowModal;
    bTempOK := PBRSPOrdNFrm.bOK;
    rTempSel := StrToFloatDef(PONumEdit.Text, 0, FormatSettings);
  finally
    PBRSPOrdNFrm.Free;
  end;

  if bTempOK then
  begin
    ShowGrid;
    begin
      FindInGrid(rTempSel,1);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUPOrdFrm.PONumEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if bIs_Lookup = true then
      SelectBitBtnclick(self)
    else
      ChgBitBtnclick(self);
end;

procedure TPBLUPOrdFrm.RepeatBitBtnClick(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  SelectCode(Self);
  CallMaintScreen('M');
end;

procedure TPBLUPOrdFrm.PrintApprovalForm1Click(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;

  {Check whether the Proof has already been printed}
  if dmLookUpPOrd.DetsSRC.Dataset.fieldbyname('Proof_Revision').asstring <> '' then
  begin
    if MessageDlg('The Proof Approval Form has already been printed - Continue?', mtConfirmation,
        [mbNo, mbYes], 0) <> mrYes then
    Exit;
  end;

  {Proof Print}
  PBRSProofNFrm := TPBRSProofNFrm.Create(Self);
  try
    PBRSProofNFrm.OrderMemo.text := PONumEdit.Text;
    PBRSProofNFrm.iLine := selline;
    PBRSProofNFrm.ShowModal;
  finally
    PBRSProofNFrm.Free;
  end;
end;

procedure TPBLUPOrdFrm.ProofHistory1Click(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
       exit;
     end;
  {Purchase order Print/Fax}
  PBLUProofHistNFrm := TPBLUProofHistNFrm.Create(Self);
  try
    PBLUProofHistNFrm.rpurchord := StrToFloatDef(PONumEdit.Text, 0, FormatSettings);
    PBLUProofHistNFrm.ipurchordline := 1;
    PBLUProofHistNFrm.bAllow_Upd := true;
    PBLUProofHistNFrm.bAllow_Add := true;
    PBLUProofHistNFrm.iDataOp := dmLookUpPOrd.getdetssql.FieldByName('Operator').AsInteger ;
    PBLUProofHistNFrm.iDataRep := dmLookUpPOrd.getdetssql.FieldByName('Rep').AsInteger;
    PBLUProofHistNFrm.ShowModal;
  finally
    PBLUProofHistNFrm.Free;
  end;
end;

procedure TPBLUPOrdFrm.Add1Click(Sender: TObject);
begin
AddBitBtnClick(Self);
end;

procedure TPBLUPOrdFrm.Change1Click(Sender: TObject);
begin
ChgBitBtnClick(Self);
end;

procedure TPBLUPOrdFrm.Repeat1Click(Sender: TObject);
begin
RepeatBitBtnClick(Self);
end;

procedure TPBLUPOrdFrm.Copy1Click(Sender: TObject);
begin
CopyBitBtnClick(Self);
end;

procedure TPBLUPOrdFrm.Search1Click(Sender: TObject);
begin
SearchBitBtnClick(Self);
end;

procedure TPBLUPOrdFrm.Print1Click(Sender: TObject);
begin
  PrintBitBtnClick(Self);
end;

procedure TPBLUPOrdFrm.Proofs1Click(Sender: TObject);
begin
proofbtn.CheckMenuDropdown;
end;

procedure TPBLUPOrdFrm.Close1Click(Sender: TObject);
begin
ToolButton6Click(Self);
end;

procedure TPBLUPOrdFrm.DetsDBGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Coolbar1.Bands[0].visible then
  DetsDBGrid.PopupMenu := MaintOrdPopUpMenu;
if Coolbar1.Bands[1].visible then
  DetsDBGrid.PopUpMenu := pMnuProof ;
end;

procedure TPBLUPOrdFrm.OnHold1Click(Sender: TObject);
begin
  HoldBitBtnClick(self);
end;

procedure TPBLUPOrdFrm.HoldBitBtnClick(Sender: TObject);
var
  rTempSel: real;
  stext: string;
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
        SearchBtnClick(self);
       exit;
     end;

  SelectCode(Self);
  {Put on Hold}
  if (iPOrdHeadStatus >= 22) then
  begin
    MessageDlg('This order has been ' +
      dmLookUpPOrd.SelectedSQL.FieldByName('Status_Descr').AsString +
      ', you cannot change the On Hold status', mtError, [mbOK], 0);
    Exit;
  end;

  if dmLookUpPOrd.DetsSRC.dataset.FieldByName('On_Hold').AsString = 'Y' then
    sText := ' remove the On Hold status for this order.'
  else
    stext := ' place this order On Hold.';

  if MessageDlg('Confirm you wish to'+stext, mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    Exit
  else
    begin
      with dmLookUpPOrd.UpdSelectedLineSQl do
        begin
          close;
          parambyname('Purchase_Order').asfloat :=
            dmLookUpPOrd.DetsSrc.dataset.fieldbyname('Purchase_Order').asfloat;
          parambyname('Line').asinteger :=
            dmLookUpPOrd.DetsSrc.dataset.fieldbyname('Line').asinteger;
          if (dmLookUpPOrd.DetsSRC.dataset.FieldByName('On_Hold').AsString = 'Y') then
            parambyname('On_Hold').asstring := 'N'
          else
            parambyname('On_Hold').asstring := 'Y';
          execsql;
        end;
      rTempSel := StrToFloatDef(PONumEdit.Text, 0, FormatSettings);
      ShowGrid;
      FindInGrid(rTempSel,1);
    end;
end;

procedure TPBLUPOrdFrm.MaintOrdPopupMenuPopup(Sender: TObject);
begin
  OnHold1.checked := (dmLookUpPOrd.DetsSRC.dataset.FieldByName('On_Hold').AsString = 'Y')
end;

procedure TPBLUPOrdFrm.Currentperiodcharges1Click(Sender: TObject);
begin
  if not FindOrder(StrToFloatDef(PONumEdit.text),selline, 0, FormatSettings) then
     begin
       PONumEdit.SetFocus;
        SearchBtnClick(self);
       exit;
     end;

  SelectCode(Self);
  {Call the form to display the current period additionsl charges}

  PBLUPOLAddChgsfrm := TPBLUPOLAddChgsfrm.create(self);
  try
    PBLUPOLAddChgsfrm.PONumber := StrToFloatDef(PONumEdit.text, 0, FormatSettings);
    PBLUPOLAddChgsfrm.Line := selline;

    PBLUPOLAddChgsfrm.showmodal;
  finally
    PBLUPOLAddChgsfrm.free;
  end;
end;

procedure TPBLUPOrdFrm.AddBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  iPOrdHeadStatus := 10;
  {Add a new PO}
  CallMaintScreen('A');
end;

procedure TPBLUPOrdFrm.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('PurchaseOrderLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TPBLUPOrdFrm.tlbtnHistoryClick(Sender: TObject);
var
  PBPOrdHistFrm: TPBPOrdHistFrm;
begin
  if self.DetsDBGrid.DataSource.DataSet.FieldByName('original_order').asFloat = 0.00 then
  begin
    messageDlg('There is no previous order history for this order.', mtInformation, [mbOK], 0);
  end
  else
  begin
    PBPOrdHistFrm := TPBPOrdHistFrm.Create(self);
    try
      PBPOrdHistFrm.PONum :=
        self.DetsDBGrid.DataSource.DataSet.FieldByName('Purchase_Order').asFloat;
      PBPOrdHistFrm.lineNo :=
        self.DetsDBGrid.DataSource.DataSet.FieldByName('line').asInteger;

      PBPOrdHistFrm.ShowModal;
    finally
      PBPOrdHistFrm.Free;
    end;
  end;
end;

procedure TPBLUPOrdFrm.JustMyChkBoxClick(Sender: TObject);
begin
//AllRecordschk.checked := not justMyChkBox.checked;
dmLookUpPOrd.JustMine := justMyChkBox.checked;
dmLookupPord.Refreshdata;
end;

end.


