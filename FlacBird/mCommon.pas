unit mCommon;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ActiveX, ShlObj, IniFiles, IdGlobal, IdUriUtils, mProgress;

type
  TArtworkList = class;

  TArtworkListEnumerator = class
  private
    { Private 宣言 }
    FIndex: Integer;
    FArtworkList: TArtworkList;
  public
    { Public 宣言 }
    constructor Create(AArtworkList: TArtworkList);
    function GetCurrent: TWICImage;
    function MoveNext: Boolean;
    property Current: TWICImage read GetCurrent;
  end;

  TArtworkList = class(TList)
  private
    { Private 宣言 }
    FCaption: string;
    FPosition: NativeInt;
    FModified: NativeInt;
    function Get(Index: Integer): TWICImage; inline;
  public
    { Public 宣言 }
    constructor Create;
    destructor Destroy; override;
    procedure Clear; override;
    procedure Delete(Index: Integer);
    function GetEnumerator: TArtworkListEnumerator;
    function IndexOf(Item: TWICImage): NativeInt;
    property Items[Index: Integer]: TWICImage read Get; default;
    property Caption: string read FCaption write FCaption;
    property Position: NativeInt read FPosition write FPosition;
    property Modified: NativeInt read FModified write FModified;
  end;

  TTrackItem = class(TPersistent)
  private
    { Private 宣言 }
    FLocation: string;
    FKind: string;
    FTrack: NativeInt;
    FFrame: NativeInt;
    FToc: string;
    FChecked: Boolean;
    FModified: NativeInt;
    FGroup: NativeInt;
    FName: string;
    FArtist: string;
    FAlbumArtist: string;
    FAlbum: string;
    FGenre: string;
    FTrackNumber: string;
    FYear: string;
    FArtwork: TArtworkList;
  public
    { Public 宣言 }
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Location: string read FLocation write FLocation;
    property Kind: string read FKind write FKind;
    property Track: NativeInt read FTrack write FTrack;
    property Frame: NativeInt read FFrame write FFrame;
    property Toc: string read FToc write FToc;
    property Checked: Boolean read FChecked write FChecked;
    property Modified: NativeInt read FModified write FModified;
    property Group: NativeInt read FGroup write FGroup;
    property Name: string read FName write FName;
    property Artist: string read FArtist write FArtist;
    property AlbumArtist: string read FAlbumArtist write FAlbumArtist;
    property Album: string read FAlbum write FAlbum;
    property Genre: string read FGenre write FGenre;
    property TrackNumber: string read FTrackNumber write FTrackNumber;
    property Year: string read FYear write FYear;
    property Artwork: TArtworkList read FArtwork write FArtwork;
  end;

  TTrackList = class;

  TTrackListEnumerator = class
  private
    { Private 宣言 }
    FIndex: Integer;
    FTrackList: TTrackList;
  public
    { Public 宣言 }
    constructor Create(ATrackList: TTrackList);
    function GetCurrent: TTrackItem;
    function MoveNext: Boolean;
    property Current: TTrackItem read GetCurrent;
  end;

  TTrackList = class(TList)
  private
    { Private 宣言 }
    function Get(Index: Integer): TTrackItem; inline;
  public
    { Public 宣言 }
    destructor Destroy; override;
    procedure Clear; override;
    procedure Delete(Index: Integer);
    function Find(const ALocation: string): TTrackItem;
    function GetEnumerator: TTrackListEnumerator;
    function IndexOf(Item: TTrackItem): NativeInt;
    procedure Sort;
    procedure Update;
    property Items[Index: Integer]: TTrackItem read Get; default;
  end;

  TAlbumItem = class(TPersistent)
  private
    { Private 宣言 }
    FName: string;
    FArtist: string;
    FID: string;
  public
    { Public 宣言 }
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    property Name: string read FName write FName;
    property Artist: string read FArtist write FArtist;
    property ID: string read FID write FID;
  end;

  TAlbumList = class;

  TAlbumListEnumerator = class
  private
    { Private 宣言 }
    FIndex: Integer;
    FAlbumList: TAlbumList;
  public
    { Public 宣言 }
    constructor Create(AAlbumList: TAlbumList);
    function GetCurrent: TAlbumItem;
    function MoveNext: Boolean;
    property Current: TAlbumItem read GetCurrent;
  end;

  TAlbumList = class(TList)
  private
    { Private 宣言 }
    function Get(Index: Integer): TAlbumItem; inline;
  public
    { Public 宣言 }
    destructor Destroy; override;
    procedure Clear; override;
    procedure Delete(Index: Integer);
    function GetEnumerator: TAlbumListEnumerator;
    function IndexOf(Item: TAlbumItem): NativeInt;
    property Items[Index: Integer]: TAlbumItem read Get; default;
  end;

