object FindResultForm: TFindResultForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CD '#12398#26908#32034#32080#26524
  ClientHeight = 297
  ClientWidth = 537
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
  object FindResultLabel: TLabel
    Left = 8
    Top = 8
    Width = 436
    Height = 13
    Caption = #12371#12398' CD '#12395#19968#33268#12377#12427#12418#12398#12364#12458#12531#12521#12452#12531#12395#35079#25968#35211#12388#12363#12426#12414#12375#12383#12290#36969#20999#12394#12418#12398#12434' 1 '#12388#36984#25246#12375#12390#12367#12384#12373#12356#12290
  end
  object ListBox: TListBox
    Left = 8
    Top = 32
    Width = 521
    Height = 225
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBoxClick
    OnDblClick = ListBoxDblClick
  end
  object OKButton: TButton
    Left = 360
    Top = 264
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 448
    Top = 264
    Width = 81
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 2
  end
end
