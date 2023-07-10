program FirebellyLoad;

uses
  Forms,
  FirebellyVers in 'FirebellyVers.pas' {frmFirebellyVers},
  AllCommon in '..\..\AllCommon.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Firebelly Worktop System';
  Application.CreateForm(TfrmFirebellyVers, frmFirebellyVers);
  Application.Run;
end.
