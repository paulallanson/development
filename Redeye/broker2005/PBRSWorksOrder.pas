unit PBRSWorksOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, PBJobBagDM, ComCtrls, OleCtrls, SHDocVw, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBRSWorksOrder = class(TForm)
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
    qryGetWorksOrder: TFDQuery;
    chkbxProcessNewPage: TCheckBox;
    lblSchedule: TLabel;
    IdHTTP1: TIdHTTP;
    qryUpWOStatus: TFDQuery;
    imgPlanning: TImage;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormCreate(Sender: TObject);
    procedure imgPlanningDblClick(Sender: TObject);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
  private
    bReadPage: boolean;
    iIntselcode: integer;
    dmJobBagSched: TdmJobBag;
    procedure CreateJobBagTechXMLData;
    procedure RunReport(Preview: boolean);
    procedure FaxReport;
    procedure EmailReport(Preview: boolean);
    procedure ClearFaxArray(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function BuildQueryString: string;
    procedure PostTechXMLtoSchedule(filename: string);
    procedure UpdateWorksStatus;
    { Private declarations }
  public
    WONumber: integer;
    WOStatus: integer;
    JobBagNo: integer;
  end;

var
  frmPBRSWorksOrder: TfrmPBRSWorksOrder;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses PBRPWorksOrder, pbDatabase, PBFaxList, PBSendFax, CCSemailHandler, CCSCommon;

{$R *.dfm}

const
  scheduleStatus = 'Updating Schedule ... ';

  SQLCore =
  'SELECT Company.Default_WI_Email_Name as Name, '+
	'Company.Default_WI_Email_Address as Email, '+
	'''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM Company '+
  'WHERE Company = 1 '+
  'UNION '+
  'SELECT Process_Group_Description as Name, '+
	'Process_Group.Email, '+
	'''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  'Process_Group.CC_Email '+
  'FROM works_order_process, process, process_group '+
  'WHERE Works_order_Process.process = process.process AND '+
  '      Process.process_group = process_Group.process_group '+
  'UNION '+
  'SELECT operator.Name, '+
	'Operator.Email, '+
	'''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM works_order, operator '+
  'WHERE Works_order.office_Contact = operator.operator ';

procedure TfrmPBRSWorksOrder.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TfrmPBRSWorksOrder.RunReport(Preview: boolean);
begin
  frmPBRPWorksOrder := TfrmPBRPWorksOrder.create(self);
  try
    frmPBRPWorksOrder.WorksOrder := StrToFloatDef(memSelection.text, 0, FormatSettings);
    frmPBRPWorksOrder.ForceNewPage := chkbxProcessNewPage.checked;

    if (frmPBRPWorksOrder.GetDetails = 0) then
      MessageDlg('There are no works instructions to print', mtError, [mbAbort], 0)
    else
      begin
        if not Preview then
          begin
            frmPBRPWorksOrder.bPreview := false;
            frmPBRPWorksOrder.qrpDetails.PrinterSetup;
            if frmPBRPWorksOrder.qrpDetails.tag = 0 then
              frmPBRPWorksOrder.qrpDetails.Print;
          end
        else
          begin
            frmPBRPWorksOrder.bPreview := true;
            frmPBRPWorksOrder.qrpDetails.Preview;
          end;
      end;
  finally
    frmPBRPWorksOrder.free;
  end;
end;

procedure TfrmPBRSWorksOrder.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  frmPBRPWorksOrder := TfrmPBRPWorksOrder.create(self);
  try
    frmPBRPWorksOrder.WorksOrder := StrToFloatDef(memSelection.text, 0, FormatSettings);
    frmPBRPWorksOrder.ForceNewPage := chkbxProcessNewPage.checked;

    if (frmPBRPWorksOrder.GetDetails = 0) then
      MessageDlg('There are no works instructions to print', mtError, [mbAbort], 0)
    else
      begin
        frmPBRPWorksOrder.bPreview := false;
        sTemp := BuildQueryString;
//        sSubject := 'Works Instruction: ' + memSelection.text;
        sSubject := inttostr(round(StrToFloatDef(memSelection.text, 0, FormatSettings))) + ' ' + edtCustomer.Text + ' ' + memDescription.text + ' - New Job';
        emailHandler.Body := 'Please find attached, Works Instruction: ' + memSelection.text + '.'#13#10#13#10;
        emailHandler.ccEmail := '';
//        emailHandler.CreateEmail(frmPBRPWorksOrder.qrpDetails, sTemp, 'WIN'+memSelection.text, sSubject);
        emailHandler.CreateOneEmail(frmPBRPWorksOrder.qrpDetails, sTemp, 'WIN'+memSelection.text, sSubject);
      end;
  finally
    frmPBRPWorksOrder.free;
    emailHandler.Free;
  end;
end;

function TfrmPBRSWorksOrder.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Works_Order.Works_Order_Number = ' + memSelection.text;
  Result := sTemp
end;

procedure TfrmPBRSWorksOrder.FaxReport;
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
    PBFaxListFrm.Caption := 'Quote Print - Fax List';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer';
    PBFaxListFrm.ShowModal;

    {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
      begin
        for irow := 1 to PBFaxListFrm.FaxlistGrid.Rowcount -1 do
          begin
            if Trim(PBFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;

            frmPBRPWorksOrder := TfrmPBRPWorksOrder.Create(Self);
            try
              frmPBRPWorksOrder.bPreview := true;

              frmPBRPWorksOrder.WorksOrder := strtoint(memSelection.text);

              if (frmPBRPWorksOrder.GetDetails = 0) then
                begin
                  MessageDlg('There are no works orders to fax', mtError, [mbAbort], 0);
                  exit;
                end;

              FaxFound := PBSendFaxFrm.OutToFax(PBFaxListFrm.FaxListGrid.cells[2,irow],
                    'Q'+ FaxArray[irow,1] + ' to '+ FaxArray[irow,4], '');
              if (not FaxFound) then
                MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
              else
                begin
                  frmPBRPWorksOrder.qrpDetails.ShowProgress := false;
//                  frmPBRPWorksOrder.qrpDetails.PrinterSettings.PrinterIndex := FaxFound;
                  frmPBRPWorksOrder.qrpDetails.Print;
                  PBSendFaxFrm.WaitForFaxFinish(Self) ;
                end;
            finally
              frmPBRPWorksOrder.free;
            end;
          end;
      end;
  finally
    PBFaxListFrm.free;
  end;
end;

procedure TfrmPBRSWorksOrder.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmPBRSWorksOrder.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
//  if (dmBroker.GetSchedulePackage = 'TECHNIQUE') and (self.WOStatus < 30) then
//    CreateJobBagTechXMLData;
  close;
end;

procedure TfrmPBRSWorksOrder.GetSelection;
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

procedure TfrmPBRSWorksOrder.BuildSelection;
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

procedure TfrmPBRSWorksOrder.BuildRange(sFirst, sLast: string);
begin
 	with qryGetRange do
    begin
      Close;
      ParamByName('From_Works_Order').AsFloat := StrToFloatDef(sFirst, 0, FormatSettings);
      ParamByName('To_Works_Order').AsFloat := StrToFloatDef(sLast, 0, FormatSettings);
      Open;
      First;
      While Not EOF do
        begin
          SelectLst.Items.Add(FloatToStr(FieldByName('Works_Order_Number').AsFloat));
          Next;
        end;
    end;
end;

procedure TfrmPBRSWorksOrder.BuildFaxDetails;
var
  irow: Integer;
begin
  with qryGetWorksOrder do
  begin
    Close;
    parambyname('Int_Sel_Code').asinteger := iIntselcode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Quote').AsString;
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

procedure TfrmPBRSWorksOrder.FormActivate(Sender: TObject);
begin
  iIntselcode := dmBroker.GetNextIntSelCode(Self);
end;

procedure TfrmPBRSWorksOrder.EmailBitBtnClick(Sender: TObject);
begin
  if (dmBroker.GetSchedulePackage = 'TECHNIQUE') and (self.WOStatus < 30) then
    CreateJobBagTechXMLData;
  try
    EmailReport(false);
  finally
    close;
  end;
end;

procedure TfrmPBRSWorksOrder.CreateJobBagTechXMLData;
var
  i: integer;
  sField, sData: string;
  aJobBag: TJobBag;
  tmpDir, filename: string;
begin
  if JobBagNo = 0 then
    exit;

  tmpDir := getWinTempDir;
  filename := tmpDir+inttostr(JobBagNo)+'.xml';

  dmJobBagSched := TdmJobBag.Create(Self);
  try
    aJobBag := TJobBag.Create(dmJobBagSched);
    try
      aJobBag.DbKey := JobBagNo;
      aJobBag.LoadFromDB;

      with aJobBag.DataModule.qryJBHeadTechXML do
        begin
          close;
          parambyname('Job_Bag').asinteger := aJobBag.dbKey;
          open;

          if recordcount > 0 then
            CreateTechXMLFile(filename)
          else
            exit;

          // write away all the job bag header details
          for i := 0 to pred(Fieldcount) do
            begin
              WriteTechXMLHead(filename, Fields[i]);
            end;

          with aJobBag.DataModule.qryJBMasterTechXML do
            begin
              close;
              parambyname('Job_bag').asinteger := aJobBag.dbkey;
              open;

              while eof <> true do
              begin
                WriteTechXMLMasterHead(filename);
                for i := 0 to pred(FieldCount) do
                  begin
                    WriteTechXMLMasterLine(filename, Fields[i]);
                  end;
                WriteTechXMLMasterFoot(filename);
                next;
              end;
            end;
        end;

      with aJobBag.DataModule.qryJBProcessTechXML do
        begin
          close;
          parambyname('Job_bag').asinteger := aJobBag.dbkey;
          parambyname('Works_Order').asinteger := WONumber;
          open;

          if recordcount = 0 then
            exit;
          while eof <> true do
            begin
              WriteTechXMLPostPressHead(filename);
              for i := 0 to pred(FieldCount) do
                begin
                  WriteTechXMLPostPressLine(filename, Fields[i]);
                end;
              WriteTechXMLPostPressFoot(filename);
              next;
            end;
        end;
      CloseTechXMLFile(filename);
    finally
      aJobBag.Free;
    end;
  finally
    dmJobBagSched.Free;
  end;

//Now post the XML file to the Technique Scheduling system
  PostTechXMLtoSchedule(filename);
  DeleteFile(filename);
end;

procedure TfrmPBRSWorksOrder.PostTechXMLtoSchedule(filename: string);
 var fileSource, Source: TMemoryStream;
     ts, Response: TStringStream;
     s, strJDFURL : string;
begin
  IdHTTP1.Request.ContentType := 'application/vnd.cip4-jmf+xml';    // important!
//  IdHTTP1.Intercept := SSL;             // port 443 is automatically used
//  IdHTTP1.InterceptEnabled := true;

  // prepare post
  Response := TStringStream.Create('');
  Source := TMemoryStream.Create();
  fileSource := TMemoryStream.Create();

  strJDFURL := 'http://FPSERVER1/jdfconsumer/jmflistener.aspx';
  try
    // concatenate string 's' and stream 'fileSource' to create data to be posted
    s := '';
    Source.Write(s[1], Length(s));

    fileSource.LoadFromFile(filename);
    Source.Copyfrom(fileSource, fileSource.Size);

    // show posted data in the memo
    ts := TStringStream.Create('');
    Source.Position := 0;
    ts.CopyFrom(Source, Source.Size);
    ts.Free;
    // post data
    IdHTTP1.Post(strJDFURL, Source, Response);
  finally
    fileSource.Free;
    Source.Free;
  end;
  Response.Free;
end;

procedure TfrmPBRSWorksOrder.IdHTTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  lblSchedule.visible := true;
end;

procedure TfrmPBRSWorksOrder.IdHTTP1WorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  if idHttp1.ResponseCode = 200 then
    begin
      lblSchedule.caption := 'Update Successfull!!!';
      UpdateWorksStatus;
    end;

end;

procedure TfrmPBRSWorksOrder.UpdateWorksStatus;
begin
  if WOStatus > 30 then exit;
  with qryUpWOStatus do
    begin
      close;
      parambyname('Works_Order').asinteger := self.WONumber;
      execsql;
    end;
  WOStatus := 30;
end;

procedure TfrmPBRSWorksOrder.FormCreate(Sender: TObject);
begin
  imgPlanning.Visible := (dmBroker.GetSchedulePackage <> '');
end;

procedure TfrmPBRSWorksOrder.imgPlanningDblClick(Sender: TObject);
begin
  if messagedlg('Do you want to send this job to the Planning board?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CreateJobBagTechXMLData;

end;

end.
