unit wtLUContractQuotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB, wtContractsDM, QrCtrls;

type
  TfrmWTLUContractQuotes = class(TForm)
    stbrDetails: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnSelect: TBitBtn;
    edtNumber: TEdit;
    edtCustomerName: TEdit;
    BitBtn1: TBitBtn;
    dbgDetails: TDBGrid;
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
  private
    procedure SetQuoteEdit(Dataset: TDataset);
    procedure SetButtons(Sender: TObject; Field: TField);
    { Private declarations }
  public
    Customer: integer;
    SelectedQuote: integer;
  end;

var
  frmWTLUContractQuotes: TfrmWTLUContractQuotes;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TfrmWTLUContractQuotes.SetQuoteEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
       dbgdetails.datasource := dtmdlContract.dsCustQuotes;
      try
        edtNumber.Text := floatToStr(Dataset.FieldByName('Quote').asinteger);
      except
        edtNumber.Text := '';
      end;
    end
  else
    dbgdetails.datasource := dtmdlContract.dsDummy;
end;

procedure TfrmWTLUContractQuotes.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgDetails.Datasource.Dataset.Locate('Quote',Variant(edtNumber.text), [loPartialKey]) then
      btnSelectClick(self)
    else
      ShowMessage('Quote: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmWTLUContractQuotes.FormCreate(Sender: TObject);
begin
  dtmdlContract := TdtmdlContract.Create(Application);
  dbgDetails.DataSource := dtmdlContract.dsCustQuotes;
  dtmdlContract.dsCustQuotes.OnDataChange := SetButtons;
  dtmdlContract.qryCustQuotes.AfterScroll := SetQuoteEdit;
end;

procedure TfrmWTLUContractQuotes.FormShow(Sender: TObject);
begin
  dtmdlContract.customer := customer;
  dtmdlContract.refreshQuotedata;
  edtNumber.setfocus;
end;

procedure TfrmWTLUContractQuotes.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Do you want to add this quote to the contract?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      SelectedQuote := dbgDetails.Datasource.dataset.fieldbyname('Quote').asinteger;
      ModalResult := mrOK;
    end;
end;

procedure TfrmWTLUContractQuotes.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlContract do
  begin
    btnSelect.enabled := (qryCustQuotes.recordcount > 0);
  end;
end;

procedure TfrmWTLUContractQuotes.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUContractQuotes.FormDestroy(Sender: TObject);
begin
  dtmdlContract.Free;
end;

procedure TfrmWTLUContractQuotes.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.recordcount > 0 then
    btnSelectClick(self);
end;

end.
