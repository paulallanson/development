unit PBMaintIntNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, PBPOObjects, Db, DBTables;

type
  TPBMaintIntNoteFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mmNoteText: TMemo;
    dblucmbbxOperator: TDBLookupComboBox;
    dtpckTime: TDateTimePicker;
    dtpckDate: TDateTimePicker;
    pnlButtons: TPanel;
    DelLabel: TLabel;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    qrySelOperators: TQuery;
    OperatorsSRC: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function New(note: TIntNote): boolean;
    function Edit(note: TIntNote): boolean;
    function Delete(note: TIntNote): boolean;
  end;

var
  PBMaintIntNoteFrm: TPBMaintIntNoteFrm;

implementation

{$R *.DFM}

{ TPBMaintIntNoteFrm }


function TPBMaintIntNoteFrm.Edit(note: TIntNote): boolean;
begin
  self.mmNoteText.text := note.Narrative.Data;
  self.dtpckDate.Date := Trunc(note.DateEntered);
  self.dtpckTime.Time := Frac(note.DateEntered);
  self.dblucmbbxOperator.KeyValue := note.Operator;

  self.Caption := 'Edit an Existing Purchase Order Note.';

  if self.ShowModal = mrOK then
  begin
    note.Narrative.Data := self.mmNoteText.text;
    note.DateEntered := self.dtpckDate.Date + self.dtpckTime.Time;
    note.Operator := self.dblucmbbxOperator.KeyValue;
    self.qrySelOperators.locate('operator', self.dblucmbbxOperator.KeyValue, [loPartialKey]);
    note.OperatorName := self.qrySelOperators.FieldByName('name').asString;
    Result := true;
  end
  else
  begin
    Result := false;
  end;
end;

procedure TPBMaintIntNoteFrm.FormShow(Sender: TObject);
begin
  self.qrySelOperators.Active := true;
end;

procedure TPBMaintIntNoteFrm.FormDestroy(Sender: TObject);
begin
  self.qrySelOperators.Active := false;
end;

function TPBMaintIntNoteFrm.Delete(note: TIntNote): boolean;
begin
  self.mmNoteText.text := note.Narrative.Data;
  self.dtpckDate.Date := Trunc(note.DateEntered);
  self.dtpckTime.Time := Frac(note.DateEntered);
  self.dblucmbbxOperator.KeyValue := note.Operator;

  DelLabel.Visible := true;
  self.mmNoteText.Enabled := false;
  self.dtpckDate.Enabled := false;
  self.dtpckTime.Enabled := false;
  self.dblucmbbxOperator.Enabled := false;

  self.Caption := 'Delete a Purchase Order Note.';

  if self.ShowModal = mrOK then
  begin
    Result := true;
  end
  else
  begin
    Result := false;
  end;
end;

function TPBMaintIntNoteFrm.New(note: TIntNote): boolean;
begin
  self.mmNoteText.text := note.Narrative.Data;
  self.dtpckDate.Date := Trunc(note.DateEntered);
  self.dtpckTime.Time := Frac(note.DateEntered);
  self.dblucmbbxOperator.KeyValue := note.Operator;

  self.Caption := 'Enter a New Purchase Order Note.';

  if self.ShowModal = mrOK then
  begin
    note.Narrative.Data := self.mmNoteText.text;
    note.DateEntered := self.dtpckDate.Date + self.dtpckTime.Time;
    note.Operator := self.dblucmbbxOperator.KeyValue;
    self.qrySelOperators.locate('operator', self.dblucmbbxOperator.KeyValue, [loPartialKey]);
    note.OperatorName := self.qrySelOperators.FieldByName('name').asString;
    Result := true;
  end
  else
  begin
    Result := false;
  end;
end;

end.
