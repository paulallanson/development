program TickTockLoad;

uses
  Forms,
  CCSCommon in '..\..\CCSCOMMOND7\CCSCommon.pas',
  TickTockVers in 'TickTockVers.pas' {TickTockVersFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Broker Loader';
  Application.CreateForm(TTickTockVersFrm, TickTockVersFrm);
  Application.Run;
end.
