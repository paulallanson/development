unit WTMaintWorktopDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, CRControls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintWorktopDetails = class(TForm)
    Label1: TLabel;
    edtDescription: TDBEdit;
    Label3: TLabel;
    dblkpMatType: TDBLookupComboBox;
    Label2: TLabel;
    dblkpWTGroup: TDBLookupComboBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    btnClear: TBitBtn;
    Label4: TLabel;
    dblkpThickness: TDBLookupComboBox;
    edtmnyCost: TCREditMoney;
    Label5: TLabel;
    Label6: TLabel;
    edtmnySell: TCREditMoney;
    Label7: TLabel;
    Label8: TLabel;
    tblWorktops: TFDTable;
    tblWorktopsWorktop: TIntegerField;
    tblWorktopsDescription: TStringField;
    tblWorktopsNot_used_for_quoting: TStringField;
    tblWorktopsMaterial_Type: TIntegerField;
    tblWorktopsWorktop_Group: TIntegerField;
    tblWorktopsWorktop_Group_Desc: TStringField;
    tblWorktopsinactive: TStringField;
    qryNewWorktops: TFDQuery;
    lkpGroup: TFDQuery;
    lkpMatType: TFDQuery;
    srclkpMatType: TDataSource;
    dtsGroup: TDataSource;
    procedure EnableOK(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dblkpWTGroupClick(Sender: TObject);
  private
    iOldGroup: integer;
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    { Private declarations }
  public
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintWorktopDetails: TfrmWTMaintWorktopDetails;

implementation

uses wtLUWTGroup;

{$R *.dfm}

{ TfrmWTMaintWorktopDetails }

procedure TfrmWTMaintWorktopDetails.SetfunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'A' then
    begin
      tblWorktops.Insert;
      dblkpWTGroup.KeyValue := 0;
    end
  else
  if Value = 'C' then
    begin
      tblWorktops.edit;
    end
end;

procedure TfrmWTMaintWorktopDetails.FormCreate(Sender: TObject);
begin
  tblWorktops.Active := false;
  tblWorktops.Active := true;
end;

procedure TfrmWTMaintWorktopDetails.btnOKClick(Sender: TObject);
var
  iCode: integer;
begin
  tblWorktops.FieldByName('inActive').asstring := 'N';
  tblWorktops.FieldByName('Not_used_for_quoting').asstring := 'N';

  tblWorktops.Post;

  if (FunctionMode = 'A') and (dblkpWTGroup.text <> '') then
//    CreateSizes
  else
  if (FunctionMode = 'C') and (dblkpWTGroup.text <> '') and (iOldGroup <> tblWorktops.fieldbyname('Worktop_Group').asinteger) then
//    ChangeSizes
  ;
  if FunctionMode = 'A' then
    iCode := tblWorktops.FieldByName('Worktop').asinteger;

end;

procedure TfrmWTMaintWorktopDetails.Button1Click(Sender: TObject);
begin
  frmWTLuWTGroup := TfrmWTLuWTGroup.create(self);
  try
    frmWTLuWTGroup.showmodal;
    formactivate(self);
  finally
    frmWTLuWTGroup.free
  end;
end;

procedure TfrmWTMaintWorktopDetails.FormActivate(Sender: TObject);
begin
  with lkpMatType do
    begin
      close;
      parambyname('Material_Type').asinteger := tblWorktops.fieldbyname('Material_type').asinteger;
      open;
    end;

  with lkpGroup do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMatType.keyvalue;
      parambyname('Worktop_Group').asinteger := tblWorktops.fieldbyname('Worktop_Group').asinteger;
      open;
    end;

  iOldGroup := tblWorktops.fieldbyname('Worktop_Group').asinteger;
end;

procedure TfrmWTMaintWorktopDetails.btnClearClick(Sender: TObject);
begin
  dblkpWTGroup.KeyValue := 0;
end;

procedure TfrmWTMaintWorktopDetails.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtDescription.text) <> '');  
end;

procedure TfrmWTMaintWorktopDetails.dblkpWTGroupClick(Sender: TObject);
begin
  with lkpGroup do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMatType.keyvalue;
      parambyname('Worktop_Group').asinteger := tblWorktops.fieldbyname('Worktop_Group').asinteger;
      open;
    end;
end;

end.
