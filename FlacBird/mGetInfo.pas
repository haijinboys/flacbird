unit mGetInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ActnList;

resourcestring
  SCaption = '%s のプロパティ';

type
  TGetInfoForm = class(TForm)
    ActionList: TActionList;
    ListView: TListView;
    OKButton: TButton;
    EditCopyAction: TAction;
    EditSelectAllAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditCopyActionUpdate(Sender: TObject);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure EditSelectAllActionUpdate(Sender: TObject);
  private
    { Private 宣言 }
    procedure LoadFromFile(const AFileName: string);
  protected
    { Protected 宣言 }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public 宣言 }
  end;

function GetInfo(AOwner: TComponent; const AFileName: string): Boolean;

var
  GetInfoForm: TGetInfoForm;

implementation

uses
  Clipbrd, APEv2Library, FlacTagLibrary, ID3v1Library, ID3v2Library,
  MP4TagLibrary, OggVorbisAndOpusTagLibrary, WMATagLibrary, WAVTagLibrary,
  CUESheetFunctions, mMain, mCommon;

{$R *.dfm}


function GetInfo(AOwner: TComponent; const AFileName: string): Boolean;
begin
  with TGetInfoForm.Create(AOwner) do
    try
      LoadFromFile(AFileName);
      Result := ShowModal = mrOk;
    finally
      Release;
    end;
end;

procedure TGetInfoForm.FormCreate(Sender: TObject);
begin
  Font.Assign(FlacBirdForm.Font);
end;

procedure TGetInfoForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TGetInfoForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TGetInfoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TGetInfoForm.EditCopyActionExecute(Sender: TObject);
var
  Item: TListItem;
