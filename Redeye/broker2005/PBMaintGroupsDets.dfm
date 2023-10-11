object PBMaintGroupsDetsFrm: TPBMaintGroupsDetsFrm
  Left = 274
  Top = 185
  BorderStyle = bsDialog
  Caption = 'PBMaintGroupsDetsFrm'
  ClientHeight = 170
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    419
    170)
  TextHeight = 13
  object DeleteLabel: TLabel
    Left = 134
    Top = 137
    Width = 92
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete Details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 254
    Top = 131
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 334
    Top = 131
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object DetsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 113
    Caption = 'Details'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object edtDescription: TEdit
      Left = 94
      Top = 16
      Width = 257
      Height = 21
      MaxLength = 40
      TabOrder = 0
      OnChange = edtDescriptionChange
    end
    object pnlCommission: TPanel
      Left = 2
      Top = 74
      Width = 397
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label3: TLabel
        Left = 14
        Top = 12
        Width = 55
        Height = 13
        Caption = 'Commission'
      end
      object MemoCommRt: TMemo
        Left = 91
        Top = 8
        Width = 75
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
        WordWrap = False
        OnKeyPress = CheckKeyIsNumber
      end
    end
    object pnlColor: TPanel
      Left = 2
      Top = 40
      Width = 397
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label2: TLabel
        Left = 14
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Colour'
      end
      object edtColor: TEdit
        Left = 92
        Top = 8
        Width = 131
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 0
        Text = 'Sample Text'
      end
      object Button1: TButton
        Left = 232
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Colour'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 314
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Font'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 360
    Top = 59
  end
end
