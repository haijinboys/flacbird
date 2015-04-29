object OrganizeFolderForm: TOrganizeFolderForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #12501#12457#12523#12480#12434#25972#29702
  ClientHeight = 449
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OutputFolderLabel: TLabel
    Left = 8
    Top = 264
    Width = 56
    Height = 13
    Caption = #20986#21147#20808'(&O):'
    FocusControl = OutputFolderEdit
  end
  object FormatLabel: TLabel
    Left = 8
    Top = 8
    Width = 42
    Height = 13
    Caption = #24418#24335'(&F):'
    FocusControl = FormatEdit
  end
  object PreviewLabel: TLabel
    Left = 8
    Top = 312
    Width = 62
    Height = 13
    Caption = #12503#12524#12499#12517#12540'(&P):'
    FocusControl = ListBox
  end
  object OutputFolderEdit: TEdit
    Left = 8
    Top = 280
    Width = 393
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object OutputFolderButton: TButton
    Left = 404
    Top = 280
    Width = 21
    Height = 21
    Action = OutputFolderAction
    TabOrder = 7
  end
  object FormatEdit: TEdit
    Left = 8
    Top = 24
    Width = 393
    Height = 21
    TabOrder = 0
    OnChange = FormatEditChange
  end
  object FormatButton: TButton
    Left = 404
    Top = 24
    Width = 21
    Height = 21
    Action = FormatAction
    TabOrder = 1
    TabStop = False
  end
  object OKButton: TButton
    Left = 256
    Top = 416
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 9
  end
  object CancelButton: TButton
    Left = 344
    Top = 416
    Width = 81
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 10
  end
  object ListBox: TListBox
    Left = 8
    Top = 328
    Width = 417
    Height = 81
    TabStop = False
    Style = lbVirtual
    ItemHeight = 13
    TabOrder = 8
    OnData = ListBoxData
  end
  object ListView: TListView
    Left = 8
    Top = 56
    Width = 345
    Height = 201
    Columns = <
      item
        Width = 320
      end>
    ColumnClick = False
    DoubleBuffered = True
    HideSelection = False
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    ShowColumnHeaders = False
    TabOrder = 2
    ViewStyle = vsReport
    OnClick = ListViewClick
    OnData = ListViewData
    OnSelectItem = ListViewSelectItem
  end
  object AddButton: TButton
    Left = 360
    Top = 56
    Width = 65
    Height = 25
    Action = AddAction
    TabOrder = 3
  end
  object DeleteButton: TButton
    Left = 360
    Top = 88
    Width = 65
    Height = 25
    Action = DeleteAction
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 360
    Top = 120
    Width = 65
    Height = 25
    Action = ClearAction
    TabOrder = 5
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 8
    Top = 8
  end
  object ActionList: TActionList
    Left = 40
    Top = 8
    object FormatAction: TAction
      Caption = '>'
      OnExecute = FormatActionExecute
    end
    object OutputFolderAction: TAction
      Caption = '...'
      OnExecute = OutputFolderActionExecute
    end
    object AddAction: TAction
      Caption = #36861#21152
      OnExecute = AddActionExecute
    end
    object DeleteAction: TAction
      Caption = #21066#38500
      OnExecute = DeleteActionExecute
    end
    object ClearAction: TAction
      Caption = #12463#12522#12450
      OnExecute = ClearActionExecute
    end
  end
  object DragDropTarget: TDragDropTarget
    Target = ListView
    OnDragDropFiles = DragDropTargetDragDropFiles
    Left = 72
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Filter = #12377#12409#12390#12398#12501#12449#12452#12523' (*.*)|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 104
    Top = 8
  end
end
