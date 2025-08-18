unit WTLUSalesOrderCharges;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, wtSalesOrderDM;

type
  TfrmWTLUSalesOrderCharges = class(TForm)
    pnlFooter: TPanel;
    btnSweep: TButton;
    pnlTop: TPanel;
    CustomerLbl: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    grpInvDate: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    dbgDetails: TDBGrid;
    btnExcel: TButton;
    btnClose: TButton;
    btnSelect: TButton;
    Label1: TLabel;
    edtSearch: TEdit;
    btnDeselect: TButton;
    tmrSearch: TTimer;
    Panel1: TPanel;
    Label2: TLabel;
    stBrDetails: TStatusBar;
    procedure btnCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeSelectClick(Sender: TObject);
  private
    FMode: string;
    FDisableNameChangeEvent: boolean;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure InitialiseDate(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetMode(const Value: string);
    procedure InsertIntoOrder;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
    Customer: integer;
    SOrder: TSOrder;
    property Mode: string read FMode write SetMode;
  end;

var
  frmWTLUSalesOrderCharges: TfrmWTLUSalesOrderCharges;
  dtmdlSalesOrderCharges: TdtmdlSalesOrder;

implementation

uses wtSrchCustomer, AllCommon, DateSelV5, WTMaintSalesOrder, wtMain;

{$R *.dfm}

procedure TfrmWTLUSalesOrderCharges.btnCustomerClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.bOnlyShowAFP := false;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        if Customer <> frmwtSrchCustomer.CodeSelected then
          begin
            Customer := frmwtSrchCustomer.CodeSelected;
            edtCustomer.text := frmwtSrchCustomer.NameSelected;

            dtmdlSalesOrderCharges.Customer := Customer;
            dtmdlSalesOrderCharges.RefreshChargesData;
          end
      end;
  finally
    frmwtSrchCustomer.free;
  end;

end;

procedure TfrmWTLUSalesOrderCharges.FormCreate(Sender: TObject);
begin
  dtmdlSalesOrderCharges := TdtmdlSalesOrder.Create(Self);
  dtmdlSalesOrderCharges.dtsSOCharges.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlSalesOrderCharges.dtsSOCharges;

  InitialiseDate(self);
  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
  AllCommon.SetDBGridCols('', 'SalesOrderChargesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUSalesOrderCharges.FormDestroy(Sender: TObject);
begin
  dtmdlSalesOrderCharges.free;
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
  AllCommon.SaveDBGridCols('', 'SalesOrderChargesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUSalesOrderCharges.edtDateFromExit(Sender: TObject);
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
  dtmdlSalesOrderCharges.DateFrom := paDateStr(edtDateFrom.text);
  dtmdlSalesOrderCharges.RefreshChargesData;
end;

function TfrmWTLUSalesOrderCharges.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTLUSalesOrderCharges.DateFromButtonClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
  dtmdlSalesOrderCharges.DateFrom := paDateStr(edtDateFrom.text);
  dtmdlSalesOrderCharges.RefreshChargesData;
end;

procedure TfrmWTLUSalesOrderCharges.DateToButtonClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
  dtmdlSalesOrderCharges.DateTo := paDateStr(edtDateto.text);
  dtmdlSalesOrderCharges.RefreshChargesData;
end;

procedure TfrmWTLUSalesOrderCharges.edtDateToExit(Sender: TObject);
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
  dtmdlSalesOrderCharges.DateTo := paDateStr(edtDateto.text);
  dtmdlSalesOrderCharges.RefreshChargesData;
end;

procedure TfrmWTLUSalesOrderCharges.InitialiseDate(Sender: TObject);
begin
    dtmdlSalesOrderCharges.DateTo := Date;
    edtDateTo.Text := paDatestr(dtmdlSalesOrderCharges.DateTo);
    dtmdlSalesOrderCharges.DateFrom := Date - 60;
    edtDateFrom.Text := paDatestr(dtmdlSalesOrderCharges.DateFrom);
end;

procedure TfrmWTLUSalesOrderCharges.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlSalesOrderCharges do
  begin
    btnSelect.enabled := (qrySOCharges.recordcount > 0);
    btnDeSelect.enabled := (qrySOCharges.recordcount > 0);
    btnSweep.enabled := (qrySOCharges.recordcount > 0);
    btnExcel.enabled := (qrySOCharges.recordcount > 0);
    stBrDetails.panels[0].text := inttostr(qrySOCharges.recordcount) + ' sales order charges listed';
  end;
end;

procedure TfrmWTLUSalesOrderCharges.btnSelectClick(Sender: TObject);
var
  aSOrder : TSorder;
  frm : TfrmWTMaintSalesOrder;
  icount, iCharge, iRow, iQty, iChargeID: integer;
  iProduct: integer;
begin
  if Mode = 'SO' then
    begin
      InsertIntoOrder;
      exit
    end;

  if MessageDlg('Do you want to raise an order for the selected charges?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      iCharge := 1;

      aSOrder := TSOrder.Create(dtmdlSalesOrderCharges);
      try
        with dbgDetails.DataSource.dataset do
          begin
            first ;
            while EOF <> true do
              begin
                if dbgDetails.DataSource.dataset.fieldbyname('Charge_Invoiced').asstring <> 'S' then
                  begin
                    next;
                    continue;
                  end;

                if iCharge = 1 then
                  begin
                    aSOrder.dbkey := 0;
                    aSOrder.SODate := date;
                    aSOrder.Customer := dbgDetails.DataSource.dataset.fieldbyname('Associate_Customer').asinteger;
                    aSOrder.CustomerName := dbgDetails.DataSource.dataset.fieldbyname('Associate_Customer_Name').asstring;
                    aSOrder.Rep := dbgDetails.DataSource.dataset.fieldbyname('Associate_Rep').asinteger;
                    aSOrder.DateType := 'C';
                    aSOrder.DateRequired := date;
                    aSorder.SupplyOnly := 'Y';
                    aSOrder.Description := 'Labour Charges';
                    aSOrder.Lines.Clear;
                    aSOrder.Charges.Clear;
                  end;

                {Add the charge lines}
                aSOrder.LoadChargeLine(dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger);

                iProduct := dbgDetails.DataSource.dataset.fieldbyname('Product').asinteger;
                iQty := 0;
                for iRow := 0 to pred(aSOrder.Charges.count) do
                  begin
                    if aSOrder.Charges[iRow].Product = iProduct then
                      iQty := iQty + 1
                  end;

                {Add the order lines}
                if iQty = 1 then
                  begin
                    {Add new order line}
                    aSOrder.LoadChargeOrderLine(dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger);

                    for iChargeID := 0 to pred(aSOrder.Charges.count) do
                      begin
                        if aSOrder.Charges[iChargeID].ParentID = dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger then
                          begin
                            aSOrder.Charges[iChargeID].SOLNumber := aSOrder.Lines[pred(aSorder.Lines.count)].SOLNumber;
                            aSOrder.Charges[iChargeID].ParentSalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                            aSOrder.Charges[iChargeID].ParentTemplateDate := dbgDetails.DataSource.dataset.fieldbyname('Template_Date').asdatetime;
                            aSOrder.Charges[iChargeID].ParentFittingDate := dbgDetails.DataSource.dataset.fieldbyname('Date_Required').asdatetime;
                          end
                      end;
                  end
                else
                  begin
                    for iRow := 0 to pred(aSOrder.Charges.count) do
                      begin
                        if aSOrder.Lines[iRow].Product = iProduct then
                          begin
                            aSOrder.Lines[iRow].Quantity := aSOrder.Lines[iRow].Quantity + 1;

                            {Update the charges line with the Sales order line number}
                            for iChargeID := 0 to pred(aSOrder.Charges.count) do
                              begin
                                if aSOrder.Charges[iChargeID].ParentID = dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger then
                                  begin
                                    aSOrder.Charges[iChargeID].SOLNumber := aSOrder.Lines[iRow].SOLNumber;
                                    aSOrder.Charges[iChargeID].ParentSalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                                    aSOrder.Charges[iChargeID].ParentTemplateDate := dbgDetails.DataSource.dataset.fieldbyname('Template_Date').asdatetime;
                                    aSOrder.Charges[iChargeID].ParentFittingDate := dbgDetails.DataSource.dataset.fieldbyname('Date_Required').asdatetime;
                                  end;
                              end;
                            break;
                          end;
                      end;
                  end;
                iCharge := iCharge + 1;
                next;
              end;
          end;

        Frm := TfrmwtMaintSalesOrder.Create(Self);
        try
          Frm.Mode := sopConvert;
          Frm.SOrder := aSOrder;
          Frm.ShowModal;
          if Frm.ModalResult = idOK then
            ModalResult := idok;
        finally
          Frm.Free;
        end;
      finally
        aSorder.Free;
      end;
    end;

end;

procedure TfrmWTLUSalesOrderCharges.InsertIntoOrder;
var
  icount, iCharge, iRow, iQty, iChargeID: integer;
  iProduct: integer;
begin
  if MessageDlg('Do you want to add the selected charges to the existing order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with dbgDetails.DataSource.dataset do
        begin
          first ;
          while EOF <> true do
            begin
              if dbgDetails.DataSource.dataset.fieldbyname('Charge_Invoiced').asstring <> 'S' then
                begin
                  next;
                  continue;
                end;


              {Add the charge lines}
              SOrder.LoadChargeLine(dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger);

              iProduct := dbgDetails.DataSource.dataset.fieldbyname('Product').asinteger;
              iQty := 0;
              for iRow := 0 to pred(SOrder.Charges.count) do
                begin
                  if SOrder.Charges[iRow].Product = iProduct then
                    iQty := iQty + 1
                end;

              {Add the order lines}
              if iQty = 1 then
                begin
                  {Add new order line}
                  SOrder.LoadChargeOrderLine(dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger);

                  for iChargeID := 0 to pred(SOrder.Charges.count) do
                    begin
                      if SOrder.Charges[iChargeID].ParentID = dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger then
                        begin
                          SOrder.Charges[iChargeID].SOLNumber := SOrder.Lines[pred(Sorder.Lines.count)].SOLNumber;
                          SOrder.Charges[iChargeID].ParentSalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                          SOrder.Charges[iChargeID].ParentTemplateDate := dbgDetails.DataSource.dataset.fieldbyname('Template_Date').asdatetime;
                          SOrder.Charges[iChargeID].ParentFittingDate := dbgDetails.DataSource.dataset.fieldbyname('Date_Required').asdatetime;
                        end
                    end;
                end
              else
                begin
                  for iRow := 0 to pred(SOrder.Charges.count) do
                    begin
                      if SOrder.Lines[iRow].Product = iProduct then
                        begin
                          SOrder.Lines[iRow].Quantity := SOrder.Lines[iRow].Quantity + 1;
                                 {Update the charges line with the Sales order line number}
                          for iChargeID := 0 to pred(SOrder.Charges.count) do
                            begin
                              if SOrder.Charges[iChargeID].ParentID = dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger then
                                begin
                                  SOrder.Charges[iChargeID].SOLNumber := SOrder.Lines[iRow].SOLNumber;
                                  SOrder.Charges[iChargeID].ParentSalesOrder := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;
                                  SOrder.Charges[iChargeID].ParentTemplateDate := dbgDetails.DataSource.dataset.fieldbyname('Template_Date').asdatetime;
                                  SOrder.Charges[iChargeID].ParentFittingDate := dbgDetails.DataSource.dataset.fieldbyname('Date_Required').asdatetime;
                                end;
                            end;
                          break;
                        end;
                    end;
                end;
              Next;
            end;
        end;
      ModalResult := idok;
    end;
end;

procedure TfrmWTLUSalesOrderCharges.btnSweepClick(Sender: TObject);
var
  iCode: integer;
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          iCode := dbgDetails.datasource.dataset.fieldbyname('ID').asinteger;

          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.close;
          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.parambyname('ID').asinteger := iCode;
          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.parambyname('Charge_Invoiced').asstring := 'S';
          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.execsql;

          next ;
        end;
     end;
  dtmdlSalesOrderCharges.RefreshChargesData;
end;

procedure TfrmWTLUSalesOrderCharges.btnExcelClick(Sender: TObject);
begin
  frmwtMain.ExportToExcel(frmWTLUSalesOrderCharges);

end;

procedure TfrmWTLUSalesOrderCharges.FormActivate(Sender: TObject);
begin
  if Mode = 'SO' then
    begin
      dtmdlSalesOrderCharges.Customer := Customer;
      dtmdlSalesOrderCharges.RefreshChargesData;
    end;
end;

procedure TfrmWTLUSalesOrderCharges.SetMode(const Value: string);
begin
  FMode := Value;
  btnCustomer.visible := (FMode <> 'SO');
end;

procedure TfrmWTLUSalesOrderCharges.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlSalesOrderCharges.RefreshChargesData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSalesOrderCharges.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlSalesOrderCharges.SearchText := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSalesOrderCharges.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUSalesOrderCharges.dbgDetailsDblClick(Sender: TObject);
var
  iCode: integer;
  sStatus: string;
begin
  iCode := dbgDetails.datasource.dataset.fieldbyname('ID').asinteger;
  sStatus := dbgDetails.datasource.dataset.fieldbyname('Charge_Invoiced').asstring;

  with dtmdlSalesOrderCharges.qryUpdSOChargeStatus do
    begin
      close;
      parambyname('ID').asinteger := iCode;
      if sStatus = 'S' then
        parambyname('Charge_Invoiced').asstring := 'N'
      else
        parambyname('Charge_Invoiced').asstring := 'S';
      execsql;
    end;

  dtmdlSalesOrderCharges.RefreshChargesData;
  dbgdetails.DataSource.DataSet.Locate('ID', Variant(inttostr(iCode)),[lopartialKey]);
end;

procedure TfrmWTLUSalesOrderCharges.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgDetails.datasource.dataset.fieldByName('Charge_Invoiced').AsString = 'S') then
    begin
//      (Sender as TDBGrid).Canvas.font.color := clblue;
//      (Sender as TDBGrid).Canvas.Brush.color := clYellow;
      (Sender as TDBGrid).Canvas.font.color := clwhite;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Unit Price') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmWTLUSalesOrderCharges.btnDeSelectClick(Sender: TObject);
var
  iCode: integer;
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          iCode := dbgDetails.datasource.dataset.fieldbyname('ID').asinteger;

          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.close;
          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.parambyname('ID').asinteger := iCode;
          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.parambyname('Charge_Invoiced').asstring := 'N';
          dtmdlSalesOrderCharges.qryUpdSOChargeStatus.execsql;

          next ;
        end;
     end;
  dtmdlSalesOrderCharges.RefreshChargesData;
end;

end.

