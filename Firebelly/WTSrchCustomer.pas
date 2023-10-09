unit WTSrchCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTSrchCustomer = class(TForm)
    dbgDetails: TDBGrid;
    qryDetails: TFDQuery;
    dtsDetails: TDataSource;
    tmrSearch: TTimer;
    pnlFunctions: TPanel;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    pnlBottom: TPanel;
    chkbxShowInactive: TCheckBox;
    Label1: TLabel;
    edtSearch: TEdit;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    stbrDetails: TStatusBar;
    btnSweep: TBitBtn;
    qryDelete: TFDQuery;
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSweepClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FCodeSelected: integer;
    FNameSelected: string;
    FRetailCustomer: byteBool;
    FVat: integer;
    FDiscountRate: double;
    FDepositTerms: double;
    FRep: integer;
    FSpeculative: boolean;
    FAddress: integer;
    FUseCustomerFixRates: boolean;
    FSurveyPrice: double;
    FDeliveryPrice: double;
    FInstallationPrice: double;
    procedure SetCodeSelected(const Value: integer);
    procedure SetNameSelected(const Value: string);
    procedure SetRetailCustomer(const Value: byteBool);
    procedure CallMaintScreen(FuncMode: string);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetVat(const Value: integer);
    procedure SetDiscountRate(const Value: double);
    procedure SetDepositTerms(const Value: double);
    procedure SetRep(const Value: integer);
    procedure ShowNotes(Sender: TObject);
    procedure SetSpeculative(const Value: boolean);
    procedure SetAddress(const Value: integer);
    procedure SetUseCustomerFixRates(const Value: boolean);
    procedure SetDeliveryPrice(const Value: double);
    procedure SetInstallationPrice(const Value: double);
    procedure SetSurveyPrice(const Value: double);
    { Private declarations }
  public
    bNewCustomer: boolean;
    procedure Refreshdata;
    property Address: integer read FAddress write SetAddress;
    property CodeSelected: integer read FCodeSelected write SetCodeSelected;
    property DeliveryPrice: double read FDeliveryPrice write SetDeliveryPrice;
    property DepositTerms: double read FDepositTerms write SetDepositTerms;
    property DiscountRate: double read FDiscountRate write SetDiscountRate;
    property InstallationPrice: double read FInstallationPrice write SetInstallationPrice;
    property NameSelected: string read FNameSelected write SetNameSelected;
    property Rep: integer read FRep write SetRep;
    property RetailCustomer: byteBool read FRetailCustomer write SetRetailCustomer;
    property Speculative: boolean read FSpeculative write SetSpeculative;
    property SurveyPrice: double read FSurveyPrice write SetSurveyPrice;
    property UseCustomerFixRates: boolean read FUseCustomerFixRates write SetUseCustomerFixRates;
    property Vat: integer read FVat write SetVat;
  end;

var
  frmWTSrchCustomer: TfrmWTSrchCustomer;

implementation

uses UITypes, WTMaintCustomer, WTDBMemo;

{$R *.dfm}

{ TfrmWTSrchCustomer }

procedure TfrmWTSrchCustomer.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsDetails.dataset do
  begin
    btnChange.Enabled := recordcount > 0;
    btnDelete.Enabled := recordcount > 0;
    btnSweep.Enabled := recordcount > 0;
    btnSelect.Enabled := recordcount > 0;
  end;
end;

procedure TfrmWTSrchCustomer.Refreshdata;
begin
  with qrydetails do
    begin
      close;
      parambyname('Name').asstring := '%' + edtSearch.text + '%';
      if chkbxShowInactive.checked then
        parambyname('Not_Active').asstring := 'Y'
      else
        parambyname('Not_Active').asstring := 'N';
      open;
      if not Locate('Customer', Variant(inttostr(CodeSelected)),[lopartialKey]) then
        first;
    end;

end;

procedure TfrmWTSrchCustomer.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTSrchCustomer.FormShow(Sender: TObject);
begin
  refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtSearch.setfocus;
end;

procedure TfrmWTSrchCustomer.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTSrchCustomer.SetCodeSelected(const Value: integer);
begin
  FCodeSelected := Value;
end;

procedure TfrmWTSrchCustomer.btnSelectClick(Sender: TObject);
begin
  if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);

  CodeSelected := qryDetails.fieldbyname('Customer').asinteger;
  DepositTerms := qryDetails.fieldbyname('Deposit_Terms').asfloat;
  DiscountRate := qryDetails.fieldbyname('Discount_Rate').asfloat;
  NameSelected := qryDetails.fieldbyname('Customer_Name').asstring;
  Rep := qryDetails.fieldbyname('Rep').asinteger;
  RetailCustomer := (qryDetails.fieldbyname('is_retail_customer').asstring = 'Y');
  Speculative := (qryDetails.fieldbyname('Customer_is_Speculative').asstring = 'Y');
  UseCustomerFixRates := (qryDetails.fieldbyname('Use_For_General_Quoting').asstring = 'Y');
  Vat := qryDetails.fieldbyname('Vat').asinteger;

  InstallationPrice := qryDetails.fieldbyname('Installation_Price').asfloat;
  DeliveryPrice := qryDetails.fieldbyname('Delivery_Price').asfloat;
  SurveyPrice := qryDetails.fieldbyname('Survey_Price').asfloat;
  ModalResult:= mrOK;
