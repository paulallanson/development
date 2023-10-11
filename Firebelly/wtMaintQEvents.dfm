object frmWTMaintQEvents: TfrmWTMaintQEvents
  Left = 213
  Top = 86
  Caption = 'Event details'
  ClientHeight = 338
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 292
    Width = 337
    Height = 46
    Align = alBottom
    ParentBackground = False
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
      Font.Name = 'Segoe UI'
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
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 11
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 73
    Align = alTop
    ParentBackground = False
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
      Date = 38114.000000000000000000
      Time = 0.892242361107491900
      TabOrder = 1
    end
    object dtpckTime: TDateTimePicker
      Left = 231
      Top = 40
      Width = 82
      Height = 21
      Date = 38114.000000000000000000
      Time = 0.892714699082716800
      Kind = dtkTime
      TabOrder = 2
      Visible = False
    end
  end
  object pnldetails: TPanel
    Left = 0
    Top = 73
    Width = 337
    Height = 219
    Align = alClient
    Caption = 'pnldetails'
    ParentBackground = False
    TabOrder = 2
    object memDetails: TMemo
      Left = 1
      Top = 1
      Width = 335
      Height = 217
      Align = alClient
      TabOrder = 0
      OnChange = EnableOK
    end
  end
end
