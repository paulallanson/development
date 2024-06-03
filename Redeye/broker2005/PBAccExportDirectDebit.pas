unit PBAccExportDirectDebit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, FileCtrl, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAccExportDirectDebitFrm = class(TForm)
    pnlButtons: TPanel;
    pnlRight: TPanel;
    pnlNumberRange: TPanel;
    pnlDateRange: TPanel;
    pnlExpFile: TPanel;
    edtExpFile: TEdit;
    lblExpTo: TLabel;
    btnBrowse: TButton;
    btnExport: TButton;
    btnCancel: TButton;
    qrySalesInvByDate: TFDQuery;
    qrySalesInvByNumber: TFDQuery;
    qrySalesInvs: TFDQuery;
    OpenDialog1: TOpenDialog;
    edtInvNo: TEdit;
    lblInvNumber: TLabel;
    pnleft: TPanel;
    rdgrpExportBy: TRadioGroup;
    SelectionMemo: TMemo;
    Label1: TLabel;
    SelectLst: TListBox;
    GetInvRngSQL: TFDQuery;
    DelWorkSQL: TFDQuery;
    AddIntSelQuery: TFDQuery;
    AddWorkSQL: TFDQuery;
    GetLastIntSelSQL: TFDQuery;
    qryUpdInvs: TFDQuery;
    GroupBox2: TGroupBox;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDateFrom: TSpeedButton;
    btnDateTo: TSpeedButton;
    pnlBody: TPanel;
    procedure btnDateFromClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure rdgrpExportByClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    intSel: integer;
    procedure ExportInvs;
    procedure UpdateInvs;
    procedure BuildSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure GetSelection;
    Function GetNextIntSelCode(Sender: TObject): Integer;
    function ParseFileName(path: string): string;
    function ParsePathName(path: string): string;
    procedure SavePath;
    function GetPath: string;
  public
    { Public declarations }
  end;

var
  PBAccExportDirectDebitFrm: TPBAccExportDirectDebitFrm;

implementation

uses
  System.UITypes,
  DateSelV5, CCSCommon, pbMainMenu, pbDatabase;

{$R *.DFM}

procedure TPBAccExportDirectDebitFrm.btnDateFromClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Top := self.top + 20 + self.btnDateFrom.Top;
      DateSelV5Form.Left := self.Left + self.btnDateFrom.Left - DateSelV5Form.Width
                          + self.pnleft.width;
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
  end;
end;

procedure TPBAccExportDirectDebitFrm.btnDateToClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Top := self.top + 20 + self.btnDateTo.Top;
      DateSelV5Form.Left := self.Left + self.btnDateTo.Left - DateSelV5Form.Width
                         + self.pnleft.width;
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
  end;
end;

procedure TPBAccExportDirectDebitFrm.edtDateFromExit(Sender: TObject);
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
end;

procedure TPBAccExportDirectDebitFrm.edtDateToExit(Sender: TObject);
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
end;

procedure TPBAccExportDirectDebitFrm.btnExportClick(Sender: TObject);
var
  tempStr: string;
  exportOK: boolean;
begin
  exportOK := false;
  if self.edtExpFile.Text = '' then
  begin
    messageDlg('You must enter a path to export the data to.', mtInformation, [mbOK], 0);
    exit;
  end;

  self.SavePath;

  self.qrySalesInvs.Close;
  case self.rdgrpExportBy.ItemIndex of
    0:begin
        self.qrySalesInvs.SQL.Text := self.qrySalesInvByDate.SQL.Text;
        self.qrySalesInvs.ParamByName('DateFrom').asDate := StrToDate(self.edtDateFrom.Text);
        self.qrySalesInvs.ParamByName('DateTo').asDate := StrToDate(self.edtDateTo.Text);
      end;
    1:begin
        self.intSel := GetNextIntSelCode(Self);
        getselection;
        self.qrySalesInvs.SQL.Text := self.qrySalesInvByNumber.SQL.Text;
        self.qrySalesInvs.ParamByName('IntSel').asInteger := self.intSel;
      end;
  end;

  self.qrySalesInvs.Open;

  if self.qrySalesInvs.RecordCount > 0 then
  begin
    if FileExists(edtExpFile.Text) then
    begin
      if messageDlg('File already exists, do you want to overwrite?', mtWarning, [mbYes, mbNO], 0) = mrNo then
      begin
        if self.rdgrpExportBy.ItemIndex = 1 then
          self.DelIntSelCode(self.intSel, true);
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
          if self.rdgrpExportBy.ItemIndex = 1 then
            self.DelIntSelCode(self.intSel, true);
          raise Exception.Create('Cannot create ' + tempStr);
        end;
      end
      else
      begin
        if self.rdgrpExportBy.ItemIndex = 1 then
          self.DelIntSelCode(self.intSel, true);
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

  if self.rdgrpExportBy.ItemIndex = 1 then
    self.DelIntSelCode(self.intSel, true);

  if exportOK then
    self.Close;
