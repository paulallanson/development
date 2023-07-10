unit STSelSOrdSerialNos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, STSOObjects;

type
  TSTSelSOrdSerialNosFrm = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtNumberFrom: TEdit;
    edtNumberTo: TEdit;
    Label3: TLabel;
    lblCount: TLabel;
    lblSetsPerPad: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edtNumberFromChange(Sender: TObject);
    procedure edtNumberToChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FOrderLine: TOrderLine;
    FTempOrderLine: TOrderLine;
    FMode: string;
    FSetsPerPad: integer;
    function CountNumbers: real;
    procedure EnableOK;
    procedure SetOrderLine(const Value: TOrderLine);
    function SerialNoValid: boolean;
    function SerialNoExists: boolean;
    procedure SetTempOrderLine(const Value: TOrderLine);
    procedure SetMode(const Value: string);
    procedure SetSetsPerPad(const Value: integer);
  public
    iSerialNo: integer;
    iLength: integer;
    property Mode: string read FMode write SetMode;
    property OrderLine: TOrderLine read FOrderLine write SetOrderLine;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
    property TempOrderLine: TOrderLine read FTempOrderLine write SetTempOrderLine;
  end;

var
  STSelSOrdSerialNosFrm: TSTSelSOrdSerialNosFrm;

implementation

{$R *.DFM}

procedure TSTSelSOrdSerialNosFrm.FormActivate(Sender: TObject);
begin
  lblCount.caption := formatfloat('###0',countNumbers);
  edtNumberFrom.setfocus;
end;

procedure TSTSelSOrdSerialNosFrm.edtNumberFromChange(Sender: TObject);
begin
  lblCount.caption := formatfloat('###0',countNumbers);
  enableOK;
end;

procedure TSTSelSOrdSerialNosFrm.edtNumberToChange(Sender: TObject);
begin
  lblCount.caption := formatfloat('###0',countNumbers);
  enableOK;
end;

function TSTSelSOrdSerialNosFrm.CountNumbers: real;
var
  rCount: real;
begin
  if (trim(edtNumberTo.text) = '') or
     (trim(edtNumberFrom.text) = '') then
    begin
      rCount := 0;
    end
  else
    begin
      rCount := (strtoint64(edtNumberTo.text)-strtoint64(edtNumberFrom.text)+1)/SetsPerPad;
      if rCount < 0 then
        rCount := 0;
    end;
  result := rcount;
end;

procedure TSTSelSOrdSerialNosFrm.EnableOK;
begin
  btnOK.enabled := (edtNumberFrom.Text <> '') and
                   (edtNumberTo.Text <> '') and
                   (trim(lblCount.caption) <> '0');
end;

procedure TSTSelSOrdSerialNosFrm.btnOKClick(Sender: TObject);
begin
  if (length(edtNumberfrom.text) <> iLength) or (length(edtNumberTo.text) <> iLength) then
    begin
      MessageDlg('The length of the serial numbers must be '+inttostr(iLength)+ ' characters long, pad numbers out with leading zeros.', mtError,
        [mbOk], 0);
      exit;
    end;

  if not SerialNoValid then
    begin
      MessageDlg('This Serial number range is not valid for this product.', mtError,
        [mbOk], 0);
      exit;
    end;

  if SerialNoExists then
    begin
      MessageDlg('Some Serial numbers in the range specified have already been selected.', mtError,
        [mbOk], 0);
      exit;
    end;
  ModalResult := mrOK;
end;

function TSTSelSOrdSerialNosFrm.SerialNoValid: boolean;
var
  i: integer;
  bOKFrom, bOKTo: boolean;
begin
  Result := false;
  bOKFrom := false;
  bOKTo := false;

  {Check if valid 'from' value}
  for i := 0 to pred(OrderLine.StockSerialNos.count) do
    begin
      if (trim(edtNumberFrom.text) >= OrderLine.StockSerialNos[i].SerialItemFrom) and
         (trim(edtNumberFrom.text) <= OrderLine.StockSerialNos[i].SerialItemTo) then
        begin
          bOKFrom := true;
          break;
        end;
    end;

  {Check if valid 'to' value}
  for i := 0 to pred(OrderLine.StockSerialNos.count) do
    begin
      if (trim(edtNumberTo.text) >= OrderLine.StockSerialNos[i].SerialItemFrom) and
         (trim(edtNumberTo.text) <= OrderLine.StockSerialNos[i].SerialItemTo) then
        begin
          bOKTo := true;
          break;
        end;
    end;
  if bOKFrom and bOKto then
    Result := True;
end;

function TSTSelSOrdSerialNosFrm.SerialNoExists: boolean;
var
  i: integer;
  bOKFrom, bOKTo: boolean;
begin
  Result := false;
  bOKFrom := false;
  bOKTo := false;

  {Check if valid 'from' value}
  for i := 0 to pred(TempOrderLine.SerialNumbers.count) do
    begin
      if ((Mode = 'C') or (Mode = 'D')) and ((iSerialNo) = i) then
        continue;
      if (trim(edtNumberFrom.text) >= TempOrderLine.SerialNumbers[i].SerialItemFrom) and
         (trim(edtNumberFrom.text) <= TempOrderLine.SerialNumbers[i].SerialItemTo) then
        begin
          bOKFrom := true;
          break;
        end;
    end;

  {Check if valid 'to' value}
  for i := 0 to pred(TempOrderLine.SerialNumbers.count) do
    begin
      if ((Mode = 'C') or (Mode = 'D')) and ((iSerialNo) = i) then
        continue;
      if (trim(edtNumberTo.text) >= TempOrderLine.SerialNumbers[i].SerialItemFrom) and
         (trim(edtNumberTo.text) <= TempOrderLine.SerialNumbers[i].SerialItemTo) then
        begin
          bOKTo := true;
          break;
        end;
    end;
  if bOKFrom or bOKto then
    Result := True;
end;

procedure TSTSelSOrdSerialNosFrm.SetOrderLine(const Value: TOrderLine);
begin
  FOrderLine := Value;
end;

procedure TSTSelSOrdSerialNosFrm.SetTempOrderLine(const Value: TOrderLine);
begin
  FTempOrderLine := Value;
end;

procedure TSTSelSOrdSerialNosFrm.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TSTSelSOrdSerialNosFrm.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
  lblSetsPerPad.caption := 'Sets per pad/book: '+inttostr(FSetsPerPad);
  lblSetsPerPad.visible := (FSetsPerPad > 1);
end;

end.
