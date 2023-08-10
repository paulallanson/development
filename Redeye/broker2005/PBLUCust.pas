unit PBLUCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  pbCustomerDm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCustFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    dbgDetails: TDBGrid;
    SearchGrpBox: TGroupBox;
    edtName: TEdit;
    tmrSearch: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    ThisChkBox: TCheckBox;
    GoToGrpBox: TGroupBox;
    BranchesBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SelectedSQL: TFDQuery;
    NullSRC: TDataSource;
    DispPanel: TPanel;
    DBCustText: TDBText;
    DBPhoneText: TDBText;
    DBFaxText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    SelBranchBitBtn: TBitBtn;
    RepLabel: TLabel;
    DBRepText: TDBText;
    chkbxShowInactive: TCheckBox;
    LabelsBitBtn: TBitBtn;
    btnStock: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure dbgDetailsColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(Mode: string);
    procedure BranchesBitBtnClick(Sender: TObject);
    procedure ThisChkBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function SelectBranch(Sender: TObject): ByteBool;
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
    procedure SelBranchBitBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure LabelsBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    iOperatorRep: integer;
    dtmdlAllCustomers: TdtmdlCustomers;
    DisableNameChangeEvent: ByteBool;
    procedure SetButtons(Sender: TObject; Field: TField);
  public
    { Public declarations }
    SelCode, iThisCode, SelBranch: Integer;
    SelName, SelBranchName, SelAccount, SelPrefix, SelCCLevel {Cost Centre Level}: string;
    bIs_Lookup, bAllow_Upd, bSel_Branch, Selected, SelectedBranch, bProspects, bIncludeProspects, bEndUsers: ByteBool;
    AcquiredCustomer: boolean;
    procedure ShowCustomerData;
  end;

var
  PBLUCustFrm: TPBLUCustFrm;

implementation

uses pbDatabase, PBMaintCust, PBLUBranch, pbMainMenu, PBDBMemo,
  PBMaintCConta, PBMaintCRep, PBMaintCustStockPrefix;

{$R *.DFM}

procedure TPBLUCustFrm.FormActivate(Sender: TObject);
var
  sLabel: string;
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuCustomers') ;

  if dmBroker.iAccCtrlMenu = 4 then
    iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
  else
    iOperatorRep := 0 ;

  dtmdlAllCustomers.Rep := iOperatorRep;

  Selected := False;
  SelectedBranch := False;

  if bProspects then
    sLabel := 'Prospect'
  else
  if bEndUsers then
    sLabel := 'End User'
  else
    sLabel := 'Customer';

  if bIs_Lookup then
  begin
    Caption := 'Lookup a ' + sLabel;
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
    SelBranchBitBtn.Visible := True;
    LabelsBitBtn.Visible := False ;
  end
  else
  begin
    Caption := 'Maintain ' + sLabel + 's';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
    SelBranchBitBtn.Visible := False;
    LabelsBitBtn.Visible := True ;
  end;
  FuncGrpBox.Visible := (bAllow_Upd);
  ThisChkBox.Visible := (iThisCode <> 0);

  //set the datasource depending on whether prospects or customer
  if bProspects then
    begin
      dtmdlAllCustomers.dtsProspects.OnDataChange := SetButtons;
      dbgDetails.datasource := dtmdlAllCustomers.dtsProspects;
    end
  else
  if bEndUsers then
    begin
      dtmdlAllCustomers.dtsEndUsers.OnDataChange := SetButtons;
      dbgDetails.datasource := dtmdlAllCustomers.dtsEndUsers;
    end
  else
    begin
      dtmdlAllCustomers.dtsCustomers.OnDataChange := SetButtons;
      dbgDetails.datasource := dtmdlAllCustomers.dtsCustomers;
    end;

  dbCustText.DataSource := dbgDetails.DataSource;
  dbPhoneText.DataSource := dbgDetails.DataSource;
  dbFaxText.DataSource := dbgDetails.DataSource;
  dbRepText.DataSource := dbgDetails.DataSource;

  if bProspects then
    dtmdlAllCustomers.RefreshProspectData
  else
  if bEndUsers then
    dtmdlAllCustomers.RefreshEndUserData
  else
    begin
      dtmdlAllCustomers.IncludeLapsed := true;
      dtmdlAllCustomers.IncludeProspects := bIncludeProspects;
      dtmdlAllCustomers.RefreshData;
    end;

  dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(selcode)),[lopartialKey]) ;

  ThisChkBox.Checked := ((iThisCode <> 0) and (iThisCode = SelCode));
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
  btnStock.enabled := true;
