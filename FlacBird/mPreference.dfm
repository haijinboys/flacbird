object PreferenceForm: TPreferenceForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #35373#23450
  ClientHeight = 297
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView: TTreeView
    Left = 8
    Top = 8
    Width = 161
    Height = 281
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnChange = TreeViewChange
  end
  object PageControl: TPageControl
    Left = 176
    Top = 0
    Width = 297
    Height = 257
    ActivePage = GeneralTabSheet
    Style = tsFlatButtons
    TabOrder = 1
    TabStop = False
    object GeneralTabSheet: TTabSheet
      Caption = #19968#33324
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GeneralLabel: TLabel
        Left = 0
        Top = 8
        Width = 24
        Height = 13
        Caption = #19968#33324
      end
      object GeneralBevel: TBevel
        Left = 32
        Top = 16
        Width = 257
        Height = 9
        Shape = bsTopLine
      end
      object GeneralFileFilterLabel: TLabel
        Left = 8
        Top = 152
        Width = 117
        Height = 13
        Caption = #35501#12415#36796#12416#12501#12449#12452#12523#12398#31278#39006':'
        FocusControl = GeneralFileFilterEdit
      end
      object GeneralPregapLabel: TLabel
        Left = 8
        Top = 116
        Width = 54
        Height = 13
        Caption = #12503#12522#12462#12515#12483#12503':'
        FocusControl = GeneralPregapSpinEdit
      end
      object GeneralGridLinesCheckBox: TCheckBox
        Left = 8
        Top = 32
        Width = 265
        Height = 17
        Caption = #12522#12473#12488#12499#12517#12540#12395#26684#23376#12434#34920#31034#12377#12427
        TabOrder = 0
      end
      object GeneralKeepFileTimeCheckBox: TCheckBox
        Left = 8
        Top = 56
        Width = 265
        Height = 17
        Caption = #12501#12449#12452#12523#12398#26356#26032#26085#26178#12434#32173#25345#12377#12427
        TabOrder = 1
      end
      object GeneralFileFilterEdit: TEdit
        Left = 8
        Top = 168
        Width = 265
        Height = 21
        TabOrder = 3
      end
      object GeneralPregapSpinEdit: TSpinEditEx
        Left = 64
        Top = 112
        Width = 65
        Height = 22
        MaxValue = 9999
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object GeneralSortByTrackCheckBox: TCheckBox
        Left = 8
        Top = 80
        Width = 265
        Height = 17
        Caption = #12488#12521#12483#12463#30058#21495#12434#20778#20808#12375#12390#20006#12409#26367#12360#12427
        TabOrder = 4
      end
    end
    object TagTabSheet: TTabSheet
      Caption = #12479#12464
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TagLabel: TLabel
        Left = 0
        Top = 8
        Width = 17
        Height = 13
        Caption = #12479#12464
      end
      object TagBevel: TBevel
        Left = 24
        Top = 16
        Width = 265
        Height = 9
        Shape = bsTopLine
      end
      object TagRemoveCheckBox: TCheckBox
        Left = 8
        Top = 32
        Width = 265
        Height = 17
        Caption = #19981#35201#12394#12479#12464#12434#21066#38500#12377#12427
        TabOrder = 0
      end
    end
    object MP4TabSheet: TTabSheet
      Caption = 'MP4'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MP4Bevel: TBevel
        Left = 64
        Top = 16
        Width = 225
        Height = 9
        Shape = bsTopLine
      end
      object MP4Label: TLabel
        Left = 0
        Top = 8
        Width = 54
        Height = 13
        Caption = 'AAC, ALAC'
      end
    end
    object FLACTabSheet: TTabSheet
      Caption = 'FLAC'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object FLACLabel: TLabel
        Left = 0
        Top = 8
        Width = 25
        Height = 13
        Caption = 'FLAC'
      end
      object FLACBevel: TBevel
        Left = 32
        Top = 16
        Width = 257
        Height = 9
        Shape = bsTopLine
      end
    end
    object MPEGTabSheet: TTabSheet
      Caption = 'MPEG'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MPEGBevel: TBevel
        Left = 64
        Top = 16
        Width = 225
        Height = 9
        Shape = bsTopLine
      end
      object MPEGLabel: TLabel
        Left = 0
        Top = 8
        Width = 57
        Height = 13
        Caption = 'MPEG Audio'
      end
      object MPEGWriteGroupBox: TGroupBox
        Left = 8
        Top = 32
        Width = 265
        Height = 81
        Caption = #26360#12365#36796#12415
        TabOrder = 0
        object MPEGWriteID3v1CheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'ID3v1'
          TabOrder = 0
        end
        object MPEGWriteID3v2CheckBox: TCheckBox
          Left = 16
          Top = 48
          Width = 105
          Height = 17
          Caption = 'ID3v2'
          TabOrder = 1
        end
        object MPEGWriteAPEv2CheckBox: TCheckBox
          Left = 144
          Top = 24
          Width = 105
          Height = 17
          Caption = 'APEv2'
          TabOrder = 2
        end
      end
      object MPEGRemoveGroupBox: TGroupBox
        Left = 8
        Top = 128
        Width = 265
        Height = 81
        Caption = #21066#38500
        TabOrder = 1
        object MPEGRemoveID3v1CheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'ID3v1'
          TabOrder = 0
        end
        object MPEGRemoveID3v2CheckBox: TCheckBox
          Left = 16
          Top = 48
          Width = 105
          Height = 17
          Caption = 'ID3v2'
          TabOrder = 1
        end
        object MPEGRemoveAPECheckBox: TCheckBox
          Left = 144
          Top = 24
          Width = 105
          Height = 17
          Caption = 'APE'
          TabOrder = 2
        end
      end
    end
    object APETabSheet: TTabSheet
      Caption = 'APE, MPC, WV'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object APEBevel: TBevel
        Left = 184
        Top = 16
        Width = 105
        Height = 9
        Shape = bsTopLine
      end
      object APELabel: TLabel
        Left = 0
        Top = 8
        Width = 179
        Height = 13
        Caption = 'Monkey'#39's Audio, Musepack, WavPack'
      end
      object APEWriteGroupBox: TGroupBox
        Left = 8
        Top = 32
        Width = 265
        Height = 57
        Caption = #26360#12365#36796#12415
        TabOrder = 0
        object APEWriteID3v1CheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'ID3v1'
          TabOrder = 0
        end
        object APEWriteAPEv2CheckBox: TCheckBox
          Left = 144
          Top = 24
          Width = 105
          Height = 17
          Caption = 'APEv2'
          TabOrder = 1
        end
      end
      object APERemoveGroupBox: TGroupBox
        Left = 8
        Top = 104
        Width = 265
        Height = 81
        Caption = #21066#38500
        TabOrder = 1
        object APERemoveID3v1CheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'ID3v1'
          TabOrder = 0
        end
        object APERemoveID3v2CheckBox: TCheckBox
          Left = 16
          Top = 48
          Width = 105
          Height = 17
          Caption = 'ID3v2'
          TabOrder = 1
        end
        object APERemoveAPECheckBox: TCheckBox
          Left = 144
          Top = 24
          Width = 105
          Height = 17
          Caption = 'APE'
          TabOrder = 2
        end
      end
    end
    object OGGTabSheet: TTabSheet
      Caption = 'OGG, OPUS'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object OGGLabel: TLabel
        Left = 0
        Top = 8
        Width = 61
        Height = 13
        Caption = 'Vorbis, Opus'
      end
      object OGGBevel: TBevel
        Left = 72
        Top = 16
        Width = 217
        Height = 9
        Shape = bsTopLine
      end
    end
    object WAVTabSheet: TTabSheet
      Caption = 'WAV'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WAVBevel: TBevel
        Left = 32
        Top = 16
        Width = 257
        Height = 9
        Shape = bsTopLine
      end
      object WAVLabel: TLabel
        Left = 0
        Top = 8
        Width = 21
        Height = 13
        Caption = 'PCM'
      end
      object WAVWriteGroupBox: TGroupBox
        Left = 8
        Top = 32
        Width = 265
        Height = 57
        Caption = #26360#12365#36796#12415
        TabOrder = 0
        object WAVWriteWAVCheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'RIFF'
          TabOrder = 0
        end
        object WAVWriteID3v2CheckBox: TCheckBox
          Left = 144
          Top = 24
          Width = 105
          Height = 17
          Caption = 'ID3v2'
          TabOrder = 1
        end
      end
      object WAVRemoveGroupBox: TGroupBox
        Left = 8
        Top = 104
        Width = 265
        Height = 57
        Caption = #21066#38500
        TabOrder = 1
        object WAVRemoveWAVCheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 105
          Height = 17
          Caption = 'RIFF'
          TabOrder = 0
        end
        object WAVRemoveID3v2CheckBox: TCheckBox
          Left = 144
          Top = 24
          Width = 105
          Height = 17
          Caption = 'ID3v2'
          TabOrder = 1
        end
      end
    end
    object WMATabSheet: TTabSheet
      Caption = 'WMA'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WMALabel: TLabel
        Left = 0
        Top = 8
        Width = 25
        Height = 13
        Caption = 'WMA'
      end
      object WMABevel: TBevel
        Left = 32
        Top = 16
        Width = 257
        Height = 9
        Shape = bsTopLine
      end
    end
    object CUETabSheet: TTabSheet
      Caption = 'CUE'
      ImageIndex = 10
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object CUELabel: TLabel
        Left = 0
        Top = 8
        Width = 20
        Height = 13
        Caption = 'CUE'
      end
      object CUEBevel: TBevel
        Left = 32
        Top = 16
        Width = 257
        Height = 9
        Shape = bsTopLine
      end
      object CUESaveBackupCheckBox: TCheckBox
        Left = 8
        Top = 32
        Width = 265
        Height = 17
        Caption = #12496#12483#12463#12450#12483#12503#12434#20445#23384#12377#12427
        TabOrder = 0
      end
      object CUEWritePerformerCheckBox: TCheckBox
        Left = 8
        Top = 56
        Width = 265
        Height = 17
        Caption = #12488#12521#12483#12463#12372#12392#12395' PERFORMER '#12434#26360#12365#36796#12416
        TabOrder = 1
      end
    end
    object ArtworkTabSheet: TTabSheet
      Caption = #12450#12540#12488#12527#12540#12463
      ImageIndex = 9
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ArtworkLabel: TLabel
        Left = 0
        Top = 8
        Width = 54
        Height = 13
        Caption = #12450#12540#12488#12527#12540#12463
      end
      object ArtworkBevel: TBevel
        Left = 64
        Top = 16
        Width = 225
        Height = 9
        Shape = bsTopLine
      end
      object ArtworkFormatLabel: TLabel
        Left = 8
        Top = 36
        Width = 28
        Height = 13
        Caption = #24418#24335':'
        FocusControl = ArtworkFormatComboBox
      end
      object ArtworkFileNameLabel: TLabel
        Left = 8
        Top = 92
        Width = 50
        Height = 13
        Caption = #12501#12449#12452#12523#21517':'
        FocusControl = ArtworkFileNameEdit
      end
      object ArtworkSaveToFileCheckBox: TCheckBox
        Left = 8
        Top = 64
        Width = 265
        Height = 17
        Caption = #30011#20687#12434#12501#12457#12523#12480#12395#20445#23384#12377#12427
        TabOrder = 1
        OnClick = ArtworkSaveToFileCheckBoxClick
      end
      object ArtworkUseLastfmCheckBox: TCheckBox
        Left = 8
        Top = 144
        Width = 265
        Height = 17
        Caption = 'Last.fm Web Services '#12434#20351#29992#12377#12427
        TabOrder = 3
      end
      object ArtworkSoundsLikeCheckBox: TCheckBox
        Left = 8
        Top = 120
        Width = 265
        Height = 17
        Caption = #12354#12356#12414#12356#26908#32034
        TabOrder = 2
      end
      object ArtworkFormatComboBox: TComboBox
        Left = 40
        Top = 32
        Width = 65
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'BMP'
          'PNG'
          'JPG'
          'GIF')
      end
      object ArtworkFileNameEdit: TEdit
        Left = 64
        Top = 88
        Width = 193
        Height = 21
        TabOrder = 4
      end
      object ArtworkFileNameButton: TButton
        Left = 260
        Top = 88
        Width = 21
        Height = 21
        Action = ArtworkFileNameAction
        TabOrder = 5
      end
    end
  end
  object OKButton: TButton
    Left = 296
    Top = 264
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 384
    Top = 264
    Width = 81
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 3
  end
  object ResetButton: TButton
    Left = 176
    Top = 264
    Width = 81
    Height = 25
    Caption = #12522#12475#12483#12488
    TabOrder = 4
    OnClick = ResetButtonClick
  end
  object ActionList: TActionList
    Left = 40
    Top = 8
    object ArtworkFileNameAction: TAction
      Caption = '>'
      OnExecute = ArtworkFileNameActionExecute
      OnUpdate = ArtworkFileNameActionUpdate
    end
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 8
    Top = 8
  end
end