end;

procedure TfrmWTSrchCustomer.ShowNotes(Sender: TObject);
var
  frmWTLUDBMemo: TfrmWTDBMemo;
begin
  frmWTDBMemo := TfrmWTDBMemo.Create(Self);
  try
    frmWTDBMemo.bAllow_Upd := False;
    frmWTDBMemo.LoadMemoData(dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    frmWTDBMemo.ShowModal;
  finally
    frmWTDBMemo.Free;
  end;
end;

procedure TfrmWTSrchCustomer.SetNameSelected(const Value: string);
begin
  FNameSelected := Value;
end;

procedure TfrmWTSrchCustomer.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTSrchCustomer.SetRetailCustomer(const Value: byteBool);
begin
  FRetailCustomer := Value;
end;

procedure TfrmWTSrchCustomer.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintCustomer := TfrmWTMaintCustomer.create(application);
    if FuncMode <> 'A' then
      begin
        iCode := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
      end
    else
      iCode := 0;

    if FuncMode = 'S' then
      begin
        frmWTMaintCustomer.GetAddress(Address);
        iCode := 0;
      end;

    frmWTMaintCustomer.getRecord(iCode);

    frmWTMaintCustomer.FunctionMode := FuncMode;
    frmWTMaintCustomer.showmodal;
    if frmWTMaintCustomer.ModalResult = idOK then
      begin
        if (FuncMode = 'A') or (FuncMode = 'S') then
          begin
            edtSearch.text := frmWTMaintCustomer.edtCustomerName.Text;
            iCode := frmWTMaintCustomer.Customer;
            self.CodeSelected := iCode;
            Self.bNewCustomer := true;
          end;
        refreshData;
        dtsDetails.DataSet.Locate('Customer', Variant(inttostr(iCode)),[lopartialKey]) ;
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
    Screen.Cursor := OldCursor;
    frmWTMaintCustomer.free;
  end;
end;

procedure TfrmWTSrchCustomer.BitBtn3Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTSrchCustomer.BitBtn4Click(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTSrchCustomer.FormCreate(Sender: TObject);
begin
  dtsDetails.OnDataChange := SetButtons;
  bNewCustomer := false;
end;

procedure TfrmWTSrchCustomer.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTSrchCustomer.btnAddClick(Sender: TObject);
begin
  if Address <> 0 then
    CallMaintScreen('S')
  else
    CallMaintScreen('A');
end;

procedure TfrmWTSrchCustomer.dbgDetailsDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TfrmWTSrchCustomer.SetVat(const Value: integer);
begin
  FVat := Value;
end;

procedure TfrmWTSrchCustomer.SetDiscountRate(const Value: double);
begin
  FDiscountRate := Value;
end;

procedure TfrmWTSrchCustomer.SetDepositTerms(const Value: double);
begin
  FDepositTerms := Value;
end;

procedure TfrmWTSrchCustomer.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TfrmWTSrchCustomer.chkbxShowInactiveClick(Sender: TObject);
begin
  RefreshData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTSrchCustomer.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Not_Active').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if  (Column.Title.Caption <> 'Total Cost') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmWTSrchCustomer.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

procedure TfrmWTSrchCustomer.SetAddress(const Value: integer);
begin
  FAddress := Value;
end;

procedure TfrmWTSrchCustomer.btnSweepClick(Sender: TObject);
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

procedure TfrmWTSrchCustomer.SetUseCustomerFixRates(const Value: boolean);
begin
  FUseCustomerFixRates := Value;
end;

procedure TfrmWTSrchCustomer.SetDeliveryPrice(const Value: double);
begin
  FDeliveryPrice := Value;
end;

procedure TfrmWTSrchCustomer.SetInstallationPrice(const Value: double);
begin
  FInstallationPrice := Value;
end;

procedure TfrmWTSrchCustomer.SetSurveyPrice(const Value: double);
begin
  FSurveyPrice := Value;
end;

procedure TfrmWTSrchCustomer.btnDeleteClick(Sender: TObject);
begin
  if (dbgDetails.datasource.DataSet.fieldbyname('Customer').asinteger = 1) then
    begin
        messagedlg('This customer is a system record an cannot be deleted', mtInformation, [mbOk], 0);
        exit;
    end;
    
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            parambyname('Customer').asinteger := dbgDetails.datasource.DataSet.fieldbyname('Customer').asinteger;
            execsql;
          end;
        Refreshdata;
      except messagedlg('Customer '+ dbgDetails.datasource.DataSet.fieldbyname('Customer_name').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;

end;

end.
