unit wtCustomerPriceChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CRControls, Buttons, Mask, ComCtrls, ExtCtrls, DBCtrls,
  Menus, DB, DBTables, DateUtils;

type
  TfrmwtCustomerPriceChange = class(TForm)
    BasisGroup: TRadioGroup;
    lblPriceChange: TLabel;
    Label2: TLabel;
    dtpckEffective: TDateTimePicker;
    Label5: TLabel;
    edtTime: TMaskEdit;
    BitBtn2: TBitBtn;
    btnOK: TBitBtn;
    edtChange: TCREditFloat;
    rdgrpCustomer: TRadioGroup;
    lstbxCustomersCode: TListBox;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    btnCustomer: TButton;
    lstbxCustomers: TListBox;
    rdgrpPriceChange: TRadioGroup;
    rdGrpWTGroups: TRadioGroup;
    grpbxWTGroups: TGroupBox;
    Label3: TLabel;
    dblkpWTGroup: TDBLookupComboBox;
    pmnCustomers: TPopupMenu;
    Delete1: TMenuItem;
    dtsWTGroup: TDataSource;
    qryCustomerGroups: TQuery;
    qryEdgeGroups: TQuery;
    qryWTGroups: TQuery;
    qryPrice: TQuery;
    qryWorktop: TQuery;
    qryCutOut: TQuery;
    qryEdge: TQuery;
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure EnableOK(sender: TObject);
    procedure BasisGroupClick(Sender: TObject);
    procedure rdGrpWTGroupsClick(Sender: TObject);
    procedure rdgrpPriceChangeClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure edtChangeChange(Sender: TObject);
    procedure edtTimeExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Customer: integer;
    procedure RunCutOuts;
    procedure RunEdgeProfiles;
    procedure RunWorktops;
    procedure PerformUpdate(iPricepointer: integer);
  public
    { Public declarations }
  end;

var
  frmwtCustomerPriceChange: TfrmwtCustomerPriceChange;

implementation

uses wtSrchCustomer, wtDataModule, wtMain;

{$R *.dfm}

procedure TfrmwtCustomerPriceChange.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        lstbxCustomers.clear;
        lstbxCustomers.items.Add('All Customers');
        lstbxCustomersCode.Clear;
        grpbxCustomer.enabled := false;
        rdgrpWTGroups.visible := false;
        rdgrpWTGroups.itemindex := 0;
      end;
  1:  begin
        lstbxCustomers.clear;
        grpbxCustomer.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmwtCustomerPriceChange.btnCustomerClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        for iCount := (frmwtSrchCustomer.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtSrchCustomer.dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(frmwtSrchCustomer.dbgDetails.SelectedRows[iCount])) ;
            lstbxCustomersCode.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer').asstring);
            lstbxCustomers.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
          end;
      end;
  finally
    frmwtSrchCustomer.free;

    rdgrpWtGroups.visible := (lstbxCustomers.items.Count = 1) and (rdgrpPriceChange.ItemIndex < 3);
  end;
  enableOK(self);
end;

procedure TfrmwtCustomerPriceChange.EnableOK(sender: TObject);
begin
	btnOK.enabled := (edtChange.text <> '');
end;

procedure TfrmwtCustomerPriceChange.BasisGroupClick(Sender: TObject);
begin
  case BasisGroup.ItemIndex of
  0,1: lblPriceChange.caption := 'Price Change %';
  2:    lblPriceChange.caption := 'New Price'
  end;

end;

procedure TfrmwtCustomerPriceChange.rdGrpWTGroupsClick(Sender: TObject);
begin
  grpbxWTGroups.Visible := (rdGrpWTGroups.itemindex = 1);

  if rdgrpWTGroups.itemindex = 1 then
    begin
      case rdgrpPriceChange.itemindex of
        0:  begin
              qryCustomerGroups.SQL.Text := qryWTGroups.SQL.Text
            end;
        1,2:begin
              qryCustomerGroups.SQL.Text := qryEdgeGroups.sql.text;
            end;
      end;

      with qryCustomerGroups do
        begin
          close;
          parambyname('Customer').asinteger := strtoint(lstbxCustomersCode.Items[0]);
          open;
        end;
    end;
end;

procedure TfrmwtCustomerPriceChange.rdgrpPriceChangeClick(Sender: TObject);
begin
  if rdgrpCustomer.itemindex = 1 then
    begin
      rdgrpWtGroups.visible := (rdgrpPriceChange.itemindex <= 2);
      grpbxWtGroups.visible := (rdgrpWtGroups.itemindex = 1) and (rdgrpPriceChange.itemindex <= 2);
    end;

  if rdgrpPriceChange.itemindex = 3 then
    rdgrpWtGroups.ItemIndex := 0
  else
    begin
      if rdgrpWTGroups.itemindex = 1 then
        begin
          case rdgrpPriceChange.itemindex of
            0:  begin
                qryCustomerGroups.SQL.Text := qryWTGroups.SQL.Text
                end;
            1,2:begin
                qryCustomerGroups.SQL.Text := qryEdgeGroups.sql.text;
                end;
          end;

          with qryCustomerGroups do
            begin
              close;
              parambyname('Customer').asinteger := strtoint(lstbxCustomersCode.Items[0]);
              open;
            end;
        end;
    end;
end;

procedure TfrmwtCustomerPriceChange.Delete1Click(Sender: TObject);
var
  iCount: integer;
