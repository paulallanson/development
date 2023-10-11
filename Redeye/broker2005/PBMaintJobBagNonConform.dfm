object PBMaintJobBagNonConformFrm: TPBMaintJobBagNonConformFrm
  Left = 150
  Top = 49
  Caption = 'Maintain Job bag Non Conformance Details'
  ClientHeight = 541
  ClientWidth = 805
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 797
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 97
    Align = alTop
    Enabled = False
    TabOrder = 0
    DesignSize = (
      805
      97)
    object labJobBagInfo: TLabel
      Left = 9
      Top = 15
      Width = 59
      Height = 13
      Caption = 'Job Bag No.'
    end
    object Label4: TLabel
      Left = 184
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object Label3: TLabel
      Left = 621
      Top = 15
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
    end
    object Label25: TLabel
      Left = 416
      Top = 15
      Width = 48
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Start Date'
    end
    object Label2: TLabel
      Left = 8
      Top = 42
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label5: TLabel
      Left = 574
      Top = 42
      Width = 85
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
    end
    object Label1: TLabel
      Left = 8
      Top = 69
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label6: TLabel
      Left = 638
      Top = 69
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Rep'
    end
    object edtJobBag: TEdit
      Left = 80
      Top = 11
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtDate: TEdit
      Left = 216
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object edtDateReq: TEdit
      Left = 701
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object edtStartDate: TEdit
      Left = 472
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edtCustomer: TEdit
      Left = 80
      Top = 38
      Width = 245
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 4
    end
    object edtDescription: TEdit
      Left = 80
      Top = 65
      Width = 441
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtAccountManager: TEdit
      Left = 669
      Top = 38
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 6
    end
    object edtRep: TEdit
      Left = 669
      Top = 65
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 7
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 522
    Width = 805
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 483
    Width = 805
    Height = 39
    Align = alBottom
    TabOrder = 2
    object Panel4: TPanel
      Left = 413
      Top = 1
      Width = 391
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        391
        37)
      object btnOK: TBitBtn
        Left = 212
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnOKClick
      end
      object btnCancel: TBitBtn
        Left = 300
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object sgDetails: TStringGrid
    Left = 0
    Top = 97
    Width = 720
    Height = 386
    Align = alClient
    ColCount = 10
    DefaultColWidth = 40
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 3
    OnDblClick = sgDetailsDblClick
    ColWidths = (
      40
      87
      88
      142
      119
      136
      136
      116
      99
      86)
  end
  object pnlFunctions: TPanel
    Left = 720
    Top = 97
    Width = 85
    Height = 386
    Align = alRight
    TabOrder = 4
    object btnAdd: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Add a new Works Instruction to this Job Bag'
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnChange: TBitBtn
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Hint = 'Change the selected Works Instruction'
      Caption = '&Change'
      Enabled = False
      TabOrder = 1
      OnClick = btnChangeClick
    end
    object btnDelete: TBitBtn
      Left = 8
      Top = 72
      Width = 75
      Height = 25
      Hint = 'Delete the selected Works Instruction from this Job Bag'
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
end
