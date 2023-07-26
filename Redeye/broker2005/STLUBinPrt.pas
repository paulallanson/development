unit STLUBinPrt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ImgList, Db, Buttons,
  System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUBinPrtFrm = class(TForm)
    FuncRadioGroup: TRadioGroup;
    BinsListView: TListView;
    Label1: TLabel;
    StoreEdit: TEdit;
    PartEdit: TEdit;
    Label2: TLabel;
    BinImageList: TImageList;
    GroupBox1: TGroupBox;
    Key1Image: TImage;
    Key1Label: TLabel;
    Key2Image: TImage;
    Key2Label: TLabel;
    Key3Image: TImage;
    Key3Label: TLabel;
    Key4Image: TImage;
    Key4Label: TLabel;
    GetBinsSQL: TFDQuery;
    GetBinsPartSQL: TFDQuery;
    PartDescrEdit: TEdit;
    SelBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetBinsHadPartSQL: TFDQuery;
    GetBinsEmptySQL: TFDQuery;
    GetAllBinsSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure LoadBinsList(Sender: TObject);
    procedure CheckButtons(Sender: TObject);
    procedure FuncRadioGroupClick(Sender: TObject);
    procedure BinsListViewClick(Sender: TObject);
    procedure SelBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sPartStoreName, sPart, sPartDescr, sSelBin: String ;
    iPartStore: Integer;
    bOK: ByteBool ;
  end;

var
  STLUBinPrtFrm: TSTLUBinPrtFrm;

implementation

{$R *.DFM}

procedure TSTLUBinPrtFrm.FormActivate(Sender: TObject);
begin
bOK := False ;
PartEdit.Text := sPart ;
PartDescrEdit.Text := sPartDescr ;
StoreEdit.Text := sPartStoreName ;
BinImageList.GetBitMap(0, Key1Image.Picture.BitMap) ;
BinImageList.GetBitMap(1, Key2Image.Picture.BitMap) ;
BinImageList.GetBitMap(2, Key3Image.Picture.BitMap) ;
BinImageList.GetBitMap(3, Key4Image.Picture.BitMap) ;
FuncRadioGroupClick(Self) ;
end;

procedure TSTLUBinPrtFrm.LoadBinsList(Sender: TObject);
Var
TempLI: TListItem ;
begin
BinsListView.Items.Clear ;
With GetBinsSQL do
     begin
     Close ;
     ParamByName('Part_Store').AsInteger := iPartStore ;
     If FuncRadioGroup.ItemIndex < 2 then
        ParamByName('Part').AsString := sPart ;
     Open ;
     First ;
     While EOF = False do
           begin
           {Put them into the list view} ;
           TempLI := BinsListView.Items.Add ;
           TempLI.Caption := FieldByName('Part_Bin').AsString ;
           If FieldByName('Bin_Qty').AsInteger > 0 then
              TempLI.ImageIndex := 2
           else
              TempLI.ImageIndex := 0 ;
           If FieldByName('Bin_Can_Pick').AsString = 'Y' then
              TempLI.ImageIndex := TempLI.ImageIndex + 1 ;
           Next ;
           end;
     end;
CheckButtons(Self) ;
end;

procedure TSTLUBinPrtFrm.CheckButtons(Sender: TObject);
begin
{Check if can select} ;
SelBitBtn.Enabled := Assigned(BinsListView.Selected) ;
end;

procedure TSTLUBinPrtFrm.FuncRadioGroupClick(Sender: TObject);
begin
{Change the SQL depending on the setting} ;
Case FuncRadioGroup.ItemIndex of
     0:  GetBinsSQL.SQL := GetBinsPartSQL.SQL ;
     1:  GetBinsSQL.SQL := GetBinsHadPartSQL.SQL ;
     2:  GetBinsSQL.SQL := GetBinsEmptySQL.SQL ;
     3:  GetBinsSQL.SQL := GetAllBinsSQL.SQL;
     end;
If FuncRadioGroup.ItemIndex = 1 then
   begin
   Key1Label.Caption  := 'Can''t Pick, This product not in bin' ;
   Key2Label.Caption  := 'Can Pick, This product not in bin' ;
   Key3Label.Caption  := 'Can''t Pick, This product is in bin' ;
   Key4Label.Caption  := 'Can Pick, This product is in bin' ;
   end
else
   begin
   Key1Label.Caption  := 'Can''t Pick, Empty' ;
   Key2Label.Caption  := 'Can Pick, Empty' ;
   Key3Label.Caption  := 'Can''t Pick, Bin contains products' ;
   Key4Label.Caption  := 'Can Pick, Bin contains products' ;
   end;
If FuncRadioGroup.ItemIndex = 2 then
   begin
   Key3Image.Visible := False ;
   Key4Image.Visible := False ;
   Key3Label.Visible := False ;
   Key4Label.Visible := False ;
   end
else
   begin
   Key3Image.Visible := True ;
   Key4Image.Visible := True ;
   Key3Label.Visible := True ;
   Key4Label.Visible := True ;
   end;
LoadBinsList(self) ;
end;

procedure TSTLUBinPrtFrm.BinsListViewClick(Sender: TObject);
begin
CheckButtons(Self) ;
end;

procedure TSTLUBinPrtFrm.SelBitBtnClick(Sender: TObject);
begin
sSelBin := TListItem(BinsListView.Selected).Caption ;
bOK := True ;
Close ;
end;

end.
