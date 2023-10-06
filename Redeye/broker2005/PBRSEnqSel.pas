(*******************************************************************************

Copyright (c) Centrereed Ltd 2003

Comments
--------
  Enquiry Print Selection form.

VSS Info:
$Header: /PBL D5/PBRSEnqSel.pas 1    janine $
$History: PBRSEnqSel.pas $
*******************************************************************************)
unit PBRSEnqSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, CCSCommon, OleCtnrs, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSEnqSelFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    rgRep: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    ChkBxInactive: TCheckBox;
    qryRep: TFDQuery;
    rgOperator: TRadioGroup;
    pnlOperator: TPanel;
    Label3: TLabel;
    edtOperator: TEdit;
    btnOperator: TButton;
    rdgrpSortBy: TRadioGroup;
    ExcelBitBtn: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure CanPrint(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgRepClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure FormCreate(Sender: TObject);
    procedure btnOperatorClick(Sender: TObject);
    procedure rgOperatorClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
  private
    bPreview: ByteBool;
    SelRepCode, SelopCode: integer;
    SelRepText, SelOpText : string;
    DateFrom, DateTo: TDateTime;
    procedure SetRepOnly;
  end;

var
  PBRSEnqSelFrm: TPBRSEnqSelFrm;

implementation

uses UITypes, PBLURep, pbDatabase, CCSPrint, PBRPEnqLst, pbMainMenu, DateSelV5, PBLUOps;

{$R *.DFM}

procedure TPBRSEnqSelFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (RGRep.ItemIndex = 0) or
    ((EdtRep.Text <> '') and (RGRep.ItemIndex = 1)) and
    (rgOperator.ItemIndex = 0) or
    ((edtOperator.Text <> '') and (rgOperator.ItemIndex = 1)) ;
  PreviewBitBtn.Enabled := PrintBitBtn.enabled;
  ExcelBitBtn.Enabled := PrintBitBtn.enabled;
end;

procedure TPBRSEnqSelFrm.PreviewBitBtnClick(Sender: TObject);
begin
  bPreview := True;
  PrintReport(Self);
end;

procedure TPBRSEnqSelFrm.PrintBitBtnClick(Sender: TObject);
begin
  bPreview := False;
  PrintReport(Self);
end;

procedure TPBRSEnqSelFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  PBRPEnqLstFrm := TPBRPEnqLstFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try

      PBRPEnqLstFrm.PrinterSettings := PrinterSettings;
      PBRPEnqLstFrm.Preview := bPreview;
      PBRPEnqLstFrm.Inactive := chkBxInactive.checked;
      PBRPEnqLstFrm.DateFrom := DateFromEdit.Text;
      PBRPEnqLstFrm.DateTo := DateToEdit.Text;

      case rdgrpSortBy.ItemIndex of
        0: PBRPEnqLstFrm.SortbyRep := true;
        1: PBRPEnqLstFrm.SortbyOffice := true;
      end;

      PBRPEnqLstFrm.QRlblDtRng.caption := PBRPEnqLstFrm.qrlblDtRng.Caption + DateFromEdit.Text +
      ' To '+DateToEdit.Text;

      if chkBxInactive.checked then
        PBRPEnqLstFrm.QRlblDtRng.caption := PBRPEnqLstFrm.qrlblDtRng.Caption+ ' Including Inactive Eqnuiries';

      if RgRep.ItemIndex = 0 then
        PBRPEnqLstFrm.RepNo := 0
      else
        begin
          PBRPEnqLstFrm.RepNo := SelRepCode;
          PBRPEnqLstFrm.Repname := edtRep.Text;
        end;

      if rgOperator.ItemIndex = 0 then
        PBRPEnqLstFrm.OpNo := 0
      else
        begin
          PBRPEnqLstFrm.OpNo := SelOpCode;
          PBRPEnqLstFrm.OpName := edtOperator.Text;
        end;

      if PBRPEnqLstFrm.GetDetails(Self) = 0 then
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
      else
      begin
        {Actually print or preview the report}
        if (not bPreview) then
        begin
              if SetUpPrinter(PrinterSettings) then
                PBRPEnqLstFrm.qrpdetails.Print
        end
        else
          PBRPEnqLstFrm.qrpdetails.Preview;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPEnqLstFrm.Free;
  end;
end;

procedure TPBRSEnqSelFrm.FormShow(Sender: TObject);
begin
  if pos('Rep only',PBRSEnqSelFrm.caption) > 0 then
    SetrepOnly;
  CanPrint(Self);
end;

procedure TPBRSEnqSelFrm.rgRepClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgRep.ItemIndex = 0) then
  begin
    pnlRepSearch.Visible := False;
    EdtRep.Text := '';
  end
  else
  begin
    pnlRepSearch.Visible := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSEnqSelFrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
  finally
    PBLURepFrm.Free;
  end;
  canprint(Self);
