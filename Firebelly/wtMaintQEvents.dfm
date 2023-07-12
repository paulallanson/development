object frmWTMaintQEvents: TfrmWTMaintQEvents
  Left = 213
  Top = 86
  Width = 353
  Height = 377
  Caption = 'Event details'
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
    ParentBackground = False
    Left = 0
    Top = 297
    Width = 345
    Height = 46
    Align = alBottom
    TabOrder = 0
    object lblDelete: TLabel
      Left = 32
      Top = 17
      Width = 110
      Height = 16
      Caption = 'Delete Record?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 160
      Top = 11
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 11
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 345
    Height = 73
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Operator'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object Label3: TLabel
      Left = 184
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Time'
      Visible = False
    end
    object edtOperator: TEdit
      Left = 56
      Top = 8
      Width = 169
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = 'edtOperator'
    end
    object dtpckDate: TDateTimePicker
      Left = 56
      Top = 40
      Width = 90
      Height = 21
      Date = 38114.892242361110000000
      Time = 38114.892242361110000000
      TabOrder = 1
    end
    object dtpckTime: TDateTimePicker
      Left = 231
      Top = 40
      Width = 82
      Height = 21
      Date = 38114.892714699080000000
      Time = 38114.892714699080000000
      Kind = dtkTime
      TabOrder = 2
      Visible = False
    end
  end
  object pnldetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 73
    Width = 345
    Height = 224
    Align = alClient
    Caption = 'pnldetails'
    TabOrder = 2
    object memDetails: TMemo
      Left = 1
      Top = 1
      Width = 343
      Height = 222
      Align = alClient
      TabOrder = 0
      OnChange = EnableOK
    end
  end
end