end;

procedure TPBLUCustFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllCustomers do
  begin
    if bProspects then
      begin
        AddBitBtn.Enabled := true;
        ChgBitBtn.Enabled := HeaderCountProspect > 0;
        DelBitBtn.Enabled := HeaderCountProspect > 0;
        BranchesBitBtn.Enabled := HeaderCountProspect > 0;
        LabelsBitBtn.Enabled := HeaderCountProspect > 0;
        CountLabel.Caption := inttostr(HeaderCountProspect) + ' records displayed';
      end
    else
    if bEndUsers then
      begin
        AddBitBtn.Enabled := true;
        ChgBitBtn.Enabled := HeaderCountEndUser > 0;
        DelBitBtn.Enabled := HeaderCountendUser > 0;
        BranchesBitBtn.Enabled := HeaderCountendUser > 0;
        LabelsBitBtn.Enabled := HeaderCountendUser > 0;
        CountLabel.Caption := inttostr(HeaderCountendUser) + ' records displayed';
      end
    else
      begin
        AddBitBtn.Enabled := true;
        ChgBitBtn.Enabled := HeaderCount > 0;
        DelBitBtn.Enabled := HeaderCount > 0;
        BranchesBitBtn.Enabled := HeaderCount > 0;
        LabelsBitBtn.Enabled := HeaderCount > 0;
        CountLabel.Caption := inttostr(HeaderCount) + ' records displayed';
      end;
  end;
end;

procedure TPBLUCustFrm.edtNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllCustomers.CustomerName := edtName.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUCustFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  if bProspects then
    dtmdlAllCustomers.RefreshProspectData
  else
  if bEndUsers then
    dtmdlAllCustomers.RefreshEndUserData
  else
    begin
      dtmdlAllCustomers.IncludeLapsed := true;
      dtmdlAllCustomers.RefreshData;
    end;
end;

procedure TPBLUCustFrm.dbgDetailsColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
  SelBranchBitBtn.Enabled := True;
end;

procedure TPBLUCustFrm.SelectBitBtnClick(Sender: TObject);
begin
  if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
 // if (not SelectBranch(Self)) then Exit;
  SelectCode(Self);
  SelBranch :=
          dbgDetails.datasource.DataSet.FieldByName('Branch_No').AsInteger;
  SelBranchName :=
          dbgDetails.datasource.DataSet.FieldByName('Branch_Name').AsString;
  Close;
end;

procedure TPBLUCustFrm.SelectCode(Sender: TObject);
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
  SelName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
  SelAccount := dbgDetails.datasource.DataSet.FieldByName('Account_Code').AsString;
  SelPrefix := dbgDetails.datasource.DataSet.FieldByName('Product_Code_Prefix').AsString;
  SelCCLevel := dbgDetails.datasource.DataSet.FieldByName('Cost_Centre_Level').AsString;
  if dbgDetails.DataSource.DataSet.fieldbyname('Customer_is_Acquired').asstring = 'Y' then
    AcquiredCustomer := true
  else
    AcquiredCustomer := false;

  with SelectedSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := SelCode;
    Open;
    First;
  end;
  Selected := True;
end;

procedure TPBLUCustFrm.dbgDetailsDblClick(Sender: TObject);
begin
   If bIs_Lookup then
     begin
        if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
          ShowNotes(Self);
        // if (not SelectBranch(Self)) then Exit;
        SelectCode(Self);
        SelBranch :=
            dbgDetails.datasource.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
            dbgDetails.datasource.DataSet.FieldByName('Branch_Name').AsString;
        Close;
     end
   else
     ChgBitBtnclick(self);
end;

