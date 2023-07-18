unit Fieldprop;

{************************************************************************

Data field property editor for the Data aware QuickReport Barcode
Component for Delphi.
© 1996-2000 Zorn Software, Amsterdam, The Netherlands
No part of this code may be copied or used in other programs.

*************************************************************************}

interface

uses
  DesignEditors, DesignIntf, typinfo, classes, db, dbqbarcode;

procedure Register;

implementation

type
  TBCDataFieldProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    function GetDataSetPropName: string; virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TBCDataFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TBCDataFieldProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

function TBCDataFieldProperty.GetDataSetPropName: string;
begin
  Result := 'DataSet';
end;

procedure TBCDataFieldProperty.GetValueList(List: TStrings);
var
  Instance: TComponent;
  PropInfo: PPropInfo;
  DataSet: TDataSet;
begin
  Instance := TComponent(GetComponent(0));
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, GetDataSetPropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
  begin
    DataSet := TObject(GetOrdProp(Instance, PropInfo)) as TDataSet;
    if (DataSet <> nil) then DataSet.GetFieldNames(List);
  end;
end;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(string), TDBBarCode, 'DataField', TBCDataFieldProperty);
end;

end.
