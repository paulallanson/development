unit WTDeleteContractQuotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTDeleteContractQuotes = class(TForm)
    prgbrRecords: TProgressBar;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    edtDateTo: TEdit;
    btnDateRequired: TBitBtn;
    qryQuotes: TFDQuery;
    qryQintNotes: TFDQuery;
    qryJSOL: TFDQuery;
    qryJIntNotes: TFDQuery;
    qrySIL: TFDQuery;
    qryDelete: TFDQuery;
    qryGetCQOption: TFDQuery;
    lblnoRecords: TLabel;
    Label3: TLabel;
    edtDateFrom: TEdit;
    BitBtn1: TBitBtn;
    procedure CheckOK(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function InputDate(TempDate: TDateTime): TDateTime;
    function GetQuoteDetails: integer;
    procedure DeleteQuote(Quote, iInstallAddress, iAvailability, iPayment,
      iNotes, iAddress: integer);
    function CanDelete(tmpQuote: integer): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTDeleteContractQuotes: TfrmWTDeleteContractQuotes;

implementation

uses
  System.UITypes,
  WTUtilitiesDM, wtDataModule, AllCommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTDeleteContractQuotes.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTDeleteContractQuotes.btnDateRequiredClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateTo.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateTo.text;

  edtDateTo.text := paDatestr(InputDate(paDateStr(tempdate)));
  CheckOK(self);
end;

function TfrmWTDeleteContractQuotes.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTDeleteContractQuotes.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
end;

procedure TfrmWTDeleteContractQuotes.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete the quotes between these dates?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  GetQuoteDetails;
  close;
end;

function TfrmWTDeleteContractQuotes.GetQuoteDetails: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
var
  iMax, icount :integer;

function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  qryQuotes.Close;
  qryQuotes.parambyname('Date_From').Asdatetime := paDateStr(edtDateFrom.text);
  qryQuotes.parambyname('Date_To').Asdatetime := paDateStr(edtDateTo.text);
  qryQuotes.Open;

  result := qryQuotes.recordcount;
  lblNoRecords.caption := 'Stage 1 - ' + inttostr(qryQuotes.recordcount) + ' records';

  iMax := qryQuotes.recordcount;
  prgbrRecords.Position := 0;
  icount := 0;
  qryQuotes.first;
  while qryQuotes.Eof <> true do
    begin
      if CanDelete(qryQuotes.fieldbyname('Quote').asinteger) then
        DeleteQuote(qryQuotes.fieldbyname('Quote').asinteger,
                  qryQuotes.fieldbyname('Install_address').asinteger,
                  qryQuotes.fieldbyname('Availability').asinteger,
                  qryQuotes.fieldbyname('Payment_Terms').asinteger,
                  qryQuotes.fieldbyname('Extra_Notes').asinteger,
                  qryQuotes.fieldbyname('Address').asinteger);

      inc(icount);
      prgbrRecords.Position := Round( icount / iMax * 100);
      Application.ProcessMessages;

      qryQuotes.next;
    end;
end;

function TfrmWTDeleteContractQuotes.CanDelete(tmpQuote: integer): boolean;
begin
  result := false;
  with qryGetCQOption do
    begin
      close;
      parambyname('Quote').asinteger := tmpQuote;
      open;
      Result := (recordcount = 0);
    end;
end;


procedure TfrmWTDeleteContractQuotes.DeleteQuote(Quote, iInstallAddress, iAvailability, iPayment, iNotes, iAddress: integer);
var
  iNarrative: integer;
begin
  with qryQIntNotes do
    begin
      close;
      parambyname('Quote').asinteger := Quote;
      open;

      first;

      while eof <> true do
        begin
          iNarrative := fieldbyname('Narrative').asinteger;

          with qryDelete do
            begin
              SQL.Clear;
              SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iNarrative));
              ExecSQL;
            end;
          next;
        end;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE (Notes_Code = ' + IntToStr(iNotes) + ') OR (Notes_Code = ' + IntToStr(iPayment) + ')' +
              ' OR (Notes_Code = ' + IntToStr(iAvailability) + ') OR (Notes_Code = ' + IntToStr(iInstallAddress) + ')');
      execsql;
    end;

    // Now do the quotes
  try
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote_Slab WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote_Internal_Note WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote_Extra WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote_Element WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote_Edge WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote_CutOut WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Quote WHERE Quote = ' + IntToStr(Quote)) ;
      execsql;
    end;
  except
  end;
end;

procedure TfrmWTDeleteContractQuotes.FormCreate(Sender: TObject);
begin
  lblNoRecords.Caption := '';
  CheckOK(self);
end;

procedure TfrmWTDeleteContractQuotes.BitBtn1Click(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
  CheckOK(self);
end;

end.
