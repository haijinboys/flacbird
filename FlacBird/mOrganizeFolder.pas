unit mOrganizeFolder;

{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, StdCtrls, ComCtrls, DragDrop, mCommon, mProgress;

resourcestring
  SFormatPopup01 = '%name%'#9'名前';
  SFormatPopup02 = '%artist%'#9'アーティスト';
  SFormatPopup03 = '%albumartist%'#9'アルバムアーティスト';
  SFormatPopup04 = '%album%'#9'アルバム';
  SFormatPopup05 = '%genre%'#9'ジャンル';
  SFormatPopup06 = '%tracknumber%'#9'トラック番号';
  SFormatPopup07 = '%year%'#9'年';

const
  FormatPopup: array [0 .. 6] of string = (
    SFormatPopup01,
    SFormatPopup02,
    SFormatPopup03,
    SFormatPopup04,
    SFormatPopup05,
    SFormatPopup06,
    SFormatPopup07
    );

type
  TOrganizeFolderForm = class(TForm)
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    FormatAction: TAction;
    OutputFolderAction: TAction;
    AddAction: TAction;
    DeleteAction: TAction;
    ClearAction: TAction;
    DragDropTarget: TDragDropTarget;
    OpenDialog: TOpenDialog;
    FormatLabel: TLabel;
    FormatEdit: TEdit;
    FormatButton: TButton;
    ListView: TListView;
    OutputFolderLabel: TLabel;
    OutputFolderEdit: TEdit;
    OutputFolderButton: TButton;
    PreviewLabel: TLabel;
    ListBox: TListBox;
    OKButton: TButton;
    CancelButton: TButton;
    AddButton: TButton;
    DeleteButton: TButton;
    ClearButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OutputFolderActionExecute(Sender: TObject);
    procedure FormatActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure DragDropTargetDragDropFiles(Sender: TWinControl; X, Y: Integer;
      Files: TStrings);
    procedure FormatEditChange(Sender: TObject);
    procedure ListViewClick(Sender: TObject);
    procedure ListViewData(Sender: TObject; Item: TListItem);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListBoxData(Control: TWinControl; Index: Integer;
      var Data: string);
  private
    { Private 宣言 }
    FList: TTrackList;
    procedure FormatMenuClick(Sender: TObject);
    procedure AddFile(AList: TTrackList; const AFileName: string);
    procedure AddFolder(AList: TTrackList; const AFolderName: string);
    procedure UpdateButton;
  protected
    { Protected 宣言 }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public 宣言 }
  end;

function OrganizeFolder(AOwner: TComponent; var AFormat: string;
  AList: TTrackList; var AOutputDir: string): Boolean;

var
  OrganizeFolderForm: TOrganizeFolderForm;

implementation

uses
  Types, Math, FileCtrl, mConsts, mMain;

{$R *.dfm}


function OrganizeFolder(AOwner: TComponent; var AFormat: string;
  AList: TTrackList; var AOutputDir: string): Boolean;
begin
  with TOrganizeFolderForm.Create(AOwner) do
    try
      FormatEdit.Text := AFormat;
      FList := AList;
      OutputFolderEdit.Text := AOutputDir;
      Result := ShowModal = mrOk;
      if Result then
      begin
        AOutputDir := OutputFolderEdit.Text;
        AFormat := FormatEdit.Text;
      end;
    finally
      Release;
    end;
end;

procedure TOrganizeFolderForm.FormCreate(Sender: TObject);
begin
  Font.Assign(FlacBirdForm.Font);
end;

procedure TOrganizeFolderForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TOrganizeFolderForm.FormShow(Sender: TObject);
begin
  UpdateButton;
end;

procedure TOrganizeFolderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TOrganizeFolderForm.OutputFolderActionExecute(Sender: TObject);
var
  S: string;
begin
  S := '';
  with OutputFolderEdit do
  begin
    if DirectoryExists2(Text) then
      S := Text;
    if SelectDirectory(SOutputFolder, '', S) then
      Text := IncludeTrailingPathDelimiter(S);
  end;
  UpdateButton;
end;

procedure TOrganizeFolderForm.FormatActionExecute(Sender: TObject);
var
  P: TPoint;
  I: NativeInt;
  MI: TMenuItem;
begin
  with FormatButton do
    P := Point(ClientOrigin.X + Width, Pred(ClientOrigin.Y));
  with PopupMenu do
  begin
    Items.Clear;
    for I := 0 to High(FormatPopup) do
    begin
      MI := TMenuItem.Create(Self);
      MI.Caption := FormatPopup[I];
      MI.OnClick := FormatMenuClick;
      Items.Add(MI);
    end;
    Popup(P.X, P.Y);
  end;
end;

procedure TOrganizeFolderForm.AddActionExecute(Sender: TObject);
var
  S: string;
begin
  if SelectDirectory(SAddFolder, '', S) then
  begin
    with FProgress do
      if not Visible then
        Show;
    AddFolder(FList, S);
    with FProgress do
      if Visible then
        Close;
  end;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  with ListBox do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateButton;
end;

procedure TOrganizeFolderForm.DeleteActionExecute(Sender: TObject);
var
  I: NativeInt;
  AList: TList;
  AItem: TListItem;
