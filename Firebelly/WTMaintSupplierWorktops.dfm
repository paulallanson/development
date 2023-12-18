object frmWTMaintSupplierWorktops: TfrmWTMaintSupplierWorktops
  Left = 285
  Top = 54
  Caption = 'Add Worktop Colours'
  ClientHeight = 561
  ClientWidth = 634
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 542
    Width = 634
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 500
    Width = 634
    Height = 42
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      634
      42)
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 461
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Constraints.MinHeight = 25
      Constraints.MinWidth = 75
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 555
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      Constraints.MinHeight = 25
      Constraints.MinWidth = 75
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 368
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'S&weep'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object edtSearch: TEdit
      Left = 64
      Top = 11
      Width = 145
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
  end
  object pnlDetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 634
    Height = 81
    Align = alTop
    TabOrder = 0
    DesignSize = (
      634
      81)
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 67
      Height = 13
      Caption = 'Material Type:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 304
      Top = 16
      Width = 29
      Height = 13
      Caption = 'Group'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnClearGroup: TSpeedButton
      Left = 507
      Top = 11
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnClearGroupClick
    end
    object dblkpMaterialType: TDBLookupComboBox
      Left = 96
      Top = 12
      Width = 145
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      TabOrder = 0
      OnClick = dblkpMaterialTypeClick
    end
    object dblkpGroup: TDBLookupComboBox
      Left = 352
      Top = 12
      Width = 145
      Height = 21
      KeyField = 'Worktop_Group'
      ListField = 'Worktop_Group_Description'
      TabOrder = 1
      OnClick = dblkpGroupClick
    end
    object chkbxShowInactive: TCheckBox
      Left = 352
      Top = 46
      Width = 177
      Height = 17
      Caption = 'Show Inactive Worktops'
      TabOrder = 2
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 81
    Width = 634
    Height = 419
    Align = alClient
    DataSource = dtmdlSuppliers.dtsWorktops
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Worktop_Group_Description'
        Title.Caption = 'Group'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Worktop_Description'
        Title.Caption = 'Colour'
        Width = 328
        Visible = True
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 264
    Top = 147
  end
end
