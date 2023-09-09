unit STMaintStStkNumbers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TSTMaintStStkNumbersfrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblDelete: TLabel;
    pnlDetails: TPanel;
    Label1: TLabel;
    edtFirst: TEdit;
    edtLast: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblCount: TLabel;
    procedure edtFirstChange(Sender: TObject);
    procedure edtLastChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFirstExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    bchanging: bytebool;
    FMode: string;
    FNumberlength: integer;
    procedure EnableOK;
    procedure CountNumbers;
    procedure SetMode(const Value: string);
    procedure SetNumberlength(const Value: integer);
    function SerialNoExists: boolean;
    { Private declarations }
  public
    iRow: integer;
    property Numberlength: integer read FNumberlength write SetNumberlength;
    property Mode: string read FMode write SetMode;
  end;

var
  STMaintStStkNumbersfrm: TSTMaintStStkNumbersfrm;

implementation

uses
  System.UITypes,
  STLUStStkNumbers;

{$R *.DFM}

procedure TSTMaintStStkNumbersfrm.edtFirstChange(Sender: TObject);
begin
  if not bChanging then
    edtLast.Text := edtFirst.Text;
  CountNumbers;
  enableOK;
end;

procedure TSTMaintStStkNumbersfrm.EnableOK;
begin
  btnOK.enabled := (edtFirst.Text <> '') and
                   (edtLast.Text <> '') and
                   (trim(lblCount.caption) <> '0');
end;

procedure TSTMaintStStkNumbersfrm.CountNumbers;
var
  rCount: real;
begin
  if (trim(edtLast.text) = '') or
     (trim(edtFirst.text) = '') then
    begin
      rCount := 0;
    end
  else
    begin
      rCount := strtoint64(edtLast.text)-strtoint64(edtFirst.text)+1;
      if rCount < 0 then
        rCount := 0;
    end;
//  lblCount.caption := formatfloat('#,##0',(rcount));
 lblCount.caption := formatfloat('####0',(rcount));
end;

procedure TSTMaintStStkNumbersfrm.edtLastChange(Sender: TObject);
begin
  CountNumbers;
  enableOK;
end;

procedure TSTMaintStStkNumbersfrm.FormActivate(Sender: TObject);
begin
  if Mode <> 'D' then
    edtFirst.setfocus
  else
    btnOK.setfocus;
end;

procedure TSTMaintStStkNumbersfrm.FormCreate(Sender: TObject);
begin
  bChanging := false
end;

procedure TSTMaintStStkNumbersfrm.edtFirstExit(Sender: TObject);
begin
  bChanging := true
end;

procedure TSTMaintStStkNumbersfrm.SetMode(const Value: string);
begin
  FMode := Value;
  lblDelete.visible := (FMode = 'D');
  pnlDetails.enabled := (FMode <> 'D');
end;

procedure TSTMaintStStkNumbersfrm.FormShow(Sender: TObject);
begin
  if Mode = 'A' then
    bChanging := false
  else
    bChanging := true;
  CountNumbers;
  EnableOK;
end;

procedure TSTMaintStStkNumbersfrm.btnOKClick(Sender: TObject);
begin
  if (length(edtFirst.text) <> length(edtLast.text)) then
    begin
      MessageDlg('The length of the serial numbers must be equal.', mtError,
        [mbOk], 0);
      exit;
    end;

  if NumberLength <> 0 then
    begin
      if (length(edtFirst.text) <> NumberLength) or (length(edtLast.text) <> NumberLength) then
        begin
          MessageDlg('The length of the serial numbers must be '+inttostr(NumberLength)+ ' characters long, pad numbers out with leading zeros.', mtError,
            [mbOk], 0);
          exit;
        end;
    end;

  if SerialNoExists then
    begin
      MessageDlg('Some Serial numbers in the range specified have already been selected.', mtError,
        [mbOk], 0);
      exit;
    end;
  Modalresult := mrOK;
end;

procedure TSTMaintStStkNumbersfrm.SetNumberlength(const Value: integer);
begin
  FNumberlength := Value;
end;

function TSTMaintStStkNumbersfrm.SerialNoExists: boolean;
var
  i: integer;
  bOKFrom, bOKTo: boolean;
begin
  Result := false;
  bOKFrom := false;
  bOKTo := false;

  {Check if valid 'from' value}
  for i := 1 to pred(STLUStStkNumbersFrm.sgDetail.rowcount) do
    begin
      if ((Mode = 'C') or (Mode = 'D')) and ((iRow) = i) then
        continue;
      if (trim(edtFirst.text) >= STLUStStkNumbersFrm.sgDetail.cells[0,i]) and
         (trim(edtFirst.text) <= STLUStStkNumbersFrm.sgDetail.cells[1,i]) then
        begin
          bOKFrom := true;
          break;
        end;
    end;

  {Check if valid 'to' value}
  for i := 1 to pred(STLUStStkNumbersFrm.sgDetail.rowcount) do
    begin
      if ((Mode = 'C') or (Mode = 'D')) and ((iRow) = i) then
        continue;
      if (trim(edtLast.text) >= STLUStStkNumbersFrm.sgDetail.cells[0,i]) and
         (trim(edtLast.text) <= STLUStStkNumbersFrm.sgDetail.cells[1,i]) then
        begin
          bOKTo := true;
          break;
        end;
    end;
  if bOKFrom or bOKto then
    Result := True;
end;
end.
