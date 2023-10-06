unit STPartSuppSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, CCSCommon;

type
  TSTPartSuppSelFrm = class(TForm)
    PreviewBitBTn: TBitBtn;
    SelectionType: TRadioGroup;
    PrintBitBtn: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    procedure SelectionMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PreviewBitBTnClick(Sender: TObject);
    procedure edtPartFromChange(Sender: TObject);
    procedure EnableBtns;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function SelectData: boolean ;
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
  private
    FSelectList: TStringList;
    bFromToSame, bStopToChangeEvent: ByteBool ;
    bchanging: bytebool;
    procedure SetSelectList(const Value: TStringList);
    { Private declarations }
  public
    { Public declarations }
    property SelectList: TStringList read FSelectList write SetSelectList;
  end;

var
  STPartSuppSelFrm: TSTPartSuppSelFrm;

implementation

uses UITypes, STPartSuppDM, STPartSuppRep, STPrtMnt;

{$R *.DFM}

procedure TSTPartSuppSelFrm.SelectionMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	$40..$90:;
  	Ord(','):;
  	Ord('-'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;

end;

procedure TSTPartSuppSelFrm.SetSelectList(const Value: TStringList);
begin
  FSelectList := Value;
end;

procedure TSTPartSuppSelFrm.FormCreate(Sender: TObject);
begin
  FSelectList := TStringList.create;
  SelectList.Duplicates := dupError;
  SelectList.Sorted := true;

  STPartSDM := TSTPartSDM.create(self);
end;

procedure TSTPartSuppSelFrm.PreviewBitBTnClick(Sender: TObject);
begin
  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  if not SelectData then
    begin
      MessageDlg('Nothing to report for the selected range', mtInformation, [mbOk], 0);
      exit;
    end;

  STPartSuppRepFrm := TSTPartSuppRepFrm.create(self);

  try
    STPartSuppRepFrm.qrlblTitle.caption := STPartSuppRepFrm.qrlblTitle.caption + DateToStr(Date());
    STPartSuppRepFrm.SelectionType := SelectionType.items[SelectionType.Itemindex];
    STPartSuppRepFrm.PartRange := 'Product range: ' + edtPartFrom.Text + ' to '+edtPartTo.Text;
    STPartSuppRepFrm.clReport.Preview;
  finally
    STPartSuppRepFrm.free;
  end;
end;

function TSTPartSuppSelFrm.SelectData: boolean ;
var
  irecords: integer;
begin
  {No Suppliers allocated}
  if SelectionType.Itemindex = 0 then
    iRecords := STPartSDM.GetData(0, edtPartFrom.text, edtPartTo.Text, 0,999)
  else
  {By Preferred Supplier}
  if SelectionType.Itemindex = 1 then
    iRecords := STPartSDM.GetData(1, edtPartFrom.text, edtPartTo.Text, 0,0)
  {By Alternative Suppliers}
  else
  if SelectionType.Itemindex = 2 then
    iRecords := STPartSDM.GetData(2, edtPartFrom.text, edtPartTo.Text, 1,999)
  else
  {By All Suppliers}
    iRecords := STPartSDM.GetData(3, edtPartFrom.text, edtPartTo.Text, 0,999);

  if irecords = 0 then
    result := false
  else
    result := true;
end;

procedure TSTPartSuppSelFrm.edtPartFromChange(Sender: TObject);
begin
  if bChanging then exit;
  edtPartTo.Text := edtPartFrom.Text ;
end;

procedure TSTPartSuppSelFrm.EnableBtns;
begin
  PrintBitBtn.Enabled := (Length(edtPartFrom.Text) = Length(edtPartto.Text)) and
            (Length(edtPartFrom.Text) > 0) and
            (SelectionType.ItemIndex > -1);
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TSTPartSuppSelFrm.FormShow(Sender: TObject);
begin
  bFromToSame := True ;
  bStopToChangeEvent := False ;

end;

procedure TSTPartSuppSelFrm.FormDestroy(Sender: TObject);
begin
  STPartSDM.free;
end;

procedure TSTPartSuppSelFrm.PrintBitBtnClick(Sender: TObject);
begin
  if not SelectData then
    begin
      MessageDlg('Nothing to report for the selected range', mtInformation, [mbOk], 0);
      exit;
    end;

  STPartSuppRepFrm := TSTPartSuppRepFrm.create(self);
  try
    STPartSuppRepFrm.SelectionType := SelectionType.items[SelectionType.Itemindex];
    STPartSuppRepFrm.PartRange := edtPartFrom.Text + ' to '+edtPartTo.Text;
    STPartSuppRepFrm.clReport.PrinterSetup;
    STPartSuppRepFrm.clReport.Print;
  finally
    STPartSuppRepFrm.free;
  end;

end;

procedure TSTPartSuppSelFrm.btbtnPartFromClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartFrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;

end;

procedure TSTPartSuppSelFrm.btbtnPartToClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;

end;

end.
