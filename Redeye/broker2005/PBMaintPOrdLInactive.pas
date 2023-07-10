unit PBMaintPOrdLInactive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Db, DBTables, PBPOObjects;

type
  TPBMaintPOrdLInactiveFrm = class(TForm)
    Label1: TLabel;
    DBLUReason: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    chkReActivate: TCheckBox;
    qryReason: TQuery;
    srcReason: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLUReasonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkReActivateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure GetData;
    procedure EnableOK;
  public
    { Public declarations }
    iReason: integer;
    sDate: string;
  end;

var
  PBMaintPOrdLInactiveFrm: TPBMaintPOrdLInactiveFrm;

implementation

uses PBLUReasCode;

{$R *.DFM}

procedure TPBMaintPOrdLInactiveFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUReasCodeFrm := TPBLUReasCodeFrm.Create(self) ;
  try
    PBLUReasCodeFrm.bIs_Lookup := False ;
    PBLUReasCodeFrm.bAllow_Upd := True ;
    PBLUReasCodeFrm.SelCode := 0 ;
    PBLUReasCodeFrm.iGroupSelect := 2 ;
    PBLUReasCodeFrm.ShowModal ;
  finally
    PBLUReasCodeFrm.Free ;
  end;
  getdata;
end;

procedure TPBMaintPOrdLInactiveFrm.GetData;
begin
  with qryReason do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintPOrdLInactiveFrm.DBLUReasonClick(Sender: TObject);
begin
  iReason := dblureason.keyvalue;
  enableOK;
end;

procedure TPBMaintPOrdLInactiveFrm.EnableOK;
begin
  btnOK.enabled := false;
  if chkReActivate.checked then
  else
    if (dbLUReason.keyvalue = 0) or
      (dbLUReason.keyvalue = 0) then
      exit;
  btnOK.enabled := true;
end;

procedure TPBMaintPOrdLInactiveFrm.FormCreate(Sender: TObject);
begin
  sDate := PBDateStr(date);
  getdata;
end;

procedure TPBMaintPOrdLInactiveFrm.chkReActivateClick(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBMaintPOrdLInactiveFrm.FormShow(Sender: TObject);
begin
  enableok;
end;

end.
