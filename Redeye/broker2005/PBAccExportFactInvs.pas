unit PBAccExportFactInvs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, FileCtrl, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAccExportFactInvsFrm = class(TForm)
    pnlButtons: TPanel;
    pnlRight: TPanel;
    pnlNumberRange: TPanel;
    pnlDateRange: TPanel;
    btnDateFrom: TSpeedButton;
    btnDateTo: TSpeedButton;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
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
    pnlInvOrCred: TPanel;
    rdgrpInvOrCred: TRadioGroup;
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
    procedure btnDateFromClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure rdgrpExportByClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgrpInvOrCredClick(Sender: TObject);
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
  PBAccExportFactInvsFrm: TPBAccExportFactInvsFrm;

implementation

uses
  System.UITypes,
  DateSelV5, CCSCommon, pbMainMenu;

{$R *.DFM}

procedure TPBAccExportFactInvsFrm.btnDateFromClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Top := self.top + 20 + self.btnDateFrom.Top;
      DateSelV5Form.Left := self.Left + self.btnDateFrom.Left - DateSelV5Form.Width
                         + self.pnlInvOrCred.width + self.pnleft.width;
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

procedure TPBAccExportFactInvsFrm.btnDateToClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Top := self.top + 20 + self.btnDateTo.Top;
      DateSelV5Form.Left := self.Left + self.btnDateTo.Left - DateSelV5Form.Width
                         + self.pnlInvOrCred.width + self.pnleft.width;
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

procedure TPBAccExportFactInvsFrm.edtDateFromExit(Sender: TObject);
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

procedure TPBAccExportFactInvsFrm.edtDateToExit(Sender: TObject);
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

procedure TPBAccExportFactInvsFrm.btnExportClick(Sender: TObject);
var
  tempStr: string;
  exportOK: boolean;
begin
  exportOK := false;
  if self.edtExpFile.Text = '' then
  begin
    messageDlg('You must enter a filename to export the data to.', mtInformation, [mbOK], 0);
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

  case self.rdgrpInvOrCred.ItemIndex of
    0: self.qrySalesInvs.ParamByName('InvOrCred').asString := 'I';
    1: self.qrySalesInvs.ParamByName('InvOrCred').asString := 'C';
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
    exportOK := true;
  end
  else
  begin
    messageDlg('There are no un-factored invoices in the given selection.', mtInformation, [mbOK], 0);
  end;

  if self.rdgrpExportBy.ItemIndex = 1 then
    self.DelIntSelCode(self.intSel, true);

  if exportOK then
    self.Close;
end;

procedure TPBAccExportFactInvsFrm.ExportInvs;
var
  factorFile: TextFile;
  tempStr: string;
begin
  try
    deleteFile(edtExpFile.Text)
  except

  end;

  assignFile(factorFile, edtExpFile.Text);
  rewrite(factorFile);

  while not self.qrySalesInvs.eof do
  begin
    tempStr := self.qrySalesInvs.fieldByName('Sales_Invoice_No').asString;
    tempStr := tempStr + ',' +self.qrySalesInvs.fieldByName('Invoice_Date').asString;
    tempStr := tempStr + ',' +self.qrySalesInvs.fieldByName('Customer_Name').asString;
    tempStr := tempStr + ',' +self.qrySalesInvs.fieldByName('Goods_Value').asString;
    tempStr := tempStr + ',' +self.qrySalesInvs.fieldByName('Vat_Value').asString;
    tempStr := tempStr + ',' +self.qrySalesInvs.fieldByName('Total_Value').asString;

    WriteLn(factorFile, tempStr);

    self.qrySalesInvs.next;
  end;
  CloseFile(factorFile);

  messageDlg('Factor File created containing ' + IntToStr(self.qrySalesInvs.recordCount) + ' invoice(s).', mtInformation, [mbOK], 0);
end;

procedure TPBAccExportFactInvsFrm.btnBrowseClick(Sender: TObject);
begin
  if self.OpenDialog1.Execute then
    self.edtExpFile.Text := self.OpenDialog1.Files[0];

end;

procedure TPBAccExportFactInvsFrm.btnCancelClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TPBAccExportFactInvsFrm.rdgrpExportByClick(Sender: TObject);
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

procedure TPBAccExportFactInvsFrm.FormShow(Sender: TObject);
begin
  self.edtDateFrom.Text := DateToStr(date() - 30);
  self.edtDateTo.Text := DateToStr(date());
  self.edtExpFile.Text := self.GetPath;
end;

procedure TPBAccExportFactInvsFrm.rdgrpInvOrCredClick(Sender: TObject);
begin
  if self.rdgrpInvOrCred.ItemIndex = 0 then
  begin
    self.rdgrpExportBy.Items[1] := 'Invoice Number';
    lblInvNumber.caption := 'Invoice Number(s)';
  end
  else
  begin
    self.rdgrpExportBy.Items[1] := 'Credit Number';
    lblInvNumber.caption := 'Credit Number(s)';
  end;
end;

procedure TPBAccExportFactInvsFrm.BuildSelection;
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

procedure TPBAccExportFactInvsFrm.BuildRange(sFirst, sLast: string);
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

procedure TPBAccExportFactInvsFrm.DelIntSelCode(iTempIntSelCode: Integer;
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

procedure TPBAccExportFactInvsFrm.GetSelection;
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

function TPBAccExportFactInvsFrm.GetNextIntSelCode(
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

procedure TPBAccExportFactInvsFrm.UpdateInvs;
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
    self.qryUpdInvs.ParamByName('Factoring_Filename').asString := fileName;
    self.qryUpdInvs.ParamByName('Factoring_date').asDateTime := theTime;

    self.qryUpdInvs.ExecSQL;

    self.qrySalesInvs.next;
  end;
end;

function TPBAccExportFactInvsFrm.ParseFileName(path: string): string;
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

function TPBAccExportFactInvsFrm.ParsePathName(path: string): string;
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

procedure TPBAccExportFactInvsFrm.SavePath;
var
  tempStr: String;
  IniFile : TIniFile;
begin
  tempStr := edtExpFile.text;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    WriteString('Invoice Factoring', 'File Path', tempStr);
  finally
    IniFile.Free;
  end;
end;

function TPBAccExportFactInvsFrm.GetPath: string;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    Result := ReadString('Invoice Factoring', 'File Path', '');
  finally
    IniFile.Free;
  end;
end;

end.
