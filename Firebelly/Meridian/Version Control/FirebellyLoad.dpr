program FirebellyLoad;

uses
  Forms,
  FirebellyVers in 'FirebellyVers.pas' {frmFirebellyVers},
  AllCommon in '..\..\AllCommon.pas',
  Outlook12_TLB in '..\..\Outlook12_TLB.pas',
  Office12_TLB in '..\..\Office12_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Firebelly Worktop Software';
  Application.CreateForm(TfrmFirebellyVers, frmFirebellyVers);
  Application.Run;
end.