end;

procedure TPBAccExportDirectDebitFrm.ExportInvs;
var
  factorFile: TextFile;
  tempStr: string;
  rTotal: real;
begin
  try
    deleteFile(edtExpFile.Text)
  except

  end;

  assignFile(factorFile, edtExpFile.Text);
  rewrite(factorFile);

  tempstr := '';

  {write away the file header}
  tempstr     := '"Input"';
  WriteLn(factorFile, tempStr);

  {write away the Company Name}
  tempstr     := ',""' + ',""' + ',""' + ',""' + ',""' + ',""' + ',""' + dmBroker.GetCompanyName;
  WriteLn(factorFile, tempStr);

  {write away blank line}
  tempstr     := '""';
  WriteLn(factorFile, tempStr);

  {write away the column headings}
  tempstr     := '"Payer Reference"'
              + ',"Amount"'
              + ',"Due Date"'
              + ',"Invoice Number"';

  WriteLn(factorFile, tempStr);
  rTotal := 0;
  while not self.qrySalesInvs.eof do
  begin
    tempStr := qrySalesInvs.fieldByName('Direct_Debit_Code').asString;
    tempStr := tempStr + ',' + self.qrySalesInvs.fieldByName('Total_Value').asString;
    tempStr := tempStr + ',' + formatdatetime('yyyymmdd',self.qrySalesInvs.fieldByName('Invoice_Date').asdatetime + self.qrySalesInvs.fieldByName('Number_Of_Days').asinteger);
    tempStr := tempStr + ',' + self.qrySalesInvs.fieldByName('Sales_Invoice_no').asstring;

    WriteLn(factorFile, tempStr);

    rTotal := rTotal +  self.qrySalesInvs.fieldByName('Total_Value').asfloat;

    self.qrySalesInvs.next;
  end;

  {write away blank line}
  tempstr     := '""';
  WriteLn(factorFile, tempStr);

  {write away the Amount Total}
  tempstr     := '"' + '","' + formatfloat('0.00',rTotal) + '"';
  WriteLn(factorFile, tempStr);

  CloseFile(factorFile);

  messageDlg('Direct Debit File created containing ' + IntToStr(self.qrySalesInvs.recordCount) + ' invoice(s).', mtInformation, [mbOK], 0);
end;

procedure TPBAccExportDirectDebitFrm.btnBrowseClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  OpenDialog1.filename := self.edtExpFile.Text;
  if self.OpenDialog1.Execute then
    self.edtExpFile.Text := self.OpenDialog1.Files[0];
end;

procedure TPBAccExportDirectDebitFrm.btnCancelClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TPBAccExportDirectDebitFrm.rdgrpExportByClick(Sender: TObject);
begin
  if self.rdgrpExportBy.ItemIndex = 0 then
  begin
    self.pnlDateRange.BringToFront;
  end
  else
  begin
    self.pnlNumberRange.BringToFront;
  end;
end;

procedure TPBAccExportDirectDebitFrm.FormShow(Sender: TObject);
begin
  self.edtDateFrom.Text := DateToStr(date() - 30);
  self.edtDateTo.Text := DateToStr(date());
  self.edtExpFile.Text := self.GetPath + 'DirectDebit' + inttostr(dmBroker.GetNextDirectDebitFileNo) + '.csv'
end;

procedure TPBAccExportDirectDebitFrm.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	 selectLst.Clear;

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
end;

procedure TPBAccExportDirectDebitFrm.BuildRange(sFirst, sLast: string);
begin
 	With GetInvRngSQL do
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
end;

procedure TPBAccExportDirectDebitFrm.DelIntSelCode(iTempIntSelCode: Integer;
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

procedure TPBAccExportDirectDebitFrm.GetSelection;
var
	icount: integer;
begin
	 {When the constructing of the list is complete, write to the Report Selection file}
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
end;

function TPBAccExportDirectDebitFrm.GetNextIntSelCode(
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

procedure TPBAccExportDirectDebitFrm.UpdateInvs;
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

function TPBAccExportDirectDebitFrm.ParseFileName(path: string): string;
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

function TPBAccExportDirectDebitFrm.ParsePathName(path: string): string;
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

procedure TPBAccExportDirectDebitFrm.SavePath;
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

function TPBAccExportDirectDebitFrm.GetPath: string;
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

end.
