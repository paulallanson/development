program WorktopsLoad;

uses
  Forms,
  WorktopsVers in 'WorktopsVers.pas' {frmWorktopsVers},
  AllCommon in '..\..\AllCommon.pas',
  Office12_TLB in '..\..\Office12_TLB.pas',
  Outlook12_TLB in '..\..\Outlook12_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Firebelly Worktop Management System';
  Application.CreateForm(TfrmWorktopsVers, frmWorktopsVers);
  Application.Run;
end.
