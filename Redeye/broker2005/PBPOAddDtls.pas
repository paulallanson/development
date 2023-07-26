(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Order Add Additional Details form.

VSS Info:
$Header: /PBL D5/PBPOAddDtls.pas 2     14/02/:0 17:14 Paul $
$History: PBPOAddDtls.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 14/02/:0   Time: 17:14
 * Updated in $/PBL D5
 * Changed to allow the selection of Special Instructions from a lookup
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:35
 * Created in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBPOAddDtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, PBPOObjects;

type
  TPBPOAddDtlsFrm = class(TForm)
    Label2: TLabel;
    AddDetailsMemo: TMemo;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    ToWhomRadioGroup: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GetNotes(iNarrative: Integer);
  private
    FAdditionalDetail: TAdditionalDetail;
    FFuncMode: Char;
  public
    property AdditionalDetail: TAdditionalDetail read FAdditionalDetail
      write FAdditionalDetail;
    property FuncMode: Char read FFuncMode write FFuncMode;
  end;

var
  PBPOAddDtlsFrm: TPBPOAddDtlsFrm;

implementation

uses
  PBPODataMod, PBNarrativeDM, PBLUSpecIns;

{$R *.DFM}

procedure TPBPOAddDtlsFrm.OKBitBtnClick(Sender: TObject);
begin
  case ToWhomRadioGroup.ItemIndex of
    0: AdditionalDetail.FAOFlag := adSupplierOnly;
    1: AdditionalDetail.FAOFlag := adCustomerOnly;
    2: AdditionalDetail.FAOFlag := adSupplierAndCustomer;
  end; { case }
  AdditionalDetail.Detail := AddDetailsMemo.Text;
end;

procedure TPBPOAddDtlsFrm.FormShow(Sender: TObject);
begin
  if FuncMode = poAdd then
  begin
    Caption := 'Add Purchase Order Additional Details';
    ToWhomRadioGroup.Itemindex := 0;
  end
  else
  begin
    Caption := 'Change Purchase Order Additional Details';
    case AdditionalDetail.FAOFlag of
      adSupplierOnly: ToWhomRadioGroup.Itemindex := 0;
      adCustomerOnly: ToWhomRadioGroup.Itemindex := 1;
      adSupplierAndCustomer: ToWhomRadioGroup.Itemindex := 2;
    end; { case }
    AddDetailsMemo.Text := AdditionalDetail.Detail;
  end;
end;

procedure TPBPOAddDtlsFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUSpecInsFrm := TPBLUSpecInsFrm.create(Owner);
  try
     PBLUSpecInsFrm.bIs_Lookup := true;
     PBLUSpecInsFrm.bAllow_Upd := true;
     PBLUSpecInsFrm.showmodal;
     if PBLUSpecInsFrm.selected then
        begin
           GetNotes(PBLUSpecInsFrm.SelNarrative);
        end;
  finally
     PBLUSpecInsFrm.free;
  end;
end;

procedure TPBPOAddDtlsFrm.GetNotes(iNarrative: Integer);
var
  Narrative: TNarrative;
begin
  if iNarrative = 0 then Exit;
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    AddDetailsMemo.Text := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

end.
