unit wtMaintEdgeDtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wtMaintworktops, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, Mask,
  CRControls, gtQrCtrls;

type
  TfrmWtMaintEdgeDtls = class(TfrmWtMaintWorktops)
    Label4: TLabel;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    Label3: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintEdgeDtls: TfrmWtMaintEdgeDtls;

implementation

uses
  wtDatabaseDM, wtDataModule;

{$R *.DFM}

procedure TfrmWtMaintEdgeDtls.SetFunctionMode(const Value: string);
begin
(*  FFunctionMode := Value;

  if Value = 'A' then
    begin
    chkbxDontUse.checked := true;
    dtmdlDatabase.tblEdge.Insert;
    end
  else
  if Value = 'C' then
    begin
    chkbxDontUse.checked := (dtmdlDatabase.tblEdge.fieldbyname('in_use').asstring = 'Y') or
                          (dtmdlDatabase.tblEdge.fieldbyname('in_use').asstring = 'y');
    dtmdlDatabase.tblEdge.edit;
    end;
*)
end;

procedure TfrmWtMaintEdgeDtls.BitBtn2Click(Sender: TObject);
begin
//  dtmdlDatabase.tblEdge.cancel;
end;

procedure TfrmWtMaintEdgeDtls.btnOKClick(Sender: TObject);
begin
(*  if (chkbxDontUse.checked = true) then
    dtmdlDatabase.tblEdge.FieldByName('in_use').asstring := 'Y'
  else
    dtmdlDatabase.tblEdge.FieldByName('in_use').asstring := 'N';
  dtmdlDatabase.tblEdge.Post;
  dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
  dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
	dtmdlWorktops.qryAddPrice.execSQL;
  dtmdlDatabase.lkpCurrentPrice.active := false;
  dtmdlDatabase.lkpCurrentPrice.active := true;

  dtmdlDatabase.tblEdge.refresh;
*)
end;

end.
