object FtpForm: TFtpForm
  Left = 247
  Top = 129
  BorderStyle = bsDialog
  Caption = 'FTP'
  ClientHeight = 453
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Local Host:'
  end
  object Label2: TLabel
    Left = 324
    Top = 8
    Width = 65
    Height = 13
    Caption = 'Remote Host:'
  end
  object Label5: TLabel
    Left = 436
    Top = 388
    Width = 69
    Height = 13
    Caption = 'Transfer Mode'
  end
  object StatusWindow: TMemo
    Left = 0
    Top = 408
    Width = 629
    Height = 45
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Localpanel: TPanel
    Left = 4
    Top = 28
    Width = 309
    Height = 345
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Directory'
    end
    object LocalDirEdit: TEdit
      Left = 60
      Top = 4
      Width = 193
      Height = 21
      TabOrder = 0
      OnExit = LocalDirEditExit
      OnKeyPress = LocalDirEditKeyPress
    end
    object LocalDirs: TListView
      Left = 4
      Top = 32
      Width = 250
      Height = 113
      Columns = <
        item
          Caption = 'Directory Name'
          Width = 230
        end>
      ColumnClick = False
      ReadOnly = True
      SortType = stText
      TabOrder = 5
      ViewStyle = vsReport
      OnDblClick = LocalDirsDblClick
    end
    object LocalFiles: TListView
      Left = 4
      Top = 144
      Width = 250
      Height = 197
      Columns = <
        item
          Caption = 'File Name'
          Width = 110
        end
        item
          Caption = 'Modified'
          Width = 75
        end
        item
          Alignment = taRightJustify
          Caption = 'Size'
        end>
      ColumnClick = False
      MultiSelect = True
      SortType = stText
      TabOrder = 6
      ViewStyle = vsReport
      OnEdited = LocalFilesEdited
    end
    object LCopyBtn: TButton
      Left = 258
      Top = 212
      Width = 45
      Height = 25
      Caption = 'Copy->'
      TabOrder = 2
      OnClick = LCopyBtnClick
    end
    object LDelBtn: TButton
      Left = 258
      Top = 237
      Width = 45
      Height = 25
      Caption = 'Delete'
      TabOrder = 3
      OnClick = LDelBtnClick
    end
    object LRenBtn: TButton
      Left = 258
      Top = 262
      Width = 45
      Height = 25
      Caption = 'Rename'
      TabOrder = 4
      OnClick = LRenBtnClick
    end
    object LChDirBtn: TButton
      Left = 258
      Top = 4
      Width = 45
      Height = 21
      Caption = 'ChDir'
      TabOrder = 1
      OnClick = LChDirBtnClick
    end
  end
  object Panel2: TPanel
    Left = 320
    Top = 28
    Width = 309
    Height = 345
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Directory'
    end
    object RemoteDirEdit: TEdit
      Left = 60
      Top = 4
      Width = 193
      Height = 21
      TabOrder = 0
      OnExit = RemoteDirEditExit
      OnKeyPress = RemoteDirEditKeyPress
    end
    object RemoteDirs: TListView
      Left = 4
      Top = 28
      Width = 250
      Height = 117
      Columns = <
        item
          Caption = 'Directory Name'
          Width = 230
        end>
      ColumnClick = False
      ReadOnly = True
      SortType = stText
      TabOrder = 5
      ViewStyle = vsReport
      OnDblClick = RemoteDirsDblClick
    end
    object RemoteFiles: TListView
      Left = 4
      Top = 144
      Width = 250
      Height = 197
      Columns = <
        item
          Caption = 'File Name'
          Width = 110
        end
        item
          Caption = 'Modified'
          Width = 75
        end
        item
          Alignment = taRightJustify
          Caption = 'Size'
        end>
      ColumnClick = False
      MultiSelect = True
      SortType = stText
      TabOrder = 6
      ViewStyle = vsReport
      OnEdited = RemoteFilesEdited
    end
    object RChDirBtn: TButton
      Left = 258
      Top = 4
      Width = 45
      Height = 21
      Caption = 'ChDir'
      TabOrder = 1
      OnClick = RChDirBtnClick
    end
    object RCopyBtn: TButton
      Left = 258
      Top = 212
      Width = 45
      Height = 25
      Caption = '<-Copy'
      TabOrder = 2
      OnClick = RCopyBtnClick
    end
    object RDelBtn: TButton
      Left = 258
      Top = 237
      Width = 45
      Height = 25
      Caption = 'Delete'
      TabOrder = 3
      OnClick = RDelBtnClick
    end
    object RRenBtn: TButton
      Left = 258
      Top = 262
      Width = 45
      Height = 25
      Caption = 'Rename'
      TabOrder = 4
      OnClick = RRenBtnClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 512
    Top = 376
    Width = 117
    Height = 29
    TabOrder = 3
    object AsciiXferBtn: TRadioButton
      Left = 8
      Top = 8
      Width = 49
      Height = 17
      Caption = 'Ascii'
      TabOrder = 0
      OnClick = AsciiXferBtnClick
    end
    object BinaryXferBtn: TRadioButton
      Left = 56
      Top = 8
      Width = 53
      Height = 17
      Caption = 'Binary'
      TabOrder = 1
      OnClick = BinaryXferBtnClick
    end
  end
  object Ftp: TApdFtpClient
    ConnectTimeout = 0
    FileType = ftBinary
    PassiveMode = False
    TransferTimeout = 1092
    OnFtpError = FtpFtpError
    OnFtpReply = FtpFtpReply
    OnFtpStatus = FtpFtpStatus
    LogName = 'APRO.LOG'
    TraceName = 'APRO.TRC'
    WsPort = 'ftp'
    Left = 14
    Top = 378
  end
end
