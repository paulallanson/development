object frmWTLUContractRpts: TfrmWTLUContractRpts
  Left = 424
  Top = 157
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Contract Quote Reports'
  ClientHeight = 184
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 406
    ExplicitHeight = 134
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
        053D0100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        000F43006F006E00740072006100630074002000510075006F00740065007300
        14460052004D00570054005200530043004F004E005400520041004300540051
        0055004F00540045000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFF
        FF000000001043006F006E007400720061006300740020004400650074006100
        69006C00730016460052004D00570054005200530043004F004E005400520041
        0043005400440045005400410049004C0053000000000000000000FFFFFFFFFF
        FFFFFF01000000FFFFFFFF000000000F43006F006E0074007200610063007400
        20004F007200640065007200730015460052004D00570054005200530043004F
        004E00540052004100430054004F005200440045005200530000000000FFFFFF
        FFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
      ExplicitWidth = 406
      ExplicitHeight = 134
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
    ExplicitTop = 134
    ExplicitWidth = 406
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
      Left = 321
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
      ExplicitLeft = 315
    end
  end
end
