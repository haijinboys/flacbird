object GetInfoForm: TGetInfoForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #12503#12525#12497#12486#12451
  ClientHeight = 449
  ClientWidth = 417
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
  object OKButton: TButton
    Left = 328
    Top = 416
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object ListView: TListView
    Left = 8
    Top = 8
    Width = 401
    Height = 401
    Columns = <
      item
        Caption = #12503#12525#12497#12486#12451
        Width = 160
      end
      item
        Caption = #20516
        Width = 200
      end>
    HideSelection = False
    MultiSelect = True
    GroupView = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object ActionList: TActionList
    Left = 8
    Top = 8
    object EditCopyAction: TAction
      Category = 'Edit'
      Caption = 'EditCopyAction'
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
      OnUpdate = EditCopyActionUpdate
    end
    object EditSelectAllAction: TAction
      Category = 'Edit'
      Caption = 'EditSelectAllAction'
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
      OnUpdate = EditSelectAllActionUpdate
    end
  end
end
