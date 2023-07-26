(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  A description of the unit here

VSS Info:
$Header: /PBL D5/PBEnqAddDtls.pas 2     11/02/:0 16:54 Paul $
$History: PBEnqAddDtls.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 11/02/:0   Time: 16:54
 * Updated in $/PBL D5
 * Changed to allow the selection of Additional details from a Special
 * Instructions lookup
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqAddDtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TPBEnqAddDtlsFrm = class(TForm)
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBEnqAddDtlsFrm: TPBEnqAddDtlsFrm;

implementation

uses PBenqline, PBenquiry, PBNarrativeDM, PBLUSpecIns;

{$R *.DFM}

procedure TPBEnqAddDtlsFrm.OKBitBtnClick(Sender: TObject);
begin
  PBEnqlinetmp.AddGrid.cells[1,iAddLine]:= inttostr(ToWhomRadioGroup.itemindex);
  PBEnqlinetmp.AddGrid.cells[2,iAddLine]:= AddDetailsMemo.text;
end;

procedure TPBEnqAddDtlsFrm.FormShow(Sender: TObject);
begin
  if sAddDetailMode = 'a' then
		ToWhomRadioGroup.Itemindex := 0
  else
  	begin
     	ToWhomRadioGroup.Itemindex := strtoint(PBEnqlinetmp.AddGrid.cells[1,iAddLine]);
{     	ToWhomRadioGroup.Enabled := false;
}     	AddDetailsMemo.Text := PBEnqlinetmp.AddGrid.cells[2,iAddLine];
     end;
end;

procedure TPBEnqAddDtlsFrm.BitBtn1Click(Sender: TObject);
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

procedure TPBEnqAddDtlsFrm.GetNotes(iNarrative: Integer);
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
