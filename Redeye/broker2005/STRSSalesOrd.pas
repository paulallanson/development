unit STRSSalesOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, STSOObjects, IniFiles, CCSPrint, DB, STRPSord,
  QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSSalesOrdfrm = class(TForm)
    OrderGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    OrderDatelbl: TLabel;
    CustomerLbl: TLabel;
    CancelBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    ChkBxLogo: TCheckBox;
    EmailBitBtn: TBitBtn;
    qryGetSOs: TFDQuery;
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure Runreport(Preview: ByteBool);
    procedure FormCreate(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    DisplayPrintDialog : Boolean;
    sAttachmentType: string;
    FEmailAttachment : TstringList;
    FIntSelCode: integer;
    FSONumber: integer;
    sSalesTermsFile: string;
    procedure SetSONumber(const Value: integer);
    procedure ClearEmailArray(Sender: TObject);
    procedure GetSelection;
    procedure EmailReport(Sender: TObject);
    procedure BuildEmailDetails;
    procedure PrintToAttachment(STRPSordFrm: TSTRPSordFrm);
  public
    { Public declarations }
    Reprint: ByteBool;
    bOK: ByteBool;
    PrintSetup: boolean;
    property SONumber: integer read FSONumber write SetSONumber;
  end;

var
  STRSSalesOrdfrm: TSTRSSalesOrdfrm;
  EmailArray: array[1..100, 1..10] of string;

implementation

uses UITypes, 
  pbDatabase, PBEmailList, printers, CCSCommon, pbMainMenu,
  Printer.Tools;

{$R *.DFM}

procedure TSTRSSalesOrdfrm.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
end;

procedure TSTRSSalesOrdfrm.PreviewbitbtnClick(Sender: TObject);
begin
  RunReport(True);
end;

procedure TSTRSSalesOrdfrm.Runreport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  GetSelection;
  STRPSordFrm := TSTRPSordFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPSordFrm.iIntSelCode := fIntSelCode ;
      STRPSOrdFrm.PrintLogo := ChkBxLogo.Checked;
      STRPSordFrm.Preview := Preview;
      if STRPSordFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        end
      else
        begin
          if preview then
            STRPSordFrm.SalesOrdQuickReport.Preview
          else
            if setupPrinter(PrinterSettings) then
              STRPSordFrm.SalesOrdQuickReport.Print;
        end;
    finally
      dmBroker.DelIntSelCode(fIntselCode, True);
      STRPSordFrm.Free;
    end;
  finally
    PrinterSettings.Free;
  end;
end;

procedure TSTRSSalesOrdfrm.FormCreate(Sender: TObject);
begin
  fIntSelCode := dmBroker.GetNextIntSelCode(Self);
  FEmailAttachment := TStringList.create;
  bOK := false;
end;

procedure TSTRSSalesOrdfrm.GetSelection;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dmBroker.DelIntSelCode(fIntSelCode, True);

 	with dmBroker.AddIntSelQuery do
    begin
      Close;
      ParamByName('Int_sel_Code').AsInteger := FIntselCode;
      ParamByName('Sel1').AsFloat := SONumber;
      ParamByName('Text100').AsString := inttostr(SONumber);
      execSQL;
    end;
end;

procedure TSTRSSalesOrdfrm.PrintBitBtnClick(Sender: TObject);
begin
  Printsetup := True;
  RunReport(False);
  bOK := true;
  close;
end;

procedure TSTRSSalesOrdfrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  try
    clearEmailarray(self);
    sSalesTermsFile := dmBroker.GetSalesTermsFile;
    EmailReport(self);
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        if (FEmailAttachment.strings[i] = sSalesTermsFile) then
          continue;
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

procedure TSTRSSalesOrdfrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TSTRSSalesOrdfrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with qryGetSOs do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := FIntselCode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Sales_Order').AsString;
      EmailArray[irow, 2] := FieldByName('Customer').AsString;
      EmailArray[irow, 3] := FieldByName('branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Name').AsString)+' '+Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Email').AsString;
      EmailArray[irow, 6] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 7] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 8] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 9] := FieldByName('Contact_No').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TSTRSSalesOrdfrm.EmailReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  GetSelection;
  
  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the Purchase Order/Supplier details print an email}
  PrinterSettings := TPrinterSettings.Create;
  try
    PBEmailListFrm := TPBEmailListFrm.Create(Self);
    try
    PBEmailListFrm.CodeType := 'C';
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;

      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 8];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 7];

      {Set up the Email Array with the Customer/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 9];
    end;
    if icount = 1 then
      PBEmailListFrm.EmailListGrid.RowCount := 2
    else
      PBEmailListFrm.EmailListGrid.RowCount := icount;

    PBEmailListFrm.Caption := 'Sales Order Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Sales Order';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
      if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;
      STRPSordFrm := TSTRPSordFrm.Create(Self);
      try
        STRPSordFrm.PrinterSettings := PrinterSettings;
        STRPSordFrm.PrintLogo := true;
        STRPSordFrm.Preview := false;
        STRPSordFrm.iIntSelCode := FIntselCode;

        STRPSordFrm.GetDetails(Self);
        DisplayPrintDialog := False;
        STRPSordFrm.SalesOrdQuickReport.Showprogress := False;
        STRPSordFrm.SalesOrdQuickReport.Page.Orientation := poPortrait;

        {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
        sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
        PrintToAttachment(STRPSordFrm);

        {If a Sales terms file exists then add as attachment}
        if sSalesTermsFile <> '' then
          begin
            try
              FEmailAttachment.append(sSalesTermsFile);
            except
            end;
          end;

        sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
        sSubject := 'Sales Order '+ PBEmailListFrm.EmailListGrid.cells[0, irow];
        sBody := 'Please find attached ' + sSubject + '.'#13#10#13#10;

        EmailViaOutlook(sTo,sSubject,sBody, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

      finally
      end;

      STRPSordFrm.Free;
    end;
  end;
  finally;
    PBEmailListFrm.Free;
  end;
  finally
    PrinterSettings.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSSalesOrdfrm.PrintToAttachment(STRPSordFrm: TSTRPSordFrm);
begin
  var fileName := 'SO' + SONumber.ToString;
  TPrinterTools.New.PrintToAttachment(STRPSordFrm.SalesOrdQuickReport, FEmailAttachment, fileName, sAttachmentType);
end;

procedure TSTRSSalesOrdfrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

end.
