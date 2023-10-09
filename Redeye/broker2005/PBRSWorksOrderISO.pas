unit PBRSWorksOrderISO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, PBJobBagDM, ComCtrls, OleCtrls, SHDocVw, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSWorksOrderISOfrm = class(TForm)
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
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
  private
    bReadPage: boolean;
    iIntselcode: integer;
    dmJobBagSched: TdmJobBag;
    procedure RunReport(Preview: boolean);
    procedure EmailReport(Preview: boolean);
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function BuildQueryString: string;
    { Private declarations }
  public
    WONumber: integer;
    WOStatus: integer;
    JobBagNo: integer;
  end;

var
  PBRSWorksOrderISOfrm: TPBRSWorksOrderISOfrm;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses UITypes, PBRPWorksOrderISO, pbDatabase, CCSemailHandler, CCSCommon;

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

procedure TPBRSWorksOrderISOfrm.RunReport(Preview: boolean);
begin
  PBRPWorksOrderISOfrm := TPBRPWorksOrderISOfrm.create(self);
  try
    PBRPWorksOrderISOfrm.WorksOrder := StrToFloatDef(memSelection.text, 0, FormatSettings);

    if (PBRPWorksOrderISOfrm.GetDetails = 0) then
      MessageDlg('There are no works instructions to print', mtError, [mbAbort], 0)
    else
      begin
        if not Preview then
          begin
            PBRPWorksOrderISOfrm.Preview := false;
            PBRPWorksOrderISOfrm.qrpDetails.PrinterSetup;
            if PBRPWorksOrderISOfrm.qrpDetails.tag = 0 then
              PBRPWorksOrderISOfrm.qrpDetails.Print;
          end
        else
          begin
            PBRPWorksOrderISOfrm.Preview := true;
            PBRPWorksOrderISOfrm.qrpDetails.Preview;
          end;
      end;
  finally
    PBRPWorksOrderISOfrm.free;
  end;
end;

procedure TPBRSWorksOrderISOfrm.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  PBRPWorksOrderISOfrm := TPBRPWorksOrderISOfrm.create(self);
  try
    PBRPWorksOrderISOfrm.WorksOrder := StrToFloatDef(memSelection.text, 0, FormatSettings);

    if (PBRPWorksOrderISOfrm.GetDetails = 0) then
      MessageDlg('There are no works instructions to print', mtError, [mbAbort], 0)
    else
      begin
        PBRPWorksOrderISOfrm.Preview := false;
        sTemp := BuildQueryString;
        sSubject := inttostr(round(StrToFloatDef(memSelection.text, 0, FormatSettings))) + ' ' + edtCustomer.Text + ' ' + memDescription.text;;
        emailHandler.Body := 'Please find attached, Works Instruction ISO document: ' + memSelection.text + '.'#13#10#13#10;
        emailHandler.ccEmail := '';
        emailHandler.CreateOneEmail(PBRPWorksOrderISOfrm.qrpDetails, sTemp, 'ISO'+memSelection.text, sSubject);
      end;
  finally
    PBRPWorksOrderISOfrm.free;
    emailHandler.Free;
  end;
end;

function TPBRSWorksOrderISOfrm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Works_Order.Works_Order_Number = ' + memSelection.text;
  Result := sTemp
end;

procedure TPBRSWorksOrderISOfrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TPBRSWorksOrderISOfrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
  close;
end;

procedure TPBRSWorksOrderISOfrm.GetSelection;
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

procedure TPBRSWorksOrderISOfrm.BuildSelection;
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

procedure TPBRSWorksOrderISOfrm.BuildRange(sFirst, sLast: string);
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

procedure TPBRSWorksOrderISOfrm.FormActivate(Sender: TObject);
begin
  iIntselcode := dmBroker.GetNextIntSelCode(Self);
end;

procedure TPBRSWorksOrderISOfrm.EmailBitBtnClick(Sender: TObject);
begin
  try
    EmailReport(false);
  finally
    close;
  end;
end;

end.
