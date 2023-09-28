unit PBMaintPartComponent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPartComponentFrm = class(TForm)
    lblDelete: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    grpbxDetails: TGroupBox;
    ByLabel: TLabel;
    edtProduct: TEdit;
    btnPart: TBitBtn;
    memQuantity: TMemo;
    Label2: TLabel;
    qryGetLastNo: TFDQuery;
    qryDel: TFDQuery;
    qryAdd: TFDQuery;
    qryUpd: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure btnPartClick(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    bOK: boolean;
    sFuncMode: string;
    sPart, sProduct: string;
    iElementNo: integer;
    iQuantity: integer;
  end;

var
  PBMaintPartComponentFrm: TPBMaintPartComponentFrm;

implementation

uses STPrtMnt;

{$R *.dfm}

procedure TPBMaintPartComponentFrm.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
    begin
      {Empty details};
      edtProduct.Text := '';
      memQuantity.Text := '' ;
      iElementNo := 0;
    end
  else
    begin
      edtProduct.Text := sProduct;
      memQuantity.text := inttostr(iQuantity);
    end;

  grpbxDetails.Enabled := (sFuncMode <> 'D');
  lblDelete.Visible := (sFuncMode = 'D');

end;

procedure TPBMaintPartComponentFrm.OKBitBtnClick(Sender: TObject);
begin
  if CharInSet(sFuncMode[1], ['A']) then
    begin
      if iElementNo = 0 then
        begin
          with qryGetLastNo do
            begin
              close;
              parambyname('Part').asstring := sPart;
              open;
              iElementNo := fieldbyname('Last_no').asinteger + 1
            end;
        end;

      with qryAdd do
        begin
          close;
          parambyname('Part').asstring := sPart;
          parambyname('Element_no').asinteger := iElementNo;
          parambyname('Composite_Part').asstring := edtProduct.text;
          parambyname('Quantity').asinteger := strtoint(memQuantity.text);
          execsql;
        end;
    end
  else
  if CharInSet(sFuncMode[1], ['C']) then
    begin
      with qryUpd do
        begin
          close;
          parambyname('Part').asstring := sPart;
          parambyname('Element_no').asinteger := iElementNo;
          parambyname('Composite_Part').asstring := edtProduct.text;
          parambyname('Quantity').asinteger := strtoint(memQuantity.text);
          execsql;
        end;
    end
  else
    begin
      with qryDel do
        begin
          close;
          parambyname('Part').asstring := sPart;
          parambyname('Composite_Part').asstring := sProduct;
          execsql;
        end;
    end;

  bOK := true;
end;

procedure TPBMaintPartComponentFrm.btnPartClick(Sender: TObject);
begin
  StPrtMntFrm := TStPrtMntFrm.Create(Self) ;
  try
   StPrtMntFrm.bIs_LookUp := True ;
   StPrtMntFrm.sCode := edtProduct.Text ;
   StPrtMntFrm.ShowModal ;
   if StPrtMntFrm.bOK = True then
      begin
        edtProduct.Text := StPrtMntFrm.sCode ;
      end;
  Finally
   StPrtMntFrm.Free ;
  end ;

end;

procedure TPBMaintPartComponentFrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
