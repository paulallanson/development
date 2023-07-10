unit PBMaintProduct1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls, DB, DBTables,
  ExtCtrls;

type
  TPBMaintProduct1Frm = class(TForm)
    pgWizard: TPageControl;
    tsCustomer: TTabSheet;
    tsTemplate: TTabSheet;
    Label2: TLabel;
    dblstTemplate: TDBLookupListBox;
    Label4: TLabel;
    edtTemplate: TMaskEdit;
    qryTemplate: TQuery;
    dtsTemplate: TDataSource;
    tsDescription: TTabSheet;
    Label6: TLabel;
    edtProductCode: TEdit;
    edtProductType: TEdit;
    Label7: TLabel;
    edtSize: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    btnBack: TBitBtn;
    btnNext: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    Label3: TLabel;
    edtCustomer1: TEdit;
    Label5: TLabel;
    edtCustomer2: TEdit;
    Label9: TLabel;
    edtDescription: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edtFreeText: TEdit;
    Label10: TLabel;
    tsFinish: TTabSheet;
    Label11: TLabel;
    edtCustomer3: TEdit;
    edtProductCode1: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtFullDescription: TEdit;
    qryAddLevels: TQuery;
    qryAddPart: TQuery;
    tsProduct: TTabSheet;
    Label14: TLabel;
    edtCustomer4: TEdit;
    Label15: TLabel;
    edtProduct: TEdit;
    qryCheckProductCode: TQuery;
    chkbxRunReceipts: TCheckBox;
    Panel2: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    procedure btnNextClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnCancel1Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure dblstTemplateClick(Sender: TObject);
    procedure edtCustomerChange(Sender: TObject);
    procedure edtTemplateChange(Sender: TObject);
    procedure EnableNext(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tsCustomerShow(Sender: TObject);
    procedure tsTemplateShow(Sender: TObject);
    procedure tsFinishShow(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure tsDescriptionShow(Sender: TObject);
    procedure tsProductShow(Sender: TObject);
    procedure edtProductKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductChange(Sender: TObject);
    procedure edtFreeTextKeyPress(Sender: TObject; var Key: Char);
  private
    iProductType, iSize: integer;
    sShortSize, sShortType: string;
    sPage, sPrefix: string;
    function LoadTemplate(tempCust: integer): boolean;
    procedure CreateProduct;
    function ProductCodeExists(tempCode: string): boolean;
    function InvalidPrefix: boolean;
    procedure CallMoveScreen(TempMoveType: String);
  public
    iCustomer, iBranch: integer;
    bOK: boolean;
  end;

var
  PBMaintProduct1Frm: TPBMaintProduct1Frm;

implementation

uses PBLUCust, PBLUStandSize, PBLUPrdTyp, PBPartTransfer, PBDatabase;

{$R *.dfm}

procedure TPBMaintProduct1Frm.EnableNext(Sender: TObject);
begin
  if sPage = 'tsCustomer' then
    btnNext.enabled := (edtCustomer.Text <> '')
  else
  if sPage = 'tsTemplate' then
    btnNext.enabled := (edtTemplate.Text <> '')
  else
  if sPage = 'tsProduct' then
    btnNext.enabled := (edtProduct.Text <> '')
  else
  if sPage = 'tsDescription' then
    btnNext.enabled := (edtSize.text <> '') and (edtProductType.text <> '') and
                       ((edtDescription.Text <> '') or (edtFreeText.Text <> ''))
end;

procedure TPBMaintProduct1Frm.btnCustomerClick(Sender: TObject);
var
  useTemplate: boolean;
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := false ;
    PBLUCustFrm.bSel_Branch := false ;
    PBLUCustFrm.SelCode := iCustomer;
    PBLUCustFrm.SelBranch := iBranch;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
      begin
        iCustomer := PBLUCustFrm.SelCode;
        iBranch := PBLUCustFrm.SelBranch;
        edtCustomer.Text := PBLUCustFrm.SelName;
        sPrefix := PBLUCustFrm.SelPrefix;
        useTemplate := LoadTemplate(iCustomer);

        if usetemplate then
          begin
            tsProduct.PageIndex := 4;
            tsTemplate.PageIndex := 1;
          end
        else
          begin
            tsProduct.PageIndex := 1;
            tsTemplate.PageIndex := 4;
          end;
      end;
  finally
    PBLUCustFrm.Free;
  end;
end;

function TPBMaintProduct1Frm.LoadTemplate(tempCust: integer): boolean;
begin
  edtTemplate.text := '';
  with qryTemplate do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TPBMaintProduct1Frm.btnCancel1Click(Sender: TObject);
begin
  close;
end;

procedure TPBMaintProduct1Frm.btnBackClick(Sender: TObject);
begin
  pgWizard.SelectNextPage(false,false);
end;

procedure TPBMaintProduct1Frm.dblstTemplateClick(Sender: TObject);
var
  i, ilength: integer;
  sMask: string;
begin
  edtTemplate.text := '';
  ilength := length(dtsTemplate.dataset.fieldbyname('Product_Code_Prefix').asstring);
  sMask := '';

  for i := 1 to iLength do
    sMask := sMask + '\' + copy(dtsTemplate.dataset.fieldbyname('Product_Code_Prefix').asstring,i,1);

  edtTemplate.EditMask := sMask + dtsTemplate.dataset.fieldbyname('Product_Template').asstring;

end;

procedure TPBMaintProduct1Frm.edtCustomerChange(Sender: TObject);
begin
  edtCustomer1.text := (sender as Tedit).Text;
  edtCustomer2.text := (sender as Tedit).Text;
  edtCustomer3.text := (sender as Tedit).Text;
  edtCustomer4.text := (sender as Tedit).Text;
  enablenext(self);
end;

procedure TPBMaintProduct1Frm.edtTemplateChange(Sender: TObject);
begin
  edtTemplate.Enabled := edtTemplate.Text <> '';
  edtProductCode.Text := edtTemplate.Text;
  edtProductCode1.Text := edtTemplate.Text;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.FormCreate(Sender: TObject);
begin
  pgWizard.ActivePage := tsCustomer;
end;

procedure TPBMaintProduct1Frm.BitBtn1Click(Sender: TObject);
begin
  PBLUStandSizeFrm := TPBLUStandSizeFrm.Create(Self);
  try
    PBLUStandSizeFrm.bIs_Lookup := true;
    PBLUStandSizeFrm.bAllow_Upd := True;
    PBLUStandSizeFrm.ShowModal;
    if PBLUStandSizeFrm.selected then
      begin
        edtSize.text := PBLUStandSizeFrm.SelName;
        iSize := PBLUStandSizeFrm.SelCode;
        if sShortType = '' then
          edtDescription.Text := trim(PBLUStandSizeFrm.SelShort) + ' ' + edtDescription.Text
        else
          edtDescription.Text := stringreplace(edtDescription.text,trim(sShortSize),trim(PBLUStandSizeFrm.SelShort),[rfIgnoreCase]);

        sShortSize := PBLUStandSizeFrm.SelShort;
        Enablenext(self);
      end;
  finally
    PBLUStandSizeFrm.Free;
  end;
end;

procedure TPBMaintProduct1Frm.BitBtn2Click(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := iProductType;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      iProductType := PBLUPrdTypFrm.SelCode;
      edtProductType.Text := PBLUPrdTypFrm.SelName + '/' + PBLUPrdTypFrm.CatName;
      if sShortType = '' then
        begin
          if trim(edtDescription.Text) = '' then
            edtDescription.Text := trim(PBLUPrdTypFrm.SelShort)
          else
            edtDescription.Text := trim(edtDescription.Text) + ' ' + trim(PBLUPrdTypFrm.SelShort);
        end
      else
        edtDescription.Text := stringreplace(edtDescription.text,trim(sShortType),trim(PBLUPrdTypFrm.SelShort),[rfIgnoreCase]);

      sShortType := PBLUPrdTypFrm.SelShort;
      EnableNext(self);
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
end;

procedure TPBMaintProduct1Frm.tsCustomerShow(Sender: TObject);
begin
  sPage := 'tsCustomer';
  btnBack.Visible := false;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.tsTemplateShow(Sender: TObject);
begin
  sPage := 'tsTemplate';
  btnNext.Caption := 'Next';
  btnBack.Visible := true;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.btnNextClick(Sender: TObject);
begin
  if trim(sPrefix) = '' then
    begin
      messagedlg('No product prefix exists for this customer.', mtError, [mbOk], 0);
      exit;
    end;

  if pgWizard.activePage = tsFinish then
    begin
      bOK := false;
      try
        CreateProduct;
        messagedlg('Product Code ' + edtProductCode.Text + ' has been created successfully!', mtInformation, [mbOk], 0);
        if chkbxRunReceipts.checked then
          begin
            CallMoveScreen('O');
          end;
        bOK := true;
      except
      end;
      close;
    end
  else
  if (pgWizard.activePage = tsProduct) then
    begin
      if InvalidPrefix then
        begin
          edtProduct.SetFocus ;
          exit;
        end;

      if ProductCodeExists(edtProduct.text) then
        begin
          MessageDlg('Product code already exists', mtError, [mbOK],0) ;
          edtProduct.SetFocus ;
          exit;
        end;
      pgWizard.SelectNextPage(true,false);
    end
  else
  if (pgWizard.ActivePage = tsTemplate) then
    begin
      if ProductCodeExists(edtTemplate.text) then
        begin
          MessageDlg('Product code already exists', mtError, [mbOK],0) ;
          edtTemplate.SetFocus ;
          exit;
        end;
      pgWizard.SelectNextPage(true,false);
    end
  else
    pgWizard.SelectNextPage(true,false);
end;

procedure TPBMaintProduct1Frm.tsFinishShow(Sender: TObject);
begin
  sPage := 'tsFinish';
  btnNext.Caption := 'Finish';
  btnNext.enabled := true;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.CreateProduct;
begin
  with qryAddPart do
    begin
      Close;
      ParamByName('Part').AsString := edtProductCode.Text;
      ParamByName('Part_Description').AsString := edtFullDescription.Text;
      ParamByName('Part_Cost_List').AsFloat := 0.00 ;
      ParamByName('Part_Cost_Cat').AsFloat := 0.00;
      ParamByName('VAT').AsInteger := 1;
      ParamByName('Part_Group').Clear;
      ParamByName('Part_Purchase_Price').AsFloat := 0.00;
      ParamByName('Part_Mark_Up_List').AsFloat := 0.00;
      ParamByName('Part_Mark_Up_Cat').AsFloat := 0.00;
      ParamByName('Purch_Pack_Quantity').AsFloat := 1;
      ParamByName('Sell_Pack_Quantity').AsFloat := 1;
      ParamByName('Track_Serial_No').AsString := 'N';
      ParamByName('Numbered').AsString := 'N';
      ParamByName('Auto_Update').AsString := 'N';
      ParamByName('Not_In_Use').AsString := 'N';
      ParamByName('Inactive_When_Balance_Zero').AsString := 'N';

      ParamByName('Order_part_online').AsString := 'N';

      ParamByName('Price_unit').Clear;

      ParamByName('Product_Type').AsInteger := iProductType;

      ParamByName('Unit_of_Measure').Clear;

      ParamByName('Customer').AsInteger := iCustomer;
      ParamByName('Branch').AsInteger := 0;

      ParamByName('Sales_Nom').AsString := '';
      ParamByName('Purch_Nom').AsString := '';
      ParamByName('Markup_Type').clear;
      ParamBYName('MarkUp_Val').clear;
      ParamByName('Prod_Class').AsString := 'STK';

      Parambyname('Product_ID').asinteger := dmBroker.GetNextProductID;
      ExecSQL;
    end;

  with qryAddLevels do
    begin
      Close;
      Parambyname('Part').AsString := edtProductCode.Text;
      parambyname('Stock_Levels').asinteger := 1;
      execsql;
    end;
end;

procedure TPBMaintProduct1Frm.edtDescriptionChange(Sender: TObject);
begin
  if edtDescription.Text <> '' then
    edtFullDescription.Text := edtdescription.Text + ' ' + edtFreeText.text
  else
    edtFullDescription.Text := edtFreeText.text;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.tsDescriptionShow(Sender: TObject);
begin
  sPage := 'tsDescription';
  btnNext.Caption := 'Next';
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.tsProductShow(Sender: TObject);
begin
  sPage := 'tsProduct';
  btnBack.Visible := true;
  if edtProduct.Text = '' then
    edtProduct.Text := sprefix;
  edtProduct.SetFocus;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.edtProductKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    ' ', '"', '''', '>', '<':     Key := #0;
  end;
end;

function TPBMaintProduct1Frm.InvalidPrefix: boolean;
var
  TempWord: Word;
  iLength: integer;
begin
  result := true;
  ilength := length(sPrefix);

  if (iLength = 0) and (edtCustomer.Text <> '') then
    begin
      TempWord := MessageDlg('The selected customer doesn''t have a product prefix, ensure that a product prefix is set up for this customer before continuing.',
                    mtError,[mbOk], 0);
      exit;
    end;

  if (trim(sPrefix) = trim(edtProduct.Text)) then
    begin
      TempWord := MessageDlg('The product code cannot just be the customer product prefix, a code must follow the prefix',
                    mtError,[mbOk], 0);
      exit;
    end;

  if (copy(trim(edtProduct.text),1,ilength) <> sPrefix) and (ilength > 0) then
    begin
      TempWord := MessageDlg('The product code prefix doesn''t match the customer product prefix, please amend the product code to incorporate the prefix, ' + sPrefix, mtError,
                [mbYes], 0) ;
      exit;
    end;
  result := false;
end;

function TPBMaintProduct1Frm.ProductCodeExists(tempCode: string): boolean;
begin
  result := false;
  with qryCheckProductCode do
    begin
      Close ;
      ParamByName('Part').AsString := tempCode;
      Open ;
      result := (recordcount > 0);
    end;
end;

procedure TPBMaintProduct1Frm.edtProductChange(Sender: TObject);
begin
  edtProductCode.Text := edtProduct.Text;
  edtProductCode1.Text := edtProduct.Text;
  EnableNext(self);
end;

procedure TPBMaintProduct1Frm.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  tempPart := edtProductCode.Text;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := edtFullDescription.Text;
    PBPartTransferFrm.edtFormReference.Text := '';
    PBPartTransferFrm.Customer := iCustomer;
    PBPartTransferFrm.sMoveType := TempMoveType ;
    PBPartTransferFrm.ShowModal;
    bTempOK := PBPartTransferFrm.bOK;
  finally
    PBPartTransferFrm.Free;
  end;
end;

procedure TPBMaintProduct1Frm.edtFreeTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '"', '''',',':     Key := #0;
  end;
end;

end.
