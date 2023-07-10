unit PBRSJobBag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TfrmPBRSJobBag = class(TForm)
    pnlButtons: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FaxBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    EstNumLabel: TLabel;
    memSelection: TMemo;
    Label1: TLabel;
    edtCustomer: TMemo;
    Label2: TLabel;
    memDescription: TMemo;
    SelectLst: TListBox;
    qryGetRange: TQuery;
    qryGetWorksOrder: TQuery;
    Label3: TLabel;
    memQuantity: TMemo;
    rdgReportType: TRadioGroup;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure rdgReportTypeClick(Sender: TObject);
  private
    iIntselcode: integer;
    procedure RunScheduleReport(Preview: boolean);
    procedure RunReport(Preview: boolean);
    procedure EmailScheduleReport(Preview: boolean);
    procedure EmailReport(Preview: boolean);
    procedure ClearFaxArray(Sender: TObject);
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function BuildQueryString: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBRSJobBag: TfrmPBRSJobBag;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses pbDatabase, PBFaxList, PBSendFax, CCSemailHandler, PBRPJobBag,
  PBRPJobBagSched;

{$R *.dfm}

const
  SQLCore =
  'SELECT Job_Bag.Job_Bag, '+
	'   Customer_Contact.Name,  '+
	'   Customer_Contact.Email,  '+
	'   ExportFilter.Description as Export_Filter_Desc,  '+
	'   Customer_Contact.ExportFilter,  '+
	'   '' '' as CC_EMail  '+
  'FROM ExportFilter RIGHT JOIN ((Customer_Branch  '+
	'   INNER JOIN Job_Bag ON  '+
	'   (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND  '+
	'   (Customer_Branch.Customer = Job_Bag.Customer))  '+
	'   INNER JOIN Customer_Contact ON  '+
	'   (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND  '+
	'   (Customer_Branch.Customer = Customer_Contact.Customer)) ON  '+
	'   ExportFilter.ExportFilter = Customer_Contact.ExportFilter  '+
  'WHERE (Job_Bag.Contact_no = Customer_Contact.contact_no) ';

procedure TfrmPBRSJobBag.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TfrmPBRSJobBag.RunReport(Preview: boolean);
begin
  frmPBRPJobBag := TfrmPBRPJobBag.create(self);
  try
    frmPBRPJobBag.Key := strtofloat(memSelection.text);

    if (frmPBRPJobBag.GetDetails = 0) then
      MessageDlg('There are no job bags to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        if not Preview then
          begin
            frmPBRPJobBag.bPreview := false;
            frmPBRPJobBag.qrpDetails.PrinterSetup;
            if frmPBRPJobBag.qrpDetails.tag = 0 then
              frmPBRPJobBag.qrpDetails.Print;
          end
        else
          begin
            frmPBRPJobBag.bPreview := true;
            frmPBRPJobBag.qrpDetails.Preview;
          end;
      end;
  finally
    frmPBRPJobBag.free;
  end;
end;

procedure TfrmPBRSJobBag.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  frmPBRPJobBag := TfrmPBRPJobBag.create(self);
  try
    frmPBRPJobBag.key := strtofloat(memSelection.text);

    if (frmPBRPJobBag.GetDetails = 0) then
      MessageDlg('There are no job bags to print', mtError, [mbAbort], 0)
    else
      begin
        frmPBRPJobBag.bPreview := false;
        sTemp := BuildQueryString;
        sSubject := 'Job Bag: ' + memSelection.text;
        emailHandler.Body := 'Please find attached, ' + sSubject + '.'#13#10#13#10;
        emailHandler.CreateEmail(frmPBRPJobBag.qrpDetails, sTemp, 'WIN'+memSelection.text, sSubject);
      end;
  finally
    frmPBRPJobBag.free;
    emailHandler.Free;
  end;
end;

procedure TfrmPBRSJobBag.EmailScheduleReport(Preview: boolean);
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  frmPBRPJobBagSched := TfrmPBRPJobBagSched.create(self);
  try
    frmPBRPJobBagSched.key := strtofloat(memSelection.text);

    if (frmPBRPJobBagSched.GetDetails = 0) then
      MessageDlg('There are no job bags to print', mtError, [mbAbort], 0)
    else
      begin
        frmPBRPJobBagSched.bPreview := false;
        sTemp := BuildQueryString;
        sSubject := 'Job Bag Schedule: ' + memSelection.text;
        emailHandler.Body := 'Please find attached, ' + sSubject + '.'#13#10#13#10;
        emailHandler.CreateEmail(frmPBRPJobBagSched.qrpDetails, sTemp, 'JB'+memSelection.text, sSubject);
      end;
  finally
    frmPBRPJobBagSched.free;
    emailHandler.Free;
  end;
end;

procedure TfrmPBRSJobBag.RunScheduleReport(Preview: boolean);
begin
  frmPBRPJobBagSched := TfrmPBRPJobBagSched.create(self);
  try
    frmPBRPJobBagSched.Key := strtofloat(memSelection.text);

    if (frmPBRPJobBagSched.GetDetails = 0) then
      MessageDlg('There is no schedule to print for this job bag', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        if not Preview then
          begin
            frmPBRPJobBagSched.bPreview := false;
            frmPBRPJobBagSched.qrpDetails.PrinterSetup;
            if frmPBRPJobBagSched.qrpDetails.tag = 0 then
              frmPBRPJobBagSched.qrpDetails.Print;
          end
        else
          begin
            frmPBRPJobBagSched.bPreview := true;
            frmPBRPJobBagSched.qrpDetails.Preview;
          end;
      end;
  finally
    frmPBRPJobBagSched.free;
  end;
end;

function TfrmPBRSJobBag.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Job_Bag.Job_Bag = ' + memSelection.text;
  Result := sTemp
end;

procedure TfrmPBRSJobBag.PreviewBitBtnClick(Sender: TObject);
begin
  if rdgReportType.itemindex = 0 then
    RunReport(true)
  else
    RunScheduleReport(true);
end;

procedure TfrmPBRSJobBag.PrintBitBtnClick(Sender: TObject);
begin
  if rdgReportType.itemindex = 0 then
    RunReport(false)
  else
    RunScheduleReport(false);
  close;
end;

procedure TfrmPBRSJobBag.GetSelection;
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
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmPBRSJobBag.BuildSelection;
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

procedure TfrmPBRSJobBag.BuildRange(sFirst, sLast: string);
begin
 	with qryGetRange do
    begin
      Close;
      ParamByName('From_Job_Bag').AsFloat := StrtoFloat(sFirst);
      ParamByName('To_Job_Bag').AsFloat := StrtoFloat(sLast);
      Open;
      First;
      While Not EOF do
        begin
          SelectLst.Items.Add(FloatToStr(FieldByName('Job_Bag').AsFloat));
          Next;
        end;
    end;
end;

procedure TfrmPBRSJobBag.FormActivate(Sender: TObject);
begin
  iIntselcode := dmBroker.GetNextIntSelCode(Self);
end;

procedure TfrmPBRSJobBag.EmailBitBtnClick(Sender: TObject);
begin
  EmailScheduleReport(false);
  close;
end;

procedure TfrmPBRSJobBag.rdgReportTypeClick(Sender: TObject);
begin
  emailbitbtn.Enabled := ((Sender as TRadioGroup).itemindex = 1);
end;

end.
