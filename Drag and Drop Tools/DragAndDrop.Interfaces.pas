unit DragAndDrop.Interfaces;

interface

type
  IHandleDragAndDrop = interface
    ['{A1CBBBED-50BE-48BB-9AB7-CF916A178BB0}']
    procedure MakeACopy(const Source, TargetPath: string);
  end;

implementation

end.