function FileExists2(const FileName: string): Boolean;
function DirectoryExists2(const Directory: string): Boolean;
function GetFileNameFromLink(const FileName: string): string;
function GetUniqueFileName(const FileName: string): string;
function GetValidFileName(const FileName: string): string;
function ShortToLongFileName(const FileName: string): string;
function RemoveEmptyDir(const Path: string): Boolean;
function GetAppDataPath: string;
function GetPersonalPath: string;
function GetIniFileName(var FileName: string): Boolean;
function GetIcon(IconSize: NativeInt): HICON;
function GetFileVersion: string;
function ParamsEncode(const ASrc: string): string;
function IsDebuggerPresent: BOOL; stdcall;

var
  FFontName: string;
  FFontSize: NativeInt;
  FIniFailed: Boolean;
  FExts: TStringList;
  FMediaInfo: THandle;
  FProgress: TProgressForm;

var
  DebuggerPresent: Boolean;

implementation

uses
  Math, IOUtils, mConsts, mPreference;

// -----------------------------------------------------------------------------
// ドライブ確認

function IsDriveReady(C: Char): Boolean;
var
  W: Word;
  SR: TSearchRec;
begin
  if C = '\' then
  begin
    Result := True;
    Exit;
  end;
  C := CharUpper(PChar(string(C)))^;
  W := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Result := DiskSize(Ord(C) - $40) <> -1;
    if Result and (GetDriveType(PChar(string(C + ':\'))) in [DRIVE_REMOTE, DRIVE_CDROM]) then
      try
        Result := FindFirst(C + ':\*.*', $3F, SR) = 0;
      finally
        FindClose(SR);
      end;
  finally
    SetErrorMode(W);
  end;
end;

// -----------------------------------------------------------------------------
// ファイル存在確認

function FileExists2(const FileName: string): Boolean;
begin
  if Length(FileName) = 0 then
    Result := False
  else
  begin
    if (ExpandFileName(FileName)[1] = '\') or
      IsDriveReady(ExpandFileName(FileName)[1]) then
      Result := FileExists(FileName)
    else
      Result := False;
  end;
end;

// -----------------------------------------------------------------------------
// ディレクトリ存在確認

function DirectoryExists2(const Directory: string): Boolean;
begin
  if Length(Directory) = 0 then
    Result := False
  else
  begin
    if (ExpandFileName(Directory)[1] = '\') or
      IsDriveReady(ExpandFileName(Directory)[1]) then
      Result := DirectoryExists(Directory)
    else
      Result := False;
  end;
end;

// -----------------------------------------------------------------------------
// リンクからファイル名取得

function GetFileNameFromLink(const FileName: string): string;
const
  IID_IPersistFile: TGUID = '{0000010B-0000-0000-C000-000000000046}';
var
  LResult: HRESULT;
  LSHellLink: IShellLink;
  LPersistFile: IPersistFile;
  LFindData: TWin32FindData;
begin
  Result := FileName;
  LResult := CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
    IID_IShellLinkW, LShellLink);
  if LResult = S_OK then
    if Supports(LShellLink, IID_IPersistFile, LPersistFile) then
    begin
      LResult := LPersistFile.Load(PChar(Result), STGM_READ);
      if LResult = S_OK then
      begin
        LResult := LShellLink.Resolve(0, SLR_ANY_MATCH);
        if LResult = S_OK then
        begin
          SetLength(Result, MAX_PATH);
          LResult := LSHellLink.GetPath(PChar(Result), MAX_PATH, LFindData, SLGP_UNCPRIORITY);
          if LResult = S_OK then
            Result := Trim(Result);
        end;
      end;
    end;
end;

// -----------------------------------------------------------------------------
// ユニークファイル名取得

function GetUniqueFileName(const FileName: string): string;
var
  I: NativeInt;
  Path, Name, Ext: string;
begin
  if not FileExists2(FileName) then
  begin
    Result := FileName;
    Exit;
  end;
  I := 1;
  Path := ExtractFilePath(FileName);
  Name := ChangeFileExt(ExtractFileName(FileName), '');
  Ext := ExtractFileExt(FileName);
  while FileExists(Format('%s%s_%d%s', [Path, Name, I, Ext])) do
    Inc(I);
  Result := Format('%s%s_%d%s', [Path, Name, I, Ext]);
end;

// -----------------------------------------------------------------------------
// 検証済みファイル名取得

function GetValidFileName(const FileName: string): string;
var
  Path, Name, S1, S2: String;
  I: NativeInt;
begin
  Path := ExtractFilePath(FileName);
  SetLength(S1, Length(Path));
  for I := 1 to Length(Path) do
  begin
    if (Path[I] = ':') or (Path[I] = '/') then
      S1[I] := '_'
    else if TPath.IsValidPathChar(Path[I]) then
      S1[I] := Path[I]
    else
      S1[I] := '_';
  end;
  Name := ExtractFileName(FileName);
  SetLength(S2, Length(Name));
  for I := 1 to Length(Name) do
  begin
    if TPath.IsValidFileNameChar(Name[I]) then
      S2[I] := Name[I]
    else
      S2[I] := '_';
  end;
  Result := S1 + S2;
end;

// -----------------------------------------------------------------------------
// 短いファイル名から長いファイル名に変換

function ShortToLongFileName(const FileName: string): string;
var
  Len: NativeInt;
  function GetLongNameOf(const Path: string): string;
  var
    SR: TSearchRec;
  begin
    if Length(Path) = Len then
    begin
      if Len = 3 then
        Result := CharUpper(PChar(Path))
      else
        Result := Path;
    end
    else
    begin
      if FindFirst(Path, faAnyFile, SR) = 0 then
        Result := IncludeTrailingPathDelimiter(GetLongNameOf(ExtractFileDir(Path))) + SR.Name
      else
      begin
        if (Length(Path) >= 2) and (Path[1] = '\') and (Path[2] = '\') then
          Result := Path
        else
          Result := '';
      end;
      FindClose(SR);
    end;
  end;

begin
  Result := '';
  if FileExists(FileName) then
  begin
    Len := Length(ExtractFileDrive(FileName));
    if Len = 2 then
      Len := 3;
    Result := GetLongNameOf(ExpandFileName(FileName));
    if not FileExists(Result) then
      Result := FileName;
  end;
end;

// -----------------------------------------------------------------------------
// 空ディレクトリ削除

function RemoveEmptyDir(const Path: string): Boolean;
var
  I: NativeInt;
  SL: TStringList;
  SR: TSearchRec;
begin
  Result := True;
  if Path = '' then
    Exit;
  SL := nil;
  try
    SL := TStringList.Create;
    if FindFirst(IncludeTrailingPathDelimiter(Path) + '*.*', faAnyFile, SR) = 0 then
    begin
      try
        repeat
          if (SR.Name = '.') or (SR.Name = '..') then
            Continue;
          if (SR.Attr and faDirectory) <> 0 then
            SL.Add(IncludeTrailingPathDelimiter(Path) + SR.Name)
          else
            Result := False;
        until (FindNext(SR) <> 0);
      finally
        FindClose(SR);
      end;
    end;
    for I := 0 to SL.Count - 1 do
    begin
      if RemoveEmptyDir(SL.Strings[I]) = True then
      begin
        if RemoveDir(SL.Strings[I]) = False then
          RaiseLastOSError;
      end
      else
        Result := False;
    end;
  finally
    SL.Free;
  end;
end;

// -----------------------------------------------------------------------------
// アプリケーションデータパス取得

function GetAppDataPath: string;
var
  S: array [0 .. MAX_PATH] of Char;
begin
  SetLastError(ERROR_SUCCESS);
  if SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @S) = S_OK then
    Result := IncludeTrailingPathDelimiter(S);
end;

// -----------------------------------------------------------------------------
// パーソナルパス取得

function GetPersonalPath: string;
var
  S: array [0 .. MAX_PATH] of Char;
begin
  SetLastError(ERROR_SUCCESS);
  if SHGetFolderPath(0, CSIDL_PERSONAL, 0, 0, @S) = S_OK then
    Result := IncludeTrailingPathDelimiter(S);
end;

// -----------------------------------------------------------------------------
// INIファイル名取得

function GetIniFileName(var FileName: string): Boolean;
begin
  Result := False;
  if not FileExists2(ParamStr(0)) then
    Exit;
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if not FileExists2(FileName) then
  begin
    FileName := GetAppDataPath + SName + '\' + ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini');
    ForceDirectories(ExtractFileDir(FileName));
  end;
  if FileName <> '' then
    Result := True;
end;

// -----------------------------------------------------------------------------
// アイコン取得

function GetIcon(IconSize: NativeInt): HICON;
begin
  Result := LoadImage(HInstance, 'MAINICON', IMAGE_ICON, IconSize, IconSize, LR_SHARED);
end;

// -----------------------------------------------------------------------------
// ファイルバージョン取得

function GetFileVersion: string;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf, P: Pointer;
  VerSize: DWORD;
begin
  Result := '';
  FileName := ParamStr(0);
  UniqueString(FileName);
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\StringFileInfo\041103A4\FileVersion', P, VerSize) then
          Result := PChar(P);
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

// -----------------------------------------------------------------------------
// パラメータエンコード

function ParamsEncode(const ASrc: string): string;
const
  UnsafeChars: TIdUnicodeString = '*<>#%"{}|\^[]`&=';
var
  I, J, Len: Integer;
  Buf: TIdBytes;
  LChar: WideChar;
  AByteEncoding: TIdTextEncoding;
begin
  Result := '';
  Buf := nil;
  if ASrc = '' then
  begin
    Exit;
  end;
  AByteEncoding := nil;
  EnsureEncoding(AByteEncoding, encUTF8);
  I := 0;
  while I < Length(ASrc) do
  begin
    LChar := ASrc[I + 1];
    if WideCharIsInSet(UnsafeChars, LChar) or (Ord(LChar) < 33) or (Ord(LChar) > 128) then
    begin
      Len := CalcUTF16CharLength(ASrc, I + 1);
      Buf := AByteEncoding.GetBytes(Copy(ASrc, I + 1, Len));
      for J := 0 to Length(Buf) - 1 do
      begin
        Result := Result + '%' + IntToHex(Ord(Buf[J]), 2);
      end;
      Inc(I, Len);
    end
    else
    begin
      Result := Result + Char(LChar);
      Inc(I);
    end;
  end;
end;

// -----------------------------------------------------------------------------
// デバッガ存在確認

function IsDebuggerPresent; external kernel32 name 'IsDebuggerPresent';

{ TArtworkListEnumerator }

constructor TArtworkListEnumerator.Create(AArtworkList: TArtworkList);
begin
  inherited Create;
  FIndex := -1;
  FArtworkList := AArtworkList;
end;

function TArtworkListEnumerator.GetCurrent: TWICImage;
begin
  Result := FArtworkList[FIndex];
end;

function TArtworkListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FArtworkList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TArtworkList }

constructor TArtworkList.Create;
begin
  FCaption := '';
  FPosition := -1;
  FModified := -1;
end;

destructor TArtworkList.Destroy;
begin
  Clear;
  inherited;
end;

procedure TArtworkList.Clear;
var
  I: NativeInt;
begin
  FCaption := '';
  FPosition := -1;
  FModified := -1;
  for I := 0 to Count - 1 do
    Items[I].Free;
  inherited;
end;

procedure TArtworkList.Delete(Index: Integer);
begin
  Items[Index].Free;
  inherited Delete(Index);
end;

function TArtworkList.Get(Index: Integer): TWICImage;
begin
  Result := TWICImage( inherited Items[Index]);
end;

function TArtworkList.GetEnumerator: TArtworkListEnumerator;
begin
  Result := TArtworkListEnumerator.Create(Self);
end;

function TArtworkList.IndexOf(Item: TWICImage): NativeInt;
begin
  for Result := 0 to Count - 1 do
    if Items[Result] = Item then
      Exit;
  Result := -1;
end;

{ TTrackItem }

constructor TTrackItem.Create;
begin
  FLocation := '';
  FKind := '';
  FTrack := 0;
  FFrame := 0;
  FToc := '';
  FChecked := False;
  FModified := -1;
  FGroup := -1;
  FName := '';
  FArtist := '';
  FAlbumArtist := '';
  FAlbum := '';
  FGenre := '';
  FTrackNumber := '';
  FYear := '';
  FArtwork := TArtworkList.Create;
end;

destructor TTrackItem.Destroy;
begin
  if Assigned(FArtwork) then
    FreeAndNil(FArtwork);
  inherited;
end;

procedure TTrackItem.Assign(Source: TPersistent);
begin
  if Source is TTrackItem then
    with TTrackItem(Source) do
    begin
      Self.FLocation := Location;
      Self.FKind := Kind;
      Self.FTrack := Track;
      Self.FFrame := Frame;
      Self.Toc := Toc;
      Self.FChecked := Checked;
      Self.FModified := Modified;
      Self.FGroup := Group;
      Self.FName := Name;
      Self.FArtist := Artist;
      Self.FAlbumArtist := AlbumArtist;
      Self.FAlbum := Album;
      Self.FGenre := Genre;
      Self.FTrackNumber := TrackNumber;
      Self.FYear := Year;
    end
  else
    inherited;
end;

{ TTrackListEnumerator }

constructor TTrackListEnumerator.Create(ATrackList: TTrackList);
begin
  inherited Create;
  FIndex := -1;
  FTrackList := ATrackList;
end;

function TTrackListEnumerator.GetCurrent: TTrackItem;
begin
  Result := FTrackList[FIndex];
end;

function TTrackListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTrackList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTrackList }

destructor TTrackList.Destroy;
begin
  Clear;
  inherited;
end;

procedure TTrackList.Clear;
var
  I: NativeInt;
begin
  for I := 0 to Count - 1 do
    Items[I].Free;
  inherited;
end;

procedure TTrackList.Delete(Index: Integer);
begin
  Items[Index].Free;
  inherited Delete(Index);
end;

function TTrackList.Find(const ALocation: string): TTrackItem;
var
  I: NativeInt;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if (Items[I].Location <> '') and (AnsiCompareFileName(ALocation, Items[I].Location) = 0) then
    begin
      Result := Items[I];
      Break;
    end;
end;

function TTrackList.Get(Index: Integer): TTrackItem;
begin
  Result := TTrackItem( inherited Items[Index]);
end;

function TTrackList.GetEnumerator: TTrackListEnumerator;
begin
  Result := TTrackListEnumerator.Create(Self);
end;

function TTrackList.IndexOf(Item: TTrackItem): NativeInt;
begin
  for Result := 0 to Count - 1 do
    if Items[Result] = Item then
      Exit;
  Result := -1;
end;

procedure TTrackList.Sort;
begin
  SortList( function(Item1, Item2: Pointer): Integer
  begin
    if (TTrackItem(Item1).Kind = 'CUE') and (TTrackItem(Item2).Kind = 'CUE') then begin
    Result := CompareText(TTrackItem(Item1).Location, TTrackItem(Item2).Location);
    if Result = 0 then
    Result := TTrackItem(Item1).Track - TTrackItem(Item2).Track;
  end
  else begin
    Result := CompareText(ExtractFilePath(TTrackItem(Item1).Location), ExtractFilePath(TTrackItem(Item2).Location));
    if (Result = 0) and FOption.GeneralSortByTrack then
    Result := TTrackItem(Item1).Track - TTrackItem(Item2).Track;
    if Result = 0 then
    Result := CompareText(TTrackItem(Item1).Location, TTrackItem(Item2).Location);
  end;
  end);
  Update;
end;

procedure TTrackList.Update;
  procedure SetToc(const AToc: string; APos, ALen: NativeInt);
  var
    I: NativeInt;
  begin
    for I := APos to APos + ALen - 1 do
      if InRange(I, 0, Count - 1) then
        with Items[I] do
        begin
          Toc := AToc;
          Group := APos;
        end;
  end;

var
  S, T, APath, AKind, AToc: string;
  I, APos, ALen: NativeInt;
  AFrame: Int64;
begin
  if Count > 0 then
  begin
    S := Items[0].Location;
    T := Items[0].Kind;
    AToc := '';
    APos := 0;
    ALen := 0;
    AFrame := 150;
    for I := 0 to Count - 1 do
    begin
      APath := Items[I].Location;
      AKind := Items[I].Kind;
      if (AKind <> T) or
        ((AKind = 'CUE') and (APath <> S)) or
        (ExtractFilePath(APath) <> ExtractFilePath(S)) then
      begin
        AToc := AToc + IntToStr(AFrame);
        SetToc(AToc, APos, ALen);
        AToc := '';
        APos := I;
        ALen := 0;
        AFrame := 150;
      end;
      AToc := AToc + IntToStr(AFrame) + ' ';
      Inc(AFrame, Items[I].Frame + IfThen(Items[I].Kind = 'CUE', 0, FOption.GeneralPregap));
      S := APath;
      T := AKind;
      Inc(ALen);
    end;
    AToc := AToc + IntToStr(AFrame);
    SetToc(AToc, APos, ALen);
  end;
end;

{ TAlbumItem }

constructor TAlbumItem.Create;
begin
  FName := '';
  FArtist := '';
  FID := '';
end;

procedure TAlbumItem.Assign(Source: TPersistent);
begin
  if Source is TAlbumItem then
    with TAlbumItem(Source) do
    begin
      Self.FName := Name;
      Self.FArtist := Artist;
      Self.FID := ID;
    end
  else
    inherited;
end;

{ TAlbumListEnumerator }

constructor TAlbumListEnumerator.Create(AAlbumList: TAlbumList);
begin
  inherited Create;
  FIndex := -1;
  FAlbumList := AAlbumList;
end;

function TAlbumListEnumerator.GetCurrent: TAlbumItem;
begin
  Result := FAlbumList[FIndex];
end;

function TAlbumListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FAlbumList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TAlbumList }

destructor TAlbumList.Destroy;
begin
  Clear;
  inherited;
end;

procedure TAlbumList.Clear;
var
  I: NativeInt;
begin
  for I := 0 to Count - 1 do
    Items[I].Free;
  inherited;
end;

procedure TAlbumList.Delete(Index: Integer);
begin
  Items[Index].Free;
  inherited Delete(Index);
end;

function TAlbumList.Get(Index: Integer): TAlbumItem;
begin
  Result := TAlbumItem( inherited Items[Index]);
end;

function TAlbumList.GetEnumerator: TAlbumListEnumerator;
begin
  Result := TAlbumListEnumerator.Create(Self);
end;

function TAlbumList.IndexOf(Item: TAlbumItem): NativeInt;
begin
  for Result := 0 to Count - 1 do
    if Items[Result] = Item then
      Exit;
  Result := -1;
end;

end.
