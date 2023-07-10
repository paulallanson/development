object frmPBLURepRpts: TfrmPBLURepRpts
  Left = 394
  Top = 155
  Width = 421
  Height = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Rep Reports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
        A90100000700000000000000FFFFFFFFFFFFFFFF010000000000000015574950
        202D204A6F6220426167204368617267657316504252534A4F42424147455854
        52415357495046524D00000000FFFFFFFFFFFFFFFF01000000000000000F5749
        50202D20427579205072696E740D50425253574F524B495046524D00000000FF
        FFFFFFFFFFFFFF010000000000000012506572666F726D616E6365205265706F
        7274165042525350454E4452455053504552464F524D46524D00000000FFFFFF
        FFFFFFFFFF01000000000000001B436F6D6D697373696F6E205265706F727420
        2D2041637475616C73195042525350454E4452455053434F4D4D495353494F4E
        46524D00000000FFFFFFFFFFFFFFFF010000000000000022436F6D6D69737369
        6F6E205265706F7274202D2043757272656E7420506572696F64105042525353
        414C4553434F4D4D46524D00000000FFFFFFFFFFFFFFFF010000000000000016
        53616C657320496E766F6963696E67205265706F7274115042525353414C4553
        4259494E5646524D00000000FFFFFFFFFFFFFFFF000000000000000000FFFFFF
        FFFFFFFFFFFFFFFFFF}
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
