unit PBMaintActivity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, DBCtrls, pbActivityDM, DateUtils,
  Grids, DBGrids, ShellAPI, PBDBMemo, DB, ImgList, ToolWin, IniFiles,
  System.ImageList, FireDAC.Stan.Param;

type
  TPBMaintActivityFrm = class(TForm)
    Panel1: TPanel;
    lblDeletePrompt: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    stsbrDetails: TStatusBar;
    pgActivities: TPageControl;
    tbCurrent: TTabSheet;
    tbLinked: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    memDetails: TMemo;
    dblkpType: TDBLookupComboBox;
    btnActivityType: TButton;
    edtSubject: TEdit;
    dblkpPriority: TDBLookupComboBox;
    dblkpStatus: TDBLookupComboBox;
    pnlReminder: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    dtPickerDueDate: TDateTimePicker;
    cmbTime: TComboBox;
    dblkpAssignedTo: TDBLookupComboBox;
    Button4: TButton;
    Panel3: TPanel;
    dbgDetails: TDBGrid;
    Panel17: TPanel;
    Label61: TLabel;
    memNarrative: TMemo;
    pnlTop: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    DBCPhoneText: TDBText;
    DBCEmailText: TDBText;
    edtCustomer: TEdit;
    dblkpBranch: TDBLookupComboBox;
    btnBranch: TButton;
    pnlModule: TPanel;
    Label13: TLabel;
    edtReference: TEdit;
    edtDescription: TEdit;
    btnModuleLU: TButton;
    Button1: TButton;
    dblkpContact: TDBLookupComboBox;
    dblkpModule: TDBLookupComboBox;
    btnCustomer: TButton;
    Button2: TButton;
    DBCMobileText: TDBText;
    TabSheet1: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    lblDocumentDir: TLabel;
    lstvwDocuments: TListView;
    imgIcons: TImageList;
    svDlgOfficeDoc: TSaveDialog;
    imgDocuments: TImageList;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnActivityTypeClick(Sender: TObject);
    procedure btnBranchClick(Sender: TObject);
    procedure dblkpBranchClick(Sender: TObject);
    procedure dblkpStatusClick(Sender: TObject);
    procedure dblkpContactClick(Sender: TObject);
    procedure dblkpTypeClick(Sender: TObject);
    procedure edtSubjectChange(Sender: TObject);
    procedure memDetailsChange(Sender: TObject);
    procedure dblkpAssignedToClick(Sender: TObject);
    procedure dblkpPriorityClick(Sender: TObject);
    procedure dblkpModuleClick(Sender: TObject);
    procedure chkbxReminderClick(Sender: TObject);
    procedure btnModuleLUClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure lstvwDocumentsDblClick(Sender: TObject);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    FActivityCode: integer;
    FMode: TactMode;
    FActivity: TActivity;
    FActivated : Boolean;
    FCustomer: integer;
    FCustomerName: string;
    FEmailAttachment : TstringList;
    FEntity: string;
    PBActivityMemoFrm: TPBDBMemoFrm;
    procedure SetCustomer(const Value: integer);
    procedure SetActivityCode(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetMode(const Value: TactMode);
    procedure SetActivity(const Value: TActivity);
    procedure ShowDetails;
    procedure ShowLinkedActivities;
    procedure GetActivityTypes;
    procedure GetBranches;
    procedure GetBranchContacts;
    procedure SetEntity(const Value: string);
    procedure SetActivityButtons(Sender: TObject; Field: TField);
    procedure ShowNotes(iNotes: integer);
    procedure ShowDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure CheckCustomerContactNotes;
    { Private declarations }
  public
    { Public declarations }
    property Activity: TActivity read FActivity write SetActivity;
    property ActivityCode: integer read FActivityCode write SetActivityCode;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property Entity: string read FEntity write SetEntity;
    property Mode: TactMode read FMode write SetMode;
  end;

var
  PBMaintActivityFrm: TPBMaintActivityFrm;

implementation

uses
  System.UITypes,
  PBLUActivityType, PBLUBranch, PBLUCConta, pbMainMenu, PBLUCustomerEnqs, PBLUCustomerOrders,
  pbLUCustomerJobs, PBLUCust, CCSCommon, pbDatabase;

{$R *.dfm}

{ TPBMaintActivityFrm }

procedure TPBMaintActivityFrm.SetActivity(const Value: TActivity);
begin
  FActivity := Value;
end;

procedure TPBMaintActivityFrm.SetActivityCode(const Value: integer);
begin
  FActivityCode := Value;
end;

procedure TPBMaintActivityFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;

  edtCustomer.Enabled := (FCustomer <> 0);
  btnCustomer.Enabled := (FCustomer <> 0);
end;

procedure TPBMaintActivityFrm.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TPBMaintActivityFrm.SetMode(const Value: TactMode);
begin
  FMode := Value;
end;

procedure TPBMaintActivityFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      with Activity.DataModule do
      begin
        dblkpBranch.ListSource := dtsCustomerBranches;
        dblkpContact.ListSource := dtsContacts;

        dblkpStatus.Listsource := dtsActivityStatus;
        dblkpType.listsource := dtsActivityType;
        dblkpPriority.listsource := dtsActivityPriority;
        dblkpModule.listsource := dtsActivityModule;

        dblkpAssignedTo.Listsource := dtsAssignedTo;

        DBCPhoneText.DataSource := dtsContacts;
        DBCMobileText.DataSource := dtsContacts;
        DBCEmailText.DataSource := dtsContacts;

        dbgDetails.DataSource := dtsGetLinkedActivities;
        dtsGetLinkedActivities.OnDataChange := SetActivityButtons;

        qryAssignedTo.close;
        qryAssignedTo.parambyname('Operator').asinteger := Activity.AssignedTo;
        qryAssignedTo.open;

        qryActivityStatus.close;
        qryActivityStatus.open;

        qryActivityPriority.close;
        qryActivityPriority.open;

        qryActivityModule.close;
        qryActivityModule.open;

        GetActivityTypes;

        GetBranches;
        GetBranchContacts;
      end;

      case Mode of
      actAdd     : Caption := 'Add a new activity ';
      actChange  : Caption := 'Change an activity ';
      actDelete  : Caption := 'Delete an activity ';
      actFollowUp: Caption := 'Follow-up activity ';
      end;  { case }

      if (Mode = actFollowUp) then
        begin
          Activity.DbKey := 0;
          Activity.DateTimeEntered := date;
          Activity.DueDateTime := now;
          Activity.Operator := frmPBMainMenu.iOperator;
          Activity.OperatorName := frmPBMainMenu.sOperator_Name;
          Activity.Narrative := 0;
          Activity.NarrativeText := '';
          Activity.Status := 20; {In Progress}

          Activity.ActivityType := 0;
        end;

      ShowDetails;
      ShowLinkedActivities;
      ShowDocuments;
      EnableOK(Self);

      {Show any contact or customer notes}
      CheckCustomerContactNotes;

      FActivated := true;
    end;
end;

procedure TPBMaintActivityFrm.ShowDetails;
var
  iMinute: integer;
begin
  if Mode = actAdd then
    begin
      edtCustomer.text := Activity.CustomerName;
      dblkpStatus.keyvalue := 20; {In Progress}
      dblkpStatusClick(dblkpStatus);

      dblkpBranch.keyvalue := Activity.Branch;
      dblkpContact.KeyValue := Activity.Contact;
      dblkpType.keyvalue := 0;
      if Entity = 'CUST' then
        dblkpModule.keyvalue := 10
      else
      if Entity = 'ENQUIRY' then
        dblkpModule.keyvalue := 20
      else
      if Entity = 'BUYPRINT' then
        dblkpModule.keyvalue := 30
      else
      if Entity = 'JOBS' then
        dblkpModule.keyvalue := 40
      else
      if Entity = 'PROSPECT' then
        dblkpModule.keyvalue := 50;
      dblkpModuleClick(dblkpModule);

      dblkpAssignedTo.KeyValue := frmPBMainMenu.iOperator;
      dblkpPriority.KeyValue := 20; {Normal}
      edtReference.text := '';
      edtDescription.text := '';
      edtSubject.text := '';
      memDetails.lines.Clear;
      dtPickerDueDate.Date := date;

      iminute := minuteOf(now);
      if iMinute = 0 then
        cmbTime.text := formatdatetime('hh:mm', now)
      else
      if iMinute < 30 then
        cmbTime.text := formatdatetime('hh:mm', incMinute(now, (30 - iMinute)))
      else
        cmbTime.Text := formatdatetime('hh:mm',incMinute(now, (60 - iMinute)));
    end
  else
    begin
      dmBroker.CreateActivityDocDirectory(floattostr(Activity.dbKey));
      
      stsbrDetails.Panels[0].Text := FormatDateTime('"Date/Time Entered: " dd"/"mm"/"yyyy hh:mm', Activity.DateTimeEntered);
      edtCustomer.text := Activity.CustomerName;
      dblkpStatus.keyvalue := Activity.Status;
      dblkpStatusClick(dblkpStatus);

      dblkpBranch.keyvalue := Activity.Branch;
      dblkpContact.KeyValue := Activity.Contact;
      dblkpType.keyvalue := Activity.ActivityType;

      dblkpModule.keyvalue := Activity.Module;
      dblkpModuleClick(dblkpModule);

      dblkpAssignedTo.KeyValue := Activity.AssignedTo;
      dblkpPriority.KeyValue := Activity.Priority;
      edtReference.text := Activity.EntityReference;
      edtDescription.text := Activity.EntityReferenceDescription;
      
      edtSubject.text := Activity.Subject;

      memDetails.text := Activity.NarrativeText;

      try
        dtPickerDueDate.Date := Activity.DueDateTime;
      except
        dtPickerDueDate.Date := date;
      end;

      iminute := minuteOf(Activity.DueDateTime);

      if iMinute = 0 then
        cmbTime.text := formatdatetime('hh:mm', Activity.DueDateTime)
      else
      if iMinute < 30 then
        cmbTime.text := formatdatetime('hh:mm', incMinute(Activity.DueDateTime,(30-iMinute)))
      else
        cmbTime.text := formatdatetime('hh:mm', incMinute(Activity.DueDateTime,(60-iMinute)));
    end;

  lbldeletePrompt.visible := (Mode = actDelete);
end;

procedure TPBMaintActivityFrm.EnableOK(Sender : TObject);
begin
  if (dblkpModule.keyvalue > 10) and (dblkpModule.keyvalue < 50) then
    btnOK.enabled := (edtCustomer.text <> '') and
                   (dblkpStatus.text <> '') and
                   (dblkpBranch.text <> '') and
                   (dblkpContact.text <> '') and
                   (dblkpAssignedTo.text <> '') and
                   (dblkpType.text <> '') and
                   (edtReference.text <> '') and
                   (edtDescription.text <> '') and
                   (edtSubject.text <> '') and
                   (dblkpPriority.text <> '')
  else
    btnOK.enabled := (edtCustomer.text <> '') and
                   (dblkpStatus.text <> '') and
                   (dblkpBranch.text <> '') and
                   (dblkpContact.text <> '') and
                   (dblkpAssignedTo.text <> '') and
                   (dblkpType.text <> '') and
                   (edtSubject.text <> '') and
                   (dblkpPriority.text <> '');
end;


procedure TPBMaintActivityFrm.Button1Click(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := Activity.Customer;
    PBLUCContaFrm.iBranch := Activity.Branch;
    PBLUCContaFrm.sCustName := Activity.CustomerName;
    PBLUCContaFrm.sBranchName := Activity.BranchName;
    PBLUCContaFrm.ShowModal;
  finally
    PBLUCContaFrm.Free;
  end;

  GetBranchContacts;
end;

procedure TPBMaintActivityFrm.btnOKClick(Sender: TObject);
var
  iStatus: integer;
begin
  if Mode = actDelete then
    begin
      if messagedlg('Are you sure you want to delete this activity?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
        Activity.DeleteFromDB
      else
        exit;
    end
  else
    begin
      iStatus := dblkpStatus.keyvalue;
      Activity.DueDateTime := dtPickerDueDate.DateTime + strtotime(cmbTime.text);
//  Activity.DueDateTime := dtPickerDueDate.DateTime;

      if iStatus = 35 then
        Activity.Status := 30
      else
        Activity.Status := dblkpStatus.keyvalue;

      Activity.Priority := dblkpPriority.KeyValue;
      Activity.Module := dblkpModule.KeyValue;
      Activity.Operator := frmPBMainMenu.iOperator;
      Activity.AssignedTo := dblkpAssignedTo.KeyValue;
      Activity.DateTimeEntered := now;
      Activity.SaveToDB(true);

      if iStatus = 35 then
        begin
          if messagedlg('Confirm you wish to create a follow up activity', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
            begin
              self.Mode := actFollowUp;
              if Activity.OriginalActivity = 0 then
                Activity.OriginalActivity := Activity.dbKey;

              FActivated := false;
              FormActivate(self);
              exit;
            end;
        end;
    end;
  self.ModalResult := mrOK;
end;

procedure TPBMaintActivityFrm.btnActivityTypeClick(Sender: TObject);
begin
  PBLUActivityTypeFrm := TPBLUActivityTypeFrm.Create(Self);
  try
    PBLUActivityTypeFrm.bIs_Lookup := False;
    PBLUActivityTypeFrm.bAllow_Upd := True;
    PBLUActivityTypeFrm.ShowModal;
  finally
    PBLUActivityTypeFrm.Free;
  end;

  GetActivityTypes;
end;

procedure TPBMaintActivityFrm.GetActivityTypes;
begin
  with Activity.DataModule.qryActivityType do
    begin
      close;
      open;
      dblkpType.keyvalue := Activity.ActivityType;
    end;
end;

procedure TPBMaintActivityFrm.GetBranches;
begin
  with Activity.DataModule.qryCustomerBranches do
    begin
      close;
      parambyname('Customer').asinteger := Activity.Customer;
      open;
      if recordcount = 1 then
        begin
          dblkpBranch.keyvalue := fieldbyname('Branch_no').asinteger;
          Activity.Branch := dblkpBranch.keyvalue;
        end
      else
        dblkpBranch.keyvalue := Activity.Branch;
    end;
end;

procedure TPBMaintActivityFrm.btnBranchClick(Sender: TObject);
begin
  PBLUBranchFrm := TPBLUBranchFrm.Create(Self);
  try
    PBLUBranchFrm.bIs_Lookup := False;
    PBLUBranchFrm.bAllow_Upd := True;
    PBLUBranchFrm.iCust := Activity.Customer;
    PBLUBranchFrm.sCustName := Activity.CustomerName;
    PBLUBranchFrm.ShowModal;
  finally
    PBLUBranchFrm.Free;
  end;

  GetBranches;
  GetBranchContacts;

end;

procedure TPBMaintActivityFrm.dblkpBranchClick(Sender: TObject);
begin
  Activity.Branch := dblkpBranch.KeyValue;
  Activity.BranchName := dblkpBranch.text;
  GetBranchContacts;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.dblkpStatusClick(Sender: TObject);
begin
  Activity.Status := dblkpStatus.KeyValue;
  pnlReminder.Enabled := (dblkpStatus.KeyValue = 20);

  EnableOK(self);
end;

procedure TPBMaintActivityFrm.dblkpContactClick(Sender: TObject);
var
  iNarrative: integer;
begin
  Activity.Contact := dblkpContact.KeyValue;
  Activity.ContactName := dblkpContact.text;

  iNarrative := dblkpContact.listsource.DataSet.FieldByName('Narrative').AsInteger;
  if iNarrative <> 0 then
    ShowNotes(iNarrative);

  EnableOK(self);
end;

procedure TPBMaintActivityFrm.ShowNotes(iNotes: integer);
var
  PBLUDBMemoFrm: TPBDBMemoFrm;
begin
  PBLUDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBLUDBMemoFrm.bAllow_Upd := False;
    PBLUDBMemoFrm.LoadMemoData(iNotes);
    PBLUDBMemoFrm.ShowModal;
  finally
    PBLUDBMemoFrm.Free;
  end;
end;

procedure TPBMaintActivityFrm.CheckCustomerContactNotes;
var
  iNarrative: integer;
begin
  with Activity.datamodule.qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := Activity.Customer;
      parambyname('Branch_no').asinteger := Activity.Branch;
      parambyname('Contact_no').asinteger := Activity.Contact;
      open;

      if fieldbyname('Contact_Notes').asinteger <> 0 then
        iNarrative := fieldbyname('Contact_Notes').asinteger
      else
      if fieldbyname('Branch_Notes').asinteger <> 0 then
        iNarrative := fieldbyname('Branch_Notes').asinteger
      else
        iNarrative := 0;

      if iNarrative > 0 then
        ShowNotes(iNarrative);
    end;
end;

procedure TPBMaintActivityFrm.dblkpTypeClick(Sender: TObject);
begin
  Activity.ActivityType := dblkpType.KeyValue;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.edtSubjectChange(Sender: TObject);
begin
  Activity.Subject := (Sender as TEdit).Text;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.memDetailsChange(Sender: TObject);
begin
  Activity.NarrativeText := (Sender as TMemo).Text;
end;

procedure TPBMaintActivityFrm.dblkpAssignedToClick(Sender: TObject);
begin
  Activity.AssignedTo := dblkpAssignedTo.KeyValue;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.dblkpPriorityClick(Sender: TObject);
begin
  Activity.Priority := dblkpPriority.KeyValue;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.SetEntity(const Value: string);
begin
  FEntity := Value;
//  pnlModule.Visible := (FEntity <> 'CUST');
end;

procedure TPBMaintActivityFrm.GetBranchContacts;
var
  iNarrative: integer;
begin
  with Activity.DataModule.qryContacts do
    begin
      close;
      parambyname('Customer').asinteger := Activity.Customer;
      parambyname('Branch_no').asinteger := Activity.Branch;
      open;
      if recordcount = 1 then
        begin
          dblkpContact.keyvalue := fieldbyname('Contact_no').asinteger;
          Activity.Contact := dblkpContact.keyvalue;

          iNarrative := FieldByName('Narrative').AsInteger;

          if (iNarrative <> 0) and FActivated then
            ShowNotes(iNarrative);
        end
      else
        dblkpContact.keyvalue := Activity.Contact;
    end;
end;

procedure TPBMaintActivityFrm.dblkpModuleClick(Sender: TObject);
begin
  pnlModule.Visible := ((Sender as TDBLookupComboBox).keyvalue > 10) and ((Sender as TDBLookupComboBox).keyvalue < 50);

  if ((Sender as TDBLookupComboBox).keyvalue > 10) and ((Sender as TDBLookupComboBox).keyvalue < 50) then
    begin
      edtReference.Text := '';
      edtDescription.Text := '';
    end;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.chkbxReminderClick(Sender: TObject);
begin
  dtPickerDueDate.enabled := (Sender as TCheckbox).checked;
  cmbTime.enabled := (Sender as TCheckbox).checked;
  dblkpAssignedTo.enabled := (Sender as TCheckbox).checked;
end;

procedure TPBMaintActivityFrm.btnModuleLUClick(Sender: TObject);
var
  Selected: boolean;
begin
  if Activity.DataModule.dtsActivityModule.dataset.fieldbyname('Short_Description').asstring = 'ENQ' then
    begin
      PBLUCustomerEnqsFrm := TPBLUCustomerEnqsFrm.Create(Self);
      try
        PBLUCustomerEnqsFrm.Customer := Activity.Customer;
        PBLUCustomerEnqsFrm.Branch := Activity.Branch;
        PBLUCustomerEnqsFrm.JobBagNo := 0;
        PBLUCustomerEnqsFrm.SearchType := 'A'; {Search for all customer enquiries}
        PBLUCustomerEnqsFrm.CustomerName := Trim(Activity.CustomerName) + '/' + Trim(Activity.BranchName);
        PBLUCustomerEnqsFrm.ShowModal;
        Selected := PBLUCustomerEnqsFrm.Selected;
        if Selected then
        begin
          Activity.EntityReference := inttostr(PBLUCustomerEnqsfrm.SelCode);
          Activity.EntityReferenceDescription := PBLUCustomerEnqsfrm.SelDescription;
          edtReference.text := inttostr(PBLUCustomerEnqsfrm.SelCode);
          edtDescription.text := PBLUCustomerEnqsfrm.SelDescription;
        end;
      finally
        PBLUCustomerEnqsFrm.Free;
      end;
    end
  else
  if Activity.DataModule.dtsActivityModule.dataset.fieldbyname('Short_Description').asstring = 'BUYPRINT' then
    begin
      PBLUCustomerOrdersFrm := TPBLUCustomerOrdersFrm.Create(Self);
      try
        PBLUCustomerOrdersFrm.Customer := Activity.Customer;
        PBLUCustomerOrdersFrm.Branch := Activity.Branch;
        PBLUCustomerOrdersFrm.CustomerName := Trim(Activity.CustomerName) + '/' + Trim(Activity.BranchName);
        PBLUCustomerOrdersFrm.ShowModal;
        Selected := PBLUCustomerOrdersFrm.Selected;
        if Selected then
        begin
          Activity.EntityReference := floattostr(PBLUCustomerOrdersFrm.SelCode);
          Activity.EntityReferenceDescription := PBLUCustomerOrdersFrm.SelDescription;
          edtReference.text := floattostr(PBLUCustomerOrdersFrm.SelCode);
          edtDescription.text := PBLUCustomerOrdersFrm.SelDescription;
        end;
      finally
        PBLUCustomerOrdersFrm.Free;
      end;
    end
  else
  if Activity.DataModule.dtsActivityModule.dataset.fieldbyname('Short_Description').asstring = 'JOBS' then
    begin
      PBLUCustomerJobsFrm := TPBLUCustomerJobsFrm.Create(Self);
      try
        PBLUCustomerJobsFrm.Customer := Activity.Customer;
        PBLUCustomerJobsFrm.Branch := Activity.Branch;
        PBLUCustomerJobsFrm.CustomerName := Trim(Activity.CustomerName);
        PBLUCustomerJobsFrm.ShowModal;
        Selected := PBLUCustomerJobsFrm.Selected;
        if Selected then
        begin
          Activity.EntityReference := floattostr(PBLUCustomerJobsFrm.SelCode);
          Activity.EntityReferenceDescription := PBLUCustomerJobsFrm.SelDescription;
          edtReference.text := floattostr(PBLUCustomerJobsFrm.SelCode);
          edtDescription.text := PBLUCustomerJobsFrm.SelDescription;
        end;
      finally
        PBLUCustomerJobsFrm.Free;
      end;
    end;
  EnableOK(self);
end;

procedure TPBMaintActivityFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustfrm := TPBLUCustfrm.Create(self);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;
    PBLUCustfrm.bAllow_upd := true;
    PBLUCustfrm.bIncludeProspects := true;

    PBLUCustfrm.Selcode := Activity.Customer;
    PBLUCustfrm.SelBranch := Activity.Branch;

    PBLUCustfrm.SelName := Activity.CustomerName;
    PBLUCustfrm.SelBranchName := Activity.BranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      Activity.Customer := PBLUCustfrm.Selcode;
      Activity.CustomerName := PBLUCustfrm.SelName;
      Activity.Branch := PBLUCustfrm.SelBranch;
      Activity.BranchName := PBLUCustfrm.SelBranchName;

      edtCustomer.text := Activity.CustomerName;
      GetBranches;
      GetBranchContacts;
      EnableOK(self);
    end;
  finally
    PBLUCustfrm.Free;
  end;
end;

procedure TPBMaintActivityFrm.Button2Click(Sender: TObject);
var
  sTo, sSubject, sBody: string;
  docdir, compdir, docExt: string;
  sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
begin
  FEmailAttachment.clear;

  docDir := dmBroker.GetCompanyActivityDirectory + '\' + inttostr(Activity.dbKey);
  compDir := dmBroker.GetCompanyActivityDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  sfilePath := docdir;
  okToSave := false;

  sTo := Trim(DBCEmailText.datasource.DataSet.fieldbyname('Email').asstring);
  sSubject := '';
  sBody := '';

  {Send using Outlook}
  EmailAndSaveBlindViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
    begin
       ShowDocuments;
    end;
end;

procedure TPBMaintActivityFrm.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  FEmailAttachment := TStringList.create;
  pgActivities.ActivePage := tbCurrent;
  CCSCommon.LoadFormLayout(TfrmpbMainMenu.AppIniFile, self);
end;

procedure TPBMaintActivityFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintActivityFrm.ShowLinkedActivities;
begin
  with Activity.DataModule.qryGetLinkedActivities do
    begin
      close;
      parambyname('Activity').asinteger := Activity.dbKey;

      if Activity.OriginalActivity = 0 then
        parambyname('Original_Activity').asinteger := Activity.dbKey
      else
        parambyname('Original_Activity').asinteger := Activity.OriginalActivity;
      open;
    end;
end;

procedure TPBMaintActivityFrm.SetActivityButtons(Sender: TObject;
  Field: TField);
begin
  with Activity.DataModule do
  begin
  end;

  PBActivityMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBActivityMemoFrm.bAllow_Upd := False;
    PBActivityMemoFrm.LoadMemoData(dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    memNarrative.Text := PBActivityMemoFrm.DispMemo.Text ;
  finally
    PBActivityMemoFrm.Free;
  end;
end;

procedure TPBMaintActivityFrm.ShowDocuments;
var
  sPath: string;
begin
  sPath := dmBroker.GetCompanyActivityDirectory + '\' + inttostr(Activity.dbKey) + '\';
  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TPBMaintActivityFrm.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  ListItem: TListItem;
  FileInfo: SHFILEINFO;
begin
  // Create a temporary TIcon
  Icon := TIcon.Create;
  ListView.Items.BeginUpdate;
  try
    // search for the first file
    i := FindFirst(strPath + '*.*', faArchive, SearchRec);
    while i = 0 do
    begin
      with ListView do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          ListItem := ListView.Items.Add;
          //Get The DisplayName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
//          Listitem.Caption := FileInfo.szDisplayName;
          Listitem.Caption := SearchRec.Name;
          // Get The TypeName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_TYPENAME);
          ListItem.SubItems.Add(FileInfo.szTypeName);
          // Get The DateModified
          try
            ListItem.SubItems.Add(DatetimeToStr(FileDateToDateTime(fileage(strPath + ListItem.Caption))));
          except
            ListItem.SubItems.Add('');
          end;

          //Get The Icon That Represents The File
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
          icon.Handle := FileInfo.hIcon;
          ListItem.ImageIndex := ImageList.AddIcon(Icon);
          // Destroy the Icon
          DestroyIcon(FileInfo.hIcon);
        end;
      end;
      i := FindNext(SearchRec);
    end;
  finally
    Icon.Free;
    ListView.Items.EndUpdate;
  end;
end;

procedure TPBMaintActivityFrm.lstvwDocumentsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
    begin
      SortedColumn := Column.Index;
      Descending := False;
    end
  else
    Descending := not Descending;

  TListView(Sender).SortType := stText;
end;

procedure TPBMaintActivityFrm.lstvwDocumentsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]);

  if Descending then
    Compare := -Compare;
end;

procedure TPBMaintActivityFrm.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dmBroker.GetCompanyActivityDirectory + '\' + inttostr(Activity.dbKey) + '\';
  if sPath = '' then
    exit;

  if lstvwDocuments.ItemIndex = -1 then
    begin
      sDoc := '';
      exit;
    end
  else
    begin
      sDoc := lstvwDocuments.Items[lstvwDocuments.ItemIndex].caption;
    end;

  Params := '' ;
  StrPCopy(FiName, sPath + sDoc) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
end;

end.
