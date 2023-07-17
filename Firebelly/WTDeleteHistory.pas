unit WTDeleteHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBTables, QrCtrls;

type
  TfrmWTDeleteHistory = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    prgbrRecords: TProgressBar;
    qryQuotes: TQuery;
    lblnoRecords: TLabel;
    qrySOL: TQuery;
    qrySIL: TQuery;
    qryDelete: TQuery;
    qryJobs: TQuery;
    qryQintNotes: TQuery;
    qryJSOL: TQuery;
    qryJIntNotes: TQuery;
    chkbxIncludeConfirmed: TCheckBox;
    chkbxDeleteOrders: TCheckBox;
    edtDateRequired: TEdit;
    btnDateRequired: TBitBtn;
    Label2: TLabel;
    procedure CheckOK(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure chkbxIncludeConfirmedClick(Sender: TObject);
    procedure edtDateRequiredExit(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
  private
    function GetQuoteDetails: integer;
    procedure DeleteQuote(Quote, iInstallAddress, iAvailability, iPayment, iNotes, iAddress: integer);
    procedure DeleteSalesOrder(Quote: integer);
    function GetJobDetails: integer;
    procedure DeleteJSalesOrder(Job: integer);
    procedure DeleteJob(Job, iInstallAddress, iAvailability, iPayment, iNotes, iAddress: integer);
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTDeleteHistory: TfrmWTDeleteHistory;

implementation

uses WTUtilitiesDM, wtDataModule, AllCommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTDeleteHistory.FormCreate(Sender: TObject);
begin
  dtmdlUtilities := TdtmdlUtilities.create(self);
  lblNoRecords.Caption := '';
  CheckOK(self);
end;

procedure TfrmWTDeleteHistory.FormDestroy(Sender: TObject);
begin
  dtmdlUtilities.Free;
end;

procedure TfrmWTDeleteHistory.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete the quotes up to this date?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  GetQuoteDetails;
  if chkbxDeleteOrders.Checked then
    GetJobDetails;
  close;
end;

function TfrmWTDeleteHistory.GetQuoteDetails: integer;
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
  qryQuotes.parambyname('Date_From').Asdatetime := paDateStr(edtDateRequired.text);

  if chkbxIncludeConfirmed.Checked then
    qryQuotes.parambyname('Quote_status').Asinteger := 30
  else
    qryQuotes.parambyname('Quote_status').Asinteger := 22;

  qryQuotes.Open;

  result := qryQuotes.recordcount;
  lblNoRecords.caption := 'Stage 1 - ' + inttostr(qryQuotes.recordcount) + ' records';

  iMax := qryQuotes.recordcount;
  prgbrRecords.Position := 0;
  icount := 0;
  qryQuotes.first;
  while qryQuotes.Eof <> true do
    begin
      if chkbxDeleteOrders.Checked then
        DeleteSalesOrder(qryQuotes.fieldbyname('Quote').asinteger);

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

function TfrmWTDeleteHistory.GetJobDetails: integer;
var
  iMax, icount :integer;

  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
begin
  qryJobs.Close;
  qryJobs.parambyname('Date_From').Asdatetime := paDateStr(edtDateRequired.text);
  qryJobs.Open;

  result := qryJobs.recordcount;
  lblNoRecords.caption := 'Stage 2 - ' + inttostr(qryJobs.recordcount) + ' records';
  iMax := qryJobs.recordcount;
  prgbrRecords.Position := 0;

  icount := 0;
  qryJobs.first;
  while qryJobs.Eof <> true do
    begin
      DeleteJSalesOrder(qryJobs.fieldbyname('Job').asinteger);
      DeleteJob(qryJobs.fieldbyname('Job').asinteger,
                qryJobs.fieldbyname('Install_address').asinteger,
                qryJobs.fieldbyname('Availability').asinteger,
                qryJobs.fieldbyname('Payment_Terms').asinteger,
                qryJobs.fieldbyname('Extra_Notes').asinteger,
                qryJobs.fieldbyname('Address').asinteger);
      inc(icount);
      prgbrRecords.Position := Round( icount / iMax * 100);
      Application.ProcessMessages;

      qryJobs.next;
    end;
end;

procedure TfrmWTDeleteHistory.DeleteQuote(Quote, iInstallAddress, iAvailability, iPayment, iNotes, iAddress: integer);
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

(*
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iInstallAddress));
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iAvailability) );
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iPayment));
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iNotes)) ;
      execsql;
    end;
*)
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

(*  Removed this because we might want to keep retail address details
  {Delete the address reference}
  try
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Address WHERE Address = ' + IntToStr(iAddress)) ;
      execsql;
    end;
  except
  end;
*)
end;