procedure TPBLUCustFrm.AddBitBtnClick(Sender: TObject);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
(*  {Add a new customer}
  CallMaintScreen('A');
*)
  {Add a new customer}
  PBMaintCustFrm := TPBMaintCustFrm.Create(Self);
  try
    PBMaintCustFrm.sFuncMode := 'A';
    PBMaintCustFrm.Prospect := bProspects;
    PBMaintCustFrm.EndUser := bEndUsers;
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

      if PBMaintCustFrm.Enduser <> true then
        begin
          PBMaintCRepFrm := TPBMaintCRepFrm.Create(Self);
          try
            PBMaintCRepFrm.sFuncMode := 'A';
            PBMaintCRepFrm.iCust := iTempSel;
            PBMaintCRepFrm.iBranch := 0;

            PBMaintCRepFrm.iCode := 0;
            PBMaintCRepFrm.sCustName := PBMaintCustFrm.NameEdit.Text;
            PBMaintCRepFrm.sBranchName := 'Head Office';
            PBMaintCRepFrm.ShowModal;
          finally
            PBMaintCRepFrm.Free;
          end;
        end;
    end;
  finally
    PBMaintCustFrm.Free;
  end;
  if bTempOK then
  begin
    if bProspects then
      dtmdlAllCustomers.RefreshProspectData
    else
    if bEndUsers then
      dtmdlAllCustomers.RefreshEndUserData
    else
      begin
        dtmdlAllCustomers.RefreshData;
      end;

    dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTempSel)),[lopartialKey]) ;
  end;
end;

procedure TPBLUCustFrm.ChgBitBtnClick(Sender: TObject);
begin
//  SelectCode(Self);
  {Change a customer}
  CallMaintScreen('C');
end;

procedure TPBLUCustFrm.DelBitBtnClick(Sender: TObject);
begin
//  SelectCode(Self);
  {Delete a customer}
  CallMaintScreen('D');
end;

procedure TPBLUCustFrm.CallMaintScreen(Mode: string);
var
  bTempOK: ByteBool;
  iTemp: integer;
