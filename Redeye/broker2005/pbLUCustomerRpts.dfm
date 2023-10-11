object frmPBLUCustomerRpts: TfrmPBLUCustomerRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Customer Reports'
  ClientHeight = 283
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 242
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 413
      Height = 242
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
        05650100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001643007500730074006F006D00650072002F004200720061006E0063006800
        20005200650070006F00720074000E5000420052005300430055005300540044
        0045005400460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF000000001843007500730074006F006D0065007200200043006F006E00
        7400610063007400730020005200650070006F00720074001250004200520053
        00430055005300540043004F004E005400440045005400460052004D00000000
        0000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000001B410063006300
        6F0075006E00740020004D0061006E0061006700650072002000500065007200
        66006F0072006D0061006E00630065001850004200520053004100430043004D
        0041004E0050004500520046004F0052004D0041004E0043004500460052004D
        0000000000FFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 242
    Width = 413
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
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