begin
  for iCount := pred(lstbxCustomers.items.count) downto 0 do
    begin
      if lstbxCustomers.Selected[iCount] then
        begin
          lstbxCustomers.Items.Delete(iCount);
          lstbxCustomersCode.Items.Delete(iCount);
        end;
    end;
end;

procedure TfrmwtCustomerPriceChange.edtChangeChange(Sender: TObject);
begin
  EnableOK(self);
end;

procedure TfrmwtCustomerPriceChange.edtTimeExit(Sender: TObject);
var
  NewTime: TDateTime;
begin
  if trim((Sender as TMaskEdit).text) = '' then
    exit;
  try
    NewTime := StrToTime((Sender as TMaskEdit).Text);
  except
    begin
      MessageDlg('Invalid Time', mtError, [mbOk], 0);
      (Sender as TMaskEdit).SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmwtCustomerPriceChange.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Confirm that you wish to make these price changes?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  try
	  if rdgrpPriceChange.itemindex = 0 then
  	  RunWorktops
    else
	  if rdgrpPriceChange.itemindex = 1 then
    	RunEdgeProfiles
    else
	  if rdgrpPriceChange.itemindex = 2 then
    	RunCutOuts
    else
	  if rdgrpPriceChange.itemindex = 3 then
  	  begin
  	    RunWorktops;
  	    RunEdgeProfiles;
  	    RunCutOuts;
  	  end;
    MessageDlg('Global price change has completed successfully', mtInformation,[mbOk], 0);
    close;
  except
    MessageDlg('Global price change has encountered an error', mterror,[mbOk], 0);
  end;

end;

procedure TfrmwtCustomerPriceChange.RunWorktops;
var
  iCount: integer;
begin
	with qryWorktop do
  	begin
     	close;
      if lstbxCustomersCode.items.Count > 0 then
        begin
          SQL.Add(' AND (');
          for icount := 0 to pred(lstbxCustomersCode.items.Count) do
            begin
              if iCount = 0 then
                SQL.Add('(Customer = ' + lstbxCustomersCode.items[iCount] + ')')
              else
                SQL.Add(' OR (Customer = ' + lstbxCustomersCode.items[iCount] + ')')
            end;
          SQL.Add(')');
        end;

      if rdgrpWTGroups.ItemIndex = 0 then
        parambyname('Group_Number').AsInteger := 0
      else
        parambyname('Group_Number').AsInteger := dblkpWTGroup.KeyValue;
      parambyname('thickness').AsInteger := 0 ;
      open;
      iCount := recordcount;
      
      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmwtCustomerPriceChange.RunEdgeProfiles;
var
  iCount: integer;
begin
	With qryEdge do
  	begin
     	close;
      if lstbxCustomersCode.items.Count > 0 then
        begin
          SQL.Add(' AND (');
          for icount := 0 to pred(lstbxCustomersCode.items.Count) do
            begin
              if iCount = 0 then
                SQL.Add('(Customer = ' + lstbxCustomersCode.items[iCount] + ')')
              else
                SQL.Add(' OR (Customer = ' + lstbxCustomersCode.items[iCount] + ')')
            end;
          SQL.Add(')');
        end;

      if rdgrpWTGroups.ItemIndex = 0 then
        parambyname('Group_Number').AsInteger := 0
      else
        parambyname('Group_Number').AsInteger := dblkpWTGroup.KeyValue;
      open;

      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmwtCustomerPriceChange.RunCutOuts;
var
  iCount: integer;
begin
	With qryCutOut do
  	begin
     	close;
      if lstbxCustomersCode.items.Count > 0 then
        begin
          SQL.Add(' AND (');
          for icount := 0 to pred(lstbxCustomersCode.items.Count) do
            begin
              if iCount = 0 then
                SQL.Add('(Customer = ' + lstbxCustomersCode.items[iCount] + ')')
              else
                SQL.Add(' OR (Customer = ' + lstbxCustomersCode.items[iCount] + ')')
            end;
          SQL.Add(')');
        end;

      if rdgrpWTGroups.ItemIndex = 0 then
        parambyname('Group_Number').AsInteger := 0
      else
        parambyname('Group_Number').AsInteger := dblkpWTGroup.KeyValue;
      open;

      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmwtCustomerPriceChange.PerformUpdate(iPricepointer: integer);
var
  sText: string;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
	with qryPrice do
  	begin
     	close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Price_pointer').asinteger := iPricepointer;
      open;
      first;
      if recordcount = 0 then exit;
    end;

  DecodeTime(now, Hour, Min, Sec, MSec);

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := incSecond(strtodatetime(datetostr(dtpckEffective.date)+ ' ' + timetostr(strtoTime(edtTime.text))), Sec);

  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := qryPrice.fieldbyname('Price_Basis').asstring;
  if BasisGroup.itemindex = 0 then
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := qryPrice.fieldbyname('Unit_Price').asfloat * (1+(strtofloat(edtChange.Text)/100))
  else
  if BasisGroup.itemindex = 1 then
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := qryPrice.fieldbyname('Unit_Price').asfloat * (1-(strtofloat(edtChange.Text)/100))
  else
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := strtofloat(edtChange.Text);
    
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := qryPrice.fieldbyname('Unit_Cost').asfloat;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := qryPrice.fieldbyname('Price_Unit').asinteger;
	dtmdlWorktops.qryAddPrice.execSQL;
end;

procedure TfrmwtCustomerPriceChange.FormActivate(Sender: TObject);
begin
  dtpckEffective.Date := date;
end;

end.
