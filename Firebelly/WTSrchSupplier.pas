unit WTSrchSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls, Buttons, Grids, DBGrids, QrCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTSrchSupplier = class(TForm)
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
  private
    FCodeSelected: integer;
    FNameSelected: string;
    FVat: integer;
    FDiscountRate: double;
    FDepositTerms: double;
    FSpeculative: boolean;
    FAddress: integer;
    procedure SetCodeSelected(const Value: integer);
    procedure SetNameSelected(const Value: string);
    procedure CallMaintScreen(FuncMode: string);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetVat(const Value: integer);
    procedure SetDiscountRate(const Value: double);
    procedure SetDepositTerms(const Value: double);
    procedure ShowNotes(Sender: TObject);
    procedure SetSpeculative(const Value: boolean);
    procedure SetAddress(const Value: integer);
    { Private declarations }
  public
    bNewSupplier: boolean;
    procedure Refreshdata;
    property Address: integer read FAddress write SetAddress;
    property CodeSelected: integer read FCodeSelected write SetCodeSelected;
    property DepositTerms: double read FDepositTerms write SetDepositTerms;
    property DiscountRate: double read FDiscountRate write SetDiscountRate;
    property NameSelected: string read FNameSelected write SetNameSelected;
    property Vat: integer read FVat write SetVat;
  end;

var
  frmWTSrchSupplier: TfrmWTSrchSupplier;

implementation

uses WTMaintCustomer, WTDBMemo, WTMaintSupplier;

{$R *.dfm}

{ TfrmWTSrchSupplier }

procedure TfrmWTSrchSupplier.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsDetails.dataset do
  begin
    btnChange.Enabled := recordcount > 0;
    btnDelete.Enabled := recordcount > 0;
    btnSweep.Enabled := recordcount > 0;
  end;
end;

procedure TfrmWTSrchSupplier.Refreshdata;
begin
  with qrydetails do
    begin
      close;
      parambyname('Name').asstring := '%' + edtSearch.text + '%';
      if chkbxShowInactive.checked then
        parambyname('InActive').asstring := 'Y'
      else
        parambyname('InActive').asstring := 'N';
      open;
      if not Locate('Supplier', Variant(inttostr(CodeSelected)),[lopartialKey]) then
        first;
    end;

end;

procedure TfrmWTSrchSupplier.tmrSearchTimer(Sender: TObject);
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

procedure TfrmWTSrchSupplier.FormShow(Sender: TObject);
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

procedure TfrmWTSrchSupplier.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTSrchSupplier.SetCodeSelected(const Value: integer);
begin
  FCodeSelected := Value;
end;

procedure TfrmWTSrchSupplier.btnSelectClick(Sender: TObject);
begin
//  if dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
//    ShowNotes(Self);

  CodeSelected := qryDetails.fieldbyname('Supplier').asinteger;
  NameSelected := qryDetails.fieldbyname('Supplier_Name').asstring;
  ModalResult:= mrOK;
end;

procedure TfrmWTSrchSupplier.ShowNotes(Sender: TObject);
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

procedure TfrmWTSrchSupplier.SetNameSelected(const Value: string);
begin
  FNameSelected := Value;
end;

procedure TfrmWTSrchSupplier.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTSrchSupplier.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintSupplier := TfrmWTMaintSupplier.create(application);
    if FuncMode <> 'A' then
      begin
        iCode := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;
      end
    else
      iCode := 0;

    frmWTMaintSupplier.getRecord(iCode);

    frmWTMaintSupplier.FunctionMode := FuncMode;
    frmWTMaintSupplier.showmodal;
    if frmWTMaintSupplier.ModalResult = idOK then
      begin
        if (FuncMode = 'A') or (FuncMode = 'S') then
          begin
//            edtSearch.text := frmWTMaintSupplier.tblOneSupplier.fieldbyname('Supplier_Name').asstring;
            edtSearch.text := frmWTMaintSupplier.edtSupplierName.Text;
            iCode := frmWTMaintSupplier.Supplier;
            self.CodeSelected := iCode;
            Self.bNewSupplier := true;
          end;
        refreshData;
        dtsDetails.DataSet.Locate('Supplier', Variant(inttostr(iCode)),[lopartialKey]) ;
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
    frmWTMaintSupplier.free;
  end;
end;

procedure TfrmWTSrchSupplier.BitBtn3Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTSrchSupplier.BitBtn4Click(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTSrchSupplier.FormCreate(Sender: TObject);
begin
  dtsDetails.OnDataChange := SetButtons;
  bNewSupplier := false;
end;

procedure TfrmWTSrchSupplier.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTSrchSupplier.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTSrchSupplier.dbgDetailsDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TfrmWTSrchSupplier.SetVat(const Value: integer);
begin
  FVat := Value;
end;

procedure TfrmWTSrchSupplier.SetDiscountRate(const Value: double);
begin
  FDiscountRate := Value;
end;

procedure TfrmWTSrchSupplier.SetDepositTerms(const Value: double);
begin
  FDepositTerms := Value;
end;

procedure TfrmWTSrchSupplier.chkbxShowInactiveClick(Sender: TObject);
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

procedure TfrmWTSrchSupplier.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('InActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
end;

procedure TfrmWTSrchSupplier.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

procedure TfrmWTSrchSupplier.SetAddress(const Value: integer);
begin
  FAddress := Value;
end;

procedure TfrmWTSrchSupplier.btnSweepClick(Sender: TObject);
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

end.
