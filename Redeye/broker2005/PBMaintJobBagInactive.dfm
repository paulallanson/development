object PBMaintJobBagInactiveFrm: TPBMaintJobBagInactiveFrm
  Left = 395
  Top = 190
  BorderStyle = bsDialog
  Caption = 'Cancel Job Bag'
  ClientHeight = 194
  ClientWidth = 555
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
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 555
    Height = 47
    Align = alBottom
    TabOrder = 0
    object btnOK: TBitBtn
      Left = 202
      Top = 14
      Width = 75
      Height = 25
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
      Kind = bkOK
    end
    object BitBtn3: TBitBtn
      Left = 290
      Top = 14
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Job Bag:'
    end
    object lblJobBag: TLabel
      Left = 72
      Top = 16
      Width = 46
      Height = 13
      Caption = 'lblJobBag'
    end
    object lblDescription: TLabel
      Left = 200
      Top = 16
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object lblCustomer: TLabel
      Left = 72
      Top = 40
      Width = 54
      Height = 13
      Caption = 'lblCustomer'
    end
    object lblTitle: TLabel
      Left = 160
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Title:'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 555
    Height = 82
    Align = alClient
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 12
      Width = 37
      Height = 13
      Caption = 'Reason'
    end
    object lblDate: TLabel
      Left = 360
      Top = 12
      Width = 76
      Height = 13
      Caption = 'Date Cancelled:'
    end
    object lblOperator: TLabel
      Left = 360
      Top = 44
      Width = 65
      Height = 13
      Caption = 'Cancelled By:'
    end
    object dblkpReason: TDBLookupComboBox
      Left = 72
      Top = 8
      Width = 217
      Height = 21
      KeyField = 'InActive_Reason'
      ListField = 'Description'
      ListSource = srcReason
      TabOrder = 0
      OnClick = dblkpReasonClick
    end
    object BitBtn4: TBitBtn
      Left = 296
      Top = 6
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
      NumGlyphs = 2
    end
    object chkbxReactivate: TCheckBox
      Left = 16
      Top = 42
      Width = 145
      Height = 17
      Caption = 'Re-activate Job Bag'
      TabOrder = 2
    end
  end
  object qryReason: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Inactive_reason')
    Left = 104
    Top = 41
  end
  object srcReason: TDataSource
    DataSet = qryReason
    Left = 168
    Top = 41
  end
  object qryGetDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag.Job_Bag,'
      '        Job_Bag.InActive,'
      '        Job_Bag.InActive_Date,'
      '        Job_Bag.InActive_Reason,'
      '        Job_Bag.InActive_Operator,'
      '        Operator.Name as Operator_Name'
      'FROM Operator'
      '      RIGHT JOIN Job_Bag'
      '        ON Operator.Operator = Job_Bag.inactive_Operator'
      'WHERE Job_Bag = :Job_Bag')
    Left = 320
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryUpJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag'
      'set Inactive = :Inactive,'
      'Inactive_Date = :Inactive_Date,'
      'Inactive_Reason = :Inactive_Reason,'
      'Inactive_Operator = :Inactive_Operator'
      'where Job_Bag = :Job_Bag')
    Left = 400
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Inactive_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Inactive_Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
end