end;

procedure TPBRSEnqSelFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSEnqSelFrm.DateToButtonClick(Sender: TObject);
begin
 {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSEnqSelFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DatefromEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
end;

procedure TPBRSEnqSelFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
end;
procedure TPBRSEnqSelFrm.FormActivate(Sender: TObject);
begin
  if DateFromEdit.Text = '' then
  begin
    DateFrom := Date;
    DateFromEdit.Text := PBDatestr(DateFrom);
  end;
  if DateToEdit.Text = '' then
  begin
    DateTo := Date + 30;
    DateToEdit.Text := PBDatestr(DateTo);
  end;

end;

procedure TPBRSEnqSelFrm.SetRepOnly;
begin
  rgRep.enabled := false;
  rgRep.itemindex := 1;
  pnlRepSearch.Visible := true;
  pnlRepSearch.enabled := false;
  SelrepCode := frmPBMainMenu.iRep;
  with qryRep do
    begin
      close;
      parambyname('Rep').asinteger := frmPBMainMenu.iRep;
      open;
      edtRep.text := fieldbyname('Name').asstring;
    end;
end;

function TPBRSEnqSelFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSEnqSelFrm.FormCreate(Sender: TObject);
begin
//  dmBroker.ScreenAccessControl(Self,'EnqReportBitBtn',frmPBMainMenu.iOperator,0,frmPBMainMenu.iRep) ;
end;

procedure TPBRSEnqSelFrm.btnOperatorClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.Create(Self);
  try
    PBLUOpsFrm.bIs_Lookup := True;
    PBLUOpsFrm.bAllow_Upd := False;
    PBLUOpsFrm.SelCode := SelOpCode;
    PBLUOpsFrm.ShowModal;
    if PBLUOpsFrm.Selected then
    begin
      SelOpCode := PBLUOpsFrm.SelCode;
      SelOpText := PBLUOpsFrm.SelName;
    end;
    edtOperator.Text := SelOpText;
  finally
    PBLUOpsFrm.Free;
  end;
  canprint(Self);

end;

procedure TPBRSEnqSelFrm.rgOperatorClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgOperator.ItemIndex = 0) then
  begin
    pnlOperator.Visible := False;
    edtOperator.Text := '';
  end
  else
  begin
    pnlOperator.Visible := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSEnqSelFrm.ExcelBitBtnClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempFilename: string;
begin
  {Setup and print the report}
  PBRPEnqLstFrm := TPBRPEnqLstFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPEnqLstFrm.PrinterSettings := PrinterSettings;
      PBRPEnqLstFrm.Inactive := chkBxInactive.checked;
      PBRPEnqLstFrm.DateFrom := DateFromEdit.Text;
      PBRPEnqLstFrm.DateTo := DateToEdit.Text;

      case rdgrpSortBy.ItemIndex of
      0: PBRPEnqLstFrm.SortbyRep := true;
      1: PBRPEnqLstFrm.SortbyOffice := true;
      end;

      if RgRep.ItemIndex = 0 then
        PBRPEnqLstFrm.RepNo := 0
      else
        begin
          PBRPEnqLstFrm.RepNo := SelRepCode;
          PBRPEnqLstFrm.Repname := edtRep.Text;
        end;

      if rgOperator.ItemIndex = 0 then
        PBRPEnqLstFrm.OpNo := 0
      else
        begin
          PBRPEnqLstFrm.OpNo := SelOpCode;
          PBRPEnqLstFrm.OpName := edtOperator.Text;
        end;

      reccount := PBRPEnqLstFrm.GetDetails(Self);
      if reccount = 0 then
        begin
          MessageDlg('Nothing to export', mtError, [mbOK], 0);
          exit;
        end;

      self.prgbrExport.Max := recCount;
      tempFileName := getWinTempDir + 'Current Enquiry Report ' + formatdatetime('dd mm yy hhmmss',now)+'.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      PBRPEnqLstFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;

      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    finally
      Printersettings.free;
    end;
  finally
    Application.ProcessMessages;
    PBRPEnqLstFrm.Free;
  end;
end;

end.

