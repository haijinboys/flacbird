object ProgressForm: TProgressForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'ProgressForm'
  ClientHeight = 81
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressLabel: TLabel
    Left = 8
    Top = 16
    Width = 6
    Height = 13
    Caption = '*'
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 32
    Width = 377
    Height = 9
    Max = 1000
    TabOrder = 0
  end
  object StopButton: TButton
    Left = 304
    Top = 48
    Width = 81
    Height = 25
    Caption = #20013#27490'(&S)'
    TabOrder = 1
    OnClick = StopButtonClick
  end
end
