(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Form Reference.

VSS Info:
$Header: /PBL D5/PBMaintFormRef.pas 16    20/06/03 9:53 Andrewh $
$History: PBMaintFormRef.pas $
 * 
 * *****************  Version 16  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 15  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 14  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 17/01/:3   Time: 16:57
 * Updated in $/PBL D5
 * Removed security line
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 17/12/:2   Time: 10:55
 * Updated in $/PBL D5
 * Changed to allow maintenance of new Stock Reference field
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 1/02/:2    Time: 12:53
 * Updated in $/PBL D5
 * Set the Form Reference Descr to have a space if no description
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 1/10/:1    Time: 16:50
 * Updated in $/PBL D5
 * Changed to allow entry of Reorder level
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 19/03/:1   Time: 10:44
 * Updated in $/PBL D5
 * Changed to allow the entry of a blank description
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 17/02/:0   Time: 11:51
 * Updated in $/PBL D5
 * Changed to correctly check whether the Form Reference ID  currently
 * exists
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 3/02/:0    Time: 16:45
 * Updated in $/PBL D5
 * New insert method to ensure unique keys when adding records.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintFormReference;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintFormReferencefrm = class(TForm)
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CustNameEdit: TEdit;
    BranchNameEdit: TEdit;
    GetFormRefSQL: TFDQuery;
    FormRefSRC: TDataSource;
    Label6: TLabel;
    RefIDEdit: TEdit;
    RefDescrEdit: TEdit;
    Label8: TLabel;
    MaxSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    ChkBoxStockedItem: TCheckBox;
    CheckFormRefSQL: TFDQuery;
    qryZero: TFDQuery;
    CompanySQL: TFDQuery;
    Panel1: TPanel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label11: TLabel;
    edtReorder: TMemo;
    StockRefEdit: TEdit;
    Label3: TLabel;
    CheckFormRef2SQL: TFDQuery;
    CheckFormRef3SQL: TFDQuery;
    CheckFormRef4SQL: TFDQuery;
    qryDelEComm: TFDQuery;
    qryECommStockRef: TFDQuery;
    btnCustomer: TBitBtn;
    qryCheckFormRef5: TFDQuery;
    qryCustProdPrefix: TFDQuery;
    btnStockSelection: TBitBtn;
    btnImage: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure RefIDEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure RefDescrEditChange(Sender: TObject);
    procedure ChkBoxStockedItemClick(Sender: TObject);
    procedure SaveMemoField(Sender: TObject);
    function FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
    procedure FormCreate(Sender: TObject);
    procedure RefIDEditExit(Sender: TObject);
    procedure RefIDEditKeyPress(Sender: TObject; var Key: Char);
    procedure StockRefEditKeyPress(Sender: TObject; var Key: Char);
    procedure RefDescrEditKeyPress(Sender: TObject; var Key: Char);
    procedure StockRefEditChange(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnStockSelectionClick(Sender: TObject);
    procedure btnImageClick(Sender: TObject);
  private
    sOldValue: string;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    function duplicatedStockRef(stockRef: string): boolean;  
    procedure GetProdPrefix;
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    sCustName, sBranchName: string;
    sFormRef: string;
  end;

var
  PBMaintFormReferencefrm: TPBMaintFormReferencefrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUCust, PBLUProd, CCSMaintProdImages;

{$R *.DFM}

procedure TPBMaintFormReferencefrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  GetFormRefSQL.Close;
  GetFormRefSQL.Open;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Form Reference';
  if sFuncMode = 'C' then
    Caption := 'Change a Form Reference Description';
  if sFuncMode = 'D' then
    Caption := 'Delete a Form Reference';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    CustNameEdit.Text := '';
    BranchNameEdit.Text := '';
    RefDescrEdit.Text := '';
    edtReorder.Text := '0';
    btnCustomer.setfocus;
  end;
  CustNameEdit.Text := sCustName;
  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  //ChkBoxStockedItemClick(Self);
  CheckOK(Self);
  if sFuncMode = 'C' then
    begin
      RefIDEdit.SetFocus;
    end;
  dmBroker.ScreenAccessControl(Self,'mnuFormReferences',frmPBMainMenu.iOperator,0,0);
end;

procedure TPBMaintFormReferencefrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := ((Trim(RefIDEdit.Text) <> '') or (Trim(StockRefEdit.Text) <> '')) and
                      (Trim(RefDescrEdit.Text) <> '') and
                      (edtReorder.text <> '') and
                      (CustNameEdit.text <> '') and
                      (BranchNameEdit.text <> '') ;
end;

procedure TPBMaintFormReferencefrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintFormReferencefrm.RefDescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFormReferencefrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A','C'] then
  begin
    //if the item is stocked or the user has entered a stock reference
    //then check for duplication of stock reference
    if (self.ChkBoxStockedItem.Checked) or (StockRefEdit.text <> '') then
    begin
      //check for same stock ref associated with different form_ref_id
      if trim(StockRefEdit.text) <> '' then
      begin
        //check if the stock ref is already on the system as a part code.
        with qryCheckFormRef5 do
        begin
          Close;
          ParamByName('part').AsString := Trim(StockRefEdit.Text) + '';
          ParamByName('Customer').AsInteger := iCust;
          Open;
          if RecordCount > 0 then
          begin
            MessageDlg('This Stock Reference already exists as a part: ' +
              Trim(StockRefEdit.Text) + ' - ' +
              FieldByName('Part_Description').asString +#10#13+
              'used by Customer: ' + FieldByName('name').asString + '\' +
              FieldByName('branch_name').asString, mtInformation, [mbOK], 0);
            Close;
            Exit;
          end;
          Close;
        end;

        with CheckFormRef2SQL do
        begin
          Close;
          ParamByName('stock_reference').AsString := Trim(StockRefEdit.Text) + '';
          ParamByName('Form_Reference_ID').AsString := Trim(RefIDEdit.Text) + '';
          ParamByName('Old_Form_Reference_ID').AsString := Trim(sFormRef) + '';
          Open;
          if RecordCount > 0 then
          begin
            MessageDlg('This Stock Reference is already associated with Form Reference: ' +
              FieldByName('form_reference_id').asString +#10#13+
              'used by Customer: ' + FieldByName('name').asString + '\' +
              FieldByName('branch_name').asString, mtInformation, [mbOK], 0);
            Close;
            Exit;
          end;
          Close;
        end;

        //check for duplication stock_ref against different customer
        with CheckFormRef3SQL do
        begin
          Close;
          ParamByName('Customer').AsInteger := iCust;
          ParamByName('stock_reference').AsString := Trim(StockRefEdit.Text) + '';
          Open;
          if RecordCount > 0 then
          begin
            MessageDlg('This Stock Reference is already associated with Customer: ' +
              FieldByName('name').asString, mtInformation, [mbOK], 0);
            Close;
            Exit;
          end;
          Close;
        end;

        //check that the stock code doesn't include spaces
        if pos(' ',Trim(StockRefEdit.Text)) > 0 then
          begin
            MessageDlg('The stock reference must not contain any spaces as part of the code', mtInformation, [mbOK], 0);
            exit;
          end;
      end;
    end;

    //check for duplication of form ref id at branch level
    if Trim(RefIDEdit.Text) <> '' then
    begin
      with CheckFormRefSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCust;
        ParamByName('Branch_No').AsInteger := iBranch;
        ParamByName('Form_Reference_ID').AsString := Trim(RefIDEdit.Text) + '';
        Open;
        if RecordCount > 0 then
        begin
          if (icode <> fieldbyname('Form_reference').asinteger) then
          begin
            MessageDlg('There is already a Form Reference with this ' +
              'Customer/Branch/ID', mtInformation, [mbOK], 0);
            Close;
            Exit;
          end;
        end;
        Close;
      end;
    end;

    //so the form ref id has NOT been used at this branch already and
    //EITHER (the stock ref is NOT listed against another form_ref_id
    //and the stock ref is NOT associated with another customer)
    //OR (its a non stocked item and no stock ref has been entered
    //so the stock ref is not needed.)
    //so its OK to save.
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Form_Reference').AsInteger := iCode;
      ParamByName('Form_Reference_Descr').AsString :=
        Trim(RefDescrEdit.Text) + ' ';
      ParamByName('Stock_Reference').AsString :=
        Trim(StockRefEdit.Text) + ' ';
      ParamByName('Reorder_Level').Asinteger :=
        strtoint(Trim(edtReorder.Text));
      ParamByName('Form_Reference_ID').AsString :=
        Trim(RefIDEdit.Text) + '';
      if ChkBoxStockedItem.Checked then
        ParamByName('Stocked_Item').AsString := 'Y'
      else
        ParamByName('Stocked_Item').AsString := 'N';
      ExecSQL;
    end;
(*    if (CompanySQl.fieldbyname('Use_Stock_system').asstring = 'Y') and
       ChkBoxStockedItem.Checked then
      UpdatePartDetails;
*)
  end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Form_Reference').AsInteger := iCode;
      ExecSQL;
    end;
    //need to check if the stock reference exists against another form ref
    //if true, leave the ecommerce record intact
    //if false, delete any ecommerce info for the stock ref
    if not duplicatedStockRef(StockRefEdit.text) then
    begin
      qryDelEComm.ParamByName('stock_reference').asString := StockRefEdit.text;
      qryDelEComm.ExecSQL;
    end;
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintFormReferencefrm.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

function TPBMaintFormReferencefrm.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
begin
  {Format the qunatity};
  if Trim(TempQty) = '' then
  begin
    Result := '';
    Exit;
  end;
  try
    begin
      Result := FormatFloat(TempFormat, StrToFloat(TempQty));
      if (StrToFloat(Result) < 0) and (TempNeg = False) then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    MessageDlg('Invalid ' + TempError + ' - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

procedure TPBMaintFormReferencefrm.RefIDEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFormReferencefrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Form_Reference ' +
            '(Customer,Branch_No,Form_Reference, ' +
            'Form_Reference_Descr,Form_Reference_ID,Stocked_Item) ' +
            'VALUES(' + IntToStr(iCust) + ',' + IntToStr(iBranch) + ',0, ' +
            '''Dummy'',''Dummy'',''N'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintFormReferencefrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Form_Reference WHERE Form_Reference=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintFormReferencefrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Form_Reference').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintFormReferencefrm.ChkBoxStockedItemClick(Sender: TObject);
begin
(*  with chkBoxStockedItem do
    begin
      if checked and
        (companysql.fieldbyname('Use_Stock_System').asstring = 'Y') then
        begin
          PartGrpBox.Visible := true;
          PBMaintFormReffrm.height := 444;
          if GetPartDetails then
            LoadPartDetails
          else
            ClearPartDetails;
        end
      else
        begin
          PartGrpBox.Visible := false;
          PBMaintFormReffrm.height := 216;
        end;
    end;
  checkok(self);
*)
end;

procedure TPBMaintFormReferencefrm.FormCreate(Sender: TObject);
begin
  {Check Company file for whether stock is in use}
  with CompanySQL do
    begin
      close;
      open;
    end;
  btnStockSelection.Visible := (CompanySQl.fieldbyname('Use_Stock_System').asstring = 'Y');
end;

procedure TPBMaintFormReferencefrm.RefIDEditExit(Sender: TObject);
begin
  if (self.RefIDEdit.Text <> '') and
     (self.StockRefEdit.Text <> '') and
     (sFuncMode = 'A')then
  begin
    with CheckFormRef4SQL do
    begin
      close;
      ParamByName('customer').asInteger := iCust;
      ParamByName('form_reference_id').asString := RefIDEdit.text;
      ParamByName('stock_reference').asString := StockRefEdit.text;
      open;

      if recordCount > 0 then
      begin
        self.RefDescrEdit.text := FieldByName('Form_Reference_Descr').asString;
      end;
      close;
    end;
  end;
end;

function TPBMaintFormReferencefrm.duplicatedStockRef(stockRef: string): boolean;
begin
  with qryECommStockRef do
  begin
    close;
    paramByName('stock_reference').asString := stockRef;
    open;

    if recordCount > 0 then
      result := true
    else
      result := false;

    close;
  end;
end;

procedure TPBMaintFormReferencefrm.RefIDEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ord(key) of
    34, 39, 44: Key := #0;
  end;
end;

procedure TPBMaintFormReferencefrm.StockRefEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ord(key) of
    34, 39, 44: Key := #0;
  end;
end;

procedure TPBMaintFormReferencefrm.RefDescrEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ord(key) of
    34, 39, 44: Key := #0;
  end;
end;

procedure TPBMaintFormReferencefrm.StockRefEditChange(Sender: TObject);
begin
  if self.StockRefEdit.Text <> '' then
    ChkBoxStockedItem.checked := true;
  btnImage.enabled := StockRefEdit.Text <> '';
  CheckOK(Self);
end;

procedure TPBMaintFormReferencefrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustfrm := TPBLUCustfrm.Create(self);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;
    PBLUCustfrm.bAllow_upd := true;

    PBLUCustfrm.Selcode := iCust;
    PBLUCustfrm.SelBranch := iBranch;

    PBLUCustfrm.SelName := sCustName;
    PBLUCustfrm.SelBranchName := sBranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      iCust := PBLUCustfrm.Selcode;
      iBranch := PBLUCustfrm.SelBranch;
      sCustName := PBLUCustfrm.SelName;
      sBranchName := PBLUCustfrm.SelBranchName;

      CustNameEdit.text := PBLUCustfrm.SelName;
      BranchNameEdit.text := PBLUCustfrm.SelBranchName;
      self.GetProdPrefix;
      checkOK(self);
    end;
  finally
    PBLUCustfrm.Free;
  end;
end;

procedure TPBMaintFormReferencefrm.GetProdPrefix;
begin
  qryCustProdPrefix.close;
  qryCustProdPrefix.ParamByName('customer').asInteger := iCust;
  qryCustProdPrefix.open;

  RefIDEdit.Text := qryCustProdPrefix.fieldByName('Product_Code_Prefix').asString;
  StockRefEdit.Text := RefIDEdit.Text;
  qryCustProdPrefix.close;
end;

procedure TPBMaintFormReferencefrm.btnStockSelectionClick(Sender: TObject);
var
  PBLUProdFrm: TPBLUProdFrm;
begin
  PBLUProdFrm := TPBLUProdFrm.create(self);
  try
    PBLUProdFrm.iCust := iCust;
    PBLUProdFrm.iCustBranch := iBranch;
    PBLUProdFrm.ShowModal;
    if PBLUProdFrm.ModalResult = mrOK then
    begin
      StockRefEdit.text := PBLUProdFrm.part;
    end;
  finally
    PBLUProdFrm.Free;
  end;
end;

procedure TPBMaintFormReferencefrm.btnImageClick(Sender: TObject);
var
  PartImagesFrm: TCCSMaintProdImagesFrm;
begin
  PartImagesFrm := TCCSMaintProdImagesFrm.Create(self);
  try
    PartImagesFrm.display(trim(stockrefedit.text));
  finally
    PartImagesFrm.Free;
  end;
end;

end.

