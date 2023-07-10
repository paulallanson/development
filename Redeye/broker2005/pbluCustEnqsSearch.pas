unit pbluCustEnqsSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmpbluCustEnqsSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    edtRep: TEdit;
    Label1: TLabel;
    edtProductCode: TEdit;
    edtFormReference: TEdit;
    Label3: TLabel;
    ShowCancelledChkBox: TCheckBox;
    SearchButton: TButton;
    Label2: TLabel;
    edtBranch: TEdit;
    procedure SearchButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpbluCustEnqsSearch: TfrmpbluCustEnqsSearch;

implementation

uses pbEnqsdm;

{$R *.DFM}

procedure TfrmpbluCustEnqsSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlEnqs.BranchName := Trim(edtBranch.Text);
  dtmdlEnqs.ProductCode := Trim(edtProductCode.Text);
  dtmdlEnqs.FormReference := Trim(edtFormReference.Text);
  dtmdlEnqs.RepName := Trim(edtRep.Text);
  dtmdlEnqs.refreshdata;
end;

end.
