unit RegisterShellControls;

interface

procedure Register;

implementation

uses Vcl.Shell.ShellCtrls, System.Classes;

procedure Register;
begin
  RegisterComponents('Shell Controls', [TShellListView]);
  RegisterComponents('Shell Controls', [TShellTreeView]);
  RegisterComponents('Shell Controls', [TShellChangeNotifier]);
end;

end.
