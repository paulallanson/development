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
unit PBMaintProductRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TPBMaintProductRefFrm = class(TForm)
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CustNameEdit: TEdit;
    BranchNameEdit: TEdit;
    GetFormRefSQL: TQuery;
    FormRefSRC: TDataSource;
    Label6: TLabel;
    RefIDEdit: TEdit;
    RefDescrEdit: TEdit;
    Label8: TLabel;
    MaxSQL: TQuery;
    GetLastSQL: TQuery;
    ChkBoxStockedItem: TCheckBox;
    CheckFormRefSQL: TQuery;
    qryZero: TQuery;
    CompanySQL: TQuery;
    Panel1: TPanel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label11: TLabel;
    edtReorder: TMemo;
    StockRefEdit: TEdit;
    Label3: TLabel;
    CheckFormRef2SQL: TQuery;
    CheckFormRef3SQL: TQuery;
    CheckFormRef4SQL: TQuery;
    qryDelEComm: TQuery;
    qryECommStockRef: TQuery;
    qryCustomer: TQuery;
    lblPrefix: TLabel;
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
  private
    sOldValue: string;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    function duplicatedStockRef(stockRef: string): boolean;
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    sCustName, sBranchName: string;
    sFormRef: string;
  end;

var
  PBMaintProductRefFrm: TPBMaintProductRefFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu;

var
  sPrefix: string;
  
{$R *.DFM}

procedure TPBMaintProductRefFrm.FormActivate(Sender: TObject);
begin
  qryCustomer.close;
  qryCustomer.parambyname('Customer').asinteger := iCust;
  qryCustomer.open;

  sPrefix := qryCustomer.fieldbyname('Product_Code_Prefix').asstring;
  lblPrefix.Caption := 'Prefix: ' + sPrefix;

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
    RefDescrEdit.Text := '';
    RefIDEdit.Text := '';
    StockRefEdit.Text := sPrefix;
    edtReorder.Text := '0';
  end;
  CustNameEdit.Text := sCustName;
  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  //ChkBoxStockedItemClick(Self);
  CheckOK(Self);
  if sFuncMode <> 'D' then
    StockRefEdit.SetFocus;
  if sFuncMode = 'C' then
    begin
      StockRefEdit.SetFocus;
    end;
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmPBMainMenu.iOperator,0,0);
end;

procedure TPBMaintProductRefFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := ((Trim(RefIDEdit.Text) <> '') or (Trim(StockRefEdit.Text) <> '')) and
                      (Trim(RefDescrEdit.Text) <> '') and
                      (edtReorder.text <> '')
end;

procedure TPBMaintProductRefFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProductRefFrm.RefDescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProductRefFrm.OKBitBtnClick(Sender: TObject);
var
  ilength: integer;
begin
  if sFuncMode[1] in ['A','C'] then
  begin
    //if the item is stocked or the user has entered a stock reference
    //then check for duplication of stock reference
    if (self.ChkBoxStockedItem.Checked) or (StockRefEdit.text <> '') then
    begin
      if sFuncMode[1] = 'A' then
      begin{Check the prefix is correct}
        ilength := length(sPrefix);

        if (copy(trim(stockRefEdit.Text),1,ilength) <> sPrefix) and (ilength > 0) then
          begin
            messagedlg('The product code prefix doesn''t match the customer product prefix', mtError, [mbOk], 0);
            exit;
          end;
      end;
      
      //check for same stock ref associated with different form_ref_id
      if trim(StockRefEdit.text) <> '' then
      begin
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

procedure TPBMaintProductRefFrm.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

function TPBMaintProductRefFrm.FormatMemoValue(TempQty, TempFormat, TempError: string; TempNeg: ByteBool): string;
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

procedure TPBMaintProductRefFrm.RefIDEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProductRefFrm.AddZero;
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

procedure TPBMaintProductRefFrm.DeleteZero;
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

function TPBMaintProductRefFrm.GetNextKey: integer;
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

procedure TPBMaintProductRefFrm.ChkBoxStockedItemClick(Sender: TObject);
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

procedure TPBMaintProductRefFrm.FormCreate(Sender: TObject);
begin
  {Check Company file for whether stock is in use}
  with CompanySQL do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintProductRefFrm.RefIDEditExit(Sender: TObject);
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

function TPBMaintProductRefFrm.duplicatedStockRef(stockRef: string): boolean;
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

procedure TPBMaintProductRefFrm.RefIDEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ord(key) of
    34, 39, 44: Key := #0;
  end;
end;

procedure TPBMaintProductRefFrm.StockRefEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ord(key) of
    34, 39, 44: Key := #0;
  end;
end;

procedure TPBMaintProductRefFrm.RefDescrEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case ord(key) of
    34, 39, 44: Key := #0;
  end;
end;

procedure TPBMaintProductRefFrm.StockRefEditChange(Sender: TObject);
begin
  if self.StockRefEdit.Text <> '' then
    ChkBoxStockedItem.checked := true;
  CheckOK(Self);
end;

end.

