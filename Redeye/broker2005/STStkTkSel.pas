unit StStkTkSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTStkTkSelFrm = class(TForm)
    Label1: TLabel;
    StkTkListBox: TDBLookupListBox;
    PartCodeBitBtn: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtnCncl: TBitBtn;
    DelCountRecSQl: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StkTkListBoxDblClick(Sender: TObject);
    procedure PartCodeBitBtnClick(Sender: TObject);
    procedure BitBtnCnclClick(Sender: TObject);
    procedure DeleteCount;
  private
    imaintmode: integer;
    { Private declarations }
  public
    fMaintmode: string;
    bIs_VariancePrint: Bytebool;
    { Public declarations }
  end;

var
  STStkTkSelFrm: TSTStkTkSelFrm;

implementation

uses UITypes, STStkTkbyPart, STStkTakeDM, STStkValSl;

{$R *.DFM}

procedure TSTStkTkSelFrm.FormCreate(Sender: TObject);
begin
  STStkTkDM := TSTStkTkDM.Create(self);
end;

procedure TSTStkTkSelFrm.FormDestroy(Sender: TObject);
begin
  STStkTkDM.free;
end;

procedure TSTStkTkSelFrm.FormShow(Sender: TObject);
begin
  {Get all Count Lists currently in the system}
 StkTkListBox.keyvalue := '';
 imaintmode := Pos(fmaintmode, 'EFUR');
   case imaintmode of
   4: begin
       STStkTkDM.CountListSql.ParamByName('Status_From').asString := 'B';
       STStkTkDM.CountListSql.ParamByName('Status_To').AsString := 'K';
       end;
   3:
       begin
        STStkTkDM.CountListSql.ParamByName('Status_From').asString := 'H';
        STStkTkDM.CountListSql.ParamByName('Status_To').AsString := 'H';
       end;

   2:
      begin
        STStkTkDM.CountListSql.ParamByName('Status_From').asString := 'B';
        STStkTkDM.CountListSql.ParamByName('Status_To').AsString := 'F';
        BitBtnCncl.Visible := true;
      end;
   1:
      begin
        STStkTkDM.CountListSql.ParamByName('Status_From').asString := 'F';
        STStkTkDM.CountListSql.ParamByName('Status_To').AsString := 'H';
      end;
  end;
  if STStkTkDM.GetCountingLists > 0 then
      begin
        PartCodeBitBtn.Enabled := true;
        BitBtnCncl.Enabled := True;
      end;
end;

procedure TSTStkTkSelFrm.StkTkListBoxDblClick(Sender: TObject);
begin
  PartCodeBitBtnClick(self);
end;

procedure TSTStkTkSelFrm.PartCodeBitBtnClick(Sender: TObject);
begin
    case imaintmode of
    1:
    begin
      STStkTkbyPartFrm := TSTStkTkbyPartFrm.create(self);
      with STStkTkbyPartFrm do
        try
          begin
          CountListNumber := STStkTkDM.CountListSRC.dataset.fieldbyname('Stock_Take_Ref').asstring;
          showmodal;
          if modalresult = idok then
            STStkTkSelFrm.FormShow(self);
          end ;
        finally ;
          free;
        end;
        exit;
    end;
    3:
     begin
      STStkTkDM.UpdateCount(self);
     end;

    2:
      begin
      if STStkTkDM.CountListSRC.dataset.fieldbyname('Stock_Take_Status').asstring = 'F' then
        begin
        if MessageDlg('Stock Count already frozen. Confirm you want to re-freeze the count figures',
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
        STStkTkDM.FreezeCount(Self);
      end;
    4:
    begin
      STStkValSlFrm := TSTStkValSlFrm.create(self);
      with STStkValSlFrm do
        try
          begin
          bIs_Stocktake:= True;
          bIs_VariancePrint := STStktkSelFrm.bIs_Varianceprint;
          StockTakeRef := STStkTkDM.CountListSRC.dataset.fieldbyname('Stock_Take_Ref').asstring;
          showmodal;
          if modalresult = idok then
            STStkValSlFrm.FormShow(self);
          end ;
        finally ;
          free;
        end;
      exit;
     end;
     end;
      formshow(self);
end;

procedure TSTStkTkSelFrm.BitBtnCnclClick(Sender: TObject);
begin
if MessageDlg('Confirm cancellation of Stock Count',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DeleteCount;
      formshow(self);
    end
  else
    exit;
end;

procedure TSTStkTkSelFrm.DeleteCount;
begin
with DelCountRecSql do
  begin
    Close;
    ParamByName('Stock_Take_Ref').AsString := STStkTkDM.CountListSRC.dataset.fieldbyname('Stock_Take_Ref').asstring;
    ExecSQL;
  end;
end;

end.
