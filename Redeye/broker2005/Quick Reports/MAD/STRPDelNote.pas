unit STRPDelNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TSTRPDelNotefrm = class(TForm)
    Label1: TLabel;
    edtSONumber: TEdit;
    CloseBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Label3: TLabel;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure Runreport(Preview: ByteBool);
    procedure DateBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STRPDelNotefrm: TSTRPDelNotefrm;

implementation

uses STSOrdDespNt, DateSelV5;

{$R *.DFM}

procedure TSTRPDelNotefrm.PreviewBitBtnClick(Sender: TObject);
begin
  Runreport(True);
end;

procedure TSTRPDelNotefrm.RunReport(Preview: ByteBool);
begin
  STSOrdDespNtFrm := TSTSOrdDespNtFrm.Create(Self);
  try
  STSOrdDespNtFrm.iIntSelCode := strtoint(edtSONumber.text) ;
  STSOrdDespNtFrm.sDespDt := DateEdit.Text;
  STSOrdDespNtFrm.Preview := Preview;
  if STSOrdDespNtFrm.GetDetails(Self) = 0 then
    MessageDlg('There is nothing to print', mtError, [mbOK],0)
  else
    STSOrdDespNtFrm.StartReport(Self);
  finally
    STSOrdDespNtFrm.Free;
  end;
end;

procedure TSTRPDelNotefrm.PrintBitBtnClick(Sender: TObject);
begin
  Runreport(False);

end;

procedure TSTRPDelNotefrm.DateBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;

end;

procedure TSTRPDelNotefrm.FormShow(Sender: TObject);
begin
  DateEdit.Text := DateToStr(Date);
end;

end.
