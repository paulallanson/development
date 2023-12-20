object frmWTLUCustomerRpts: TfrmWTLUCustomerRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Customer Reports'
  ClientHeight = 184
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 412
      Height = 143
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
      Items.ItemData = {
        05DA0100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0013530061006C0065007300200041006300740069006F006E00200052006500
        70006F007200740015460052004D00570054005200530043005500530054004F
        004D004500520041004300540049004F004E000000000000000000FFFFFFFFFF
        FFFFFF01000000FFFFFFFF000000001843007500730074006F006D0065007200
        20004100630074006900760069007400790020005200650070006F0072007400
        17460052004D00570054005200530043005500530054004F004D004500520041
        0043005400490056004900540059000000000000000000FFFFFFFFFFFFFFFF01
        000000FFFFFFFF000000001843007500730074006F006D006500720020004300
        6F006E0074006100630074002000440065007400610069006C00730012460052
        004D005700540052005300430055005300540043004F004E0054004400450054
        000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000165200
        65007400610069006C0020004100640064007200650073007300200044006500
        7400610069006C00730014460052004D00570054005200530052004500540041
        0049004C00410044004400520045005300530000000000FFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 143
    Width = 412
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      412
      41)
    object btnselect: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Select'
      Enabled = False
      TabOrder = 0
      OnClick = btnselectClick
    end
    object Button2: TButton
      Left = 327
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
