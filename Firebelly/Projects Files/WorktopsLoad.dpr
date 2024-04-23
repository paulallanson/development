program WorktopsLoad;

uses
  Forms,
  WorktopsVers in '..\WorktopsVers.pas' {frmWorktopsVers},
  AllCommon in '..\AllCommon.pas',
  Printer.Enums in '..\..\PrinterTools\Printer.Enums.pas',
  Printer.Interfaces in '..\..\PrinterTools\Printer.Interfaces.pas',
  Printer.Tools in '..\..\PrinterTools\Printer.Tools.pas',
  CRControls in '..\..\Components\CRPackage\CRControls.pas',
  Shared.DragDrop.Helper in '..\..\Shared\Shared.DragDrop.Helper.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Broker Loader';
  Application.MainFormOnTaskBar := True;
  Application.CreateForm(TfrmWorktopsVers, frmWorktopsVers);
  Application.Run;
end.
