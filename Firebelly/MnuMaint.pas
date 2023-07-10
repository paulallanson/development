unit MnuMaint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, gtQrCtrls;

type
  TMnuMaintFrm = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn9: TBitBtn;
    Database1: TDatabase;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MnuMaintFrm: TMnuMaintFrm;

implementation

uses SysMaint, EdgeMain,
  CustMaint, COutMain, ThickMaint, EdgXMain,
  AddMain, WTopMain, MaterialMain, PBandsMaint, PriceReportSel,
  AutoPriceChg;

{$R *.DFM}

procedure TMnuMaintFrm.BitBtn5Click(Sender: TObject);
begin
	SysMaintFrm := TSysMaintFrm.create(self);
	SysMaintFrm.showmodal;
  SysMaintFrm.free;
end;

procedure TMnuMaintFrm.BitBtn1Click(Sender: TObject);
begin
	WTopMainFrm := TWTopMainFrm.create(self);
	WTopMainFrm.showmodal;
	WTopMainFrm.free;
end;

procedure TMnuMaintFrm.BitBtn2Click(Sender: TObject);
begin
	EdgeMainFrm := TEdgeMainFrm.create(self);
	EdgeMainFrm.showmodal;
	EdgeMainFrm.free;
end;

procedure TMnuMaintFrm.BitBtn3Click(Sender: TObject);
begin
	COutMainFrm := TCOutMainFrm.create(self);
	COutMainFrm.Showmodal;
	COutMainFrm.free;
end;

procedure TMnuMaintFrm.BitBtn4Click(Sender: TObject);
begin
	AddMainFrm:= TAddMainFrm.create(self);
	AddMainFrm.Showmodal;
	AddMainFrm.free;
end;

procedure TMnuMaintFrm.BitBtn10Click(Sender: TObject);
begin
	EdgXMainFrm := TEdgXMainFrm.create(self);
	EdgXMainFrm.ShowModal;
  EdgXMainFrm.free;
end;

procedure TMnuMaintFrm.BitBtn11Click(Sender: TObject);
begin
	CustMaintfrm := TCustMaintFrm.create(self);
	CustMaintFrm.showmodal;
	CustMaintFrm.free;
end;

procedure TMnuMaintFrm.BitBtn12Click(Sender: TObject);
begin
	Thickmaintfrm := TThickmaintfrm.create(self);
  ThickmaintFrm.showmodal;
  ThickmaintFrm.free;
end;

procedure TMnuMaintFrm.BitBtn6Click(Sender: TObject);
begin
	MaterialMainFrm := TMaterialMainFrm.create(self);
	MaterialMainFrm.showmodal;
	MaterialMainFrm.free;
end;

procedure TMnuMaintFrm.BitBtn7Click(Sender: TObject);
begin
	PBandsMaintfrm := TPBandsMaintfrm.create(self);
	PBandsMaintfrm.showmodal;
	PBandsMaintfrm.free;

end;

procedure TMnuMaintFrm.BitBtn8Click(Sender: TObject);
begin
	PriceReportSelfrm := TPriceReportSelfrm.create(self);
	PriceReportSelfrm.showmodal;
	PriceReportSelfrm.free;

end;

procedure TMnuMaintFrm.BitBtn9Click(Sender: TObject);
begin
	AutoPriceChgfrm := TAutoPriceChgfrm.create(self);
	AutoPriceChgfrm.showmodal;
	AutoPriceChgfrm.free;

end;

end.
