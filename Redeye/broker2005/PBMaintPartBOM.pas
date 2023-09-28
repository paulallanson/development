unit PBMaintPartBOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPartBOMfrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    grpbxDetails: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtProduct: TEdit;
    edtDescription: TEdit;
    spnQuantity: TSpinEdit;
    qryUpd: TFDQuery;
    qryDel: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    ElementNo: integer;
    CompositePart, Description: string;
    Mode: string;
    Part: string;
    Quantity: integer;
  end;

var
  PBMaintPartBOMfrm: TPBMaintPartBOMfrm;

implementation

uses UITypes;

{$R *.dfm}

procedure TPBMaintPartBOMfrm.FormActivate(Sender: TObject);
begin
  edtProduct.Text := CompositePart;
  edtDescription.Text := Description;
  spnQuantity.Value := Quantity;

  grpbxdetails.Enabled := Mode <> 'D';
  DelLabel.Visible := Mode = 'D';
end;

procedure TPBMaintPartBOMfrm.OKBitBtnClick(Sender: TObject);
begin
  if Mode = 'C' then
    begin
      with qryUpd do
        begin
          close;
          parambyname('Part').asstring := Part;
          parambyname('Element_no').asinteger := ElementNo;
          parambyname('Quantity').asinteger := spnQuantity.value;
          execsql;
        end;
    end
  else
    begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      begin
        with qryDel do
        begin
          close;
          parambyname('Part').asstring := Part;
          parambyname('Element_no').asinteger := ElementNo;
          execsql;
        end;
      end;
    end;
end;

end.
