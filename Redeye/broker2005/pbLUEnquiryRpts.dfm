object frmPBLUEnquiryRpts: TfrmPBLUEnquiryRpts
  Left = 201
  Top = 107
  Width = 421
  Height = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Enquiry Reports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 413
      Height = 235
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 200
        end
        item
          Caption = 'File Name'
          Width = 100
        end
        item
          Caption = 'Item No'
          Width = 0
        end>
      Items.Data = {
        650100000600000000000000FFFFFFFFFFFFFFFF010000000000000011437572
        72656E7420456E717569726965730D50425253454E5153454C46524D00000000
        FFFFFFFFFFFFFFFF0100000000000000194F7665722064756520456E71756972
        696573207265706F72740E504252534F445545454E5146524D00000000FFFFFF
        FFFFFFFFFF01000000000000001A4F766572206475652051756F746174696F6E
        73207265706F72740E504252534F44554551544546524D00000000FFFFFFFFFF
        FFFFFF0100000000000000135072696E742F46617820456E717569726965730A
        50425253454E5146524D00000000FFFFFFFFFFFFFFFF01000000000000001450
        72696E742F4661782051756F746174696F6E730A5042525351554F46524D0000
        0000FFFFFFFFFFFFFFFF010000000000000013537570706C69657220436F6D70
        617269736F6E1250425253454E5153555050434F4D5046524DFFFFFFFFFFFFFF
        FFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 235
    Width = 413
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      413
      41)
    object btnRun: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Run'
      TabOrder = 0
      OnClick = btnRunClick
    end
    object Button2: TButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
