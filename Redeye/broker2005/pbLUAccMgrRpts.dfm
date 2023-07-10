object frmPBLUAccMgrRpts: TfrmPBLUAccMgrRpts
  Left = 394
  Top = 155
  Width = 421
  Height = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Account Manager Reports'
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
        500200000A00000000000000FFFFFFFFFFFFFFFF010000000000000029437572
        72656E7420506572696F6420416E74696369706174656420496E766F69636520
        5265706F7274155042525334434153544D4F4E5448494E565346524D00000000
        FFFFFFFFFFFFFFFF010000000000000018437573746F6D65722050726F666974
        20416E616C79736973165042525350454E4443555354504552464F524D46524D
        00000000FFFFFFFFFFFFFFFF010000000000000018437573746F6D6572205475
        726E6F766572205265706F72740F50425253435553545455524E46524D000000
        00FFFFFFFFFFFFFFFF01000000000000001450726F6475637420557361676520
        5265706F7274125042525353414C4553425950524F4446524D00000000FFFFFF
        FFFFFFFFFF01000000000000001653616C657320496E766F6963696E67205265
        706F7274115042525353414C45534259494E5646524D00000000FFFFFFFFFFFF
        FFFF01000000000000002353616C657320496E766F6963696E67206279205072
        6F647563742043617465676F7279145042525353414C45534259505244434154
        46524D00000000FFFFFFFFFFFFFFFF010000000000000015574950202D204A6F
        6220426167204368617267657316504252534A4F424241474558545241535749
        5046524D00000000FFFFFFFFFFFFFFFF01000000000000000F574950202D2042
        7579205072696E740D50425253574F524B495046524D00000000FFFFFFFFFFFF
        FFFF00000000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
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
