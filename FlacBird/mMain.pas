unit mMain;

{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ImgList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, xmldom, XMLIntf, msxmldom, XMLDoc,
  DragDrop, ToolWin, ComCtrls, MeryCtrls, ExtCtrls, StdCtrls, pngimage, jpeg,
  TagsLibrary, CUESheetFunctions, mCommon, mProgress;

type
  TFlacBirdForm = class(TForm)
    MainMenu: TMainMenu;
    FileMenuItem: TMenuItem;
    FileAddFileMenuItem: TMenuItem;
    FileAddFolderMenuItem: TMenuItem;
    N1: TMenuItem;
    FileSaveMenuItem: TMenuItem;
    N2: TMenuItem;
    FileExitMenuItem: TMenuItem;
    EditMenuItem: TMenuItem;
    EditCopyMenuItem: TMenuItem;
    EditDeleteMenuItem: TMenuItem;
    EditDeleteAllMenuItem: TMenuItem;
    N3: TMenuItem;
    EditSelectAllMenuItem: TMenuItem;
    EditSelectNoneMenuItem: TMenuItem;
    N4: TMenuItem;
    EditCheckAllMenuItem: TMenuItem;
    EditUncheckAllMenuItem: TMenuItem;
    N5: TMenuItem;
    EditPreferenceMenuItem: TMenuItem;
    AdvancedMenuItem: TMenuItem;
    AdvancedForceTrackNamesMenuItem: TMenuItem;
    AdvancedForceArtworkMenuItem: TMenuItem;
    N6: TMenuItem;
    AdvancedOrganizeFolderMenuItem: TMenuItem;
    HelpMenuItem: TMenuItem;
    HelpAboutMenuItem: TMenuItem;
    PopupMenu1: TPopupMenu;
    AdvancedGetTrackNamesPopupMenuItem: TMenuItem;
    AdvancedGetArtworkPopupMenuItem: TMenuItem;
    N7: TMenuItem;
    FileGetInfoPopupMenuItem: TMenuItem;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    ActionList: TActionList;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    OpenDialog: TOpenDialog;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    XMLDocument: TXMLDocument;
    DragDropTarget: TDragDropTarget;
    FileAction: TAction;
    FileAddFileAction: TAction;
    FileAddFolderAction: TAction;
    FileSaveAction: TAction;
    FileGetInfoAction: TAction;
    FileExitAction: TAction;
    EditAction: TAction;
    EditCopyAction: TAction;
    EditDeleteAction: TAction;
    EditDeleteAllAction: TAction;
    EditSelectAllAction: TAction;
    EditSelectNoneAction: TAction;
    EditCheckAllAction: TAction;
    EditUncheckAllAction: TAction;
    EditPreferenceAction: TAction;
    EditPrevAction: TAction;
    EditNextAction: TAction;
    AdvancedAction: TAction;
    AdvancedForceGetTrackNamesAction: TAction;
    AdvancedGetTrackNamesAction: TAction;
    AdvancedForceGetArtworkAction: TAction;
    AdvancedGetArtworkAction: TAction;
    AdvancedOrganizeFolderAction: TAction;
    HelpAction: TAction;
    HelpAboutAction: TAction;
    CoolBar: TCoolBarEx;
    MenuBar: TMenuBar;
    FileToolButton: TToolButton;
    EditToolButton: TToolButton;
    AdvancedToolButton: TToolButton;
    HelpToolButton: TToolButton;
    ToolBar: TToolBarEx;
    FileAddFolderToolButton: TToolButton;
    FileSaveToolButton: TToolButton;
    ToolButton1: TToolButton;
    AdvancedForceTrackNamesToolButton: TToolButton;
    AdvancedForceArtworkToolButton: TToolButton;
    ToolButton2: TToolButton;
    AdvancedOrganizeFolderToolButton: TToolButton;
    MainPanel: TPanel;
    Splitter: TSplitter;
    ScrollBox: TScrollBox;
    EditPanel: TPanel;
    NameLabel: TLabel;
    ArtistLabel: TLabel;
    AlbumArtistLabel: TLabel;
    AlbumLabel: TLabel;
    GenreLabel: TLabel;
    TrackNumberLabel: TLabel;
    YearLabel: TLabel;
    NameEdit: TEdit;
    ArtistEdit: TEdit;
    AlbumArtistEdit: TEdit;
    AlbumEdit: TEdit;
    GenreEdit: TEdit;
    TrackNumberEdit: TEdit;
    YearEdit: TEdit;
    ArtworkPanel: TPanel;
    ArtworkImage: TImage;
    EditPrevButton: TButton;
    EditNextButton: TButton;
    ArtworkLinkLabel: TLinkLabel;
    ListView: TListView;
    StatusBar: TStatusBar;
    AdvancedClearArtworkAction: TAction;
    AdvancedForceClearArtworkAction: TAction;
    AdvancedClearArtworkPopupMenuItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FileActionExecute(Sender: TObject);
    procedure FileAddFileActionExecute(Sender: TObject);
    procedure FileAddFileActionUpdate(Sender: TObject);
    procedure FileAddFolderActionExecute(Sender: TObject);
    procedure FileAddFolderActionUpdate(Sender: TObject);
    procedure FileSaveActionExecute(Sender: TObject);
    procedure FileSaveActionUpdate(Sender: TObject);
    procedure FileGetInfoActionExecute(Sender: TObject);
    procedure FileGetInfoActionUpdate(Sender: TObject);
    procedure FileExitActionExecute(Sender: TObject);
    procedure FileExitActionUpdate(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditCopyActionUpdate(Sender: TObject);
    procedure EditDeleteActionExecute(Sender: TObject);
    procedure EditDeleteActionUpdate(Sender: TObject);
    procedure EditDeleteAllActionExecute(Sender: TObject);
    procedure EditDeleteAllActionUpdate(Sender: TObject);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure EditSelectAllActionUpdate(Sender: TObject);
    procedure EditSelectNoneActionExecute(Sender: TObject);
    procedure EditSelectNoneActionUpdate(Sender: TObject);
    procedure EditCheckAllActionExecute(Sender: TObject);
    procedure EditCheckAllActionUpdate(Sender: TObject);
    procedure EditUncheckAllActionExecute(Sender: TObject);
    procedure EditUncheckAllActionUpdate(Sender: TObject);
    procedure EditPreferenceActionExecute(Sender: TObject);
    procedure EditPreferenceActionUpdate(Sender: TObject);
    procedure EditPrevActionExecute(Sender: TObject);
    procedure EditNextActionExecute(Sender: TObject);
    procedure EditPrevActionUpdate(Sender: TObject);
    procedure EditNextActionUpdate(Sender: TObject);
    procedure AdvancedActionExecute(Sender: TObject);
    procedure AdvancedForceGetTrackNamesActionExecute(Sender: TObject);
    procedure AdvancedForceGetTrackNamesActionUpdate(Sender: TObject);
    procedure AdvancedGetTrackNamesActionExecute(Sender: TObject);
    procedure AdvancedGetTrackNamesActionUpdate(Sender: TObject);
    procedure AdvancedForceGetArtworkActionExecute(Sender: TObject);
    procedure AdvancedForceGetArtworkActionUpdate(Sender: TObject);
    procedure AdvancedGetArtworkActionExecute(Sender: TObject);
    procedure AdvancedGetArtworkActionUpdate(Sender: TObject);
    procedure AdvancedForceClearArtworkActionExecute(Sender: TObject);
    procedure AdvancedForceClearArtworkActionUpdate(Sender: TObject);
    procedure AdvancedClearArtworkActionExecute(Sender: TObject);
    procedure AdvancedClearArtworkActionUpdate(Sender: TObject);
    procedure AdvancedOrganizeFolderActionExecute(Sender: TObject);
    procedure AdvancedOrganizeFolderActionUpdate(Sender: TObject);
    procedure HelpActionExecute(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
    procedure HelpAboutActionUpdate(Sender: TObject);
    procedure DragDropTargetDragDropFiles(Sender: TWinControl; X, Y: Integer;
      Files: TStrings);
    procedure EditPanelResize(Sender: TObject);
    procedure ArtworkLinkLabelLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure ListViewClick(Sender: TObject);
    procedure ListViewCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListViewCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ListViewData(Sender: TObject; Item: TListItem);
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private 宣言 }
    FRect: TRect;
    FMaximized: Boolean;
    FUserID: string;
    FFormat: string;
    FOutputDir: string;
    FList: TTrackList;
    FItem: TTrackItem;
    procedure ReadIni;
    procedure WriteIni;
    procedure AddFile(AList: TTrackList; const AFileName: string);
    procedure AddFolder(AList: TTrackList; const AFolderName: string);
    function GetUser: string;
    function BuildQuery(const ACmd, AQuery: string): string;
    procedure GetName(AForce: Boolean = False);
    procedure GetNameByToc(const AToc: string; APos, ALen: NativeInt; AForce: Boolean = False);
    procedure GetNameByTocBest(const AToc: string; APos, ALen: NativeInt);
    procedure GetNameByFetch(const AGNID: string; APos, ALen: NativeInt);
    procedure GetArtwork(AForce: Boolean = False);
    procedure GetArtworkByName(AArtist, AAlbum: string; APos, ALen: NativeInt);
    procedure ClearArtwork(AForce: Boolean = False);
    procedure ClearArtworkSub(APos, ALen: NativeInt);
    procedure ExecuteOrganizeFolder(AList: TTrackList);
    procedure UpdateActn;
    procedure UpdateEdit;
    procedure UpdateFont;
  public
    { Public 宣言 }
  end;

procedure LoadData(AItem: TTrackItem);
procedure SaveData(AItem: TTrackItem);
procedure LoadCUESheet(AList: TTrackList; const AFileName: string);
procedure SaveCUESheet(AList: TTrackList; APos: NativeInt);

var
  FlacBirdForm: TFlacBirdForm;
  FTags: TTags;
  FCUESheet: TCUESheet;

implementation

uses
  FileCtrl, StrUtils, Math, IniFiles, Themes, RegularExpressions, ShellAPI,
  Clipbrd, DBXJSON, GraphicEx, MediaInfoDLL, Gracenote, Lastfm, mConsts,
  mWICImageHelper, mPreference, mFindResult, mOrganizeFolder, mGetInfo, mAbout;

{$R *.dfm}


procedure LoadData(AItem: TTrackItem);
var
  I: NativeInt;
  W: TWICImage;
begin
  with AItem, FTags do
  begin
    if Kind = 'CUE' then
      Exit;
    if Modified < 0 then
    begin
      Name := '';
      Artist := '';
      AlbumArtist := '';
      Album := '';
      Genre := '';
      TrackNumber := '';
      Year := '';
    end;
    if Artwork.Modified < 0 then
      Artwork.Clear;
    LoadFromFile(Location);
    if Modified < 0 then
    begin
      Track := StrToIntDef(FTags.GetTag('TRACKNUMBER'), 0);
      Name := GetTag('TITLE');
      Artist := GetTag('ARTIST');
      AlbumArtist := GetTag('ALBUMARTIST');
      Album := GetTag('ALBUM');
      Genre := GetTag('GENRE');
      if Track > 0 then
        if GetTag('TOTALTRACKS') <> '' then
          TrackNumber := Format('%s/%s', [GetTag('TRACKNUMBER'), GetTag('TOTALTRACKS')])
        else
          TrackNumber := GetTag('TRACKNUMBER');
      Year := GetTag('YEAR');
    end;
    if Artwork.Modified < 0 then
      for I := 0 to CoverArtCount - 1 do
        with CoverArts[I] do
        begin
          Stream.Position := 0;
          W := TWICImage.Create;
          W.LoadFromStream(Stream);
          AItem.Artwork.Add(W);
        end;
  end;
end;

procedure SaveData(AItem: TTrackItem);
var
  S: string;
  B: Boolean;
  I, E: NativeInt;
  M: TMemoryStream;
  W: TWICImage;
  F: TFileStream;
  C, A, U: TFileTime;
begin
  with AItem, FTags do
  begin
    if Kind = 'CUE' then
      Exit;
    B := FOption.GeneralKeepFileTime;
    if B then
    begin
      F := TFileStream.Create(Location, fmOpenRead);
      try
        if not GetFileTime(F.Handle, @C, @A, @U) then
          B := False;
      finally
        F.Free;
      end;
    end;
    Clear;
    if Modified > 0 then
    begin
      if FOption.TagRemove then
      begin
        try
          RemoveTagsFromFile(Location, ttAutomatic);
        except
          //
        end;
      end
      else
      begin
        if SameText(Kind, 'MPEG Audio') then
        begin
          if FOption.MPEGRemoveID3v1 then
            RemoveTagsFromFile(Location, ttID3v1);
          if FOption.MPEGRemoveID3v2 then
            RemoveTagsFromFile(Location, ttID3v2);
          if FOption.MPEGRemoveAPE then
            RemoveTagsFromFile(Location, ttAPEv2);
        end
        else if SameText(Kind, 'Monkey''s Audio') or ContainsText(Kind, 'Musepack') or SameText(Kind, 'WavPack') then
        begin
          if FOption.APERemoveID3v1 then
            RemoveTagsFromFile(Location, ttID3v1);
          if FOption.APERemoveID3v2 then
            RemoveTagsFromFile(Location, ttID3v2);
          if FOption.APERemoveAPE then
            RemoveTagsFromFile(Location, ttAPEv2);
        end
        else if SameText(Kind, 'ADPCM') or SameText(Kind, 'PCM') then
        begin
          if FOption.WAVRemoveWAV then
            RemoveTagsFromFile(Location, ttWAV);
          if FOption.WAVRemoveID3v2 then
            RemoveTagsFromFile(Location, ttID3v2);
        end
      end;
      SetTag('TITLE', Name);
      SetTag('ARTIST', Artist);
      SetTag('ALBUMARTIST', AlbumArtist);
      SetTag('ALBUM', Album);
      SetTag('GENRE', Genre);
      SetTag('TRACKNUMBER', Copy(TrackNumber, 1, Pos('/', TrackNumber) - 1));
      SetTag('TOTALTRACKS', Copy(TrackNumber, Pos('/', TrackNumber) + 1, Length(TrackNumber)));
      SetTag('YEAR', Year);
    end
    else
      LoadFromFile(Location);
    if not((Kind = 'PCM') or (Kind = 'ADPCM')) then
    begin
      if Artwork.Count > 0 then
      begin
        DeleteAllCoverArts;
        if not FOption.ArtworkSaveToFile then
          for I := 0 to Artwork.Count - 1 do
          begin
            case FOption.ArtworkFormat of
              wifBmp:
                S := 'image/bmp';
              wifPng:
                S := 'image/png';
              wifJpeg:
                S := 'image/jpeg';
              wifGif:
                S := 'image/gif';
            else
              S := '';
            end;
            M := TMemoryStream.Create;
            W := TWICImage.Create;
            try
              W.Assign(Artwork[I]);
              W.ImageFormat := FOption.ArtworkFormat;
              W.SaveToStream(M);
              AddCoverArt('', M, S);
            finally
              W.Free;
              M.Free;
            end;
          end;
      end;
    end;
    if (Modified > 0) or (Artwork.Modified > 0) then
    begin
      if SameText(Kind, 'AAC') or SameText(Kind, 'ALAC') then
        E := SaveToFile(Location, ttMP4)
      else if SameText(Kind, 'FLAC') then
        E := SaveToFile(Location, ttFlac)
      else if SameText(Kind, 'MPEG Audio') then
      begin
        E := 0;
        if FOption.MPEGWriteID3v1 then
          Inc(E, SaveToFile(Location, ttID3v1));
        if FOption.MPEGWriteID3v2 then
          Inc(E, SaveToFile(Location, ttID3v2));
        if FOption.MPEGWriteAPEv2 then
          Inc(E, SaveToFile(Location, ttAPEv2));
      end
      else if SameText(Kind, 'Monkey''s Audio') or ContainsText(Kind, 'Musepack') or SameText(Kind, 'WavPack') then
      begin
        E := 0;
        if FOption.APEWriteID3v1 then
          Inc(E, SaveToFile(Location, ttID3v1));
        if FOption.APEWriteAPEv2 then
          Inc(E, SaveToFile(Location, ttAPEv2));
      end
      else if SameText(Kind, 'Opus') or SameText(Kind, 'Vorbis') then
        E := SaveToFile(Location, ttOpusVorbis)
      else if SameText(Kind, 'ADPCM') or SameText(Kind, 'PCM') then
      begin
        E := 0;
        if FOption.WAVWriteWAV then
          Inc(E, SaveToFile(Location, ttWAV));
        if FOption.WAVWriteID3v2 then
          Inc(E, SaveToFile(Location, ttID3v2));
      end
      else if SameText(Kind, 'WMA') then
        E := SaveToFile(Location, ttWMA)
      else
        E := TAGSLIBRARY_ERROR;
      if B then
      begin
        F := TFileStream.Create(Location, fmOpenReadWrite);
        try
          SetFileTime(F.Handle, @C, @A, @U);
        finally
          F.Free;
        end;
      end;
      if E <> TAGSLIBRARY_SUCCESS then
        Application.MessageBox(PChar(Format(SSaveError, [AItem.Location])), SName, MB_OK or MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure LoadCUESheet(AList: TTrackList; const AFileName: string);
var
  C, S: string;
  I, P, Q, R, D: NativeInt;
  M, N: Integer;
  APos, ALen: NativeInt;
  AItem: TTrackItem;
  AData: TCUETrackIndexData;
begin
  with FCUESheet do
  begin
    Load(AFileName);
    C := GetCurrentDir;
    SetCurrentDir(ExtractFilePath(AFileName));
    try
      ALen := 0;
      for I := 0 to GetSectionCount - 1 do
        Inc(ALen, GetTrackCount(I));
      APos := 0;
      for I := 0 to GetSectionCount - 1 do
      begin
        S := ExpandFileName(Sections[I].FileName);
        if not FileExists2(S) then
          Exit;
        MediaInfo_Open(FMediaInfo, PChar(S));
        D := StrToIntDef(MediaInfo_Get(FMediaInfo, Stream_Audio, 0, 'Duration', Info_Text, Info_Name), 0);
        MediaInfo_Close(FMediaInfo);
        for P := 0 to GetTrackCount(I) - 1 do
          for Q := 0 to GetIndexCount(I, P) - 1 do
          begin
            R := Sections[I].Tracks[P].Indexes[Q].IDs.IndexOf('01');
            if R > -1 then
              GetIndex(I, P, Q, R, M)
            else
              GetIndex(I, P, Q, 0, M);
            if P < GetTrackCount(I) - 1 then
            begin
              R := Sections[I].Tracks[Succ(P)].Indexes[Q].IDs.IndexOf('01');
              if R > -1 then
                GetIndex(I, Succ(P), Q, R, N)
              else
                GetIndex(I, Succ(P), Q, 0, N);
            end
            else
              N := D;
            GetIndexData(I, P, Q, AData);
            AItem := TTrackItem.Create;
            with AItem do
            begin
              Kind := 'CUE';
              Location := AFileName;
              Frame := Round((N / 1000) * 75) - Round((M / 1000) * 75);
              Track := Succ(APos);
              Name := AData.Title;
              Artist := AData.Perfomer;
              AlbumArtist := Performer;
              Album := AlbumTitle;
              Genre := Trim(REMLines.Values['GENRE']);
              TrackNumber := Format('%d/%d', [Succ(APos), ALen]);
              Year := Trim(REMLines.Values['DATE']);
            end;
            AList.Add(AItem);
            Inc(APos);
          end;
      end;
    finally
      SetCurrentDir(C);
    end;
  end;
end;

procedure SaveCUESheet(AList: TTrackList; APos: NativeInt);
  function GetFileName(const FileName: string): string;
  var
    I: NativeInt;
  begin
    if not FileExists2(FileName) then
    begin
      Result := FileName;
      Exit;
    end;
    I := 1;
    while FileExists2(Format('%s.~%d~', [FileName, I])) do
      Inc(I);
    Result := Format('%s.~%d~', [FileName, I]);
  end;

var
  S: string;
  B: Boolean;
  I, P, L: NativeInt;
  F: TFileStream;
  C, A, U: TFileTime;
  ALen, AGrp: NativeInt;
begin
  if not InRange(APos, 0, AList.Count - 1) then
    Exit;
  if AList[APos].Modified < 1 then
    Exit;
  S := AList[APos].Location;
  if not FileExists2(S) then
    Exit;
  L := 0;
  AGrp := AList[APos].Group;
  for P := APos to AList.Count - 1 do
  begin
    if AList[P].Group <> AGrp then
      Break;
    Inc(L);
    AGrp := AList[P].Group;
  end;
  with FCUESheet do
  begin
    Load(S);
    ALen := 0;
    for I := 0 to GetSectionCount - 1 do
      Inc(ALen, GetTrackCount(I));
    if ALen <> L then
      Exit;
    Performer := AList[APos].AlbumArtist;
    AlbumTitle := AList[APos].Album;
    if FOption.TagRemove then
      REMLines.Clear;
    REMLines.Values['GENRE'] := StringReplace(AList[APos].Genre, '"', '''', [rfReplaceAll]);
    REMLines.Values['DATE'] := StringReplace(AList[APos].Year, '"', '''', [rfReplaceAll]);
    for I := 0 to GetSectionCount - 1 do
      for P := 0 to GetTrackCount(I) - 1 do
      begin
        if InRange(APos, 0, AList.Count - 1) then
          with Sections[I].Tracks[P] do
          begin
            Titles.Text := StringReplace(AList[APos].Name, '"', '''', [rfReplaceAll]);
            Perfomers.Text := IfThen(FOption.CUEWritePerformer or (AList[APos].AlbumArtist <> AList[APos].Artist), StringReplace(AList[APos].Artist, '"', '''', [rfReplaceAll]), '');
          end;
        Inc(APos);
      end;
    B := FOption.GeneralKeepFileTime;
    if B then
    begin
      F := TFileStream.Create(S, fmOpenRead);
      try
        if not GetFileTime(F.Handle, @C, @A, @U) then
          B := False;
      finally
        F.Free;
      end;
    end;
    if FOption.CUESaveBackup then
      RenameFile(S, GetFileName(S));
    Save(S, False);
    if B then
    begin
      F := TFileStream.Create(S, fmOpenReadWrite);
      try
        SetFileTime(F.Handle, @C, @A, @U);
      finally
        F.Free;
      end;
    end;
  end;
end;

procedure TFlacBirdForm.FormCreate(Sender: TObject);
var
  R: TRect;
  B: TBitmap;
  D: TThemedElementDetails;
begin
  UpdateFont;
  Caption := SName;
  FRect := Rect(Left, Top, Width, Height);
  FMaximized := False;
  FUserID := '';
  FFormat := '%albumartist%\%album%\%tracknumber% %name%';
  FOutputDir := '';
  FExts := TStringList.Create;
  with FExts do
  begin
    CaseSensitive := False;
    Delimiter := ';';
    Duplicates := dupIgnore;
    Sorted := True;
  end;
  MediaInfoDLL_Load(ExtractFilePath(ParamStr(0)) + 'MediaInfo.dll');
  FMediaInfo := MediaInfo_New;
  FList := TTrackList.Create;
  FItem := nil;
  FTags := TTags.Create;
  FCUESheet := TCUESheet.Create;
  with FCUESheet do
  begin
    REMLines.NameValueSeparator := ' ';
    with SaveMode do
    begin
      Album := True;
      Performer := True;
      SongWriter := False;
      CDTextFile := False;
      REMLines := True;
      Catalog := False;
      Titles := True;
      Perfomers := True;
      SongWriters := False;
      ISRCs := True;
      Flags := True;
      PreGaps := True;
      PostGaps := True;
      ZeroBasedIndex := True;
    end;
  end;
  with FTags do
  begin
    UpperCaseFieldNamesToWrite := False;
    MP4KeepPadding := False;
  end;
  FOption := CreateOption;
  FProgress := TProgressForm.Create(Self);
  if ThemeServices.ThemesEnabled then
  begin
    ImageList2.Clear;
    R := Rect(0, 0, 16, 16);
    B := TBitmap.Create;
    try
      with B do
      begin
        Width := 16;
        Height := 16;
        PixelFormat := pf32bit;
        Canvas.Brush.Color := clWindow;
      end;
      D := ThemeServices.GetElementDetails(tbCheckBoxUncheckedNormal);
      with B.Canvas do
      begin
        FillRect(R);
        ThemeServices.DrawElement(Handle, D, R);
      end;
      ImageList2.Add(B, nil);
      ImageList2.Add(B, nil);
      D := ThemeServices.GetElementDetails(tbCheckBoxCheckedNormal);
      with B.Canvas do
      begin
        FillRect(R);
        ThemeServices.DrawElement(Handle, D, R);
      end;
      ImageList2.Add(B, nil);
    finally
      B.Free;
    end;
  end;
  ReadIni;
  Left := FRect.Left;
  Top := FRect.Top;
  Width := FRect.Right;
  Height := FRect.Bottom;
  FExts.DelimitedText := StringReplace(FOption.GeneralFileFilter, '*', '', [rfReplaceAll]);
  with IdHTTP do
  begin
    ReadTimeout := 10000;
    ConnectTimeout := 10000;
  end;
  ListView.GridLines := FOption.GeneralGridLines;
  if FMaximized then
    WindowState := wsMaximized;
  UpdateEdit;
end;

procedure TFlacBirdForm.FormDestroy(Sender: TObject);
begin
  if WindowState = wsNormal then
  begin
    FRect.Left := Left;
    FRect.Top := Top;
    FRect.Right := Width;
    FRect.Bottom := Height;
  end;
  FMaximized := WindowState = wsMaximized;
  WriteIni;
  if Assigned(FProgress) then
    FreeAndNil(FProgress);
  if Assigned(FCUESheet) then
    FreeAndNil(FCUESheet);
  if Assigned(FTags) then
    FreeAndNil(FTags);
  if Assigned(FList) then
    FreeAndNil(FList);
  if FMediaInfo > 0 then
    MediaInfo_Delete(FMediaInfo);
  if Assigned(FExts) then
    FreeAndNil(FExts);
end;

procedure TFlacBirdForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TFlacBirdForm.FormResize(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.FileActionExecute(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.FileAddFileActionExecute(Sender: TObject);
var
  S: string;
begin
  with OpenDialog do
    if Execute(Handle) then
      for S in Files do
        AddFile(FList, S);
  FList.Sort;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateEdit;
end;

procedure TFlacBirdForm.FileAddFileActionUpdate(Sender: TObject);
begin
  FileAddFileAction.Enabled := True;
end;

procedure TFlacBirdForm.FileAddFolderActionExecute(Sender: TObject);
var
  S: string;
begin
  if SelectDirectory(SAddFolder, '', S) then
  begin
    with FProgress do
      try
        Show;
        AddFolder(FList, S);
      finally
        if Visible then
          Close;
      end;
    FList.Sort;
    with ListView, Items do
    begin
      Count := FList.Count;
      Refresh;
    end;
    UpdateEdit;
  end;
end;

procedure TFlacBirdForm.FileAddFolderActionUpdate(Sender: TObject);
begin
  FileAddFolderAction.Enabled := True;
end;

procedure TFlacBirdForm.FileSaveActionExecute(Sender: TObject);
var
  S, T: string;
  I, P, AGrp: NativeInt;
  W: TWICImage;
begin
  if Application.MessageBox(PChar(SCannotBeUndone), SName, MB_YESNO or MB_ICONEXCLAMATION) = IDYES then
  begin
    try
      FProgress.Show;
      AGrp := -1;
      for I := 0 to FList.Count - 1 do
        with FList[I] do
        begin
          Application.ProcessMessages;
          if FProgress.Stop then
            Exit;
          FProgress.Progress(SSave, Format('%s: %s', [SProgress, ExtractFileName(Location)]), Trunc((I + 1) / FList.Count * 1000));
          if not Checked then
            Continue;
          if Artwork.Modified > 0 then
          begin
            if FOption.ArtworkSaveToFile and (Group <> AGrp) then
            begin
              T := FOption.ArtworkFileName;
              T := StringReplace(T, '%name%', Name, [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '%artist%', Artist, [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '%albumartist%', AlbumArtist, [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '%album%', Album, [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '%genre%', Genre, [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '%tracknumber%', Format('%.2d', [StrToIntDef(Copy(TrackNumber, 1, Pos('/', TrackNumber) - 1), 0)]), [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '%year%', Year, [rfReplaceAll, rfIgnoreCase]);
              T := StringReplace(T, '\', '_', [rfReplaceAll, rfIgnoreCase]);
              P := Pos('%', T);
              if P > 0 then
                T := Copy(T, 1, P - 1);
              if T = '' then
                T := SUnknown;
              for P := 0 to Artwork.Count - 1 do
              begin
                case FOption.ArtworkFormat of
                  wifBmp:
                    S := '.bmp';
                  wifPng:
                    S := '.png';
                  wifJpeg:
                    S := '.jpg';
                  wifGif:
                    S := '.gif';
                else
                  S := '';
                end;
                W := TWICImage.Create;
                try
                  W.Assign(Artwork[P]);
                  W.ImageFormat := FOption.ArtworkFormat;
                  W.SaveToFile(GetUniqueFileName(ExtractFilePath(Location) + GetValidFileName(T) + S));
                finally
                  W.Free;
                end;
              end;
            end;
          end
          else
            LoadData(FList[I]);
          if (Kind = 'CUE') and (Group <> AGrp) then
            SaveCUESheet(FList, I)
          else
            SaveData(FList[I]);
          Checked := False;
          AGrp := Group;
        end;
    finally
      if FProgress.Visible then
        FProgress.Close;
      with ListView, Items do
      begin
        Count := FList.Count;
        Refresh;
      end;
      UpdateEdit;
    end;
  end;
end;

procedure TFlacBirdForm.FileSaveActionUpdate(Sender: TObject);
begin
  FileSaveAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.FileGetInfoActionExecute(Sender: TObject);
var
  AItem: TListItem;
begin
  AItem := ListView.Selected;
  if (AItem <> nil) and (InRange(AItem.Index, 0, FList.Count - 1)) then
    GetInfo(Self, FList[AItem.Index].Location);
end;

procedure TFlacBirdForm.FileGetInfoActionUpdate(Sender: TObject);
begin
  FileGetInfoAction.Enabled := ListView.SelCount > 0;
end;

procedure TFlacBirdForm.FileExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TFlacBirdForm.FileExitActionUpdate(Sender: TObject);
begin
  FileExitAction.Enabled := True;
end;

procedure TFlacBirdForm.EditActionExecute(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.EditCopyActionExecute(Sender: TObject);
var
  Item: TListItem;
begin
  with TStringList.Create do
    try
      Item := ListView.Selected;
      while Item <> nil do
      begin
        with Item do
          Add(Format('%s'#09'%s'#09'%s'#09'%s'#09'%s'#09'%s'#09'%s'#09'%s'#09'%s'#09'%s'#09'%s', [
            Caption,
            SubItems[0],
            SubItems[1],
            SubItems[2],
            SubItems[3],
            SubItems[4],
            SubItems[5],
            SubItems[6],
            SubItems[7],
            SubItems[8],
            SubItems[9]
            ]));
        Item := ListView.GetNextItem(Item, sdAll, [isSelected]);
      end;
      if Text <> '' then
        Clipboard.AsText := Text;
    finally
      Free;
    end;
end;

procedure TFlacBirdForm.EditCopyActionUpdate(Sender: TObject);
begin
  EditCopyAction.Enabled := ListView.SelCount > 0;
end;

procedure TFlacBirdForm.EditDeleteActionExecute(Sender: TObject);
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
  FList.Sort;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateEdit;
end;

procedure TFlacBirdForm.EditDeleteActionUpdate(Sender: TObject);
begin
  EditDeleteAction.Enabled := ListView.SelCount > 0;
end;

procedure TFlacBirdForm.EditDeleteAllActionExecute(Sender: TObject);
begin
  FList.Clear;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateEdit;;
end;

procedure TFlacBirdForm.EditDeleteAllActionUpdate(Sender: TObject);
begin
  EditDeleteAllAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.EditSelectAllActionExecute(Sender: TObject);
begin
  ListView.SelectAll;
end;

procedure TFlacBirdForm.EditSelectAllActionUpdate(Sender: TObject);
begin
  EditSelectAllAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.EditSelectNoneActionExecute(Sender: TObject);
var
  AItem: TListItem;
begin
  AItem := ListView.Selected;
  while AItem <> nil do
  begin
    AItem.Selected := False;
    AItem := ListView.GetNextItem(AItem, sdAll, [isSelected]);
  end;
  UpdateEdit;
end;

procedure TFlacBirdForm.EditSelectNoneActionUpdate(Sender: TObject);
begin
  EditSelectNoneAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.EditCheckAllActionExecute(Sender: TObject);
var
  AItem: TTrackItem;
begin
  for AItem in FList do
    AItem.Checked := True;
  ListView.Refresh;
end;

procedure TFlacBirdForm.EditCheckAllActionUpdate(Sender: TObject);
begin
  EditCheckAllAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.EditUncheckAllActionExecute(Sender: TObject);
var
  AItem: TTrackItem;
begin
  for AItem in FList do
    AItem.Checked := False;
  ListView.Refresh;
end;

procedure TFlacBirdForm.EditUncheckAllActionUpdate(Sender: TObject);
begin
  EditUncheckAllAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.EditPreferenceActionExecute(Sender: TObject);
begin
  if Preferences(Self, FOption) then
  begin
    FExts.DelimitedText := StringReplace(FOption.GeneralFileFilter, '*', '', [rfReplaceAll]);
    ListView.GridLines := FOption.GeneralGridLines;
    FList.Sort;
    with ListView, Items do
    begin
      Count := FList.Count;
      Refresh;
    end;
    UpdateEdit;
  end;
end;

procedure TFlacBirdForm.EditPreferenceActionUpdate(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.EditPrevActionExecute(Sender: TObject);
begin
  if FItem = nil then
    Exit;
  with FItem, Artwork do
  begin
    if Count < 2 then
      Exit;
    Position := Position - 1;
    if Position > -1 then
      ArtworkImage.Picture.Bitmap.Assign(Artwork[Position])
    else
      Position := 0;
  end;
  UpdateActn;
end;

procedure TFlacBirdForm.EditPrevActionUpdate(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.EditNextActionExecute(Sender: TObject);
begin
  if FItem = nil then
    Exit;
  with FItem, Artwork do
  begin
    if Count < 2 then
      Exit;
    Position := Position + 1;
    if Position < Count then
      ArtworkImage.Picture.Bitmap.Assign(Artwork[Position])
    else
      Position := Count - 1;
  end;
  UpdateActn;
end;

procedure TFlacBirdForm.EditNextActionUpdate(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.AdvancedActionExecute(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.AdvancedForceGetTrackNamesActionExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar(SForceGetTrackNames), SName, MB_YESNO or MB_ICONEXCLAMATION) = IDYES then
  begin
    GetName(True);
    UpdateEdit;
  end;
end;

procedure TFlacBirdForm.AdvancedForceGetTrackNamesActionUpdate(Sender: TObject);
begin
  AdvancedForceGetTrackNamesAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.AdvancedGetTrackNamesActionExecute(Sender: TObject);
begin
  GetName;
  UpdateEdit;
end;

procedure TFlacBirdForm.AdvancedGetTrackNamesActionUpdate(Sender: TObject);
begin
  AdvancedGetTrackNamesAction.Enabled := ListView.SelCount > 0;
end;

procedure TFlacBirdForm.AdvancedForceGetArtworkActionExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar(SForceGetArtwork), SName, MB_YESNO or MB_ICONEXCLAMATION) = IDYES then
  begin
    GetArtwork(True);
    UpdateEdit;
  end;
end;

procedure TFlacBirdForm.AdvancedForceGetArtworkActionUpdate(Sender: TObject);
begin
  AdvancedForceGetArtworkAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.AdvancedGetArtworkActionExecute(Sender: TObject);
begin
  GetArtwork;
  UpdateEdit;
end;

procedure TFlacBirdForm.AdvancedGetArtworkActionUpdate(Sender: TObject);
begin
  AdvancedGetArtworkAction.Enabled := ListView.SelCount > 0;
end;

procedure TFlacBirdForm.AdvancedForceClearArtworkActionExecute(
  Sender: TObject);
begin
  if Application.MessageBox(PChar(SForceClearDownloadedArtwork), SName, MB_YESNO or MB_ICONEXCLAMATION) = IDYES then
  begin
    ClearArtwork(True);
    UpdateEdit;
  end;
end;

procedure TFlacBirdForm.AdvancedForceClearArtworkActionUpdate(
  Sender: TObject);
begin
  AdvancedForceClearArtworkAction.Enabled := ListView.Items.Count > 0;
end;

procedure TFlacBirdForm.AdvancedClearArtworkActionExecute(
  Sender: TObject);
begin
  ClearArtwork;
  UpdateEdit;
end;

procedure TFlacBirdForm.AdvancedClearArtworkActionUpdate(
  Sender: TObject);
begin
  AdvancedClearArtworkAction.Enabled := ListView.SelCount > 0;
end;

procedure TFlacBirdForm.AdvancedOrganizeFolderActionExecute(Sender: TObject);
var
  AList: TTrackList;
begin
  AList := TTrackList.Create;
  try
    if OrganizeFolder(Self, FFormat, AList, FOutputDir) then
    begin
      if (Application.MessageBox(PChar(SCannotBeUndone), SName, MB_YESNO or MB_ICONEXCLAMATION) = IDYES) and DirectoryExists2(FOutputDir) then
        with FProgress do
          try
            Show;
            ExecuteOrganizeFolder(AList);
          finally
            if Visible then
              Close;
          end;
    end;
  finally
    AList.Free;
  end;
end;

procedure TFlacBirdForm.AdvancedOrganizeFolderActionUpdate(Sender: TObject);
begin
  AdvancedOrganizeFolderAction.Enabled := True;
end;

procedure TFlacBirdForm.HelpActionExecute(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.HelpAboutActionExecute(Sender: TObject);
begin
  About(Self);
end;

procedure TFlacBirdForm.HelpAboutActionUpdate(Sender: TObject);
begin
  //
end;

procedure TFlacBirdForm.DragDropTargetDragDropFiles(Sender: TWinControl; X,
  Y: Integer; Files: TStrings);
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
  FList.Sort;
  with ListView, Items do
  begin
    Count := FList.Count;
    Refresh;
  end;
  UpdateEdit;
end;

procedure TFlacBirdForm.EditPanelResize(Sender: TObject);
begin
  with NameEdit do
    Width := EditPanel.Width - Left - 8;
  with ArtistEdit do
    Width := EditPanel.Width - Left - 8;
  with AlbumArtistEdit do
    Width := EditPanel.Width - Left - 8;
  with AlbumEdit do
    Width := EditPanel.Width - Left - 8;
  with GenreEdit do
    Width := EditPanel.Width - Left - 8;
  with TrackNumberEdit do
    Width := EditPanel.Width - Left - 8;
  with YearEdit do
    Width := EditPanel.Width - Left - 8;
end;

procedure TFlacBirdForm.ArtworkLinkLabelLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  ShellExecute(0, PChar('OPEN'), PChar(Link), '', '', SW_SHOW);
end;

procedure TFlacBirdForm.ListViewClick(Sender: TObject);
begin
  UpdateEdit;
end;

procedure TFlacBirdForm.ListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if FList = nil then
    Exit;
  with Item, Sender.Canvas do
  begin
    Brush.Color := clWhite;
    if InRange(Index, 0, FList.Count - 1) then
    begin
      case FList[Index].Artwork.Modified of
        0:
          Brush.Color := $D7D1D2;
        1:
          Brush.Color := $D3FCDD;
        2:
          Brush.Color := $CDEAFF;
      else
        if Index mod 2 = 0 then
          Brush.Color := clWindow
        else
          Brush.Color := $F9F9F9;
      end;
    end
    else if Index mod 2 = 0 then
      Brush.Color := clWindow
    else
      Brush.Color := $F9F9F9;
  end;
end;

procedure TFlacBirdForm.ListViewCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if FList = nil then
    Exit;
  with Item, Sender.Canvas do
  begin
    Brush.Color := clWhite;
    if InRange(Index, 0, FList.Count - 1) and (SubItem < 8) then
    begin
      case FList[Index].Modified of
        0:
          Brush.Color := $D7D1D2;
        1:
          Brush.Color := $FEF0D3;
        2:
          Brush.Color := $E0D4FE;
      else
        if Index mod 2 = 0 then
          Brush.Color := clWindow
        else
          Brush.Color := $F9F9F9;
      end;
    end
    else if Index mod 2 = 0 then
      Brush.Color := clWindow
    else
      Brush.Color := $F9F9F9;
  end;
end;

procedure TFlacBirdForm.ListViewData(Sender: TObject; Item: TListItem);
const
  CheckBoxUnchecked = 1;
  CheckBoxChecked = 2;
begin
  if FList = nil then
    Exit;
  with Item do
  begin
    if InRange(Index, 0, FList.Count - 1) then
    begin
      with FList[Index] do
      begin
        Caption := Location;
        SubItems.Add(Name);
        SubItems.Add(Artist);
        SubItems.Add(AlbumArtist);
        SubItems.Add(Album);
        SubItems.Add(Genre);
        SubItems.Add(TrackNumber);
        SubItems.Add(Year);
        SubItems.Add(Kind);
        case Modified of
          0:
            SubItems.Add(STagNotFound);
          1:
            SubItems.Add(STagFetch);
          2:
            SubItems.Add(STagBest);
        else
          SubItems.Add('');
        end;
        case Artwork.Modified of
          0:
            SubItems.Add(SArtworkNotFound);
          1:
            SubItems.Add(SArtworkApple);
          2:
            SubItems.Add(SArtworkLastfm);
        else
          SubItems.Add('');
        end;
        StateIndex := IfThen(Checked, CheckBoxChecked, CheckBoxUnchecked);
      end;
    end;
  end;
end;

procedure TFlacBirdForm.ListViewDblClick(Sender: TObject);
begin
  if GetKeyState(VK_MENU) < 0 then
    AdvancedGetArtworkAction.Execute
  else
    AdvancedGetTrackNamesAction.Execute;
end;

procedure TFlacBirdForm.ListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I, AIdx, AGrp: NativeInt;
  B: Boolean;
  Item: TListItem;
begin
  if Key = VK_SPACE then
  begin
    with ListView do
    begin
      if Selected = nil then
        Exit;
      Item := Selected;
      B := FList[Item.Index].Checked;
      while Item <> nil do
      begin
        if FList[Item.Index].Kind = 'CUE' then
        begin
          AIdx := Item.Index;
          AGrp := FList[Item.Index].Group;
          for I := Item.Index - 1 downto 0 do
          begin
            if FList[I].Group <> AGrp then
              Break;
            AGrp := FList[I].Group;
            Dec(AIdx);
          end;
          for I := AIdx to FList.Count - 1 do
          begin
            if FList[I].Group <> AGrp then
              Break;
            FList[I].Checked := not B;
            AGrp := FList[I].Group;
          end;
        end
        else
          FList[Item.Index].Checked := not B;
        Item := GetNextItem(Item, sdAll, [isSelected]);
      end;
      Refresh;
    end;
  end;
end;

procedure TFlacBirdForm.ListViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I, AIdx, AGrp: NativeInt;
  B: Boolean;
  Item: TListItem;
  HitInfo: THitTests;
begin
  with ListView do
  begin
    Item := GetItemAt(X, Y);
    if Item = nil then
      Exit;
    if Button = mbLeft then
    begin
      HitInfo := GetHitTestInfoAt(X, Y);
      if htOnStateIcon in HitInfo then
      begin
        if InRange(Item.Index, 0, FList.Count - 1) then
        begin
          B := FList[Item.Index].Checked;
          if FList[Item.Index].Kind = 'CUE' then
          begin
            AIdx := Item.Index;
            AGrp := FList[Item.Index].Group;
            for I := Item.Index - 1 downto 0 do
            begin
              if FList[I].Group <> AGrp then
                Break;
              AGrp := FList[I].Group;
              Dec(AIdx);
            end;
            for I := AIdx to FList.Count - 1 do
            begin
              if FList[I].Group <> AGrp then
                Break;
              FList[I].Checked := not B;
              AGrp := FList[I].Group;
            end;
          end
          else
            with FList[Item.Index] do
              Checked := not B;
        end;
        Refresh;
      end;
    end;
  end;
end;

procedure TFlacBirdForm.ListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then
    UpdateEdit;
end;

procedure TFlacBirdForm.ReadIni;
var
  S, CurrentDir: string;
begin
  if not GetIniFileName(S) then
    Exit;
  CurrentDir := GetCurrentDir;
  SetCurrentDir(ExtractFileDir(ParamStr(0)));
  with TMemIniFile.Create(S, TEncoding.UTF8) do
    try
      FRect.Left := ReadInteger('MainForm', 'Left', Left);
      FRect.Top := ReadInteger('MainForm', 'Top', Top);
      FRect.Right := ReadInteger('MainForm', 'Width', Width);
      FRect.Bottom := ReadInteger('MainForm', 'Height', Height);
      FMaximized := ReadBool('MainForm', 'Maximized', False);
      FUserID := ReadString('MainForm', 'UserID', FUserID);
      FFormat := ReadString('MainForm', 'Format', FFormat);
      FOutputDir := ReadString('MainForm', 'OutputDir', FOutputDir);
      with FOption do
      begin
        GeneralGridLines := ReadBool('Option', 'GeneralGridLines', GeneralGridLines);
        GeneralKeepFileTime := ReadBool('Option', 'GeneralKeepFileTime', GeneralKeepFileTime);
        GeneralSortByTrack := ReadBool('Option', 'GeneralSortByTrack', GeneralSortByTrack);
        GeneralPregap := ReadInteger('Option', 'GeneralPregap', GeneralPregap);
        GeneralFileFilter := ReadString('Option', 'GeneralFileFilter', GeneralFileFilter);
        TagRemove := ReadBool('Option', 'TagRemove', TagRemove);
        MPEGWriteID3v1 := ReadBool('Option', 'MPEGWriteID3v1', MPEGWriteID3v1);
        MPEGWriteID3v2 := ReadBool('Option', 'MPEGWriteID3v2', MPEGWriteID3v2);
        MPEGWriteAPEv2 := ReadBool('Option', 'MPEGWriteAPEv2', MPEGWriteAPEv2);
        MPEGRemoveID3v1 := ReadBool('Option', 'MPEGRemoveID3v1', MPEGRemoveID3v1);
        MPEGRemoveID3v2 := ReadBool('Option', 'MPEGRemoveID3v2', MPEGRemoveID3v2);
        MPEGRemoveAPE := ReadBool('Option', 'MPEGRemoveAPE', MPEGRemoveAPE);
        APEWriteID3v1 := ReadBool('Option', 'APEWriteID3v1', APEWriteID3v1);
        APEWriteAPEv2 := ReadBool('Option', 'APEWriteAPEv2', APEWriteAPEv2);
        APERemoveID3v1 := ReadBool('Option', 'APERemoveID3v1', APERemoveID3v1);
        APERemoveID3v2 := ReadBool('Option', 'APERemoveID3v2', APERemoveID3v2);
        APERemoveAPE := ReadBool('Option', 'APERemoveAPE', APERemoveAPE);
        WAVWriteWAV := ReadBool('Option', 'WAVWriteWAV', WAVWriteWAV);
        WAVWriteID3v2 := ReadBool('Option', 'WAVWriteID3v2', WAVWriteID3v2);
        WAVRemoveWAV := ReadBool('Option', 'WAVRemoveWAV', WAVRemoveWAV);
        WAVRemoveID3v2 := ReadBool('Option', 'WAVRemoveID3v2', WAVRemoveID3v2);
        CUESaveBackup := ReadBool('Option', 'CUESaveBackup', CUESaveBackup);
        CUEWritePerformer := ReadBool('Option', 'CUEWritePerformer', CUEWritePerformer);
        ArtworkFormat := TWICImageFormat(ReadInteger('Option', 'ArtworkFormat', NativeInt(ArtworkFormat)));
        ArtworkFileName := ReadString('Option', 'ArtworkFileName', ArtworkFileName);
        ArtworkSaveToFile := ReadBool('Option', 'ArtworkSaveToFile', ArtworkSaveToFile);
        ArtworkSoundsLike := ReadBool('Option', 'ArtworkSoundsLike', ArtworkSoundsLike);
        ArtworkUseLastfm := ReadBool('Option', 'ArtworkUseLastfm', ArtworkUseLastfm);
      end;
    finally
      Free;
    end;
  SetCurrentDir(CurrentDir);
end;

procedure TFlacBirdForm.WriteIni;
var
  S: string;
begin
  if FIniFailed or (not GetIniFileName(S)) then
    Exit;
  try
    with TMemIniFile.Create(S, TEncoding.UTF8) do
      try
        WriteInteger('MainForm', 'Left', FRect.Left);
        WriteInteger('MainForm', 'Top', FRect.Top);
        WriteInteger('MainForm', 'Width', FRect.Right);
        WriteInteger('MainForm', 'Height', FRect.Bottom);
        WriteBool('MainForm', 'Maximized', FMaximized);
        WriteString('MainForm', 'UserID', FUserID);
        WriteString('MainForm', 'Format', FFormat);
        WriteString('MainForm', 'OutputDir', FOutputDir);
        with FOption do
        begin
          WriteBool('Option', 'GeneralGridLines', GeneralGridLines);
          WriteBool('Option', 'GeneralKeepFileTime', GeneralKeepFileTime);
          WriteBool('Option', 'GeneralSortByTrack', GeneralSortByTrack);
          WriteInteger('Option', 'GeneralPregap', GeneralPregap);
          WriteString('Option', 'GeneralFileFilter', GeneralFileFilter);
          WriteBool('Option', 'TagRemove', TagRemove);
          WriteBool('Option', 'MPEGWriteID3v1', MPEGWriteID3v1);
          WriteBool('Option', 'MPEGWriteID3v2', MPEGWriteID3v2);
          WriteBool('Option', 'MPEGWriteAPEv2', MPEGWriteAPEv2);
          WriteBool('Option', 'MPEGRemoveID3v1', MPEGRemoveID3v1);
          WriteBool('Option', 'MPEGRemoveID3v2', MPEGRemoveID3v2);
          WriteBool('Option', 'MPEGRemoveAPE', MPEGRemoveAPE);
          WriteBool('Option', 'APEWriteID3v1', APEWriteID3v1);
          WriteBool('Option', 'APEWriteAPEv2', APEWriteAPEv2);
          WriteBool('Option', 'APERemoveID3v1', APERemoveID3v1);
          WriteBool('Option', 'APERemoveID3v2', APERemoveID3v2);
          WriteBool('Option', 'APERemoveAPE', APERemoveAPE);
          WriteBool('Option', 'WAVWriteWAV', WAVWriteWAV);
          WriteBool('Option', 'WAVWriteID3v2', WAVWriteID3v2);
          WriteBool('Option', 'WAVRemoveWAV', WAVRemoveWAV);
          WriteBool('Option', 'WAVRemoveID3v2', WAVRemoveID3v2);
          WriteBool('Option', 'CUESaveBackup', CUESaveBackup);
          WriteBool('Option', 'CUEWritePerformer', CUEWritePerformer);
          WriteInteger('Option', 'ArtworkFormat', NativeInt(ArtworkFormat));
          WriteString('Option', 'ArtworkFileName', ArtworkFileName);
          WriteBool('Option', 'ArtworkSaveToFile', ArtworkSaveToFile);
          WriteBool('Option', 'ArtworkSoundsLike', ArtworkSoundsLike);
          WriteBool('Option', 'ArtworkUseLastfm', ArtworkUseLastfm);
        end;
        UpdateFile;
      finally
        Free;
      end;
  except
    FIniFailed := True;
  end;
end;

procedure TFlacBirdForm.AddFile(AList: TTrackList; const AFileName: string);
var
  S, T: string;
  D: NativeInt;
  AItem: TTrackItem;
begin
  S := AFileName;
  if LowerCase(ExtractFileExt(S)) = '.lnk' then
    S := GetFileNameFromLink(S);
  S := ShortToLongFileName(ExpandFileName(S));
  if FileExists2(S) and (FExts.IndexOf(ExtractFileExt(S)) > -1) and (AList.Find(S) = nil) then
  begin
    if LowerCase(ExtractFileExt(S)) = '.cue' then
      LoadCUESheet(AList, S)
    else
    begin
      if FileExists2(ChangeFileExt(S, '.cue')) or FileExists2(S + '.cue') then
        Exit;
      MediaInfo_Open(FMediaInfo, PChar(S));
      T := MediaInfo_Get(FMediaInfo, Stream_Audio, 0, 'Format', Info_Text, Info_Name);
      D := StrToIntDef(MediaInfo_Get(FMediaInfo, Stream_Audio, 0, 'Duration', Info_Text, Info_Name), 0);
      MediaInfo_Close(FMediaInfo);
      AItem := TTrackItem.Create;
      with AItem do
      begin
        Location := S;
        Kind := T;
        Frame := Round((D / 1000) * 75);
        if Pos('\\', ExpandUNCFileName(Location)) = 0 then
          Artwork.Modified := 0;
        try
          LoadData(AItem);
        finally
          Artwork.Modified := -1;
        end;
      end;
      AList.Add(AItem);
    end;
  end;
end;

procedure TFlacBirdForm.AddFolder(AList: TTrackList; const AFolderName: string);
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

function TFlacBirdForm.GetUser: string;
var
  MS: TMemoryStream;
  SL: TStringList;
  RT: IXMLRESPONSESType;
begin
  MS := TMemoryStream.Create;
  SL := TStringList.Create;
  try
    MS.Clear;
    SL.Add('<QUERIES><QUERY CMD="REGISTER"><CLIENT>' + SClientID + '</CLIENT></QUERY></QUERIES>');
    IdHTTP.Post(SAddr, SL, MS);
    if MS.Size > 0 then
    begin
      MS.Position := 0;
      XMLDocument.LoadFromStream(MS, xetUTF_8);
      XMLDocument.Active := True;
      RT := GetRESPONSES(XMLDocument);
      XMLDocument.Active := False;
      Result := RT.RESPONSE.USER;
    end;
  finally
    MS.Free;
    SL.Free;
  end;
end;

function TFlacBirdForm.BuildQuery(const ACmd, AQuery: string): string;
begin
  Result := '<QUERIES><AUTH><CLIENT>' + SClientID + '</CLIENT><USER>' + FUserID + '</USER></AUTH><LANG>eng</LANG><QUERY CMD="' + ACmd + '">' + AQuery + '</QUERY></QUERIES>';
end;

procedure TFlacBirdForm.GetName(AForce: Boolean = False);
var
  ALoc, AToc: string;
  I, AIdx, APos, ALen, AGrp: NativeInt;
begin
  if FUserID = '' then
    FUserID := GetUser;
  if FUserID = '' then
    Exit;
  if FList.Count = 0 then
    Exit;
  if AForce then
    AIdx := 0
  else
    with ListView do
    begin
      if SelCount = 0 then
        Exit;
      AIdx := ItemIndex;
      if InRange(ItemIndex, 0, FList.Count - 1) then
      begin
        AGrp := FList[ItemIndex].Group;
        for I := ItemIndex - 1 downto 0 do
        begin
          if FList[I].Group <> AGrp then
            Break;
          AGrp := FList[I].Group;
          Dec(AIdx);
        end;
      end;
    end;
  if InRange(AIdx, 0, FList.Count - 1) then
  begin
    FProgress.Show;
    try
      ALoc := FList[AIdx].Location;
      AGrp := FList[AIdx].Group;
      AToc := FList[AIdx].Toc;
      APos := AIdx;
      ALen := 0;
      for I := AIdx to FList.Count - 1 do
      begin
        Application.ProcessMessages;
        if FProgress.Stop then
          Exit;
        if AForce and (FList[I].Modified = 1) then
          Continue;
        if FList[I].Group <> AGrp then
        begin
          FProgress.Progress(SGetTrackNames, Format('%s: %s', [SProgress, ExtractFileName(ALoc)]), Trunc((APos + 1) / FList.Count * 1000));
          GetNameByToc(AToc, APos, ALen, AForce);
          APos := I;
          ALen := 0;
          if not AForce then
            Exit;
        end;
        ALoc := FList[I].Location;
        AGrp := FList[I].Group;
        AToc := FList[I].Toc;
        Inc(ALen);
      end;
      FProgress.Progress(SGetTrackNames, Format('%s: %s', [SProgress, ExtractFileName(ALoc)]), Trunc((APos + 1) / FList.Count * 1000));
      GetNameByToc(AToc, APos, ALen, AForce);
    finally
      if FProgress.Visible then
        FProgress.Close;
    end;
  end;
end;

procedure TFlacBirdForm.GetNameByToc(const AToc: string; APos, ALen: NativeInt;
  AForce: Boolean = False);
var
  S: string;
  I: NativeInt;
  MS: TMemoryStream;
  SL: TStringList;
  RT: IXMLRESPONSESType;
  AItem: TAlbumItem;
  AList: TAlbumList;
begin
  MS := TMemoryStream.Create;
  SL := TStringList.Create;
  try
    MS.Clear;
    SL.Clear;
    SL.Add(BuildQuery('ALBUM_TOC', '<TOC><OFFSETS>' + AToc + '</OFFSETS></TOC><OPTION><PARAMETER>SELECT_DETAIL</PARAMETER><VALUE>GENRE:3LEVEL</VALUE></OPTION>'));
    IdHTTP.Post(SAddr, SL, MS);
    if MS.Size > 0 then
    begin
      MS.Position := 0;
      XMLDocument.LoadFromStream(MS, xetUTF_8);
      XMLDocument.Active := True;
      RT := GetRESPONSES(XMLDocument);
      XMLDocument.Active := False;
      with RT.RESPONSE.ALBUM do
      begin
        if Count = 1 then
          GetNameByFetch(Items[0].GN_ID, APos, ALen)
        else if Count > 1 then
        begin
          if AForce then
            GetNameByTocBest(AToc, APos, ALen)
          else
          begin
            AList := TAlbumList.Create;
            try
              for I := 0 to Count - 1 do
                with Items[I] do
                  if (ChildNodes['TITLE'].NodeValue <> Null) and
                    (ChildNodes['ARTIST'].NodeValue <> Null) and
                    (ChildNodes['GN_ID'].NodeValue <> Null) then
                  begin
                    AItem := TAlbumItem.Create;
                    AItem.Name := TITLE;
                    AItem.Artist := ARTIST;
                    AItem.ID := GN_ID;
                    AList.Add(AItem);
                  end;
              if AList.Count = 0 then
              begin
                for I := 0 to ALen - 1 do
                  if InRange(APos + I, 0, FList.Count - 1) then
                    FList[APos + I].Modified := 0;
                Exit;
              end;
              if FindResult(Self, AList, S) then
                GetNameByFetch(S, APos, ALen);
            finally
              AList.Free;
            end;
          end;
        end
        else
        begin
          for I := 0 to ALen - 1 do
            if InRange(APos + I, 0, FList.Count - 1) then
              FList[APos + I].Modified := 0;
        end;
      end;
    end;
  finally
    MS.Free;
    SL.Free;
  end;
  with ListView do
  begin
    Refresh;
    if InRange(APos + ALen - 1, 0, Items.Count - 1) then
      Items[APos + ALen - 1].MakeVisible(True);
  end;
end;

procedure TFlacBirdForm.GetNameByTocBest(const AToc: string; APos,
  ALen: NativeInt);
var
  I: NativeInt;
  MS: TMemoryStream;
  SL: TStringList;
  RT: IXMLRESPONSESType;
begin
  MS := TMemoryStream.Create;
  SL := TStringList.Create;
  try
    MS.Clear;
    SL.Clear;
    SL.Add(BuildQuery('ALBUM_TOC', '<MODE>SINGLE_BEST</MODE><TOC><OFFSETS>' + AToc + '</OFFSETS></TOC><OPTION><PARAMETER>SELECT_DETAIL</PARAMETER><VALUE>GENRE:3LEVEL</VALUE></OPTION>'));
    IdHTTP.Post(SAddr, SL, MS);
    if MS.Size > 0 then
    begin
      MS.Position := 0;
      XMLDocument.LoadFromStream(MS, xetUTF_8);
      XMLDocument.Active := True;
      RT := GetRESPONSES(XMLDocument);
      XMLDocument.Active := False;
      with RT.RESPONSE.ALBUM do
      begin
        if Count = 1 then
        begin
          with Items[0] do
          begin
            if TRACK.Count <> ALen then
              Exit;
            for I := 0 to TRACK.Count - 1 do
              if InRange(APos + I, 0, FList.Count - 1) then
              begin
                FList[APos + I].Name := '';
                FList[APos + I].Artist := '';
                FList[APos + I].AlbumArtist := '';
                FList[APos + I].Album := '';
                FList[APos + I].Genre := '';
                FList[APos + I].TrackNumber := '';
                FList[APos + I].Year := '';
                if TRACK.Items[I].ChildNodes['TITLE'].NodeValue <> Null then
                  FList[APos + I].Name := TRACK.Items[I].TITLE;
                if TRACK.Items[I].ChildNodes['ARTIST'].NodeValue <> Null then
                  FList[APos + I].Artist := TRACK.Items[I].ARTIST
                else if ChildNodes['ARTIST'].NodeValue <> Null then
                  FList[APos + I].Artist := ARTIST;
                if ChildNodes['ARTIST'].NodeValue <> Null then
                  FList[APos + I].AlbumArtist := ARTIST;
                if ChildNodes['TITLE'].NodeValue <> Null then
                  FList[APos + I].Album := TITLE;
                if ChildNodes['GENRE'].NodeValue <> Null then
                  FList[APos + I].Genre := GENRE.Items[0].Text;
                if (ChildNodes['TRACK_COUNT'].NodeValue <> Null) and
                  (TRACK.Items[I].ChildNodes['TRACK_NUM'].NodeValue <> Null) then
                  FList[APos + I].TrackNumber := Format('%d/%d', [TRACK.Items[I].TRACK_NUM, TRACK_COUNT]);
                if ChildNodes['DATE'].NodeValue <> Null then
                  FList[APos + I].Year := Format('%d', [DATE]);
                FList[APos + I].Checked := True;
                FList[APos + I].Modified := 2;
              end;
          end;
        end
        else
          for I := 0 to ALen - 1 do
            if InRange(APos + I, 0, FList.Count - 1) then
              FList[APos + I].Modified := 0;
      end;
    end;
  finally
    MS.Free;
    SL.Free;
  end;
  with ListView do
  begin
    Refresh;
    if InRange(APos + ALen - 1, 0, Items.Count - 1) then
      Items[APos + ALen - 1].MakeVisible(True);
  end;
end;

procedure TFlacBirdForm.GetNameByFetch(const AGNID: string; APos,
  ALen: NativeInt);
var
  I: NativeInt;
  MS: TMemoryStream;
  SL: TStringList;
  RT: IXMLRESPONSESType;
begin
  MS := TMemoryStream.Create;
  SL := TStringList.Create;
  try
    MS.Clear;
    SL.Clear;
    SL.Add(BuildQuery('ALBUM_FETCH', '<GN_ID>' + AGNID + '</GN_ID><OPTION><PARAMETER>SELECT_DETAIL</PARAMETER><VALUE>GENRE:3LEVEL</VALUE></OPTION>'));
    IdHTTP.Post(SAddr, SL, MS);
    if MS.Size > 0 then
    begin
      MS.Position := 0;
      XMLDocument.LoadFromStream(MS, xetUTF_8);
      XMLDocument.Active := True;
      RT := GetRESPONSES(XMLDocument);
      XMLDocument.Active := False;
      with RT.RESPONSE.ALBUM do
      begin
        if Count = 1 then
        begin
          with Items[0] do
          begin
            if TRACK.Count <> ALen then
              Exit;
            for I := 0 to TRACK.Count - 1 do
              if InRange(APos + I, 0, FList.Count - 1) then
              begin
                FList[APos + I].Name := '';
                FList[APos + I].Artist := '';
                FList[APos + I].AlbumArtist := '';
                FList[APos + I].Album := '';
                FList[APos + I].Genre := '';
                FList[APos + I].TrackNumber := '';
                FList[APos + I].Year := '';
                if TRACK.Items[I].ChildNodes['TITLE'].NodeValue <> Null then
                  FList[APos + I].Name := TRACK.Items[I].TITLE;
                if TRACK.Items[I].ChildNodes['ARTIST'].NodeValue <> Null then
                  FList[APos + I].Artist := TRACK.Items[I].ARTIST
                else if ChildNodes['ARTIST'].NodeValue <> Null then
                  FList[APos + I].Artist := ARTIST;
                if ChildNodes['ARTIST'].NodeValue <> Null then
                  FList[APos + I].AlbumArtist := ARTIST;
                if ChildNodes['TITLE'].NodeValue <> Null then
                  FList[APos + I].Album := TITLE;
                if ChildNodes['GENRE'].NodeValue <> Null then
                  FList[APos + I].Genre := GENRE.Items[0].Text;
                if (ChildNodes['TRACK_COUNT'].NodeValue <> Null) and
                  (TRACK.Items[I].ChildNodes['TRACK_NUM'].NodeValue <> Null) then
                  FList[APos + I].TrackNumber := Format('%d/%d', [TRACK.Items[I].TRACK_NUM, TRACK_COUNT]);
                if ChildNodes['DATE'].NodeValue <> Null then
                  FList[APos + I].Year := Format('%d', [DATE]);
                FList[APos + I].Checked := True;
                FList[APos + I].Modified := 1;
              end;
          end;
        end
        else
          for I := 0 to ALen - 1 do
            if InRange(APos + I, 0, FList.Count - 1) then
              FList[APos + I].Modified := 0;
      end;
    end;
  finally
    MS.Free;
    SL.Free;
  end;
  with ListView do
  begin
    Refresh;
    if InRange(APos + ALen - 1, 0, Items.Count - 1) then
      Items[APos + ALen - 1].MakeVisible(True);
  end;
end;

procedure TFlacBirdForm.GetArtwork(AForce: Boolean = False);
var
  ALoc, AArtist, AAlbum: string;
  I, AIdx, APos, ALen, AGrp: NativeInt;
begin
  if FList.Count = 0 then
    Exit;
  if AForce then
    AIdx := 0
  else
    with ListView do
    begin
      if SelCount = 0 then
        Exit;
      AIdx := ItemIndex;
      if InRange(ItemIndex, 0, FList.Count - 1) then
      begin
        AGrp := FList[ItemIndex].Group;
        for I := ItemIndex - 1 downto 0 do
        begin
          if FList[I].Group <> AGrp then
            Break;
          AGrp := FList[I].Group;
          Dec(AIdx);
        end;
      end;
    end;
  if InRange(AIdx, 0, FList.Count - 1) then
  begin
    FProgress.Show;
    try
      ALoc := FList[AIdx].Location;
      AGrp := FList[AIdx].Group;
      AArtist := IfThen(FList[AIdx].AlbumArtist <> '', FList[AIdx].AlbumArtist, FList[AIdx].Artist);
      AAlbum := FList[AIdx].Album;
      APos := AIdx;
      ALen := 0;
      for I := AIdx to FList.Count - 1 do
      begin
        Application.ProcessMessages;
        if FProgress.Stop then
          Exit;
        if AForce and (FList[I].Artwork.Modified = 1) then
          Continue;
        if FList[I].Group <> AGrp then
        begin
          FProgress.Progress(SGetArtwork, Format('%s: %s', [SProgress, ExtractFileName(ALoc)]), Trunc((APos + 1) / FList.Count * 1000));
          GetArtworkByName(AArtist, AAlbum, APos, ALen);
          APos := I;
          ALen := 0;
          if not AForce then
            Exit;
        end;
        ALoc := FList[I].Location;
        AGrp := FList[I].Group;
        AArtist := IfThen(FList[I].AlbumArtist <> '', FList[I].AlbumArtist, FList[I].Artist);
        AAlbum := FList[I].Album;
        Inc(ALen);
      end;
      FProgress.Progress(SGetArtwork, Format('%s: %s', [SProgress, ExtractFileName(ALoc)]), Trunc((APos + 1) / FList.Count * 1000));
      GetArtworkByName(AArtist, AAlbum, APos, ALen);
    finally
      if FProgress.Visible then
        FProgress.Close;
    end;
  end;
end;

procedure TFlacBirdForm.GetArtworkByName(AArtist, AAlbum: string; APos,
  ALen: NativeInt);
  procedure ResizeArtwork(W: TWICImage; H: NativeInt);
  var
    B: TBitmap;
  begin
    B := TBitmap.Create;
    try
      with B do
      begin
        PixelFormat := pf32bit;
        Assign(W);
        if Width > Height then
          Stretch(H, Round(Height * H / Width), sfLanczos3, 0, B)
        else
          Stretch(Round(Width * H / Height), H, sfLanczos3, 0, B);
        W.Assign(B);
      end;
    finally
      B.Free;
    end;
  end;

var
  S, T, U: string;
  E: Boolean;
  I: NativeInt;
  M: TMemoryStream;
  J: TJSONArray;
  W: TWICImage;
  X: IXMLLfmType;
begin
  if (AArtist = '') or (AAlbum = '') then
    Exit;
  E := True;
  try
    if FOption.ArtworkSoundsLike then
    begin
      AArtist := Trim(TRegEx.Replace(AArtist, '\(.*?\)|\[.*?\]', ''));
      AAlbum := Trim(TRegEx.Replace(AAlbum, '\(.*?\)|\[.*?\]', ''));
    end;
    S := IdHTTP.Get(Format(SApple, [ParamsEncode(AArtist), ParamsEncode(AAlbum)]));
    T := '';
    U := '';
    if S <> '' then
      with TJSONObject.ParseJSONValue(S) as TJSONObject do
        try
          J := Get('results').JsonValue as TJSONArray;
          if J.Size > 0 then
            with J.Get(0) as TJSONObject do
            begin
              T := Get('artworkUrl100').JsonValue.Value;
              U := Get('collectionViewUrl').JsonValue.Value;
            end;
        finally
          Free;
        end;
    if T <> '' then
    begin
      M := TMemoryStream.Create;
      try
        IdHTTP.Get(StringReplace(T, '100x100-75', '600x600-75', [rfReplaceAll]), M);
        if M.Size > 0 then
        begin
          M.Position := 0;
          for I := 0 to ALen - 1 do
            if InRange(APos + I, 0, FList.Count - 1) then
              with FList[APos + I], Artwork do
              begin
                Checked := True;
                Clear;
                W := TWICImage.Create;
                W.LoadFromStream(M);
                Add(W);
                Caption := Format('<a href="%s">%s</a>', [U, SAppleLink]);
                Position := 0;
                Modified := 1;
              end;
          E := False;
        end;
      finally
        M.Free;
      end;
    end;
  except
    //
  end;
  if E and (FOption.ArtworkUseLastfm) then
    try
      S := '';
      T := '';
      M := TMemoryStream.Create;
      try
        M.Clear;
        IdHTTP.Get(Format(SLastfm, [SLastfmKey, ParamsEncode(AArtist), ParamsEncode(AAlbum)]), M);
        if M.Size > 0 then
        begin
          M.Position := 0;
          XMLDocument.LoadFromStream(M, xetUTF_8);
          XMLDocument.Active := True;
          X := Getlfm(XMLDocument);
          with X.Album.Image do
            if Count > 0 then
            begin
              S := Items[Count - 1].Text;
              T := X.Album.Url;
            end;
          XMLDocument.Active := False;
        end;
        if S <> '' then
        begin
          M.Clear;
          IdHTTP.Get(S, M);
          if M.Size > 0 then
          begin
            M.Position := 0;
            for I := 0 to ALen - 1 do
              if InRange(APos + I, 0, FList.Count - 1) then
                with FList[APos + I], Artwork do
                begin
                  Checked := True;
                  Clear;
                  W := TWICImage.Create;
                  W.LoadFromStream(M);
                  ResizeArtwork(W, 600);
                  Add(W);
                  Caption := Format('<a href="%s">%s</a>', [T, SLastfmLink]);
                  Position := 0;
                  Modified := 2;
                end;
            E := False;
          end;
        end;
      finally
        M.Free;
      end;
    except
      //
    end;
  if E then
    for I := 0 to ALen - 1 do
      if InRange(APos + I, 0, FList.Count - 1) then
        with FList[APos + I], Artwork do
          Modified := 0;
  with ListView do
  begin
    Refresh;
    if InRange(APos + ALen - 1, 0, Items.Count - 1) then
      Items[APos + ALen - 1].MakeVisible(True);
  end;
end;

procedure TFlacBirdForm.ClearArtwork(AForce: Boolean);
var
  I, AIdx, APos, ALen, AGrp: NativeInt;
begin
  if FList.Count = 0 then
    Exit;
  if AForce then
    AIdx := 0
  else
    with ListView do
    begin
      if SelCount = 0 then
        Exit;
      AIdx := ItemIndex;
      if InRange(ItemIndex, 0, FList.Count - 1) then
      begin
        AGrp := FList[ItemIndex].Group;
        for I := ItemIndex - 1 downto 0 do
        begin
          if FList[I].Group <> AGrp then
            Break;
          AGrp := FList[I].Group;
          Dec(AIdx);
        end;
      end;
    end;
  if InRange(AIdx, 0, FList.Count - 1) then
  begin
    AGrp := FList[AIdx].Group;
    APos := AIdx;
    ALen := 0;
    for I := AIdx to FList.Count - 1 do
    begin
      if AForce and (FList[I].Modified = 1) then
        Continue;
      if FList[I].Group <> AGrp then
      begin
        ClearArtworkSub(APos, ALen);
        APos := I;
        ALen := 0;
        if not AForce then
          Exit;
      end;
      AGrp := FList[I].Group;
      Inc(ALen);
    end;
    ClearArtworkSub(APos, ALen);
  end;
end;

procedure TFlacBirdForm.ClearArtworkSub(APos, ALen: NativeInt);
var
  I: NativeInt;
begin
  for I := 0 to ALen - 1 do
    if InRange(APos + I, 0, FList.Count - 1) then
      with FList[APos + I], Artwork do
        Clear;
  with ListView do
  begin
    Refresh;
    if InRange(APos + ALen - 1, 0, Items.Count - 1) then
      Items[APos + ALen - 1].MakeVisible(True);
  end;
end;

procedure TFlacBirdForm.ExecuteOrganizeFolder(AList: TTrackList);
var
  S, AName, APath: string;
  I, P: NativeInt;
begin
  if not DirectoryExists2(FOutputDir) then
    Exit;
  FOutputDir := IncludeTrailingPathDelimiter(FOutputDir);
  for I := 0 to AList.Count - 1 do
    with AList[I] do
    begin
      FProgress.Progress(SOrganizeFolder, Format('%s: %s', [SProgress, ExtractFileName(Location)]), Trunc((I + 1) / AList.Count * 1000));
      S := FFormat;
      S := StringReplace(S, '%name%', Name, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%artist%', Artist, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%albumartist%', AlbumArtist, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%album%', Album, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%genre%', Genre, [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%tracknumber%', Format('%.2d', [StrToIntDef(Copy(TrackNumber, 1, Pos('/', TrackNumber) - 1), 0)]), [rfReplaceAll, rfIgnoreCase]);
      S := StringReplace(S, '%year%', Year, [rfReplaceAll, rfIgnoreCase]);
      S := Format('%s%s', [S, LowerCase(ExtractFileExt(Location))]);
      P := Pos('%', S);
      if P > 0 then
        S := Copy(S, 1, P - 1);
      if S = '' then
        S := SUnknown;
      AName := IncludeTrailingPathDelimiter(FOutputDir) + GetValidFileName(S);
      APath := ExtractFilePath(AName);
      try
        SysUtils.ForceDirectories(APath);
        if DirectoryExists2(APath) then
        begin
          if not RenameFile(Location, AName) then
          begin
            AName := GetUniqueFileName(AName);
            RenameFile(Location, AName);
          end;
        end;
      except
        //
      end;
    end;
  RemoveEmptyDir(FOutputDir);
end;

procedure TFlacBirdForm.UpdateActn;
begin
  if FItem = nil then
  begin
    EditPrevAction.Enabled := False;
    EditNextAction.Enabled := False;
  end
  else
    with FItem, Artwork do
    begin
      EditPrevAction.Enabled := Position > 0;
      EditNextAction.Enabled := Position < Count - 1;
    end;
end;

procedure TFlacBirdForm.UpdateEdit;
begin
  with ListView do
  begin
    if InRange(ItemIndex, 0, FList.Count - 1) then
    begin
      FItem := FList[ItemIndex];
      with FItem do
      begin
        if Pos('\\', ExpandUNCFileName(Location)) = 0 then
        begin
          if not FileExists2(Location) then
            Exit;
          LoadData(FItem);
        end;
        NameEdit.Text := Name;
        ArtistEdit.Text := Artist;
        AlbumArtistEdit.Text := AlbumArtist;
        AlbumEdit.Text := Album;
        GenreEdit.Text := Genre;
        TrackNumberEdit.Text := TrackNumber;
        YearEdit.Text := Year;
        with Artwork do
        begin
          if Count > 0 then
          begin
            Artwork.Position := 0;
            ArtworkImage.Picture.Bitmap.Assign(Artwork[Position]);
            ArtworkLinkLabel.Caption := Caption;
            with ArtworkLinkLabel do
              Visible := Caption <> '';
          end
          else
          begin
            ArtworkImage.Picture := nil;
            with ArtworkLinkLabel do
            begin
              Caption := '';
              Visible := False;
            end;
          end;
          EditPrevAction.Visible := Count > 1;
          EditNextAction.Visible := Count > 1;
        end;
        StatusBar.SimpleText := Location;
      end;
    end
    else
    begin
      FItem := nil;
      StatusBar.SimpleText := '';
      NameEdit.Text := '';
      ArtistEdit.Text := '';
      AlbumArtistEdit.Text := '';
      AlbumEdit.Text := '';
      GenreEdit.Text := '';
      TrackNumberEdit.Text := '';
      YearEdit.Text := '';
      ArtworkImage.Picture := nil;
      ArtworkLinkLabel.Visible := False;
      EditPrevAction.Visible := False;
      EditNextAction.Visible := False;
    end;
    UpdateActn;
  end;
end;

procedure TFlacBirdForm.UpdateFont;
var
  LF: TLogFont;
begin
  GetObject(Font.Handle, SizeOf(TLogFont), @LF);
  LF.lfQuality := NONANTIALIASED_QUALITY;
  Font.Handle := CreateFontIndirect(LF);
end;

end.