begin
  with TStringList.Create do
    try
      Item := ListView.Selected;
      while Item <> nil do
      begin
        with Item do
          Add(Format('%s'#09'%s', [Caption, SubItems[0]]));
        Item := ListView.GetNextItem(Item, sdAll, [isSelected]);
      end;
      if Text <> '' then
        Clipboard.AsText := Text;
    finally
      Free;
    end;
end;

procedure TGetInfoForm.EditCopyActionUpdate(Sender: TObject);
begin
  EditCopyAction.Enabled := ListView.SelCount > 0;
end;

procedure TGetInfoForm.EditSelectAllActionExecute(Sender: TObject);
begin
  ListView.SelectAll;
end;

procedure TGetInfoForm.EditSelectAllActionUpdate(Sender: TObject);
begin
  //
end;

procedure TGetInfoForm.LoadFromFile(const AFileName: string);
  function SecToCUETime(ASec: NativeUInt): string;
  var
    H, M, S, MS: string;
    SS: Int64;
  begin
    SS := ASec div 1000;
    H := IntToStr(SS div 3600);
    M := IntToStr(((SS - (StrToInt(H) * 3600)) div 60));
    S := IntToStr(SS - (StrToInt(H) * 3600 + StrToInt(M) * 60));
    if Length(S) = 1
    then
      S := '0' + S;
    MS := IntToStr(ASec - NativeUInt((StrToInt(H) * 3600 + StrToInt(M) * 60) + StrToInt(S)) * 1000);
    MS := IntToStr(Round(StrToInt(MS) / 13.333));
    case Length(MS) of
      1:
        MS := '0' + MS;
    end;
    MS := Copy(MS, 1, 2);
    M := IntToStr(StrToInt(M) + (StrToInt(H) * 60));
    if Length(M) = 1
    then
      M := '0' + M;
    Result := M + ':' + S + ':' + MS;
  end;

var
  S: string;
  I, P, Q, R: NativeInt;
  AData: TCUETrackIndexData;
begin
  if not FileExists2(AFileName) then
    Exit;
  Caption := Format(SCaption, [ExtractFileName(AFileName)]);
  if LowerCase(ExtractFileExt(AFileName)) = '.cue' then
  begin
    with TCUESheet.Create do
      try
        REMLines.NameValueSeparator := ' ';
        if Load(AFileName) then
        begin
          with ListView, Groups.Add do
          begin
            Header := 'CUE';
            for I := 0 to REMLines.Count - 1 do
              with Items.Add do
              begin
                Caption := REMLines.Names[I];
                SubItems.Add(REMLines.ValueFromIndex[I]);
                GroupID := ID;
              end;
            if AlbumTitle <> '' then
              with Items.Add do
              begin
                Caption := STR_TITLE;
                SubItems.Add(AlbumTitle);
                GroupID := ID;
              end;
            if Performer <> '' then
              with Items.Add do
              begin
                Caption := STR_PERFORMER;
                SubItems.Add(Performer);
                GroupID := ID;
              end;
            if SongWriter <> '' then
              with Items.Add do
              begin
                Caption := STR_SONGWRITER;
                SubItems.Add(SongWriter);
                GroupID := ID;
              end;
            if Catalog <> '' then
              with Items.Add do
              begin
                Caption := STR_CATALOG;
                SubItems.Add(Catalog);
                GroupID := ID;
              end;
            if CDTextFile <> '' then
              with Items.Add do
              begin
                Caption := STR_CDTEXTFILE;
                SubItems.Add(CDTextFile);
                GroupID := ID;
              end;
          end;
          for I := 0 to GetSectionCount - 1 do
            for P := 0 to GetTrackCount(I) - 1 do
            begin
              with ListView, Groups.Add do
              begin
                S := IntToStr(Sections[I].Tracks[P].TrackNumber);
                if Length(S) = 1 then
                  S := '0' + S;
                Header := STR_TRACK + ' ' + S;
                GetIndexData(I, P, 0, AData);
                if AData.Title <> '' then
                  with Items.Add do
                  begin
                    Caption := STR_TITLE;
                    SubItems.Add(AData.Title);
                    GroupID := ID;
                  end;
                if AData.Perfomer <> '' then
                  with Items.Add do
                  begin
                    Caption := STR_PERFORMER;
                    SubItems.Add(AData.Perfomer);
                    GroupID := ID;
                  end;
                if AData.SongWriter <> '' then
                  with Items.Add do
                  begin
                    Caption := STR_SONGWRITER;
                    SubItems.Add(AData.SongWriter);
                    GroupID := ID;
                  end;
                if AData.ISRC <> '' then
                  with Items.Add do
                  begin
                    Caption := STR_ISRC;
                    SubItems.Add(AData.ISRC);
                    GroupID := ID;
                  end;
                if AData.Flags <> '' then
                  with Items.Add do
                  begin
                    Caption := STR_FLAGS;
                    SubItems.Add(AData.Flags);
                    GroupID := ID;
                  end;
                if AData.PreGap > 0 then
                  with Items.Add do
                  begin
                    Caption := STR_PREGAP;
                    SubItems.Add(IntToStr(AData.PreGap));
                    GroupID := ID;
                  end;
                for Q := 0 to GetIndexCount(I, P) - 1 do
                  for R := 0 to GetIndexIndexCount(I, P, Q) - 1 do
                    with Items.Add do
                    begin
                      Caption := STR_INDEX + ' ' + Sections[I].Tracks[P].Indexes[Q].IDs[R];
                      SubItems.Add(SecToCUETime(StrToInt(Sections[I].Tracks[P].Indexes[Q].Indexes[R])));
                      GroupID := ID;
                    end;
                if AData.PostGap > 0 then
                  with Items.Add do
                  begin
                    Caption := STR_POSTGAP;
                    SubItems.Add(IntToStr(AData.PostGap));
                    GroupID := ID;
                  end;
              end;
            end;
        end;
      finally
        Free;
      end;
  end
  else
  begin
    P := ID3V2LIBRARY_ERROR;
    try
      with TAPEv2Tag.Create do
        try
          if LoadFromFile(AFileName) = APEV2LIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'APEv2';
              for I := 0 to Count - 1 do
                if Frames[I].Format = APEv2Library.ffText then
                  with Items.Add do
                  begin
                    Caption := Frames[I].Name;
                    SubItems.Add(Frames[I].GetAsText);
                    GroupID := ID;
                  end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      with TFlacTag.Create do
        try
          if LoadFromFile(AFileName) = FLACTAGLIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'FLAC';
              for I := 0 to Count - 1 do
                if Tags[I].Format = FlacTagLibrary.vcfText then
                  with Items.Add do
                  begin
                    Caption := Tags[I].Name;
                    SubItems.Add(Tags[I].GetAsText);
                    GroupID := ID;
                  end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      with TID3v1Tag.Create do
        try
          if LoadFromFile(AFileName) = ID3V1LIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'ID3v1';
              if Title <> '' then
                with Items.Add do
                begin
                  Caption := 'Title';
                  SubItems.Add(Title);
                  GroupID := ID;
                end;
              if Artist <> '' then
                with Items.Add do
                begin
                  Caption := 'Artist';
                  SubItems.Add(Artist);
                  GroupID := ID;
                end;
              if Album <> '' then
                with Items.Add do
                begin
                  Caption := 'Album';
                  SubItems.Add(Album);
                  GroupID := ID;
                end;
              if Year <> '' then
                with Items.Add do
                begin
                  Caption := 'Year';
                  SubItems.Add(Year);
                  GroupID := ID;
                end;
              if Comment <> '' then
                with Items.Add do
                begin
                  Caption := 'Comment';
                  SubItems.Add(Comment);
                  GroupID := ID;
                end;
              if TrackString <> '' then
                with Items.Add do
                begin
                  Caption := 'Track';
                  SubItems.Add(TrackString);
                  GroupID := ID;
                end;
              if Genre <> '' then
                with Items.Add do
                begin
                  Caption := 'Genre';
                  SubItems.Add(Genre);
                  GroupID := ID;
                end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      with TID3v2Tag.Create do
        try
          P := LoadFromFile(AFileName);
          if P = ID3V2LIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'ID3v2';
              for I := 0 to FrameCount - 1 do
                with Items.Add do
                begin
                  Caption := ConvertFrameID2String(Frames[I].ID);
                  SubItems.Add(GetUnicodeText(I));
                  GroupID := ID;
                end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      with TMP4Tag.Create do
        try
          if LoadFromFile(AFileName) = MP4TAGLIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'MP4';
              for I := 0 to Count - 1 do
                with Items.Add do
                begin
                  Caption := AtomNameToString(Atoms[I].ID);
                  SubItems.Add(Atoms[I].GetAsText);
                  GroupID := ID;
                end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      with TOpusTag.Create do
        try
          if LoadFromFile(AFileName) = OPUSTAGLIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'OGG';
              for I := 0 to Count - 1 do
                if Frames[I].Format = OggVorbisAndOpusTagLibrary.otffText then
                  with Items.Add do
                  begin
                    Caption := Frames[I].Name;
                    SubItems.Add(Frames[I].GetAsText);
                    GroupID := ID;
                  end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      with TWAVTag.Create do
        try
          if LoadFromFile(AFileName) = WAVTAGLIBRARY_SUCCESS then
            with ListView, Groups.Add do
            begin
              Header := 'WAV';
              for I := 0 to Count - 1 do
                if Frames[I].Format = WAVTagLibrary.ffText then
                  with Items.Add do
                  begin
                    Caption := Frames[I].Name;
                    SubItems.Add(Frames[I].GetAsText);
                    GroupID := ID;
                  end;
            end;
        finally
          Free;
        end;
    except
      //
    end;
    try
      if P <> ID3V2LIBRARY_SUCCESS then
        with TWMATag.Create do
          try
            if LoadFromFile(AFileName) = WMATAGLIBRARY_SUCCESS then
              with ListView, Groups.Add do
              begin
                Header := 'WMA';
                for I := 0 to Count - 1 do
                  with Items.Add do
                  begin
                    Caption := Frames[I].Name;
                    SubItems.Add(Frames[I].GetAsText);
                    GroupID := ID;
                  end;
              end;
          finally
            Free;
          end;
    except
      //
    end;
  end;
end;

procedure TGetInfoForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

end.
