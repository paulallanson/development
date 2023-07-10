unit wtMaintQElementM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CRControls, DBCtrls, ExtCtrls, DB, DBTables,
  wtQuotesDM, gtQrCtrls;

type
  TfrmWTMaintQElementM = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnWorktops: TSpeedButton;
    Label9: TLabel;
    btnPriceGroup: TSpeedButton;
    dblkpWTThickness: TDBLookupComboBox;
    dblkpWorktop: TDBLookupComboBox;
    edtUnitPrice: TCREditMoney;
    dblkpWTGroup: TDBLookupComboBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWTGroup: TQuery;
    dtsWTGroup: TDataSource;
    qryOneWTThickness: TQuery;
    dtsWorktops: TDataSource;
    qryWTThickness: TQuery;
    dtsWTThickness: TDataSource;
    qryWorktops: TQuery;
    dblkpMaterial: TDBLookupComboBox;
    qryMaterial: TQuery;
    dtsMaterial: TDataSource;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    dblkpUPThickness: TDBLookupComboBox;
    qryUpThickness: TQuery;
    dtsUPThickness: TDataSource;
    Label6: TLabel;
    edtUPUnitPrice: TCREditMoney;
    qryContractWorktops: TQuery;
    qryContractPrice: TQuery;
    qryCustomerWorktops: TQuery;
    qryCustomerPrice: TQuery;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure dblkpWTGroupClick(Sender: TObject);
    procedure btnPriceGroupClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure dblkpUPThicknessClick(Sender: TObject);
  private
    FActivated: boolean;
    FThickness: integer;
    FWorktopGroup: integer;
    FWorktop: integer;
    FMaterial: integer;
    FMaterialType: string;
    FQElement: TQElement;
    FUpUnitPrice: double;
    FUpThickness: integer;
    FUpThicknessDesc: string;
    FUseCustomerPrices: boolean;
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure SetQElement(const Value: TQElement);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure SetWorktopGroup(const Value: integer);
    procedure RefreshThickness;
    procedure RefreshGroups;
    procedure RefreshWorktops;
    procedure ShowDetails;
    procedure GetUnitPrice;
    procedure GetUpStandUnitPrice;
    procedure SetUpThickness(const Value: integer);
    procedure SetUpUnitPrice(const Value: double);
    procedure SetUpThicknessDesc(const Value: string);
    procedure SetProperties;
    procedure EnableButtons;
    procedure SetUseCustomerPrices(const Value: boolean);
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property QElement: TQElement read FQElement write SetQElement;
    property Worktop: integer read FWorktop write SetWorktop;
    property WorktopGroup: integer read FWorktopGroup write SetWorktopGroup;
    property Thickness: integer read FThickness write SetThickness;
    property UpThickness: integer read FUpThickness write SetUpThickness;
    property UpThicknessDesc: string read FUpThicknessDesc write SetUpThicknessDesc;
    property UpUnitPrice: double read FUpUnitPrice write SetUpUnitPrice;
    property UseCustomerPrices: boolean read FUseCustomerPrices write SetUseCustomerPrices;
  end;

var
  frmWTMaintQElementM: TfrmWTMaintQElementM;

implementation

uses wtLUworktops, wtMain, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQElementM }

procedure TfrmWTMaintQElementM.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
//  QElement.Material := FMaterial;
end;

procedure TfrmWTMaintQElementM.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQElementM.SetQElement(const Value: TQElement);
begin
  FQElement := Value;
end;

procedure TfrmWTMaintQElementM.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintQElementM.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintQElementM.SetWorktopGroup(const Value: integer);
begin
  FWorktopGroup := Value;
end;

procedure TfrmWTMaintQElementM.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    with qryMaterial do
      begin
        close;
        parambyname('Material_Type').AsInteger := Material;
        open;
      end;

    dblkpMaterial.keyvalue := Material;

    WorktopGroup := 0;
    RefreshGroups;
    RefreshWorktops;

    if frmWTMain.bEndUSer then
      EnableButtons;

    edtUnitPrice.Enabled := not frmWTMain.bEndUser;
    edtUPUnitPrice.Enabled := not frmWTMain.bEndUser;

    if frmWTMain.bEndUser then
      begin
        edtUnitPrice.Enabled := (QElement.OriginalUnitPrice = 0);
        edtUPUnitPrice.Enabled := edtUnitPrice.Enabled;
      end;

    SetProperties;
    
    EnableOK(Self);
  end;
end;

procedure TfrmWTMaintQElementM.EnableButtons;
begin
  btnWorktops.visible := false;
end;

procedure TfrmWTMaintQElementM.RefreshGroups;
begin
  with qryWTGroup do
    begin
      close;
      parambyname('Material_Type').AsInteger := Material;
      parambyname('Worktop_Group').AsInteger := WorktopGroup;
      open;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQElementM.RefreshWorktops;
begin
  if QElement.Parent.ContractQuote then
    begin
      with qryContractWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := QElement.Parent.ContractGroup;
          parambyname('Worktop').asinteger := QElement.worktop;
          open;
        end;
      dtsWorktops.dataset := qryContractWorktops;
    end
  else
    begin
      with qryCustomerWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Material_Type').asinteger := Material;
          parambyname('Worktop_Group').asinteger := WorktopGroup;
          parambyname('Worktop').asinteger := QElement.worktop;
          open;
        end;

      if qryCustomerWorktops.recordcount > 0 then
        begin
          UseCustomerPrices := true;
          dtsWorktops.dataset := qryCustomerWorktops
        end
      else
        begin
          with qryWorktops do
            begin
              close;
              parambyname('Material_Type').asinteger := Material;
              parambyname('Worktop_Group').asinteger := WorktopGroup;
              parambyname('Worktop').asinteger := QElement.worktop;
              open;
            end;
          dtsWorktops.dataset := qryWorktops;
        end;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQElementM.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;

  with qryUPThickness do
    begin
      close;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintQElementM.ShowDetails;
