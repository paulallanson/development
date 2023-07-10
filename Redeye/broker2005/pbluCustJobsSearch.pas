unit pbluCustJobsSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmpbluCustJobsSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    edtBranch: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    edtQuantity: TEdit;
    edtFormReference: TEdit;
    edtProductCode: TEdit;
    edtCustOrderNo: TEdit;
    ShowCancelledChkBox: TCheckBox;
    SearchButton: TButton;
    procedure SearchButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpbluCustJobsSearch: TfrmpbluCustJobsSearch;

implementation

uses pbJobsDm;

{$R *.DFM}

procedure TfrmpbluCustJobsSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlJobs.BranchName := Trim(edtBranch.Text);
//  dtmdlJobs.ProductCode := Trim(edtProductCode.Text);
//  dtmdlJobs.FormReference := Trim(edtFormReference.Text);
  dtmdlJobs.CustomerRef := Trim(edtCustOrderNo.Text);
  dtmdlJobs.OrdQtyDesc := Trim(edtQuantity.Text);
  dtmdlJobs.refreshdata;
end;

end.
