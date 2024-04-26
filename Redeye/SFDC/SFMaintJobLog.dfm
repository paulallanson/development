object SFMaintJobLogFrm: TSFMaintJobLogFrm
  Left = 234
  Top = 72
  Caption = 'Job Time Record'
  ClientHeight = 557
  ClientWidth = 744
  Color = clBtnFace
  Constraints.MaxHeight = 800
  Constraints.MaxWidth = 780
  Constraints.MinHeight = 595
  Constraints.MinWidth = 730
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 502
    Width = 744
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object lblDelete: TLabel
      Left = 134
      Top = 13
      Width = 109
      Height = 13
      Caption = 'Delete these details ?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 280
      Top = 7
      Width = 75
      Height = 24
      Caption = 'Save'
      Enabled = False
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
      Left = 384
      Top = 7
      Width = 75
      Height = 24
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 142
    Align = alTop
    TabOrder = 0
    OnEnter = pnlHeaderEnter
    object Label8: TLabel
      Left = 32
      Top = 20
      Width = 63
      Height = 13
      Caption = 'Activity Date'
    end
    object Label4: TLabel
      Left = 32
      Top = 84
      Width = 61
      Height = 13
      Caption = 'Department'
    end
    object Label5: TLabel
      Left = 32
      Top = 115
      Width = 38
      Height = 13
      Caption = 'Process'
    end
    object Label33: TLabel
      Left = 32
      Top = 52
      Width = 70
      Height = 13
      Caption = 'Employee No.'
    end
    object lblEmployeeName: TLabel
      Left = 295
      Top = 52
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object edtActivityDate: TEdit
      Left = 120
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
      OnExit = edtActivityDateExit
    end
    object btnActivityDate: TBitBtn
      Left = 224
      Top = 14
      Width = 25
      Height = 25
      Hint = 'select activity date'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      TabOrder = 1
      TabStop = False
      OnClick = btnActivityDateClick
    end
    object dblkpDepartment: TDBLookupComboBox
      Left = 120
      Top = 80
      Width = 145
      Height = 21
      KeyField = 'Process_Group'
      ListField = 'Process_Group_Description'
      ListSource = dtmdlJobBagLog.dtsProcessGroup
      TabOrder = 5
      OnClick = dblkpDepartmentClick
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 120
      Top = 111
      Width = 225
      Height = 21
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtmdlJobBagLog.dtsProcess
      TabOrder = 6
      OnClick = dblkpProcessClick
    end
    object edtEmployeeNo: TEdit
      Left = 120
      Top = 48
      Width = 89
      Height = 21
      TabOrder = 2
      OnChange = EnableOK
      OnExit = edtEmployeeNoExit
    end
    object edtEmployeeName: TEdit
      Left = 336
      Top = 48
      Width = 273
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object btnLUEmployee: TBitBtn
      Left = 224
      Top = 47
      Width = 25
      Height = 23
      Hint = 'Lookup employee'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = btnLUEmployeeClick
    end
  end
  object pnlJobBag: TPanel
    Left = 0
    Top = 142
    Width = 744
    Height = 65
    Align = alTop
    TabOrder = 1
    OnEnter = pnlHeaderEnter
    object Label3: TLabel
      Left = 275
      Top = 12
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Customer'
    end
    object lblJobBag: TLabel
      Left = 32
      Top = 12
      Width = 80
      Height = 13
      Caption = 'Job Bag/Activity'
    end
    object Label15: TLabel
      Left = 32
      Top = 43
      Width = 43
      Height = 13
      Caption = 'Job Title'
    end
    object edtCustomer: TEdit
      Left = 336
      Top = 8
      Width = 273
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtJobTitle: TEdit
      Left = 120
      Top = 35
      Width = 489
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object cmbJobBag: TComboBox
      Left = 120
      Top = 8
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = cmbJobBagChange
      OnExit = cmbJobBagExit
      OnKeyPress = cmbJobBagKeyPress
      Items.Strings = (
        'ABSENT'
        'ADMIN'
        'FULFILMENT')
    end
    object btnLUCustomer: TBitBtn
      Left = 616
      Top = 7
      Width = 25
      Height = 23
      Hint = 'Lookup customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      Visible = False
      OnClick = btnLUCustomerClick
    end
  end
  object pgTimeDetails: TPageControl
    Left = 0
    Top = 207
    Width = 744
    Height = 295
    ActivePage = tbsWorkCentre
    Align = alClient
    TabOrder = 2
    object tbsWorkCentre: TTabSheet
      Caption = 'Work Centre Details'
      TabVisible = False
      object Label23: TLabel
        Left = 29
        Top = 136
        Width = 52
        Height = 13
        Caption = 'Paper Size'
      end
      object Label24: TLabel
        Left = 352
        Top = 136
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Number Up'
      end
      object Label25: TLabel
        Left = 29
        Top = 167
        Width = 65
        Height = 13
        Caption = 'Laser Format'
      end
      object Label26: TLabel
        Left = 29
        Top = 106
        Width = 44
        Height = 13
        Caption = 'Quantity'
      end
      object Label27: TLabel
        Left = 29
        Top = 43
        Width = 65
        Height = 13
        Caption = 'Work Centre'
      end
      object Label28: TLabel
        Left = 29
        Top = 75
        Width = 53
        Height = 13
        Caption = 'Operation'
      end
      object Label30: TLabel
        Left = 29
        Top = 11
        Width = 47
        Height = 13
        Caption = 'Operator'
      end
      object pnlWCDets: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 193
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblPaperSize: TLabel
          Left = 29
          Top = 104
          Width = 52
          Height = 13
          Caption = 'Paper Size'
        end
        object lblNumberUp: TLabel
          Left = 367
          Top = 104
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Number Up'
        end
        object lblFormat: TLabel
          Left = 29
          Top = 135
          Width = 65
          Height = 13
          Caption = 'Laser Format'
        end
        object Label10: TLabel
          Left = 29
          Top = 74
          Width = 44
          Height = 13
          Caption = 'Quantity'
        end
        object Label11: TLabel
          Left = 29
          Top = 43
          Width = 53
          Height = 13
          Caption = 'Operation'
        end
        object Label9: TLabel
          Left = 599
          Top = 167
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = 'Machine Hours'
        end
        object Label6: TLabel
          Left = 29
          Top = 11
          Width = 44
          Height = 13
          Caption = 'Machine'
        end
        object Label34: TLabel
          Left = 29
          Top = 166
          Width = 79
          Height = 13
          Caption = 'Start Date/Time'
        end
        object Label35: TLabel
          Left = 253
          Top = 166
          Width = 86
          Height = 13
          Caption = 'Finish Date/Time'
        end
        object Label2: TLabel
          Left = 466
          Top = 167
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Labour Hours'
        end
        object dblkpProcessPaper: TDBLookupComboBox
          Left = 117
          Top = 100
          Width = 145
          Height = 21
          KeyField = 'Paper_Size'
          ListField = 'Short_Description'
          ListSource = dtmdlJobBagLog.dtsProcessPaper
          TabOrder = 3
          OnClick = EnableOK
        end
        object cmbFormat: TComboBox
          Left = 117
          Top = 131
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 5
          OnClick = EnableOK
          OnKeyPress = cmbFormatKeyPress
          Items.Strings = (
            'Simplex'
            'Duplex')
        end
        object edtQuantity: TEdit
          Left = 117
          Top = 70
          Width = 97
          Height = 21
          TabOrder = 2
          OnChange = EnableOK
          OnKeyPress = edtJobbagKeyPress
        end
        object spnNumberUp: TSpinEdit
          Left = 444
          Top = 99
          Width = 64
          Height = 22
          MaxValue = 99
          MinValue = 1
          TabOrder = 4
          Value = 1
        end
        object dblkpWorkCentre: TDBLookupComboBox
          Left = 117
          Top = 7
          Width = 145
          Height = 21
          KeyField = 'Work_Centre'
          ListField = 'Work_Centre_Name'
          ListSource = dtmdlJobBagLog.dtsProcessGrpWC
          TabOrder = 0
          OnClick = EnableOK
        end
        object dblkpOperation: TDBLookupComboBox
          Left = 117
          Top = 39
          Width = 257
          Height = 21
          KeyField = 'Operation'
          ListField = 'Operation_Description'
          ListSource = dtmdlJobBagLog.dtsProcessOps
          TabOrder = 1
          OnClick = EnableOK
        end
        object edtMachineHrs: TEdit
          Left = 685
          Top = 163
          Width = 52
          Height = 21
          TabOrder = 11
          OnChange = EnableOK
          OnKeyPress = edtLabourHrsKeyPress
        end
        object edtStartTime: TMaskEdit
          Left = 189
          Top = 162
          Width = 45
          Height = 21
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 7
          Text = '  :  '
          OnExit = edtFinishTimeExit
        end
        object edtFinishTime: TMaskEdit
          Left = 413
          Top = 162
          Width = 45
          Height = 21
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 9
          Text = '  :  '
          OnExit = edtFinishTimeExit
        end
        object edtLabourHrs: TEdit
          Left = 541
          Top = 163
          Width = 52
          Height = 21
          TabOrder = 10
          OnChange = EnableOK
          OnKeyPress = edtLabourHrsKeyPress
        end
        object edtStartDate: TEdit
          Left = 117
          Top = 162
          Width = 68
          Height = 21
          TabStop = False
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 6
          OnChange = edtFinishTimeExit
        end
        object edtFinishDate: TEdit
          Left = 341
          Top = 162
          Width = 68
          Height = 21
          TabOrder = 8
          OnExit = edtFinishDateExit
        end
      end
      object pnlWorkCentre: TPanel
        Left = 0
        Top = 193
        Width = 736
        Height = 92
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlUnassWCOperatorsList: TPanel
          Left = 386
          Top = 0
          Width = 350
          Height = 92
          Align = alRight
          TabOrder = 0
          object pnlWCOperatorsTop: TPanel
            Left = 1
            Top = 1
            Width = 348
            Height = 24
            Align = alTop
            Caption = 'Unassigned Assistants'
            TabOrder = 0
          end
          object pnlWCOperatorsBottom: TPanel
            Left = 1
            Top = 62
            Width = 348
            Height = 29
            Align = alBottom
            TabOrder = 1
            object Label14: TLabel
              Left = 8
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Search'
            end
            object edtSearch: TEdit
              Left = 48
              Top = 2
              Width = 105
              Height = 21
              TabStop = False
              TabOrder = 0
              OnChange = edtSearchChange
            end
            object chkbxViewAll: TCheckBox
              Left = 168
              Top = 8
              Width = 105
              Height = 17
              TabStop = False
              Caption = 'View All Operators'
              TabOrder = 1
              OnClick = chkbxViewAllClick
            end
          end
          object dblkpWCOperators: TDBLookupListBox
            Left = 1
            Top = 25
            Width = 348
            Height = 30
            Align = alClient
            KeyField = 'Work_Centre_Operator'
            ListField = 'Name'
            ListSource = dtmdlJobBagLog.dtsWCOperators
            TabOrder = 2
            TabStop = False
            OnDblClick = dblkpWCOperatorsDblClick
          end
        end
        object pnlWCOperatorsCenter: TPanel
          Left = 350
          Top = 0
          Width = 36
          Height = 92
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
        object pnlAssWCOperatorList: TPanel
          Left = 0
          Top = 0
          Width = 350
          Height = 92
          Align = alLeft
          TabOrder = 2
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 348
            Height = 24
            Align = alTop
            Caption = 'Assigned Assistants'
            TabOrder = 0
          end
          object lstbxWCAssistants: TListBox
            Left = 1
            Top = 25
            Width = 348
            Height = 66
            Align = alClient
            ItemHeight = 13
            TabOrder = 1
            OnDblClick = lstbxWCAssistantsDblClick
          end
          object lstbxWCAssistantsCode: TListBox
            Left = 216
            Top = 24
            Width = 57
            Height = 97
            ItemHeight = 13
            TabOrder = 2
            Visible = False
          end
        end
      end
    end
    object tbsNonWorkCentre: TTabSheet
      Caption = 'Manual Time Details'
      ImageIndex = 1
      TabVisible = False
      object sgManDetails: TStringGrid
        Left = 0
        Top = 25
        Width = 736
        Height = 260
        Align = alClient
        ColCount = 4
        DefaultColWidth = 30
        DefaultRowHeight = 20
        TabOrder = 0
        OnClick = sgManDetailsClick
        OnDrawCell = sgManDetailsDrawCell
        OnKeyPress = sgWCDetailsKeyPress
        OnSelectCell = sgManDetailsSelectCell
        ExplicitWidth = 744
        ExplicitHeight = 264
        ColWidths = (
          30
          241
          88
          86)
      end
      object pnlManDetsTop: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 744
        object Label12: TLabel
          Left = 8
          Top = 5
          Width = 82
          Height = 13
          Caption = 'Activities/Times'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object cmbManOvertime: TComboBox
        Left = 472
        Top = 76
        Width = 145
        Height = 21
        TabOrder = 2
        Visible = False
        OnChange = cmbManOvertimeChange
        OnEnter = cmbManOvertimeEnter
        OnExit = cmbManOvertimeExit
        OnKeyPress = cmbManOvertimeKeyPress
        Items.Strings = (
          '0.00'
          '0.25'
          '0.50'
          '0.75'
          '1.00'
          '1.25'
          '1.50'
          '1.75'
          '2.00'
          '2.25'
          '2.50'
          '2.75'
          '3.00'
          '3.25'
          '3.50'
          '3.75'
          '4.00'
          '4.25'
          '4.50'
          '4.75'
          '5.00'
          '5.25'
          '5.50'
          '5.75'
          '6.00'
          '6.25'
          '6.50'
          '6.75'
          '7.00'
          '7.25'
          '7.50'
          '7.75'
          '8.00'
          '8.25'
          '8.50'
          '8.75'
          '9.00'
          '9.25'
          '9.50'
          '9.75'
          '10.00'
          '10.25'
          '10.50'
          '10.75'
          '11.00'
          '11.25'
          '11.50'
          '11.75'
          '12.00'
          '12.25'
          '12.50'
          '12.75'
          '13.00'
          '13.25'
          '13.50'
          '13.75'
          '14.00'
          '14.25'
          '14.50'
          '14.75'
          '15.00'
          '15.00'
          '15.25'
          '15.50'
          '15.75'
          '16.00'
          '16.25'
          '16.50'
          '16.75'
          '17.00'
          '17.25'
          '17.50'
          '17.75'
          '18.00'
          '18.25'
          '18.50'
          '18.75'
          '19.00'
          '19.25'
          '19.50'
          '19.75'
          '20.00'
          '20.25'
          '20.50'
          '20.75'
          '21.00'
          '21.25'
          '21.50'
          '21.75'
          '22.00'
          '22.25'
          '22.50'
          '22.75'
          '23.00'
          '23.25'
          '23.50'
          '23.75'
          '24.00')
      end
      object cmbManTime: TComboBox
        Left = 280
        Top = 80
        Width = 145
        Height = 21
        TabOrder = 3
        Visible = False
        OnChange = cmbManTimeChange
        OnEnter = cmbManEnter
        OnExit = cmbManExit
        OnKeyPress = cmbManKeyPress
        Items.Strings = (
          '0.00'
          '0.25'
          '0.50'
          '0.75'
          '1.00'
          '1.25'
          '1.50'
          '1.75'
          '2.00'
          '2.25'
          '2.50'
          '2.75'
          '3.00'
          '3.25'
          '3.50'
          '3.75'
          '4.00'
          '4.25'
          '4.50'
          '4.75'
          '5.00'
          '5.25'
          '5.50'
          '5.75'
          '6.00'
          '6.25'
          '6.50'
          '6.75'
          '7.00'
          '7.25'
          '7.50'
          '7.75'
          '8.00'
          '8.25'
          '8.50'
          '8.75'
          '9.00'
          '9.25'
          '9.50'
          '9.75'
          '10.00'
          '10.25'
          '10.50'
          '10.75'
          '11.00'
          '11.25'
          '11.50'
          '11.75'
          '12.00'
          '12.25'
          '12.50'
          '12.75'
          '13.00'
          '13.25'
          '13.50'
          '13.75'
          '14.00'
          '14.25'
          '14.50'
          '14.75'
          '15.00'
          '15.00'
          '15.25'
          '15.50'
          '15.75'
          '16.00'
          '16.25'
          '16.50'
          '16.75'
          '17.00'
          '17.25'
          '17.50'
          '17.75'
          '18.00'
          '18.25'
          '18.50'
          '18.75'
          '19.00'
          '19.25'
          '19.50'
          '19.75'
          '20.00'
          '20.25'
          '20.50'
          '20.75'
          '21.00'
          '21.25'
          '21.50'
          '21.75'
          '22.00'
          '22.25'
          '22.50'
          '22.75'
          '23.00'
          '23.25'
          '23.50'
          '23.75'
          '24.00')
      end
    end
    object tbsNonWorkCentreChange: TTabSheet
      Caption = 'tbsNonWorkCentreChange'
      ImageIndex = 3
      TabVisible = False
      object Label37: TLabel
        Left = 29
        Top = 11
        Width = 53
        Height = 13
        Caption = 'Operation'
      end
      object Label40: TLabel
        Left = 29
        Top = 47
        Width = 70
        Height = 13
        Caption = 'Labour Hours'
      end
      object Label32: TLabel
        Left = 29
        Top = 76
        Width = 80
        Height = 13
        Caption = 'Overtime Hours'
      end
      object dblkpManOperation: TDBLookupComboBox
        Left = 117
        Top = 7
        Width = 257
        Height = 21
        KeyField = 'Operation'
        ListField = 'Operation_Description'
        ListSource = dtmdlJobBagLog.dtsProcessOps
        TabOrder = 0
        OnClick = EnableOK
      end
      object cmbLabourHours: TComboBox
        Left = 117
        Top = 40
        Width = 84
        Height = 21
        TabOrder = 1
        OnExit = cmbLabourHoursExit
        OnKeyPress = cmbLabourHoursKeyPress
        Items.Strings = (
          '0.00'
          '0.25'
          '0.50'
          '0.75'
          '1.00'
          '1.25'
          '1.50'
          '1.75'
          '2.00'
          '2.25'
          '2.50'
          '2.75'
          '3.00'
          '3.25'
          '3.50'
          '3.75'
          '4.00'
          '4.25'
          '4.50'
          '4.75'
          '5.00'
          '5.25'
          '5.50'
          '5.75'
          '6.00'
          '6.25'
          '6.50'
          '6.75'
          '7.00'
          '7.25'
          '7.50'
          '7.75'
          '8.00'
          '8.25'
          '8.50'
          '8.75'
          '9.00'
          '9.25'
          '9.50'
          '9.75'
          '10.00'
          '10.25'
          '10.50'
          '10.75'
          '11.00'
          '11.25'
          '11.50'
          '11.75'
          '12.00'
          '12.25'
          '12.50'
          '12.75'
          '13.00'
          '13.25'
          '13.50'
          '13.75'
          '14.00'
          '14.25'
          '14.50'
          '14.75'
          '15.00'
          '15.00'
          '15.25'
          '15.50'
          '15.75'
          '16.00'
          '16.25'
          '16.50'
          '16.75'
          '17.00'
          '17.25'
          '17.50'
          '17.75'
          '18.00'
          '18.25'
          '18.50'
          '18.75'
          '19.00'
          '19.25'
          '19.50'
          '19.75'
          '20.00'
          '20.25'
          '20.50'
          '20.75'
          '21.00'
          '21.25'
          '21.50'
          '21.75'
          '22.00'
          '22.25'
          '22.50'
          '22.75'
          '23.00'
          '23.25'
          '23.50'
          '23.75'
          '24.00'
          '24.25'
          '24.50'
          '24.75')
      end
      object cmbOvertimeHours: TComboBox
        Left = 117
        Top = 72
        Width = 84
        Height = 21
        TabOrder = 2
        OnExit = cmbLabourHoursExit
        OnKeyPress = cmbLabourHoursKeyPress
        Items.Strings = (
          '0.00'
          '0.25'
          '0.50'
          '0.75'
          '1.00'
          '1.25'
          '1.50'
          '1.75'
          '2.00'
          '2.25'
          '2.50'
          '2.75'
          '3.00'
          '3.25'
          '3.50'
          '3.75'
          '4.00'
          '4.25'
          '4.50'
          '4.75'
          '5.00'
          '5.25'
          '5.50'
          '5.75'
          '6.00'
          '6.25'
          '6.50'
          '6.75'
          '7.00'
          '7.25'
          '7.50'
          '7.75'
          '8.00'
          '8.25'
          '8.50'
          '8.75'
          '9.00'
          '9.25'
          '9.50'
          '9.75'
          '10.00'
          '10.25'
          '10.50'
          '10.75'
          '11.00'
          '11.25'
          '11.50'
          '11.75'
          '12.00'
          '12.25'
          '12.50'
          '12.75'
          '13.00'
          '13.25'
          '13.50'
          '13.75'
          '14.00'
          '14.25'
          '14.50'
          '14.75'
          '15.00'
          '15.00'
          '15.25'
          '15.50'
          '15.75'
          '16.00'
          '16.25'
          '16.50'
          '16.75'
          '17.00'
          '17.25'
          '17.50'
          '17.75'
          '18.00'
          '18.25'
          '18.50'
          '18.75'
          '19.00'
          '19.25'
          '19.50'
          '19.75'
          '20.00'
          '20.25'
          '20.50'
          '20.75'
          '21.00'
          '21.25'
          '21.50'
          '21.75'
          '22.00'
          '22.25'
          '22.50'
          '22.75'
          '23.00'
          '23.25'
          '23.50'
          '23.75'
          '24.00'
          '24.25'
          '24.50'
          '24.75')
      end
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 538
    Width = 744
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object tmrSearch: TTimer
    Interval = 500
    OnTimer = tmrSearchTimer
    Left = 444
    Top = 210
  end
end
