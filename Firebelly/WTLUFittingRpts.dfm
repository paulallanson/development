object frmWTLUFittingRpts: TfrmWTLUFittingRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Fitting Reports'
  ClientHeight = 242
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 201
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 442
      Height = 201
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 250
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
        CF0000000300000000000000FFFFFFFFFFFFFFFF01000000000000001C416E74
        696369706174656420496E766F6963696E67205265706F72741346524D575452
        53534F414E54494E564F49434500000000FFFFFFFFFFFFFFFF01000000000000
        001D53616C6573204F726465722050726F64756374696F6E205265706F727413
        46524D57545253534F50524F44554354494F4E00000000FFFFFFFFFFFFFFFF01
        000000000000000F57617272616E7479205265706F72741146524D5754525353
        4F57415252414E5459FFFFFFFFFFFF}
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
    Top = 201
    Width = 442
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      442
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
      Left = 357
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