begin
  PBMaintCustFrm := TPBMaintCustFrm.Create(self);
  try
    PBMaintCustFrm.dtmdlOneCustomer := dtmdlAllCustomers;
    if Mode = 'A' then
      PBMaintCustFrm.iCustomer := 0
    else
      PBMaintCustFrm.iCustomer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;

    PBMaintCustFrm.sFuncMode := Mode;
    PBMaintCustFrm.Prospect := bProspects;
    PBMaintCustFrm.EndUser := bEndUsers;
    PBMaintCustFrm.ShowModal;
    bTempOK := (PBMaintCustFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintCustFrm.iCode;
        if Mode = 'A' then
          edtName.text := PBMaintCustFrm.NameEdit.text
        else
          begin
            if bProspects then
              dtmdlAllCustomers.RefreshProspectData
            else
            if bEndUsers then
              dtmdlAllCustomers.RefreshEndUserData
            else
              begin
                dtmdlAllCustomers.IncludeLapsed := true;
                dtmdlAllCustomers.RefreshData;
              end;

            dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;
          end;
      end;
  finally
    PBMaintCustFrm.Free;
  end;
end;

procedure TPBLUCustFrm.BranchesBitBtnClick(Sender: TObject);
begin
  PBLUBranchFrm := TPBLUBranchFrm.Create(Self);
  try
    PBLUBranchFrm.bIs_Lookup := False;
    PBLUBranchFrm.bAllow_Upd := True;
    PBLUBranchFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBLUBranchFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUBranchFrm.ShowModal;
  finally
    PBLUBranchFrm.Free;
  end;
end;

procedure TPBLUCustFrm.ThisChkBoxClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllCustomers.ShowInactive := chkbxShowInactive.checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUCustFrm.FormCreate(Sender: TObject);
begin
  dtmdlAllCustomers := TdtmdlCustomers.create(self);

  SelCode := 0;
  SelBranch := 0;

  DisableNameChangeEvent := False;
end;

function TPBLUCustFrm.SelectBranch(Sender: TObject): ByteBool;
begin
  Result := True;
  if bSel_Branch then            
  begin
    PBLUBranchFrm := TPBLUBranchFrm.Create(Self);
    try
      PBLUBranchFrm.bIs_Lookup := True;
      PBLUBranchFrm.bAllow_Upd := True;
      PBLUBranchFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
      PBLUBranchFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
      PBLUBranchFrm.ShowModal;
      Result := PBLUBranchFrm.bSelected;
      if Result then
      begin
        SelBranch :=
          PBLUBranchFrm.DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
        SelBranchName :=
          PBLUBranchFrm.DetsSRC.DataSet.FieldByName('Name').AsString;
        SelAccount :=
          PBLUBranchFrm.DetsSRC.DataSet.FieldByName('Account_Code').AsString;
      end;
    finally
      PBLUBranchFrm.Free;
    end;
  end;
end;

procedure TPBLUCustFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllCustomers.ShowInactive := not(chkbxShowInactive.checked);
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUCustFrm.ShowNotes(Sender: TObject);
var
  PBLUDBMemoFrm: TPBDBMemoFrm;
begin
  PBLUDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBLUDBMemoFrm.bAllow_Upd := False;
    PBLUDBMemoFrm.LoadMemoData(dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    PBLUDBMemoFrm.ShowModal;
  finally
    PBLUDBMemoFrm.Free;
  end;
end;

procedure TPBLUCustFrm.SelBranchBitBtnClick(Sender: TObject);
begin
  if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
  if (not SelectBranch(Self)) then
    begin
      SelectedBranch := false;
      Exit;
    end
  else
    SelectedBranch := true;
  Close;
end;

procedure TPBLUCustFrm.CloseBitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TPBLUCustFrm.LabelsBitBtnClick(Sender: TObject);
begin
(*  PBRSCusSupLabsFrm := TPBRSCusSupLabsFrm.Create(Self);
  try
    {Select mode as customer/supplier} ;
    PBRSCusSupLabsFrm.bCustomer := True;
    {Feed in the supplier code} ;
    PBRSCusSupLabsFrm.iCode := DetsSRC.DataSet.FieldByName('Customer').AsInteger;
    PBRSCusSupLabsFrm.sName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBRSCusSupLabsFrm.ShowModal;
  finally
    PBRSCusSupLabsFrm.Free;
  end;
*)end;

procedure TPBLUCustFrm.FormDestroy(Sender: TObject);
begin
  dtmdlAllCustomers.free;
end;

procedure TPBLUCustFrm.FormShow(Sender: TObject);
begin
  edtName.setfocus;
end;

procedure TPBLUCustFrm.ShowCustomerData;
begin
  if bProspects then
    begin
      dbgDetails.datasource := dtmdlAllCustomers.dtsProspects;
      dtmdlAllCustomers.RefreshProspectData
    end
  else
  if bEndUsers then
    begin
      dbgDetails.datasource := dtmdlAllCustomers.dtsEndUsers;
      dtmdlAllCustomers.RefreshEndUserData
    end
  else
    begin
      dbgDetails.datasource := dtmdlAllCustomers.dtsCustomers;
      dtmdlAllCustomers.RefreshData;
    end;

  dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(selcode)),[lopartialKey]) ;
end;

procedure TPBLUCustFrm.btnStockClick(Sender: TObject);
begin
  PBMaintCustStockPrefixFrm := TPBMaintCustStockPrefixFrm.Create(Self);
  try
    PBMaintCustStockPrefixFrm.dtmdlOneCustomer := dtmdlAllCustomers;
    PBMaintCustStockPrefixFrm.iCustomer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBMaintCustStockPrefixFrm.ShowModal;
  finally
    PBMaintCustStockPrefixFrm.Free;
  end;
end;

procedure TPBLUCustFrm.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('Acc_Active').AsString = 'N') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 10) then
    (Sender as TDBGrid).Canvas.Brush.color := clGreen
  else
  if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 20) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 30) then
    (Sender as TDBGrid).Canvas.Brush.color := $000080FF
  else
  if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 40) then
    (Sender as TDBGrid).Canvas.Brush.color := clRed;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

end;

end.