procedure TfrmWTDeleteHistory.DeleteJob(Job, iInstallAddress, iAvailability, iPayment, iNotes, iAddress: integer);
var
  iNarrative: integer;
begin
  with qryJIntNotes do
    begin
      close;
      parambyname('Job').asinteger := Job;
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
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iNarrative));
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iInstallAddress));
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iAvailability) );
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iPayment));
      ExecSQL;
    end;

  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iNotes)) ;
      execsql;
    end;

// Now do the Jobs
  try
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_Remedial WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_Internal_Note WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_Extra WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_Element WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_Address WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_Edge WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job_CutOut WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  with qryDelete do
    begin
      SQL.Clear;
      SQL.Add('DELETE FROM Job WHERE Job = ' + IntToStr(Job)) ;
      execsql;
    end;
  except
  end;
end;

procedure TfrmWTDeleteHistory.DeleteSalesOrder(Quote: integer);
var
  SalesOrder, SalesInvoice: integer;
  iNotes, aNotes, exNotes, iInstallAddress, iAddress: integer;
begin
  with qrySOL do
    begin
      close;
      parambyname('Quote').asinteger := Quote;
      open;
      SalesOrder := fieldbyname('Sales_order').asinteger;
      exNotes := fieldbyname('Extra_Notes').asinteger;
      iInstallAddress := fieldbyname('Install_Address').asinteger;
      iAddress := fieldbyname('Address').asinteger;
    end;

  with qrySIL do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      open;
      SalesInvoice := fieldbyname('Sales_Invoice').asinteger;
      iNotes := fieldbyname('Notes').asinteger;
      aNotes := fieldbyname('Internal_Notes').asinteger;
    end;

  if SalesInvoice <> 0 then
    begin
      try
      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iNotes) + ' OR Notes_Code = ' + IntToStr(aNotes)) ;
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_invoice_line WHERE Sales_Invoice =' + IntToStr(SalesInvoice));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_Invoice WHERE Sales_Invoice =' + IntToStr(SalesInvoice));
          execsql;
        end;
      except
      end;
    end;

  if SalesOrder <> 0 then
    begin
      try
      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iInstallAddress));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(exNotes));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_Order_line WHERE Sales_Order = ' + IntToStr(SalesOrder));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_Order WHERE Sales_Order =' + IntToStr(SalesOrder));
          execsql;
        end;

(*    Don't delete address details may wnat record of retail customers.
      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Address WHERE Address = ' + IntToStr(iAddress));
          execsql;
        end;
*)
      except
      end;
    end;
end;

procedure TfrmWTDeleteHistory.DeleteJSalesOrder(Job: integer);
var
  SalesOrder, SalesInvoice: integer;
  iNotes, aNotes, exNotes: integer;
begin
  with qryJSOL do
    begin
      close;
      parambyname('Job').asinteger := Job;
      open;
      SalesOrder := fieldbyname('Sales_order').asinteger;
      exNotes := fieldbyname('Extra_Notes').asinteger;
    end;

  with qrySIL do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      open;
      SalesInvoice := fieldbyname('Sales_Invoice').asinteger;
      iNotes := fieldbyname('Notes').asinteger;
      aNotes := fieldbyname('Internal_Notes').asinteger;
    end;

  if SalesInvoice <> 0 then
    begin
      try
      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(iNotes) + ' OR Notes_Code = ' + IntToStr(aNotes)) ;
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_invoice_line WHERE Sales_Invoice =' + IntToStr(SalesInvoice));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_Invoice WHERE Sales_Invoice =' + IntToStr(SalesInvoice));
          execsql;
        end;
      except
      end;
    end;

  if SalesOrder <> 0 then
    begin
      try
      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Notes WHERE Notes_Code = ' + IntToStr(exNotes));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_Order_line WHERE Sales_Order = ' + IntToStr(SalesOrder));
          execsql;
        end;

      with qryDelete do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM Sales_Order WHERE Sales_Order =' + IntToStr(SalesOrder));
          execsql;
        end;
      except
      end;
    end;
end;

procedure TfrmWTDeleteHistory.chkbxIncludeConfirmedClick(Sender: TObject);
begin
  chkbxDeleteOrders.Enabled := (Sender as TcheckBox).checked;
  if not (Sender as TcheckBox).checked then
    begin
      chkbxDeleteOrders.Checked := false;
    end;
end;

procedure TfrmWTDeleteHistory.edtDateRequiredExit(Sender: TObject);
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

procedure TfrmWTDeleteHistory.btnDateRequiredClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateRequired.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateRequired.text;

  edtDateRequired.text := paDatestr(InputDate(paDateStr(tempdate)));
  CheckOK(self);
end;

function TfrmWTDeleteHistory.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTDeleteHistory.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtDateRequired.Text <> '');
end;


end.
