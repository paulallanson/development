unit Printer.Interfaces;

interface

uses
  QuickRpt, System.Classes;

type
  IPrinterToAttachment = interface
    ['{6C882DC9-2EAB-4124-AAA9-E8C2AEC4283A}']
    procedure PrintToAttachment(const Report: TQuickRep; const FEmailAttachment: TStringList; const fileName, attachmentType: string; const ClearFilesList: Boolean = True);
    procedure PrintToFileQuote(const Report: TQuickRep; const ListFiles: TStringList; const ReferenceNo: integer; const attachmentType: string);
    procedure PrintToFileDelivery(const Report: TQuickRep; const ListFiles: TStringList; const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
    procedure PrintToFileLabel(const Report: TQuickRep; const ListFiles: TStringList; const PONo: Real; const POLine, DelLine: integer; const attachmentType: string);
  end;

implementation

end. 