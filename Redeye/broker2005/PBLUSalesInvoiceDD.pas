unit PBLUSalesInvoiceDD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, IniFiles, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSalesInvoiceDDFrm = class(TForm)
    stbrDetails: TStatusBar;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    btnDateFrom: TSpeedButton;
    btnDateTo: TSpeedButton;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnExport: TButton;
    btnCancel: TButton;
    lblExpTo: TLabel;
    edtExpFile: TEdit;
    btnBrowse: TButton;
    qrySalesInvs: TFDQuery;
    qrySalesInvByDate: TFDQuery;
    qrySalesInvByNumber: TFDQuery;
    qryUpdInvs: TFDQuery;
    GetLastIntSelSQL: TFDQuery;
    AddWorkSQL: TFDQuery;
    GetInvRngSQL: TFDQuery;
    AddIntSelQuery: TFDQuery;
    DelWorkSQL: TFDQuery;
    OpenDialog1: TOpenDialog;
    dtsSalesInv: TDataSource;
    chkbxShowExported: TCheckBox;
    OleContainer1: TOleContainer;
    procedure btnExportClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure btnDateFromClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure EnableExport(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure chkbxShowExportedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    intSel: integer;
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure DelIntSelCode(iTempIntSelCode: Integer;
      bTempDelCode: ByteBool);
    procedure ExportInvs;
    function GetNextIntSelCode(Sender: TObject): Integer;
    function GetPath: string;
    procedure GetSelection;
    function ParseFileName(path: string): string;
    function ParsePathName(path: string): string;
    procedure SavePath;
    procedure UpdateInvs;
    procedure FixQuery(rep: Boolean);
    function CheckInvalidCodes: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBLUSalesInvoiceDDFrm: TPBLUSalesInvoiceDDFrm;

implementation

uses UITypes, pbDatabase, CCSCommon, DateSelV5, pbMainMenu;

{$R *.dfm}

procedure TPBLUSalesInvoiceDDFrm.btnExportClick(Sender: TObject);
var
  tempStr: string;
  exportOK: boolean;
begin
  if CheckInvalidCodes then
    begin
      messageDlg('Some customers do not have direct debit codes. Amend the account details accordingly!', mtError, [mbOK], 0);
      exit;
    end;

  exportOK := false;
  if self.edtExpFile.Text = '' then
  begin
    messageDlg('You must enter a path to export the data to.', mtInformation, [mbOK], 0);
    exit;
  end;

  self.SavePath;

  self.qrySalesInvs.Close;

  self.qrySalesInvs.SQL.Text := self.qrySalesInvByDate.SQL.Text;
  self.qrySalesInvs.ParamByName('DateFrom').asDate := StrToDate(self.edtDateFrom.Text);
  self.qrySalesInvs.ParamByName('DateTo').asDate := StrToDate(self.edtDateTo.Text);

  self.qrySalesInvs.Open;

  if self.qrySalesInvs.RecordCount > 0 then
  begin
    if FileExists(edtExpFile.Text) then
    begin
      if messageDlg('File already exists, do you want to overwrite?', mtWarning, [mbYes, mbNO], 0) = mrNo then
      begin
        exit;
      end;
    end;

    tempStr := self.ParsePathName(edtExpFile.Text);
    if not DirectoryExists(tempStr) then
    begin
      if messageDlg('The directory does not exist. Do you want to create it?', mtWarning, [mbyes, mbNO], 0) = mrYes then
      begin
        if not CreateDir(tempStr) then
        begin
          raise Exception.Create('Cannot create ' + tempStr);
        end;
      end
      else
      begin
        exit;
      end;
    end;

    self.ExportInvs;
    self.UpdateInvs;
    dmBroker.UpdateDirectDebitFileNo;
    exportOK := true;
  end
  else
  begin
    messageDlg('There are no invoices to be paid by direct debit in the given selection.', mtInformation, [mbOK], 0);
  end;

  if exportOK then
    self.Close;
end;

procedure TPBLUSalesInvoiceDDFrm.btnDateToClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateTo.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      edtDateTo.Text := DateToStr(DateSelV5Form.Date);
    end;
  finally
    DateSelV5Form.Free;
    FixQuery(false);
  end;
  EnableExport(self);
end;

procedure TPBLUSalesInvoiceDDFrm.btnDateFromClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateFrom.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      edtDateFrom.Text := DateToStr(DateSelV5Form.Date);
    end;
  finally
    DateSelV5Form.Free;
    FixQuery(false);
  end;
  EnableExport(self);
end;

procedure TPBLUSalesInvoiceDDFrm.ExportInvs;
var
  factorFile: TextFile;
  tempStr: string;
  rTotal: real;
  sCompanyDirectDebitID: string;
begin
  try
    deleteFile(edtExpFile.Text)
  except

  end;

  assignFile(factorFile, edtExpFile.Text);
  rewrite(factorFile);

  tempstr := '';

(*  {write away the file header}
  tempstr     := '"Input"';
  WriteLn(factorFile, tempStr);

  {write away the Company Name}
  tempstr     := ',""' + ',""' + ',""' + ',""' + ',""' + ',""' + ',""' + dmBroker.GetCompanyName;
  WriteLn(factorFile, tempStr);

  {write away blank line}
  tempstr     := '""';
  WriteLn(factorFile, tempStr);

*)
  {write away the column headings}
  tempstr     := '"Credit Acc ID"'
              + ',"Invoice Number"'
              + ',"Payer Reference"'
              + ',"Amount"'
              + ',"Collection Date"';
//              + ',"Invoice Number"';

  WriteLn(factorFile, tempStr);
  rTotal := 0;
  sCompanyDirectDebitID := dmBroker.GetCompanyDirectDebitAccountID;

  while not self.qrySalesInvs.eof do
  begin
    tempStr := sCompanyDirectDebitID;
    tempStr := tempstr + ',' + qrySalesInvs.fieldByName('Sales_Invoice_No').asString;
    tempStr := tempstr + ',' + qrySalesInvs.fieldByName('Direct_Debit_Code').asString;
//    tempStr := tempStr + ',' + self.qrySalesInvs.fieldByName('Total_Value').asString;
    tempStr := tempStr + ',' + CurrencyDisp(frmPBMainMenu.sCurrencyMask,self.qrySalesInvs.fieldByName('Total_Value').asString);
    tempStr := tempStr + ',' + formatdatetime('dd"/"mm"/"yyyy',self.qrySalesInvs.fieldByName('Invoice_Date').asdatetime + self.qrySalesInvs.fieldByName('Number_Of_Days').asinteger);
//    tempStr := tempStr + ',' + self.qrySalesInvs.fieldByName('Sales_Invoice_no').asstring;

    WriteLn(factorFile, tempStr);

    rTotal := rTotal +  self.qrySalesInvs.fieldByName('Total_Value').asfloat;

    self.qrySalesInvs.next;
  end;

  {write away blank line}
  tempstr     := '""';
  WriteLn(factorFile, tempStr);

  {write away the Amount Total}
  tempstr     := '"' + '","' + '","' + formatfloat('0.00',rTotal) + '"';
  WriteLn(factorFile, tempStr);

  CloseFile(factorFile);

  self.OleContainer1.CreateLinkToFile(edtExpFile.Text, false);
  self.OleContainer1.DoVerb(0);

//  messageDlg('Direct Debit File created containing ' + IntToStr(self.qrySalesInvs.recordCount) + ' invoice(s).', mtInformation, [mbOK], 0);
end;

procedure TPBLUSalesInvoiceDDFrm.btnBrowseClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  OpenDialog1.filename := self.edtExpFile.Text;
  if self.OpenDialog1.Execute then
    self.edtExpFile.Text := self.OpenDialog1.Files[0];
  EnableExport(self);
end;

procedure TPBLUSalesInvoiceDDFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUSalesInvoiceDDFrm.FormShow(Sender: TObject);
begin
  self.edtDateFrom.Text := DateToStr(date() - 7);
  self.edtDateTo.Text := DateToStr(date());
  if self.GetPath <> '' then
    self.edtExpFile.Text := self.GetPath + 'DirectDebit' + inttostr(dmBroker.GetNextDirectDebitFileNo) + '.csv'
  else
    self.edtExpFile.Text := '';
end;

procedure TPBLUSalesInvoiceDDFrm.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
(*	 selectLst.Clear;

	 ilength := length(SelectionMemo.text);

 	stext := SelectionMemo.text;
  if copy(stext,ilength,1) <> ',' then
  	 stext := stext + ',';

  stext := trim(stext);

  ifinish := 0;
  while pos(',',stext) > 0 do
  begin
  		istart := ifinish + 1;
  		ifinish := pos(',',stext);
    ilength := ifinish - istart;

    {Chop out the string which is to be evaluated}
    sEvaluate := copy(stext,istart,ilength);
    sEvaluate := trim(sEvaluate);

    {Check to see if the string has a range selection}
    irange := pos('-',sEvaluate);
    inewLength := length(sEvaluate);

    if irange > 0 then
    begin
      {Build the list of possible values in between the range}
      sFirst := copy(sEvaluate,1,irange-1);
      sLast := copy(sEvaluate,irange+1,(iNewLength-irange));

      BuildRange(sFirst,sLast);
      stext[ifinish] := ':';
      continue;
    end;

    {Check that the item does not already exist}
    if SelectLst.Items.IndexOf(sEvaluate) < 0 then
      SelectLst.Items.Add(sEvaluate);

    stext[ifinish] := ':';
  end;
*)
end;

procedure TPBLUSalesInvoiceDDFrm.BuildRange(sFirst, sLast: string);
begin
(* 	With GetInvRngSQL do
  begin
    Close;
    ParamByName('From_InvNum').AsString := sFirst;
    ParamByName('To_InvNum').AsString := sLast;

    Open;
    First;
    While Not EOF do
    begin
      SelectLst.Items.Add(FieldByName('Sales_invoice_no').AsString);
      Next;
    end;
  end;
*)
end;

procedure TPBLUSalesInvoiceDDFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
  {Delete ALL entries on the workfile for the int_sel_code} ;
  With DelWorkSQL do
  begin
    Close ;
    ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
    ExecSQL ;
  end;
  {Add the reserving one back in} ;
  If not bTempDelCode then
  begin
    With AddWorkSQL do
    begin
      Close ;
      ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
      ParamByName('Text100').AsString := '' ;
      ExecSQL ;
    end;
  end;
end;

procedure TPBLUSalesInvoiceDDFrm.GetSelection;
var
	icount: integer;
begin
(*	 {When the constructing of the list is complete, write to the Report Selection file}
	 DelIntSelCode(intSel, True);
  buildselection;
  if SelectLst.Items.Count > 100 then
  begin
    MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
    SelectLst.Clear;
    SelectionMemo.Clear;
    SelectionMemo.SetFocus;
  end;
  for icount := 0 to SelectLst.Items.count -1 do
  begin
    {Get the relevant Invoice number}
    if SelectLst.Items[icount] = '' then continue;

    with AddIntSelQuery do
    begin
      Close;
      ParamByName('Int_sel_Code').AsInteger := self.intSel;
      ParamByName('Sel1').AsFloat := StrToFloatDef(SelectLst.Items[icount], 0, FormatSettings);
      ParamByName('Text100').AsString := SelectLst.Items[icount];
      execSQL;
    end;
  end;
*)
end;

function TPBLUSalesInvoiceDDFrm.GetNextIntSelCode(
  Sender: TObject): Integer;
var
  iIntSelCode: Integer;
begin
  {Get the next int_sel_code to use};
  With GetLastIntSelSQL do
  begin
    Close;
    Open;
    First;
    iIntSelCode := FieldByName('Last_Code').AsInteger + 1;
  end;

  {Reserve it on the int_sel file};
  With AddWorkSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    ParamByName('Text100').AsString := '';
    ExecSQL ;
  end;
  Result := iIntSelCode;
end;

procedure TPBLUSalesInvoiceDDFrm.UpdateInvs;
var
  fileName: string;
  theTime: TDateTime;
begin
  fileName := parseFileName(edtExpFile.Text);
  theTime := Now();

  self.qrySalesInvs.First;
  while not self.qrySalesInvs.Eof do
  begin
    self.qryUpdInvs.ParamByName('sales_invoice').asInteger :=
      self.qrySalesInvs.FieldByName('sales_invoice').asInteger;
    self.qryUpdInvs.ParamByName('Direct_Debit_Filename').asString := fileName;
    self.qryUpdInvs.ParamByName('Direct_Debit_Date').asDateTime := theTime;

    self.qryUpdInvs.ExecSQL;

    self.qrySalesInvs.next;
  end;
end;

function TPBLUSalesInvoiceDDFrm.ParseFileName(path: string): string;
var
  inx: integer;
begin
  inx := pos('\', path);

  while inx <> 0 do
  begin
    delete(path, 1, inx);
    inx := pos('\', path);
  end;
  result := path;
end;

function TPBLUSalesInvoiceDDFrm.ParsePathName(path: string): string;
var
  inx: integer;
  tempStr: string;
begin
  tempStr := '';
  inx := pos('\', path);

  while inx <> 0 do
  begin
    tempStr := tempStr + copy(path, 1, inx);
    delete(path, 1, inx);
    inx := pos('\', path);
  end;
  result := tempStr;
end;

procedure TPBLUSalesInvoiceDDFrm.SavePath;
var
  tempStr: String;
  IniFile : TIniFile;
begin
//  tempStr := edtExpFile.text;

  tempStr := self.ParsePathName(edtExpFile.Text);

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Invoice Direct Debit', 'File Path', tempStr);
  finally
    IniFile.Free;
  end;
end;

function TPBLUSalesInvoiceDDFrm.GetPath: string;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    Result := IniFile.ReadString('Invoice Direct Debit', 'File Path', '');
  finally
    IniFile.Free;
  end;
end;

procedure TPBLUSalesInvoiceDDFrm.FormDestroy(Sender: TObject);
begin
  self.DelIntSelCode(self.intSel, true);
end;

function TPBLUSalesInvoiceDDFrm.CheckInvalidCodes: boolean;
begin
  result := false;
  with qrySalesInvs do
    begin
      while eof <> true do
        begin
          if fieldbyname('Direct_Debit_Code').asstring = '' then
            begin
              result := true;
              exit;
            end;
          next;
        end;
    end;
end;

procedure TPBLUSalesInvoiceDDFrm.FixQuery(rep: Boolean);
begin
  qrySalesInvs.DisableControls;
  try
    self.qrySalesInvs.Close;

    self.qrySalesInvs.SQL.Text := self.qrySalesInvByDate.SQL.Text;
    self.qrySalesInvs.ParamByName('DateFrom').asDate := StrToDate(self.edtDateFrom.Text);
    self.qrySalesInvs.ParamByName('DateTo').asDate := StrToDate(self.edtDateTo.Text);
    if chkbxShowExported.checked then
      self.qrySalesInvs.ParamByName('Show_All').asstring := 'Y'
    else
      self.qrySalesInvs.ParamByName('Show_All').asstring := 'N';

    self.qrySalesInvs.Open;
    stbrDetails.Panels[0].text := IntToStr(self.qrySalesInvs.RecordCount)+ ' records displayed';
  finally
    qrySalesInvs.EnableControls;
  end;

end;


procedure TPBLUSalesInvoiceDDFrm.FormActivate(Sender: TObject);
begin
  self.fixquery(false)
end;

procedure TPBLUSalesInvoiceDDFrm.FormCreate(Sender: TObject);
begin
  stbrDetails.Top := Screen.Height - stbrDetails.Height;
end;

procedure TPBLUSalesInvoiceDDFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateFrom.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtDateFrom.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      self.edtDateFrom.SetFocus;
      Exit;
    end;
  end;

  edtDateFrom.Text := PBDatestr(NewDate);
  FixQuery(False);
end;

procedure TPBLUSalesInvoiceDDFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateTo.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtDateTo.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      self.edtDateTo.SetFocus;
      Exit;
    end;
  end;

  edtDateTo.Text := PBDatestr(NewDate);
  FixQuery(false);
end;

procedure TPBLUSalesInvoiceDDFrm.chkbxShowExportedClick(Sender: TObject);
begin
    FixQuery(false);
end;

procedure TPBLUSalesInvoiceDDFrm.EnableExport(Sender: TObject);
begin
  btnExport.enabled :=  (edtDateFrom.Text <> '') and
                        (edtDateTo.text <> '') and
                        (edtExpFile.text <> '');
end;


end.