begin

end;

procedure TfrmWTMaintQElementM.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpMaterial.text <> '') and
                    (dblkpWorktop.text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (edtUpUnitPrice.Text <> '') and
                    (dblkpUPThickness.text <> '') and
                    (dblkpWTThickness.text <> '');
end;

procedure TfrmWTMaintQElementM.dblkpWorktopClick(Sender: TObject);
begin
  RefreshThickness;
//  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQElementM.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQElementM.GetUnitPrice;
var
  sText: string;
begin
  if QElement.Parent.ContractQuote then
    begin
      with qryContractPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := QElement.Parent.ContractGroup;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end
  else
  if self.UseCustomerPrices then
    begin
      with qryCustomerPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := dtsWorktops.DataSet.fieldbyname('Group_Number').asinteger;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end
  else
    begin
      with qryOneWTThickness do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
          QElement.OriginalUnitPrice := fieldbyname('Unit_Price').asfloat;
        end;
    end;

  if frmWTMain.bEndUSer then
    edtUnitPrice.enabled := (strtofloat(edtUnitPrice.Text) = 0);
end;

procedure TfrmWTMaintQElementM.GetUpStandUnitPrice;
var
  sText: string;
begin
  if QElement.Parent.ContractQuote then
    begin
      with qryContractPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := QElement.Parent.ContractGroup;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUpUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end
  else
    begin
      with qryOneWTThickness do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
          parambyName('thickness').asinteger := dblkpUPThickness.keyvalue;
          open;
          edtUpUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end;

  if frmWTMain.bEndUser then
    edtUpUnitPrice.enabled := (strtofloat(edtUpUnitPrice.Text) = 0);
end;

procedure TfrmWTMaintQElementM.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintQElementM.btnWorktopsClick(Sender: TObject);
begin
  frmWTLUWorktops := TfrmWTLUWorktops.create(self);
  try
    frmWTLUWorktops.showmodal;
  finally
    frmWTLUWorktops.free;
  end;

  RefreshWorktops;
  RefreshThickness;
  (*  qryWorktops.close;
  qryWorktops.open;
*)end;

procedure TfrmWTMaintQElementM.dblkpWTGroupClick(Sender: TObject);
begin
  WorktopGroup := dblkpWTGroup.KeyValue;
  RefreshWorktops;
end;

procedure TfrmWTMaintQElementM.btnPriceGroupClick(Sender: TObject);
begin
  dblkpWTGroup.KeyValue := 0;
  WorktopGroup := 0;
  RefreshWorktops;
end;

procedure TfrmWTMaintQElementM.btnOKClick(Sender: TObject);
begin
  if frmWTMain.bEndUser then
    begin
      if (strtofloat(edtUnitPrice.text) = 0) then
        begin
          messagedlg('A zero worktop unit price is not allowed.', mterror, [mbOk], 0);
          edtUnitPrice.setfocus;
          exit;
        end;
    end;

  if messagedlg('Apply the changes to ALL the worktop elements?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    QElement.Material := dblkpMaterial.KeyValue;
    QElement.Worktop := dblkpWorktop.KeyValue;

    if dblkpWTGroup.Text = '' then
      QElement.WorktopGroup := 0
    else
      QElement.WorktopGroup := dblkpWTGroup.KeyValue;
    QElement.worktopDesc := dblkpWorktop.Text;
    QElement.thickness := dblkpWTThickness.keyvalue;
    QElement.thicknessDesc := dblkpWTThickness.Text;
    QElement.UnitPrice := strtofloat(edtUnitPrice.text);
    self.UpThickness := dblkpUPThickness.keyvalue;
    self.UpThicknessDesc := dblkpUPThickness.text;
    self.UpUnitPrice := strtofloat(edtUpUnitPrice.text);
    ModalResult := mrOK;
  end;
end;

procedure TfrmWTMaintQElementM.dblkpMaterialClick(Sender: TObject);
begin
  if Material <> dblkpMaterial.KeyValue then
    begin
      dblkpWTGroup.KeyValue := 0;
      dblkpWorktop.KeyValue := 0;
      dblkpWTThickness.KeyValue := 0;
      QElement.worktop := 0;  
      QElement.worktopGroup := 0;
    end;
  Material := dblkpMaterial.KeyValue;
  RefreshGroups;
  RefreshWorktops;
  EnableOK(self);
end;

procedure TfrmWTMaintQElementM.SetUpThickness(const Value: integer);
begin
  FUpThickness := Value;
end;

procedure TfrmWTMaintQElementM.SetUpUnitPrice(const Value: double);
begin
  FUpUnitPrice := Value;
end;

procedure TfrmWTMaintQElementM.dblkpUPThicknessClick(Sender: TObject);
begin
  GetUpStandUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQElementM.SetUpThicknessDesc(const Value: string);
begin
  FUpThicknessDesc := Value;
end;

procedure TfrmWTMaintQElementM.SetProperties;
begin
  dblkpMaterial.Enabled := not QElement.parent.ContractQuote;
  dblkpWTGroup.enabled := dblkpMaterial.Enabled;
end;

procedure TfrmWTMaintQElementM.SetUseCustomerPrices(const Value: boolean);
begin
  FUseCustomerPrices := Value;
end;

end.
