unit PBMntPrtBin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Db, ImgList, Buttons, ExtCtrls,
  System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMntPrtBinFrm = class(TForm)
    StoreLabel: TLabel;
    BinsListView: TListView;
    GetBinsSQL: TFDQuery;
    BinImageList: TImageList;
    FuncGroupBox: TGroupBox;
    AddBitBtn: TBitBtn;
    UpdBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    DelBinSQL: TFDQuery;
    UpdBinSQL: TFDQuery;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    Image4: TImage;
    Label4: TLabel;
    SelBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure LoadBinsList(Sender: TObject);
    procedure CallUpdScreen(sTempFunc: String);
    procedure AddBitBtnClick(Sender: TObject);
    procedure BinsListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure CheckButtons(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure UpdBitBtnClick(Sender: TObject);
    procedure SelBitBtnClick(Sender: TObject);
    procedure BinsListViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sStoreName, sSelBin: String;
    iStore: Integer;
    bAllow_Upd: ByteBool ;
  end;

var
  PBMntPrtBinFrm: TPBMntPrtBinFrm;

implementation

uses UITypes, PBMntPrtBinUpd;


{$R *.DFM}

procedure TPBMntPrtBinFrm.FormActivate(Sender: TObject);
begin
StoreLabel.Caption := 'Bins For Store: ' + sStoreName ;
BinImageList.GetBitMap(0, Image1.Picture.BitMap) ;
BinImageList.GetBitMap(1, Image2.Picture.BitMap) ;
BinImageList.GetBitMap(2, Image3.Picture.BitMap) ;
BinImageList.GetBitMap(3, Image4.Picture.BitMap) ;
LoadBinsList(Self) ;
end;

procedure TPBMntPrtBinFrm.LoadBinsList(Sender: TObject);
Var
TempLI: TListItem ;
begin
BinsListView.Items.Clear ;
With GetBinsSQL do
     begin
     Close ;
     ParamByName('Part_Store').AsInteger := iStore ;
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

procedure TPBMntPrtBinFrm.CallUpdScreen(sTempFunc: String);
begin
PBMntPrtBinUpdFrm := TPBMntPrtBinUpdFrm.Create(self) ;
Try
   PBMntPrtBinUpdFrm.sFuncMode := sTempFunc ;
   PBMntPrtBinUpdFrm.iStore := iStore ;
   PBMntPrtBinUpdFrm.ShowModal ;
   If PBMntPrtBinUpdFrm.ModalResult = mrOK then
      LoadBinsList(Self) ;
Finally
       PBMntPrtBinUpdFrm.Free ;
   end;
end;

procedure TPBMntPrtBinFrm.AddBitBtnClick(Sender: TObject);
begin
CallUpdScreen('A') ;
end;

procedure TPBMntPrtBinFrm.BinsListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
CheckButtons(Self) ;
end;

procedure TPBMntPrtBinFrm.CheckButtons(Sender: TObject);
Var
ItempCount: Integer ;
bTempSelected, bTempHaveStock: ByteBool ;
begin
bTempSelected := False ;
bTempHaveStock := False ;
For iTempCount := 0 to BinsListView.Items.Count - 1 do
     begin
     If BinsListView.Items[iTempCount].Selected then
        begin
        bTempSelected := True ;
        If BinsListView.Items[iTempCount].ImageIndex > 1 then
           bTempHaveStock := True ;
        end
     end;
UpdBitBtn.Enabled := bTempSelected ;
DelBitBtn.Enabled := (bTempSelected) and (bTempHaveStock = False) ;
if bTempSelected then
  sSelBin := TListItem(BinsListView.Selected).Caption;
end;

procedure TPBMntPrtBinFrm.DelBitBtnClick(Sender: TObject);
Var
iTempCount: Integer ;
begin
If MessageDlg('Sure you want to delete ' + IntToStr(BinsListView.SelCount) + ' bins?',
                 mtConfirmation, [mbNo,mbYes],0) = mrYes then
   begin
   For iTempCount := 0 to BinsListView.Items.Count - 1 do
     begin
     If BinsListView.Items[iTempCount].Selected then
        begin
        With DelBinSQL do
             begin
             Close ;
             ParamByName('Part_Store').AsInteger := iStore;
             ParamByName('Part_Bin').AsString := BinsListView.Items[iTempCount].Caption;
             ExecSQL ;
             end;
        end;
     end;
   LoadBinsList(Self) ;
   end;
end;

procedure TPBMntPrtBinFrm.UpdBitBtnClick(Sender: TObject);
Var
TempWord: Word ;
iTempCount: Integer ;
begin
TempWord := MessageDlg('Do you want the selected bins to allow picking?', mtConfirmation, [mbCancel,mbNo,mbYes],0) ;
If (TempWord = mrNo) or (TempWord = mrYes) then
   begin
   For iTempCount := 0 to BinsListView.Items.Count - 1 do
     begin
     If BinsListView.Items[iTempCount].Selected then
        begin
        With UpdBinSQL do
             begin
             Close ;
             ParamByName('Part_Store').AsInteger := iStore;
             ParamByName('Part_Bin').AsString := BinsListView.Items[iTempCount].Caption;
             If TempWord = mrYes then
                 ParamByName('Bin_Can_Pick').AsString := 'Y'
             else
                 ParamByName('Bin_Can_Pick').AsString := 'N' ;
             ExecSQL ;
             end;
        end;
     end;
   LoadBinsList(Self) ;
   end;

end;

procedure TPBMntPrtBinFrm.SelBitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TPBMntPrtBinFrm.BinsListViewClick(Sender: TObject);
begin
CheckButtons(Self) ;
end;

procedure TPBMntPrtBinFrm.FormShow(Sender: TObject);
begin
If bAllow_Upd then
   begin
   Caption := 'Maintain Store Bins';
   selbitbtn.Visible := True;
   end
else
   begin
   Caption := 'Lookup Store Bins' ;
   selBitBtn.Visible := True;
   funcgroupbox.visible := False;
   end;
end;

end.
