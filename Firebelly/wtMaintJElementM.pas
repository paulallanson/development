unit wtMaintJElementM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CRControls, DBCtrls, ExtCtrls, DB, wtJobsDM, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintJElementM = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    dblkpWTThickness: TDBLookupComboBox;
    dblkpWorktop: TDBLookupComboBox;
    edtMaterial: TEdit;
    edtUnitPrice: TCREditMoney;
    dblkpWTGroup: TDBLookupComboBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWTGroup: TFDQuery;
    dtsWTGroup: TDataSource;
    qryOneWTThickness: TFDQuery;
    dtsWorktops: TDataSource;
    qryWorktops: TFDQuery;
    qryWTThickness: TFDQuery;
    dtsWTThickness: TDataSource;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dblkpWTGroupClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FActivated: boolean;
    FThickness: integer;
    FWorktopGroup: integer;
    FWorktop: integer;
    FMaterial: integer;
    FMaterialType: string;
    FJElement: TJElement;
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure SetJElement(const Value: TJElement);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure SetWorktopGroup(const Value: integer);
    procedure RefreshThickness;
    procedure RefreshWorktops;
    procedure ShowDetails;
    procedure GetUnitPrice;
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property JElement: TJElement read FJElement write SetJElement;
    property Worktop: integer read FWorktop write SetWorktop;
    property WorktopGroup: integer read FWorktopGroup write SetWorktopGroup;
    property Thickness: integer read FThickness write SetThickness;
  end;

var
  frmWTMaintJElementM: TfrmWTMaintJElementM;

implementation

uses UITypes, wtLUworktops, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQElementM }

procedure TfrmWTMaintJElementM.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  JElement.Material := FMaterial;
end;

procedure TfrmWTMaintJElementM.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintJElementM.SetJElement(const Value: TJElement);
begin
  FJElement := Value;
end;

procedure TfrmWTMaintJElementM.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintJElementM.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintJElementM.SetWorktopGroup(const Value: integer);
begin
  FWorktopGroup := Value;
end;

procedure TfrmWTMaintJElementM.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    with qryWTGroup do
      begin
        close;
        parambyname('Material_type').asinteger := Material;
        open;
      end;
      
    ShowDetails;
    EnableOK(Self);
  end;
end;

procedure TfrmWTMaintJElementM.RefreshWorktops;
begin
  with qryWorktops do
    begin
      close;
      parambyname('Material_Type').asinteger := Material;
      parambyname('Worktop_Group').asinteger := dblkpWTGroup.keyvalue;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintJElementM.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintJElementM.ShowDetails;
begin
  edtMaterial.text := MaterialType;

  dblkpWTGroup.keyvalue := JElement.worktopGroup;

  RefreshWorktops;
  dblkpWorktop.keyvalue := JElement.worktop;

  with qryWTThickness do
    begin
      close;
      open;
    end;

  dblkpWTThickness.keyvalue := JElement.Thickness;
  edtunitPrice.text := formatfloat('0.00',JElement.UnitPrice);
end;

procedure TfrmWTMaintJElementM.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWorktop.KeyValue <> 0) and
                    (edtUnitPrice.Text <> '') and
                    (dblkpWTThickness.KeyValue <> 0);
end;
procedure TfrmWTMaintJElementM.dblkpWorktopClick(Sender: TObject);
begin
  RefreshThickness;
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintJElementM.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintJElementM.GetUnitPrice;
var
  sText: string;
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
    end;
end;

procedure TfrmWTMaintJElementM.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintJElementM.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUWorktops := TfrmWTLUWorktops.create(self);
  try
    frmWTLUWorktops.showmodal;
  finally
    frmWTLUWorktops.free;
  end;

  RefreshWorktops;
  RefreshThickness;
end;

procedure TfrmWTMaintJElementM.dblkpWTGroupClick(Sender: TObject);
begin
  RefreshWorktops;
end;

procedure TfrmWTMaintJElementM.SpeedButton2Click(Sender: TObject);
begin
  dblkpWTGroup.KeyValue := 0;
  RefreshWorktops;
end;

procedure TfrmWTMaintJElementM.btnOKClick(Sender: TObject);
begin
  if messagedlg('Apply the changes to ALL the worktop elements?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    JElement.Worktop := dblkpWorktop.KeyValue;
    JElement.WorktopGroup := dblkpWTGroup.KeyValue;
    JElement.worktopDesc := dblkpWorktop.Text;
    JElement.thickness := dblkpWTThickness.keyvalue;
    JElement.thicknessDesc := dblkpWTThickness.Text;
    JElement.UnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
    ModalResult := mrOK;
  end;
end;

end.
