(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Supplier Additional Details form.

VSS Info:
$Header: /PBL D5/PBEnqJobDtls.pas 1     7/12/99 9:41 Roddym $
$History: PBEnqJobDtls.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqJobDtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids;

type
  TPBEnqJobDtlsFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    AddCostsSpeedBtn: TSpeedButton;
    SupplierEdit: TEdit;
    BranchEdit: TEdit;
    SupplierMemo: TMemo;
    AddCostsMemo: TMemo;
    Label1: TLabel;
    PriceUnitEdit: TEdit;
    procedure createparams(var params : TCreateParams);override;
    procedure AddCostsSpeedBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBEnqJobDtlsFrm: TPBEnqJobDtlsFrm;

implementation

uses PBEnqJobPrice, PBEnqSupTmp, PBEnqAddChg;

var
	SuppGrid: TStringGrid;

{$R *.DFM}

procedure TPBEnqJobDtlsFrm.createparams(var params : TCreateParams);
begin
     inherited CreateParams(params);
     with params do
     begin
          style := style or ws_overlapped;
          Wndparent := PBEnqJobPriceFrm.handle;
     end;
end;

procedure TPBEnqJobDtlsFrm.AddCostsSpeedBtnClick(Sender: TObject);
var
	irow: integer;
begin
	irow := PBEnqJobPriceFrm.SupplierPricesGrid.row;

 	SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid'+copy(inttostr(100+iline),2,2)) as TStringGrid;

	PBEnqAddChgfrm := TPBEnqAddChgfrm.create(self);
	PBEnqAddChgfrm.iEnquiry := strtoint(PBEnqJobPriceFrm.EnquiryEdit.text);
  PBEnqAddChgfrm.iLine := iline;
  PBEnqAddChgfrm.iSupplier := strtoint(SuppGrid.cells[1,irow]);
  PBEnqAddChgfrm.iBranch := strtoint(SuppGrid.cells[2,irow]);

  PBEnqAddChgfrm.smode := 'c';
  PBEnqAddChgfrm.showmodal;
  PBEnqAddChgfrm.free;
end;

end.
