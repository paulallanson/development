unit PBRSNonConform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBRSNonConform = class(TForm)
    pnlButtons: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    EstNumLabel: TLabel;
    memSelection: TMemo;
    Label1: TLabel;
    edtCustomer: TMemo;
    Label2: TLabel;
    memDescription: TMemo;
    SelectLst: TListBox;
    qryGetRange: TFDQuery;
    qryGetNCA: TFDQuery;
    lblJobBag: TLabel;
    memJobBag: TMemo;
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure rdgReportTypeClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
  private
    iIntselcode: integer;
    FJobBagType: boolean;
    procedure RunReport(Preview: boolean);
    procedure FaxReport;
    procedure EmailReport(Preview: boolean);
    procedure ClearFaxArray(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function BuildQueryString: string;
    procedure SetJobBagType(const Value: boolean);
    { Private declarations }
  public
    bProspect: boolean;
    property JobBagType: boolean read FJobBagType write SetJobBagType;
  end;

var
  frmPBRSNonConform: TfrmPBRSNonConform;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses pbDatabase, PBFaxList, PBSendFax, CCSemailHandler, PBRPNonConform;

{$R *.dfm}

const
  SQLCoreAM =
    'SELECT Job_bag_non_conform.job_bag_non_conform, '+
	  ' operator.name, '+
	  ' operator.email, '+
	  ' ''Adobe Acrobat Document (*.pdf)'' as Export_Filter_Desc, '+
	  ' ''PDF'' as ExportFilter, '+
	  ' '' '' as CC_EMail '+
    'FROM job_bag_non_conform, Job_Bag, operator '+
    'WHERE job_bag_non_conform.Job_Bag = Job_Bag.Job_Bag and '+
    ' Job_Bag.Office_Contact = Operator.operator ';

  SQLCorePOAM =
    'SELECT Job_bag_non_conform.job_bag_non_conform, '+
	  ' operator.name, '+
	  ' operator.email, '+
	  ' ''Adobe Acrobat Document (*.pdf)'' as Export_Filter_Desc, '+
	  ' ''PDF'' as ExportFilter, '+
	  ' '' '' as CC_EMail '+
    'FROM job_bag_non_conform, Purchase_Order, operator '+
    'WHERE job_bag_non_conform.Purchase_Order = Purchase_Order.Purchase_Order and '+
    ' Purchase_Order.Office_Contact = Operator.operator ';

  SQLCore =
    ' UNION '+
    'SELECT Job_bag_non_conform.job_bag_non_conform, '+
	  '   operator.name, '+
	  '   operator.email, '+
	  '   ''Adobe Acrobat Document (*.pdf)'' as Export_Filter_Desc,  '+
	  '   ''PDF'' as ExportFilter,  '+
	  '   '' '' as CC_EMail  '+
    'FROM non_conform_operator, operator, job_bag_non_conform '+
    'WHERE non_conform_operator.operator = operator.operator ';

procedure TfrmPBRSNonConform.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TfrmPBRSNonConform.RunReport(Preview: boolean);
begin
  frmPBRPNonConform := TfrmPBRPNonConform.create(self);
  try
    frmPBRPNonConform.Key := strtoint(memSelection.text);

    if (frmPBRPNonConform.GetDetails = 0) then
      MessageDlg('There are no non conformance advice notes to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        if not Preview then
          begin
            frmPBRPNonConform.bPreview := false;
            frmPBRPNonConform.qrpDetails.PrinterSetup;
            if frmPBRPNonConform.qrpDetails.tag = 0 then
              frmPBRPNonConform.qrpDetails.Print;
          end
        else
          begin
            frmPBRPNonConform.bPreview := true;
            frmPBRPNonConform.qrpDetails.Preview;
          end;
      end;
  finally
    frmPBRPNonConform.free;
  end;
end;

procedure TfrmPBRSNonConform.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  frmPBRPNonConform := TfrmPBRPNonConform.create(self);
  try
    frmPBRPNonConform.key := strtoint(memSelection.text);

    if (frmPBRPNonConform.GetDetails = 0) then
      MessageDlg('There are no Non Conformance Advice notes to print', mtError, [mbAbort], 0)
    else
      begin
        frmPBRPNonConform.bPreview := false;
        sTemp := BuildQueryString;
        sSubject := 'Non Conformance Advice: ' + memSelection.text;
        emailHandler.Body := 'Please find attached, ' + sSubject + '.'#13#10#13#10;
//        emailHandler.CreateEmail(frmPBRPNonConform.qrpDetails, sTemp, 'NCA'+memSelection.text, sSubject);
        emailHandler.CreateOneEmail(frmPBRPNonConform.qrpDetails, sTemp, 'NCA'+memSelection.text, sSubject);
      end;
  finally
    frmPBRPNonConform.free;
    emailHandler.Free;
  end;
end;

function TfrmPBRSNonConform.BuildQueryString: string;
var
  sTemp: string;
begin
  if JobBagType then
    sTemp := SQLCoreAM
  else
    sTemp := SQLCorePOAM;

  sTemp := sTemp + 'AND Job_Bag_Non_Conform.Job_Bag_Non_Conform = ' + memSelection.text;

  sTemp := sTemp + SQLCore;

  sTemp := sTemp + 'AND Job_Bag_Non_Conform.Job_Bag_Non_Conform = ' + memSelection.text;
  Result := sTemp
end;

procedure TfrmPBRSNonConform.FaxReport;
var
  faxfound: boolean;
  icount, irow: integer;
begin
  ClearFaxArray(Self);

  dmBroker.DelIntSelCode(iIntSelCode, True);
  GetSelection;

  BuildFaxDetails;

  PBFaxListFrm := TPBFaxListFrm.Create(Self);
  try
    for icount := 1 to 100 do
      begin
        if FaxArray[icount, 1] = '' then Break;
        PBFaxListFrm.FaxListGrid.ColWidths[0] := 0;
        PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
        PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
      end;

    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'NCA Print - Fax List';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer';
    PBFaxListFrm.ShowModal;

    {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
      begin
        for irow := 1 to PBFaxListFrm.FaxlistGrid.Rowcount -1 do
          begin
            if Trim(PBFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;

            frmPBRPNonConform := TfrmPBRPNonConform.Create(Self);
            try
              frmPBRPNonConform.bPreview := true;

              frmPBRPNonConform.key := strtoint(memSelection.text);

              if (frmPBRPNonConform.GetDetails = 0) then
                begin
                  MessageDlg('There are no Non Conformance advice notes to fax', mtError, [mbAbort], 0);
                  exit;
                end;

              FaxFound := PBSendFaxFrm.OutToFax(PBFaxListFrm.FaxListGrid.cells[2,irow],
                    'Q'+ FaxArray[irow,1] + ' to '+ FaxArray[irow,4], '');
              if (not FaxFound) then
                MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
              else
                begin
                  frmPBRPNonConform.qrpDetails.ShowProgress := false;
//                  frmPBRPNonConform.qrpDetails.PrinterSettings.PrinterIndex := FaxFound;
                  frmPBRPNonConform.qrpDetails.Print;
                  PBSendFaxFrm.WaitForFaxFinish(Self) ;
                end;
            finally
              frmPBRPNonConform.free;
            end;
          end;
      end;
  finally
    PBFaxListFrm.free;
  end;
end;

procedure TfrmPBRSNonConform.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
  close;
end;

procedure TfrmPBRSNonConform.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dmBroker.DelIntSelCode(iIntSelCode, True);
  BuildSelection;
  if SelectLst.Items.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
      memSelection.Clear;
      memSelection.SetFocus;
    end;
   for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant quote number}
        if SelectLst.Items[icount] = '' then continue;

       	with dmBroker.AddIntSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := StrToFloatDef(SelectLst.Items[icount], 0, FormatSettings);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmPBRSNonConform.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

	ilength := length(memSelection.text);

 	stext := memSelection.text;
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

procedure TfrmPBRSNonConform.BuildRange(sFirst, sLast: string);
begin
 	with qryGetRange do
    begin
      Close;
      ParamByName('From_NCA').AsFloat := StrToFloatDef(sFirst, 0, FormatSettings);
      ParamByName('To_NCA').AsFloat := StrToFloatDef(sLast, 0, FormatSettings);
      Open;
      First;
      While Not EOF do
        begin
          SelectLst.Items.Add(FloatToStr(FieldByName('Job_Bag_Non_Conform').Asinteger));
          Next;
        end;
    end;
end;

procedure TfrmPBRSNonConform.BuildFaxDetails;
var
  irow: Integer;
begin
  with qryGetNCA do
  begin
    Close;
    parambyname('Int_Sel_Code').asinteger := iIntselcode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Job_Bag_Non_Conform').AsString;
      FaxArray[irow, 2] := FieldByName('Customer').AsString;
      FaxArray[irow, 3] := FieldByName('Contact_Name').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Customer_Name').AsString);
      if FieldByName('Is_Retail_Customer').AsString = 'Y' then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Customer_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TfrmPBRSNonConform.FormActivate(Sender: TObject);
begin
  iIntselcode := dmBroker.GetNextIntSelCode(Self);
end;

procedure TfrmPBRSNonConform.EmailBitBtnClick(Sender: TObject);
begin
  EmailReport(false);
  close;
end;

procedure TfrmPBRSNonConform.rdgReportTypeClick(Sender: TObject);
begin
  emailbitbtn.Enabled := ((Sender as TRadioGroup).itemindex = 1);
end;

procedure TfrmPBRSNonConform.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmPBRSNonConform.SetJobBagType(const Value: boolean);
begin
  FJobBagType := Value;
  if FJobBagType then
    lblJobBag.caption := 'Job Bag'
  else
    lblJobBag.caption := 'Purchase Order';
end;

end.