begin
  AList := TList.Create;
  try
    AItem := ListView.Selected;
    while AItem <> nil do
    begin
      AList.Add(Pointer(AItem.Index));
      AItem := ListView.GetNextItem(AItem, sdAll, [isSelected]);
    end;
    for I := AList.Count - 1 downto 0 do
      if InRange(NativeInt(AList[I]), 0, FList.Count - 1) then
        FList.Delete(NativeInt(AList[I]));
  finally
    AList.Free;
  end;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  with ListBox do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateButton;
end;

procedure TOrganizeFolderForm.ClearActionExecute(Sender: TObject);
begin
  FList.Clear;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  with ListBox do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateButton;
end;

procedure TOrganizeFolderForm.DragDropTargetDragDropFiles(Sender: TWinControl;
  X, Y: Integer; Files: TStrings);
var
  S: string;
begin
  SetForegroundWindow(Handle);
  for S in Files do
    if FileExists2(S) then
      AddFile(FList, S)
    else if DirectoryExists2(S) then
    begin
      with FProgress do
        if not Visible then
          Show;
      AddFolder(FList, S);
    end;
  with FProgress do
    if Visible then
      Close;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  with ListBox do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateButton;
end;

procedure TOrganizeFolderForm.ListViewClick(Sender: TObject);
begin
  UpdateButton;
end;

procedure TOrganizeFolderForm.ListViewData(Sender: TObject; Item: TListItem);
begin
  if FList = nil then
    Exit;
  with Item do
    if InRange(Index, 0, FList.Count - 1) then
      with FList[Index] do
        Caption := Location;
end;

procedure TOrganizeFolderForm.ListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
    UpdateButton;
end;

procedure TOrganizeFolderForm.ListBoxData(Control: TWinControl; Index: Integer;
  var Data: string);
var
  S: string;
  P: NativeInt;
begin
  if FList = nil then
    Exit;
  if InRange(Index, 0, FList.Count - 1) then
  begin
    with FList[Index] do
    begin
      S := FormatEdit.Text;
      S := StringReplace(S, '%name%', Name, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%artist%', Artist, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%albumartist%', AlbumArtist, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%album%', Album, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%genre%', Genre, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%tracknumber%', Format('%.2d', [Track]), [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%year%', Year, [rfReplaceAll, rfIgnoreCase]);
      S := Format('%s%s', [S, LowerCase(ExtractFileExt(Location))]);
      P := Pos('%', S);
      if P > 0 then
        S := Copy(S, 1, P - 1);
      Data := GetValidFileName(S);
    end;
  end;
end;

procedure TOrganizeFolderForm.FormatEditChange(Sender: TObject);
begin
  ListBox.Refresh;
  UpdateButton;
end;

procedure TOrganizeFolderForm.FormatMenuClick(Sender: TObject);
var
  S: string;
begin
  S := (Sender as TMenuItem).Caption;
  with FormatEdit do
    SelText := Copy(S, 0, Pred(Pos(#9, S)));
end;

procedure TOrganizeFolderForm.AddFile(AList: TTrackList;
  const AFileName: string);
var
  S: string;
  AItem: TTrackItem;
begin
  S := AFileName;
  if LowerCase(ExtractFileExt(S)) = '.lnk' then
    S := GetFileNameFromLink(S);
  S := ShortToLongFileName(ExpandFileName(S));
  if FileExists2(S) and (FExts.IndexOf(ExtractFileExt(S)) > -1) and (AList.Find(S) = nil) then
  begin
    if LowerCase(ExtractFileExt(S)) <> '.cue' then
    begin
      if FileExists2(ChangeFileExt(S, '.cue')) or FileExists2(S + '.cue') then
        Exit;
      AItem := TTrackItem.Create;
      with AItem do
      begin
        Location := S;
        LoadData(AItem);
      end;
      AList.Add(AItem);
    end;
  end;
end;

procedure TOrganizeFolderForm.AddFolder(AList: TTrackList;
  const AFolderName: string);
var
  S, Path: string;
  SR: TSearchRec;
begin
  S := IncludeTrailingPathDelimiter(AFolderName);
  if FindFirst(S + '*.*', faAnyFile, SR) = 0 then
  begin
    try
      repeat
        Application.ProcessMessages;
        if FProgress.Stop then
          Exit;
        if (SR.Attr and (faVolumeID or faDirectory or faSysFile)) = 0 then
        begin
          Path := S + SR.Name;
          if FExts.IndexOf(ExtractFileExt(Path)) > -1 then
          begin
            FProgress.Progress(SAddFolder, Format('%s: %s', [SProgress, SR.Name]), 0, True);
            AddFile(AList, Path);
          end;
        end;
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;
  if FindFirst(S + '*.*', faDirectory, SR) = 0 then
  begin
    try
      repeat
        if (SR.Name <> '.') and (SR.Name <> '..') then
          AddFolder(AList, S + SR.Name);
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;
end;

procedure TOrganizeFolderForm.UpdateButton;
begin
  with ListView do
  begin
    AddButton.Enabled := True;
    DeleteButton.Enabled := (Items.Count > 0) and (ItemIndex >= 0);
    ClearButton.Enabled := Items.Count > 0;
  end;
  OKButton.Enabled := (FormatEdit.Text <> '') and Assigned(FList) and
    (FList.Count > 0) and (OutputFolderEdit.Text <> '');
end;

procedure TOrganizeFolderForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

end.
